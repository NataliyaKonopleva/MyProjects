****************  cher.prg ***********************
*do cher1
************
function inval
parameters grpinv
na=iif(grpinv>0 .and. grpinv<=3,str(grpinv,1)+"��.����","        ")
retu na
**************************
procedure cher1
set color to r+/n
@ 24,0
@ 24,0 say "ESC-��室 Enter-��pp.��p��� F2 -���� F3-㤠�.  F6-p��.�p��p  F7-��.�/� F8-���"

sele 1
use &chernv inde &cin
go top
set color to bg+/b
y=0
*********
t=3
set color to bg+/n
@ 2,t say "48/"+str(chern->delo,5)+"   "+chern->fam+inval(chern->grp)
@ 3, t SAY '������������������������������������������������������������������������ͻ'
@ 4, t SAY '� ���   ��p������ �믫.������㬬�   ���.ᥬ� ������:   ������. �1-��cᠺ'
@ 5, t SAY '�        �    �         ��.� ����-p�         �         ������  �2-�/�  �'
@ 6, t SAY '������������������������������������������������������������������������͹'
ddd=chern->delo
*********
seek ddd
if .not. found()
da="��"
@ 8 ,t+1 say  "�믫�� � �⮬ ���� �� �뫮. �㤥� �������� �����?(��/���)" get da
 read
@ 8, t SAY '�        �    �         �   �        �         �         �       �       �'
if da$"��,��,��,��" .and. readkey()#12 .and. readkey()#262
save scre to e
  r=2
  do cherv
rest scre from e
endif
  y=0
endif
sele 1
set filt to delo=chern->delo
go top
do while y#27 .and. y#13
i=7
do while .not. eof() .and. i<23
set color to bg+/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "99999.99"
  @ I,t+38 say sum2  PICT "999999.99"
  @ I,t+48 say sum1+sum2  PICT "999999.99"
* @ I,t+58 say PN  PICT "9999.99"
  @ I,t+66 say kas  PICT "XXXXX"
i=i+1
skip
enddo
if i<23
@ i, t SAY '�        �    �         �   �        �         �         �       �       �'
endif
do itog
in=i-1
skip -(in-6)
i=7
dO WHILE .T.                                                                &&3
set color to b+/w
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "99999.99"
  @ I,t+38 say sum2  PICT "999999.99"
  @ I,t+48 say sum1+sum2  PICT "999999.99"
 *@ I,t+58 say PN  PICT "99999.99"
  @ I,t+66 say kas  PICT "XXXXX"
y=0
 do while y=0
  y=inkey()
 enddo
 if y#13
set color to bg+/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "99999.99"
  @ I,t+38 say sum2  PICT "999999.99"
  @ I,t+48 say sum1+sum2  PICT "999999.99"
 *@ I,t+58 say PN  PICT "9999.99"
  @ I,t+66 say kas  PICT "XXXXX"
 endif
  do case
   case y=27
       KKK=0
     return
   case y=5 .and. i>7 .and. .not. bof()     && �����
     i=i-1
     skip -1
   case y=24                 && ����
    if i=in
Ii=7
DO WHILE iI<23
@ ii, t SAY '�        �    �         �   �        �         �         �       �       �'
Ii=Ii+1
ENDDO
     skip
      if eof()
        skip -(in-6)
      endi
    exit
    else
     i=i+1
     skip
    loop
   endif
   CASE Y=3                    && PgDn ����
    skip (in-i)+1
    i=7
    IF EOF()
    skip -(in-i)-1
    LOOP
    ENDIF
Ii=7
DO WHILE iI<23
@ ii, t SAY '�        �    �         �   �        �         �         �       �       �'
Ii=Ii+1
ENDDO
    EXIT
   CASE Y=-1   && ����
   set filt to
   save scre to e
   r=2
   do cherv
   rest scre from e
   sele 1
   set filt to delo=ddd
   go top
   y=0
    exit
   CASE Y=-2   &&.and. .not. bof()      && 㤠�����
 save scree to e
   da="��"
  @ 22,0 say "�������?" get da
   read
   if da="��" .and. readkey()#12 .and. readkey()#262

   dele
   pack
   go top
   if eof()
     retu
   endif
   endi
   rest scre from e
   exit
   CASE Y=18 .and. .not. bof()
    SKIP -19-(I-7)
    if bof()
      go top
    endif
    i=7
    EXIT
   case y=-5     &&  �p��p
    save scree to e
   do order with 1
    rest scre from e
   case y=-6
    save scre to e
   do order with 2
    rest scre from e

   case y=-7     &&  ����� �믫��
  set devi to prin
  c=5
  @ prow()+1,c+10 say "�믫��� �������権 �� ��⠭�� �� "+ltrim(str(gg1))+"�."
  @ prow()+1,c say  "48/"+str(chern->delo,5)+"   "+chern->fam+inval(chern->grp)
    go top
   i=prow()+1
@ i,   c SAY '��������������������������������������������������������ͻ'
@ i+1, c SAY '� ���   ��p������ �믫.������㬬�   ���.ᥬ� ������:   �'
@ i+2, c SAY '�        �    �         ��.� ����-p�         �         �'
@ i+3, c SAY '��������������������������������������������������������͹'
 i=prow()+1
do while .not. eof()
  @ i,c SAY '�        �    �         �   �        �         �         �'

  @ i,c+1  say datav
  @ i,c+10 say srok pict "9999"
  @ i,c+15 say naim pict "XXXXXXXXX"
  @ I,c+26 say kols  PICT "99"
  @ I,c+29 say sum1  PICT "99999.99"
  @ I,c+38 say sum2  PICT "999999.99"
  @ I,c+48 say sum1+sum2  PICT "999999.99"
  i=i+1
skip
enddo
 sum sum1,sum2 to s1,s2 for delo=ddd
@ I,c+1 say "�⮣�:"
  @ I,c+29 say s1  PICT "99999.99"
  @ I,c+38 say s2  PICT "999999.99"
  @ I,c+48 say s1+s2  PICT "999999.99"
  @ i, c SAY '�        �    �         �   �        �         �         �'
@ i+1, c SAY '��������������������������������������������������������ͼ'
@ prow()+1,0 say ""
set devi to scre
go top
exit


   case y=13 .and. .not. eof()         && �롮�
       kkk=IIF(R=1,chern->delo,lgot->KODv)
       kb=kkk
********************
  @ i,t+1  get datav
  @ i,t+10 get srok  pict "9999"
  @ i,t+15 get naim  pict "XXXXXXXXX"
  @ I,t+26 get kols  PICT "99"
  @ I,t+29 get sum1  PICT "99999.99"
  @ I,t+38 get sum2  PICT "999999.99"
  @ I,t+48 say sum1+sum2  PICT "999999.99"
 *@ I,t+58 get PN    PICT "9999.99"
  @ I,t+66 get kas   PICT "XXXXX"
********************
 read
        Y=0
 loop
endcase
enddo
enddo
return
***********************
procedure itog
 sum sum1,sum2,pn to s1,s2,s3 for delo=ddd
  set color to r+/n
  @ I,t+1 say "�⮣�:"
  @ I,t+29 say s1  PICT "99999.99"
  @ I,t+38 say s2  PICT "999999.99"
  @ I,t+48 say s1+s2  PICT "999999.99"
* @ I,t+58 say s3  PICT "999999.99"
  set color to bg+/n
retu
