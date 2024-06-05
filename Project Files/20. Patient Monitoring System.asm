;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Monitor the vital signs of a patient (heart rate, blood pressure) and display 
;   them on port 15H. The system operates as follows:
;
;   1. The vital signs data is read from port 15H.
;   2. Display the vital signs data on port 16H.
;
;   Use the following ports:
;   - Port 15H: Vital signs sensor input
;   - Port 16H: Vital signs display
;----------------------------------------------------------------------------------

ORG 3300H

START:
    IN 15H            ; read vital signs data from port 15H
    MOV B, A          ; move data to register B
    OUT 16H           ; send data to display port 16H
    JMP START         ; loop back to start

HLT

;----------------------------------------------------------------------------------