;##############################################
;#  COMMAND ECh - [IDENTIFY DEVICE] HANDLER   #
;##############################################

;sg_raw -r 512 /dev/sda a1 08 0e 00 00 00 00 00 00 EC 00 00
;SCSI Status: Good
;
;Received 512 bytes of data:
; 00     5a 04 ff 3f 00 00 10 00  00 00 40 02 3f 00 de 01    Z..?......@.?...
; 10     00 40 00 00 30 32 30 41  32 36 37 39 20 20 20 20    .@..020A2679
; 20     20 20 20 20 20 20 20 20  01 00 10 00 04 00 65 52            ......eR
; 30     20 76 2e 33 32 37 44 53  74 20 20 6f 46 43 41 20     v.327DSt  oFCA
; 40     61 64 74 70 72 65 33 20  64 72 47 20 6e 65 20 20    adtpre3 drG ne
; 50     20 20 20 20 20 20 20 20  20 20 20 20 20 20 01 80                  ..
; 60     00 00 00 0f 00 00 00 02  00 00 07 00 ff 3f 10 00    .............?..
; 70     3f 00 10 fc fb 00 01 01  00 40 de 01 00 00 07 00    ?........@......
; 80     03 00 78 00 78 00 78 00  78 00 00 00 00 00 00 00    ..x.x.x.x.......
; 90     00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; a0     fe 01 00 06 01 88 04 50  00 40 01 88 00 50 00 40    .......P.@...P.@
; b0     3f 20 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ? ..............
; c0     00 00 00 00 00 00 00 00  00 40 de 01 00 00 00 00    .........@......
; d0     00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; e0     00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; f0     00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 100    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 110    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 120    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 130    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 140    00 00 00 00 00 00 12 00  00 00 00 00 00 00 00 00    ................
; 150    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 160    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 170    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 180    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 190    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 1a0    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 1b0    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 1c0    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 1d0    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 1e0    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
; 1f0    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................

;---------------------------------------------------------------------------

;DEFAULT DATA STORED AT 0x3DD8
;
;0000:   8a 84 00 00 00 00 10 00  00 00 40 02 3f 00 00 00    ..........@.?...
;0010:   00 00 00 00 20 20 20 20  20 20 20 20 20 20 20 20    ....
;0020:   20 20 20 20 20 20 20 20  01 00 10 00 04 00 37 36            ......76
;0030:   38 32 33 31 37 30 20 20  20 20 20 20 20 20 20 20    823170
;0040:   20 20 20 20 20 20 20 20  20 20 20 20 20 20 20 20
;0050:   20 20 20 20 20 20 20 20  20 20 20 20 20 20 01 80                  ..
;0060:   00 00 00 0f 00 00 00 02  00 00 07 00 00 00 00 00    ................
;0070:   00 00 00 00 00 00 00 01  00 00 00 00 00 00 07 00    ................
;0080:   03 00 78 00 78 00 78 00  78 00 00 00 00 00 00 00    ..x.x.x.x.......
;0090:   00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
;00a0:   fe 01 00 06 01 88 04 74  00 40 00 88 00 34 00 40    .......t.@...4.@
;00b0:   00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
;00c0:   00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
;00d0:   00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
;00e0:   00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................
;00f0:   00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00    ................

;---------------------------------------------------------------------------

9540    lcall   code_821A
9543    ret

;---- ATA COMMAND HANDLER ----------

code_821A:
   clr     RAM_2D.4
   lcall   code_5DF
   mov     C, RAM_2B.1
   mov     RAM_2D.3, C
   lcall   code_2015            ; Main routine, fills 0x4000 with all data (starting with default stored at 0x3DD8)

   clr     A
   mov     RESERVED_A4, A
   mov     R7, #0x20
   lcall   code_575             ; RESERVED_A2=R7, RESERVED_A1=1

   clr     A
   mov     RESERVED_A5, A
   mov     RESERVED_A4, A
   mov     R7, #0x28
   lcall   code_575             ; RESERVED_A2=R7, RESERVED_A1=1

   clr     A
   mov     RESERVED_AA, A
   mov     RESERVED_A9, #2
   mov     RESERVED_A7, A
   mov     RESERVED_A6, A
   mov     RESERVED_A5, A
   mov     RESERVED_A4, A
   mov     R7, #0x60
   lcall   code_575             ; RESERVED_A2=R7, RESERVED_A1=1

   clr     A
   mov     RESERVED_A4, A
   mov     RESERVED_A5, #2
   mov     RESERVED_A7, #0x80
   mov     R7, #0x64
   lcall   code_575             ; RESERVED_A2=R7, RESERVED_A1=1

code_8259:
   mov     A, RESERVED_A9
   jb      ACC1, code_8259      ; WAIT LOOP



code_825E:
   mov     R7, #0x3C
   lcall   code_57E             ; RESERVED_A2=R7, RESERVED_A1=2 + WAIT
   mov     A, RESERVED_A4
   jb      ACC3, code_825E

   ; HANDLE ATA BUFFER SENDING BACK TO HOST
   mov     R7, #1
   lcall   code_58C
   setb    RAM_2D.4
   lcall   code_5DF
   ret





;--------
code_575:
    mov     RAM_74, R7
    mov     RESERVED_A2, RAM_74
    mov     RESERVED_A1, #1
    ret
;--------
code_57E:
    mov     RAM_76, R7
    mov     RESERVED_A2, RAM_76
    mov     RESERVED_A1, #2

code_586:
    mov     A, RESERVED_A1
    jb      ACC1, code_586
    ret



;--------------------------------------------------------------------------------------
; code_2015 - Main ECh ATA routine
;--------------------------------------------------------------------------------------
; COPY 0x0128 bytes of data from ROM[0x3DD8] to XDATA[0x4000]
code_2015:
                clr     A
                mov     R0, #0x80
                mov     @R0, A
                inc     R0
                mov     @R0, A

code_201B:
                mov     R0, #0x80
                mov     A, @R0
                mov     R6, A
                inc     R0
                mov     A, @R0
                clr     C
                subb    A, #0x28
                mov     A, R6
                subb    A, #1
                jnc     code_2053
                dec     R0
                mov     A, @R0
                mov     R6, A
                inc     R0
                mov     A, @R0
                add     A, #0xD8
                mov     DPL, A          ; Data Pointer, Low Byte
                mov     A, #0x3D ; '='
                addc    A, R6
                mov     DPH, A          ; Data Pointer, High Byte
                clr     A
                movc    A, @A+DPTR
                mov     R7, A
                dec     R0
                mov     A, @R0
                mov     R4, A
                inc     R0
                mov     A, @R0
                mov     R5, A
                clr     A
                add     A, R5
                mov     DPL, A          ; Data Pointer, Low Byte
                mov     A, #0x40 ; '@'
                addc    A, R4
                mov     DPH, A          ; Data Pointer, High Byte
                mov     A, R7
                movx    @DPTR, A
                inc     @R0
                mov     A, @R0
                dec     R0
                jnz     code_2051
                inc     @R0

code_2051:
                sjmp    code_201B
; ---------------------------------------------------------------------------
; zeroing bytes from 0x4128 - 0x4200
code_2053:
                mov     R0, #0x80
                mov     A, @R0
                mov     R6, A
                inc     R0
                mov     A, @R0
                clr     C
                mov     A, R6
                subb    A, #2
                jnc     code_2078
                dec     R0
                mov     A, @R0
                mov     R6, A
                inc     R0
                mov     A, @R0
                mov     R7, A
                clr     A
                add     A, R7
                mov     DPL, A          ; Data Pointer, Low Byte
                mov     A, #0x40
                addc    A, R6
                mov     DPH, A          ; Data Pointer, High Byte
                clr     A
                movx    @DPTR, A
                inc     @R0
                mov     A, @R0
                dec     R0
                jnz     code_2076
                inc     @R0

code_2076:
                sjmp    code_2053
; ---------------------------------------------------------------------------
; Set up WORD 23-26 - Firmware revision (8 ASCII characters)
code_2078:
                lcall   code_15F5
                mov     RAM_73, #0xFF
                mov     RAM_74, #0x3F
                mov     RAM_75, #0          ;0x3F00 = "Rev 3.72"
                mov     R3, RAM_73
                mov     R2, RAM_74
                mov     R1, RAM_75
                mov     R7, #0x2E           ;0x402E = WORD 23-26 - Firmware revision
                lcall   code_1F7B           ;Copy "Rev 3.72" to 0x402E

; ---------------------------------------------------------------------------
; Set up WORD 27-46 - Model number (40 ASCII characters)
                mov     A, RAM_50
                cjne    A, #1, code_209F

                ; IF RAM[0x50]==1
                mov     RAM_73, #0xFF
                mov     RAM_74, #0x3F       ;0x3F09 = "FC-1307 SD to CF Adapter BACKUP V2.3"
                mov     RAM_75, #9
                sjmp    code_20CC

code_209F:      ; IF RAM[0x50]!=1
                mov     A, RAM_50
                jnz     code_20BE           ; IF RAM[0x50]!=0

                mov     A, RAM_3E
                cjne    A, #1, code_20B3    ; IF RAM[0x3E]!=1
                mov     RAM_73, #0xFF
                mov     RAM_74, #0x3F
                mov     RAM_75, #0x32       ; 0x3F32 = "SD to CF Adapter 3rd Gen"
                sjmp    code_20CC

code_20B3:
                mov     RAM_73, #0xFF
                mov     RAM_74, #0x3F
                mov     RAM_75, #0x5B       ;0x3F5B = "FC-1307 SD to CF Adapter SPEED V2.3"
                sjmp    code_20CC

code_20BE:
                mov     A, RAM_50
                cjne    A, #2, code_20CC
                mov     RAM_73, #0xFF
                mov     RAM_74, #0x3F
                mov     RAM_75, #0x84       ; 0x3F84 = "FC-1307 SD to CF Adapter JBOD V2.3"

code_20CC:
                mov     R3, RAM_73
                mov     R2, RAM_74
                mov     R1, RAM_75
                mov     R7, #0x36
                lcall   code_1F7B           ;Copy "FC-1307..." to 0x4036 (WORD 27-46 - Model number)

; ---------------------------------------------------------------------------

                jb      RAM_2B.6, code_20DD
                ljmp    code_2256

code_20DD:
                mov     R3, #0x03       ; BUFFER SIZE (@ 0x5C00)
                mov     R5, #0x0A       ; OFFSET - 0x0A = GET STATES OF SN, FW, MODEL
                mov     R7, #0xA0       ; CHIP ADDRESS
                lcall   code_30CD       ; READ EEPROM
                jc      code_20EB       ; IF C==1 THEN READ IS OK
                ljmp    code_2256       ; ELSE EXIT


; ---------------------------------------------------------------------------
; ---------------------------------------------------------------------------
; PREPARE MEMORY - COPY MEM[0x5C00-0x5C02] to MEM[0x4400-0x4402]
code_20EB:
                mov     DPTR, #0x5C00
                movx    A, @DPTR
                mov     DPTR, #0x4400
                movx    @DPTR, A            ; MEM[0x4400] = MEM[0x5C00] -> Serial number status
                mov     DPTR, #0x5C01
                movx    A, @DPTR
                mov     DPTR, #0x4401
                movx    @DPTR, A            ; MEM[0x4401] = MEM[0x5C01] -> Firmware revision status
                mov     DPTR, #0x5C02
                movx    A, @DPTR
                mov     DPTR, #0x4402
                movx    @DPTR, A            ; MEM[0x4402] = MEM[0x5C02] -> Model number


; ---------------------------------------------------------------------------
; SET UP WORD 10-19 - Serial number (20 ASCII characters)

                ; CHECK IF WE SHOULD DO THIS
                mov     DPTR, #0x4400
                movx    A, @DPTR            ; A = MEM[0x4400]
                xrl     A, #0x99            ; A = A ^ 0x99
                jnz     code_2174           ; if A!=0x99, jump away to code_2174


                ; FILLS 0x14 BYTES @ MEM[0x4014] TO SPACE CHAR
                ; WORD 10-19 F Serial number (20 ASCII characters)
                mov     RAM_3D, A           ; COUNTER = 0 because code reaches here only if A==0x99, and A=0x99^0x99=0
code_210D:
                mov     A, RAM_3D
                clr     C
                subb    A, #0x14
                jnc     code_2126       ; if COUNTER!=0x14 then end loop
                mov     A, #0x14
                add     A, RAM_3D       ; A = COUNTER + 0x14
                mov     DPL, A          ; Data Pointer, Low Byte
                clr     A
                addc    A, #0x40
                mov     DPH, A          ; Data Pointer, High Byte
                mov     A, #0x20        ; ' ' (space)
                movx    @DPTR, A
                inc     RAM_3D
                sjmp    code_210D


code_2126:
                mov     R3, #0x14       ; BUFFER SIZE (@ 0x5C00)
                mov     R5, #0x10       ; OFFSET - 0x10 = GET SERIAL NUMBER
                mov     R7, #0xA0       ; CHIP ADDRESS
                lcall   code_30CD       ; READ EEPROM
                jnc     code_2174       ; IF C==0 (CAN'T READ), EXIT

                ; Copy 0x14 characters from MEM[0x5C00] to [0x4014]
                ; WORD 10-19 - Serial number (20 ASCII characters)
                clr     A
                mov     RAM_3D, A           ; RAM[0x3D] = COUNTER
code_2134:
                mov     A, RAM_3D
                clr     C
                subb    A, #0x14            ; IF COUNTER==0x14 then
                jnc     code_2174           ; EXIT code_20EB
                ; LOW BYTE
                clr     A
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte = COUNTER
                clr     A
                addc    A, #0x5C
                mov     DPH, A          ; Data Pointer, High Byte = 0x5C
                movx    A, @DPTR
                mov     R7, A
                mov     A, #0x14
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte = COUNTER + 0x14
                clr     A
                addc    A, #0x40
                mov     DPH, A          ; Data Pointer, High Byte = 0x40
                mov     A, R7
                movx    @DPTR, A        ; -- MEM[0x4014+COUNTER] = MEM[0x5000+COUNTER]
                ; HIGH BYTE
                mov     A, #1
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte  = COUNTER+0x01
                clr     A
                addc    A, #0x5C
                mov     DPH, A          ; Data Pointer, High Byte = 0x5C
                movx    A, @DPTR
                mov     R7, A
                mov     A, #0x15
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte = COUNTER + 0x15
                clr     A
                addc    A, #0x40
                mov     DPH, A          ; Data Pointer, High Byte
                mov     A, R7
                movx    @DPTR, A        ; -- MEM[0x4015+COUNTER] = MEM[0x5001+COUNTER]

                inc     RAM_3D
                inc     RAM_3D          ; COUNTER += 2
                sjmp    code_2134       ; continue loop



; ---------------------------------------------------------------------------
; FILL 23-26 - Firmware revision (8 ASCII characters)
code_2174:
                ; CHECK IF WE SHOULD DO THIS
                mov     DPTR, #0x4401
                movx    A, @DPTR
                xrl     A, #0x99
                jnz     code_21E5       ; if MEM[0x4401]!=0x99, jump away

                ; FILL 8 bytes at 0x402E with space characters
                ; WORDS 23-26 - Firmware revision (8 ASCII characters)
                mov     RAM_3D, A       ; A=0 because A=0x99^0x99
code_217E:
                mov     A, RAM_3D
                clr     C
                subb    A, #8           ; IF COUNTER = 8
                jnc     code_2197       ; ... exit loop
                mov     A, #0x2E
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte = 0x2E+COUNTER
                clr     A
                addc    A, #0x40        ; '@'
                mov     DPH, A          ; Data Pointer, High Byte = 0x40
                mov     A, #0x20        ; ' ' (space)
                movx    @DPTR, A        ; MEM[0x402E+COUNTER]=' '
                inc     RAM_3D
                sjmp    code_217E       ; BACK TO LOOP

code_2197:
                mov     R3, #0x08       ; BUFFER SIZE (@ 0x5C00)
                mov     R5, #0x24       ; OFFSET - 0x24 = GET FW REVISION
                mov     R7, #0xA0       ; CHIP ADDRESS
                lcall   code_30CD       ; READ EEPROM
                jnc     code_21E5       ; IF C==0 (CAN'T READ), EXIT

                ; COPY 8 bytes from MEM[0x5C00] to MEM[0x402E]
                ; WORDS 23-26 - Firmware revision (8 ASCII characters)
                clr     A
                mov     RAM_3D, A
code_21A5:
                mov     A, RAM_3D
                clr     C
                subb    A, #8
                jnc     code_21E5       ; JUMPOUT IF COUNTER==8
                mov     A, #1
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte = 1 + COUNTER
                clr     A
                addc    A, #0x5C
                mov     DPH, A          ; Data Pointer, High Byte = 0x5C
                movx    A, @DPTR
                mov     R7, A
                mov     A, #0x2E
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte = 0x2E + COUNTER
                clr     A
                addc    A, #0x40
                mov     DPH, A          ; Data Pointer, High Byte = 0x40
                mov     A, R7
                movx    @DPTR, A

                clr     A
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte = COUNTER
                clr     A
                addc    A, #0x5C
                mov     DPH, A          ; Data Pointer, High Byte = 0x5C
                movx    A, @DPTR
                mov     R7, A
                mov     A, #0x2F
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte = 0x2F + COUNTER
                clr     A
                addc    A, #0x40
                mov     DPH, A          ; Data Pointer, High Byte = 0x40
                mov     A, R7
                movx    @DPTR, A
                inc     RAM_3D
                inc     RAM_3D          ; COUNTER+=2
                sjmp    code_21A5       ; REPEAT
; ---------------------------------------------------------------------------

code_21E5:
                ; CHECK IF WE SHOULD DO THIS
                mov     DPTR, #0x4401   ; <- bug? should be 0x4402?
                movx    A, @DPTR
                xrl     A, #0x99
                jnz     code_2256

                ; FILL 0x28 bytes at MEM[0x4020] with space characters
                ; WORDS 27-46 F Model number (40 ASCII characters)
                mov     RAM_3D, A       ; ZERO COUNTER
code_21EF:
                mov     A, RAM_3D
                clr     C
                subb    A, #0x28
                jnc     code_2208
                mov     A, #0x36
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte = 0x36+COUNTER
                clr     A
                addc    A, #0x40
                mov     DPH, A          ; Data Pointer, High Byte = 0x20
                mov     A, #0x20        ; ' '
                movx    @DPTR, A
                inc     RAM_3D
                sjmp    code_21EF       ; REPEAT LOOP


code_2208:
                mov     R3, #0x28       ; BUFFER SIZE (@ 0x5C00)
                mov     R5, #0x2C       ; OFFSET - 0x2C = GET MODEL NAME
                mov     R7, #0xA0       ; CHIP ADDRESS
                lcall   code_30CD       ; READ EEPROM
                jnc     code_2256       ; IF C==0 (CAN'T READ), EXIT

                ; COPY 0x28 bytes from MEM[0x5C00] to MEM[0x4036]
                ; WORDS 27-46 F Model number (40 ASCII characters)
                clr     A
                mov     RAM_3D, A
code_2216:
                mov     A, RAM_3D
                clr     C
                subb    A, #0x28
                jnc     code_2256
                mov     A, #1
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte
                clr     A
                addc    A, #0x5C
                mov     DPH, A          ; Data Pointer, High Byte
                movx    A, @DPTR
                mov     R7, A
                mov     A, #0x36
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte
                clr     A
                addc    A, #0x40
                mov     DPH, A          ; Data Pointer, High Byte
                mov     A, R7
                movx    @DPTR, A
                clr     A
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte
                clr     A
                addc    A, #0x5C
                mov     DPH, A          ; Data Pointer, High Byte
                movx    A, @DPTR
                mov     R7, A
                mov     A, #0x37
                add     A, RAM_3D
                mov     DPL, A          ; Data Pointer, Low Byte
                clr     A
                addc    A, #0x40
                mov     DPH, A          ; Data Pointer, High Byte
                mov     A, R7
                movx    @DPTR, A
                inc     RAM_3D
                inc     RAM_3D
                sjmp    code_2216       ; REPEAT LOOP
; END OF SETUP SERIAL/FW/MODEL
; ---------------------------------------------------------------------------


code_2256:
                mov     R7, #4
                lcall   code_57E
                mov     A, RESERVED00A5 ; RESERVED
                jnb     ACC2, code_226A ; Accumulator
                mov     DPTR, #0x4000
                mov     A, #0x5A ; 'Z'
                movx    @DPTR, A
                inc     DPTR
                mov     A, #4
                movx    @DPTR, A

code_226A:
                jb      RAM_29.5, code_2290
                mov     R0, #0x98
                mov     A, @R0
                mov     DPTR, #0x4078
                movx    @DPTR, A
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A
                mov     DPTR, #0x40A7
                movx    A, @DPTR
                anl     A, #0xDB
                movx    @DPTR, A
                movx    A, @DPTR
                anl     A, #0xDB
                mov     DPTR, #0x40AD
                movx    @DPTR, A
                sjmp    code_229E
; ---------------------------------------------------------------------------

;   WORD 60-61 - Total number of user addressable sectors (LBA mode only)
;   MEM[0x4078] = 0xFF 0xFF 0xFF 0x0F
code_2290:
                mov     DPTR, #0x4078
                mov     A, #0xFF
                movx    @DPTR, A        ; MEM[0x4078] = 0xFF
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x4079] = 0xFF
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x407A] = 0xFF
                inc     DPTR
                mov     A, #0xF
                movx    @DPTR, A        ; MEM[0x407B] = 0x0F

; 0xC8 - 0xCF = WORD 100 - 103 - RESERVED
code_229E:
                mov     R0, #0x98
                mov     A, @R0
                mov     DPTR, #0x40C8
                movx    @DPTR, A        ; MEM[0x40C8] = MEM[0x98]
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x40C9] = MEM[0x97]
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x40CA] = MEM[0x96]
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x40CB] = MEM[0x95]
                inc     DPTR
                clr     A
                movx    @DPTR, A        ; MEM[0x40CC] = 0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x40CD] = 0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x40CE] = 0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x40CF] = 0

                mov     R0, #0xA9
                lcall   code_3344
                nop
                mov     R3, A
                mov     R4, A
                jbc     RAM_24.0, code_2312
                dec     R5
                mov     R7, #0x10
                mov     R6, #0xFC
                mov     R5, #0xFB
                mov     R4, #0
                mov     R0, #0x95
                lcall   code_332B
                clr     C
                lcall   code_32E8
                jnc     code_22E3
                mov     R0, #0x95
                lcall   code_331F
                mov     R0, #0xA9
                lcall   code_3338

code_22E3:
                mov     R0, #0xA9
                lcall   code_331F
                push    RAM_4
                push    RAM_5
                push    RAM_6
                push    RAM_7
                mov     R0, #0x7D
                mov     A, @R0
                mov     R7, A
                clr     A
                mov     R4, A
                mov     R5, A
                mov     R6, A
                mov     R0, A
                mov     R1, A
                mov     R2, A
                mov     R3, RAM_7
                pop     RAM_7
                pop     RAM_6
                pop     RAM_5
                pop     RAM_4
                lcall   code_3256
                mov     R0, #0xA9
                lcall   code_3338
                mov     R0, #0xA9
                lcall   code_331F

code_2312:
                push    RAM_4
                push    RAM_5
                push    RAM_6
                push    RAM_7
                mov     R0, #0xA2
                mov     A, @R0
                mov     R7, A
                clr     A
                mov     R4, A
                mov     R5, A
                mov     R6, A
                mov     R0, A
                mov     R1, A
                mov     R2, A
                mov     R3, RAM_7
                pop     RAM_7
                pop     RAM_6
                pop     RAM_5
                pop     RAM_4
                lcall   code_3256

                mov     R0, #0xA9
                lcall   code_3338

                mov     R0, #0xAC
                mov     A, @R0
                mov     DPTR, #0x4002
                movx    @DPTR, A        ; MEM[0x4002] = MEM[0xAC] // Number of logical cylinders LO
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x4003] = MEM[0xAB] // Number of logical cylinders HI
                inc     R0
                mov     A, @R0
                mov     DPTR, #0x406C
                movx    @DPTR, A        ; MEM[0x406c] = MEM[0xAC] // Number of current logical cylinders
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x406d] = MEM[0xAB] // Number of current logical cylinders
                inc     DPTR
                mov     A, #0x10
                movx    @DPTR, A        ; MEM[0x406e] = 0x10 // Number of current logical heads
                inc     DPTR
                clr     A
                movx    @DPTR, A        ; MEM[0x406f] = 0x00 // Number of current logical heads
                inc     DPTR
                mov     A, #0x3F
                movx    @DPTR, A        ; MEM[0x4070] = 0x3F // Number of current logical sectors per track LO
                inc     DPTR
                clr     A
                movx    @DPTR, A        ; MEM[0x4070] = 0x00 // Number of current logical sectors per track HI

                mov     R0, #0xA9
                lcall   code_331F

                clr     A
                mov     R3, #0xF0
                mov     R2, #3
                mov     R1, A
                mov     R0, A
                lcall   code_31CB

                mov     R0, #0xA9
                lcall   code_3338

                ; Current capacity in sectors - MEM[0x4072-0x4075] = MEM[0xAC-0xA0]
                mov     R0, #0xAC
                mov     A, @R0
                mov     DPTR, #0x4072
                movx    @DPTR, A        ; MEM[0x4072] = MEM[0xAC] 
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x4073] = MEM[0xAB]
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x4074] = MEM[0xAA]
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x4075] = MEM[0xA0]

                ;WORD 7 Reserved for assignment by the CompactFlash Association
                mov     R0, #0x96
                mov     A, @R0
                mov     DPTR, #0x400E
                movx    @DPTR, A        ; MEM[0x400E] = MEM[0x96]
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x400F] = MEM[0x95]

                ;WORD 8 Reserved for assignment by the CompactFlash Association
                mov     R0, #0x98
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x400E] = MEM[0x98]
                dec     R0
                mov     A, @R0
                inc     DPTR
                movx    @DPTR, A        ; MEM[0x400E] = MEM[0x97]

                ; WORD 59 - Current setting for number of sectors that shall be transferred per interrupt on R/W Multiple command
                mov     R0, #0x7E
                mov     A, @R0
                mov     DPTR, #0x4076
                movx    @DPTR, A        ; MEM[0x4076] = MEM[0x7E]
                inc     DPTR
                mov     A, #1
                movx    @DPTR, A        ; MEM[0x4076] = 0x01 // 1 = Multiple sector setting is valid

                ; WORD 47 - Maximum number of sectors that shall be transferred per interrupt on READ/WRITE MULTIPLE commands
                mov     DPTR, #0x405E
                movx    @DPTR, A        ; MEM[0x405E] = 0x01 

                ; WORD 63 - DMA MODE FLAGS
                mov     DPTR, #0x407E
                mov     A, #7
                movx    @DPTR, A        ; MEM[0x407E] = 7  (LOW BYTE)
                
                ; WORD 88 - DMA MODE SELECTED - LOW BYTE
                mov     DPTR, #0x3D2E
                clr     A
                movc    A, @A+DPTR
                mov     DPTR, #0x40B0
                movx    @DPTR, A        ; MEM[0x40B0] = MEM[0x3D2E]

                jnb     RAM_2B.6, code_23CE
                mov     R3, #0x02       ; BUFFER SIZE (@ 0x5C00)
                mov     R5, #0x0D       ; OFFSET - 0x0D = GET CURR SELECTED DMA MODE
                mov     R7, #0xA0       ; CHIP ADDRESS
                lcall   code_30CD       ; READ EEPROM
                jnc     code_23CE       ; IF C==0 (CAN'T READ), EXIT

                mov     DPTR, #0x5C00
                movx    A, @DPTR
                cjne    A, #0x99, code_23CE ; CHECK IF MEM[0x5C00]!=0x99 THEN EXIT
                inc     DPTR
                movx    A, @DPTR
                mov     DPTR, #0x40B0   
                movx    @DPTR, A        ; MEM[0x40B0] = MEM[0x5C01] 

                ; WORD 63 - DMA MODE FLAGS cont.
code_23CE:
                jnb     RAM_2A.1, code_23EB
                mov     DPTR, #0x407F
                clr     A
                movx    @DPTR, A        ; MEM[0x407F] = 0 (high BYTE of WORD 63)

                ; WORD 88 - DMA MODE SELECTED - HI BYTE
                mov     R0, #0x99
                mov     A, @R0
                mov     R7, A
                mov     A, #1
                mov     R0, RAM_7
                inc     R0
                sjmp    code_23E3

code_23E1:      ; LOOP - SHIFT LETF RAM[0x99] so many by RAM_7 bits
                clr     C
                rlc     A
code_23E3:
                djnz    R0, code_23E1   ; WAIT LOOP

                ; 
                mov     DPTR, #0x40B1
                movx    @DPTR, A

                sjmp    code_2420
; ---------------------------------------------------------------------------

code_23EB:
                mov     R0, #0x99
                mov     A, @R0
                setb    C
                subb    A, #2
                jnc     code_2416
                jnb     RAM_27.4, code_240B
                mov     A, @R0
                mov     R7, A
                mov     A, #1
                mov     R6, #0
                mov     R0, RAM_7
                inc     R0
                sjmp    code_2406
; ---------------------------------------------------------------------------

code_2401:
                clr     C
                rlc     A
                xch     A, R6
                rlc     A
                xch     A, R6

code_2406:
                djnz    R0, code_2401
                mov     R7, A
                sjmp    code_240F
; ---------------------------------------------------------------------------

code_240B:
                mov     R6, #0
                mov     R7, #0

code_240F:
                mov     DPTR, #0x407F
                mov     A, R7
                movx    @DPTR, A
                sjmp    code_241B
; ---------------------------------------------------------------------------

code_2416:
                mov     DPTR, #0x407F
                clr     A
                movx    @DPTR, A

code_241B:
                mov     DPTR, #0x40B1
                clr     A
                movx    @DPTR, A

code_2420:
                jnb     RAM_29.1, code_242C
                mov     DPTR, #0x40AA
                movx    A, @DPTR
                orl     A, #1
                movx    @DPTR, A
                sjmp    code_2433
; ---------------------------------------------------------------------------

code_242C:
                mov     DPTR, #0x40AA
                movx    A, @DPTR
                anl     A, #0xFE
                movx    @DPTR, A

code_2433:
                mov     R0, #0xA3
                mov     A, @R0
                clr     C
                subb    A, #5
                jc      code_244E
                mov     A, @R0
                cjne    A, #6, code_2443
                mov     R7, #0x80
                sjmp    code_2445
; ---------------------------------------------------------------------------

code_2443:
                mov     R7, #0x40 ; '@'

code_2445:
                mov     A, R7
                orl     A, #0x12
                mov     DPTR, #0x4146
                movx    @DPTR, A
                sjmp    code_2454
; ---------------------------------------------------------------------------

code_244E:
                mov     DPTR, #0x4146
                mov     A, #0x12
                movx    @DPTR, A

code_2454:
                jb      RAM_2A.1, code_2470
                mov     R0, #0x99
                mov     A, @R0
                setb    C
                subb    A, #2
                jc      code_2470
                mov     A, @R0
                cjne    A, #4, code_2467
                mov     R7, #0x40 ; '@'
                sjmp    code_2469
; ---------------------------------------------------------------------------

code_2467:
                mov     R7, #0x20 ; ' '

code_2469:
                mov     DPTR, #0x4147
                mov     A, R7
                movx    @DPTR, A
                sjmp    code_2475
; ---------------------------------------------------------------------------

code_2470:
                mov     DPTR, #0x4147
                clr     A
                movx    @DPTR, A

code_2475:
                jnb     RAM_2D.3, code_247B
                ljmp    code_24FA
; ---------------------------------------------------------------------------

code_247B:
                mov     DPTR, #0x40A0
                clr     A
                movx    @DPTR, A
                inc     DPTR
                movx    @DPTR, A
                inc     DPTR
                movx    @DPTR, A
                inc     DPTR
                movx    @DPTR, A
                mov     DPTR, #0x40B1
                movx    @DPTR, A
                mov     DPTR, #0x40B0
                movx    @DPTR, A
                mov     DPTR, #0x406A
                mov     A, #3
                movx    @DPTR, A
                mov     DPTR, #0x4140
                mov     A, #0xF4
                movx    @DPTR, A
                inc     DPTR
                mov     A, #0x81
                movx    @DPTR, A
                mov     DPTR, #0x4148
                mov     A, #0x1B
                movx    @DPTR, A
                push    DPH             ; Data Pointer, High Byte
                push    DPL             ; Data Pointer, Low Byte
                movx    A, @DPTR
                mov     R7, A
                mov     DPTR, #0x3D2F
                clr     A
                movc    A, @A+DPTR
                mov     R6, A
                swap    A
                rlc     A
                rlc     A
                anl     A, #0xC0
                mov     R6, A
                mov     A, R7
                orl     A, R6
                pop     DPL             ; Data Pointer, Low Byte
                pop     DPH             ; Data Pointer, High Byte
                movx    @DPTR, A
                mov     DPTR, #0x3D2F
                clr     A
                movc    A, @A+DPTR
                mov     R7, A
                rrc     A
                rrc     A
                anl     A, #0x3F
                mov     DPTR, #0x4149
                movx    @DPTR, A
                push    DPH             ; Data Pointer, High Byte
                push    DPL             ; Data Pointer, Low Byte
                movx    A, @DPTR
                mov     R7, A
                mov     DPTR, #0x3D2F
                clr     A
                movc    A, @A+DPTR
                mov     R6, A
                add     A, ACC          ; Accumulator
                mov     R6, A
                mov     A, R7
                orl     A, R6
                pop     DPL             ; Data Pointer, Low Byte
                pop     DPH             ; Data Pointer, High Byte
                movx    @DPTR, A
                mov     DPTR, #0x4149
                movx    A, @DPTR
                orl     A, #0x80
                movx    @DPTR, A
                jnb     RAM_2A.1, code_24FA
                mov     R7, #0x10
                lcall   code_57E
                movx    A, @DPTR
                mov     R7, A
                mov     A, RESERVED00A5 ; RESERVED
                anl     A, #0x70
                mov     R6, A
                mov     A, R7
                orl     A, R6
                movx    @DPTR, A

code_24FA:
                jnb     RAM_2D.3, code_2531
                mov     DPTR, #0x3D2C
                clr     A
                movc    A, @A+DPTR
                jz      code_2531
                mov     DPTR, #0x3D2D
                clr     A
                movc    A, @A+DPTR
                cjne    A, #3, code_2514
                mov     DPTR, #0x4098
                mov     A, #0xE
                movx    @DPTR, A
                sjmp    code_252A
; ---------------------------------------------------------------------------

code_2514:
                mov     DPTR, #0x3D2D
                clr     A
                movc    A, @A+DPTR
                cjne    A, #2, code_2524
                mov     DPTR, #0x4098
                mov     A, #6
                movx    @DPTR, A
                sjmp    code_252A
; ---------------------------------------------------------------------------

code_2524:
                mov     DPTR, #0x4098
                mov     A, #2
                movx    @DPTR, A

code_252A:
                mov     DPTR, #0x40BA
                clr     A
                movx    @DPTR, A
                inc     DPTR
                movx    @DPTR, A

code_2531:
                ret
; End of function code_2015
