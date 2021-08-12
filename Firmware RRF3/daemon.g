;LED states

;if state.status = "idle"
;    M150 R0 U0 B128 Y31 S60 F0                                 ; Set all 60 leds green.
;if heat.heaters[0].current < 30                                ; Bed heating?
    M150 R255 U255 B0 Y31 S60 F0                                ; Set all 60 leds yellow.
