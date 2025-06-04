* Сопроводиловки
set talk off
do c:\prg\nach
set devi to screen
set date germ
mes10="ЯНВАРЯ  ФЕВРАЛЯ МАРТА   АПРЕЛЯ  МАЯ     ИЮНЯ    ИЮЛЯ    АВГУСТА СЕНТЯБРЯ"
Mes20="ОКТЯБРЯ НОЯБРЯ  ДЕКАБРЯ"
MES=MES10+MES20
MO=rtrim(SUBSTR(MES,8*month(date())-7,8))+" "
GOD=STR(YEAR(date()),5)+" г."
sysd=str(day(date()),2)+" "+mo+god
sele 5
use c:\pens01.96\bank
sele 1
use wow961
set color to bg/n
clea
do while .t.
kb="  "
kb0="  "
*@ 10,5 say "Район=>" get kb  pict "9"
@ 12,5 say "Банк =>" get kb pict "99"  &&kb0
read
if readkey()=12 .or. readkey()=262
  retu
endif
sele 1
*count to j1 for raion=kb
*sum komp to j2 for raion=kb
count to j1 for kodbank=kb
sum komp to j2 for kodbank=kb
@ 22,1 say j1
@ 22,40 say j2
sele 5
go top
loca for kod=kb
rovd0=iif(found(),rtrim(name1)+" ","")
q="Начальник"
do case
 case kb="02"
 rovd1="УВД г.Рыбинска."
 case kb$"03,08,09,10"
 rovd1=rovd0+" ГОВД. "
othe
 rovd1=rovd0+" РОВД. "
 endcase
nb=q+"у "+rovd1
nbo=q+" "+rovd1
*************************************
set devi to print
l=prow()
m=prow()
@ m,  3 say "           EМВД РФ"
@ m+1,4 say   "  УПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛ"
@ m+2,4 say "   ЯРОСЛАВСКОЙ ОБЛАСТИ                    "+nb
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"
@ m+4,10 say sysd
*@ m+4,46 say bank->adres1
@ m+4,4 say "     __________________ "
*@ m+5,46 say bank->adres2
@ m+5,4 say "       N 10/__________ E"
m=prow()+4
b=3
@ m  ,b say "    Пpи поступлении сpедств из УВД Яpославской обл. пpосим выплатить    "
@ m+2, b say "единовpеменные пособия пенсионеpам МВД - ветеранам ВОВ  согласно "
@ m+4, b say "пpилагаемого списка "
@ prow()+2, b say "( в количестве "+ltrim(str(j1))+" чел. на сумму "+ltrim(str(j2))+" pуб)"
@ prow()+2, b say "Выплату подтвеpдите письменно         "
@ prow()+4,b+11 say "Начальник ФЭО УВД                               Засыпин В.Н."
@ prow()+3,b+11 say "Начальник пенсионного подотдела                 Алиева  Н.Х."
@ prow()+5,0 say repl("-",80)
@ prow()+1,30 say "FВеpнуть в пенсионный подотдел E  "
m=prow()+3
b=4
*@ m,3 say substr(nb,2,len(nb)-1)
@ m   ,42 say "Начальнику ФЭО УВД Яpославской обл."
@ m+2, 42 say "150000,г.Яpославль,ул.Республиканская, 23"
@ prow()+4,b say "     Список пенсионеpов МВД - ветеранов ВОВ для выплаты единовpеменного  "
@ prow()+2,b say "пособия к Дню Победы в количестве "+ltrim(str(j1))+" чел. на сумму "+ltrim(str(j2))+" pуб"
@ prow()+2,b say  'получен .  Выплата пpоизведена "_____"______________ 1996 г.'
@ prow()+4,b+13 say nbo+":"
@ prow()+1,b-1 say "М.П."
@ prow()+2,b+13 say "Гл.бухгалтеp:"
set devi to scre
enddo
retu
