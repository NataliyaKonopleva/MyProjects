*         ���⨬ �१ ���� �� �����
*DO NACH
publ mess,sysd
set cent on
mes1="������  ������� �����   ������  ���     ����    ����    ������� ��������"
Mes2="������� ������  �������"
mess=mes1+mes2
mes10="������  ������� �����   ������  ���     ����    ����    ������� ��������"
Mes20="������� ������  �������"
MES=MES10+MES20
MO=SUBSTR(MES,8*month(date())-7,8)
GOD=STR(YEAR(date()),5)+" �."
sysd=str(day(date()),2)+" "+mo+god
sele 1
use cart inde cart0
sele 2
use bank inde bank0
publ sos1
summav=84.19
do while .t.
set color to n/w,w/b
do ram
      de=0
      store 0 to pos,pos1,pos0
      @ 8,1 clea to 8,78
      @ 10,20 say "������� ����� ����������� ���� => " get de pict "99999"
      @ 12,20 say "          (ESC - �⪠�) "
       read
      @  18,1 clea to 18,78
        if readkey()=12 .or. readkey()=268
           retu
        endif
      sele 1
       seek de
       if .not. found() .or. (found() .and. codlea>0)
      @ 18,15 say "� ᮦ������,� ��� ��� ⠪��� ���ᨮ��p�. ����p�� ���� ..."
       WAIT ""
       loop
       endif
if vidpns=3
   skip
endif

       let=0
      @  5,18 say nampns +"48/"+ltrim(str(delo))
***************************************
      xa=(80-len(rtrim(nampst)))/2
      @  7,xa say nampst
      @  10,1 clea to 10,78
      @ 14,20 say "�㬬� ��ᮡ�� > " get summav pict "999.99"
       read
        if readkey()=12 .or. readkey()=268
           retu
        endif
        cifra=summav
        do perev1
        pro=sos1
*************************************
set devi to print
sele 2
seek cart->codbnk
kuda=iif(found(),"� "+rtrim(nambnk)+" ᡥp����","")
ad1 =iif(found(),adres1,"")
ad2 =iif(found(),adres2,"")
sele 1
m=prow()+1
@ m,  3 say "           E��� ��"
@ m+1,4 say   "E���������� ���������� ���F                "+kuda
@ m+1,45 say repl("_",len(kuda))
@ m+2,4 say "   ����������� �������            "
@ m+3,45 say ad1
@ m+3,4 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ m+4,45 say ad2
@ m+4,6 say "  "+sysd
@ m+4,4 say "  _________________ "
@ m+5,4 say "       10/"+ltrim(str(delo))
 m=prow()+4
s=(80-len(rtrim(NAMPNS))-13)/2
@ prow()+2,11 say " �p�ᨬ �p������� �믫��� ������p������� ���ਠ�쭮�"
@ prow()+2,6 say "����� E�����६���� � ���ᨥ� �� ���� 1999 �.F ���ᨮ��p� ���:"
m=prow()+2
@ m  , 6 say "Ew1"+rtrim(nampns)+"w0F   ����.���� N E48/"+ltrim(str(delo))+"F"
@ m  , 6 say repl("_",66)
@ m+2 ,6 say "�� ���ᨮ����� �����E "+pnslst+"F � �㬬� E"+ltrim(str(summav,9,2))+" p�."
@ m+4 ,6  say "E"+pro+"F"
m=prow()+2
*@ m  , 6 say '4�᭮�����: �ᯮ�殮��� �p���⥫��⢠ ���ᨩ᪮� �����樨 N 98-P '
*@ m+1, 6 say '�� 19.01.1999 �."� �ࠧ�������� 55-�����騭� ���� ������� �����-'
*@ m+2, 6 say '�p���5"'
*@ m+2, 6 say 'E"�� ���p��� ������p���"F ��� ������ E"��⥫� ���������� ������p���"F'
m=prow()
@ m+ 4,14 say "��砫쭨� ��� ��� �p�᫠�᪮� ���.            ���믨� �.�."
@ m+ 7,14 say "��砫쭨� ���ᨮ����� �⤥�����               ������ �.�. "
@ m+13,0 say repl("-",80)
@ m+14,25 say "��p���� � ���ᨮ���� �⤥����� "
m=prow()+3
b=7
@ m   ,6  say substr(kuda,3,len(kuda)-2)
@ m   ,40 say "��砫쭨�� ��� ��� �p�᫠�᪮� ���."
@ m+1 ,6  say "�� N 10/"+ltrim(str(delo))+" �� "+dtoc(date())
@ m+2, 40 say "150000,�.�p�᫠���,�.���㡫����᪠�, 23"
@ prow()+3,b say "��� ���ᨮ��p�:E w1"+rtrim(nampns)+"  48/"+ltrim(str(delo,5))+"w0F"
@ prow()  ,b say repl("_",60)
@ prow()+2,b say "   �믫��  ������p������� ���ਠ�쭮� ����� � �㬬� E" +ltrim(str(summav,9,2))+"p�."
@ prow()+2,b say pro+"F"
@ prow()+2,b say '�p��������� "_____" ___________________1999 �.'
m=prow()+2
@ m  , 6 say '4�᭮�����: �ᯮ�殮��� �p���⥫��⢠ ���ᨩ᪮� �����樨 N 98-P '
@ m+1, 6 say '�� 19.01.1999 �."� �ࠧ�������� 55-�����騭� ���� ������� �����-'
@ m+2, 6 say '�p���5"'
@ prow()+3,24 say "��砫쭨�"
@ prow()+1, b say " �.�.     "
@ prow()+1,24 say "��壠��p:"
@ prow(), 0 say ""
set devi to scree
enddo
retu
