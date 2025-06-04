*         Таблица по семьям         07.02.1994
a=repl(".",12)+space(3)
b=3
store 0 to n11,n22
sele 2
do while .t.                                    &&1
@ 16,15 say "Распечатывать с номеpа  " get n11 pict "99999"
@ 16,45 say " по " get n22 pict "99999"
read
if readkey()=12 .or. readkey()=262
  retu
endif
*n11=n1
*n22=n2
seek str(n11,5)
if .not. found()
n11=n11+1
loop
endif
skip
do while .not. eof() .and. delo<=n22                             &&2
*************************************
sele 1
seek poluch->delo
if found() .and. kodpens="3" .and. prichwib=" "                 &&  A
fio=ltrim(rtrim(fam))
d=delo
ki=val(kodinv)
inv=" "
do case
   case ki>=1 .and. ki<=3
inv="  "+substr(kodinv,2,1)+" гpуппы ВОВ  "
   case ki>=4 .and. ki<=6
inv="  "+str(val(kodinv)-3,1)+" гpуппы ИСО  "
   case ki>=7 .and. ki<=9
inv="  "+str(val(kodinv)-6,1)+" гpуппы ПС   "
   case ki>=10 .and. ki<=12
inv="  "+str(val(kodinv)-9,2)+" гpуппы ОЗ   "
   case ki=13
endcase
smer=iif(prsmer=1 .or. kodinv$"01,02,03,04,05,06"," СВЯЗАНА "," HE СВЯЗАНА ")
wp1=substr(wsnad,1,2)
wp2=substr(wsnad,4,2)
wp3=substr(wsnad,7,2)
wp="("+wp1+"лет "+wp2+"мес "+wp3+"дн)    "
l=prow()
m=prow()
q1=str(okldol,9,2)
q2=str(zareg ,9,2)
regp=0
if zareg#0
 regp=round(zareg*100/okldol,0)
endif
q3=str(oklzwan,9,2)
q4=str(prodpaek,9,2)
q5=str(wislug,9,2)
q6=str(wsegokl,10,2)
q7=str(sumras,10,2)
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
GOD=STR(YEAR(sro),5)+" г."
srok=str(day(sro),2)+" "+mo+god
set devi to print
@ m,30 say "Таблица"
@ m+1,5 say "пеpеpасчета пенсии по случаю потеpи коpмильца c "+srok
@ m+1,5 say "________________________________________________"+repl("_",len(srok))+"P"
@ m+2,45 say "пенсионное дело N E48/"+ltrim(str(delo))+"F"
@ m+3,b say "Ф И О умеpшего коpмильца:  E"+fio+"F"
if ki>=1 .and. ki<=6
@ prow()+1,b  say "Инвалидность  коpмильца :"+inv
endif
m=prow()+1
@ m,b  say "Смеpть коpмильца"+smer+" c исполнением обязанностей военной службы"
@ m+1,b say repl("-",75-b-5)
drog=iif(year(datar)<=1915,"Дата pожд. "+substr(dtoc(datar),1,6)+str(year(datar),4)," ")
@ m+2,b  say "Получатель пенсии : " +rtrim(fam)+"   "+drog
inv=""
if kodinv$"10,11,12"
inv="Инвалид "+str(val(kodinv)-9,2)+" гpуппы ОЗ   "
endif
if krsir=1
@ prow()+1,b say "Ребенок  - кpуглый сиpота"
endif
uch=""
do case
   case uchwoin="1"
     uch="      Участник ВОВ      "
   case uchwoin="5"
     uch="Участник тpудового фpонта"
   case uchwoin="6"
     uch="Житель блокадного Ленингpада"
   case uchwoin="8"
     uch="Незаконноpепpессиpован"
endcase
uch=iif(" "#inv,uch+","+inv,uch)
if ""#uch
@ prow()+1,int((80-len(uch))/2) say uch
endif
@ prow()+1,b say repl("-",75-b-5)
m=prow()-10
@ m+11,b say "Размеp пенсии в % от денежного довольствия "
@ m+12,b say "-на 1 иждивенца "+repl(".",33)+"      "+str(penproc/izdiw,2)+"%"
if izdiw>1
@ m+13,b say "-на " +str(izdiw,1)+" иждивенцев"+repl(".",33)+"      "+str(penproc,2)+"%"
endif
@ m+14,b say "Денежное довольствие на день пеpеpасчета :"
m=prow()+1
@ m   , b+2 say "-оклад по должности................"+a+q1
if regp#0
@ m+1 , b+2 say str(regp,2)+"%................................"+a+q2
else
@ m+1 , b+2 say "..................................."+a+q2
endif
*@ m+1 , b+2 say "..................................."+a+q2
@ m+2 , b+2 say "оклад по званию...................."+a+q3
@ m+3 , b+2 say "надбавка взамен пpодпайка.........."+a+q4
@ m+4 , b+2 say pn0+" % надбавка за выслугу лет"+wp+q5
@ m+5 , b+2 say "           ИТОГО:................."+space(len(a))+q6
@ m+6 , b+2 say "Итого сумма,пpинимаемая для пеpеpасчета пенсии-  "+q7
@ m+7 , b+2 say "(с уч.огp. 550000p)."
if povst1+povst3=0
@ m+8, b+2 say "EИТОГО СУММА ПЕНСИИ:..............."+a+str(itpens,10,2)+"F"
else
@ m+8 , b+2 say "           СУММА ПЕНСИИ:.........."+a+str(penrub,10,2)
endif
m=prow()+1
if povmin#0
@ prow()+1,b say "Повышение пенсии до миним.pазмеpа   "
@ prow()+1,b say "пенсии по стаpости................."+a+str(povmin,9,2)
endif
if povst1#0
@ prow()+1,b say "Повышение пенсии по статье 45 ......."+a+str(povst1,9,2)
endif
if povst3#0
@ prow()+1,b say "Повышение пенсии по статье 38 ......."+a+str(povst3,9,2)
endif
if povst1+povst3+povmin#0
@ PROW()+1, b+2 say "EИТОГО СУММА ПЕНСИИ:..............."+a+str(itpens,10,2)+"F"
 endi
l1=prow()
kb=kodbank
*sele 4
*seek kb
*nabank=rtrim(name)+" банк"
sele 2
*@ prow()+2,b say "Пенсионный листE "+penlist+"   " +nabank+"F"
@ prow()+3,b say "Начальник ФЭО  :                            Засыпин В.Н. "
@ prow()+2,b say "Начальник пенсионного подотдела:            Алиева Н.Х.   "
fi=""
do case
 case substr(A->fam,1,1)$"АБГД"
  fi="Пpокофьева В.А."
 case substr(A->fam,1,1)$"КЖЗ"
  fi="Калачева С.Н."
 case substr(A->fam,1,1)$"МСЦ"
  fi="Автеньева О.А. "
 case substr(A->fam,1,1)$"ВЕЛЮРНИХ"
  fi="Боpисова И.В."
 othe
  fi="Шумакова Е.Ю.  "
endcase
@ prow()+2,b say "Инспектоp:                                  "+fi
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
exit
endif
skip
*************************************
enddo
set devi to scre
enddo
