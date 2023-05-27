global agregar_abb
global mostrar_abb

extern printf
extern malloc
extern free

section .data
viewNode db " { %d", 0
closeNode db "}", 0
emptyNode db " {}",0

section .text


agregoNodo:
    push edx
    push 12
    call malloc
    add esp, 4
    pop edx
    
    mov [eax], edx ;guardo valor
    mov ebx, 0
    mov [eax + 4], ebx 
    mov [eax + 8], ebx

    jmp finalizar

        
agregar_abb:
    push ebp ; guardo base point
    mov ebp, esp
    
    
    mov edx, [ebp + 12]
    mov ebx, [ebp + 8];puntero nodo
    cmp ebx, 0 ;
    
    je agregoNodo
    
    cmp edx, [ebx]
    JE finalizar
    JG mover_der
    jmp mover_izq
 
 
mover_izq:

    push edx
    mov eax, [ebx + 4];guardo nodo derecho para poder pushearlo
    
    push eax;pusheo nodo der
    call agregar_abb
    mov ebx, [ebp + 8];nodo actual
    mov [ebx + 4], eax
    
    mov eax,ebx
    add esp, 8 
    jmp finalizar
    
    
mover_der:

    push edx
    mov eax, [ebx + 8]
    push eax;pusheo nodo dererecho
    
    call agregar_abb; en eax
    
    mov ebx, [ebp + 8];puntero nodo actual
    mov [ebx + 8], eax
    mov eax,ebx
    add esp, 8 
    jmp finalizar
    
      
mostrar_abb:
    push ebp
    mov ebp, esp
    mov ebx, [ebp + 8]
    
    cmp ebx, 0
    je mostrarVacio
    
    call mostrarInicioNodo
    
    push ebx;guardo nodo actual
    mov eax, [ebx +4];paso por parametro el nodo izq
    push eax
    
    call mostrar_abb
    add esp, 4
    pop ebx
    mov eax, [ebx +8];paso por parametro el nodo derecho
    push eax
    call mostrar_abb
    call mostrarFinNodo
    jmp finalizar

mostrarVacio:
    push eax
    push ebx
    push edx
    push emptyNode
    call printf
    add esp, 4
    pop edx
    pop ebx
    pop edx
    jmp finalizar

mostrarInicioNodo:
    push eax
    push ebx
    push edx
    mov eax, [ebx]
    push eax
    push viewNode
    call printf
    add esp, 8
    pop edx
    pop ebx
    pop edx
    ret

mostrarFinNodo:
    push eax
    push ebx
    push edx
    push closeNode
    call printf
    add esp, 4
    pop edx
    pop ebx
    pop edx
    ret
    
finalizar:
    
    mov esp, ebp
    pop ebp
    ret 
    
    
    


