INCLUDE 'emu8086.inc'  

    org 100h    
    
    
    




 
;User is prompted with the possibility to shut or open the door
u29:
PUTC 13 ; linie noua
PUTC 10 
PRINTN 'Urmeaza sa desenezi o casa. Apasa enter pentru a continua '  

PUTC 13   
PUTC 10
CALL scan_num


   
 

mov ax,0600h   
mov bh,07      
mov cx,0000    ;rand=00,coloana=00
mov dx,184fh   ;rand=18h, coloana=4fh
int 10h        
mov ah,00      
mov al,13h     
int 10h            


;Incepe desenarea casei 


; linie orizontala sus
mov cx,130               ; incepe la coloana 130
mov dx,75                ;linia=75
los: mov ah,0ch          ;desenarea liniei
mov al,07h               ;pixels=light grey
int 10h                 
inc cx                   ;incrementare linie orizontala
cmp cx,216               ;deseneaza pana la coloana 216
jnz los 


; linie orizontala jos
mov cx,130
mov dx,125
loj: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,216
jnz loj  


; linie verticala stanga
mov cx,130
mov dx,75
lvs: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,125
jnz lvs 




; linie verticala dreapta 
mov cx,216
mov dx,75
lvd: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,126
jnz lvd



; linie acoperis stanga
mov cx,130
mov dx,75
las: mov ah,0ch
mov al,88h
int 10h
inc cx
dec dx
cmp cx,173
cmp dx,32   
jnz las  



; linie acoperis dreapta
mov cx,173
mov dx,32
lad: mov ah,0ch
mov al,88h
int 10h
inc cx
inc dx
cmp cx,216
cmp dx,75
jnz lad   
      





; 3d linie spate sus
mov cx,173
mov dx,32
lss: mov ah,0ch
mov al,08h
int 10h
inc cx
cmp cx,259
jnz lss   


; 3d spate linie dreapta
mov cx,259
mov dx,32
sld: mov ah,0ch
mov al,08h
int 10h
inc dx
cmp dx,85
jnz sld
            
            
            
;3d linie spate jos interior
mov cx,216
mov dx,126
lsji: mov ah,0ch
mov al,08h
int 10h
inc cx
dec dx
cmp cx,259
jnz lsji            
            


       
;3d linie spate sus interior
mov cx,216
mov dx,75 
lssi: mov ah,0ch
mov al,08h
int 10h
inc cx
dec dx
cmp cx,259
jnz lssi    

 
 

 
 

; Ferestre
; fereastra stanga linie1 
mov cx,136
mov dx,105
fsl1: mov ah,0ch
mov al,07h
int 10h
dec dx
cmp dx,85
jnz fsl1     

; fereastra stanga linie2
mov cx,146
mov dx,85
fsl2: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,105
jnz fsl2


;ferestra stanga linie3
mov cx,156
mov dx,105
fsl3: mov ah,0ch
mov al,07h
int 10h
dec dx
cmp dx,85
jnz fsl3   


; fereastra dreapta linie verticala 1
mov cx,190
mov dx,85
fdlv1: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,105
jnz fdlv1


; fereastra dreapta linie verticala 2
mov cx,200
mov dx,85
fdlv2: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,105
jnz fdlv2


; fereastra stanga linie verticala 3
mov cx,210
mov dx,85
fslv3: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,105
jnz fslv3



; linie orizontala fereastra 1
mov cx,136
mov dx,85
lof1: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,156
jnz lof1
mov cx,190 ;continuare cu coloana 2=190
mov dx,85
lof2: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,210
jnz lof2



; linie orizontala 2 fereastra 
mov cx,136
mov dx,95
lo2f: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,156
jnz lo2f
mov cx,190
mov dx,95
lo2fb: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,210
jnz lo2fb


; linie orizontala 3 fereastra
mov cx,136
mov dx,105
lo3f: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,157
jnz lo3f
mov cx,190
mov dx,105
lo3fb: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,211
jnz lo3fb
;gata fereastraaaa


   
   
   



; Usa
; linie usa stanga
mov cx,164
mov dx,125
hseLD: mov ah,0ch
mov al,07h
int 10h
dec dx
cmp dx,100
jnz hseLD
; linie usa dreapta
mov cx,182
mov dx,125
hseRD: mov ah,0ch
mov al,07h
int 10h
dec dx
cmp dx,100
jnz hseRD
; linie usa sus
mov cx,164
mov dx,100
hseTD: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,183
jnz hseTD
; gata usaaaaa 




; petic
mov cx,164
mov dx,126
pthLT: mov ah,0ch
mov al,0ch 
int 10h
dec cx
inc dx
cmp cx,174
cmp dx,176
jnz pthLT  


; petic dreapta
mov cx,182
mov dx,126
pthRT: mov ah,0ch
mov al,0ch
int 10h
dec cx
inc dx
cmp cx,192
cmp dx,176
jnz pthRT 



; asfalt sus
mov cx,1
mov dx,176
AS: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,316
jnz AS  



     
; asfalt jos
mov cx,1
mov dx,196
ASB: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,316
jnz ASB 
         
         

;sunet



MOV     DX,5          

MOV     BX,1            

MOV     AL, 10110110B    
OUT     43H, AL          

NEXT_FREQUENCY:          

MOV     AX, BX           

OUT     42H, AL          
MOV     AL, AH           
OUT     42H, AL         

IN      AL, 61H          
OR      AL, 00000011B    
OUT     61H, AL         
                        

MOV     CX, 100          
DELAY_LOOP:              
LOOP    DELAY_LOOP       

INC     BX              
                         

DEC     DX               

CMP     DX, 0            
JNZ     NEXT_FREQUENCY   

IN      AL,61H           
AND     AL,11111100B     
OUT     61H,AL           



     
      
       
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS