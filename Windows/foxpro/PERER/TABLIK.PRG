*         ������         31.05.93    *
set color to bg/n
do case
 case kodpens="1"
    vid="�� ����� ��� "
 case kodpens="2"
    vid="�� ����������� "
 case kodpens="3"
    vid="�� ���p� ��p����� "
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
@ prow()+2,30 say "w1����������w0"
m=prow()+1
@ m+1,22 say " ���ᨨ " +vid+"c "+srok
@ m+1,12 say "                   " +repl("_",len(vid))+"  "+repl("_",len(srok))
m=prow()
@ m+1 ,b say "�������� �������⢨� �� ���� ��p�p���� :"
m=prow()+2
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
@ m+5 , b+2 say "����� �㬬� ��������� ᮤ�ঠ���   "+space(len(a)-1)+str(wsegokl,10,2)
if povst1+povst2+povst3+povst4+povmin=0
@ prow()+2, b+2 say "E����� ����� ������:..............."+a+str(itpens,10,2)+"F"
else
@ prow()+2, b+2 say "           ����� ������:.........."+a+str(penrub,10,2)
endif
m=prow()+1
if povmin#0
@ prow()+1,b say "����襭�� ���ᨨ �� �����.p����p�   "
@ prow()+1,b say "���ᨨ �� ��p���................."+a+str(povmin,9,2)
endif
if povst1#0
@ prow()+1,b say "����襭�� �� ���� 45 .............."+a+str(povst1,9,2)
endif
if povst2#0
@ prow()+1,b say "�����祭�� ���ᨨ �� ��.16           "+space(15)+str(povst2,9,2)
x_=""+ltrim(str(povst2*100/69575,0))+"% min ���ᨨ"
@ prow()  ,b+33 say x_
endif
st=""
****************************
if kodpens="1"  .and. povst3#0
do case
  case (kodinv$"07,10" .or. datar<ctod("01.05.16") .or. odinoc=1) .and. uchwoin="1" .and. .not. kodinv$"01,02,03,04,05,06"
@ prow()+1,b say "�������� � ���ᨨ �� ��.17�,17�      "+SPACE(15)+str(povst3,9,2)
 x0_=povst3/69575
if x0_=round(povst3/69575,0)
x_=""+" 100%+"+str((x0_-1)*100,0)+"% min ���ᨨ"
else
x_=""+"2/3+"+str((x0_-2/3)*100,0)+"% min ���ᨨ"
endif
@ prow()  ,b+33 say x_
@ prow()+1,b say "(�� �室,���)          "
  case (kodinv$"01,04,07,10" .or. datar<ctod("01.05.16") .or. odinoc=1)
@ prow()+1,b say "�������� �� �室 �� ���� 17� ......"+a+str(povst3,9,2)
  case uchwoin="1" .or. (datar<ctod("01.05.16") .and. kodinv="03")
@ prow()+1,b say "�������� � ���ᨨ �� ���� 17�      "+space(15)+str(povst3,9,2)
x_=""+ltrim(str(povst3*100/69575,0))+"% min ���ᨨ"
@ prow()  ,b+33 say x_
endcase
endi
if povst3#0 .and. kodpens="2"
do case
  case (kodinv$"01,04,07,10" .or. datar<ctod("01.05.16") .or. odinoc=1) .and. uchwoin="1"
@ prow()+1,b say "�������� � ���ᨨ �� ��.24(1.1;2)    "+SPACE(15)+str(povst3,9,2)
x0_=povst3/69575
if x0_=round(povst3/69575,0)
x_=""+" 100%+"+str((x0_-1)*100,4,0)+"% min ����."
else
x_=""+"2/3+"+str((x0_-2/3)*100,0)+"% min ����."
endif
@ prow()  ,b+33 say x_
  case (kodinv$"01,04,07,10" .or. datar<ctod("01.05.16") .or. odinoc=1) .and. uchwoin#"1"
@ prow()+1,b say "����襭�� ���ᨨ �� ���� 24 �.1 �1."+a+str(povst3,9,2)
  case uchwoin="1"
@ prow()+1,b say "����襭�� ���ᨨ �� ���� 24 �.2 ..."+a+str(povst3,9,2)
endcase
endif
*************************************
if povst4#0
st=iif(kodpens="1"," 17� "," 24-2")
@ prow()+1,b say "����襭�� ���ᨨ �� ����"+st+"......"+a+str(povst4,9,2)
endif
if povst1+povst2+povst3+povst4+povmin#0
@ PROW()+2, b+2 say "E����� ����� ������:..............."+a+str(itpens,10,2)+"F"
 endi
kb=kodbank
sele 4
seek kb
nabank=rtrim(name)+" ����"
sele 1
@ prow()+2,b say "���ᨮ��� ����E "+penlist+"   " +nabank+"F"
if komp#0
@ prow()+1,b say repl("-",71-b)
@ prow()+1,b say " 4� ��� 1996 �.�믫�祭� ������p������ ��ᮡ�� � c㬬�E " +str(komp,9,2)+" p�.F"
@ prow()+1,b say " � ���� 51 �����騭� �ࠧ�������� ������ 5"
@ prow()+1,b say repl("-",71-b)
endif
@ prow()+2,b say "P"
retu
