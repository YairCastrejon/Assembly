MODEL small
   .STACK 100h

   ;----- Insert INCLUDE "filename" directives here
   ;----- Insert EQU and = equates here

   N  EQU  30
   CR  EQU 13
   LF  EQU  10
   
 INCLUDE procs.inc
 
       LOCALS
	   
   .DATA
      mens       db  'Hi community~',CR,LF,0
pal db 'press s',CR,LF,0
a db 'press a',CR,LF,0
b db 'don't press a',CR,LF,0
opc db 'press a to print a',CR,LF,0
opz db 'press b to print b',CR,LF,0
op1 db 'a',CR,LF,0
op2 db 'b',CR,LF,0
termino db 'end',CR,LF,0
	    letra    db  0
	  
   .CODE
    ;-----   Insert program, subrutine call, etc., here

    Principal  	PROC
				mov ax,@data 	;initialize DS
				mov ds,ax     	; from data segment(.DATA)

				call clrscr			
			    
	            mov  dx,offset mens
					
				call getch
                mov [letra],al

; IF-THEN

@@if: cmp [letra],'s'
jz @@then
jmp @@end_if
@@then: mov dx,offset pal
				 
     @@end_if:			call puts
call getch
                mov [letra],al

;aqui esta el IF-THEN-ELSE

@@if2: 	cmp[letra],'a'
jz @@then2
jmp @@else
@@then2: mov dx,offset a
jmp @@end_if2
@@else: mov dx,offset b
@@end_if2: call puts

;mini menu para case

mov dx,offset opc
call puts
mov dx,offset opz
call puts
call getch
mov [letra],al

; switch case

@@switch: cmp[letra],'a'
jz @@case_of1
jmp @@case_of2
@@case_of1: mov dx,offset op1
jmp @@end_switch
@@case_of2: mov dx,offset op2
@@end_switch: call puts

;FOR

mov cx,0
@@for: cmp cx,3
jb @@ciclo
jmp @@end_for
@@ciclo: mov dx,offset mens
call puts
inc cx
jmp @@for
@@end_for: mov dx,offset termino
call puts

;WHILE-DO

mov cx,0
@@while: cmp cx,3
jb @@do
jmp @@end_while
@@do: mov dx,offset mens
call puts
inc cx
jmp @@while
@@end_while: mov dx,offset termino
call puts

;DO-WHILE

mov cx,0
@@do1: mov dx,offset mens
call puts
inc cx
@@while1: cmp cx,3
jb @@do1
mov dx,offset termino
call puts
				
				call getch

				mov ah,04ch	     ; fin de programa
				mov al,0             ;
				int 21h              ; 

                ENDP

; incluir procedimientos	
; ejemplo:
; funcionX PROC ; < -- Indica a TASM el inicio del un procedimiento
;               ; 
;               ; < --- contenido del procedimiento
;           ret
;           ENDP; < -- Indica a TASM el fin del procedimiento



         END
; incluir procedimientos	
; ejemplo:
; funcionX PROC ; < -- Indica a TASM el inicio del un procedimiento
;               ; 
;               ; < --- contenido del procedimiento
;           ret
;           ENDP; < -- Indica a TASM el fin del procedimiento



         END
