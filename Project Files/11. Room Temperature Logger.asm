;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Log and display the temperature of a room at regular intervals using a sensor 
;   connected to port 1EH. The system operates as follows:
;
;   1. The temperature sensor provides an 8-bit reading through port 1EH.
;   2. Log the temperature readings in memory at regular intervals.
;   3. Display the temperature on an output device connected to port 1FH.
;
;   Use the following ports:
;   - Port 1EH: Temperature sensor input
;   - Port 1FH: Output display
;----------------------------------------------------------------------------------

ORG 2500H
LOG_ADDR EQU 3000H    ; starting address for logging temperature data

START:
    MVI C, 10H        ; set delay counter for regular intervals
DELAY:
    DCR C
    JNZ DELAY

    IN 1EH            ; read temperature sensor data from port 1EH
    STA LOG_ADDR      ; store temperature data in memory
    INX H             ; increment memory address

    MOV A, M          ; move temperature data to accumulator
    OUT 1FH           ; send temperature data to output display port 1FH

    JMP START         ; loop back to start
HLT

;----------------------------------------------------------------------------------