;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Monitor the status of 8 parking slots and display the availability on an LED 
;   display connected to port 08H. The system operates as follows:
;
;   1. The parking slot sensors provide an 8-bit reading through port 08H.
;   2. Each bit in the reading represents the status of one parking slot (1 = occupied, 0 = available).
;   3. The availability should be displayed on the LED display connected to port 09H.
;
;   Use the following ports:
;   - Port 08H: Parking slot status
;   - Port 09H: LED display output
;----------------------------------------------------------------------------------

ORG 2100H

START:
    IN 08H            ; read parking slot status from port 08H
    OUT 09H           ; send status to LED display on port 09H
    JMP START         ; go back to start

HLT
