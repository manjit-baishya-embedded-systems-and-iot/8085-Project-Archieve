;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
;   Design a system to sound an alarm if any of the 8 doors or windows in a house
;   are opened. The status of the doors and windows is read from port 04H. The system
;   operates as follows:
;
;   1. Each bit of port 04H represents the status of a door or window (1 = closed,
;      0 = open).
;   2. If any bit in port 04H is 0 (indicating an open door or window), the system
;      should sound an alarm.
;   3. The alarm is controlled via port 05H (01H = sound alarm, 00H = stop alarm).
;
;   Requirements:
;   - Continuously monitor the status of all doors and windows.
;   - Sound the alarm immediately if any door or window is opened.
;   - Stop the alarm if all doors and windows are closed.
;
;   Use the following ports:
;   - Port 04H: Door/window status monitoring
;   - Port 05H: Alarm control
;----------------------------------------------------------------------------------

#ORG 6000H

; define constants
DOOR_WINDOW_PORT  EQU 04H
ALARM_PORT        EQU 05H

start:

    ; read the status of doors and windows from port 04H
    IN DOOR_WINDOW_PORT

    ; check if any door or window is opened (if any bit is 0)
    CPI 0FFH   ; compare with all bits set (1111 1111)
    JZ all_closed  ; if all bits are set, all doors/windows are closed

    ; if any door or window is open, sound the alarm
    MVI A, 01H
    OUT ALARM_PORT

    ; go back to start to continue monitoring
    JMP start

; defining the label for all doors/windows closed all_closed:

    ; stop the alarm
    MVI A, 00H
    OUT ALARM_PORT

    ; go back to start to continue monitoring
    JMP start

HLT

;----------------------------------------------------------------------------------