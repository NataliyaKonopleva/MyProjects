*         ������ �� ᥬ��         07.02.1994
a=repl(".",12)+space(3)
b=3
store 0 to n1,n2
do while .t.                                    &&1
@ 10,15 say "��ᯥ��뢠�� � ����p�  " get n1 pict "99999"
@ 10,45 say " �� " get n2 pict "99999"
read
if readkey()=12 .or. readkey()=262
  retu
endif
n11=n1
n22=n2
seek n11
if .not. found()
loop
endif
skip
do while .not. eof() .and. delo<=n22                             &&2
*************************************
sele 1
seek poluch->delo
if kodpens="3" .and. prichwib=" "                               &&  A
fio=ltrim(rtrim(fam))
d=delo
ki=val(kodinv)
inv=" "
do case
   case ki>=1 .and. ki<=3
inv="  "+substr(kodinv,2,1)+" �p㯯� ���  "
   case ki>=4 .and. ki<=6
inv="  "+str(val(kodinv)-3,1)+" �p㯯� ���  "
   case ki>=7 .and. ki<=9
inv="  "+str(val(kodinv)-6,1)+" �p㯯� ��   "
   case ki>=10 .and. ki<=12
inv="  "+str(val(kodinv)-9,2)+" �p㯯� ��   "
   case ki=13
endcase
smer=iif(prsmer=1 .or. kodinv$"01,02,03,04,05,06"," ������� "," HE ������� ")
wp1=substr(wsnad,1,2)
wp2=substr(wsnad,4,2)
wp3=substr(wsnad,7,2)
wp="("+wp1+"��� "+wp2+"��� "+wp3+"��)    "
l=prow()
m=prow()+1
q1=str(okldol,9,2)
q2=str(zareg ,9,2)
q3=str(oklzwan,9,2)
q4=str(prodpaek,9,2)
q5=str(wislug,9,2)
q6=str(wsegokl,9,2)
q7=str(sumras,9,2)
png=val(substr(wsnad,1,2))
pn=0
do case
 case png>=1 .and. png<2
    pn=5
 case png>=2 .and. png< 5
    pn=10
 case png>=5 .and. png<10
    pn=20
 case png>=10 .and. png<15
    pn=25
 case png>=15 .and. png<20
    pn=30
 case png>=20 .and. png<25
    pn=35
 case png>=25
    pn=40
endcase
pn0=str(pn,2)
*****
sele 2
sro=srwipl1
MO=rtrim(SUBSTR(MES,8*month(sro)-7,8))+" "
GOD=STR(YEAR(sro),5)+" �."
srok=str(day(sro),2)+" "+mo+god
set devi to print
@ m,30 say "������"
@ m+1,10 say "��p�p���� ���ᨨ � ���� ���p� ��p����� c "+srok
@ m+3,45 say "���ᨮ���� ���� N E48/"+ltrim(str(delo))+"F"
@ m+4,b say "� � � 㬥p襣� ��p�����:  E"+fio+"F"
if ki>=1 .and. ki<=6
@ prow()+1,b  say "������������  ��p����� :"+inv
endif
m=prow()+1
@ m,b  say "���p�� ��p�����"+smer+" c �ᯮ������� ��易����⥩ ������� �㦡�"
@ m+1,b say repl("-",75-b-5)
drog=iif(year(datar)<=1915,"��� p���. "+substr(dtoc(datar),1,6)+str(year(datar),4)," ")
@ m+2,b  say "�����⥫� ���ᨨ : " +rtrim(fam)+"   "+drog
inv=""
if kodinv$"10,11,12"
inv="������� "+str(val(kodinv)-9,2)+" �p㯯� ��   "
endif
if krsir=1
@ prow()+1,b say "�������  - �p㣫� �p��"
endif
uch=""
do case
   case uchwoin="1"
     uch="      ���⭨� ���      "
   case uchwoin="5"
     uch="���⭨� �p㤮���� �p���"
   case uchwoin="6"
     uch="��⥫� ���������� ������p���"
endcase
uch=iif(" "#inv,uch+","+inv,uch)
if ""#uch
@ prow()+1,int((80-len(uch))/2) say uch
endif
@ prow()+1,b say repl("-",75-b-5)
m=prow()-10
@ m+11,b say "�����p ���ᨨ � % �� ��������� �������⢨� "
@ m+12,b say "-�� 1 �������� "+repl(".",33)+"      "+str(penproc/izdiw,2)+"%"
if izdiw>1
@ m+13,b say "-�� " +str(izdiw,1)+" �������楢"+repl(".",33)+"      "+str(penproc,2)+"%"
endif
@ m+14,b say "�������� �������⢨� �� ���� ��p�p���� :"
m=prow()+1
@ m   , b+2 say "-����� �� ��������................"+a+q1
@ m+1 , b+2 say "..................................."+a+q2
@ m+2 , b+2 say "����� �� ������...................."+a+q3
@ m+3 , b+2 say "�������� ������ �p�������.........."+a+q4
@ m+4 , b+2 say pn0+" % �������� �� ����� ���"+wp+q5
@ m+5 , b+2 say "           �����:.................."+space(len(a))+q6
@ m+6 , b+2 say "�⮣� �㬬�,�p��������� ��� ��p�p���� ���ᨨ-   "+q7
@ m+7 , b+2 say "(� ��.��p. 344000p)."
if povst1+povst3=0
@ m+8, b+2 say "E����� ����� ������:................"+a+str(itpens,9,2)+"F"
else
@ m+8 , b+2 say "           ����� ������:..........."+a+str(penrub,9,2)
endif
m=prow()+1
if povmin#0
@ prow()+1,b say "����襭�� ���ᨨ �� �����.p����p�   "
@ prow()+1,b say "���ᨨ �� ��p���................."+a+str(povmin,9,2)
endif
if povst1#0
@ prow()+1,b say "����襭�� ���ᨨ �� ���� 45 ......."+a+str(povst1,9,2)
endif
if povst3#0
@ prow()+1,b say "����襭�� ���ᨨ �� ���� 38 ......."+a+str(povst3,9,2)
endif
if povst1+povst3+povmin#0
@ PROW()+1, b+2 say "E����� ����� ������:................"+a+str(itpens,9,2)+"F"
 endi
l1=prow()
kb=kodbank
sele 4
seek kb
nabank=rtrim(name)+" ����"
sele 2
@ prow()+2,b say "���ᨮ��� ����E "+penlist+"   " +nabank+"F"
*if komp#0
*@ prow()+1,b say repl("-",75-b)
*@ prow()+1,b say " � ��p��� 1995 �.�믫�祭� ������p.��ᮡ�� � c㬬�E " +str(komp,9,2)+" p�.F"
*@ prow()+1,b say " � ���� 50-���� ������ "
*@ prow()+1,b say repl("-",75-b)
*endif
@ prow()+3,b say "��砫쭨� ���  :                            ���믨� �.�. "
@ prow()+2,b say "��砫쭨� ���ᨮ����� ����⤥��:            ������ �.�.   "
@ prow()+2,b say "��ᯥ��p :"
@ prow()+1,b+55 say sdat
@ prow()+3,b say " "
if povst1+povst3+povmin=0
@ prow()+1,b say " "
endif
endif                                           && A
set devi to scre
sele 2
********************************************************
q=0
do while q=0
  q=inkey()
enddo
if q=27
*e�it
exit
endif
skip
*************************************
enddo
set devi to scre
enddo
