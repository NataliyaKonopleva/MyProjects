*         Таблица         31.05.93    *
set talk off
set devi to screen
set date germ
mes10="ЯНВАРЯ  ФЕВРАЛЯ МАРТА   АПРЕЛЯ  МАЯ     ИЮНЯ    ИЮЛЯ    АВГУСТА СЕНТЯБРЯ"
Mes20="ОКТЯБРЯ НОЯБРЯ  ДЕКАБРЯ"
MES=MES10+MES20
MO=rtrim(SUBSTR(MES,8*month(date())-7,8))+" "
GOD=STR(YEAR(date()),5)+" г."
sysd=str(day(date()),2)+" "+mo+god
sele 5
use bank
set color to bg/n
clea
do while .t.
kb="  "
@ 10,5 say "Банк=>" get kb  pict "99"
read
if readkey()=12 .or.readkey()=262
  retu
endif
go top
loca for kod=kb
nb=iif(found(),"В "+trim(name)+" сбеpбанк"," ")
*************************************
set devi to print
l=prow()
m=prow()
@ m,  3 say "           Ex1k0МВД РФ"
@ m+1,4 say   "  УПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛF"
@ m+2,4 say "   ЯРОСЛАВСКОЙ ОБЛАСТИ                    "+nb
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"
@ m+4,8 say sysd
@ m+4,46 say bank->adres1
@ m+4,4 say "   __________________ "
@ m+5,46 say bank->adres2
@ m+5,4 say "     N 10/__________ "
m=prow()+5
b=5
@ m  ,b say "        Пpосим выслать в пенсионный подотдел УВД  для пpовеpки "
@ m+2, b say "выписки из лицевых счетов пенсионеpов МВД за 1995 г.  "
@ prow()+5,b+11 say "Начальник ФЭО УВД                          Засыпин В.Н."
@ prow()+3,b+11 say "Начальник пенсионного подотдела            Алиева  Н.Х."
@ prow(),b+11 say " "
set devi to scre
enddo
retu
