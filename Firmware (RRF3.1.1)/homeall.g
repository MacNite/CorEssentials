; homeall.g
; called to home all axes

G91              ; relative positioning

; home x
G1 H2 Z4 F12000  ; lift Z relative to current position
G1 H1 X320 F6000 ; move quickly to X axis endstop and stop there (first pass)
G1 X-5 F6000    ; go back a few mm
G1 H1 X320 F120  ; move slowly to X axis endstop once more (second pass)

; home y
G1 H2 Z4 F12000  ; lift Z relative to current position
G1 H1 Y325 F6000 ; move quickly to Y axis endstop and stop there (first pass)
G1 Y-5 F18000    ; go back a few mm
G1 H1 Y325 F120  ; move slowly to Y axis endstop once more (second pass)
G90              ; absolute positioning

; home z

G1 X150 Y150 F18000				 ; go to center of bed
G91               ; relative positioning
G1 H1 Z-355 F1800 ; move Z down until the endstop is triggered
G90
G1 Z5 F1800
G30
G1 Z5 F1800