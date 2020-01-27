        SECTION .data           ; data section
msg:    db "Hello World",10     ; the string to print, 10=cr
len:    equ $-msg               ; "$" means "here"
                                ; len is a value, not an address

        SECTION .text           ; code section
        global main             ; make label available to linker as invoked by gcc
        global _start           ; make label available to linker w/ default entry
main:                           ; standard  gcc  entry point
_start:

        mov    edx,len          ; arg3, length of string to print
        mov    ecx,msg          ; arg2, pointer to string
        mov    ebx,1
        mov    eax,4
        int    0x80

        mov    ebx,0
        mov    eax,1
        int    0x80
