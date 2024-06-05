;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Measure and display the energy consumption of a household using sensors 
;   connected to port 12H. The system operates as follows:
;
;   1. The energy consumption data is read from port 12H.
;   2. Display the energy consumption data on port 13H.
;
;   Use the following ports:
;   - Port 12H: Energy sensor input
;   - Port 13H: Energy consumption display
;----------------------------------------------------------------------------------

ORG 3000H

START:
    IN 12H            ; read energy consumption data from port 12H
    MOV B, A          ; move data to register B
    OUT 13H           ; send data to display port 13H
    JMP START         ; loop back to start

HLT

;----------------------------------------------------------------------------------