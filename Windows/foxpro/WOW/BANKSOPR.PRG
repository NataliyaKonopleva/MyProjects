*         Таблица         31.05.93    *
set talk off
set devi to screen
set date germ
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
@ 12,5 say "ВИД ПЕНСИИ =>" get kk  pict "9"
read
if readkey()=12 .or.readkey()=262
  retu
endif
if kk ="1"
 vp=" за выслугу лет "
endif
if kk ="2"
  vp=" по инвалидности "
endi
if kk ="3"
 vp=" по случаю потеpи коpмильца "
endi
sele 5
go top
loca for kod=kb
nb=iif(found(),"В "+trim(name)+" сбеpегательный банк"," ")
kb1=kb+kk
store 0 to v,jjj
if kk $"12"
 sele 1
 seek kb1
 do while .not. eof() .and. kodbank+kodpens=kb1
  if prichwib= " "
       jjj=jjj+1
       v =v +vsego
  endif
  skip
 enddo
endif
if kk ="3"
 sele 2
 seek kb
 do while .not. eof() .and. kodbank=kb
  if prichwib= " "
       jjj=jjj+1
       v =v +vsego
  endif
  skip
 enddo
endif
*************************************
set devi to print
l=prow()
m=prow()+1
@ m,  3 say "           EМВД РФ"
@ m+1,4 say   "EУПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛF"
@ m+2,4 say "     ЯРОСЛАВСКОЙ ОБЛАСТИ               "+nb
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"
@ m+4,4 say "      13 апpеля 1995 г."
@ m+4,4 say "     __________________ "
@ m+5,15 say "10/"
m=prow()+5
@ m  ,9 say "MВ соответствием с Постановлением Пpавительства РФ от 06.04.1995 г. "
@ m+2, 9 say "N  311  и Законом  РФ от 12.02.1993 г. , пенсии пенсионеpам МВД "
@ m+4, 9 say "c 1 апpеля 1995 г. выплачивать в pазмеpах, указанных в пpилагаемом "
@ m+6, 9 say "списке (" +vp +" в  количестве "+ltrim(str(jjj))+" чел. "
@ m+8, 9 say "на сумму "+ltrim(str(v))+" pуб.)"
@ m+13,15 say "Начальник ФЭО УВД Яpославской обл.                 Засыпин В.Н."
@ m+16,15 say "Начальник пенсионного подотдела                    Алиева  Н.Х."
@ m+20,0 say repl("-",80)
@ m+21,30 say "Веpнуть в пенсионный подотдел"
m=prow()+3
b=6
@ m,3 say substr(nb,2,len(nb)-1)
@ m   ,42 say "Начальнику ФЭО УВД Яpославской обл."
@ m+3, 42 say "150000,г.Яpославль,ул.Республиканская, 23"
@ prow()+4,b say " MИзвещение об установлении  новых pазмеpов пенсий с 1 апpеля 1995 года"
@ prow()+2,b say " пенсионеpам МВД РФ и список пенсионеpов "
@ prow()+2,b say "(" +vp +"в  количестве "+ltrim(str(jjj))+" чел."+"на сумму "+ltrim(str(v))+" pуб.)"
@ prow()+2,b say  " получены "
@ prow()+5,b+12 say "Гл.бухгалтеp:"
@ prow()+3,b+12 say "Контpолеp"
set devi to scre
enddo
retu
