; multi-segment executable file template.

data segment
    write1 db "scrivere la lunghezza della base del rettangolo...$"
    write2 db "scrivere la lunghezza dell'altezza del rettangolo...$"
    erroremsg db "qualcosa è andato storto, riprovare"
    
    base db 0h
    high db 0h
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
            
    lea dx, write1
    mov ah, 9
    int 21h
    call ReadNumber
    mov base,AL
    mov ax,0h
    
        
    lea dx, write2
    mov ah, 9
    int 21h
    call ReadNumber
    mov high,AL
    mov ax, 0h 
    
    mov CX,high
    mov DX,42h
    
    mostrarettangolo:
    
    call WriteRectangle
    loop mostrarettangolo
    
    
    
        
ends  

    ReadNumber proc near:
        jmp leggi
        errore:
        lea dx,erroremsg
        mov ah,9
        int 21h
        
        leggi:
        mov ah, 1
        int 21h
        
        cmp AL,30h
        jl errore
        cmp AL,39h
        jg errore
        sub AL,30h
        
        
        ret
    endp
    
    WriteRectangle proc near:
         
         mov BX,base
         
         scriviBase:
         MOV AH,02H
         int 21h
         dec BX
         cmp BX,0h
         
        
        ret
    endp
    


end start ; set entry point and stop the assembler.
