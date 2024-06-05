;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Control an electronic door lock system based on user authentication from port 
;   14H. The system operates as follows:
;
;   1. The authentication data is read from port 14H.
;   2. If the authentication is valid, unlock the door.
;   3. If the authentication is invalid, keep the door locked.
;
;   Use the following ports:
;   - Port 14H: Authentication input
;   - Port 15H: Door lock control (01H = unlock, 00H = lock)
;----------------------------------------------------------------------------------

ORG 3200H

START:
    IN 14H            ; read authentication data from port 14H
    CPI 01H           ; compare with valid authentication code
    JZ UNLOCK         ; if valid, unlock the door
    JMP LOCK          ; if invalid, lock the door

UNLOCK:
    MVI A, 01H        ; unlock the door
    OUT 15H
    JMP START         ; loop back to start

LOCK:
    MVI A, 00H        ; lock the door
    OUT 15H
    JMP START         ; loop back to start

HLT

;----------------------------------------------------------------------------------