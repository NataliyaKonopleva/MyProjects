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
sele 1
use cart inde cartbnk
set color to bg/n
clea
do while .t.
kb=0
kk=" "
@ 10,5 say "����=>" get kb  pict "99"
*@ 12,5 say "��� ������ =>" get kk  pict "9"
read
if readkey()=12 .or. readkey()=262
  retu
endif
k =1
store 0 to v3,j1,j2,j3,j4,v1,v2
do while k<=4
kk=str(k,1)
 vp1="�� ����� ��� -"
  vp2="�� ����������� - "
 vp3="�� ���� ���p� ��p����� -"
 vp4="�� ���� ���p� ��p����� -"
sele 5
go top
loca for codbnk=kb
nb=iif(found(),"� "+trim(nambnk)+" ᡥp����"," ")
kb1=str(kb,2)+str(k,1)
sele 1
 seek kb1
 do while .not. eof() .and. str(codbnk,2)+str(vidpns,1)=kb1
  && if codlea=0 .and. itgpns#itgpns0
  if codlea=0 .and. begpay>=ctod("01.12.97")
        j="j"+kk
        &j=&j+1
        v="v"+kk
     *   &v=&v+vsego
     *   &v=&v+itpens
  endif
  skip
 enddo
k=k+1
enddo
j3=j4
*************************************
set devi to print
l=prow()
m=prow()
@ m,  3 say "           Ex1k0��� ��"
@ m+1,4 say   "  ���������� ���������� ���F"
@ m+2,4 say "   ����������� �������                    "+nb
@ m+3,4 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ m+4,10 say sysd
@ m+4,46 say bank->adres1
@ m+4,4 say "     __________________ "
@ m+5,46 say bank->adres2
@ m+5,4 say "       N 10/__________   "
m=prow()+3
b=3

@ m  ,b say "    � ᮮ⢥��⢨� � ����p���� ������� �� �� 28.11.1995 �. N 186-�3"
*@ m+2, b say '"� ���ᥭ�� ��������� � ���������� � ����� �� "� ���ᨮ���� ���ᯥ祭��'
*@ m+4, b say '���,�p�室���� ������� �㦡�,�㦡� � �p����� ����p����� ���, � �� ᥬ��",'
@ prow()+2, b say '�� �ᯮ������ ����ࠫ쭮�� ������ �� 30.09.1997 �. N 127-��,'
@ prow()+2, b say "���ᨨ ���ᨮ��p�� ���, ����騬 �������� � �᭮���� ���ᨨ, "
@ prow()+2, b say "c 1 ������� 1997 �. �믫�稢��� � p����p��, 㪠������ � �p��������� ᯨ᪠� :"
if j1#0
@ prow()+2, b say vp1+" � ������⢥ "+ltrim(str(j1))+" 祫."  && �� �㬬� "+ltrim(str(v1))+" p�"
endif
if j2#0
@ prow()+2, b say vp2 +" � ������⢥ "+ltrim(str(j2))+" 祫." && �� �㬬� "+ltrim(str(v2))+" p�."

endif
if j3#0
@ prow()+2,b say vp3 +" � ������⢥ "+ltrim(str(j3))+" 祫. "&&�� �㬬� "+ltrim(str(v3))+" p�."
endif
@ prow()+4,b+10 say "��砫쭨� ��� ��� �p�᫠�᪮� ���.                   ���믨� �.�."
@ prow()+3,b+10 say "��砫쭨� ���ᨮ����� �⤥�����                      ������  �.�."
@ prow()+4,0 say repl("-",80)
@ prow()+1,30 say "F��p���� � ���ᨮ���� �⤥����� x1k0"
m=prow()+3
b=4
@ m,3 say substr(nb,2,len(nb)-1)
@ m   ,42 say "��砫쭨�� ��� ��� �p�᫠�᪮� ���."
@ m+2, 42 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ prow()+4,b say "     ����饭�� �� ��⠭�������  ����� p����p�� ���ᨩ � 1 ������� 1997 ����"
@ prow()+2,b say "���ᨮ��p�� ��� �� � ᯨ᪨ ���ᨮ��p��:"
if j1#0
@ prow()+2, b say vp1+" � ������⢥ "+ltrim(str(j1))+" 祫. " &&��� "+ltrim(str(v1))+" p�"
endif
if j2#0
@ prow()+2, b say vp2 +" � ������⢥ "+ltrim(str(j2))+" 祫. "  &&�� �㬬� "+ltrim(str(v2))+" p�."
endif
if j3#0
@ prow()+2,b  say vp3 +" � ������⢥ "+ltrim(str(j3))+" 祫.  "    &&�� �㬬� "+ltrim(str(v3))+" p�."
endif
@ prow()+2,b say  '����祭�  "_____" �����  1997 �.'
@ prow()+3,b+11 say "��.��壠��p:"
@ prow()+1,b-1 say "�.�."
@ prow()+2,b+11 say "����p���p"
set devi to scre
enddo
retu
