
set talk off
set devi to screen
set date germ
mes10="������  ������� �����   ������  ���     ����    ����    ������� ��������"
Mes20="������� ������  �������"
MES=MES10+MES20
MO=rtrim(SUBSTR(MES,8*month(date())-7,8))+" "
GOD=STR(YEAR(date()),5)+" �."
sysd=str(day(date()),2)+" "+mo+god
sele 1
use wow96 inde wow96b
sele 5
use bank
set color to bg/n
clea
do while .t.
kb="  "
@ 10,5 say "����=>" get kb  pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
sele 5
go top
loca for kod=kb
nb=iif(found(),"� "+trim(name)+" ᡥp����"," ")
sele 1
seek kb
store 0 to k,v
 do while .not. eof() .and. kodbank=kb
  if prichwib= " "
       k=k+1
       v =v +komp
  endif
  skip
 enddo
*************************************
set devi to print
l=prow()
m=prow()
@ m,  3 say "           E��� ��"
@ m+1,4 say   "  ���������� ���������� ���F"
@ m+2,4 say "   ����������� �������                    "+nb
@ m+3,4 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ m+4,8 say sysd
@ m+4,46 say bank->adres1
@ m+4,4 say "   __________________ "
@ m+5,46 say bank->adres2
@ m+5,4 say "     N 10/__________ "
m=prow()+5
b=5
@ m  ,b say "        � ᮮ⢥��⢨� � ������ �१����� �� N 425 ��ᨬ "
@ m+2, b say "�ந����� ������६����� �믫��� ���⭨��� � ��������� ���"
@ m+4, b say "1941-1945 �. � ࠧ��� �������쭮� ���ᨨ �� ����� "
@ m+6, b say "-1E�����६���� � �믫�⮩ ���ᨨ �� ��� 1996 �.-0F"
@ m+8, b say "ᮣ��᭮ �ਫ�������� ᯨ᪠ � ������⢥ "+str(k,3)+"祫."
@ m+10, b say "�� �㬬� " + str(v,8,0)+"��."
@ prow()+5,b+11 say "��砫쭨� ��� ���                          ���믨� �.�."
@ prow()+3,b+11 say "��砫쭨� ���ᨮ����� ����⤥��            ������  �.�."
@ prow(),b+11 say " "
@ prow()+4,0 say repl("-",80)
@ prow()+1,30 say "F��p���� � ���ᨮ��� ����⤥�   "
m=prow()+3
b=4
@ m,3 say substr(nb,2,len(nb)-1)
@ m   ,42 say "��砫쭨�� ��� ��� �p�᫠�᪮� ���."
@ m+2, 42 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ prow()+4,b say "     ����饭�� � ������६����� �믫�� ���⭨��� � ���������"
@ prow()+2,b say "��� �����६���� � �믫�⮩ ���ᨨ �� ��� 1996 �., � ᯨ᮪ "
@ prow()+2,b say "���ᨮ��஢ � ������⢥ "+str(k,3)+"祫. �� �㬬� " + str(v,8,0)+"��."
@ prow()+2,b say  '����祭�  "_____"______________ 1996 �.'
@ prow()+3,b+11 say "��.��壠��p:"
@ prow()+1,b-1 say "�.�."
@ prow()+2,b+11 say "����p���p"
set devi to scre
enddo
retu
