EESchema Schematic File Version 2
LIBS:sonde xilinx_schlib
LIBS:power
LIBS:sonde xilinx-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "PARALLEL CABLE III"
Date "Sun 22 Mar 2015"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R11
U 1 1 4D527316
P 6650 2600
F 0 "R11" V 6730 2600 50  0000 C CNN
F 1 "100" V 6650 2600 50  0000 C CNN
F 2 "Discret:R4" H 6650 2600 60  0001 C CNN
F 3 "" H 6650 2600 60  0001 C CNN
	1    6650 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 4200 7350 4200
Wire Wire Line
	7350 4200 7350 3050
Connection ~ 6300 4200
Wire Wire Line
	6300 4250 6300 4200
Wire Wire Line
	5900 4200 6400 4200
$Comp
L GND #PWR01
U 1 1 3EBF81B1
P 6300 4700
F 0 "#PWR01" H 6300 4700 40  0001 C CNN
F 1 "GND" H 6300 4630 40  0001 C CNN
F 2 "" H 6300 4700 60  0001 C CNN
F 3 "" H 6300 4700 60  0001 C CNN
	1    6300 4700
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 3EBF81A7
P 6300 4450
F 0 "C4" H 6350 4550 50  0000 L CNN
F 1 "100pF" H 6350 4350 50  0000 L CNN
F 2 "Discret:C2" H 6300 4450 60  0001 C CNN
F 3 "" H 6300 4450 60  0001 C CNN
	1    6300 4450
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 4D528082
P 6650 4200
F 0 "R13" V 6730 4200 50  0000 C CNN
F 1 "100" V 6650 4200 50  0000 C CNN
F 2 "Discret:R4" H 6650 4200 60  0001 C CNN
F 3 "" H 6650 4200 60  0001 C CNN
	1    6650 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 4200 4200 4200
Wire Wire Line
	4800 4500 5450 4500
$Comp
L 74LS125 U1
U 4 1 3EBF7DBD
P 5450 4200
F 0 "U1" H 5450 4300 50  0000 L BNN
F 1 "74LS125" H 5500 4051 50  0000 L TNN
F 2 "Sockets_DIP:DIP-14__300_ELL" H 5450 4200 60  0001 C CNN
F 3 "" H 5450 4200 60  0001 C CNN
	4    5450 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2900 4800 4500
Text Label 8100 3800 1    60   ~ 0
TMS-PROG
Wire Wire Line
	10250 4100 8200 4100
Wire Wire Line
	10250 4300 8100 4300
Wire Wire Line
	10250 3900 8300 3900
Wire Wire Line
	10250 3700 8400 3700
Wire Wire Line
	10050 3600 10250 3600
Connection ~ 10200 3600
Connection ~ 10200 4000
Connection ~ 10200 3800
Wire Wire Line
	10200 4000 10250 4000
Wire Wire Line
	10250 3800 10200 3800
Wire Wire Line
	10200 3600 10200 4200
Wire Wire Line
	10200 4200 10250 4200
$Comp
L DB9 J2
U 1 1 3ECDE5C8
P 10700 3900
F 0 "J2" H 10700 4450 70  0000 C CNN
F 1 "DB9MALE" H 10700 3353 70  0000 C CNN
F 2 "Connect:DB9M_CI_INVERT" H 10700 3900 60  0001 C CNN
F 3 "" H 10700 3900 60  0001 C CNN
	1    10700 3900
	1    0    0    1   
$EndComp
Connection ~ 8100 3050
Connection ~ 8200 2950
Connection ~ 8300 2850
Connection ~ 8400 2750
Wire Wire Line
	8100 4300 8100 3050
Wire Wire Line
	8200 4100 8200 2950
Wire Wire Line
	8300 3900 8300 2850
Wire Wire Line
	8400 3700 8400 2750
$Comp
L PWR_FLAG #FLG02
U 1 1 3EBF848F
P 6100 950
F 0 "#FLG02" H 6100 1220 30  0001 C CNN
F 1 "PWR_FLAG" H 6100 1180 30  0000 C CNN
F 2 "" H 6100 950 60  0001 C CNN
F 3 "" H 6100 950 60  0001 C CNN
	1    6100 950 
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 3EBF8479
P 5800 950
F 0 "#PWR03" H 5800 1050 30  0001 C CNN
F 1 "VCC" H 5800 1050 30  0000 C CNN
F 2 "" H 5800 950 60  0001 C CNN
F 3 "" H 5800 950 60  0001 C CNN
	1    5800 950 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 3EBF8458
P 10200 4850
F 0 "#PWR04" H 10200 4850 40  0001 C CNN
F 1 "GND" H 10200 4780 40  0001 C CNN
F 2 "" H 10200 4850 60  0001 C CNN
F 3 "" H 10200 4850 60  0001 C CNN
	1    10200 4850
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG05
U 1 1 3EBF843C
P 10200 4800
F 0 "#FLG05" H 10200 5070 30  0001 C CNN
F 1 "PWR_FLAG" H 10200 5030 30  0000 C CNN
F 2 "" H 10200 4800 60  0001 C CNN
F 3 "" H 10200 4800 60  0001 C CNN
	1    10200 4800
	1    0    0    -1  
$EndComp
NoConn ~ 2200 4000
NoConn ~ 2200 3900
NoConn ~ 2200 3500
NoConn ~ 2200 3300
NoConn ~ 2200 3100
Wire Wire Line
	2500 2750 2500 2700
Wire Wire Line
	2500 2700 2200 2700
$Comp
L GND #PWR06
U 1 1 4D528081
P 2500 2750
F 0 "#PWR06" H 2500 2750 40  0001 C CNN
F 1 "GND" H 2500 2680 40  0001 C CNN
F 2 "" H 2500 2750 60  0001 C CNN
F 3 "" H 2500 2750 60  0001 C CNN
	1    2500 2750
	1    0    0    -1  
$EndComp
NoConn ~ 2200 2900
NoConn ~ 2200 2800
NoConn ~ 2200 2500
NoConn ~ 2200 2400
NoConn ~ 2200 2300
NoConn ~ 2200 2200
NoConn ~ 2200 2100
NoConn ~ 2200 1900
Wire Wire Line
	10250 3500 9400 3500
Text Label 9450 3500 0    60   ~ 0
PWR_3,3-5V
$Comp
L GND #PWR07
U 1 1 4D52808A
P 10050 3600
F 0 "#PWR07" H 10050 3600 40  0001 C CNN
F 1 "GND" H 10050 3530 40  0001 C CNN
F 2 "" H 10050 3600 60  0001 C CNN
F 3 "" H 10050 3600 60  0001 C CNN
	1    10050 3600
	0    1    1    0   
$EndComp
Text Label 7550 3050 0    60   ~ 0
TMS-PROG
Text Label 7550 2950 0    60   ~ 0
TCK-CCLK
Text Label 7550 2850 0    60   ~ 0
TDI-DIN
Text Label 7550 2750 0    60   ~ 0
TD0-DONE
Text Label 7700 2550 0    60   ~ 0
PWR_3,3-5V
$Comp
L GND #PWR08
U 1 1 3EBF8376
P 8450 2650
F 0 "#PWR08" H 8450 2650 40  0001 C CNN
F 1 "GND" H 8450 2580 40  0001 C CNN
F 2 "" H 8450 2650 60  0001 C CNN
F 3 "" H 8450 2650 60  0001 C CNN
	1    8450 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 3050 8500 3050
Wire Wire Line
	7250 2950 8500 2950
Wire Wire Line
	7250 2950 7250 3300
Wire Wire Line
	7250 3300 6900 3300
Wire Wire Line
	7250 2850 8500 2850
Wire Wire Line
	7250 2850 7250 2600
Wire Wire Line
	7250 2600 6900 2600
Wire Wire Line
	7450 2750 8500 2750
Wire Wire Line
	7450 2750 7450 1900
Wire Wire Line
	7450 1900 6900 1900
Wire Wire Line
	8500 2550 7650 2550
Wire Wire Line
	7650 2550 7650 1000
Wire Wire Line
	7300 1000 9400 1000
$Comp
L CONN_6 P1
U 1 1 3EBF830C
P 8850 2800
F 0 "P1" V 8800 2800 60  0000 C CNN
F 1 "CONN_6" V 8900 2800 60  0000 C CNN
F 2 "Connect:bornier6" H 8850 2800 60  0001 C CNN
F 3 "" H 8850 2800 60  0001 C CNN
	1    8850 2800
	1    0    0    -1  
$EndComp
Connection ~ 6500 1000
Wire Wire Line
	6500 1000 6500 1050
$Comp
L GND #PWR09
U 1 1 3EBF82CF
P 6500 1500
F 0 "#PWR09" H 6500 1500 40  0001 C CNN
F 1 "GND" H 6500 1430 40  0001 C CNN
F 2 "" H 6500 1500 60  0001 C CNN
F 3 "" H 6500 1500 60  0001 C CNN
	1    6500 1500
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 3EBF82C6
P 6500 1250
F 0 "C1" H 6550 1350 50  0000 L CNN
F 1 "1uF" H 6550 1151 50  0000 L CNN
F 2 "Discret:CP5" H 6500 1250 60  0001 C CNN
F 3 "" H 6500 1250 60  0001 C CNN
	1    6500 1250
	1    0    0    -1  
$EndComp
Connection ~ 6300 3300
Connection ~ 6300 2600
Connection ~ 6300 1900
Wire Wire Line
	6300 1900 6300 1950
Wire Wire Line
	6300 2650 6300 2600
Wire Wire Line
	6300 3350 6300 3300
Wire Wire Line
	5900 3300 6400 3300
Wire Wire Line
	5900 2600 6400 2600
Wire Wire Line
	5850 1900 6400 1900
$Comp
L GND #PWR010
U 1 1 4D528089
P 6300 3800
F 0 "#PWR010" H 6300 3800 40  0001 C CNN
F 1 "GND" H 6300 3730 40  0001 C CNN
F 2 "" H 6300 3800 60  0001 C CNN
F 3 "" H 6300 3800 60  0001 C CNN
	1    6300 3800
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 4D528086
P 6300 3550
F 0 "C5" H 6350 3650 50  0000 L CNN
F 1 "100pF" H 6350 3450 50  0000 L CNN
F 2 "Discret:C2" H 6300 3550 60  0001 C CNN
F 3 "" H 6300 3550 60  0001 C CNN
	1    6300 3550
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 4D528083
P 6650 3300
F 0 "R12" V 6730 3300 50  0000 C CNN
F 1 "100" V 6650 3300 50  0000 C CNN
F 2 "Discret:R4" H 6650 3300 60  0001 C CNN
F 3 "" H 6650 3300 60  0001 C CNN
	1    6650 3300
	0    1    1    0   
$EndComp
$Comp
L GND #PWR011
U 1 1 4D528088
P 6300 3100
F 0 "#PWR011" H 6300 3100 40  0001 C CNN
F 1 "GND" H 6300 3030 40  0001 C CNN
F 2 "" H 6300 3100 60  0001 C CNN
F 3 "" H 6300 3100 60  0001 C CNN
	1    6300 3100
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 4D528085
P 6300 2850
F 0 "C2" H 6350 2950 50  0000 L CNN
F 1 "100pF" H 6350 2750 50  0000 L CNN
F 2 "Discret:C2" H 6300 2850 60  0001 C CNN
F 3 "" H 6300 2850 60  0001 C CNN
	1    6300 2850
	1    0    0    -1  
$EndComp
Connection ~ 5900 1000
Connection ~ 6200 1000
Wire Wire Line
	4300 1000 4200 1000
Wire Wire Line
	2300 1000 2300 3700
Wire Wire Line
	4700 1000 6900 1000
Wire Wire Line
	5900 1000 5900 1050
Wire Wire Line
	6200 1000 6200 1050
$Comp
L GND #PWR012
U 1 1 3EBF81B3
P 6200 1600
F 0 "#PWR012" H 6200 1600 40  0001 C CNN
F 1 "GND" H 6200 1530 40  0001 C CNN
F 2 "" H 6200 1600 60  0001 C CNN
F 3 "" H 6200 1600 60  0001 C CNN
	1    6200 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 4D528087
P 6300 2400
F 0 "#PWR013" H 6300 2400 40  0001 C CNN
F 1 "GND" H 6300 2330 40  0001 C CNN
F 2 "" H 6300 2400 60  0001 C CNN
F 3 "" H 6300 2400 60  0001 C CNN
	1    6300 2400
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 4D528084
P 6300 2150
F 0 "C3" H 6350 2250 50  0000 L CNN
F 1 "100pF" H 6350 2050 50  0000 L CNN
F 2 "Discret:C2" H 6300 2150 60  0001 C CNN
F 3 "" H 6300 2150 60  0001 C CNN
	1    6300 2150
	1    0    0    -1  
$EndComp
$Comp
L R R14
U 1 1 3EBF819B
P 6650 1900
F 0 "R14" V 6730 1900 50  0000 C CNN
F 1 "100" V 6650 1900 50  0000 C CNN
F 2 "Discret:R4" H 6650 1900 60  0001 C CNN
F 3 "" H 6650 1900 60  0001 C CNN
	1    6650 1900
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 3EBF818E
P 6200 1300
F 0 "R5" H 6050 1500 50  0000 C CNN
F 1 "1K" V 6200 1300 50  0000 C CNN
F 2 "Discret:R4" H 6200 1300 60  0001 C CNN
F 3 "" H 6200 1300 60  0001 C CNN
	1    6200 1300
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 3EBF8187
P 5900 1300
F 0 "R2" H 5750 1500 50  0000 C CNN
F 1 "5,1K" V 5900 1300 50  0000 C CNN
F 2 "Discret:R4" H 5900 1300 60  0001 C CNN
F 3 "" H 5900 1300 60  0001 C CNN
	1    5900 1300
	1    0    0    -1  
$EndComp
$Comp
L DIODESCH D2
U 1 1 3EBF8176
P 7100 1000
F 0 "D2" H 7100 1100 50  0000 C CNN
F 1 "BAT46" H 7100 900 50  0000 C CNN
F 2 "Discret:D3" H 7100 1000 60  0001 C CNN
F 3 "" H 7100 1000 60  0001 C CNN
	1    7100 1000
	-1   0    0    -1  
$EndComp
$Comp
L DIODESCH D1
U 1 1 3EBF815E
P 4500 1000
F 0 "D1" H 4500 1100 50  0000 C CNN
F 1 "BAT46" H 4500 900 50  0000 C CNN
F 2 "Discret:D3" H 4500 1000 60  0001 C CNN
F 3 "" H 4500 1000 60  0001 C CNN
	1    4500 1000
	-1   0    0    -1  
$EndComp
Connection ~ 2350 2000
Wire Wire Line
	2350 1800 2350 2600
Wire Wire Line
	2350 2600 2200 2600
Wire Wire Line
	2200 2000 2350 2000
Wire Wire Line
	2350 1800 2200 1800
Wire Wire Line
	2500 1750 2500 1700
Wire Wire Line
	2500 1700 2200 1700
$Comp
L GND #PWR014
U 1 1 3EBF8100
P 2500 1750
F 0 "#PWR014" H 2500 1750 40  0001 C CNN
F 1 "GND" H 2500 1680 40  0001 C CNN
F 2 "" H 2500 1750 60  0001 C CNN
F 3 "" H 2500 1750 60  0001 C CNN
	1    2500 1750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 3EBF80DD
P 4650 2000
F 0 "#PWR015" H 4650 2000 40  0001 C CNN
F 1 "GND" H 4650 1930 40  0001 C CNN
F 2 "" H 4650 2000 60  0001 C CNN
F 3 "" H 4650 2000 60  0001 C CNN
	1    4650 2000
	1    0    0    -1  
$EndComp
Connection ~ 4800 3600
Connection ~ 4800 2900
Text Label 2600 1000 0    60   ~ 0
VCC_SENSE-ERROR*
Text Label 2400 3800 0    60   ~ 0
TDI-DIN-D0
Text Label 2400 3600 0    60   ~ 0
CLK-D1
Text Label 2400 3400 0    60   ~ 0
TMS-PROG-D2
Text Label 2400 3200 0    60   ~ 0
CTRL-D3
Text Label 2400 3000 0    60   ~ 0
TD0-PROG-D4
Wire Wire Line
	2300 1000 3700 1000
Wire Wire Line
	2300 3700 2200 3700
Wire Wire Line
	3700 4200 3600 4200
Wire Wire Line
	3600 4200 3600 3400
Wire Wire Line
	3600 3400 2200 3400
Wire Wire Line
	2200 3600 3400 3600
Wire Wire Line
	3400 3600 3400 3300
Wire Wire Line
	3400 3300 3700 3300
Wire Wire Line
	2200 3200 3400 3200
Wire Wire Line
	3400 3200 3400 2900
Wire Wire Line
	3400 2900 3700 2900
Wire Wire Line
	2200 3800 3300 3800
Wire Wire Line
	3300 3800 3300 2600
Wire Wire Line
	3300 2600 3700 2600
Wire Wire Line
	2200 3000 3200 3000
Wire Wire Line
	3200 3000 3200 2250
Wire Wire Line
	3200 2250 3700 2250
Text Label 2600 1600 0    60   ~ 0
DONE-SELECT*
NoConn ~ 2150 6900
NoConn ~ 2150 6250
NoConn ~ 2150 5600
Connection ~ 1150 7200
Connection ~ 1150 6900
Connection ~ 1150 6550
Connection ~ 1150 5900
Wire Wire Line
	1700 5900 1150 5900
Wire Wire Line
	1150 6550 1700 6550
Wire Wire Line
	1150 7200 1700 7200
$Comp
L GND #PWR016
U 1 1 3EBF7F0D
P 1150 7300
F 0 "#PWR016" H 1150 7300 40  0001 C CNN
F 1 "GND" H 1150 7230 40  0001 C CNN
F 2 "" H 1150 7300 60  0001 C CNN
F 3 "" H 1150 7300 60  0001 C CNN
	1    1150 7300
	1    0    0    -1  
$EndComp
Connection ~ 1150 6250
Wire Wire Line
	1150 6250 1250 6250
Wire Wire Line
	1150 6900 1250 6900
Wire Wire Line
	1150 5600 1150 7300
Wire Wire Line
	1150 5600 1250 5600
$Comp
L 74LS125 U2
U 4 1 3EBF7EEC
P 1700 5600
F 0 "U2" H 1700 5700 50  0000 L BNN
F 1 "74LS125" H 1750 5450 40  0000 L TNN
F 2 "Sockets_DIP:DIP-14__300_ELL" H 1700 5600 60  0001 C CNN
F 3 "" H 1700 5600 60  0001 C CNN
	4    1700 5600
	1    0    0    -1  
$EndComp
$Comp
L 74LS125 U2
U 3 1 3EBF7EDF
P 1700 6250
F 0 "U2" H 1700 6350 50  0000 L BNN
F 1 "74LS125" H 1750 6100 40  0000 L TNN
F 2 "Sockets_DIP:DIP-14__300_ELL" H 1700 6250 60  0001 C CNN
F 3 "" H 1700 6250 60  0001 C CNN
	3    1700 6250
	1    0    0    -1  
$EndComp
$Comp
L 74LS125 U2
U 2 1 3EBF7EDD
P 1700 6900
F 0 "U2" H 1700 7000 50  0000 L BNN
F 1 "74LS125" H 1750 6750 40  0000 L TNN
F 2 "Sockets_DIP:DIP-14__300_ELL" H 1700 6900 60  0001 C CNN
F 3 "" H 1700 6900 60  0001 C CNN
	2    1700 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3600 4800 3600
Wire Wire Line
	4200 2900 5450 2900
Wire Wire Line
	5000 3300 4200 3300
Wire Wire Line
	5000 2600 4200 2600
Wire Wire Line
	4200 2250 5400 2250
Wire Wire Line
	5400 2250 5400 2200
Wire Wire Line
	4650 2000 4650 1900
$Comp
L 74LS125 U1
U 3 1 3EBF7DB3
P 5450 3300
F 0 "U1" H 5450 3400 50  0000 L BNN
F 1 "74LS125" H 5500 3151 50  0000 L TNN
F 2 "Sockets_DIP:DIP-14__300_ELL" H 5450 3300 60  0001 C CNN
F 3 "" H 5450 3300 60  0001 C CNN
	3    5450 3300
	1    0    0    -1  
$EndComp
$Comp
L 74LS125 U1
U 2 1 3EBF7DAD
P 5450 2600
F 0 "U1" H 5450 2700 50  0000 L BNN
F 1 "74LS125" H 5500 2451 50  0000 L TNN
F 2 "Sockets_DIP:DIP-14__300_ELL" H 5450 2600 60  0001 C CNN
F 3 "" H 5450 2600 60  0001 C CNN
	2    5450 2600
	1    0    0    -1  
$EndComp
$Comp
L 74LS125 U1
U 1 1 3EBF7D9F
P 5400 1900
F 0 "U1" H 5400 2000 50  0000 L BNN
F 1 "74LS125" H 5450 1750 50  0000 L TNN
F 2 "Sockets_DIP:DIP-14__300_ELL" H 5400 1900 60  0001 C CNN
F 3 "" H 5400 1900 60  0001 C CNN
	1    5400 1900
	1    0    0    -1  
$EndComp
$Comp
L 74LS125 U2
U 1 1 3EBF7D92
P 4650 1600
F 0 "U2" H 4650 1700 50  0000 L BNN
F 1 "74LS125" H 4700 1450 50  0000 L TNN
F 2 "Sockets_DIP:DIP-14__300_ELL" H 4650 1600 60  0001 C CNN
F 3 "" H 4650 1600 60  0001 C CNN
	1    4650 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2200 1600 3700 1600
$Comp
L R R9
U 1 1 3EBF7D33
P 3950 4200
F 0 "R9" V 4030 4200 50  0000 C CNN
F 1 "100" V 3950 4200 50  0000 C CNN
F 2 "Discret:R4" H 3950 4200 60  0001 C CNN
F 3 "" H 3950 4200 60  0001 C CNN
	1    3950 4200
	0    1    1    0   
$EndComp
$Comp
L R R10
U 1 1 3EBF7D31
P 3950 3300
F 0 "R10" V 4030 3300 50  0000 C CNN
F 1 "100" V 3950 3300 50  0000 C CNN
F 2 "Discret:R4" H 3950 3300 60  0001 C CNN
F 3 "" H 3950 3300 60  0001 C CNN
	1    3950 3300
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 4D528080
P 3950 2900
F 0 "R8" V 4030 2900 50  0000 C CNN
F 1 "100" V 3950 2900 50  0000 C CNN
F 2 "Discret:R4" H 3950 2900 60  0001 C CNN
F 3 "" H 3950 2900 60  0001 C CNN
	1    3950 2900
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 4D52807F
P 3950 2600
F 0 "R7" V 4030 2600 50  0000 C CNN
F 1 "100" V 3950 2600 50  0000 C CNN
F 2 "Discret:R4" H 3950 2600 60  0001 C CNN
F 3 "" H 3950 2600 60  0001 C CNN
	1    3950 2600
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 3EBF7D26
P 3950 2250
F 0 "R6" V 4030 2250 50  0000 C CNN
F 1 "100" V 3950 2250 50  0000 C CNN
F 2 "Discret:R4" H 3950 2250 60  0001 C CNN
F 3 "" H 3950 2250 60  0001 C CNN
	1    3950 2250
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 3EBF7D22
P 3950 1600
F 0 "R4" V 4030 1600 50  0000 C CNN
F 1 "47" V 3950 1600 50  0000 C CNN
F 2 "Discret:R4" H 3950 1600 60  0001 C CNN
F 3 "" H 3950 1600 60  0001 C CNN
	1    3950 1600
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 3EBF7D16
P 3950 1000
F 0 "R1" V 4030 1000 50  0000 C CNN
F 1 "100" V 3950 1000 50  0000 C CNN
F 2 "Discret:R4" H 3950 1000 60  0001 C CNN
F 3 "" H 3950 1000 60  0001 C CNN
	1    3950 1000
	0    1    1    0   
$EndComp
$Comp
L DB25 J1
U 1 1 3EBF7D04
P 1750 2800
F 0 "J1" H 1800 4150 70  0000 C CNN
F 1 "DB25MALE" H 1700 1450 70  0000 C CNN
F 2 "Connect:DB25M_CI" H 1750 2800 60  0001 C CNN
F 3 "" H 1750 2800 60  0001 C CNN
	1    1750 2800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9400 1000 9400 3500
Connection ~ 7650 1000
$Comp
L GND #PWR017
U 1 1 5510FC05
P 4950 2000
F 0 "#PWR017" H 4950 2000 30  0001 C CNN
F 1 "GND" H 4950 1930 30  0001 C CNN
F 2 "" H 4950 2000 60  0000 C CNN
F 3 "" H 4950 2000 60  0000 C CNN
	1    4950 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1900 4950 2000
Wire Wire Line
	5100 1600 5900 1600
Wire Wire Line
	5900 1550 5900 1900
Connection ~ 5900 1900
Connection ~ 5900 1600
Wire Wire Line
	10200 4850 10200 4800
Wire Wire Line
	6300 4650 6300 4700
Wire Wire Line
	6300 3750 6300 3800
Wire Wire Line
	6300 3100 6300 3050
Wire Wire Line
	6300 2400 6300 2350
Wire Wire Line
	6200 1600 6200 1550
Wire Wire Line
	6500 1500 6500 1450
Wire Wire Line
	6100 950  6100 1000
Connection ~ 6100 1000
Wire Wire Line
	5800 1000 5800 950 
Connection ~ 5800 1000
Wire Wire Line
	8450 2650 8500 2650
$EndSCHEMATC
