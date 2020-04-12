#make_bin#

#load_segment=ffffh#
#load_offset=0000h#

#cs=0000h#
#ip=0000h#

#ds=0000h#
#es=0000h#

#ss=0000h#
#sp=fffeh#

#ax=0000h#
#bx=0000h#
#cx=0000h#
#dx=0000h#
#si=0000h#
#di=0000h#
#bp=0000h#
    jmp     st1   
    db    1021 dup(0)
;main program          
    st1:      cli
;data allocations
    onek    db      0
    onev    db      0
    sine    db      0
    tria    db      0
    square  db      0
    hundred db      0
    ten     db      0
    count   dw      0
	tgadd 	db 		0
	tgmax 	db		0
	tgdiv 	dw 		0
	sqmax 	dw 		0
	list 	dw 		0
    list1 db 13 dup (0)
	list2 db 13 dup (0)
	list3 db 13 dup (0)
	list4 db 13 dup (0)
	list5 db 13 dup (0)
	list6 db 13 dup (0)
	list7 db 13 dup (0)
	list8 db 13 dup (0)
	list9 db 13 dup (0)
	list10 db 13 dup (0)
;intialize ds, es,ss to start of ram
    mov     ax,0200h
    mov     ds,ax
    mov     es,ax
    mov     ss,ax
    mov     sp,0fffeh    
    mov     ax,0
    mov     onev,al
    mov     onek,al
    mov     hundred,al
    mov     ten,al
    mov     sine,al
    mov     tria,al
    mov     square,al
    ;table for generating sine
    lea     di,list1
    mov     [di],128
    mov     [di+1],130
    mov     [di+2],132    
    mov     [di+3],133    
    mov     [di+4],134
    mov     [di+5],135
    mov     [di+6],136
    mov     [di+7],137
    mov     [di+8],138
    mov     [di+9],139
    mov     [di+10],140
    mov     [di+11],141
    mov     [di+12],141
	
	lea     di,list2
    mov     [di],128
    mov     [di+1],132
    mov     [di+2],136    
    mov     [di+3],139    
    mov     [di+4],142
    mov     [di+5],145
    mov     [di+6],147
    mov     [di+7],149
    mov     [di+8],151
    mov     [di+9],152
    mov     [di+10],153
    mov     [di+11],154
    mov     [di+12],155
	
	lea     di,list3
    mov     [di],128
    mov     [di+1],133
    mov     [di+2],138    
    mov     [di+3],143    
    mov     [di+4],147
    mov     [di+5],151
    mov     [di+6],155
    mov     [di+7],159
    mov     [di+8],162
    mov     [di+9],164
    mov     [di+10],166
    mov     [di+11],167
    mov     [di+12],167
	
	lea     di,list4
    mov     [di],128
    mov     [di+1],135
    mov     [di+2],141    
    mov     [di+3],147    
    mov     [di+4],153
    mov     [di+5],159
    mov     [di+6],164
    mov     [di+7],169
    mov     [di+8],173
    mov     [di+9],176
    mov     [di+10],178
    mov     [di+11],179
    mov     [di+12],179
	
	lea     di,list5
    mov     [di],128
    mov     [di+1],136
    mov     [di+2],144    
    mov     [di+3],152    
    mov     [di+4],159
    mov     [di+5],166
    mov     [di+6],173
    mov     [di+7],179
    mov     [di+8],184
    mov     [di+9],189
    mov     [di+10],191
    mov     [di+11],192
    mov     [di+12],192
	
	lea     di,list6
    mov     [di],128
    mov     [di+1],139
    mov     [di+2],148    
    mov     [di+3],157    
    mov     [di+4],166
    mov     [di+5],175
    mov     [di+6],182
    mov     [di+7],189
    mov     [di+8],194
    mov     [di+9],198
    mov     [di+10],202
    mov     [di+11],204
    mov     [di+12],204
	
	lea     di,list7
    mov     [di],128
    mov     [di+1],141
    mov     [di+2],154    
    mov     [di+3],166    
    mov     [di+4],178
    mov     [di+5],188
    mov     [di+6],199
    mov     [di+7],208
    mov     [di+8],214
    mov     [di+9],217
    mov     [di+10],219
    mov     [di+11],220
    mov     [di+12],220
	
	lea     di,list8
    mov     [di],128
    mov     [di+1],142
    mov     [di+2],155    
    mov     [di+3],168    
    mov     [di+4],181
    mov     [di+5],193
    mov     [di+6],205
    mov     [di+7],214
    mov     [di+8],221
    mov     [di+9],226
    mov     [di+10],229
    mov     [di+11],230
    mov     [di+12],230
	
	lea     di,list9
    mov     [di],128
    mov     [di+1],143
    mov     [di+2],158    
    mov     [di+3],172    
    mov     [di+4],186
    mov     [di+5],198
    mov     [di+6],210
    mov     [di+7],221
    mov     [di+8],231
    mov     [di+9],239
    mov     [di+10],242
    mov     [di+11],243
    mov     [di+12],243
	
	lea     di,list10
    mov     [di],128
    mov     [di+1],144
    mov     [di+2],160    
    mov     [di+3],176    
    mov     [di+4],191
    mov     [di+5],205
    mov     [di+6],218
    mov     [di+7],228
    mov     [di+8],238
    mov     [di+9],245
    mov     [di+10],251
    mov     [di+11],254
    mov     [di+12],255
;intialise 8255
    mov     al,10001010b
    out     06h,al    
;keypad interfacing    
x:	mov     al,00h
    out     04h,al
x1: in      al,04h
    and     al,070h
    cmp     al,70h
    jnz     x1
x2: in      al,04h
    and     al,070h
    cmp     al,70h
    je      x2  
    mov     al,06h
    mov     bl,al
    out     04h,al
    in      al,04h
    and     al,070h
    cmp     al,70h
    jnz     x3
    mov     al,05h
    mov     bl,al
    out     04h,al
    in      al,04h
    and     al,070h
    cmp     al,70h
    jnz     x3
    mov     al,03h
    mov     bl,al
    out     04h,al
    in      al,04h
    and     al,070h
    cmp     al,70h
    jz      x2
x3: or      al,bl
    cmp     al,66h ;sine
    jz      sin
    cmp     al,56h ; tri
    jz      tri
    cmp     al,36h;square
    jz      squ
    cmp     al,65h;1v
    jz      ov
    cmp     al,55h;1k
    jz      ok
    cmp     al,35h;100
    jz      hun
    cmp     al,33h;10
    jz      te
    cmp     al,63h;generate
    jz      end
;incrementing counts    
ov: inc     onev 
    jmp     x      
ok: inc     onek 
    jmp     x  
hun:inc hundred
    jmp     x 
te: inc ten
    jmp     x 
squ:inc square
    jmp     x
tri:inc tria 
    jmp     x
sin:inc sine
    jmp     x
end: 
    ;calculating count for 8254
    ;mov   ax,1000
    ;mul   tenk
    ;mov   bx,ax
    mov     bx,0
    mov     al,100
    mul     onek
    add     bx,ax
    mov     al,10
    mul     hundred
    add     bx,ax
    mov     al,ten
    mov     ah,00
    add     bx,ax
    ;bx  =  req freq/10
    mov     dx,0
    mov     ax,86A0h
	mov 	dx,1h
    div     bx
    shr     bx,1
    cmp     bx,dx
    jae  i
    inc  ax
    i:mov count,ax
    ;storing count
	mov     al,00h
    out     04h,al
    ;checking for generate to release    
k1: in      al,04h
    and     al,070h
    cmp     al,70h
    jnz     k1
    ;bx = actual count * sampling rate
    ;selecting wave form
    mov     al,sine
    cmp     al,00
    ja      sg
    mov     al,tria
    cmp     al,00
    ja      tg
    jmp     sqg              
sg: mov     dx,0
    mov     ax,count
    mov     bx,50
    div     bx
    shr     bx,1
    cmp     bx,dx
    ja      q1
    inc     ax
q1: mov     bx,ax
    mov     al,00110110b
	out     0eh,al
	mov     al,bl
	out     08h,al
	mov     al,bh
    out     08h,al
    jmp     sineg
tg: 
	mov	 	al,onev
	cmp 	al,1
	jne 	tp11
	mov 	tgadd,2
	mov 	tgmax,26d
	mov 	tgdiv,26d
	jmp 	tp20
tp11:
	cmp 	al,2
	jne 	tp12
	mov 	tgadd,3
	mov 	tgmax,51d
	mov 	tgdiv,34d
	jmp 	tp20
tp12:
	cmp 	al,3
	jne 	tp13
	mov 	tgadd,7
	mov 	tgmax,77d
	mov 	tgdiv,22d
	jmp 	tp20
tp13:
	cmp 	al,4
	jne 	tp14
	mov 	tgadd,6
	mov 	tgmax,102d
	mov 	tgdiv,34d
	jmp 	tp20
tp14:
	cmp 	al,5
	jne 	tp15
	mov 	tgadd,16
	mov 	tgmax,128d
	mov 	tgdiv,16d
	jmp 	tp20
tp15:
	cmp 	al,6
	jne 	tp16
	mov 	tgadd,19
	mov 	tgmax,152d
	mov 	tgdiv,16d
	jmp 	tp20
tp16:
	cmp 	al,7
	jne 	tp17
	mov 	tgadd,12
	mov 	tgmax,180d
	mov 	tgdiv,30d
	jmp 	tp20
tp17:
	cmp 	al,8
	jne 	tp18
	mov 	tgadd,12
	mov 	tgmax,204d
	mov 	tgdiv,34d
	jmp 	tp20
tp18:
	cmp 	al,9
	jne 	tp19
	mov 	tgadd,23
	mov 	tgmax,230d
	mov 	tgdiv,20d
	jmp 	tp20
tp19:
	cmp 	al,10
	jne 	tp20
	mov 	tgadd,17
	mov 	tgmax,255d
	mov 	tgdiv,30d
tp20:
	mov     dx,0
    mov     ax,count
    mov     bx,tgdiv
    div     bx
    shr     bx,1
    cmp     bx,dx
    ja      qr1
    inc     ax 
qr1:mov     bx,ax
    mov     al,00110110b
	out     0eh,al
	mov     al,bl
	out     08h,al
	mov     al,bh
    out     08h,al
    jmp     triag
sineg:
l5: in      al,04h
    and     al,070h
    cmp     al,70h
    jne     key
	mov al,onev
	cmp al,1
    jnz tp1
	lea si,list1
tp1:cmp al,2
	jnz tp2
	lea si,list2
tp2:cmp al,3
	jnz tp3
	lea si,list3
tp3:cmp al,4
	jnz tp4
	lea si,list4
tp4:cmp al,5
	jnz tp5
	lea si,list5
tp5:cmp al,6
	jnz tp6
	lea si,list6
tp6:cmp al,7
	jnz tp7
	lea si,list7
tp7:cmp al,8
	jnz tp8
	lea si,list8
tp8:cmp al,9
	jnz tp9
	lea si,list9
tp9:cmp al,10
	jnz tp10
	lea si,list10
tp10:

	mov list,si	
    mov     cl,13
l1:
    mov     al,[si]
    out     00,al               
p1: in      al,02h
    cmp     al,0
    jne     p1
p2: in      al,02h
    cmp     al,80h
    jne     p2 
J1: add     si,1
    loop    l1
    dec     si     
    mov     cl,12
l2: sub     si,1
    mov     al,[si]
    out     00,al              
p3: in      al,02h
    cmp     al,0
    jne     p3
p4: in      al,02h
    cmp     al,80h
    jne     p4
J2: loop    l2
    mov si,list
	;lea     si,list4
    mov     cl,12
    inc     si
l3: mov     al,[si]
    not     al
    out     00,al   
p5: in      al,02h
    cmp     al,0
    jne     p5
p6: in      al,02h
    cmp     al,80h
    jne     p6
J3: add     si,1
    loop    l3
    mov     cl,13
l4:
    sub     si,1
    mov     al,[si]
    not     al
    out     00,al 
p7: in      al,02h
    cmp     al,0
    jne     p7
p8: in      al,02h
    cmp     al,80h
    jne     p8
    loop    l4
    jmp     l5

triag:
	
    mov al,00h
g1:
    out     00,al
    mov     bl,al
    e1:     in al,02h
    cmp     al,0
    jne     e1
    e2:     in al,02h
    cmp     al,80h
    jne     e2
    in      al,04h
    and     al,070h
    cmp     al,70h
    jne      key
	
    mov     al,bl
    add     al,tgadd
    cmp     al,tgmax
    jnz     g1       
g2:
    out     00,al
    mov     bl,al
e3: in      al,02h
    cmp     al,0
    jne     e3
e4: in      al,02h
    cmp     al,80h
    jne     e4                 
    in      al,04h
    and     al,070h
    cmp     al,70h
    jne      key
    mov     al,bl 
    sub     al,tgadd
    cmp     al,00h
    jnz     g2
    jmp     g1
    
sqg:
	mov 	ax,0ffh
	mov 	bl,10d
	div 	bl
	shr 	bl,1
	cmp 	ah,bl
	jb 		tp21
	inc 	al
tp21:
	mov 	bl,onev
	mul 	bl
	mov 	sqmax,ax
	mov     bx,count
    ;shr     bx,1
    ;dec     bx
    mov     al,00110110b
	out     0eh,al
	mov     al,bl
	out     08h,al
	mov     al,bh
    out     08h,al
    mov     al,80h
    out     00,al
s:  mov     al,00h
    out     00,al
    in      al,04h
    and     al,070h
    cmp     al,70h
    jne      key
    ;call    delay
v1: in      al,02h
    cmp     al,0
    jne     v1
    in      al,04h
    and     al,070h
    cmp     al,70h
    jne      key 
    mov     ax,sqmax
    out     00,al
    in      al,04h
    and     al,070h
    cmp     al,70h
    jne      key 
    ;call    delay
v2: in      al,02h
    cmp     al,80h
    jne     v2
    in      al,04h
    and     al,070h
    cmp     al,70h
    jne      key          
    jmp     s
;checking for which waveform key is pressed
key:mov     al,06h
    mov     bl,al
    out     04h,al
    in      al,04h
    and     al,070h
    cmp     al,70h
    jnz     k3
    mov     al,05h
    mov     bl,al
    out     04h,al
    in      al,04h
    and     al,070h
    cmp     al,70h
    jnz     k3
    mov     al,03h
    mov     bl,al
    out     04h,al
    in      al,04h
    and     al,070h
    cmp     al,70h
    je      key
k3: or      al,bl
    cmp     al,66h ;sine
    jz      sg
    cmp     al,56h ; tri
    jz      tg
    cmp     al,36h;square
    jz      sqg
    jmp     key
;delay procedure
;delay proc
;v1: in      al,02h
;    cmp     al,0
;    jne     v1
;v2: in      al,02h
;    cmp     al,80h
;    jne     v2
ret
endp
keycheck proc
    in      al,04h
    and     al,070h
    cmp     al,70h
    jne      key 
ret
endp    
