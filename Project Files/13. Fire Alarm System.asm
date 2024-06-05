;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Detect fire using smoke sensors and activate an alarm and sprinkler system via 
;   port 0EH. The system operates as follows:
;
;   1. The smoke sensor provides a signal through port 0EH.
;   2. If smoke is detected (signal = 1), activate the alarm and sprinkler.
;   3. If no smoke is detected (signal = 0), deactivate the alarm and sprinkler.
;
;   Use the following ports:
;   - Port 0EH: Smoke sensor input
;   - Port 0FH: Alarm and sprinkler control (01H = activate, 00H = deactivate)
;----------------------------------------------------------------------------------

ORG 2700H

START:
    IN 0EH            ; read smoke sensor data from port 0EH
    CPI 01H           ; compare with smoke detected signal
    JZ ACTIVATE       ; jump if smoke detected
    JMP DEACTIVATE    ; jump if no smoke detected

ACTIVATE:
    MVI A, 01H        ; activate alarm and sprinkler
    OUT 0FH
    JMP START         ; loop back to start

DEACTIVATE:
    MVI A, 00H        ; deactivate alarm and sprinkler
    OUT 0FH
    JMP START         ; loop back to start
HLT

;----------------------------------------------------------------------------------