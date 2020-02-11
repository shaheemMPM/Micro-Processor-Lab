    SECTION .data
       message1: db "Enter the first number: ", 0
       message2: db "Enter the second number: ", 0
       message3: db "Result of Addition : ", 0
       message4: db "Result of Subtraction : ", 0
       message5: db "Result of Multiplication : ", 0
       message6: db "Result of Division : ", 0
       formatin: db "%d", 0
       formatout: db "%d", 10, 0                          ; newline, nul terminator
       integer1: times 4 db 0                             ; 32-bits integer = 4 bytes
       integer2: times 4 db 0
    SECTION .text
       global main
       extern scanf
       extern printf
     
    main:
     
       push eax                                           ; save registers
       push ecx
       push message1
       call printf
     
       add esp, 4                                         ; remove parameters
       push integer1                                      ; address of integer1 (second parameter)
       push formatin                                      ; arguments are right to left (first parameter)
       call scanf
     
       add esp, 8                                         ; remove parameters
       push message2
       call printf
     
       add esp, 4                                         ; remove parameters
       push integer2                                      ; address of integer2
       push formatin                                      ; arguments are right to left
       call scanf
     
       add esp, 8                                         ; remove parameters
       push message3
       call printf
     
       mov eax, dword [integer1]
       mov ecx, dword [integer2]
       add eax, ecx
     				                              ; add the values the addition
       add esp, 4
       push eax
       push formatout
       call printf                                        ; call printf to display the sum
     
       add esp, 4
       push message4
       call printf
       
       mov eax, dword [integer1]
       mov ecx, dword [integer2]
       sub eax, ecx
       
       add esp, 4
       push eax
       push formatout
       call printf
       
       add esp, 4
       push message5
       call printf
       
       mov eax, dword [integer1]
       mov ecx, dword [integer2]
       mul ecx
       
       add esp, 4
       push eax
       push formatout
       call printf
       
       add esp, 4
       push message6
       call printf
       
       mov edx, 0
       mov eax, dword [integer1]
       mov ecx, dword [integer2]
       div ecx
       
       add esp, 4
       push eax
       push formatout
       call printf
     
       add esp, 8                                         ; remove parameters
       pop ecx
       pop ebx                                            ; restore registers in reverse order
       mov eax, 0                                         ; no error
       ret
