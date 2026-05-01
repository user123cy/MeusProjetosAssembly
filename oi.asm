section .data
    msg db 'Oi!', 0xa       ; Armazena a string e o caractere de nova linha (0xa)
    len equ $ - msg         ; Calcula o comprimento da string

section .text
    global _start

_start:
    ; Preparando os registradores para a chamada de sistema (sys_write)
    mov edx, len            ; Tamanho da mensagem em EDX
    mov ecx, msg            ; Endereço da mensagem em ECX
    mov ebx, 1              ; File descriptor 1 (saída padrão/tela) em EBX
    mov eax, 4              ; Número da syscall 4 (write) em EAX
    int 0x80                ; Interrupção para o kernel executar

    ; Preparando para fechar o programa (sys_exit)
    mov eax, 1              ; Número da syscall 1 (exit) em EAX
    xor ebx, ebx            ; Zera EBX (status de saída 0)
    int 0x80                ; Interrupção final
