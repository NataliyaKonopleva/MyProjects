*         ������         31.05.93    *
sele 1
set color to bg/n
do case
 case kodpens="1"
    vid="�� ����� ��� "
 case kodpens="2"
    vid="�� ����������� "
 case kodpens="3"
    vid="�� ���p� ��p����� "
endcase
drog=iif(year(datar)<=1915,"��� p���. "+substr(dtoc(datar),1,6)+str(year(datar),4)," ")
u="���                      BOB �� �/�               ���                      ��p�����                �p㤮��� �p���           ������� ������p���       ��ᮢ�p襭����⭨� 㧭������������p��p���p������"

uch="���   "
if uchwoin#" "
* uch=iif(uchwoin=" ","      ���   ",substr(u,(val(uchwoin)-1)*25+1,25))
 uch=substr(u,(val(uchwoin)-1)*25+1,25)
endif
w1=substr(wslgt,1,2)
w2=substr(wslgt,4,2)
w3=substr(wslgt,7,2)
wp1=substr(wsnad,1,2)
wp2=substr(wsnad,4,2)
wp3=substr(wsnad,7,2)
wt1=substr(wssta,1,2)
wt2=substr(wssta,4,2)
wt3=substr(wssta,7,2)
wp="("+wp1+"��� "+wp2+"��� "+wp3+"��)    "
ki=val(kodinv)
a=repl(".",12)+space(3)
b=3
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
inv="  1 �p.�� �p����"
endcase
********************************
set devi to print
l=prow()
m=prow()+1
*****
sro=srwipl1
MO=rtrim(SUBSTR(MES,8*month(sro)-7,8))+" "
GOD=STR(YEAR(sro),5)+" �."
srok=str(day(sro),2)+" "+mo+god
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
@ prow(),30 say "�������"
m=prow()
@ m+1,12 say "��p�p���� ���ᨨ " +vid+"c "+srok
@ m+1,12 say "                   " +repl("_",len(vid))+"  "+repl("_",len(srok))
@ m+3,45 say "���ᨮ���� ���� N E48/"+ltrim(str(delo))+"F"
@ m+4,b say "� � � ���ᨮ��p�     E"+fam+"F"
m=prow()
@ m+1,b  say "�p㯯� ����������� ....."+inv+"      " +drog
@ m+2,b  say "���⭨� �����: .........  "+uch
if wssta=space(8) .or. wssta="  .  .  "
@ m+3, b say "���㣠 ��� .............  "+w1+"��� "+w2+"��� "+w3+"�� "
else
@ m+3,b say "��騩 �p㤮��� �⠦ ..... "+wt1+"��� "+wt2+"��� "+wt3+"��  "
endif
@ m+4 ,b say repl("-",75-b-5)
@ m+5 ,b say "�����p ���ᨨ � % �� ��������� �������⢨� ......    "+str(penproc,2)+"%"
@ m+6 ,b say "�������� �������⢨� �� ���� ��p�p���� :"
m=prow()+1
@ m   , b+2 say "-����� �� ��������................"+a+str(okldol,9,2)
regp=0
if zareg#0
 regp=round(zareg*100/okldol,0)
endif
if regp#0
@ m+1 , b+2 say str(regp,2)+"%................................"+a+str(zareg ,9,2)
else
@ m+1 , b+2 say "..................................."+a+str(zareg ,9,2)
endi
@ m+2 , b+2 say "����� �� ������...................."+a+str(oklzwan,9,2)
@ m+3 , b+2 say "�������� ������ �p�������.........."+a+str(prodpaek,9,2)
@ m+4 , b+2 say pn0+" % �������� �� ����� ���"+wp+str(wislug,9,2)
@ m+5 , b+2 say "           �����:.................."+space(len(a)-1)+str(wsegokl,10,2)
@ m+6 , b+2 say "�⮣� �㬬�,�p��������� ��� ��p�p���� ���ᨨ-  "+str(sumras,10,2)
@ m+7 , b+2 say "(� ��.��p. 550000p)."
if povst1+povst2+povst3+povst4+povmin=0
@ m+8, b+2 say "E����� ����� ������:..............."+a+str(itpens,10,2)+"F"
else
@ m+8 , b+2 say "           ����� ������:.........."+a+str(penrub,10,2)
endif
m=prow()+1
if povmin#0
@ prow()+1,b say "����襭�� ���ᨨ �� �����.p����p�   "
@ prow()+1,b say "���ᨨ �� ��p���................."+a+str(povmin,9,2)
endif
if povst1#0
@ prow()+1,b say "����襭�� ���ᨨ �� ���� 45 ......."+a+str(povst1,9,2)
endif
if povst2#0
@ prow()+1,b say "����襭�� ���ᨨ �� ���� 16 ......."+a+str(povst2,9,2)
endif
if povst3#0
st=iif(kodpens="1"," 17� "," 24-1")
@ prow()+1,b say "����襭�� ���ᨨ �� ����"+st+"......"+a+str(povst3,9,2)
endif
if povst4#0
st=iif(kodpens="1"," 17� "," 24-2")
@ prow()+1,b say "����襭�� ���ᨨ �� ����"+st+"......"+a+str(povst4,9,2)
endif
if povst1+povst2+povst3+povst4+povmin#0
@ PROW()+1, b+2 say "E����� ����� ������:..............."+a+str(itpens,10,2)+"F"
 endi
kb=kodbank
sele 4
seek kb
nabank=rtrim(name)+" ����"
sele 1
@ prow()+2,b say "���ᨮ��� ����E "+penlist+"   " +nabank+"F"
*if komp#0
*@ prow()+1,b say repl("-",75-b)
*@ prow()+1,b say " � ��p��� 1995 �.�믫�祭� ������p.��ᮡ�� � c㬬�E " +str(komp,9,2)+" p�.F"
*@ prow()+1,b say " � ���� 50-���� ������ "
*@ prow()+1,b say repl("-",75-b)
*endif
l1=prow()
@ prow()+2,b say "��砫쭨� ��� ��� :                            ���믨� �.�."
@ prow()+2,b say "��砫쭨� ���ᨮ����� ����⤥��:               ������ �.�. "
fi=""
do case
 case substr(fam,1,1)$"����"
  fi="�p����쥢� �.�."
 case substr(fam,1,1)$"���"
  fi="����祢� �.�."
 case substr(fam,1,1)$"���"
  fi="��⥭쥢� �.�. "
 case substr(fam,1,1)$"��������"
  fi="��p�ᮢ� �.�."
 othe
  fi="�㬠���� �.�.  "
endcase
@ prow()+2,b say "��ᯥ��p:                                     "+fi
jk=iif(komp=0,prow()+2,prow()+1)
@ jk      ,b    say sdat
@ prow()+2,b say " "
if povst1+povst2+povst3+povst4+povmin=0
@ prow()+3,b say " "
endif
set devi to scre
retu
*@ prow(),50 say "x1k1"+str(lis,2)





