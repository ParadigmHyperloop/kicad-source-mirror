/*
 * This program source code file is part of KiCad, a free EDA CAD application.
 *
 * Copyright (C) 2014-2015 CERN
 * @author Maciej Suminski <maciej.suminski@cern.ch>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, you may find one here:
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 * or you may search the http://www.gnu.org website for the version 2 license,
 * or you may write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
 */

#include "module_editor_tools.h"
#include "kicad_clipboard.h"
#include "selection_tool.h"
#include "pcb_actions.h"
#include <tool/tool_manager.h>

#include <class_draw_panel_gal.h>
#include <view/view_controls.h>
#include <view/view_group.h>
#include <pcb_painter.h>
#include <origin_viewitem.h>

#include <kicad_plugin.h>
#include <pcbnew_id.h>
#include <collectors.h>
#include <confirm.h>
#include <dialogs/dialog_enum_pads.h>
#include <hotkeys.h>
#include <bitmaps.h>

#include <wxPcbStruct.h>
#include <class_board.h>
#include <class_module.h>
#include <class_edge_mod.h>
#include <board_commit.h>

#include <tools/tool_event_utils.h>

#include <functional>
using namespace std::placeholders;
#include <wx/defs.h>

// Module editor tools
TOOL_ACTION PCB_ACTIONS::placePad( "pcbnew.ModuleEditor.placePad",
        AS_GLOBAL, 0,
        _( "Add Pad" ), _( "Add a pad" ), NULL, AF_ACTIVATE );

TOOL_ACTION PCB_ACTIONS::enumeratePads( "pcbnew.ModuleEditor.enumeratePads",
        AS_GLOBAL, 0,
        _( "Enumerate Pads" ), _( "Enumerate pads" ), pad_enumerate_xpm, AF_ACTIVATE );

TOOL_ACTION PCB_ACTIONS::moduleEdgeOutlines( "pcbnew.ModuleEditor.graphicOutlines",
        AS_GLOBAL, 0,
        "", "" );

TOOL_ACTION PCB_ACTIONS::moduleTextOutlines( "pcbnew.ModuleEditor.textOutlines",
       AS_GLOBAL, 0,
       "", "" );


MODULE_EDITOR_TOOLS::MODULE_EDITOR_TOOLS() :
    PCB_TOOL( "pcbnew.ModuleEditor" )
{
}


MODULE_EDITOR_TOOLS::~MODULE_EDITOR_TOOLS()
{
}


void MODULE_EDITOR_TOOLS::Reset( RESET_REASON aReason )
{
}



int MODULE_EDITOR_TOOLS::PlacePad( const TOOL_EVENT& aEvent )
{
    struct PAD_PLACER : public INTERACTIVE_PLACER_BASE
    {
        std::unique_ptr<BOARD_ITEM> CreateItem() override
        {
            D_PAD* pad = new D_PAD ( m_board->m_Modules );
            m_frame->Import_Pad_Settings( pad, false );     // use the global settings for pad
            pad->IncrementPadName( true, true );
            return std::unique_ptr<BOARD_ITEM>( pad );
        }
    };

    PAD_PLACER placer;

    frame()->SetToolID( ID_MODEDIT_PAD_TOOL, wxCURSOR_PENCIL, _( "Add pads" ) );

    assert( board()->m_Modules );

    doInteractiveItemPlacement( &placer,  _( "Place pad" ), IPO_REPEAT | IPO_SINGLE_CLICK | IPO_ROTATE | IPO_FLIP | IPO_PROPERTIES );

    frame()->SetNoToolSelected();

    return 0;
}


int MODULE_EDITOR_TOOLS::EnumeratePads( const TOOL_EVENT& aEvent )
{
    if( !board()->m_Modules || !board()->m_Modules->PadsList() )
        return 0;

    DIALOG_ENUM_PADS settingsDlg( frame() );

    if( settingsDlg.ShowModal() != wxID_OK )
        return 0;

    Activate();

    GENERAL_COLLECTOR collector;
    const KICAD_T types[] = { PCB_PAD_T, EOT };

    GENERAL_COLLECTORS_GUIDE guide = frame()->GetCollectorsGuide();
    guide.SetIgnoreMTextsMarkedNoShow( true );
    guide.SetIgnoreMTextsOnBack( true );
    guide.SetIgnoreMTextsOnFront( true );
    guide.SetIgnoreModulesVals( true );
    guide.SetIgnoreModulesRefs( true );

    int padNumber = settingsDlg.GetStartNumber();
    wxString padPrefix = settingsDlg.GetPrefix();

    frame()->DisplayToolMsg( _(
                    "Hold left mouse button and move cursor over pads to enumerate them" ) );

    m_toolMgr->RunAction( PCB_ACTIONS::selectionClear, true );
    getViewControls()->ShowCursor( true );
    frame()->GetGalCanvas()->SetCursor( wxCURSOR_HAND );

    KIGFX::VIEW* view = m_toolMgr->GetView();
    VECTOR2I oldCursorPos;  // store the previous mouse cursor position, during mouse drag
    std::list<D_PAD*> selectedPads;
    BOARD_COMMIT commit( frame() );
    std::map<wxString, wxString> oldNames;
    bool isFirstPoint = true;   // used to be sure oldCursorPos will be initialized at least once.

    while( OPT_TOOL_EVENT evt = Wait() )
    {
        if( evt->IsDrag( BUT_LEFT ) || evt->IsClick( BUT_LEFT ) )
        {
            selectedPads.clear();
            VECTOR2I cursorPos = getViewControls()->GetCursorPosition();

            // Be sure the old cursor mouse position was initialized:
            if( isFirstPoint )
            {
                oldCursorPos = cursorPos;
                isFirstPoint = false;
            }

            // wxWidgets deliver mouse move events not frequently enough, resulting in skipping
            // pads if the user moves cursor too fast. To solve it, create a line that approximates
            // the mouse move and search pads that are on the line.
            int distance = ( cursorPos - oldCursorPos ).EuclideanNorm();
            // Search will be made every 0.1 mm:
            int segments = distance / int( 0.1*IU_PER_MM ) + 1;
            const wxPoint line_step( ( cursorPos - oldCursorPos ) / segments );

            collector.Empty();

            for( int j = 0; j < segments; ++j )
            {
                wxPoint testpoint( cursorPos.x - j * line_step.x,
                                   cursorPos.y - j * line_step.y );
                collector.Collect( board(), types, testpoint, guide );

                for( int i = 0; i < collector.GetCount(); ++i )
                {
                    selectedPads.push_back( static_cast<D_PAD*>( collector[i] ) );
                }
            }

            selectedPads.unique();

            for( D_PAD* pad : selectedPads )
            {
                // If pad was not selected, then enumerate it
                if( !pad->IsSelected() )
                {
                    commit.Modify( pad );

                    // Rename pad and store the old name
                    wxString newName = wxString::Format( wxT( "%s%d" ), padPrefix.c_str(), padNumber++ );
                    oldNames[newName] = pad->GetName();
                    pad->SetName( newName );
                    pad->SetSelected();
                    getView()->Update( pad );
                }

                // ..or restore the old name if it was enumerated and clicked again
                else if( pad->IsSelected() && evt->IsClick( BUT_LEFT ) )
                {
                    auto it = oldNames.find( pad->GetName() );
                    wxASSERT( it != oldNames.end() );

                    if( it != oldNames.end() )
                    {
                        pad->SetName( it->second );
                        oldNames.erase( it );
                    }

                    pad->ClearSelected();
                    getView()->Update( pad );
                }
            }
        }

        else if( ( evt->IsKeyPressed() && evt->KeyCode() == WXK_RETURN ) ||
                   evt->IsDblClick( BUT_LEFT ) )
        {
            commit.Push( _( "Enumerate pads" ) );
            break;
        }

        else if( evt->IsCancel() || evt->IsActivate() )
        {
            commit.Revert();
            break;
        }

        // Prepare the next loop by updating the old cursor mouse position
        // to this last mouse cursor position
        oldCursorPos = getViewControls()->GetCursorPosition();
    }

    for( auto p : board()->m_Modules->Pads() )
    {
        p->ClearSelected();
        view->Update( p );
    }

    frame()->DisplayToolMsg( wxEmptyString );
    frame()->GetGalCanvas()->SetCursor( wxCURSOR_ARROW );

    return 0;
}


int MODULE_EDITOR_TOOLS::ModuleTextOutlines( const TOOL_EVENT& aEvent )
{
    KIGFX::VIEW* view = getView();
    KIGFX::PCB_RENDER_SETTINGS* settings =
            static_cast<KIGFX::PCB_RENDER_SETTINGS*>( view->GetPainter()->GetSettings() );

    const LAYER_NUM layers[] = { LAYER_MOD_TEXT_BK,
                                 LAYER_MOD_TEXT_FR,
                                 LAYER_MOD_TEXT_INVISIBLE,
                                 LAYER_MOD_REFERENCES,
                                 LAYER_MOD_VALUES };

    bool enable = !settings->GetSketchMode( layers[0] );

    for( LAYER_NUM layer : layers )
        settings->SetSketchMode( layer, enable );

    for( auto module : board()->Modules() )
    {
        for( auto item : module->GraphicalItems() )
        {
            if( item->Type() == PCB_MODULE_TEXT_T )
                view->Update( item, KIGFX::GEOMETRY );
        }

        view->Update( &module->Reference(), KIGFX::GEOMETRY );
        view->Update( &module->Value(), KIGFX::GEOMETRY );
    }

    frame()->GetGalCanvas()->Refresh();

    return 0;
}


int MODULE_EDITOR_TOOLS::ModuleEdgeOutlines( const TOOL_EVENT& aEvent )
{
    KIGFX::VIEW* view = getView();
    KIGFX::PCB_RENDER_SETTINGS* settings =
            static_cast<KIGFX::PCB_RENDER_SETTINGS*>( view->GetPainter()->GetSettings() );

    const PCB_LAYER_ID layers[] = { F_Adhes, B_Adhes, F_Paste, B_Paste,
            F_SilkS, B_SilkS, F_Mask, B_Mask,
            Dwgs_User, Cmts_User, Eco1_User, Eco2_User, Edge_Cuts };

    bool enable = !settings->GetSketchMode( layers[0] );

    for( LAYER_NUM layer : layers )
        settings->SetSketchMode( layer, enable );

    for( auto module : board()->Modules() )
    {
        for( auto item : module->GraphicalItems() )
        {
            if( item->Type() == PCB_MODULE_EDGE_T )
                view->Update( item, KIGFX::GEOMETRY );
        }
    }

    frame()->GetGalCanvas()->Refresh();

    return 0;
}


void MODULE_EDITOR_TOOLS::setTransitions()
{
    Go( &MODULE_EDITOR_TOOLS::PlacePad,            PCB_ACTIONS::placePad.MakeEvent() );
    Go( &MODULE_EDITOR_TOOLS::EnumeratePads,       PCB_ACTIONS::enumeratePads.MakeEvent() );
    Go( &MODULE_EDITOR_TOOLS::ModuleTextOutlines,  PCB_ACTIONS::moduleTextOutlines.MakeEvent() );
    Go( &MODULE_EDITOR_TOOLS::ModuleEdgeOutlines,  PCB_ACTIONS::moduleEdgeOutlines.MakeEvent() );
}
