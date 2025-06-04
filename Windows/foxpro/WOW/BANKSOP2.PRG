
set talk off
set devi to screen
set date germ
mes10="ЯНВАРЯ  ФЕВРАЛЯ МАРТА   АПРЕЛЯ  МАЯ     ИЮНЯ    ИЮЛЯ    АВГУСТА СЕНТЯБРЯ"
Mes20="ОКТЯБРЯ НОЯБРЯ  ДЕКАБРЯ"
MES=MES10+MES20
MO=rtrim(SUBSTR(MES,8*month(date())-7,8))+" "
GOD=STR(YEAR(date()),5)+" г."
sysd=str(day(date()),2)+" "+mo+god
sele 1
use wow96 inde wow96b
sele 5
use bank
set color to bg/n
clea
do while .t.
kb="  "
@ 10,5 say "Банк=>" get kb  pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
sele 5
go top
loca for kod=kb
nb=iif(found(),"В "+trim(name)+" сбеpбанк"," ")
sele 1
seek kb
store 0 to k,v
 do while .not. eof() .and. kodbank=kb
  if prichwib= " "
       k=k+1
       v =v +komp
  endif
  skip
 enddo
*************************************
set devi to print
l=prow()
m=prow()
@ m,  3 say "           EМВД РФ"
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
@ m  ,b say "        В соответствии с Указом Президента РФ N 425 просим "
@ m+2, b say "произвести единовременную выплату участникам и инвалидам ВОВ"
@ m+4, b say "1941-1945 г. в размере минимальной пенсии по старости "
@ m+6, b say "-1Eодновременно с выплатой пенсии за май 1996 г.-0F"
@ m+8, b say "согласно прилагаемого списка в количестве "+str(k,3)+"чел."
@ m+10, b say "на сумму " + str(v,8,0)+"руб."
@ prow()+5,b+11 say "Начальник ФЭО УВД                          Засыпин В.Н."
@ prow()+3,b+11 say "Начальник пенсионного подотдела            Алиева  Н.Х."
@ prow(),b+11 say " "
@ prow()+4,0 say repl("-",80)
@ prow()+1,30 say "FВеpнуть в пенсионный подотдел   "
m=prow()+3
b=4
@ m,3 say substr(nb,2,len(nb)-1)
@ m   ,42 say "Начальнику ФЭО УВД Яpославской обл."
@ m+2, 42 say "150000,г.Яpославль,ул.Республиканская, 23"
@ prow()+4,b say "     Извещение о единовременной выплате участникам и инвалидам"
@ prow()+2,b say "ВОВ одновременно с выплатой пенсии за май 1996 г., и список "
@ prow()+2,b say "пенсионеров в количестве "+str(k,3)+"чел. на сумму " + str(v,8,0)+"руб."
@ prow()+2,b say  'получены  "_____"______________ 1996 г.'
@ prow()+3,b+11 say "Гл.бухгалтеp:"
@ prow()+1,b-1 say "М.П."
@ prow()+2,b+11 say "Контpолеp"
set devi to scre
enddo
retu
