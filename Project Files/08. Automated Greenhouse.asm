;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Control the temperature and humidity levels in a greenhouse using sensors 
;   connected to port 09H. The system operates as follows:
;
;   1. The temperature and humidity sensors provide an 8-bit reading through port 09H.
;   2. Based on the sensor reading, adjust the controls to maintain optimal levels.
;   3. Send control signals to port 0AH.
;
;   Use the following ports:
;   - Port 09H: Sensor input (4 bits for temperature, 4 bits for humidity)
;   - Port 0AH: Control output (temperature and humidity controls)
;----------------------------------------------------------------------------------

ORG 2200H

START:
    IN 09H            ; read sensor data from port 09H
    MOV C, A          ; store sensor data in C

    ANI 0FH           ; mask upper 4 bits to get humidity
    MOV B, A          ; move humidity to B

    MOV A, C
    RRC               ; rotate right to get temperature
    RRC
    RRC
    RRC

    ; Control logic for temperature and humidity (example values)
    ; If temperature is above threshold, turn on cooling (01H), else turn off (00H)
    CPI 0AH           ; example threshold for temperature
    JC TEMP_LOW
    MVI A, 01H
    JMP HUMIDITY

TEMP_LOW:
    MVI A, 00H

HUMIDITY:
    MOV C, A
    MOV A, B

    ; If humidity is below threshold, turn on humidifier (02H), else turn off (00H)
    CPI 05H           ; example threshold for humidity
    JNC HUMIDITY_LOW
    ORI 02H
    JMP OUTPUT

HUMIDITY_LOW:
    MOV A, C

OUTPUT:
    OUT 0AH           ; send control signals to port 0AH
    JMP START         ; go back to start

HLT
