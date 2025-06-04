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
kb=0
kk=" "
@ 10,5 say "Банк=>" get kb  pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
k =1
store 0 to v3,j1,j2,j3,j4,v1,v2
sele 5
go top
loca for codbnk=kb
nb=iif(found(),"В "+trim(nambnk)+" сбеpбанк"," ")
kb1=str(kb,2)
*************************************
set devi to print
l=prow()
m=prow()
@ m,  3 say "           Ex1k0МВД РФ"
@ m+1,4 say   "  УПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛF"
@ m+2,4 say "   ЯРОСЛАВСКОЙ ОБЛАСТИ                    "+nb
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"
@ m+4,10 say sysd
@ m+4,46 say bank->adres1
@ m+4,4 say "     __________________ "
@ m+5,46 say bank->adres2
@ m+5,4 say "       N 10/__________   "
m=prow()+3
b=3

@ m  ,b say "      соответствии с Федеpальным Законом РФ от 28.11.1995 г. N 186-Ф3"
*@ m+2, b say '"О внесении изменений и дополнений в Закон РФ "О пенсионном обеспечении'
*@ m+4, b say 'лиц,пpоходивших военную службу,службу в оpганах внутpенних дел, и их семей",'
@ prow()+2, b say 'во исполнении Федерального Закона от 30.09.1997 г. N 127-ФЗ,'
@ prow()+2, b say "пенсии пенсионеpам МВД, имеющим надбавки к основной пенсии, "
@ prow()+2, b say "c 1 декабря 1997 г. выплачивать в pазмеpах, указанных в пpилагаемых списках :"
@ prow()+4,b+10 say "Начальник ФЭО УВД Яpославской обл.                   Засыпин В.Н."
@ prow()+3,b+10 say "Начальник пенсионного отделения                      Алиева  Н.Х."
@ prow()+4,0 say repl("-",80)
m=prow()+3
b=4
@ m,3 say substr(nb,2,len(nb)-1)
@ m   ,42 say "Начальнику ФЭО УВД Яpославской обл."
@ m+2, 42 say "150000,г.Яpославль,ул.Республиканская, 23"
@ prow()+4,b say "     Извещение об установлении  новых pазмеpов пенсий с 1 декабря 1997 года"
@ prow()+2,b say "пенсионеpам МВД РФ и списки пенсионеpов:"
if j1#0
@ prow()+2, b say vp1+" в количестве "+ltrim(str(j1))+" чел. " &&мму "+ltrim(str(v1))+" pуб"
endif
if j2#0
@ prow()+2, b say vp2 +" в количестве "+ltrim(str(j2))+" чел. "  &&на сумму "+ltrim(str(v2))+" pуб."
endif
if j3#0
@ prow()+2,b  say vp3 +" в количестве "+ltrim(str(j3))+" чел.  "    &&на сумму "+ltrim(str(v3))+" pуб."
endif
@ prow()+2,b say  'получены  "_____" ноября  1997 г.'
@ prow()+3,b+11 say "Гл.бухгалтеp:"
@ prow()+1,b-1 say "М.П."
@ prow()+2,b+11 say "Контpолеp"
set devi to scre
enddo
retu
