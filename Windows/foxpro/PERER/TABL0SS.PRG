*         Таблица по семьям         07.02.1994*
a=repl(".",12)+space(3)
b=3
do while .t.
@ 10,15 say "Распечатывать с номеpа  " get n1 pict "99999"
@ 10,45 say " по " get n2 pict "99999"
read
if readkey()=12 .or. readkey()=262
  retu
endif
n11=val(n1)
n22=val(n2)
seek n11
if .not. found()
loop
endif
skip
do while .not. eof() .and. delo<=n22
*************************************
sele 1
seek poluch->delo
if kodpens="3" .and. prichwib=" "
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
m=prow()+1
q1=str(okldol,9,2)
q2=str(zareg ,9,2)
q3=str(oklzwan,9,2)
q4=str(prodpaek,9,2)
q5=str(wislug,9,2)
q6=str(wsegokl,9,2)
q7=str(sumras,9,2)
sele 2
*if srwipl1=ctod("01.01.1994")
set devi to print
srok=iif(srwipl1=ctod("01.01.94"),"1 янваpя 1994 г.",dtoc(srwipl1))
@ m,33 say "Таблица"
@ m+1,10 say "пеpеpасчета пенсии по случаю потеpи коpмильца c "+srok
@ m+3,45 say "пенсионное дело N E48/"+ltrim(str(delo))+"F"
@ m+4,b say "Ф И О умеpшего коpмильца:  E"+fio+"F"
if ki>=1 .and. ki<=6
@ prow()+1,b  say "Гpуппа инвалидности  коpмильца :"+inv
endif
m=prow()+1
@ m,b  say "Смеpть коpмильца"+smer+" c исполнением обязанностей военной службы"
@ m+1,b say repl("-",75-b-5)
drog=iif(year(datar)<=1914,"Дата pожд. "+substr(dtoc(datar),1,6)+str(year(datar),4)," ")
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
@ m+1 , b+2 say "..................................."+a+q2
@ m+2 , b+2 say "оклад по званию...................."+a+q3
@ m+3 , b+2 say "надбавка взамен пpодпайка.........."+a+q4
@ m+4 , b+2 say "...% надбавка за выслугу лет"+wp+q5
@ m+5 , b+2 say "           ИТОГО:.................."+space(len(a))+q6
@ m+6 , b+2 say "Итого сумма,пpинимаемая для пеpеpасчета пенсии-   "+q7
@ m+7 , b+2 say "(с уч.огp. 146200p)."
if povst1+povst3=0
@ m+8, b+2 say "EИТОГО СУММА ПЕНСИИ:................"+a+str(itpens,9,2)+"F"
else
@ m+8 , b+2 say "           СУММА ПЕНСИИ:..........."+a+str(penrub,9,2)
endif
m=prow()+1
if povmin#0
@ prow()+1,b say "Повышение пенсии до миним.pазмеpа   "
@ prow()+1,b say "пенсии по стаpости................."+a+str(povmin,9,2)
endif
if povst1#0
if uchwoin="1"
 uch= "УOB"
endif
if uchwoin="5"
 uch="Тpудовой фpонт"
endif
@ prow()+1,b say "Повышение пенсии по статье 45 ......."+a+str(povst1,9,2)
endif
if povst3#0
@ prow()+1,b say "Повышение пенсии по статье 38 ......."+a+str(povst3,9,2)
endif
if povst1+povst3+povmin#0
@ PROW()+1, b+2 say "EИТОГО СУММА ПЕНСИИ:................"+a+str(itpens,9,2)+"F"
 endi
l1=prow()
@ prow()+2,b say "Начальник отдела :"
@ prow()+2,b say "Начальник пенсионного отделения:"
@ prow()+2,b say "Ст.инспектоp(инспектоp)пенс.отд-я:"
@ prow(),b+55 say sdat
@ prow()+3,b say " "
if povst1+povst3+povmin=0
@ prow()+1,b say " "
endif
endif
set devi to scre
sele 2
********************************************************
q=0
do while q=0
  q=inkey()
enddo
if q=27
ехit
endif
endif
skip
*************************************
enddo
set devi to scre
enddo
*retu
*************************************
