*****************************************
*               sb.prg
*  �ணࠬ�� �ᯥ�⪨ p�ᯮ�殮��� � ᡥࡠ��
*****************************************
sET COLOR TO w/b,n/bg
publ cifra,sos1
parameters par
store space(60) to osn1,osn2,osn3,pril,pril1
@   9,11  SAY "��������������������������������������������������������������ͻ"
@  10,11  SAY "� ���ᨮ���� ����                                              �"
@  11,11  SAY "� ��᫮,�����,���                                              �"
@  12,11  say "� �뤠��( ���  )                                               �"
@  13,11  SAY "�                                                              �"
@  14,11  SAY "�                                                              �"
@  15,11  SAY "� �㬬�                                                        �"
@  16,11  SAY "�                  ��室 - < ESC >                             �"
@  17,11  SAY "��������������������������������������������������������������ͼ"
@  18,11  SAY " �᭮����� : "
de=delo
da=datav
fio=nampns
osn1='���⠭������� �ࠢ�⥫��⢠ �� �� 10.07.1995 �. N 701 "� �����祭�� � �믫��'
osn2='�⤥��� ��⥣��� ��������� �� �᫠ ���࠭�� �������� �������樨 '
osn3='��室�� �� ᠭ.-���.��祭��,��ᯫ���� �࠭ᯮ���� �।�� � �࠭�.���㦨�����"'
 osn4=" "
 su=summa1
if par=1
pril ="��������� �� ᠭ.���.��祭�� �� "+str(gg1,4)+"-"+str(gg1+1,4)+" �.         "
endif
if par=2 .and. vib=1
pril ="��������� �� ������ ��  "+str(gg1,4)+" �.    "
endif
if par=2 .and. vib=2
pril ="��������� �� �࠭ᯮ�⭮� ���㦨����� ��  "+str(gg1,4)+" �.           "
endif
pril1=""
@  10,31  get de
@  11,31  get da
@  12,31  get fio
@  13,31  get pril
@  14,31  get pril1
@  15,31  get su pict "999999.99"
@  18, 1  get osn1
@  19, 1  get osn2
@  20, 1  get osn3
READ
cifra=su
do perev1
supro=sos1
 if readkey()=12 .or. readkey()=262
   return
  endif
dor=substr(dtoc(da),1,6)+str(year(da),4)
*****************************************
set devi to print
sele 1
seek de
codbnk_=iif(found(),codbnk,0)
pnslst_=iif(found(),pnslst,space(7))
sele 8
use bank
loca for codbnk=cart ->codbnk
kuda=iif(found(),"� "+rtrim(nambnk)+" ᡥp����","")
ad1 =iif(found(),adres1,"")
ad2 =iif(found(),adres2,"")
sele 2
m=prow()+1
@ m,  3 say "           E��� ��"
@ m+1,4 say   "E���������� ���������� ���F                "+kuda
@ m+1,45 say repl("_",len(kuda))
@ m+2,4 say "   ����������� �������            "
@ m+3,45 say ad1
@ m+3,4 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ m+4,45 say ad2
@ m+4,6 say "  "+dor
@ m+4,4 say "  _________________ "
@ m+5,4 say "       10/"+ltrim(str(de))
 m=prow()+4
s=(80-len(rtrim(fio))-13)/2
@ prow()+3,11 say " �p�ᨬ �p������� ������p������� �믫��� ���ᨮ��p� ���:"
m=prow()+2
@ m  , 6 say "Ew1"+rtrim(fio)+"w0F   ����.���� N E48/"+ltrim(str(de))+"F"
@ m  , 6 say repl("_",66)
@ m+2 ,6 say "�� ���ᨮ����� �����E "+pnslst_+"F � �㬬� E"+ltrim(str(su,9,2))+" p�."
@ m+4 ,6  say "E"+supro+"F"
m=prow()+2
@ m,   6 say "4("+trim(pril)+")5"
@ prow()+2,6 SAY "�᭮�����:________________________________________________"
@ prow(),18 SAY ""+osn1+""
@ prow()+1,6   SAY    "__________________________________________________________"
@ prow(),18 SAY ""+osn2+""
@ prow()+1,18 say ""+osn3+""
@ prow(),6   SAY "__________________________________________________________"
m=prow()
@ m+ 4,14 say "��砫쭨� ��� ��� �p�᫠�᪮� ���.                 ���ਭ �.�."
@ m+ 7,14 say "��砫쭨� 業�� ���ᨮ����� ���㦨�����          ������ �.�. "
@ m+12,0 say repl("-",80)
m=prow()+3
b=7
@ m   ,6  say substr(kuda,3,len(kuda)-2)
@ m   ,40 say "��砫쭨�� ��� �� ��� �p�᫠�᪮� ���."
@ m+1 ,6  say "�� N 10/"+ltrim(str(de))+" �� "+dor
@ m+2, 40 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ prow()+3,b say "��� ���ᨮ��p�:E w1"+rtrim(fio)+"  48/"+ltrim(str(de,5))+"w0F"
@ prow()  ,b say repl("_",60)
@ prow()+2,b say "������६����� �믫��  � �㬬� E" +ltrim(str(su,9,2))+"p�."
@ prow()+2,b say supro+"F"
@ prow()+2,   6 say "(4"+trim(pril)+"5)"
@ prow()+2,b say '�p��������� "_____" ___________________2003 �.'
@ prow()+2,6      SAY "�᭮�����:________________________________________________"
@ prow(),18 SAY ""+osn1+""
@ prow()+1,6   SAY    "__________________________________________________________"
@ prow(),18 SAY ""+osn2+""
@ prow()+1,18 say ""+osn3+""
@ prow(),6   SAY "__________________________________________________________"
@ prow()+3,24 say "��砫쭨�"
@ prow()+1, b say " �.�.     "
@ prow()+1,24 say "��壠��p:"
@ prow(), 0 say ""
**************************
SET DEVI TO SCREE
RETU
