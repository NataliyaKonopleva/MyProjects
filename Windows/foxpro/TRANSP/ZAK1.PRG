******************** zak1.prg ***********
do nach
hide wind all
close all
*****************
defi window prosm from 3,3 to 20,70 titl "��⠩� � ����������" shadow color b/w,b/r
defi window vvodm from 3,3 to 20,70 titl "���������" shadow color n/w,b/r
defi window vvod  from 10,1 to 15,79 titl "���� ������" shadow color w/b,r/w
defi window soob  from 22,3 to 24, 73 color w/r
defi window tem from 3,3 to 18,70 titl "�롥p�� ⥬�" double color w/rb,r/w
***************
set color to
@ 0,0,SROWS(),SCOLS() BOX '���������'
do proba
do zak
******************
procedure tem
set color to
clea
use tema
*cti wind tem
brow nomenu noedit window tem
deac wind tem
retu
procedure zak
*********************
*   IN- ����. ������
*   I - �������� ������
*   aaa=0 - 䠩� ����
sele 1
use zak
*if .not. file("zak1.ntx")
* inde on date to zak1
*endif
do prosm
retu
***************************************************
procedure  prosm
ekr=""
ud=0
 save screen to ekr
sele 1
go top
set color to r+/n
clea
*@ 0,0 clea to 0,79
@ 0,10 say "H����p� ��ଠ⨢�� ���㬥��� ��� ���ᨮ����� �⤥�����"
@ 24,0 say "ESC - ��室  Enter - ���४�஢��  F2 - ��⠢��  F3 - 㤠�����   F4 - ��ᬮ��"
set color to n/bg
@ 1,0  clea to 22,79
@ 1, 0 SAY '������������������������������������������������������������������������������ͻ'
@ 2, 0 SAY '�   N � ���   �                       ������������                            �'
@ 3, 0 SAY '�     �        �                                                               �'
@ 4, 0 SAY '������������������������������������������������������������������������������͹'
y=0
do while y#27 .and.  y#13                 & 1                                        1
I=5
DO WHILE I<22
@ i ,0 SAY '�     �        �                                                               �'
I=I+1
ENDDO
@ 22,0 SAY "������������������������������������������������������������������������������ͼ"
set color to n/bg,N/W
i=5
do while .not. eof() .and. i<22
do stroka
i=i+1
skip
enddo
in=i-1
skip -(in-5)-1
i=5
dO WHILE .T.                          && 2                                       &&3
set color to n+/w,r/w
 do stroka
y=0
 do while y=0
  y=inkey()
 enddo
set color to n/bg
  do stroka
  do case
   case y=27       &&.or. y=13
     kkk="  "
     exit
   case y=-1       && ����
   z=recno()
   acti window vvod
   nom_=1
   data_=ctod("  .  .  ")
   name_=space(60)
   @ 2,1 get nom_ pict "999"
   @ 2,7 get data_
   @ 2,16 get name_
   read
   if readkey()#12 .and. readkey()#262
   APPEND blank
   repl nom with nom_,data with data_,name with name_
   acti wind soob
   @ 0,6 say "��室 c c�堭����� - CTRL+W, ��� ��p������ - ESC"
   set window of memo to vvodm
   MODI MEMO soderg
   close  memo soderg
   deact window vvodm
   deact window soob
   go z
   skip -(i-5+1)
   endi
   deact window vvod
   exit
    case y=13
  if .not. eof()
  @ i, 1  get nom  PICT "999"
  @ i, 7  get data
  @ i, 16 get name
   read
     endif
  case y=-3
   acti wind soob
   @ 0,6 say "��室 c c��p������� - CTRL+W, ��� ��p������ - ESC"
acti window prosm
SET WINDOW OF MEMO TO PROSM
MODI memo soderg
close memo soderg
deact window prosm
deact window soob
case y=-6
 g=0
 endcase
enddo                                   && 2
enddo                                   && 1
y=0
if ud=1
 sele 1
 set color to r+*/n
 @ 23,0 clea to 24,78
 @ 24,20 say " �������� ������� ! ���� 㤠����� ����ᥩ "
 pack
set color to
endif
set color to n/bg
 restore scre from ekr
return
**************************
procedure stroka
  @ i, 1 say nom PICT "999"
  @ i, 7 say data
  @ i, 16 say name
retu
