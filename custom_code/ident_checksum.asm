;--------------------------------------------------
; ATA IDENTIFY DEVICE checksum (512 bytes)
; Data:     XDATA 0x4000 - 0x41FF
; Writes:   0x41FE = 0xA5
;           0x41FF = checksum
; Output:   A = checksum
;--------------------------------------------------

        .area CODE (ABS)
        .org 0xB000        ; <-- where you want to place code

_checksum:
        ;------------------------------------------
        ; Write 0x5A to 0x41FE
        ;------------------------------------------
        mov     DPTR, #0x41FE
        mov     A, #0xA5
        movx    @DPTR, A

        ;------------------------------------------
        ; Initialize counter (R0,R1) and checksum (A)
        ;------------------------------------------
        mov     DPTR, #0x4000     ; start of data
        mov     R0, #0x00         ; 256-byte counter
        mov     R1, #0x02         ; 2 * 256 = 512 bytes

        clr     A                 ; A = checksum 

sum_loop:
        mov     R2, A             ; save surrent sum
        movx    A, @DPTR          ; read byte
        add     A, R2             ; accumulate (8-bit wrap)

        inc     DPTR              ; next byte

        inc     R0
        cjne    R0, #0x00, sum_loop
        djnz    R1, sum_loop      ; decrement R1 and check if R1==0, if not then continue loop

        ;------------------------------------------
        ; Compute 2's complement
        ; checksum = (0x100 - sum) & 0xFF
        ;------------------------------------------
        cpl     A
        inc     A

        ;------------------------------------------
        ; Store checksum at 0x41FF
        ;------------------------------------------
        mov     DPTR, #0x41FF
        movx    @DPTR, A

        
        ;------------------------------------------
        ; Here we will set up registers
        ; It was done @0x8226 but we used that code 
        ; to make a call here
        ;------------------------------------------
        clr     A
        mov     0xA4, A

        ret
