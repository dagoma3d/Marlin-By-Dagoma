; Z-Offset setting g-code
;

; Reset led pin state: off
M42 S0
; Homing
G28
; We are now at bed center
; Set global move speed to something low
G0 F200

; Procedure start
; Loop until printer is turned-off
M42 S255      ; Led on
G4 S1         ;     1s
M42 S0        ; Led off
M851 Z0.00    ; Set z-offset
M500          ; Store settings in eeprom
G29         ; Homing Z (take new z-offset in account)
G0 X0 Y0 Z0         ; Go to Z0
G4 S5         ; Wait if the user want to turn off the printer

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-0.10
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-0.20
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-0.30
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-0.40
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-0.50
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-0.60
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-0.70
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-0.80
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-0.90
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-1.00
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-1.10
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-1.20
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-1.30
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-1.40
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-1.50
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-1.60
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-1.70
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-1.80
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-1.90
M500 
G29
G0 X0 Y0 Z0
G4 S5

; Loop until printer is turned-off
M42 S255
G4 S1
M42 S0
M851 Z-2.00
M500 
G29
G0 X0 Y0 Z0
G4 S5