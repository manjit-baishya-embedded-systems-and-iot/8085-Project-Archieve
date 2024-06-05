;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Manage the movement of an elevator between floors based on user input from 
;   port 0FH. The system operates as follows:
;
;   1. The user provides input through port 0FH to select a floor (00H to 03H).
;   2. Move the elevator to the selected floor and stop.
;
;   Use the following ports:
;   - Port 0FH: User input for floor selection
;----------------------------------------------------------------------------------

ORG 2800H

START:
    IN 0FH            ; read floor selection input from port 0FH
    CPI 00H           ; compare with floor 0
    JZ FLOOR0
    CPI 01H           ; compare with floor 1
    JZ FLOOR1
    CPI 02H           ; compare with floor 2
    JZ FLOOR2
    CPI 03H           ; compare with floor 3
    JZ FLOOR3
    JMP START         ; loop back to start if no valid floor selected

FLOOR0:
    ; code to move elevator to floor 0
    MVI A, 00H
    OUT 0FH
    JMP START

FLOOR1:
    ; code to move elevator to floor 1
    MVI A, 01H
    OUT 0FH
    JMP START

FLOOR2:
    ; code to move elevator to floor 2
    MVI A, 02H
    OUT 0FH
    JMP START

FLOOR3:
    ; code to move elevator to floor 3
    MVI A, 03H
    OUT 0FH
    JMP START

HLT

;----------------------------------------------------------------------------------