; homeall.g
; called to home all axes

	;	 homex
M569 P0.0 V50    ; make sure x-drive stays in stealthChop Mode
G91               ; relative positioning
G1 H2 Z5 F1800   ; lift Z relative to current position

;stealthChop calibration
G1 H1 X0.5 F1000  ; move 2 micro steps away from endstop
G4 P200           ; wait 100ms
G1 H1 X5 F1000    ; move 5mm away from homing direction
G4 P200           ; wait 100ms
M400              ; wait for all moves to finish
M913 X50          ; set current of x-stepper to 50%
;Homing move
G1 H1 X315 F6000 	; move quickly to X axis endstop and stop there (first pass)
G1 X-5 F18000      	; go back a few mm
G1 H1 X315 F6000 	; move slowly to X axis endstop once more (second pass)
G90               	; absolute positioning
; set standard settings
M913 X100         ; set current of x-stepper to 100%
M569 P0.0 V2000   ; stealthChop Mode only for slow moves


	; 	homey
M569 P0.1 V50    ; make sure y-drive stays in stealthChop Mode
G91               ; relative positioning
;stealthChop calibration
G1 H1 Y-0.5 F1000 ; move 2 micro steps away from endstop
G4 P200           ; wait 100ms
G1 H1 Y-5 F1000   ; move 5mm away from homing direction
G4 P200           ; wait 100ms
M400              ; wait for all moves to finish
M913 Y50          ; set current of y-stepper to 50%
;Homing move
G1 H1 Y315 F6000 ; move quickly to X axis endstop and stop there (first pass)
G1 Y-5 F18000      ; go back a few mm
G1 H1 Y315 F6000 ; move slowly to X axis endstop once more (second pass)
G90               ; absolute positioning
; set standard settings
M913 Y100         ; set current of x-stepper to 100%
M569 P0.1 V2000   ; stealthChop Mode only for slow moves

	; 	home z

G1 X155 Y155 F12000 ; move to center of bed
M558 F6000    
G30
M558 F120
G30
G1 Z5 F600