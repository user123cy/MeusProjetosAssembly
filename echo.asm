section .data
    prompt db 'Digita algo: '
    p_len equ $ - prompt

section .bss
    ; reserva um espaço na memória pra guardar o que digitar
    buffer resb 64          ; Reserva 64 bytes (espaço para 64 letras)

section .text
    global _start

_start:
    ; Escreve o prompt na tela
    mov eax, 4              ; sys_write
    mov ebx, 1              ; tela
    mov ecx, prompt
    mov edx, p_len
    int 0x80

    ; Lê oque digitar
    mov eax, 3              ; sys_read (comando pra ler teclado)
    mov ebx, 0              ; 0 = teclado (stdin)
    mov ecx, buffer         ; Onde vai guardar o que você digitar
    mov edx, 64             ; Limite de letras
    int 0x80

    ; Mostra o que foi guardado
    mov edx, eax            ; O sys_read devolve em EAX quantas letras você digitou
    mov eax, 4              ; sys_write
    mov ebx, 1              ; tela
    mov ecx, buffer         ; Pega o que tá guardado no buffer
    int 0x80

    ; Sair
    mov eax, 1
    xor ebx, ebx
    int 0x80
