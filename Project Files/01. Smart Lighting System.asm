;----------------------------------------------------------------------------------
; Problem Statement:-
;----------------------------------------------------------------------------------
; Let us suppose that there are 8 rooms in a house and there are proximity sensors
; connected to each one of them. The accumulated data of all the sensors are present
; in the memory location 78H. But room 3 is empty currently yet the sensor has
; malfunctioned and generating false positives. So, disable it completely. Also, room 7
; belongs to the cat so she accidentally switches on the light. The user saves the
; state for the room at location 65H so let it operate according to that location.
; Send out the final state via port 89H.
;----------------------------------------------------------------------------------

#ORG 4000H

; define the memory locations
SENSOR_DATA       EQU 78H
ROOM_7_STATE      EQU 65H
OUTPUT_PORT       EQU 89H

start:

    ; load sensor data from memory location 78H
    LHLD SENSOR_DATA

    ; move sensor data to accumulator
    MOV A, L

    ; disable the sensor for room 3 (bit 2)
    ANI 0FBH ; 0FBH = 1111 1011 in binary

    ; load the state for room 7 from memory location 65H
    MOV H, A
    LHLD ROOM_7_STATE

    ; update room 7 state (bit 6)
    MOV A, L
    ANI 0BFH ; clear bit 6
    MOV A, H
    ANI 040H ; keep bit 6 only
    ORA L

    ; output the final state to port 89H
    OUT OUTPUT_PORT

    ; go back to start to continuously monitor and control lights
    JMP start

HLT

;----------------------------------------------------------------------------------
