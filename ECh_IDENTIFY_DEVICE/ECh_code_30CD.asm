; FUNCTION IS CALLED 16 TIMES
; 5 TIMES WHEN EXECUTING ATA ECh CMD
; @20E3   lcall   code_30CD(R3=0x03, R5=0x0A, R7=0xA0)  - R3=BUFF_LEN, R5=CMD 0Ah (GET STATUS OF SN, FW & MODEL)  , R7=0xA0 (ADDRESS?)
; @212C   lcall   code_30CD(R3=0x14, R5=0x10, R7=0xA0)  - R3=BUFF_LEN, R5=CMD 10h (GET SERIAL NUMBER)             , R7=0xA0 (ADDRESS?)
; @219D   lcall   code_30CD(R3=0x08, R5=0x24, R7=0xA0)  - R3=BUFF_LEN, R5=CMD 24h (GET FW REVISION)               , R7=0xA0 (ADDRESS?)
; @220E   lcall   code_30CD(R3=0x28, R5=0x2C, R7=0xA0)  - R3=BUFF_LEN, R5=CMD 2Ch (GET MODEL NAME)                , R7=0xA0 (ADDRESS?)
; @23BC   lcall   code_30CD(R3=0x02, R5=0x0D, R7=0xA0)  - R3=BUFF_LEN, R5=CMD 0Dh (GET CURR SELECTED DMA MODE)    , R7=0xA0 (ADDRESS?)

code_30CD:
                mov     RAM_76, R7
                mov     RAM_77, R5
                mov     RAM_78, R3
                lcall   code_3028       ; BEGIN TRANSM.

                mov     R7, RAM_76
                lcall   code_304C       ; BITBANG OUT R7 (0xA0)
                jnc     code_30E2       ; IF C==0 JUMP OUT
                lcall   code_3040       ; END TRANSM.
                clr     C
                ret


code_30E2: 
                mov     R7, RAM_77
                lcall   code_304C       ; BITBANG OUT R5 (COMMAND)
                jnc     code_30EE       ; IF C==0 JUMP OUT
                lcall   code_3040       ; END TRANSM.
                clr     C
                ret


code_30EE:
                lcall   code_3028       ; BEGIN TRANSM.
                mov     A, RAM_76
                orl     A, #1
                mov     R7, A
                lcall   code_304C       ; BITBANG R7+1
                jnc     code_3100       ; IF C==0 JUMP OUT
                lcall   code_3040       ; END TRANSM.
                clr     C
                ret


code_3100: 
                clr     A
                mov     RAM_79, A       ; COUNTER

code_3103:      ; LOOP START
                mov     A, RAM_79
                clr     C
                subb    A, RAM_78       ; IF COUNTER = ARG1...
                jnc     code_313D       ; ...JUMP OUT 
                lcall   code_308D       ; READ ONE BYTE to R7/RAM_7A
                clr     A
                add     A, RAM_79
                mov     DPL, A          ; Data Pointer, Low Byte   = COUNTER
                clr     A
                addc    A, #0x5C
                mov     DPH, A          ; Data Pointer, High Byte  = 0x5C
                mov     A, R7
                movx    @DPTR, A        ; STORE READ BYTE TO MEM[0x5C00 + COUNTER]
                mov     A, RAM_79
                add     A, #1
                mov     R7, A           ; R7 = COUNTER+1

                clr     A
                rlc     A
                mov     R6, A
                mov     R4, #0
                mov     A, R7
                cjne    A, RAM_78, code_3132    ;IF COUNTER+1 == ARG1 (LEN) THEN JUMP OUT
                mov     A, R4
                cjne    A, RAM_6, code_3132     ; IR RAM6==0 THEN JUMP OUT
                setb    RAM_2E.0                ; RAM[2E].0=1
                lcall   code_30BA               ; BITBANG RAM[2E].0 BIT (1)
                sjmp    code_3137
code_3132:
                clr     RAM_2E.0
                lcall   code_30BA               ; BITBANG RAM[2E].0 BIT (0)
code_3137:
                setb    P1_4            ; Port 1.4 = 1
                inc     RAM_79          ; COUNTER +=1
                sjmp    code_3103       ; CONTINUE LOOP


code_313D:
                lcall   code_3040       ; END TRANSM.
                setb    C
                ret
; End of function code_30CD





; --------------------------------------------------------
;           |<--4-->|<--3-->|<--4-->|
;           
; P1.5:     ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾\__________ CLK
; P1.4:     ‾‾‾‾‾‾‾‾‾\_______/‾‾‾‾‾‾‾‾  DAT
code_3028:
    setb    P1_4            ; Port 1.4 = 1
    setb    P1_5            ; Port 1.5 = 1
    mov     R7, #4
    lcall   code_2FD6       ; sleep(4)
    clr     P1_4            ; Port 1.4 = 0
    mov     R7, #3
    lcall   code_2FD6       ; sleep(3)
    clr     P1_5            ; Port 1.5 = 0
    mov     R7, #4
    lcall   code_2FD6       ; sleep(4)
    ret
; End of function code_3028


                
; --------------------------------------------------------
; P1.5 (clock):   ___|‾‾‾‾‾|___
; P1.4 (data):    ‾‾‾\_____/‾‾‾
;
code_3040:
    clr     P1_4            ; Port 1.4 = 0
    setb    P1_5            ; Port 1.5 = 1
    mov     R7, #3
    lcall   code_2FD6       ; sleep(3)
    setb    P1_4            ; Port 1.4 = 1
    ret




; ---------------------------------------------------------------------------
code_30BA:
    mov     C, RAM_2E.0
    mov     P1_4, C         ; Port 1.4 = RAM[2E].0
    setb    P1_5            ; Port 1.5 = 1
    mov     R7, #3
    lcall   code_2FD6       ; sleep(3)
    clr     P1_5            ; Port 1.5 = 0
    mov     R7, #3
    lcall   code_2FD6       ; sleep(3)
    ret


; ---------------------------------------------------------------------------
; reads exactly one byte (8 bits) from the data line, MSB-first
; synchronized by a software-generated clock on P1.5.
code_308D:
                clr     A
                mov     RAM_7A, A       ; RESULTING BYTE
                mov     RAM_7B, A       ; COUNTER

code_3092:
                mov     A, RAM_7B
                clr     C
                subb    A, #8
                jnc     code_30B7       ; IF COUNTER_LO == 8 THEN JUMP OUT...
                setb    P1_5            ; Port 1.5 = 1 
                mov     R7, #3
                lcall   code_2FD6       ; sleep(3)
                mov     A, RAM_7A       ; \
                add     A, ACC          ;  - RAM_7A = RAM_7A << 1
                mov     RAM_7A, A       ; /
                mov     C, P1_4         ; C = Port 1.4
                clr     A
                rlc     A
                orl     RAM_7A, A
                clr     P1_5            ; Port 1.5 = 0
                mov     R7, #4
                lcall   code_2FD6       ; sleep(4)
                inc     RAM_7B          ; COUNTER += 1
                sjmp    code_3092       ; CONTINUE LOOP

code_30B7:
                mov     R7, RAM_7A
                ret



; --------------------------------------------------------
; ARGUMENTS: R7
; RESULT - CARRY FLAG
code_304C:
                mov     RAM_7A, R7


                ; clocks out a byte, bit by bit (MSB first)
                ; using two port pins (P1.4 data + P1.5 clock)
                clr     A
                mov     RAM_7B, A       ; COUNTER
code_3051:
                mov     A, RAM_7B
                clr     C
                subb    A, #8           
                jnc     code_3076       ; IF COUNTER==8 JUMP OUT...

                mov     A, RAM_7A
                jnb     ACC7, code_3061 ; JUMP IF ACC.7==0
                setb    P1_4            ; Port 1.4 = 1
                sjmp    code_3063

code_3061:
                clr     P1_4            ; Port 1.4 = 0

code_3063:      
                mov     A, RAM_7A       ; \
                add     A, ACC          ; RAM_7A = RAM_7A << 1; (doubling value is the same as shifting left)
                mov     RAM_7A, A       ; /

                setb    P1_5            ; Port 1.5 = 1
                mov     R7, #3
                lcall   code_2FD6       ; sleep(3)
                clr     P1_5            ; Port 1.5 = 0
                inc     RAM_7B          ; COUNTER += 1 
                sjmp    code_3051       ; CONTINUE LOOP 



code_3076:
                ; clock in 1 bit (a response / status bit?)
                setb    P1_4            ; Port 1.4 = 1
                clr     A
                mov     R7, A
                lcall   code_2FD6       ; sleep(0)
                setb    P1_5            ; Port 1.5 = 1
                mov     R7, #3
                lcall   code_2FD6       ; sleep(3)
                mov     C, P1_4         ; READ P1.4 TO CARRY FLAG
                mov     RAM_2E.0, C     ; STORE IT IN RAM[2E].0
                clr     P1_5            ; Port 1.5 = 0
                mov     C, RAM_2E.0     ; RETURN BIT VALUE IN CARRY
                ret



; ------ SLEEP FUNCTION --------------------------------
code_2FD6: 
                mov     RAM_7C, R7
code_2FD8:
                mov     R7, RAM_7C
                dec     RAM_7C
                mov     A, R7
                jnz     code_2FD8
                ret