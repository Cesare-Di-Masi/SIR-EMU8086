; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    Num1  db 1234h
    Num2  db 5678h
    Divid db 0008h 
    Divis db 0008h
    Quoz  db 0000h
    Resto db 0000h
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
    
    mov ax, Num1
    mov bx, Num2 
    mov 
    ; add your code here
    
    
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
