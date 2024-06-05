;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Count the number of visitors entering and exiting a building using IR sensors 
;   connected to port 1DH. The system operates as follows:
;
;   1. The IR sensors provide input signals through port 1DH.
;   2. Increment the visitor count when an entry signal is detected.
;   3. Decrement the visitor count when an exit signal is detected.
;   4. Display the visitor count on an output device connected to port 1EH.
;
;   Use the following ports:
;   - Port 1DH: IR sensor input (bit 0 for entry, bit 1 for exit)
;   - Port 1EH: Visitor count display
;----------------------------------------------------------------------------------

ORG 2900H

VISITOR_COUNT DB 00H  ; initialize visitor count to 0

START:
    IN 1DH            ; read IR sensor data from port 1DH
    ANI 01H           ; mask for entry signal
    JZ CHECK_EXIT     ; if no entry signal, check for exit signal
    INX H             ; increment visitor count memory address
    MOV A, M          ; move visitor count to accumulator
    INR A             ; increment visitor count
    MOV M, A          ; store updated count back to memory
    JMP DISPLAY       ; jump to display updated count

CHECK_EXIT:
    IN 1DH            ; read IR sensor data from port 1DH again
    ANI 02H           ; mask for exit signal
    JZ START          ; if no exit signal, loop back to start
    INX H             ; increment visitor count memory address
    MOV A, M          ; move visitor count to accumulator
    DCR A             ; decrement visitor count
    MOV M, A          ; store updated count back to memory

DISPLAY:
    MOV A, M          ; move updated count to accumulator
    OUT 1EH           ; send updated count to display port 1EH
    JMP START         ; loop back to start

HLT

;----------------------------------------------------------------------------------