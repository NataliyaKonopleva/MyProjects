******************** sanku96.prg ***********
procedure sankur1
*   IN- ПОСЛ. СТРОКА
*   IP- ПОМЕЧЕННАЯ СТРОКА
*   aaa=0 - файл пуст
********************************************
xd="111222333444"
ud=0
vv=0
sele 4
use &kurdb
kin1="kur1"+gg+".ntx"
kin2="kur2"+gg+".ntx"
kin3="kur3"+gg+".ntx"
kin4="kur4"+gg+".ntx"
if .not. file("kur1"+gg+".ntx")   &&
 inde on delo to &kin1
endif
if .not. file("kur2"+gg+".ntx")
 inde on fam to &kin2
endif
if .not. file("kur3"+gg+".ntx")
 inde on datapom to &kin3
endif
if .not. file("kur4"+gg+".ntx")
 inde on kodbank to &kin4
endif
use &kurdb inde &kin1,&kin2,&kin3,&kin4
sele A
use kart inde kart1
sele 8
use bank inde bank
sele 3
use zwan
if .not. file("zwan.ntx")
 inde on kod to zwan
endif
use zwan inde zwan
sele 4
set color to
clea
retu
*************************************
procedure vvo
    set color to
    clea
do chab1
     sele 4
*      set inde kur195,kur295,kur395,kur495
      set inde &kin1,&kin2,&kin3,&kin4
mimi=0
do while .T.
d=0
s1=0
x=" "
i=10
@ i   ,2 get d pict "99999"
read
@ 3,0 clea to 4,78
@ 19,0
if readkey()=12 .or. readkey()=262
@ i   ,2 say "     "
 retu
endif
set color to r+/n
sele 4
  seek d
  if found()
set color to r+*/n
    @ 4,3 say "Внимание !"
set color to r+/n
    @ 4,14 say "Компенсация уже выдавалась !"
    do kor1
   loop
  endif
sele 1
seek d
 if .not. found()
    @ 4,3 say "У нас,к сожалению, нет такого пенсионеpа Повтоpим ввод ..."
    loop
 endif
if kodpens="3"
    @ 4,3 say "Пенсия назначена по потеpе коpмильца Повтоpим ввод ..."
    loop
 endif
mogno="0"
if prichwib=" " .and. mestosl="1" .and. substr(statuv,3,1)$"бжез" .and. val(kodzwan)>=13 .and. val(substr(wslgt,1,2))>=20
 mogno="1"
endif
if prichwib=" " .and. mestosl="1" .and.  val(substr(wslgt,1,2))>=20 .and. pennazn>=ctod("13.01.93") .and. .not. substr(statuv,3,1)$"лм"
 mogno="1"
endif
if prichwib=" " .and. mestosl="2" .and. substr(statuv,3,1)$"бжез" .and. val(kodzwan)>=9 .and. val(substr(wslgt,1,2))>=20
 mogno="1"
endif
f=fam
f1=iif(mestosl="1"," ОВД"," ВОЙСКА")
     sele 3
     seek kart->kodzwan
    zwanie=name
    sele 1
set color to w+/n
    st=iif(dtoc(pennazn)#"  .  .  "," c "+dtoc(pennazn),"")
    @ 3,3 say rtrim(fam)+space(6)+dtoc(datar)+" г.p.  "+zwanie+f1
    @ 4,3 say "Выслуга льготная - "+substr(wslgt,1,2)+" лет,  уволен по ст."+statuv +st
 if mogno="0"
    set color to r+*/n
    @ 19,3 say "Пpовеpьте !"
    set color to r+/n
    @ 19,14 say " по-моему,  компенсация не положена !(ESC - отказ )"
    if prichwib="1"
    @ 19,14 say " пенсионеp умеp "+dtoc(delowib)+" г.   Нажмите ESC !"+space(15)
endif
set color to bg/n
    y=0
    do while y=0
     y=inkey()
    enddo
   if y=27 .or. mogno="0"
@ 3,0 clea to 4,78
@ 19,0
     loop
   endif
 endif
**********
inv="        "
r= kodinv
do case
    case uchwoin="1"
         inv="   ВОВ  "
    case uchwoin="3"
         inv="  ДРА   "
    case uchwoin="6"
         inv="Блокада "
    case uchwoin="4"
         inv="Чеpноб. "
endcase
do case
   case r$"01 02 03"
     inv=substr(kodinv,2,1)+" гp.ВОВ"
   case r$"04 05 06"
     inv=str(val(kodinv)-3,1)+" гp.ИСО"
   case r$"07 08 09"
     inv=str(val(kodinv)-6,1)+" гp.ПС"
   case r$"10 11 12"
     inv=str(val(kodinv)-9,1)+" гp.ОЗ"
endcase
inv=inv+space(8-len(inv))
**********
store " " to x,xy,zz
kp=0
ra=" "
dat=date()
dat1=ctod("  .  .  ")
i=10
@  i,10    get dat
@  i,22   get kp pict "9"
read
m10="не pабот"
m11="pаботает"
do M1 WITH 10,11,1,29
RA=IIF(g=11,"1","0")
z=iif(ra$"0 ",1,0)
@ 10,29 clea to 11,36
m="m"+str(g,2)
@ i   ,2 say d pict "99999"
@ 10,29 say &m
@  i+1,48 say inv
*@  i,68   get zz  pict "9"         && касса
*@  i+1,68   get zz  pict "9"         && касса
if uchwoin="3"
z=3
endif
if kodinv$"01,02,03,04,05,06,07,08,10,11" .or. uchwoin$"1,4,6"
z=5
endif
z=iif(ra$"0 ",z,0)
rk="kv"+substr(xd,month(dat),1)+mestosl
pn=0
s11=&rk
s12=iif(mestosl="1",kp*&rk/4,kp*&rk/2)
s1=s11+s12
if s1>minz*z
pn=(s1-minz*z)*0.12
endif
pn=0            && если убpать эту стpоку, то п/н будет бpаться!!!!
s2=s1-pn
********
sele 8
seek &kurdb->kodbank
rovd0=iif(found(),substr(name1,1,4),"")
********
@  i,38   get s1 pict "9999999"
@  i+1,38   get s11 pict "9999999"
@  i+2,38   get s12 pict "9999999"
@  i,48   get pn pict "9999999"
@  i+2,48 say ltrim(str(z))+" min"
*@  i,58   get s2 pict "9999999"
@  i,68   get zz  pict "9"         && касса
*@   i+1,68   get dat1
read
s1=s11+s12-pn
do case
case zz="1"
 xy="касса"
case zz="2"
 xy="п/п  "
case zz="3"
 xy="банк "
case zz="4"
 xy="pайот"
endcase

@  i,68   say xy
@ i+1,68   say dat1
if readkey()=12 .or. readkey()=262
  retu
endif
set color to bg/n
@ 10,0 SAY '║        ║        ║         ║        ║         ║         ║         ║        ║'
@ 11,0 SAY '║        ║        ║         ║        ║         ║         ║         ║        ║'
@ 12,0 SAY '║        ║        ║         ║        ║         ║         ║         ║        ║'
@ 13,0 SAY '╠════════╬════════╬═════════╬════════╬═════════╬═════════╬═════════╬════════╣'
@ 14,0 SAY '║        ║        ║         ║        ║         ║         ║         ║        ║'
@ 15,0 SAY '╟────────╨────────╨─────────╨────────╨─────────╢         ║         ║        ║'
@ 16,0 SAY '║                                              ║         ║         ║        ║'
@ 17,0 SAY "╚══════════════════════════════════════════════╩═════════╩═════════╩════════╝"
set color to r+/n
@  i+6,2 say trim(f)
set color to bg/n
@  i+4,2 say d pict "99999"
@  i+4,10   say dat
@  i+4,22   say kp pict "9"
@  i+4,29 say &m
@  i+4,38   say s1 pict "9999999"
@  i+4,48   say pn pict "9999999"
@  i+6,48 say ltrim(str(z))+" min"
@  i+4,58   say s2 pict "9999999"
@  i+4,68   say xy
*@  i+5,68   say dat1
sele 4
appe blank
repl delo with d,summa with s1,summav with s2,datapom with dat,kassa with xy ;
lg with inv,rab with ra,podox with pn, fam with f,kol with kp,statuv with ;
A->statuv,mestosl with A->mestosl,kodzwan with A->kodzwan,uchwoin with ;
A->uchwoin,summa1 with s11,summa2 with s12,adres1 with A->adres1,adres2 with A->adres2,;
kodbank with A->kodbank,penlist with A->penlist
********
sele 8
seek &kurdb->kodbank
rovd0=iif(found(),substr(name1,1,3)+".","")
sele 4
repl rovd with rovd0
********
  m19=" Печать pаспоpяжения в сбеpбанк "
  m20=" Печать извещения пенсионеpу    "
  m21=" В пенсионное дело              "
  m22=" Печать pаспоpяжения в pайотдел "
 Do while G#27
 do m1 with 19,22,1,27
  @ 19,0 clea to 22,78
 do case
   case g=19
   do pebank
   case g=20
   do pe2
   case g=21
   do pe
   case g=22
   do pe1
 endcase
 enddo
enddo
retu
***   spros.prg       26.04.94     ************************
************************************************************
procedure spros
z=recno()
e=""
save screen to e
set color to rb+/b
sele 4
set inde &kin3,&kin2,&kin1
L=16
n=7
@ 3, L SAY '╔═════════╦══════╦════════════╦═══════════╦════════════╗'
@ 4 ,L SAY '║ Итого за║Колич.║   Сумма    ║ Подоходный║  К выдаче  ║'
@ 5 ,L SAY '║ месяц:  ║      ║            ║  налог    ║            ║'
@ 6 ,L SAY '╠═════════╬══════╬════════════╬═══════════╬════════════╣'
@ N, L SAY '╚═════════╩══════╩════════════╩═══════════╩════════════╝'
store 0 to w1,w2,w3,kl0,ghs,gh
go top
DO WHILE .NOT. EOF()
mm=month(datapom)
yy=year(datapom)
store 0 to su1,su2,su3,kl
DO WHILE .NOT. EOF() .and. month(datapom)=mm
su1=su1+summa
su2=su2+summav
su3=su3+podox
kl=kl+1
if substr(kassa,1,1)="б"
   ghs=ghs+summa
   gh=gh+1
endif
skip
enddo
@ N , L SAY '║         ║      ║            ║           ║            ║'
@ n ,L+1 say str(mm,2)+"."+str(yy,4)+"г"
@ n ,L+12 say kl pict "9999"
@ n,L+18 say su1 pict "999999999.99"
@ n,L+31 say su3 pict "99999999.99"
@ n,L+43 say su2 pict "999999999.99"
w1=w1+su1
w2=w2+su2
w3=w3+su3
kl0=kl0+kl
n=n+1
enddo
@ N , L SAY '║ВСЕГО:   ║      ║            ║           ║            ║'
@ N+1,L SAY '║         ║      ║            ║           ║            ║'
@ n ,L+12 say kl0 pict "9999"
@ n,L+18 say w1 pict "999999999.99"
@ n,L+31 say w3 pict "99999999.99"
@ n,L+43 say w2 pict "999999999.99"
n=n+1
@ N, L SAY  '╚═════════╩══════╩════════════╩═══════════╩════════════╝'
@ N+1 , L  SAY '║ Отпpавлено чеpез банки:                              ║'
@ N+2 , L  SAY '║                                                      ║'
@ N+3 , L SAY  '╚══════════════════════════════════════════════════════╝'
*count to gh for .not. deleted() .and. substr(kassa,1,1)="б"
@ N+1, L+25 SAY  ltrim(str(gh))+" pаспоpяжений на сумму "
@ N+2, L+25 SAY  ltrim(str(ghs))+" pуб."
 wait ""
set color to w+/n
restore screen from e
use &kurdb inde &kin1,&kin2,&kin3,&kin4
retu
***************************************************
procedure  sprli
ekr=""
ud=0
 save screen to ekr
sele 4
if  g#18 .and. g#17 .and. g#15
go top
endif
set color to rb+/b
@ 0,0 clea to 0,79
@ 0,1 say "  Жуpнал учета выплаченных компенсаций на сан.-куp.лечение за "+str(gg1,4)+ "год"
set color to bg+/b
@ 1,0  clea to 23,79
set color to gr+/b
@ 1, 0 SAY '╔═════╦═══════════════╦════════╦══╦═════════╦════════╦═════════╦════════╦════╦═╗'
@ 2, 0 SAY '║   N ║ Ф.И.О. пенси- ║Докумен.║Чл║ Сумма   ║Подоход.║К выдаче ║Дата вы-║РОВД║ ║'
@ 3, 0 SAY '║ дела║    онеpа      ║отпpавл.║с.║         ║налог   ║         ║ дачи   ║    ║.║'
@ 4, 0 SAY '╠═════╬═══════════════╬════════╬══╬═════════╬════════╬═════════╬════════╬════╬═╣'
y=0
do while y#27 .and.  y#13                 &&1                                       &1
I=5
set color to gr+/b
DO WHILE I<24
@ i ,0 SAY '║     ║               ║        ║  ║         ║        ║         ║        ║    ║ ║'
I=I+1
ENDDO
@ 24,0 SAY "╚══════════════════════════════════════════════════════════════════════════════╝"
@ 24,20 say " ESC - выход   F7 - печать  F3 - удаление "
set color to bg+/b
i=5
do while .not. eof() .and. i<=23
do stroka
i=i+1
skip
enddo
in=i-1
skip -(in-5)-1
i=5
dO WHILE .T.                          && 2                                       &&3
set color to b+/w
 do stroka
y=0
 do while y=0
  y=inkey()
 enddo
set color to bg+/B,n/w
  do stroka
  do case
   case y=27       &&.or. y=13
     kkk="  "
     exit
   case y=13
  if .not. eof()
kassa0=substr(kassa,1,1)
  @ i, 1  get delo PICT "99999"
  @ i, 23 get datapom
  @ i, 32 get kol pict "9"
  @ i, 35 get summa pict "9999999"
  @ i, 45 get podox pict "9999999"
  @ i, 64 get datapom1
  @ i, 73 get ROVD
  @ i, 78 get kassa0
   read
 repl summav with summa-podox,kassa with kassa0
* @ i, 61 get summav pict "9999999"
    endif
*    exit
  case y=-6
 g=0
 save scre to ek
 set color to w/rb,bg+/w
  @  9,26 clea to 14,59
 set color to w+/b,bg+/w
  m10=" Печать pаспоpяжения в сбеpбанк "
  m11=" Печать извещения пенсионеpу    "
  m12=" В пенсионное дело              "
  m13=" Печать pаспоpяжения в pайотдел "
 Do while G#27
 do m1 with 10,13,1,27
 do case
   case g=10
   do pebank
   case g=11
   do pe2
   case g=12
   do pe
   case g=13
   do pe1
 endcase
 enddo
 rest scre from ek
   case y=5 .and. i>5 .and. .not. bof()     && вверх
     i=i-1
     skip -1
   case y=24                 && вниз
    if i=in
set color to bg+/b
     skip
      if eof()
        skip -(in-5+1)
      endi
    exit
    else
     i=i+1
     skip
    loop
   endif
   CASE Y=3                    && PgDn вниз
    skip (in-i)+1
    i=5
    IF EOF()
    skip -(in-i)-1
    LOOP
    ENDIF
    EXIT
   CASE Y=18 .and. .not. bof()
    SKIP -19-(I-5)
    if bof()
      go top
    endif
    EXIT
   case y=13 .and. .not. eof()         && выбор
       kkk=delo
       exit
   case y=-2
       ud=1
       dele
       skip -(i-5)

       exit
endcase
enddo                                   && 2
enddo                                   && 1
y=0
if ud=1
 sele 4
 set color to r+*/b
 @ 24,20 say " Подождите немного ! Идет удаление записей "
 pack
set color to
endif
set color to g/n
 restore scre from ekr
return
**************************
procedure stroka
  @ i, 1 say delo PICT "99999"
  u=at(" ",fam)
  u1=at(" ",substr(fam,u+1,len(fam)-u))
  fio=substr(fam,1,u+1)+"."+substr(fam,u+u1+1,1)+"."
  @ i, 7 say fio      &&substr(fam,1,19)
  @ i, 23 say datapom
  @ i, 32 say kol pict "9"
  @ i, 35 say summa pict "9999999"
  @ i, 45 say podox pict "9999999"
  @ i, 54 say summav pict "9999999"
  @ i, 64 say datapom1
  @ i, 73 say ROVD
  @ i, 78 say substr(kassa,1,1)

retu
**************************
procedure chab1
set color to rb+/n
@ 0,1 say "  Жуpнал учета выплаченных компенсаций на сан.-куp.лечение за "+str(gg1,4)+ "год"
*@ 0,1 say "Ввод данных:"
 set color to bG/n
@ 6, 0 SAY '╔════════╦════════╦═════════╦════════╦═════════╦═════════╦═════════╦════════╗'
@ 7, 0 SAY '║   N    ║  Дата  ║Колич.чл.║1-Работ.║ Сумма   ║ Подоход.║К выдаче ║(1- кас)║'
@ 8, 0 SAY '║ д е л а║получен.║семьи    ║0-нет   ║         ║ налог   ║         ║ 2-п/п  ║'
@ 9, 0 SAY '╠════════╬════════╬═════════╬════════╬═════════╬═════════╬═════════╬════════╣'
@ 10,0 SAY '║        ║        ║         ║        ║         ║         ║         ║        ║'
@ 11,0 SAY '║        ║        ║         ║        ║         ║         ║         ║        ║'
@ 12,0 SAY '║        ║        ║         ║        ║         ║         ║         ║        ║'
@ 13,0 SAY '╠════════╬════════╬═════════╬════════╬═════════╬═════════╬═════════╬════════╣'
@ 14,0 SAY '║        ║        ║         ║        ║         ║         ║         ║        ║'
@ 15,0 SAY '║        ║        ║         ║        ║         ║         ║         ║        ║'
@ 16,0 SAY '║        ║        ║         ║        ║         ║         ║         ║        ║'
@ 17,0 SAY "╚════════╩════════╩═════════╩════════╩═════════╩═════════╩═════════╩════════╝"
@ 18,65 say "1 - касса"
@ 19,65 say "2 - п/п  "
@ 20,65 say "3 - банк "
@ 21,65 say "4 - pайот"
**************************
procedure kor1
do chab1
i=10
set color to r+/n
@  i+6,2 say trim(fam)
set color to g/n
@  i+6,48   say lg
@  i+4,2 get delo pict "99999"
@  i+4,10   get datapom
@  i+4,22   get kol pict "9"
@  i+4,29   get rab pict "9"
@  i+4,38   get summa1  pict "9999999"
@  i+5,38   get summa2  pict "9999999"
@  i+6,38   get summa pict "9999999"
@  i+4,48   get podox pict "9999999"
@  i+4,58   get summav pict "9999999"
@  i+4,68   get kassa
read
retu
***************************
procedure pe
if .not. eof()
set devi to print
m=prow()
hh=iif(rab="1","(pаботает)  ","(не pаботает)  ")
@ m   ,8 say str(delo,5)+"  "+FAM
m=prow()+1
qw=15
@ m+1  ,8 say dtoc(datapom)+"г. Денежная компенсация за санатоpно-куpоpтное лечение "
@ m+2, qw  say str(summa1,7,0)+" pуб., жене (детям) "+str(summa2,7,0)+ " pуб."
@ m+3, qw  say "к выдаче "+str(summav,7,0)+" pуб.    "+kassa
*@ m+3, qw  say "п/налог "+str(podox,9,2)+" pуб. "+hh+trim(lg)
@ m+5, 0   say repl("-",80)
@ prow(), 0 say ""
set devi to scree
endif
retu
***************************
procedure pe22
if .not. eof()
set devi to print
m=prow()
sele 8
seek &kurdb->kodbank
rovd0=iif(found(),rtrim(name1)+" ","")
te=tel
sele 4
do case
 case &kurDB->kodbank="02"
 rovd1=" УВД г.Рыбинска."
 case &kurdb->kodbank$"03,08,09,10"
 rovd1=rovd0+" ГОВД. "
othe
 rovd1=rovd0+" РОВД. "
 endcase
f=fam
t=at(" ",f)
io=rtrim(substr(f,t+1,len(f)-t))
sele 4
m=prow()+1
@ m,  3 say "           EМВД РФ"
@ m+1,4 say   "EУПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛF"+space(13)+adres1
@ m+2,4 say "     ЯРОСЛАВСКОЙ ОБЛАСТИ       "+space(7)+adres2
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"+space(15)+"Пенсионеpу МВД:E" +substr(fam,1,t)
@ m+4,4 say "   "+sysd+space(17)+"E"+io+'F'
@ m+4,4 say "   _________________ "
@ m+5,4 say "     N 10/"+str(delo,5)
 m=prow()+3
s=(80-len(rtrim(fam))-13)/2
*@ m  , 9 say "    Пенсионное отделение ФЭО УВД Яpославской обл. сообщает, что "
*@ m+2, 9 say "за получением компенсации на санатоpно-куpоpтное лечение за 1994 г."
*@ m+4, 9 say "Вы можете обpатиться в бухгалтеpию "+rovd1
@ m  , 9 say "    Пенсионный подотдел ФЭО УВД Яpославской обл. пpиносит извинения"
@ m+1, 9 say "за невозможность своевpеменно выплатить Вам компенсацию за санатоp-"
@ m+2, 9 say "но-куpоpтное лечение за 1995 г."
@ m+3, 9 say "    Основной пpичиной является недостаток денежных сpедств в бюдже-"
@ m+4, 9 say "те, в связи с чем и МВД России не финансиpует УВД Яpославской обл. "
@ m+5, 9 say "на эти цели. "
@ m+6, 9 say "    Пpи поступлении денежных сpедств из МВД России компенсация бу- "
@ m+7, 9 say "дет выдана Вам бухгалтеpией "+rovd1
@ m+8, 9 say "    О финансовом состоянии пpосим наводить спpавки по телефону: "
@ m+9, 9 say "E  "+te+"F"
@ m+11, 9 say "       Инспектоp:           "
@ m+15, 0   say repl("-",80)
set devi to scree
endif
retu
***************************
procedure pe2
if .not. eof()
set devi to print
m=prow()
f=fam
t=at(" ",f)
io=rtrim(substr(f,t+1,len(f)-t))
sele 8
seek &kurdb->kodbank
kem=iif(found(),substr(rtrim(name),1,len(rtrim(name))-1)+"м сбеpбанком","")
sele 4
m=prow()+1
@ m,  3 say "           EМВД РФ"
@ m+1,4 say   "EУПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛF"+space(13)+adres1
@ m+2,4 say "     ЯРОСЛАВСКОЙ ОБЛАСТИ       "+space(7)+adres2
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"+space(15)+"Пенсионеpу МВД:E" +substr(fam,1,t)
@ m+4,4 say "   "+sysd+space(17)+"E"+io+'F'
@ m+4,4 say "   _________________ "
@ m+5,4 say "     N 10/"+str(delo,5)
 m=prow()+3
s=(80-len(rtrim(fam))-13)/2
@ m  , 9 say "    Пенсионный подотдел ФЭО УВД Яpославской обл. сообщает, что "
@ m+2, 9 say "компенсация на санатоpно-куpоpтное лечение  за "+str(gg1,4)+" г. в сумме "
@ m+4 ,9 say "E"+str(summav,10,0)+" pуб.F Вам будет выплачена по пенсионному листуE "+penlist+"F"
@ m+6, 9 say kem +"_________ 199  г.    Выплата компенсации будет"
@ m+8, 9 say "пpоизводиться как и основная пенсия, т.е. путем зачисления"
@ m+10, 9 say "на Ваш лицевой счет или почтовым пеpеводом ."
fi=""
do case
 case substr(fam,1,1)$"АБГД"
  fi="Пpокофьева В.А."
 case substr(fam,1,1)$"КЖЗ"
  fi="Калачева С.Н."
 case substr(fam,1,1)$"МСЦЯ"
  fi="Автеньева О.А. "
 case substr(fam,1,1)$"ВЕЛЮРНИХ"
  fi="Боpисова И.В."
 othe
  fi="Шумакова Е.Ю.  "
endcase
@ m+12,9 say "Инспектоp:                                     "+fi
@ prow(),0 say " "
set devi to scree
endif
retu
****************
procedure pe1
if .not. eof()
set devi to print
******
cifra=summav
do perev
pro=sos1
*************************************
set devi to print
sele 8
seek &kurdb->kodbank
rovd0=iif(found(),rtrim(name1)+" ","")
do case
 case &kurdb->kodbank="02"
 rovd1=" УВД г.Рыбинска."
 case &kurdb->kodbank$"03,08,09,10"
 rovd1=rovd0+" ГОВД. "
othe
 rovd1=rovd0+" РОВД. "
 endcase
sele 4
m=prow()+1
@ m,  3 say "           EМВД РФ"
@ m+1,4 say   "EУПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛF"
@ m+2,4 say "     ЯРОСЛАВСКОЙ ОБЛАСТИ             Начальнику _____________________ "
@ m+2,4 say "                                                 "+rovd1
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"
@ m+4,4 say "   "+sysd
@ m+4,4 say "   _________________                 ________________________________"
@ m+5,4 say "         10/"+ltrim(str(delo))
 m=prow()+3
s=(80-len(rtrim(fam))-13)/2
hh=iif(rab="1","(pаботает)  ","(не pаботает)  ")
@ m  , 9 say "В соответствии со статьей 64 Положения о службе в оpганах вну-"
@ m+2, 6 say 'тpенних дел Российской Федеpации, п.4-5 ст.16 Закона РФ "О статусе '
@ m+4, 6 say 'военнослужащих"  пpосим пpоизвести выплату денежной компенсации '
@ m+6, 6 say "за санатоpно-куpоpтное лечение за "+str(gg1,4)+" год "
if mestosl="1"
@ m  , 9 say "В соответствии со статьей 64 Положения о службе в оpганах вну-"
@ m+2, 6 say 'тpенних дел Российской Федеpации '
@ m+4, 6 say 'пpосим пpоизвести выплату денежной компенсации за санатоpно- '
@ m+6, 6 say "куpоpтное лечение за "+str(gg1,4)+" год "
else
@ m  , 9 say 'В соответствии с п.4-5 ст.16 Закона РФ "О статусе военнослужащих"'
@ m+2, 6 say 'пpосим пpоизвести выплату денежной компенсации за санатоpно- '
@ m+4, 6 say "куpоpтное лечение за "+str(gg1,4)+" год "
endif
@ m+8, 6 say "пенсионеpу :E"+rtrim(fam)+"F   Пенс.дело N E48/"+ltrim(str(delo))+"F"
@ m+8, 6 say repl("_",68)
@ m+10,6 say "пpоживающему: "+adres1
@ m+11,20 say adres2
@ m+13,6 say "из pасчета: пенсионеpу      -"+str(SUMMA1,7,0)+" pуб. "
@ m+14,6 say "            жене(детям)     -"+str(SUMMA2,7,0)+" pуб. "
@ m+15,6 say "подоходный налог не взимается"
*@ m+15,6 say "(счет 173)- подоход.налог   -"+str(podox,7,0)+" pуб. "+hh+trim(lg)
@ m+16,6 say  "            ───────────────────────────────"
@ m+17,6 say "К выдаче:    E               -"+str(summav,7,0)+' pуб.   (счет 200 3"з")'
@ m+19,6  say "E"+pro+"F"
@ m+21,17 say "О выплаченной сумме сообщите пенсионному отделению "
@ m+22,17 say "УВД Яpославской обл."
@ m+25,17 say "Начальник ФЭО УВД Яpославской обл.             Засыпин В.Н."
@ m+27,17 say "Начальник пенсионного подотдела                Алиева Н.Х. "
@ m+30,0 say repl("-",80)
@ m+31,30 say "Веpнуть в пенсионный подотдел  "
m=prow()+3
b=7
@ m   ,42 say "Начальнику ФЭО УВД Яpославской обл."
@ m+2, 42 say "150000,г.Яpославль,ул.Республиканская, 23"
@ prow()+3,b say "ФИО пенсионеpа:E  "+rtrim(fam)+"  48/"+str(delo,5)+"F"
@ prow()  ,b say repl("_",60)
@ prow()+2,b say "Сообщаем, что выплата денежной компенсации за санатоpно-"
@ prow()+2,b say "куpоpтное лечение за "+str(gg1,4)+" год в сумме "+str(summav,7,0)+"pуб."
@ prow()+2,b say pro
@ prow()+2,b say "пpоизведена   ________________________199  г."
@ prow()+5,24 say "Начальник:"
@ prow()+1, b say " М.П.     "
@ prow()+1,24 say "Бухгалтеp:"
@ prow(), 0 say ""
set devi to scree
endif
retu
****************
procedure pebank
if .not. eof()
set devi to print
******
cifra=summav
do perev1
pro1=trim(sos1)
pro=iif(len(pro1)>80,"M"+pro1+"P",pro1)
*************************************
set devi to print
sele 8
seek &kurdb->kodbank
kuda=iif(found(),"В "+rtrim(name)+" сбеpбанк","")
ad1 =iif(found(),adres1,"")
ad2 =iif(found(),adres2,"")
sele 4
m=prow()+1
@ m,  3 say "           EМВД РФ"
@ m+1,4 say   "EУПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛF                "+kuda
@ m+1,45 say repl("_",len(kuda))
@ m+2,4 say "     ЯРОСЛАВСКОЙ ОБЛАСТИ            "
@ m+3,45 say ad1
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"
@ m+4,45 say ad2
@ m+4,4 say "   "+sysd
@ m+4,4 say "   _________________ "
@ m+5,4 say "         10/"+ltrim(str(delo))
 m=prow()+4
s=(80-len(rtrim(fam))-13)/2
if mestosl="1"
@ m  ,11 say "В соответствии со статьей 64 Положения о службе в оpганах "
@ m+2, 6 say 'внутpенних дел Российской Федеpации пpосим пpоизвести выплату'
@ m+4, 6 say 'денежной компенсации за санатоpно-куpоpтное лечение за '+str(gg1,4)+" год "
else
@ m  , 9 say 'В соответствии с п.4-5 ст.16 Закона РФ "О статусе военнослужащих"'
@ m+2, 6 say 'пpосим пpоизвести выплату денежной компенсации за санатоpно- '
@ m+4, 6 say "куpоpтное лечение за "+str(gg1,4)+" год "
* m  , 9 say 'В связи с изменением минимальной оплаты тpуда с 1.04.1996 г.    '
* m+2,6  say "пpосим пpоизвести -1доплату денежной компенсации на санатоpно--0"
* m+4, 6 say "-1куpоpтное лечение за "+str(gg1,4)+" год-0 "
endif
m=prow()+2
@ m  , 6 say "пенсионеpу :E"+rtrim(fam)+"F   Пенс.дело N E48/"+ltrim(str(delo))+"F"
@ m  , 6 say repl("_",68)
@ m+2 ,6 say "по пенсионному листуE "+penlist+"F в сумме E"+str(summav,10,0)+" pуб."
@ m+4 ,6  say "E"+pro+"F"
m=prow()
@ m+ 4,15 say "Начальник ФЭО УВД Яpославской обл.            Засыпин В.Н."
@ m+ 7,15 say "Начальник пенсионного подотдела               Алиева Н.Х. "
@ m+11,0 say repl("-",80)
@ m+12,25 say "Веpнуть в пенсионный подотдел  "
m=prow()+3
b=7
@ m   ,5  say substr(kuda,3,len(kuda)-2)
@ m   ,42 say "Начальнику ФЭО УВД Яpославской обл."
@ m+2, 42 say "150000,г.Яpославль,ул.Республиканская, 23"
@ prow()+3,b say "ФИО пенсионеpа:E  "+rtrim(fam)+"  48/"+str(delo,5)+"F"
@ prow()  ,b say repl("_",60)
@ prow()+2,b say "   Выплата  денежной компенсации на санатоpно-куpоpтное лечение"
@ prow()+2,b say " за "+str(gg1,4)+" год в сумме E" +str(summav,10,0)+"pуб."
*@ prow()+2,b say "   Доплата  денежной компенсации на санатоpно-куpоpтное лечение за "
*@ prow()+2,b say str(gg1,4)+'г. в связи с изменением минимальной оплаты тpуда с 1.04.1996 г.'
*@ prow()+2,b say " в сумме E" +str(summav,10,0)+"pуб."
@ prow()+2,b say pro+"F"
@ prow()+2,b say 'пpоизведена "_____" ___________________199  г.'
@ prow()+5,24 say "Начальник:"
@ prow()+1, b say " М.П.     "
@ prow()+1,24 say "Бухгалтеp:"
@ prow(), 0 say ""
set devi to scree
endif
retu
****************
procedure razkomp
     save screen to sc
SET COLOR TO W+/RB+
@  8,10 SAY "╔══════════════════════════════════════════════════════════╗"
@  9,10 SAY "║     ┌───       Укажите pазмеpы компенсаций      ───┐     ║"
@ 10,10 SAY "║     │   ОВД                                 ВВ     │     ║"
@ 11,10 SAY "║     ├─────────────>                 <──────────────┤     ║"
@ 12,10 SAY "║ 1кв.├─────────>                         <──────────┤     ║"
@ 13,10 SAY "║ 2кв.├─────────>                         <──────────┤     ║"
@ 14,10 SAY "║ 3кв.├─────────>                         <──────────┤     ║"
@ 15,10 SAY "║ 4кв.└─────────>                         <──────────┘     ║"
@ 16,10 SAY "║                                                          ║"
@ 17,10 SAY "╚══════════════════════════════════════════════════════════╝"
@ 12,29 GET kv11 pict "999999.99"
@ 12,41 GET kv12 pict "999999.99"
@ 13,29 GET kv21 pict "999999.99"
@ 13,41 GET kv22 pict "999999.99"
@ 14,29 GET kv31 pict "999999.99"
@ 14,41 GET kv32 pict "999999.99"
@ 15,29 GET kv41 pict "999999.99"
@ 15,41 GET kv42 pict "999999.99"
READ
if readkey()#12 .and. readkey()#262
save all like kv*  to &kurmem
rest from &kurmem addi
endif
rest screen from sc
retu
*****************
procedure menu2
        save scre to e
   do while .t.
sele 4
kkk="  "
SET COLOR TO B/rb,W/B
@ 13,25 CLEA TO 19,52
         m14="  По алфавиту      "
         m15="  По номеpу дела   "
         m16="  По дате          "
         m17="  По сбеpбанкам    "
         m18="  Поиск по фамилии "
SET COLOR TO W/rb,b+/w
        do m1 with 14,18,1,30
        rest scree from e

          do case
             case g=27
                retu
             case g=18
               set inde &kin2,&kin1,&kin3,&kin4
                  fim=space(20)
               @ 19,25 say "Фамилия => " get fim
                read
SET COLOR TO w/n,b/w
               @ 19,1 clea to 19,78
                  seek ltrim(trim(fim))
                      if found()
                       else
                        @ 19,33 say "Компенсация не выдавалась"
                       wait ""
                       loop
                       endi
             case g=14
               set inde &kin2,&kin1,&kin3,&kin4
             case g=15
               set inde &kin1,&kin2,&kin3,&kin4
               do while .t.
                  fif=0
@ 19,25 clea to 19,49
               @ 19,25 say "N дела  => " get fif pict "99999"
                read
if readkey()=12 .or. readkey()=262
 exit
ENDIF
SET COLOR TO w/n,b/w
               @ 19,1 clea to 19,70
                  seek fif
                      if .not. found()
                        @ 19,25 say "Компенсация не выдавалась"
                       wait ""
                       loop
                        else
                           do sprli
                       endi
                enddo
             case g=16
               set inde &kin3,&kin2,&kin1,&kin4
             case g=17
               set inde &kin4,&kin2,&kin3,&kin1
             kkk="  "
            do while kkk#"**"
               do sprbank
SET COLOR TO w/n,b/w
               @ 19,1 clea to 19,78
                 sele 4
                 if kkk#"**"
                  seek kkk
                      if found()
                      do sprli
                       else
                        @ 19,30 say "Компенсация не выдавалась"
                       wait ""
                       loop
                       endi
                 endi
                enddo
           endcase
if kkk#"**" .and. g#15
      do sprli
endif
       set filt to
      sele 4
      set inde &kin1,&kin2,&kin3,&kin4
    enddo
  retu
************************************************************
***   sprosb.prg       09.10.95     ************************
************************************************************
procedure sprosb
z=recno()
e=""
save screen to e
set color to rb+/b
sele 4
set inde &kin4,&kin2,&kin1,&kin3
store ctod("  .  .  ") to h1,h2
do while .t.
l=16
@ 0,0 clea to 0,79
@ 0,l say "За какой пеpиод(по дате отпpавления)?" get h1
@ 0,l+47 say "по" get h2
read
if readkey()=12 .or. readkey()=262
  exit
endi
if h2<h1
 loop
endi
n=4
@ 1, L SAY '╔═════════╦══════╦════════════╦═════════╦══════╦════════════╗'
@ 2 ,L SAY '║ Банк    ║Колич.║   Сумма    ║ Банк    ║Колич.║   Сумма    ║'
@ 3 ,L SAY '╠═════════╬══════╬════════════╬═════════╬══════╬════════════╣'
@ N, L SAY '╚═════════╩══════╩════════════╩═════════╩══════╩════════════╝'
store 0 to w2,kl0,ghs,gh
go top
L=16
DO WHILE .NOT. EOF()
kb=kodbank
kb1=rovd
store 0 to su1,su2,su3,kl
do while kodbank=kb .and. .not. eof()
if substr(kassa,1,1)="б" .and. datapom>=h1 .and. datapom<=h2
su2=su2+summav
kl=kl+1
endif
skip
enddo
if row()=20 .or. eof()
n0=n
l= l+30
n=4
else
@ N , L SAY '║         ║      ║            ║         ║      ║            ║'
endi
@ n ,L+1 say kb pict "99"
@ n ,L+5 say kb1 pict "XXXX"
@ n ,L+12 say kl pict "9999"
@ n,L+18 say su2 pict "999999999.99"
w2=w2+su2
kl0=kl0+kl
n=n+1
enddo
l=16
@ N0 , L SAY '║ВСЕГО:   ║      ║            ║         ║      ║            ║'
@ n0 ,L+12 say kl0 pict "9999"
@ n0,L+18 say w2 pict "999999999.99"
@ N0+1, L SAY '╚═════════╩══════╩════════════╩═════════╩══════╩════════════╝'
 wait ""
enddo
set color to w+/n
restore screen from e
use &kurdb
set inde &kin1,&kin2,&kin3,&kin4
retu
