;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Maintain the water level in a tank by controlling a pump based on sensor input 
;   from port 0BH. The system operates as follows:
;
;   1. The water level sensor provides an 8-bit reading through port 0BH.
;   2. If the water level is below a certain threshold, turn on the pump.
;   3. If the water level is above the threshold, turn off the pump.
;
;   Use the following ports:
;   - Port 0BH: Water level sensor input
;   - Port 0CH: Pump control (01H = pump on, 00H = pump off)
;----------------------------------------------------------------------------------

ORG 2400H

START:
    IN 0BH            ; read water level sensor data from port 0BH
    CPI 20H           ; compare with threshold value (example: 20H)
    JC PUMP_ON        ; if below threshold, jump to PUMP_ON
    JMP PUMP_OFF      ; if above threshold, jump to PUMP_OFF

PUMP_ON:
    MVI A, 01H        ; move 01H to accumulator to turn on pump
    OUT 0CH           ; send pump on signal to port 0CH
    JMP START         ; go back to start

PUMP_OFF:
    MVI A, 00H        ; move 00H to accumulator to turn off pump
    OUT 0CH           ; send pump off signal to port 0CH
    JMP START         ; go back to start

HLT

;----------------------------------------------------------------------------------