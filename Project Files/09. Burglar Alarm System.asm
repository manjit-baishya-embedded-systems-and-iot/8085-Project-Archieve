;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Activate an alarm when motion is detected by any of the 8 sensors connected 
;   to port 0AH. The system operates as follows:
;
;   1. The motion sensors provide an 8-bit reading through port 0AH.
;   2. If any sensor detects motion, the alarm should be activated.
;   3. The alarm is controlled via port 0BH.
;
;   Use the following ports:
;   - Port 0AH: Motion sensor input
;   - Port 0BH: Alarm control (01H = alarm on, 00H = alarm off)
;----------------------------------------------------------------------------------

ORG 2300H

START:
    IN 0AH            ; read motion sensor data from port 0AH
    CPI 00H           ; compare with 00H to check if no motion is detected
    JNZ ALARM_ON      ; if any bit is set, jump to ALARM_ON
    JMP ALARM_OFF     ; if no motion, jump to ALARM_OFF

ALARM_ON:
    MVI A, 01H        ; move 01H to accumulator to turn on alarm
    OUT 0BH           ; send alarm on signal to port 0BH
    JMP START         ; go back to start

ALARM_OFF:
    MVI A, 00H        ; move 00H to accumulator to turn off alarm
    OUT 0BH           ; send alarm off signal to port 0BH
    JMP START         ; go back to start

HLT

;----------------------------------------------------------------------------------