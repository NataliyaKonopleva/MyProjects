*  Список компенсаций по банкам
set devi to screen
set date germ
set cent on
clea
SET TALK OFF
sele 8
use bank
sele 4
use chern
sele 1
use chernv09
inde on delo to chernv09
kk=0
dsp=date()
mes= "ноябрь "   &&space(8)
@ 20,1 say "Дата списка " get dsp
@ 21,1 say "Код банка"    get kk pict "99"
@ 22,1 say "Месяц "    get mes
read
if readkey()=12 .or. readkey()=262
  retu
endi
************
store 0 to kol_,de,V,delo_
do while .not. eof()
if datav=dsp .and. codbnk_=kk
v=v+sum1+sum2
if delo#delo_
kol_=kol_+1
delo_=delo
endif
endif
skip
enddo
@ 22,1 say "В списке будет "+ltrim(str(kol_))+" чел. -" +str(v,10,2)+"руб."
wait " "
if kol_=0
 retu
endi
do spisok
retu
**********************************************
procedure spisok
sele 8
loca for codbnk=kk
nb=iif(found(),rtrim(nambnk)+" сбербанк","")
spisok="p11_" + ltrim(str(kk))
*spisok="ind09"+ltrim(str(kk))

set devi to FILE &spisok
sele 1
go top
store 1 to lis1,lis
do while .not. eof()
np=(lis-1)*25
@ prow(),1 say " "
if lis=1
m=prow()+1
@ m  ,4 say   "                             Код 1003 505 0105 005 263"
@ m+1,4 say   "УПРАВЛЕHИЕ ВHУТРЕHHИХ ДЕЛ                "+nb
@ m+2,4 say "   ПО ЯРОСЛАВСКОЙ ОБЛАСТИ            "
@ m+3,4 say "Центр пенсионного обcлуживания"
@ m+4,4 say "     150000,г.Яpославль"
@ m+5,4 say "   ул.Республиканская, 23"
@ m+5,45 say bank->adres1
@ m+6,45 say bank->adres2
@ m+6,8 say dtoc(dsp)+"    "+"10/ "
@ prow()+3,15 say " Список пенсионеров-чернобыльцев для выплаты компенсации"
@ prow()+1,25 say "на питание за "+mes+"2009г. "
*@ prow()+1,8  say "и доплата за период с 01.01.2009 по 30.09.2009г. в связи с индексацией"
*@ prow()+1,8  say "и доплата за период с 01.01.2005 по 30.09.2005г. в связи с индексацией."
*@ prow()+1,8  say "за период с 01.01.2005 по 31.05.2007г. в связи с индексацией."
*@ prow()+1,8  say "по Пост.Правительства РФ от 07.07.2009 N 545"


else
@ prow(),30 say "-"+ltrim(str(lis,2))+"-"
endi
m=prow()+1
q="|"
t=1
*@ prow(),30 say "M"
@  m  ,t say "-----------------------------------------------------------------------------"
@  m+1,t say "|N   |  N  |   Фамилия, имя ,отчество          |          |                 |"
@  m+2,t say "|п/п |пенс.|      пенсионеpа                   | Сумма    | Вид выплаты     |"
@  m+3,t say "|    |дела |                                   |          |                 |"
@  m+4,t say "|----|-----|-----------------------------------|----------|-----------------|"
m=prow()+1
i=1
do while .not. eof() .and. i<=25*1
vidv=space(17)
d_=delo
suob=0
sele 4
loca for delo=A->delo
fam_=substr(fam,1,35)
sele 1
vidv0=""
do while delo=d_
if datav= dsp .and. codbnk_=kk
ww=iif(srok=0,"  ",str(srok,2))
vidv=naim+"  "+ww+"  "
vidv0=vidv0+vidv
suob=suob+sum1+sum2
endi
skip
enddo
if suob>0
@ m, t   say q+str(np+i,4)+q+str(d_,5)+q+fam_+q+str(suob,10,2)+q+substr(vidv0,1,17)+q
if len(vidv0)>17
@ prow()+1, t   say q+"    "+q+"     "+q+space(35)+q+space(10)+q+substr(vidv0,18)+q
endi
stroka="stroka"+ltrim(str(np+i))
&stroka=str(np+i,4)+" "+str(d_,5)+" "+fam_+str(suob,8,2)+" "+vidv0
@ prow()+1,t say "|----|-----|-----------------------------------|----------|-----------------|"
m=prow()+1
i=i+1
endif
************
ENDDO
if eof()
  cifra=v
 m=prow()+1
@ m,t   say "|ВСЕГО:    |"+space(36)+str(v,10,2)+q+space(17)+q
@ m+1,t say "------------------------------------------------------------------------------"
  do perev1
ss=2
 @ prow()+2, ss say sos1
*if len(sos1)>=85
*@ prow(),1 say "FM"
*endi
  z=2

  @ prow()+z, 5 say "Hачальник                                   А.В.Сидоров"
  @ prow()+z, 5 say "Зам.начальника                              С.H.Калачева"
  
 endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
@ prow()+3,1 say  repl("-",80)
m=prow()
@ m+1,4 say   nb
@ m+1,45 say "Центр пенсионного обслуживания "
@ m+2,4  say "на N_______ от "+dtoc(dsp)
@ m+2,45 say "УВД по Ярославской области       "
*@ prow()+1,8  say "2005 г. и доплата за период с 01.01.2005 по 30.09.2005г. в связи с индексацией"

@ prow()+3,10 say "Выплата компенсации на питание пенсионерам-чернобыльцам за "+mes+" 2009 г."
*@ prow()+1,8  say "и доплата за период с 01.01.2009 по 30.09.2009г. в связи с индексацией"
*@ prow()+1,8  say "и доплата за период с 01.01.2008 по 31.05.2008г. в связи с индексацией"
@ prow()+1,8  say " по Пост.Правительства РФ от 07.07.2009 № 545"
*@ prow()+1,8  say "по Пост.Правительства РФ от 03.09.2008 N 655"
@ prow()+2, 5 say "произведена '_____' _______ 2009г. в соответствии со списком"
i=1
do while i<=kol_
stroka="stroka"+ltrim(str(i))
 @ prow()+1,3 say &stroka
i=i+1
enddo
@ prow()+2, 6 say "М.П.        Hачальник "
@ prow()+2, 6 say "            Бухгалтер      "
@ prow()+1, 6 say   "                                Код 1003 505 0105 005 263   "
set devi to scre
retu
