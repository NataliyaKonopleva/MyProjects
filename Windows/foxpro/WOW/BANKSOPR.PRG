*         ������         31.05.93    *
set talk off
set devi to screen
set date germ
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
@ 12,5 say "��� ������ =>" get kk  pict "9"
read
if readkey()=12 .or.readkey()=262
  retu
endif
if kk ="1"
 vp=" �� ����� ��� "
endif
if kk ="2"
  vp=" �� ����������� "
endi
if kk ="3"
 vp=" �� ���� ���p� ��p����� "
endi
sele 5
go top
loca for kod=kb
nb=iif(found(),"� "+trim(name)+" ᡥp���⥫�� ����"," ")
kb1=kb+kk
store 0 to v,jjj
if kk $"12"
 sele 1
 seek kb1
 do while .not. eof() .and. kodbank+kodpens=kb1
  if prichwib= " "
       jjj=jjj+1
       v =v +vsego
  endif
  skip
 enddo
endif
if kk ="3"
 sele 2
 seek kb
 do while .not. eof() .and. kodbank=kb
  if prichwib= " "
       jjj=jjj+1
       v =v +vsego
  endif
  skip
 enddo
endif
*************************************
set devi to print
l=prow()
m=prow()+1
@ m,  3 say "           E��� ��"
@ m+1,4 say   "E���������� ���������� ���F"
@ m+2,4 say "     ����������� �������               "+nb
@ m+3,4 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ m+4,4 say "      13 ��p��� 1995 �."
@ m+4,4 say "     __________________ "
@ m+5,15 say "10/"
m=prow()+5
@ m  ,9 say "M� ᮮ⢥��⢨�� � ���⠭�������� �p���⥫��⢠ �� �� 06.04.1995 �. "
@ m+2, 9 say "N  311  � �������  �� �� 12.02.1993 �. , ���ᨨ ���ᨮ��p�� ��� "
@ m+4, 9 say "c 1 ��p��� 1995 �. �믫�稢��� � p����p��, 㪠������ � �p��������� "
@ m+6, 9 say "ᯨ᪥ (" +vp +" �  ������⢥ "+ltrim(str(jjj))+" 祫. "
@ m+8, 9 say "�� �㬬� "+ltrim(str(v))+" p�.)"
@ m+13,15 say "��砫쭨� ��� ��� �p�᫠�᪮� ���.                 ���믨� �.�."
@ m+16,15 say "��砫쭨� ���ᨮ����� ����⤥��                    ������  �.�."
@ m+20,0 say repl("-",80)
@ m+21,30 say "��p���� � ���ᨮ��� ����⤥�"
m=prow()+3
b=6
@ m,3 say substr(nb,2,len(nb)-1)
@ m   ,42 say "��砫쭨�� ��� ��� �p�᫠�᪮� ���."
@ m+3, 42 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ prow()+4,b say " M����饭�� �� ��⠭�������  ����� p����p�� ���ᨩ � 1 ��p��� 1995 ����"
@ prow()+2,b say " ���ᨮ��p�� ��� �� � ᯨ᮪ ���ᨮ��p�� "
@ prow()+2,b say "(" +vp +"�  ������⢥ "+ltrim(str(jjj))+" 祫."+"�� �㬬� "+ltrim(str(v))+" p�.)"
@ prow()+2,b say  " ����祭� "
@ prow()+5,b+12 say "��.��壠��p:"
@ prow()+3,b+12 say "����p���p"
set devi to scre
enddo
retu
