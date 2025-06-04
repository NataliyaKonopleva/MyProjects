*         Таблица         31.05.93    *
sele 1
set color to bg/n
do case
 case vidpns=1
    vid="за выслугу лет "
 case vidpns=2
    vid="по инвалидности "
 case vidpns>=3
    vid="по потеpе коpмильца "
endcase
drog="Дата pожд. "+substr(dtoc(datbst),1,6)+str(year(datbst),4)
s_45=stat45
    uc0=iif("ж"$stat45,"Незаконнорепрессированный ","")
 uc=" "
 if "ж"$stat45
    uc=uc+"Незаконнорепрессированный "
 endif
  if "г1"$stat45
     uc=uc+"Участник ВОВ"
  endif
  if "д"$stat45
     uc=uc+"Участник трудового фронта"
   endif
  if "г2"$stat45
     uc=uc+"Участник операций по борьбе с бандитизмом "
  endif
  if  "г4"$stat45
      uc=uc+"Участник боевых действий за границей"
  endif
  if "е"$stat45
     uc=uc+"Несовершеннолетний узник "
  endif
  if "з"$stat45
    uc=uc+"Житель блокадного Ленинграда"
  endif
  if "a2"$stat45
     uc=uc+"Герой Советского Союза"
  endif
  if "a3"$stat45
     uc=uc+"Кавалер Ордена Славы 3 ст."
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
wp="("+wp1+"лет "+wp2+"мес "+wp3+"дн)    "
ki=catinv
gr=str(grpinv,1)
a=repl(".",12)+space(3)
b=3
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
GOD=STR(YEAR(sro),5)+" г."
srok=str(day(sro),2)+" "+mo+god
@ prow(),30 say "ТАБЛИЦА"
m=prow()+1
@ m+1,12 say "пеpеpасчета пенсии " +vid+"c "+srok
@ m+1,12 say "                   " +repl("_",len(vid))+"  "+repl("_",len(srok))
@ m+2,45 say "пенсионное дело N E48/"+ltrim(str(delo))+"F"
m=m+1
@ m+3,b say "Ф И О пенсионеpа     E"+nampns+"F"
m=prow()
@ m+1,b  say "Гpуппа инвалидности ....."+inv+"  " +drog
@ m+2,b  say "Участник войны: .........  "+uch
if codtnd
@ prow()+1,20 say "нуждается в постоянном постоpоннем уходе"
m=prow()-2
endif
if wslsta=space(8) .or. wslsta="  .  .  "
@ m+3, b say "Выслуга лет .............  "+w1+"лет "+w2+"мес "+w3+"дн "
else
@ m+3,b say "Общий тpудовой стаж ..... "+wt1+"лет "+wt2+"мес "+wt3+"дн  "
endif
@ m+4 ,b say repl("~",75-b-5)
@ m+5 ,b say "Размеp пенсии в % от денежного довольствия ......    "+str(penprc,2)+"%"
@ m+6 ,b say "Денежное довольствие на день пеpеpасчета :"
m=prow()+1
@ m   , b+2 say "-оклад по должности................"+a+str(salpst,9,0)
regp=0
if increg>0
 regp=prcreg
@ prow()+1 , b+2 say str(regp,2)+"%..- за режим(особые условия)...."+a+str(increg,9,0)
endi
@ prow()+1 , b+2 say "оклад по званию...................."+a+str(salrnk,9,0)
@ prow()+1 , b+2 say "надбавка взамен пpодпайка.........."+a+str(sumprp,9,0)
@ prow()+1 , b+2 say pn0+" % надбавка за выслугу лет"+wp+str(incwsl,9,0)
@ prow()+1 , b+2 say "ИТОГО сумма денежного содержания   "+space(len(a)-1)+str(totsal,10,0)
if povs16+nadb_1+nadb_2+nadb_3+nadrad+ps45_1+ps45_2=0
@ prow()+1, b+2 say "EИТОГО СУММА ПЕНСИИ:................"+a+str(itgpns,10,0)+"F"
else
@ prow()+1, b+2 say "          СУММА ПЕНСИИ:..........."+a+str(penrub,10,0)
*****************
do nadbav
***************************
endif
sele 1
if penrub=B->penrub
@ prow()+3, 25 say "EПерерасчет "
@ prow()+2,10 say "с 1 декабря 1997г. в связи с установлением "
@ prow()+1,10 say "        min размера пенсии 84186 рубF"
@ prow()+2, b+2 say "           СУММА ПЕНСИИ:.........."+a+str(penrub,10,0)
 do nadbav
sele 1
else
set devi to scre
retu
endif
itgpns_=round(itgpns/1000,2)
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
@ prow()+2,b say "P"
set devi to scre
retu
**************************************************************
procedure nadbav
m=prow()+1
if povmin#0
@ prow()+1,b say "Повышение пенсии до миним.pазмеpа   "
@ prow()+1,b say "пенсии по стаpости................."+a+str(povmin,9,0)
endif
if povs16#0
@ prow()+1,b say "Увеличение пенсии по ст.16           "+space(15)+str(povs16,9,0)
mp=iif(select()=1,84186,76533)
x_=""+ltrim(str(povs16*100/mp,0))+"% min пенсии"
@ prow()  ,b+33 say x_
endif
st=""
if ps45_1#0
@ prow()+1,b say "Повышение по статье 45 .............."+a+str(ps45_1,9,0)
endif
if ps45_2#0
@ prow()+1,b say "                       .............."+a+str(ps45_2,9,0)
endif
****************************
_17v=""
if nadb_3>0
_17v="   Участник ВОВ "
endif
if grpinv=1 .or. grpinv=2
_17v=" УОВ,инвалид "+gr+"гр"
endif
if datbst<ctod("01.12.17")
 _17v="  УОВ+80лет    "
endif
***********************************
x_=""
if datbst<ctod("01.12.97") .or. grpinv=1
x_=iif(datbst<ctod("01.12.17"),"старше 80 лет "," на уход инвалиду 1 гр ")
x_=""+x_+""
ENDIF
************************************
if nadrad>0
@ prow()+1,b say "Участник ликвидации АВАРИИ НА ЧАЭС   "+repl(".",15)+str(nadrad,9,0)
endif
if vidpns=1
if  nadb_1#0
@ prow()+1,b say "Надбавка к пенсии по ст.17а          "+space(15)+str(nadb_1,9,0)
@ prow()  ,b+33 say x_
endif
if  nadb_2#0
@ prow()+1,b say "Надбавка к пенсии по статье 17б ...(на иждивенцев).."+str(nadb_2,9,0)
endif
if nadb_3>0
@ prow()+1,b say "Надбавка к пенсии по ст.17в          "+space(15)+str(nadb_3,9,0)
@ prow()  ,b+33 say _17v
endif
endif                   &&за в/лет
if vidpns=2
if nadb_1#0
@ prow()+1,b say "Надбавка к пенсии по ст.24(1.1)      "+SPACE(15)+str(nadb_1,9,0)
@ prow()  ,b+33 say x_
endif
if nadb_2#0
@ prow()+1,b say "Надбавка к пенсии по статье 24(1.2)(на иждивенцев)  "+str(nadb_2,9,0)
endif
if nadb_3#0
@ prow()+1,b say "Повышение пенсии по статье 24 ч.2                   "+str(nadb_3,9,0)
@ prow()  ,b+33 say _17v
endif
endif
*************************************
@ prow()+1, b+2 say "EИТОГО СУММА ПЕНСИИ:..............."+a+str(itgpns,10,0)+"F"
retu
