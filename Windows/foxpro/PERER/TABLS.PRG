*    ������ �� ᥬ��
a=repl(".",12)+space(3)
b=3
store 0 to n11,n22
sele 1
do while .t.                                    &&1
@ 16,15 say "��ᯥ��뢠�� � ����p�  " get n11 pict "99999"
@ 16,45 say " �� " get n22 pict "99999"
read
if readkey()=12 .or. readkey()=262
  retu
endif
seek n11
if .not. found()
n11=n11+1
loop
endif
skip
do while .not. eof() .and. delo<=n22                             &&2
*************************************
if vidpns=4 .and. begpay>=ctod("01.12.97") .and. codlea=0
za=recno()
skip -1
 if vidpns#3
  skip -1
 endif
if vidpns#3
retu
endi
fio=ltrim(rtrim(nampns))
d=delo
ki=catinv
gr=str(grpinv,1)
inv=" "
do case
   case ki=1
inv=" ������� ��� "+gr+" ��㯯�"
   case ki=2
inv=" ������� "+gr+" �p㯯� ���  "
   case ki=3
inv=" ������� "+gr+" �p㯯� ��   "
   case ki=4
inv=" ������� "+gr+" �p㯯� ��   "
endcase
smer=iif(rsndea=1 .or. ki=1 .or. ki=2," ������� "," HE ������� ")
wp1=substr(wslnad,1,2)
wp2=substr(wslnad,4,2)
wp3=substr(wslnad,7,2)
wp="("+wp1+"��� "+wp2+"��� "+wp3+"��)    "
l=prow()
m=prow()
q1=str(salpst,9,0)
q2=str(increg,9,0)
regp=prcreg
q3=str(salrnk,9,0)
q4=str(sumprp,9,0)
q5=str(incwsl,9,0)
q6=str(totsal,10,0)
*q7=str(sumras,10,2)
png=val(substr(wslnad,1,2))
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
go za
sro=begpay
MO=rtrim(SUBSTR(MES,8*month(sro)-7,8))+" "
GOD=STR(YEAR(sro),5)+" �."
srok=str(day(sro),2)+" "+mo+god
set devi to print
@ m,30 say "������"
@ m+1,5 say "-1��p�p���� ���ᨨ �� ���� ���p� ��p����� c "+srok+"-0"
@ m+2,45 say "���ᨮ���� ���� N E48/"+ltrim(str(delo))+"F"
@ m+3,b say "� � � 㬥p襣� ��p�����:  E"+fio+"F"
if ki>0
@ prow()+1,b  say "������������  ��p����� :"+inv
endif
m=prow()+1
@ m,b  say "���p�� ��p�����"+smer+" c �ᯮ������� ��易����⥩ ������� �㦡�"
@ m+1,b say repl("-",75-b-5)
@ m+2,b  say "�����⥫�: " +rtrim(nampns)+"   "+substr(dtoc(datbst),1,6)+str(year(datbst),4)
if numdep>0    &&polpns
nakogo=iif(polpns,"�� ᥡ� � " +str(numdep,1)+"ॡ." , "�� "+str(numdep,1)+"ॡ.")
@ prow()+1,b say nakogo
endif
inv=""
if catinv=4
inv="������� "+str(grpinv,1)+" �p㯯� �� "
endif
if RNDORP
@ prow()+1,b say "�������  - �p㣫� �p��"
endif
uch=""
do case
   case "�1"$stat45
     uch="      ���⭨� ���      "
   case "�"$stat45
     uch="���⭨� �p㤮���� �p���"
   case "�"$stat45
     uch="��⥫� ���������� ������p���"
   case "�"$stat45
     uch="���������p��p���p����"
endcase
uch=iif(" "#inv,uch+","+inv,uch)
if ""#uch
@ prow()+1,int((80-len(uch))/2) say uch
endif
if codtnd
@ prow()+1,20 say "�㦤����� � ����ﭭ�� ����p����� �室�"
endif
@ prow()+1,b say repl("-",75-b-5)
m=prow()-10
@ m+11,b say "�����p ���ᨨ � % �� ��������� �������⢨� "
@ m+12,b say "-�� 1 �������� "+repl(".",33)+"      "+str(penprc,2)+"%"
kolpens=iif(polpns,1+NUMDEP,NUMDEP)
if numdep>0
@ m+13,b say "-�� " +str(kolpens,1)+" �������楢"+repl(".",33)+"      "+str(penprc*kolpens,2)+"%"
endif
@ PROW()+1,b say "�������� �������⢨� �� ���� ��p�p���� :"
m=prow()+1
@ m   , b+2 say "-����� �� ��������................"+a+q1
if regp#0
@ m+1 , b+2 say str(regp,2)+"%................................"+a+q2
endif
@ prow()+1 , b+2 say "����� �� ������...................."+a+q3
@ prow()+1 , b+2 say "�������� ������ �p�������.........."+a+q4
@ prow()+1 , b+2 say pn0+" % �������� �� ����� ���"+wp+q5
@ prow()+1 , b+2 say " ����� ��������� ����������:      "+space(len(a))+q6
if ps45_1+ps45_2+nadb_1=0
@ prow()+1, b+2 say "E����� ����� ������:..............."+a+str(kolpens*itgpns,10,0)+"F"
else
@ prow()+1, b+2 say "           ����� ������:.........."+a+str(penrub,10,0)
endif
do nadbav

itgpns_=round(kolpens*itgpns/1000,2)
rub=int(itgpns_)
kop=itgpns_- rub
new=str(rub,5)+"��."+str(kop*100,2)+"���."
@ prow()+2,0 say repl("~",76)
@ prow()+1,1 say "� �裡 � ���������� ����⥫쭮� �⮨���� ��ᨩ᪨� "
@ prow()+1,1 say "�������� ������ ࠧ��� ���ᨨ � 1 ﭢ��� 1998 ���� -E "+new+"F"
@ prow()+1,0 say repl("~",76)
kb=codbnk
sele 4
seek kb
nabank=rtrim(nambnk)+" ����"
sele 1
@ prow()+2,b say "���ᨮ��� ����E "+pnslst+"   " +nabank+"F"
l1=prow()
@ prow()+3,b say "��砫쭨� ��� ��� :                            ���믨� �.�."
@ prow()+2,b say "��砫쭨� ���ᨮ����� �⤥�����:               ������ �.�. "
@ prow()+2,b say "��ᯥ��p:  "
@ prow()+2,b    say sdat
********************************************************
q=0
do while q=0
  q=inkey()
enddo
if q=27
exit
endif
endif
skip
enddo
set devi to scre
enddo
