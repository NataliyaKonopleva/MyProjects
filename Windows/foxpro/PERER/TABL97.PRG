*         ������          6.04.94    *
set esca on
set talk off
set date germ
set color to
publ mess,sysd
mes1="������  ������� �����   ������  ���     ����    ����    ������� ��������"
Mes2="������� ������  �������"
mess=mes1+mes2
mes10="������  ������� �����   ������  ���     ����    ����    ������� ��������"
Mes20="������� ������  �������"
MES=MES10+MES20
sele 4
use bank
if .not. File("bank0.ntx")
 inde on codbnk to bank0
endif
use bank inde bank0
***************************
sele 1
*use d:\pens20n\1997\cart inde d:\pens20n\1997\cart0
use cart inde cart0

***************************
sele 2
use D:\pens1097\1997\cart inde d:\pens1097\1997\cart0
publ sdat
sd=date()
sdat=substr(dtoc(sd),1,6)+str(year(sd),4)+" �."
*********************************************
sele 1
do while .t.                   &&1
clea
set color to r/w,n/w
@ 23,1 clea to 23,78
@ 23,2 say "E S C - ��室"
SET COLOR TO W/N
@ 9,14 CLEA TO 13,70
SET COLOR TO W/GR+,R/W
   @ 10,12 say "���������������> ��ᯥ��뢠�� ⠡���� <���������������ͻ"
   @ 11,12 say "�                                                       �"
   @ 12,12 say "�                                                       �"
   @ 13,12 say "�                                                       �"
   @ 14,12 say "�������������������������������������������������������ͼ"
m12="         �� ����� � �� �����������       "
m13="         �� ���� ���p� ��p�����         "
do m1 with 12,13,1,18
do case
   case g=27
    set color to
    clea
    return
   case g=12
set color to bg/n
store 0 to n1,n2
do while .t.                            &&2
@ 16,15 say "��ᯥ��뢠�� � ����p�  " get n1 pict "99999"
@ 16,45 say " �� " get n2 pict "99999"
read
if readkey()=12 .or. readkey()=262
  retu
endif
sele 1
seek n1
if .not. found()
loop
endif
skip
do while .not. eof() .and. delo<=n2             &&3
*************************************
if vidpns<3 .and. codlea=0  .and. begpay>=ctod("01.12.97")
do tabl97v
q=0
do while q=0
q=inkey()
enddo
if q=27
retu
endif
endif
skip
*************************************
enddo                                           &&3
set devi to scre
enddo                                           &&2
  case  g=13
  do tabls
endcase
*********************************************
enddo                                           &&1
