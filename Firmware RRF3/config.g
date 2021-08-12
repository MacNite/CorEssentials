; Configuration file for Duet 3 Mini 5+ (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.2.3 on Wed Jun 02 2021 13:51:01 GMT+0200 (Mitteleuropäische Sommerzeit)

; General preferences
G90                                                   ; send absolute coordinates...
M83                                                   ; ...but relative extruder moves
M550 P"CorEssentials MK0.1"                           ; set printer name
M669 K1                                               ; select CoreXY mode

; Network
M552 S1                                               ; enable network
M586 P0 S1                                            ; enable HTTP
M586 P1 S0                                            ; disable FTP
M586 P2 S0                                            ; disable Telnet
; Drives
M569 P0.0 S0                                          ; physical drive 0.0 goes backwards
M569 P0.1 S0                                          ; physical drive 0.1 goes backwards
M569 P0.2 S1                                          ; physical drive 0.2 goes forwards
M569 P0.3 S1                                          ; physical drive 0.3 goes forwards
M569 P0.4 S0                                          ; physical drive 0.4 goes backwards
M584 X0.0 Y0.1 Z0.2:0.3 E0.4                          ; set drive mapping
M350 X16 Y16 Z16 E16 I1                               ; configure microstepping with interpolation
M92 X80 Y80 Z2133.333333333333 E703          		  ; set steps per mm
M566 X1800 Y1800 Z60 E120                             ; set maximum instantaneous speed changes (mm/min)
M203 X60000 Y60000 Z300 E1200                         ; set maximum speeds (mm/min)
M201 X5000 Y5000 Z500 E1000                           ; set accelerations (mm/s^2)
M906 X1200 Y1200 Z1000 E700 I30                       ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                               ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                      ; set axis minima
M208 X310 Y310 Z310 S0                                ; set axis maxima
M671 X-33.5:377 Y155:155 S2                           ; position of leadscrews, maximum correction S=2mm

; Endstops
M574 X2 S3                                            ; configure sensorless endstop on X
M574 Y2 S3                                            ; configure sensorless endstop on Y
M574 Z1 S2                                            ; configure z-probe endstop for low end on Z

; Sensorless Homing Limits
M915 X Y S8 F0 H200 R0                                ; S: Stall detection threshold; recommended values -10 to +63 / F: Filter Mode: 0 = unfiltered, every full step

; Z-Probe
M558 P5 C"^io3.in" H5 F120 T18000                     ; set Z probe type to switch and the dive height + speeds
G31 P500 X-24 Y59 Z1.8                              ; set Z probe trigger value, offset and trigger height
M557 X30:270 Y60:270 P5                               ; define mesh grid, P: 5 points in x- and y-direction

; Heaters & Sensors
M308 S0 P"temp0" Y"thermistor" T100000 B4092          ; configure sensor 0 as thermistor on pin temp1
M950 H0 C"out0" T0                                    ; create bed heater output on out1 and map it to sensor 0
M307 H0 B0 S1.00                                      ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                               ; map heated bed to heater 0
M143 H0 S115                                          ; set temperature limit for heater 0 to 115C
M308 S1 P"temp1" Y"thermistor" T100000 B4725 C7.06e-8 ; configure sensor 1 as thermistor on pin temp0
M950 H1 C"out1" T1                                    ; create nozzle heater output on out0 and map it to sensor 1
M307 H1 B0 S1.00                                      ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S315                                          ; set temperature limit for heater 1 to 315C
M308 S2 P"temp2" Y"thermistor" T100000 B4725 C7.06e-8 A"Chamber" ; configure sensor 2 as thermistor on pin temp2

; Fans
M950 F0 C"out3" Q500                                  ; create fan 0 on pin out3 and set its frequency
M106 P0 C"Coldend" S1 H1 T45                          ; set fan 0 name and value. Thermostatic control is turned on
M950 F1 C"out4" Q500                                  ; create fan 1 on pin out4 and set its frequency
M106 P1 C"Part" S0 H-1                                ; set fan 1 name and value. Thermostatic control is turned off
M950 F2 C"out2" Q500                                  ; create fan 2 on pin out5 and set its frequency
M106 P2 C"Chamber" S0 H2 T45                          ; set fan 2 name and value. Thermostatic control is turned off

; Filament Runout Sensor
M591 D0 P1 C"io2.in" S1

; Tools
M563 P0 S"Dragon" D0 H1 F0:1                          ; define tool 0
G10 P0 X0 Y0 Z0                                       ; set tool 0 axis offsets
G10 P0 R0 S0                                          ; set initial tool 0 active and standby temperatures to 0C

; Pressure advance
;M572 D0 S0.03                                        ; Direct Drive: S0.025 - Short Bowden (200mm): S0.1

; Custom settings are not defined

; Miscellaneous
M575 P1 S1 B57600                                     ; enable support for PanelDue
M501                                                  ; load saved parameters from non-volatile memory
T0                                                    ; select first tool

; LED
M150 X1 Q3000000                                      ; set LED type to NeoPixel and set SPI frequency to 3MHz
M150 R255 U255 B255 P255 S21						  ; turn all LED on White
global LED_state=true								  ; set variable for LED on