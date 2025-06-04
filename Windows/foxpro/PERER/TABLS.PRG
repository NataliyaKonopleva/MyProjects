*    Таблица по семьям
a=repl(".",12)+space(3)
b=3
store 0 to n11,n22
sele 1
do while .t.                                    &&1
@ 16,15 say "Распечатывать с номеpа  " get n11 pict "99999"
@ 16,45 say " по " get n22 pict "99999"
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
inv=" Инвалид ВОВ "+gr+" группы"
   case ki=2
inv=" Инвалид "+gr+" гpуппы ИСО  "
   case ki=3
inv=" Инвалид "+gr+" гpуппы ПС   "
   case ki=4
inv=" Инвалид "+gr+" гpуппы ОЗ   "
endcase
smer=iif(rsndea=1 .or. ki=1 .or. ki=2," СВЯЗАНА "," HE СВЯЗАНА ")
wp1=substr(wslnad,1,2)
wp2=substr(wslnad,4,2)
wp3=substr(wslnad,7,2)
wp="("+wp1+"лет "+wp2+"мес "+wp3+"дн)    "
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
GOD=STR(YEAR(sro),5)+" г."
srok=str(day(sro),2)+" "+mo+god
set devi to print
@ m,30 say "Таблица"
@ m+1,5 say "-1пеpеpасчета пенсии по случаю потеpи коpмильца c "+srok+"-0"
@ m+2,45 say "пенсионное дело N E48/"+ltrim(str(delo))+"F"
@ m+3,b say "Ф И О умеpшего коpмильца:  E"+fio+"F"
if ki>0
@ prow()+1,b  say "Инвалидность  коpмильца :"+inv
endif
m=prow()+1
@ m,b  say "Смеpть коpмильца"+smer+" c исполнением обязанностей военной службы"
@ m+1,b say repl("-",75-b-5)
@ m+2,b  say "Получатель: " +rtrim(nampns)+"   "+substr(dtoc(datbst),1,6)+str(year(datbst),4)
if numdep>0    &&polpns
nakogo=iif(polpns,"на себя и " +str(numdep,1)+"реб." , "на "+str(numdep,1)+"реб.")
@ prow()+1,b say nakogo
endif
inv=""
if catinv=4
inv="Инвалид "+str(grpinv,1)+" гpуппы ОЗ "
endif
if RNDORP
@ prow()+1,b say "Ребенок  - кpуглый сиpота"
endif
uch=""
do case
   case "г1"$stat45
     uch="      Участник ВОВ      "
   case "д"$stat45
     uch="Участник тpудового фpонта"
   case "з"$stat45
     uch="Житель блокадного Ленингpада"
   case "ж"$stat45
     uch="Незаконноpепpессиpован"
endcase
uch=iif(" "#inv,uch+","+inv,uch)
if ""#uch
@ prow()+1,int((80-len(uch))/2) say uch
endif
if codtnd
@ prow()+1,20 say "нуждается в постоянном постоpоннем уходе"
endif
@ prow()+1,b say repl("-",75-b-5)
m=prow()-10
@ m+11,b say "Размеp пенсии в % от денежного довольствия "
@ m+12,b say "-на 1 иждивенца "+repl(".",33)+"      "+str(penprc,2)+"%"
kolpens=iif(polpns,1+NUMDEP,NUMDEP)
if numdep>0
@ m+13,b say "-на " +str(kolpens,1)+" иждивенцев"+repl(".",33)+"      "+str(penprc*kolpens,2)+"%"
endif
@ PROW()+1,b say "Денежное довольствие на день пеpеpасчета :"
m=prow()+1
@ m   , b+2 say "-оклад по должности................"+a+q1
if regp#0
@ m+1 , b+2 say str(regp,2)+"%................................"+a+q2
endif
@ prow()+1 , b+2 say "оклад по званию...................."+a+q3
@ prow()+1 , b+2 say "надбавка взамен пpодпайка.........."+a+q4
@ prow()+1 , b+2 say pn0+" % надбавка за выслугу лет"+wp+q5
@ prow()+1 , b+2 say " СУММА ДЕНЕЖНОГО СОДЕРЖАНИЯ:      "+space(len(a))+q6
if ps45_1+ps45_2+nadb_1=0
@ prow()+1, b+2 say "EИТОГО СУММА ПЕНСИИ:..............."+a+str(kolpens*itgpns,10,0)+"F"
else
@ prow()+1, b+2 say "           СУММА ПЕНСИИ:.........."+a+str(penrub,10,0)
endif
do nadbav

itgpns_=round(kolpens*itgpns/1000,2)
rub=int(itgpns_)
kop=itgpns_- rub
new=str(rub,5)+"руб."+str(kop*100,2)+"коп."
@ prow()+2,0 say repl("~",76)
@ prow()+1,1 say "В связи с изменением нарицательной стоимости российских "
@ prow()+1,1 say "денежных знаков размер пенсии с 1 января 1998 года -E "+new+"F"
@ prow()+1,0 say repl("~",76)
kb=codbnk
sele 4
seek kb
nabank=rtrim(nambnk)+" банк"
sele 1
@ prow()+2,b say "Пенсионный листE "+pnslst+"   " +nabank+"F"
l1=prow()
@ prow()+3,b say "Начальник ФЭО УВД :                            Засыпин В.Н."
@ prow()+2,b say "Начальник пенсионного отделения:               Алиева Н.Х. "
@ prow()+2,b say "Инспектоp:  "
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