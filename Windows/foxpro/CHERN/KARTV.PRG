* ********************   kartv.prg **************  12.01.95
*      �믫��� �p�����栬
************************************

set talk off
set proce to kartv
do chern
procedure chern
close all
set date brit
udal=0
vniz=0
SELE 4
USE chernv
t= 3
if .not. file("chernv.ndx")
  inde on delo to chernv
endif
set index to chernv
sele 1
use chern
sele 4
go top
set color to r+/n
clea
y=0
@ 0, 0 SAY '������������������������������������������������������������������ͻ '
@ 1, 0 SAY '� N   �           �������,���, ����⢮        ��������- � ���    � '
@ 2, 0 SAY '����� �                                        � �����   � p������� '
@ 3, 0 SAY '������������������������������������������������������������������͹ '
@ 4,0 SAY  "�     �                                        �         �         � "
@ 5 ,0 SAY "������������������������������������������������������������������ͼ "
if eof()
   @ 12,25 say " ����� ���������� "
  wait ""
  retu
endif
@ 3, t SAY '���������������������������������������������������������������������ͻ'
@ 4, t SAY '� ���   ��p������ �믫.������㬬�   ���.ᥬ� ������:   ������. �1-���'
@ 5, t SAY '�        �    �         ��.� ����-p�         �         ������  �2-���'
@ 6, t SAY '���������������������������������������������������������������������͹'
set color to r/w
@ 24,0
@ 24,0 SAY "ESC - ��室 F2 - 㤠�����  +Enter - �롮� ��ப�  PgUp,PgDn -��࠭ �����,����"
do while y#27
@ 10,0 clea to 23,79
 d=delo
 inv=kodinv+space(7)
@ 4,0 SAY  "�"+str(delo,5)+"�"+Fam+"�"+INV+"� "+dtoc(datar)+"�"
set color to bg/n
i=10
sele 4
seek d
do while delo=d .and. .not. eof() .and. i<=21
@ i  ,t SAY  "�        �    �         �   �        �         �         �       �    �"
@ i+1,t SAY  "�        �    �         �   �        �         �         �       �    �"
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "9999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXX"
i=i+2
skip
enddo
@ i ,0 SAY "����������������������������������������������������������������������������ͼ"
if eof()
y=0
 do while y=0
  y=inkey()
 enddo
  if y= -1    && ����
@ i, t   SAY '�        �    �         �   �        �         �         �       �    �'
@ i+1 ,0 SAY "��������������������������������������������������������ͼ"
   do nov
   loop
  endif
  else
  sele 1
   skip
   loop
  endif
in=i-2
if vniz=1
 go z
 vniz=0
else
seek d
endif
i=10
dO WHILE .T.                                                                &&3
set color to r/w
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "9999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXX"
y=0
do while y=0
y=inkey()
enddo
set color to bg/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "9999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXX"
  do case
   case y=27
if udal=1
pack
endif
     return
   case y=-1                                 && 㤫.
      udl=1
      dele
      @ 10,0 CLEA TO 23,79
      if i=10
        SKIP
      else
        SKIP 10-I
      endif
      if eof()      &&   .or. kodm#km
        skip -1      &&  km=kodm
        if bof()
          pack
          retu
         else
         d=delo
         seek d
      endif
      endif
      I=10
    EXIT
   case y=5 .and. i>10 .and. .not. bof()     && �����
     skip -1
      if delo#d
       seek d
       loop
      endif
     i=i-2
   case y=24                 && ����
     skip
      if eof()
        skip -1
        loop
      endi
    if i=in
     z=recno()
     vniz=1
     exit
    endif
     i=i+2
   CASE Y=3 .or. y=18          && PgDn ����   ���室 � ������
   j=iif(y=3,1,-1)
   do while delo=d .and. .not. eof() .and. .not. bof()
    skip j
   enddo
    if eof()
     skip -1
    endif
    if bof()
     go top
    endif
   d=delo
    seek d
    sele 1
    exit
   case y=13 .and. .not. eof()         && �롮�
  @ i,t+1  get datav
  @ i,t+10 get srok pict "9999"
  @ i,t+15 get naim pict "XXXXXXXXX"
  @ I,t+26 get kols  PICT "99"
  @ I,t+29 get sum1  PICT "9999999"
  @ I,t+38 get sum2  PICT "9999999"
  @ I,t+48 get sum1+sum2  PICT "9999999"
  @ I,t+58 get PN  PICT "9999999"
  @ I,t+66 get kas  PICT "XXX"
read
ee=summap+summas
@ i,65 get ee pict "99999999.99"
            READ
endcase
enddo
enddo
return
procedure nov
appe blank
repl delo with d
@ i, 2 get kodv
read
do case
 case kodv=1
  na="����.�� ���"
 case kodv=2
  na="���.������ "
 case kodv=3
  na="�p����     "
endcase
repl naim with na
@ i, 6 get naim
@ i,22 get per pict "9999"
@ i,36 get kols pict "9"
@ i,41 get summap pict "99999999.99"
@ i,54 get summas pict "99999999.99"
read
ee=summap+summas
@ i,65 get ee pict "99999999.99"
*@ i,65 get summap+summas pict "99999999.99"
            READ
retu
