;; NKT-NMD_CTCN01-B TEMPERATURE CONTROL PROJECT 8086

org 100h 
    ; --- 1. SUA LAI DIA CHI CHO DUNG PHAN CUNG ---
    CONTROL EQU 0006H    ; Dia chi thanh ghi dieu khien
    PORTA   EQU 0000H    ; Port A (Noi Motor) - Sua lai tu 0080H thanh 0000H
    PORTB   EQU 0002H    ; Port B (Noi ADC)
    PORTC   EQU 0004H    ; Port C (Noi Nut nhan)

START:
    ; --- 2. THEM PHAN KHOI TAO 8255 (BAT BUOC) ---
    MOV DX, CONTROL
    ; Mode 0: Port A=Output, Port B=Input, Port C_Lower=Input, Port C_Upper=Output
    ; Ma: 10001001b = 89H
    MOV AL, 10001001b   
    OUT DX, AL
    ; ---------------------------------------------

inic1:              
    MOV DX, PORTC       ; Dung ten bien da sua (PORTC)
    IN AL, DX
    
    ; Logic nut bam (Active Low - Nhan la 0)
    CMP AL, 11111110b   ; Check bit 0
    JE stop1
    CMP AL, 11111101b   ; Check bit 1
    JE decision
    JMP inic1

decision:
    MOV DX, PORTB       ; Dung ten bien da sua (PORTB)
    IN AL, DX
    
    ; So sanh nhiet do
    CMP AL, 00010001b   ; 17 (Decimal) ~ 32 do
    JGE enfriar 
    CMP AL, 00001011b   ; 11 (Decimal) ~ 23 do
    JLE warm
    JMP stop

enfriar: 
    MOV DX, PORTA
    MOV AL, 11111110b   ; Bat bit 0 (Quay thuan)
    OUT DX, AL
    
    ; Delay giu cho ADC kip tho
    MOV CX, 500      
DELAY_LOOP1: 
    LOOP DELAY_LOOP1 

    JMP emergency

warm:
    MOV DX, PORTA
    MOV AL, 11111101b   ; Bat bit 1 (Quay nguoc/Suoi)
    OUT DX, AL
    
    MOV CX, 500      
DELAY_LOOP2: 
    LOOP DELAY_LOOP2 

    JMP emergency

stop:
    MOV DX, PORTA
    MOV AL, 11111111b   ; Tat het (Vi Active Low nen xuat 1 la tat, tuy mach cau H)
    OUT DX, AL 
    
    MOV CX, 500      
DELAY_LOOP3: 
    LOOP DELAY_LOOP3 

    ; Kiem tra lai nhiet do de tu dong bat lai
    MOV DX, PORTB
    IN AL, DX
    CMP AL, 00010001b 
    JGE enfriar 
    CMP AL, 00001011b 
    JLE warm
    JMP stop 
 
stop1:
    MOV DX, PORTA
    MOV AL, 11111111b   ; Tat dong co
    OUT DX, AL 

    NOP
    NOP
    NOP 

    ; Cho nut Start duoc bam lai
    MOV DX, PORTC
    IN AL, DX
    CMP AL, 11111110b 
    JE stop1
    CMP AL, 11111101b 
    JE inic1
    JMP stop1
 
emergency:              
    MOV DX, PORTC
    IN AL, DX
    CMP AL, 11111110b   ; Check nut Stop
    JE stop1
    CMP AL, 11111101b 
    JE inic1 
    JMP decision

RET