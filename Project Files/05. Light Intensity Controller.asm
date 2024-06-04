;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Design a system to adjust the brightness of lights based on ambient light 
;   levels detected by a sensor connected to port 1FH. The system operates as 
;   follows:
;
;   1. The ambient light sensor provides an 8-bit reading through port 1FH.
;   2. Based on the sensor reading, the system adjusts the brightness of the lights
;      connected to port 2FH.
;   3. If the ambient light level is low, increase the brightness of the lights.
;   4. If the ambient light level is high, decrease the brightness of the lights.
;
;   Requirements:
;   - Continuously monitor the ambient light levels.
;   - Adjust the light brightness accordingly.
;
;   Use the following ports:
;   - Port 1FH: Ambient light sensor data
;   - Port 2FH: Light brightness control (0-255 value for brightness)
;----------------------------------------------------------------------------------

#ORG 8000H

; define constants
LIGHT_SENSOR_PORT EQU 1FH
LIGHT_CONTROL_PORT EQU 2FH

start:

    ; read the ambient light level from the sensor at port 1FH
    IN LIGHT_SENSOR_PORT

    ; store the sensor reading in register B for comparison
    MOV B, A

    ; define a series of thresholds for light adjustment
    ; example thresholds: low, medium, high

    ; compare with low threshold (example value)
    MVI A, 40H    ; low threshold
    CMP B
    JC increase_brightness   ; if sensor reading < low threshold, increase brightness

    ; compare with medium threshold (example value)
    MVI A, 80H    ; medium threshold
    CMP B
    JC maintain_brightness   ; if sensor reading < medium threshold, maintain brightness

    ; if sensor reading >= medium threshold, decrease brightness
    JMP decrease_brightness

increase_brightness:

    ; move a high brightness value to the accumulator (example value)
    MVI A, C0H    ; high brightness
    OUT LIGHT_CONTROL_PORT
    JMP start

maintain_brightness:

    ; move a medium brightness value to the accumulator (example value)
    MVI A, 80H    ; medium brightness
    OUT LIGHT_CONTROL_PORT
    JMP start

decrease_brightness:

    ; move a low brightness value to the accumulator (example value)
    MVI A, 40H    ; low brightness
    OUT LIGHT_CONTROL_PORT
    JMP start

HLT

;----------------------------------------------------------------------------------