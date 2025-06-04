*  Список компенсаций по банкам
set devi to screen
set date germ
set cent on
clea
osn1='Постановление правительства РФ от 10.07.1995 г. N 701 "О назначении и выплате'
osn2='отдельным категориям инвалидов из числа ветеранов денежной компенсации '
osn3='расходов на сан.-кур.лечение,эксплуатацию транспортных средств и трансп.обслуживание"'
SET TALK OFF
sele 8
use bank
sele 4
sele 1
use benzin01
inde on delo to benzin01
kk=0
dsp=date()
mes=space(8)
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
if datav=dsp .and. codbnk=kk
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
spisok="2001_"+ ltrim(str(kk))
set devi to FILE &spisok
sele 1
go top
store 1 to lis1,lis
do while .not. eof()
np=(lis-1)*16
@ prow(),1 say " "
if lis=1
m=prow()-1
@ m+1,4 say   "УПРАВЛЕHИЕ ВHУТРЕHHИХ ДЕЛ                "+nb
@ m+2,4 say "    ЯРОСЛАВСКОЙ ОБЛАСТИ F         "
@ m+3,4 say "     150000,г.Яpославль"
@ m+4,4 say "   ул.Республиканская, 23"
@ m+5,4 say "    Пенсионный отдел ФЭУ"
@ m+5,45 say bank->adres1
@ m+6,45 say bank->adres2
@ m+6,8 say dtoc(dsp)+"    "+"10/ "
@ prow()+2,15 say "E Список пенсионеров-инвалидов для выплаты компенсации"
@ prow()+1,20 say "за бензин  за 2 квартал 2003г.F"
@ prow()+1,6 SAY "Основание: "+osn1+""
@ prow()+1,18 SAY ""+osn2+""
@ prow()+1,18 say ""+osn3+""
@ prow()+1,6   SAY "__________________________________________________________"
else
@ prow(),30 say "-"+ltrim(str(lis,2))+"-M"
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
do while .not. eof() .and. i<=16*1
vidv=space(17)
d_=delo
suob=0
fam=substr(nampns,1,35)
vidv0=""
if summa1>0
@ m, t   say q+str(np+i,4)+q+str(d_,5)+q+fam_+q+str(summa1,10,2)+q+substr(vidv0,1,17)+q
if len(vidv0)>17
@ prow()+1, t   say q+"    "+q+"     "+q+space(35)+q+space(10)+q+substr(vidv0,18)+q
endi
stroka="stroka"+ltrim(str(np+i))
&stroka=str(np+i,4)+" "+str(d_,5)+" "+fam_+str(summa1,8,2)+" "+vidv0
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
if len(sos1)>=85
@ prow(),1 say "FM"
endi
  z=iif(i< 9,3,2)
 @ prow()+z, 5 say "Hачальник ФЭУ       :                              Засыпин В.H."
 @ prow()+z, 5 say "Hачальник пенсионного отдела:                      Алиева H.Х."
 endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
@ prow()+3,1 say  repl("-",80)
m=prow()
@ m+1,4 say   nb
@ m+1,45 say "Пенсионный отдел УВД  "
@ m+2,4  say "на N____от "+dtoc(dsp)
@ m+2,45 say "Ярославской области       "
*@ m+3,45 say "150000,г.Яpославль,ул.Республиканская, 23F"
@ prow()+2,10 say "Выплата компенсации на бензин  пенсионерам-инвалидам за 1 кв.2001г."
@ prow()+1, 5 say " произведена '_____' _______2003г. в соответствии со
списком" i=1
do while i<=kol_
stroka="stroka"+ltrim(str(i))
 @ prow()+1,3 say &stroka
i=i+1
enddo
@ prow()+2, 6 say "М.П.        Hачальник "
@ prow()+2, 6 say "            Бухгалтер"
set devi to scre
retu
