;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Control the movement of a toy car using remote commands received through port 
;   0DH. The system operates as follows:
;
;   1. The remote control sends command data through port 0DH.
;   2. Control the movement of the car based on the command received:
;      - Command 01H: Move Forward
;      - Command 02H: Move Backward
;      - Command 03H: Turn Left
;      - Command 04H: Turn Right
;      - Command 00H: Stop
;
;   Use the following ports:
;   - Port 0DH: Remote command input
;----------------------------------------------------------------------------------

ORG 2600H

START:
    IN 0DH            ; read command from port 0DH
    CPI 01H           ; compare with command to move forward
    JZ FORWARD
    CPI 02H           ; compare with command to move backward
    JZ BACKWARD
    CPI 03H           ; compare with command to turn left
    JZ LEFT
    CPI 04H           ; compare with command to turn right
    JZ RIGHT
    CPI 00H           ; compare with command to stop
    JZ STOP
    JMP START         ; loop back to start if no valid command

FORWARD:
    MVI A, 01H        ; move forward command
    OUT 0DH
    JMP START

BACKWARD:
    MVI A, 02H        ; move backward command
    OUT 0DH
    JMP START

LEFT:
    MVI A, 03H        ; turn left command
    OUT 0DH
    JMP START

RIGHT:
    MVI A, 04H        ; turn right command
    OUT 0DH
    JMP START

STOP:
    MVI A, 00H        ; stop command
    OUT 0DH
    JMP START
HLT

;----------------------------------------------------------------------------------