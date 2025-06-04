*  Список компенсаций по банкам
set devi to screen
set date germ
set cent on
sele 8
use bank
sele 4
use chern
sele 1
use chernv00
kk=0
dsp=date()
@ 20,1 say "Дата списка " get dsp
@ 21,1 say "Код банка"    get kk pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endi
************
store 0 to kol_,de,V
do while .not. eof()
if datav=dsp .and. codbnk=kk
kol_=kol_+1
v=v+sum1+sum2
endif
skip
enddo
@ 22,1 say "В списке будет "+ltrim(str(kol_))+" чел. -" +str(v,10,2)+"руб."
wait " "
if kol_=0
 retu
endi
***********
do while .t.
set devi to scre
M20="  Печать списка                 "
M21="  Сопроводиловка в сбербанк     "
do M1 WITH 20,21,1,25
  if G=27
   exit
  endif
do case
   case g=20
    do spisok
   case g=21
    do sopr
endcase
enddo                 && по второму меню
**********************************
procedure sopr
set devi to print
@ prow(),1 say  "E"
sele 4
seek str(kb,2)
m=prow()
@ m+1,4 say   bank->nambnk+" сбербанк "
@ m+1,45 say "Пенсионный отдел УВД  "
@ m+2,4  say "Eна N____от "+sysd
@ m+2,45 say "Ярославской области       "
@ m+3,45 say "150000,г.Яpославль,ул.Республиканская, 23F"
@ prow()+2,10 say "4Выплата компенсации на питание пенсионерам-чернобыльцам "+str(gg1,4)+" год "
@ prow()+1, 5 say " произведена '_____' __________ "+str(gg1,4)+" г. в соответствии со спискомFM5"
i=1
@ prow(),0 say " "
m=prow()+2
do while .not. eof()
a=0
do while a<=2 .and. .not. eof()
if codbnk=kk .and. datav=dsp
 @ m,a*43 say str(i+a,3)+".48/"+str(delo,5)+" "+substr(fam,1,at(" ",fam))+space(14-at(" ",fam))+str(sum1+sum2,9,2)+naim+" "+str(srok,2)
 a=a+1
endif
skip
enddo
m=m+1
i=i+3
enddo
@ prow()+2, 5 say ""
@ prow()+2, 6 say "М.П.        Начальник "
@ prow()+2, 6 say "            Бухгалтер"
set devi to scre
retu
**********************************************
procedure spisok
sele 8
loca for codbnk=kk
nb=iif(found(),nambnk,"")
sele 4
store 1 to lis1,lis
do while .t.                                            &&3
set devi to scre
@ 19, 1 say "Номеp листа          =>" get lis pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
if lis#lis1
  loca for codbnk=kk
 j=0
 do while j<(lis-1)*16
   j=iif(datav=dsp .and. codbnk=kk,j+1,j)
  skip
 enddo
endif
np=(lis-1)*16
set devi to print
@ prow(),1 say " "
if lis=1
sele 1
m=prow()
@ m+1,4 say   "EУПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛ                  "+"4"+nb+"5"
@ m+1,45 say repl("_",len(nb))
@ m+2,4 say "    ЯРОСЛАВСКОЙ ОБЛАСТИ F         "
@ m+3,45 say bank->adres1
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"
@ m+4,4 say "     Пенсионный отдел ФЭУ"
@ m+4,45 say bank->adres2
@ m+5,8 say dtoc(dsp)+"    "+"10/ "
@ m+5,4 say "   ____________________"

@ prow()+2,15 say "E4 Список пенсионеров-чернобыльцев для выплаты компенсации"
@ prow()+1,20 say "на питание (и др.выплат) за "+str(gg1,4)+" год FM5"
else
@ prow(),30 say "-"+ltrim(str(lis,2))+"-M"
endi
m=prow()+1
q="|"
t=2
@  m  ,t say "-----------------------------------------------------------------------------------"
@  m+1,t say "|N   |  N  |   Фамилия, имя ,отчество          |          |                       |"
@  m+2,t say "|п/п |пенс.|      пенсионеpа                   | Сумма    |Вид выплаты            |"
@  m+3,t say "|    |дела |                                   |          |                       |"
@  m+4,t say "|----|-----|-----------------------------------|----------|-----------------------|"
m=prow()+1
i=1
go top
do while .not. eof() .and. i<=16
ndb=""
if datav= dsp .and. codbnk=kk
vidv=naim +str(srok,2)
sele 4
loca for delo=A->delo
fam_=substr(fam,1,35)
sele 1
@ m, t   say q+str(np+i,4)+q+str(delo,5)+q+fam_+q+str(sum1+sum2,10,2)+vidv+q
@ m+1,t say "|----|-----|-----------------------------------|----------|-----------------------|"
m=prow()+1
i=i+1
************
endif
skip
ENDDO
if eof()
  cifra=v
 m=prow()+1
@ m,t   say "|ВСЕГО:    |"+space(36)+str(v,10,2)+space(14)+q
@ m+1,t say "-----------------------------------------------------------------------------------"
  do perev1
ss=2
 @ prow()+2, ss say sos1
if len(sos1)>=85
@ prow(),1 say "FM"
endi
  z=iif(i<14,3,2)
 @ prow()+z, 5 say "Начальник ФЭУ УВД ЯО:                                 Засыпин В.Н"
 @ prow()+z, 5 say "Начальник пенсионного отдела:                         Алиева Н.Х."
 endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
set devi to scre
retu
