; multi-segment executable file template.
; Esercizio 2 somma di 10+20 salvati un due variabili Num1 e Num2 e risultato salvato nelle variabili Ris
data segment
    ; add your data here!
    Num1 DW 10h
    Num2 DW 20h
    Ris  DW  0h
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
MOV AX,data
MOV DS,AX
MOV AX,Num1
MOV BX,Num2

ends

end start ; set entry point and stop the assembler.
