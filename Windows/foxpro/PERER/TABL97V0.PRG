*         ������         31.05.93    *
sele 1
set color to bg/n
do case
 case vidpns=1
    vid="�� ����� ��� "
 case vidpns=2
    vid="�� ����������� "
 case vidpns>=3
    vid="�� ���p� ��p����� "
endcase
drog="��� p���. "+substr(dtoc(datbst),1,6)+str(year(datbst),4)
s_45=stat45
    uc0=iif("�"$stat45,"���������९���஢���� ","")
 uc=" "
 if "�"$stat45
    uc=uc+"���������९���஢���� "
 endif
  if "�1"$stat45
     uc=uc+"���⭨� ���"
  endif
  if "�"$stat45
     uc=uc+"���⭨� ��㤮���� �஭�"
   endif
  if "�2"$stat45
     uc=uc+"���⭨� ����権 �� ���졥 � �����⨧��� "
  endif
  if  "�4"$stat45
      uc=uc+"���⭨� ������ ����⢨� �� �࠭�楩"
  endif
  if "�"$stat45
     uc=uc+"��ᮢ��襭����⭨� 㧭�� "
  endif
  if "�"$stat45
    uc=uc+"��⥫� ���������� ������ࠤ�"
  endif
  if "a2"$stat45
     uc=uc+"��ன �����᪮�� ��"
  endif
  if "a3"$stat45
     uc=uc+"������� �थ�� ����� 3 ��."
  endif
uch=uc
w1=substr(wsllgt,1,2)
w2=substr(wsllgt,4,2)
w3=substr(wsllgt,7,2)
wp1=substr(wslnad,1,2)
wp2=substr(wslnad,4,2)
wp3=substr(wslnad,7,2)
wt1=substr(wslsta,1,2)
wt2=substr(wslsta,4,2)
wt3=substr(wslsta,7,2)
wp="("+wp1+"��� "+wp2+"��� "+wp3+"��)    "
ki=catinv
gr=str(grpinv,1)
a=repl(".",12)+space(3)
b=3
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
********************************
set devi to print
l=prow()
m=prow()+1
*****
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
sele 2
seek a->delo
if .not. found()
set devi to scre
@ 20,35 say "48/"+str(delo,5)+"!!!"
wait ""
retu
endif
sro=begpay
MO=rtrim(SUBSTR(MES,8*month(sro)-7,8))+" "
GOD=STR(YEAR(sro),5)+" �."
srok=str(day(sro),2)+" "+mo+god
@ prow(),30 say "�������"
m=prow()+1
@ m+1,12 say "��p�p���� ���ᨨ " +vid+"c "+srok
@ m+1,12 say "                   " +repl("_",len(vid))+"  "+repl("_",len(srok))
@ m+2,45 say "���ᨮ���� ���� N E48/"+ltrim(str(delo))+"F"
m=m+1
@ m+3,b say "� � � ���ᨮ��p�     E"+nampns+"F"
m=prow()
@ m+1,b  say "�p㯯� ����������� ....."+inv+"  " +drog
@ m+2,b  say "���⭨� �����: .........  "+uch
if codtnd
@ prow()+1,20 say "�㦤����� � ����ﭭ�� ����p����� �室�"
m=prow()-2
endif
if wslsta=space(8) .or. wslsta="  .  .  "
@ m+3, b say "���㣠 ��� .............  "+w1+"��� "+w2+"��� "+w3+"�� "
else
@ m+3,b say "��騩 �p㤮��� �⠦ ..... "+wt1+"��� "+wt2+"��� "+wt3+"��  "
endif
@ m+4 ,b say repl("~",75-b-5)
@ m+5 ,b say "�����p ���ᨨ � % �� ��������� �������⢨� ......    "+str(penprc,2)+"%"
@ m+6 ,b say "�������� �������⢨� �� ���� ��p�p���� :"
m=prow()+1
@ m   , b+2 say "-����� �� ��������................"+a+str(salpst,9,0)
regp=0
if increg>0
 regp=prcreg
@ prow()+1 , b+2 say str(regp,2)+"%..- �� ०��(�ᮡ� �᫮���)...."+a+str(increg,9,0)
endi
@ prow()+1 , b+2 say "����� �� ������...................."+a+str(salrnk,9,0)
@ prow()+1 , b+2 say "�������� ������ �p�������.........."+a+str(sumprp,9,0)
@ prow()+1 , b+2 say pn0+" % �������� �� ����� ���"+wp+str(incwsl,9,0)
@ prow()+1 , b+2 say "����� �㬬� ��������� ᮤ�ঠ���   "+space(len(a)-1)+str(totsal,10,0)
if povs16+nadb_1+nadb_2+nadb_3+nadrad+ps45_1+ps45_2=0
@ prow()+1, b+2 say "E����� ����� ������:................"+a+str(itgpns,10,0)+"F"
else
@ prow()+1, b+2 say "          ����� ������:..........."+a+str(penrub,10,0)
*****************
do nadbav
***************************
endif
sele 1
if penrub=B->penrub
@ prow()+3, 25 say "E������� "
@ prow()+2,10 say "� 1 ������� 1997�. � �裡 � ��⠭�������� "
@ prow()+1,10 say "        min ࠧ��� ���ᨨ 84186 ��F"
@ prow()+2, b+2 say "           ����� ������:.........."+a+str(penrub,10,0)
 do nadbav
sele 1
else
set devi to scre
retu
endif
itgpns_=round(itgpns/1000,2)
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
@ prow()+2,b say "P"
set devi to scre
retu
**************************************************************
procedure nadbav
m=prow()+1
if povmin#0
@ prow()+1,b say "����襭�� ���ᨨ �� �����.p����p�   "
@ prow()+1,b say "���ᨨ �� ��p���................."+a+str(povmin,9,0)
endif
if povs16#0
@ prow()+1,b say "�����祭�� ���ᨨ �� ��.16           "+space(15)+str(povs16,9,0)
mp=iif(select()=1,84186,76533)
x_=""+ltrim(str(povs16*100/mp,0))+"% min ���ᨨ"
@ prow()  ,b+33 say x_
endif
st=""
if ps45_1#0
@ prow()+1,b say "����襭�� �� ���� 45 .............."+a+str(ps45_1,9,0)
endif
if ps45_2#0
@ prow()+1,b say "                       .............."+a+str(ps45_2,9,0)
endif
****************************
_17v=""
if nadb_3>0
_17v="   ���⭨� ��� "
endif
if grpinv=1 .or. grpinv=2
_17v=" ���,������� "+gr+"��"
endif
if datbst<ctod("01.12.17")
 _17v="  ���+80���    "
endif
***********************************
x_=""
if datbst<ctod("01.12.97") .or. grpinv=1
x_=iif(datbst<ctod("01.12.17"),"���� 80 ��� "," �� �室 �������� 1 �� ")
x_=""+x_+""
ENDIF
************************************
if nadrad>0
@ prow()+1,b say "���⭨� �������樨 ������ �� ����   "+repl(".",15)+str(nadrad,9,0)
endif
if vidpns=1
if  nadb_1#0
@ prow()+1,b say "�������� � ���ᨨ �� ��.17�          "+space(15)+str(nadb_1,9,0)
@ prow()  ,b+33 say x_
endif
if  nadb_2#0
@ prow()+1,b say "�������� � ���ᨨ �� ���� 17� ...(�� �������楢).."+str(nadb_2,9,0)
endif
if nadb_3>0
@ prow()+1,b say "�������� � ���ᨨ �� ��.17�          "+space(15)+str(nadb_3,9,0)
@ prow()  ,b+33 say _17v
endif
endif                   &&�� �/���
if vidpns=2
if nadb_1#0
@ prow()+1,b say "�������� � ���ᨨ �� ��.24(1.1)      "+SPACE(15)+str(nadb_1,9,0)
@ prow()  ,b+33 say x_
endif
if nadb_2#0
@ prow()+1,b say "�������� � ���ᨨ �� ���� 24(1.2)(�� �������楢)  "+str(nadb_2,9,0)
endif
if nadb_3#0
@ prow()+1,b say "����襭�� ���ᨨ �� ���� 24 �.2                   "+str(nadb_3,9,0)
@ prow()  ,b+33 say _17v
endif
endif
*************************************
@ prow()+1, b+2 say "E����� ����� ������:..............."+a+str(itgpns,10,0)+"F"
retu
