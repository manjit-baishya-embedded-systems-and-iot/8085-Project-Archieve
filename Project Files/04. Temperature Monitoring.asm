;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Design a system to turn on a cooling fan when the temperature exceeds a 
;   certain threshold. The temperature sensor provides data through port 05H.
;   The system operates as follows:
;
;   1. The temperature sensor connected to port 05H gives an 8-bit temperature
;      reading.
;   2. If the temperature exceeds the defined threshold, the cooling fan is turned
;      on via port 06H.
;   3. If the temperature falls below the threshold, the cooling fan is turned off.
;
;   Requirements:
;   - Continuously monitor the temperature from the sensor.
;   - Turn on the cooling fan if the temperature exceeds the threshold.
;   - Turn off the cooling fan if the temperature is below the threshold.
;
;   Use the following ports:
;   - Port 05H: Temperature sensor data
;   - Port 06H: Cooling fan control (01H = turn on, 00H = turn off)
;----------------------------------------------------------------------------------

#ORG 7000H

; define constants
TEMP_SENSOR_PORT  EQU 05H
FAN_CONTROL_PORT  EQU 06H
TEMP_THRESHOLD    EQU 50H   

start:

    ; read the temperature from the sensor at port 05H
    IN TEMP_SENSOR_PORT

    ; compare the temperature with the threshold
    CPI TEMP_THRESHOLD

    ; if temperature is above threshold, jump to turn_on_fan
    JNC turn_on_fan

    ; if temperature is below threshold, jump to turn_off_fan
    JMP turn_off_fan

; defining the label to turn on the fan
turn_on_fan:

    ; move 01H to accumulator (turn on fan command)
    MVI A, 01H

    ; send the turn on fan command to port 06H
    OUT FAN_CONTROL_PORT

    ; go back to start to continue monitoring
    JMP start

; defining the label to turn off the fan
turn_off_fan:

    ; move 00H to accumulator (turn off fan command)
    MVI A, 00H

    ; send the turn off fan command to port 06H
    OUT FAN_CONTROL_PORT

    ; go back to start to continue monitoring
    JMP start

HLT

;----------------------------------------------------------------------------------