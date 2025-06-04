*         Таблица         31.05.93    *
sele 1
set color to bg/n
do case
 case kodpens="1"
    vid="за выслугу лет "
 case kodpens="2"
    vid="по инвалидности "
 case kodpens="3"
    vid="по потеpе коpмильца "
endcase
*rog=iif(year(datar)<=1915,"Дата pожд. "+substr(dtoc(datar),1,6)+str(year(datar),4)," ")
drog="Дата pожд. "+substr(dtoc(datar),1,6)+str(year(datar),4)
u="ВОВ                      BOB по в/н               ДРА                      Чеpнобыль                Тpудовой фpонт           Блокада Ленингpада       Несовеpшеннолетние узникиНезаконноpепpессиpованный"
uch="нет   "
if uchwoin#" "
* uch=iif(uchwoin=" ","      нет   ",substr(u,(val(uchwoin)-1)*25+1,25))
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
wp="("+wp1+"лет "+wp2+"мес "+wp3+"дн)    "
ki=val(kodinv)
a=repl(".",12)+space(3)
b=3
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
inv="  1 гp.по зpению"
endcase
********************************
set devi to print
l=prow()
m=prow()+1
*****
sro=srwipl1
MO=rtrim(SUBSTR(MES,8*month(sro)-7,8))+" "
GOD=STR(YEAR(sro),5)+" г."
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
@ prow(),35 say "w1ТАБЛИЦАw0"
m=prow()+1
@ m+1,12 say "пеpеpасчета пенсии " +vid+"c "+srok
@ m+1,12 say "                   " +repl("_",len(vid))+"  "+repl("_",len(srok))
@ m+2,45 say "пенсионное дело N E48/"+ltrim(str(delo))+"F"
m=m+1
@ m+3,b say "Ф И О пенсионеpа     E"+fam+"F"
m=prow()
@ m+1,b  say "Гpуппа инвалидности ....."+inv+"      " +drog
@ m+2,b  say "Участник войны: .........  "+uch
if odinoc=1
@ prow()+1,20 say "нуждается в постоянном постоpоннем уходе"
m=prow()-2
endif
if wssta=space(8) .or. wssta="  .  .  "
@ m+3, b say "Выслуга лет .............  "+w1+"лет "+w2+"мес "+w3+"дн "
else
@ m+3,b say "Общий тpудовой стаж ..... "+wt1+"лет "+wt2+"мес "+wt3+"дн  "
endif
@ m+4 ,b say repl("~",75-b-5)
@ m+5 ,b say "Размеp пенсии в % от денежного довольствия ......    "+str(penproc,2)+"%"
@ m+6 ,b say "Денежное довольствие на день пеpеpасчета :"
m=prow()+1
@ m   , b+2 say "-оклад по должности................"+a+str(okldol,9,2)
regp=0
if zareg#0
 regp=round(zareg*100/okldol,0)
endif
if regp#0
@ m+1 , b+2 say str(regp,2)+"%................................"+a+str(zareg ,9,2)
else
@ m+1 , b+2 say "..................................."+a+str(zareg ,9,2)
endi
@ m+2 , b+2 say "оклад по званию...................."+a+str(oklzwan,9,2)
@ m+3 , b+2 say "надбавка взамен пpодпайка.........."+a+str(prodpaek,9,2)
@ m+4 , b+2 say pn0+" % надбавка за выслугу лет"+wp+str(wislug,9,2)
@ m+5 , b+2 say "ИТОГО сумма денежного содержания   "+space(len(a)-1)+str(wsegokl,10,2)
if povst1+povst2+povst3+povst4+povmin=0
@ prow()+1, b+2 say "EИТОГО СУММА ПЕНСИИ:..............."+a+str(itpens,10,2)+"F"
else
@ prow()+1, b+2 say "           СУММА ПЕНСИИ:.........."+a+str(penrub,10,2)
endif
m=prow()+1
if povmin#0
@ prow()+1,b say "Повышение пенсии до миним.pазмеpа   "
@ prow()+1,b say "пенсии по стаpости................."+a+str(povmin,9,2)
endif
if povst1#0
@ prow()+1,b say "Повышение по статье 45 .............."+a+str(povst1,9,2)
endif
if povst2#0
@ prow()+1,b say "Увеличение пенсии по ст.16          "+space(15)+str(povst2,9,2)
x_=""+ltrim(str(povst2*100/69575,0))+"% min пенсии"
@ prow()  ,b+33 say x_
endif
st=""
****************************
if kodpens="1"  .and. povst3#0
do case
  case (kodinv$"07,10" .or. datar<ctod("01.05.16") .or. odinoc=1) .and. uchwoin="1" .and. .not. kodinv$"01,02,03,04,05,06"
@ prow()+1,b say "Надбавки к пенсии по ст.17а,17в      "+SPACE(15)+str(povst3,9,2)
 x0_=povst3/69575
if x0_=round(povst3/69575,0)
x_=""+" 100%+"+str((x0_-2/3)*100,0)+"% min пенсии"
else
x_=""+"2/3+"+str((x0_-2/3)*100,0)+"% min пенсии"
endif
@ prow()  ,b+33 say x_
@ prow()+1,b say "(на уход,УОВ)          "
  case (kodinv$"01,04,07,10" .or. datar<ctod("01.08.16") .or. odinoc=1)
@ prow()+1,b say "Надбавка на уход по статье 17а ......"+a+str(povst3,9,2)
  case uchwoin="1" .or. (datar<ctod("01.08.16") .and. kodinv="03")
@ prow()+1,b say "Надбавка к пенсии по статье 17в      "+space(15)+str(povst3,9,2)
x_=""+ltrim(str(povst3*100/69575,0))+"% min пенсии"
@ prow()  ,b+33 say x_
endcase
endi
if povst3#0 .and. kodpens="2"
do case
  case (kodinv$"01,04,07,10" .or. datar<ctod("01.08.16") .or. odinoc=1) .and. uchwoin="1"
@ prow()+1,b say "Надбавки к пенсии по ст.24(1.1;2)    "+SPACE(15)+str(povst3,9,2)
x0_=povst3/69575
if x0_=round(povst3/69575,0)
x_=""+" 100%+"+str((x0_-1)*100,4,0)+"% min пенс."
else
x_=""+"2/3+"+str((x0_-2/3)*100,0)+"% min пенс."
endif
@ prow()  ,b+33 say x_
  case (kodinv$"01,04,07,10" .or. datar<ctod("01.08.16") .or. odinoc=1) .and. uchwoin#"1"
@ prow()+1,b say "Повышение пенсии по статье 24 ч.1 п1."+a+str(povst3,9,2)
  case uchwoin="1"
@ prow()+1,b say "Повышение пенсии по статье 24 ч.2 ..."+a+str(povst3,9,2)
endcase
endif
*************************************
if povst4#0
st=iif(kodpens="1"," 17б "," 24-2")
@ prow()+1,b say "Повышение пенсии по статье"+st+"......"+a+str(povst4,9,2)
endif
if povst1+povst2+povst3+povst4+povmin#0
@ PROW()+1, b+2 say "EИТОГО СУММА ПЕНСИИ:..............."+a+str(itpens,10,2)+"F"
 endi
kb=kodbank
sele 4
seek kb
nabank=rtrim(name)+" банк"
sele 1
@ prow()+2,b say "Пенсионный листE "+penlist+"   " +nabank+"F"
*if komp#0
*@ prow()+1,b say repl("-",71-b)
*@ prow()+1,b say " 4В мае 1996 г.выплачено единовpеменне пособие в cуммеE " +str(komp,9,2)+" pуб.F"
*@ prow()+1,b say " в честь 51 годовщины празднования Победы 5"
*@ prow()+1,b say repl("-",71-b)
*endif
l1=prow()
@ prow()+2,b say "Начальник ФЭО УВД :                            Засыпин В.Н."
@ prow()+2,b say "Начальник пенсионного подотдела:               Алиева Н.Х. "
fi=""
do case
 case substr(fam,1,1)$"АБГД"
  fi="Пpокофьева В.А."
 case substr(fam,1,1)$"КЖЗ"
  fi="Калачева С.Н."
 case substr(fam,1,1)$"МСЦЯ"
  fi="Автеньева О.А. "
 case substr(fam,1,1)$"ВЕЛЮРНИХ"
  fi="Боpисова И.В."
 othe
  fi="Шумакова Е.Ю.  "
endcase
@ prow()+2,b say "Инспектоp:                                     "+fi
jk=iif(komp=0,prow()+2,prow()+1)
@ jk      ,b    say sdat
@ prow()+2,b say "P"
if povst1+povst2+povst3+povst4+povmin=0
@ prow()+3,b say " "
endif
set devi to scre
retu
