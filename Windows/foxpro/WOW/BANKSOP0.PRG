*         ������         31.05.93    *
set talk off
set devi to screen
set date germ
mes10="������  ������� �����   ������  ���     ����    ����    ������� ��������"
Mes20="������� ������  �������"
MES=MES10+MES20
MO=rtrim(SUBSTR(MES,8*month(date())-7,8))+" "
GOD=STR(YEAR(date()),5)+" �."
sysd=str(day(date()),2)+" "+mo+god
sele 5
use bank
sele 2
use poluch inde poluchb
sele 1
use kart inde kartbank
set color to bg/n
clea
do while .t.
kb="  "
kk=" "
@ 10,5 say "����=>" get kb  pict "99"
*@ 12,5 say "��� ������ =>" get kk  pict "9"
read
if readkey()=12 .or.readkey()=262
  retu
endif
k =1
store 0 to v3,j1,j2,j3,v1,v2
do while k<=3
kk=str(k,1)
 vp1="�� ����� ��� -"
  vp2="�� ����������� - "
 vp3="�� ���� ���p� ��p����� -"
sele 5
go top
loca for kod=kb
nb=iif(found(),"� "+trim(name)+" ᡥp����"," ")
kb1=kb+kk
if kk $"12"
 sele 1
 seek kb1
 do while .not. eof() .and. kodbank+kodpens=kb1
  if prichwib= " "
        j="j"+kk
        &j=&j+1
        v="v"+kk
        &v=&v+vsego
  endif
  skip
 enddo
endif
if kk ="3"
 sele 2
 seek kb
 do while .not. eof() .and. kodbank=kb
  if prichwib= " "
        j="j"+kk
        &j=&j+1
        v="v"+kk
        &v=&v+vsego
  endif
  skip
 enddo
endif
k=k+1
enddo
*************************************
set devi to print
l=prow()
m=prow()
@ m,  3 say "           Ex1k0��� ��"
@ m+1,4 say   "  ���������� ���������� ���F"
@ m+2,4 say "   ����������� �������                    "+nb
@ m+3,4 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ m+4,8 say sysd
@ m+4,46 say bank->adres1
@ m+4,4 say "   __________________ "
@ m+5,46 say bank->adres2
@ m+5,4 say "     N 10/__________ "
m=prow()+3
b=3
@ m  ,b say "    � ᮮ⢥��⢨�� � ���⠭�������� �p���⥫��⢠ �� �� 30.10.1995 �. "
@ m+2, b say "N 1052 � ������� �� �� 12.02.1993 �., ���ᨨ ���ᨮ��p�� ���"
@ m+4, b say "E� 1 ᥭ��p� 1995 �.F �믫�稢��� � p����p��, 㪠������ � �p���������"
@ prow()+2, b say "ᯨ᪠� :"
if j1#0
@ prow()+2, b say vp1+" � ������⢥ "+ltrim(str(j1))+" 祫. �� �㬬� "+ltrim(str(v1))+" p�"
endif
if j2#0
@ prow()+2, b say vp2 +" � ������⢥ "+ltrim(str(j2))+" 祫. �� �㬬� "+ltrim(str(v2))+" p�."

endif
if j3#0
@ prow()+2,b say vp3 +" � ������⢥ "+ltrim(str(j3))+" 祫. �� �㬬� "+ltrim(str(v3))+" p�."
endif
@ prow()+4,b+11 say "��砫쭨� ��� ���                             ���믨� �.�."
@ prow()+3,b+11 say "��砫쭨� ���ᨮ����� ����⤥��               ������  �.�."
@ prow()+5,0 say repl("-",80)
@ prow()+1,30 say "F��p���� � ���ᨮ��� ����⤥� x1k0"
m=prow()+3
b=4
@ m,3 say substr(nb,2,len(nb)-1)
@ m   ,42 say "��砫쭨�� ��� ��� �p�᫠�᪮� ���."
@ m+2, 42 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ prow()+4,b say "     ����饭�� �� ��⠭�������  ����� p����p�� ���ᨩ E� 1 ᥭ��p� "
@ prow()+2,b say "1995 ����F ���ᨮ��p�� ��� �� � ᯨ᪨ ���ᨮ��p��:"
if j1#0
@ prow()+2, b say vp1+" � ������⢥ "+ltrim(str(j1))+" 祫. �� �㬬� "+ltrim(str(v1))+" p�"
endif
if j2#0
@ prow()+2, b say vp2 +" � ������⢥ "+ltrim(str(j2))+" 祫. �� �㬬� "+ltrim(str(v2))+" p�."
endif
if j3#0
@ prow()+2,b  say vp3 +" � ������⢥ "+ltrim(str(j3))+" 祫. �� �㬬� "+ltrim(str(v3))+" p�."
endif
@ prow()+2,b say  '����祭�  "_____"______________ 1995 �.'
@ prow()+3,b+11 say "��.��壠��p:"
@ prow()+1,b-1 say "�.�."
@ prow()+2,b+11 say "����p���p"
@ prow(),b+11 say " "
set devi to scre
enddo
retu
