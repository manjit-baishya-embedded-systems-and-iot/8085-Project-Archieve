;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Control various appliances like lights, fans, and ACs in a house via commands 
;   received at port 11H. The system operates as follows:
;
;   1. Commands are received through port 11H.
;   2. Each bit in the command corresponds to an appliance:
;      - Bit 0: Light
;      - Bit 1: Fan
;      - Bit 2: AC
;   3. Based on the received command, turn the appliances on or off.
;
;   Use the following ports:
;   - Port 11H: Command input
;   - Port 12H: Appliance control output
;----------------------------------------------------------------------------------

ORG 2F00H

START:
    IN 11H            ; read command from port 11H
    MOV B, A          ; move command to register B
    OUT 12H           ; send command to appliance control port 12H
    JMP START         ; loop back to start

HLT

;----------------------------------------------------------------------------------