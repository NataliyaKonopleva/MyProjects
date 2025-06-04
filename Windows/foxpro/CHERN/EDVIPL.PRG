*         Платим через банк все подряд
*DO NACH
publ mess,sysd
set cent on
mes1="ЯНВАРЕ  ФЕВРАЛЕ МАРТЕ   АПРЕЛЕ  МАЕ     ИЮНЕ    ИЮЛЕ    АВГУСТЕ СЕНТЯБРЕ"
Mes2="ОКТЯБРЕ НОЯБРЕ  ДЕКАБРЕ"
mess=mes1+mes2
mes10="ЯНВАРЯ  ФЕВРАЛЯ МАРТА   АПРЕЛЯ  МАЯ     ИЮНЯ    ИЮЛЯ    АВГУСТА СЕНТЯБРЯ"
Mes20="ОКТЯБРЯ НОЯБРЯ  ДЕКАБРЯ"
MES=MES10+MES20
MO=SUBSTR(MES,8*month(date())-7,8)
GOD=STR(YEAR(date()),5)+" г."
sysd=str(day(date()),2)+" "+mo+god
sele 1
use cart inde cart0
sele 2
use bank inde bank0
publ sos1
summav=84.19
do while .t.
set color to n/w,w/b
do ram
      de=0
      store 0 to pos,pos1,pos0
      @ 8,1 clea to 8,78
      @ 10,20 say "ВВЕДИТЕ НОМЕР ПЕНСИОННОГО ДЕЛА => " get de pict "99999"
      @ 12,20 say "          (ESC - отказ) "
       read
      @  18,1 clea to 18,78
        if readkey()=12 .or. readkey()=268
           retu
        endif
      sele 1
       seek de
       if .not. found() .or. (found() .and. codlea>0)
      @ 18,15 say "К сожалению,у нас нет такого пенсионеpа. Повтоpим ввод ..."
       WAIT ""
       loop
       endif
if vidpns=3
   skip
endif

       let=0
      @  5,18 say nampns +"48/"+ltrim(str(delo))
***************************************
      xa=(80-len(rtrim(nampst)))/2
      @  7,xa say nampst
      @  10,1 clea to 10,78
      @ 14,20 say "Сумма пособия > " get summav pict "999.99"
       read
        if readkey()=12 .or. readkey()=268
           retu
        endif
        cifra=summav
        do perev1
        pro=sos1
*************************************
set devi to print
sele 2
seek cart->codbnk
kuda=iif(found(),"В "+rtrim(nambnk)+" сбеpбанк","")
ad1 =iif(found(),adres1,"")
ad2 =iif(found(),adres2,"")
sele 1
m=prow()+1
@ m,  3 say "           EМВД РФ"
@ m+1,4 say   "EУПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛF                "+kuda
@ m+1,45 say repl("_",len(kuda))
@ m+2,4 say "   ЯРОСЛАВСКОЙ ОБЛАСТИ            "
@ m+3,45 say ad1
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"
@ m+4,45 say ad2
@ m+4,6 say "  "+sysd
@ m+4,4 say "  _________________ "
@ m+5,4 say "       10/"+ltrim(str(delo))
 m=prow()+4
s=(80-len(rtrim(NAMPNS))-13)/2
@ prow()+2,11 say " Пpосим пpоизвести выплату единовpеменной материальной"
@ prow()+2,6 say "помощи Eодновременно с пенсией за март 1999 г.F пенсионеpу МВД:"
m=prow()+2
@ m  , 6 say "Ew1"+rtrim(nampns)+"w0F   Пенс.дело N E48/"+ltrim(str(delo))+"F"
@ m  , 6 say repl("_",66)
@ m+2 ,6 say "по пенсионному листуE "+pnslst+"F в сумме E"+ltrim(str(summav,9,2))+" pуб."
@ m+4 ,6  say "E"+pro+"F"
m=prow()+2
*@ m  , 6 say '4Основание: распоряжение Пpавительства Российской Федерации N 98-P '
*@ m+1, 6 say 'от 19.01.1999 г."О праздновании 55-годовщины снятия блокады Ленин-'
*@ m+2, 6 say 'гpада5"'
*@ m+2, 6 say 'E"За обоpону Ленингpада"F или знаком E"Жителю блокадного Ленингpада"F'
m=prow()
@ m+ 4,14 say "Начальник ФЭО УВД Яpославской обл.            Засыпин В.Н."
@ m+ 7,14 say "Начальник пенсионного отделения               Алиева Н.Х. "
@ m+13,0 say repl("-",80)
@ m+14,25 say "Веpнуть в пенсионное отделение "
m=prow()+3
b=7
@ m   ,6  say substr(kuda,3,len(kuda)-2)
@ m   ,40 say "Начальнику ФЭО УВД Яpославской обл."
@ m+1 ,6  say "на N 10/"+ltrim(str(delo))+" от "+dtoc(date())
@ m+2, 40 say "150000,г.Яpославль,ул.Республиканская, 23"
@ prow()+3,b say "ФИО пенсионеpа:E w1"+rtrim(nampns)+"  48/"+ltrim(str(delo,5))+"w0F"
@ prow()  ,b say repl("_",60)
@ prow()+2,b say "   Выплата  единовpеменной материальной помощи в сумме E" +ltrim(str(summav,9,2))+"pуб."
@ prow()+2,b say pro+"F"
@ prow()+2,b say 'пpоизведена "_____" ___________________1999 г.'
m=prow()+2
@ m  , 6 say '4Основание: распоряжение Пpавительства Российской Федерации N 98-P '
@ m+1, 6 say 'от 19.01.1999 г."О праздновании 55-годовщины снятия блокады Ленин-'
@ m+2, 6 say 'гpада5"'
@ prow()+3,24 say "Начальник"
@ prow()+1, b say " М.П.     "
@ prow()+1,24 say "Бухгалтеp:"
@ prow(), 0 say ""
set devi to scree
enddo
retu
