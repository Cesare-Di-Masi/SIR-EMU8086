; multi-segment executable file template.

data segment
    
    writeOP db "premere un tasto fra 1 e 4 (sum, sub, mul, div)$"
    writeNum1 db "inserire il primo numero (premere invio per smettere di scrivere)$"
    writeNum2 db "inserire il secondo numero (premere invio per smettere di scrivere)$"
    Num1 DW 10h
    Num2 DW 10h
    Ris DW 0h
    Op DB 1h
    OldNum DW 0h
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    
    LEA DX,writeNum1
    MOV AH, 9
    INT 21h
    CALL ReadLine
    CALL NewLine
    
    MOV Num1,BX
    
    LEA DX,writeNum2
    MOV AH, 9
    INT 21h
    CALL ReadLine
    CALL NewLine
    
    MOV Num2,BX
    
    LEA DX, writeOP
    MOV AH, 9
    INT 21h
    MOV AH, 01h
    INT 21h
    SUB AL, 30h
    mov Op, AL  
    
    Call NewLine
    
    Mov AX,Num1
    Mov BX,Num2
    
    cmp Op,1h
    JE somma
    cmp Op,2h
    JE sottrazione
    cmp Op,3h
    JE moltiplicazione
    cmp Op,4h
    JE divisione 
    Jmp salta:
    
    
    somma:
    ADD AX,BX
    Jmp salta:
    
    sottrazione:
    SUB AX,BX
    Jmp salta:
    
    moltiplicazione: 
    MUL BX
    Jmp salta:
    
    divisione:
    DIV BX
    Jmp salta:  
    
    salta:
    MOV Ris,AX
    
    
            
    
ends

NewLine proc near:
    mov dl,0Ah
    MOV AH,02
    INT 21h
    MOV DL, 00h
    INT 21h
    ret
endp

ReadLine proc near:
    loopReadLine:
    MOV OldNum, 0h
    MOV AH, 01h
    INT 21h
    CMP AL,20h
    JE  exitReadline
    SUB AL, 30h
    MOV AH, 0h
    MOV OldNum,AX
    MOV AX, 10h
    MUL BX
    ADD BX,OldNum
    jmp loopReadLine
    
    exitReadLine: 
    RET
endp
    
    

end start ; set entry point and stop the assembler.
