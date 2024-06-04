;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   A water dispenser is installed in a common area to provide a specific amount 
;   of water whenever a button is pressed. The dispenser has a sensor that monitors
;   the water level, ensuring there is enough water before dispensing. The system
;   operates as follows:
;
;   1. The button press is detected via port 02H (bit 0: 1 = button pressed, 0 = not pressed).
;   2. The water level is monitored through port 03H (bit 0: 1 = enough water, 0 = low water level).
;   3. Port 04H controls the dispenser (01H = dispense water, 00H = stop dispensing).
;
;   Requirements:
;   - If the button is pressed and the water level is sufficient, dispense a specific
;     amount of water.
;   - If the button is pressed but the water level is low, do not dispense water and
;     indicate low water level via port 05H (bit 0: 1 = low water, 0 = sufficient water).
;   - Dispense water for a fixed duration (simulate this using a loop delay).
;
;   Additional Assumptions:
;   - The specific amount of water is dispensed within a fixed time duration.
;   - The system continuously monitors the button state and water level.
;
;   Use the following ports:
;   - Port 02H: Button press detection
;   - Port 03H: Water level monitoring
;   - Port 04H: Water dispenser control
;   - Port 05H: Low water level indication
;----------------------------------------------------------------------------------

#ORG 5000H

; define constants
BUTTON_PORT       EQU 02H
WATER_LEVEL_PORT  EQU 03H
DISPENSER_PORT    EQU 04H
LOW_WATER_PORT    EQU 05H

start:

    ; check if the button is pressed (bit 0 of port 02H)
    IN BUTTON_PORT
    ANI 01H

    ; if button is not pressed, loop back to start
    JZ start

    ; check water level (bit 0 of port 03H)
    IN WATER_LEVEL_PORT
    ANI 01H

    ; if water level is low, indicate low water and loop back
    JZ low_water

    ; dispense water by sending command to port 04H
    MVI A, 01H
    OUT DISPENSER_PORT

    ; simulate water dispensing duration with a delay loop
    MVI B, 0FH  ; adjust this value for appropriate delay
dispense_delay:
    DCR B
    JNZ dispense_delay

    ; stop dispensing water
    MVI A, 00H
    OUT DISPENSER_PORT

    ; go back to start to continuously monitor button and water level
    JMP start

; defining the label for low water level
low_water:
    ; indicate low water level by setting bit 0 of port 05H
    MVI A, 01H
    OUT LOW_WATER_PORT

    ; small delay to ensure indication is visible
    MVI B, 05H  ; adjust this value for appropriate delay
low_water_delay:
    DCR B
    JNZ low_water_delay

    ; clear low water indication
    MVI A, 00H
    OUT LOW_WATER_PORT

    ; go back to start to continuously monitor button and water level
    JMP start

HLT

;----------------------------------------------------------------------------------