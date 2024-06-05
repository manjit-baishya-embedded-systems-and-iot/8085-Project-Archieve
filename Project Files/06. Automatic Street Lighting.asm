;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Turn on street lights automatically when it gets dark using a light sensor 
;   connected to port 07H. The system operates as follows:
;
;   1. The light sensor provides an 8-bit reading through port 07H.
;   2. If the light level is below a certain threshold, the street lights should be turned on.
;   3. If the light level is above the threshold, the street lights should be turned off.
;
;   Use the following ports:
;   - Port 07H: Light sensor input
;   - Port 08H: Street light control (01H = lights on, 00H = lights off)
;----------------------------------------------------------------------------------

ORG 2000H

START:
    IN 07H            ; read light sensor data from port 07H
    CPI 32H           ; compare with threshold value (example: 32H)
    JC LIGHTS_ON      ; if below threshold, jump to LIGHTS_ON
    JMP LIGHTS_OFF    ; if above threshold, jump to LIGHTS_OFF

LIGHTS_ON:
    MVI A, 01H        ; move 01H to accumulator to turn on lights
    OUT 08H           ; send turn on lights signal to port 08H
    JMP START         ; go back to start

LIGHTS_OFF:
    MVI A, 00H        ; move 00H to accumulator to turn off lights
    OUT 08H           ; send turn off lights signal to port 08H
    JMP START         ; go back to start

HLT

;----------------------------------------------------------------------------------