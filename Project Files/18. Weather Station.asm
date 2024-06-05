;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Collect and display weather data like temperature, humidity, and pressure from 
;   sensors at port 13H. The system operates as follows:
;
;   1. The weather data is read from port 13H.
;   2. Display the weather data on port 14H.
;
;   Use the following ports:
;   - Port 13H: Weather sensor input
;   - Port 14H: Weather data display
;----------------------------------------------------------------------------------

ORG 3100H

START:
    IN 13H            ; read weather data from port 13H
    MOV B, A          ; move data to register B
    OUT 14H           ; send data to display port 14H
    JMP START         ; loop back to start

HLT
