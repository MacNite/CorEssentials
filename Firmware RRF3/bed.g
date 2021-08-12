; bed.g
; called to perform automatic bed compensation via G32
;
M561 ; clear any bed transform

M671 X-33.5:377 Y155:155 S10                          ; position of leadscrews, maximum correction S=2mm

G30 P0 X20 Y155 Z-99999                               ; probe near left leadscrew
G30 P1 X280 Y155 Z-99999 S2                           ; probe near right leadscrew and calculate

;G29  ; probe the bed and enable compensation


