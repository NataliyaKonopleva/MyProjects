*         ���᪨ � ���� 27.04.94    *
set esca on
set talk off
set date germ
set color to
publ cifra,sos1
clea
sele 5
use bank
sele 2
use poluch
if .not. File("poluchb.ntx")
  inde on kodbank+str(delo,5) to poluchb
endif
use poluch inde poluchb
sele 1
use kart
if .not. File("kartbank.ntx")
 inde on kodbank+kodpens+str(delo,5) to kartbank
endif
use kart inde kartbank
publ sdat,kb1,kk
sd=date()
sdat=substr(dtoc(sd),1,6)+str(year(sd),4)+" �."
*********************************************
do while .t.                   &&1
sele 1
set filt to
go top
set color to
clea
set color to r/w,n/w
@ 23,1 clea to 23,78
@ 23,2 say "E S C - ��室"
SET COLOR TO W/N
@ 9,14 CLEA TO 13,65
SET COLOR TO W/R ,R/W
   @ 10,12 say "���������������> ��ᯥ��뢠�� ᯨ᪨ <����������������ͻ"
   @ 11,12 say "�                                                       �"
   @ 12,12 say "�                                                       �"
   @ 13,12 say "�                                                       �"
   @ 14,12 say "�������������������������������������������������������ͼ"
m11="         �� ����� ���                     "
m12="         �� �����������                    "
m13="         �� ���� ���p� ��p�����         "
do m1 with 11,13,1,18
save scre to ek
@ 11,13 clea to 13,65
do case
   case g=27
    set color to
    clea
    return
*--------------------------------------------------------------------
*set color to bg/n
  case  g=11
  kk="1"
  case  g=12
  kk="2"
  case  g=13
  kk="3"
endcase
m="m"+str(g,2)
vid=ltrim(&m)
set color to
do bank3
rest scre from ek
*********************************************
enddo                                           &&1
