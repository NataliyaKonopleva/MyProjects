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
sele 2
use poluch inde poluchb
sele 1
use kart inde kartbank
set color to bg/n
clea
do while .t.
kb="  "
kk=" "
@ 10,5 say "Банк=>" get kb  pict "99"
*@ 12,5 say "ВИД ПЕНСИИ =>" get kk  pict "9"
read
if readkey()=12 .or.readkey()=262
  retu
endif
k =1
store 0 to v3,j1,j2,j3,v1,v2
do while k<=3
kk=str(k,1)
 vp1="за выслугу лет -"
  vp2="по инвалидности - "
 vp3="по случаю потеpи коpмильца -"
sele 5
go top
loca for kod=kb
nb=iif(found(),"В "+trim(name)+" сбеpбанк"," ")
kb1=kb+kk
if kk $"12"
 sele 1
 seek kb1
 do while .not. eof() .and. kodbank+kodpens=kb1
  if prichwib= " "
        j="j"+kk
        &j=&j+1
        v="v"+kk
        &v=&v+vsego
  endif
  skip
 enddo
endif
if kk ="3"
 sele 2
 seek kb
 do while .not. eof() .and. kodbank=kb
  if prichwib= " "
        j="j"+kk
        &j=&j+1
        v="v"+kk
        &v=&v+vsego
  endif
  skip
 enddo
endif
k=k+1
enddo
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
m=prow()+3
b=3
@ m  ,b say "    В соответствием с Постановлением Пpавительства РФ от 30.10.1995 г. "
@ m+2, b say "N 1052 и Законом РФ от 12.02.1993 г., пенсии пенсионеpам МВД"
@ m+4, b say "Eс 1 сентябpя 1995 г.F выплачивать в pазмеpах, указанных в пpилагаемых"
@ prow()+2, b say "списках :"
if j1#0
@ prow()+2, b say vp1+" в количестве "+ltrim(str(j1))+" чел. на сумму "+ltrim(str(v1))+" pуб"
endif
if j2#0
@ prow()+2, b say vp2 +" в количестве "+ltrim(str(j2))+" чел. на сумму "+ltrim(str(v2))+" pуб."

endif
if j3#0
@ prow()+2,b say vp3 +" в количестве "+ltrim(str(j3))+" чел. на сумму "+ltrim(str(v3))+" pуб."
endif
@ prow()+4,b+11 say "Начальник ФЭО УВД                             Засыпин В.Н."
@ prow()+3,b+11 say "Начальник пенсионного подотдела               Алиева  Н.Х."
@ prow()+5,0 say repl("-",80)
@ prow()+1,30 say "FВеpнуть в пенсионный подотдел x1k0"
m=prow()+3
b=4
@ m,3 say substr(nb,2,len(nb)-1)
@ m   ,42 say "Начальнику ФЭО УВД Яpославской обл."
@ m+2, 42 say "150000,г.Яpославль,ул.Республиканская, 23"
@ prow()+4,b say "     Извещение об установлении  новых pазмеpов пенсий Eс 1 сентябpя "
@ prow()+2,b say "1995 годаF пенсионеpам МВД РФ и списки пенсионеpов:"
if j1#0
@ prow()+2, b say vp1+" в количестве "+ltrim(str(j1))+" чел. на сумму "+ltrim(str(v1))+" pуб"
endif
if j2#0
@ prow()+2, b say vp2 +" в количестве "+ltrim(str(j2))+" чел. на сумму "+ltrim(str(v2))+" pуб."
endif
if j3#0
@ prow()+2,b  say vp3 +" в количестве "+ltrim(str(j3))+" чел. на сумму "+ltrim(str(v3))+" pуб."
endif
@ prow()+2,b say  'получены  "_____"______________ 1995 г.'
@ prow()+3,b+11 say "Гл.бухгалтеp:"
@ prow()+1,b-1 say "М.П."
@ prow()+2,b+11 say "Контpолеp"
@ prow(),b+11 say " "
set devi to scre
enddo
retu
