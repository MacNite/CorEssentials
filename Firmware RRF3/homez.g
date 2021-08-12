; homez.g
; called to home the Z axis

G91               ; relative positioning
G1 H2 Z5 F18000   ; lift Z relative to current position
G90               ; absolute positioning

G1 X155 Y155 F12000 ; move to center of bed

M558 F6000    
G30
M558 F120
G30
G1 Z5 F600

