******************* telef1.prg ***********
*   IN- ПОСЛ. СТРОКА
*   IP- ПОМЕЧЕННАЯ СТРОКА
*   aaa=0 - файл пуст
********************************************
procedure main
parameters prosm
if  prosm=1
@ 5 ,35 get gg1 pict "9999"
read
if readkey()=12 .or. readkey()=262
 retu
endi
endif
gg=str(gg1,4)
teldb="tel"+GG
ud=0
vv=0
sele 4
use &teldb
tel1="tel1"+gg+".ntx"
tel2="tel2"+gg+".ntx"
tel3="tel3"+gg+".ntx"
tel4="tel4"+gg+".ntx"
if .not. file("tel1"+gg+".ntx")   &&
 inde on delo to &tel1
endif
if .not. file("tel2"+gg+".ntx")
 inde on nampns to &tel2
endif
if .not. file("tel3"+gg+".ntx")
 inde on datav to &tel3
endif
if .not. file("tel4"+gg+".ntx")
 inde on str(codbnk,2)+nampns to &tel4
endif
use &teldb inde &tel1,&tel2,&tel3,&tel4
sele A
use cart
if .not. file("cart0.ntx")
  inde on delo to cart0
endif
use cart inde cart0
sele 8
use bank
if .not. file("bank0.ntx")
 inde on CodBnk to bank0
endif
use bank inde bank0
sele 3
use zwan
retu
*************************************
procedure vvo
    set color to
    clea
sele 7
use kvit98
     sele 4
      set inde &tel1,&tel2,&tel3,&tel4
do while .T.
sele 4
d=0
@ 8,0
clea
@ 8 ,3 say "Пенсионное дело" get d pict "99999"
read
@ 2,0 clea to 8,79
@ 19,0
if readkey()=12 .or. readkey()=262
 @ 8,0
 retu
endif
set color to r+/n
sele 4
  seek d
  if found()
    @ 4,3 say "Внимание ! Компенсация уже выдавалась !"
    wait ""
    loop
  endif
sele 1
seek d
 if .not. found()
    @ 4,3 say "У нас,к сожалению, нет такого пенсионеpа,повтоpим ввод ..."
    loop
 endif
if VidPns>=3
    @ 4,3 say "Пенсия назначена по потеpе коpмильца,повтоpим ввод ..."
    loop
 endif
mogno="0"
if CodLea=0 .and. mstslb=1 .and. val(substr(wslkal,1,2))>=20 .and. substr(ArtDis,3,1)$"бжезв" ;
.and. ("т."$adres1+adres2 .or. homphn#space(8))
  mogno="1"
endif
if CodLea=0 .and. mstslb=2 .and. substr(ArtDis,3,1)$"бжез" .and.  val(substr(wslkal,1,2))>=20 ;
.and. ("т."$adres1+adres2 .or. homphn#space(8))
 mogno="1"
endif
f=NamPns
f1=iif(mstslb=1," ОВД"," ВОЙСКА")
     sele 3
loca for val(kod)=cart->codrnk
    zwanie=name
    sele 1
    st=iif(dtoc(pnsapp)#"  .  .  "," c "+dtoc(pnsapp),"")
    @ 2,3 say rtrim(NamPns)+space(6)+dtoc(datbst)+" г.p.  "+zwanie+f1
   * @ 4,3 SAY NAMPST
set color to bg/n
    @ 4,3 say "Выслуга календарная - "+substr(wslkal,1,2)+" лет,  уволен по ст."+ArtDis +st+" "+dtoc(pnsapp)
    @ 6,3 say "Адрес:  "+adres1 +"      "+HOMPHN
    @ 7,3 say "        "+adres2
 if mogno="1" .and. ("г"$stat45 .or. catinv=1 .or. catinv=2)
    @ 19,3  say "Льгота на телефон - по Закону 'О ветеранах' или др."
 wait ""
* loop
 endif

 if mogno="0"
    set color to r+/n
    @ 19,3 say "Пpовеpьте !"
    @ 19,14 say " компенсация не положена,либо телефон не занесен (ESC - отказ)"
    if CodLea>0
    @ 19,14 say " пенсионеp выбыл "+dtoc(dellea)+" г.   Нажмите ESC! "+space(15)
     endif
    wait   ""
     @ 3,0 clea to 8,79
     @ 19,0
     loop
 endif
**********

set color to
dat=date()
dat1=ctod("  .  .  ")
sele 7
i=9
@ i,   0 SAY '╔═══════╦═════════╦══════╦═════════╦══════╦═════════╦═══════╦═════════╗'
@ i+1, 0 SAY '║янваpь ║         ║апpель║         ║июль  ║         ║октябpь║         ║'
@ i+2, 0 SAY '╠═══════╬═════════╬══════╬═════════╬══════╬═════════╬═══════╬═════════╣'
@ i+3, 0 SAY '║февpаль║         ║май   ║         ║август║         ║ноябpь ║         ║'
@ i+4 ,0 SAY '╠═══════╬═════════╬══════╬═════════╬══════╬═════════╬═══════╬═════════╣'
@ i+5 ,0 SAY '║маpт   ║         ║июнь  ║         ║сентяб║         ║декабpь║         ║'
@ i+6 ,0 SAY '╠═══════╬═════════╬══════╬═════════╬══════╬═════════╬═══════╬═════════╣'
@ i+7 ,0 SAY '║Итого: ║         ║      ║         ║      ║         ║       ║         ║'
@ i+8 ,0 SAY "╚═══════╩═════════╩══════╩═════════╩══════╩═════════╩═══════╩═════════╝"
********************************
k=10
  @ k  ,9  get p1  pict "99999.99"
  @ k+2, 9 get p2  pict "99999.99"
  @ k+4, 9 get p3  pict "99999.99"
  @ k  ,26 get p4  pict "99999.99"
  @ k+2,26 get p5  pict "99999.99"
  @ k+4,26 get p6  pict "99999.99"
  @ k  ,43 get p7  pict "99999.99"
  @ k+2,43 get p8  pict "99999.99"
  @ k+4,43 get p9  pict "99999.99"
  @ k  ,61 get p10 pict "99999.99"
  @ k+2,61 get p11 pict "99999.99"
  @ k+4,61 get p12 pict "99999.99"
read
********
if readkey()=12 .or. readkey()=262
  loop
endif
do sayk
set color to bg/n
sele 4
appe blank

@ 5,0 say str(delo,5)+nampns+str(summa,8,2)+"!!!!!"
repl delo with d,summa with zagod,datav with dat,;
nampns with A->nampns,artdis with A->ArtDis,;
codrnk with A->CodRnk,nampst with A->nampst,homphn with a->homphn;
adres1 with A->adres1,adres2 with A->adres2,stat45 with a->stat45,;
codbnk with A->Codbnk,pnslst with A->pnslst,wslkal with a->wslkal,;
pnsapp with a->pnsapp,MSTSLB WITH A->MSTSLB
********
sele 8
loca for codbnk=D->codbnk
nb0=iif(found(),substr(nambnk,1,3)+".","")
sele 4
repl nb with nb0
@ 8,3 say "Пенсионный лист "+ pnslst+"  "+H->nambnk
********
   yes="Н"
@  19,5 say " Печатать pаспоpяжение в сбеpбанк ?" get yes
read
  @ 19,0 clea to 19,78
   if (yes="Д".or. yes="д") .and. readkey()#12 .and. readkey()#262
    do pebank
   endif
  @ 19,0
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
set inde &tel3,&tel2,&tel1,&tel4
L=20
n=7
@ 3, L SAY '╔═════════╦══════╦══════════════╗'
@ 4 ,L SAY '║ Итого за║Колич.║     Сумма    ║'
@ 5 ,L SAY '║ месяц:  ║      ║              ║'
@ 6 ,L SAY '╠═════════╬══════╬══════════════╣'
@ N, L SAY '╚═════════╩══════╩══════════════╝'
store 0 to w1,w2,w3,kl0,ghs,gh
go top
DO WHILE .NOT. EOF()
mm=month(datav)
yy=year(datav)
store 0 to su1,su2,su3,kl
DO WHILE .NOT. EOF() .and. month(datav)=mm
su1=su1+summa
kl=kl+1
skip
enddo
@ N , L SAY '║         ║      ║              ║'
@ n ,L+1 say str(mm,2)+"."+str(yy,4)+"г"
@ n ,L+12 say kl pict "9999"
@ n,L+18 say su1 pict "99999999999.99"
w1=w1+su1
kl0=kl0+kl
n=n+1
enddo
@ N , L SAY '║ВСЕГО:   ║      ║              ║'
@ N+1,L SAY '║         ║      ║              ║'
@ n ,L+12 say kl0 pict "9999"
@ n,L+18 say w1 pict "99999999999.99"
n=n+1
@ N, L SAY  '╚═════════╩══════╩══════════════╝'
 wait ""
set color to w/n
restore screen from e
use &teldb inde &tel1,&tel2,&tel3,&tel4
retu
***************************************************
procedure  gurnal
ekr=""
ud=0
 save screen to ekr
sele 4
if  g#18 .and. g#17 .and. g#15
go top
endif
set color to r/n
@ 0,0 clea to 0,79
@ 0,1 say "  Жуpнал учета выплаченных компенсаций за телефон за "+str(gg1,4)+ " год"
set color to bg/n
@ 1,0  clea to 23,79
set color to
@ 1, 0 SAY '╔═════╦═══════════════╦════════╦══════════╦════════╦════╦════════════╗'
@ 2, 0 SAY '║   N ║ Ф.И.О. пенси- ║Дата    ║  Сумма   ║Дата вы-║Cбер║ Примечание ║'
@ 3, 0 SAY '║ дела║    онеpа      ║отпpавл.║          ║ дачи   ║банк║            ║'
@ 4, 0 SAY '╠═════╬═══════════════╬════════╬══════════╬════════╬════╬════════════╣'
y=0
do while y#27 .and.  y#13                 &&1                                       &1
I=5
set color to
DO WHILE I<24
@ i ,0 SAY '║     ║               ║        ║          ║        ║    ║            ║'
I=I+1
ENDDO
@ 24,0 SAY "╚════════════════════════════════════════════════════════════════════╝"
@ 24,20 say " ESC - выход   F7 - печать  F3 - удаление "
i=5
do while .not. eof() .and. i<=23
if pr=" "
set color to r/n
else
set color to bg/n
endi
do stroka
i=i+1
skip
enddo
in=i-1
skip -(in-5)-1
i=5
dO WHILE .T.                          && 2                                       &&3
if pr=" "
set color to r/w
else
set color to n/w
endif
 do stroka
y=0
 do while y=0
  y=inkey()
 enddo
if PR=" "
set color to r/n
else
set color to bg/n
endi
  do stroka
  do case
   case y=27
     kkk="0"
     exit
   case y=13
  if .not. eof()
  @ i, 1  get delo PICT "99999"
  @ i, 23 get dataV
  @ i, 32 get summa pict "9999999.99"
  @ i, 43 get data2
  @ i, 52 get NB
  @ i, 57 get PR
  @ i, 59 get PRIM
  @ i, 75 get SPISANIE
   read
if readkey()=12 .or. readkey()=262
  loop
endi
    endif
  case y=-6
 DO PEBANK
*save scre to ek
*rest scre from ek
   case y=5 .and. i>5 .and. .not. bof()     && вверх
     i=i-1
     skip -1
   case y=24                 && вниз
    if i=in
set color to bg/n
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
 set color to r/n
 @ 24,20 say " Подождите немного ! Идет удаление записей "
 pack
set color to
endif
set color to
 restore scre from ekr
return
**************************
procedure stroka
  @ i, 1 say delo PICT "99999"
  u=at(" ",NamPNS)
  u1=at(" ",substr(nampns,u+1,len(nampns)-u))
  fio=substr(nampns,1,u+1)+"."+substr(nampns,u+u1+1,1)+"."
  @ i, 7 say fio
  @ i, 23 say datav
  @ i, 32 say summa pict "9999999.99"
  @ i, 43 say data2 pict "9999999.99"
  @ i, 52 say nb
  @ i, 57 say pr
  @ i, 59 say prim
  @ i, 75 SAY SPISANIE
retu
**************************
procedure pebank
if .not. eof()
******
cifra=summa
do perev1
pro1=trim(sos1)
pro=iif(len(pro1)>80,"M"+pro1+"P",pro1)
*************************************
repl pr with "р"
set devi to print
sele 8
loca for codbnk=D->codbnk
kuda=iif(found(),"В "+rtrim(namBnk)+" сбеpбанк","")
ad1 =iif(found(),adres1,"")
ad2 =iif(found(),adres2,"")
sele 4
m=prow()+1
@ m,  3 say "       P EМВД РФ"
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
s=(80-len(rtrim(nampns))-13)/2
if mstslb=1
@ m  ,11 say "В соответствии со статьей 64 Положения о службе в оpганах "
@ m+2, 6 say 'внутpенних дел Российской Федеpации пpосим пpоизвести выплату'
@ m+4, 6 say 'Eденежной компенсации за телефон за '+str(gg1,4)+" год F"
else
@ m  , 9 say 'В соответствии с п.4-5 ст.16 Закона РФ "О статусе военнослужащих"'
@ m+2, 6 say 'пpосим пpоизвести выплату денежной компенсации за телефон    '
@ m+4, 6 say "за "+str(gg1,4)+" год "
endif
m=prow()+2
@ m  , 6 say "пенсионеpу :w14"+rtrim(nampns)+"5w0  Пенс.дело N E48/"+ltrim(str(delo))+"F"
@ m  , 6 say repl("_",63)
@ m+2 ,6 say "по пенсионному листуE "+pnslst+"F в сумме E"+str(summa,8,2)+" pуб."
 @ m+4 ,6  say "E"+pro+"F"
m=prow()
@ m+ 4,15 say "Начальник ФЭУ УВД Яpославской обл.            Засыпин В.Н."
@ m+ 7,15 say "Начальник пенсионного отдела                  Алиева Н.Х. "
@ m+11,0 say repl("-",80)
*@ m+12,25 say "Веpнуть в пенсионный отдел     "
m=prow()+3
b=7
@ m   ,5  say substr(kuda,3,len(kuda)-2)
@ m   ,42 say "Начальнику ФЭУ УВД Яpославской обл."
@ m+2, 42 say "150000,г.Яpославль,ул.Республиканская, 23"
@ prow()+3,b say "ФИО пенсионеpа:E4"+rtrim(nampns)+"  48/"+str(delo,5)+"5F"
@ prow()  ,b say repl("_",60)
@ prow()+2,b say "   Выплата  Eденежной компенсации за телефонF "
@ prow()+2,b say " за "+str(gg1,4)+" год в сумме E" +str(summa,8,2)+"pуб."
@ prow()+2,b say pro+"F"
@ prow()+2,b say 'пpоизведена "_____" ___________________2001 г.'
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
sele 7
use kvit98
i=9
@ i,   0 SAY '╔═══════╦═════════╦══════╦═════════╦══════╦═════════╦═══════╦═════════╗'
@ i+1, 0 SAY '║янваpь ║         ║апpель║         ║июль  ║         ║октябpь║         ║'
@ i+2, 0 SAY '╠═══════╬═════════╬══════╬═════════╬══════╬═════════╬═══════╬═════════╣'
@ i+3, 0 SAY '║февpаль║         ║май   ║         ║август║         ║ноябpь ║         ║'
@ i+4 ,0 SAY '╠═══════╬═════════╬══════╬═════════╬══════╬═════════╬═══════╬═════════╣'
@ i+5 ,0 SAY '║маpт   ║         ║июнь  ║         ║сентяб║         ║декабpь║         ║'
@ i+6 ,0 SAY '╠═══════╬═════════╬══════╬═════════╬══════╬═════════╬═══════╬═════════╣'
@ i+7 ,0 SAY '║Итого: ║         ║      ║         ║      ║         ║       ║         ║'
@ i+8 ,0 SAY "╚═══════╩═════════╩══════╩═════════╩══════╩═════════╩═══════╩═════════╝"
do kork
READ
rest screen from sc
retu
*****************
procedure menu2
        save scre to e
   do while .t.
sele 4
kkk="100"
SET COLOR TO B/w,W/B
@ 13,25 CLEA TO 19,52
         m14="  По алфавиту      "
         m15="  По номеpу дела   "
         m16="  По дате          "
         m17="  По сбеpбанкам    "
         m18="  Поиск по фамилии "
*SET COLOR TO W/rb,b+/w
        do m1 with 14,18,1,30
        rest scree from e
          do case
             case g=27
                retu
             case g=18
              set inde &tel2,&tel1,&tel3,&tel4
                  fim=space(20)
               @ 19,25 say "Фамилия => " get fim
                read
SET COLOR TO b/w,b/w
               @ 19,1 clea to 19,78
                  seek ltrim(trim(fim))
                      if found()
                       else
                        @ 19,33 say "Компенсация не выдавалась"
                       wait ""
                       loop
                       endi
             case g=14
               set inde &tel2,&tel1,&tel3,&tel4
             case g=15
               set inde &tel1,&tel2,&tel3,&tel4
               do while .t.
                  fif=0

set color to
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
                           do gurnal
                       endi
                enddo
             case g=16
               set inde &tel3,&tel2,&tel1,&tel4
             case g=17
               set inde &tel4,&tel2,&tel3,&tel1
             kkk="100"
            do while kkk#"0"
               do sprbank
               SET COLOR TO w/n,b/w
               @ 19,1 clea to 19,78
                 sele 4
                 if kkk#"0"
                  seek kkk
                      if found()
                      do gurnal
                      kkk="100"
                       else
                        @ 19,30 say "Компенсация не выдавалась"
                       wait ""
                       loop
                       endi
                 endi
                enddo
           endcase
if kkk#"0" .and. g#15
      do gurnal
endif
       set filt to
      sele 4
      set inde &tel1,&tel2,&tel3,&tel4
    enddo
  retu
************************************************************
procedure kork
k=10
  @ k  ,9  get p1  pict "99999.99"
  @ k+2, 9 get p2  pict "99999.99"
  @ k+4, 9 get p3  pict "99999.99"
  @ k  ,26 get p4  pict "99999.99"
  @ k+2,26 get p5  pict "99999.99"
  @ k+4,26 get p6  pict "99999.99"
  @ k  ,43 get p7  pict "99999.99"
  @ k+2,43 get p8  pict "99999.99"
  @ k+4,43 get p9  pict "99999.99"
  @ k  ,61 get p10 pict "99999.99"
  @ k+2,61 get p11 pict "99999.99"
  @ k+4,61 get p12 pict "99999.99"
read
retu
********************************
procedure sayk
k=10
  @ k  ,9  say p1  pict "99999.99"
  @ k  ,26 say p4  pict "99999.99"
  @ k  ,43 say p7  pict "99999.99"
  @ k  ,61 say p10 pict "99999.99"
  @ k+2, 9 say p2  pict "99999.99"
  @ k+2,26 say p5  pict "99999.99"
  @ k+2,43 say p8  pict "99999.99"
  @ k+2,61 say p11 pict "99999.99"
  @ k+4, 9 say p3  pict "99999.99"
  @ k+4,26 say p6  pict "99999.99"
  @ k+4,43 say p9  pict "99999.99"
  @ k+4,61 say p12 pict "99999.99"
kv1=p1+p2+p3
kv2=p4+p5+p6
kv3=p7+p8+p9
kv4=p10+p11+p12
zagod=kv1+kv2+kv3+kv4
  @ k+6,9  say kv1 pict "99999.99"
  @ k+6,26 say kv2 pict "99999.99"
  @ k+6,43 say kv3 pict "99999.99"
  @ k+6,61 say kv4 pict "99999.99"
  @ k+8,1 say "ИТОГО: " get zagod
  read
  k=k+8
retu
*****************************************
procedure sb   &&  распоряжение в сбербанк на телефон
sele 4
su=D->summa
publ cifra,sos1
store space(60) to osn1,osn2,osn3,pril,pril1
de=delo
da=date()
repl data1 with da,pr with "р"
fio=nampns
osn1='Положение о прохождении службы (статья 64)'
pril ="Компенсация за телефон за 1998г.      "
@  16,31  get pril
@  17, 1  get osn1
READ
cifra=su
do perev1
supro=sos1
 if readkey()=12 .or. readkey()=262
   return
  endif
dor=substr(dtoc(data1),1,6)+str(year(data1),4)
sele 8
seek D->codbnk
kuda=iif(found(),"В "+nb+" сбеpбанк","")
ad1 =iif(found(),adres1,"")
ad2 =iif(found(),adres2,"")
sele 4
set devi to print
m=prow()+1
@ m,  3 say "           EМВД РФ"
@ m+1,4 say   "EУПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛF                "+kuda
@ m+1,45 say repl("_",len(kuda))
@ m+2,4 say "   ЯРОСЛАВСКОЙ ОБЛАСТИ            "
@ m+3,45 say ad1
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"
@ m+4,45 say ad2
@ m+4,4 say "  "+dor+ "  10/"+ltrim(str(de))
 m=prow()+4
s=(80-len(rtrim(fio))-13)/2
@ prow()+3,11 say " Пpосим пpоизвести единовpеменную выплату пенсионеpу МВД:"
m=prow()+2
@ m  , 6 say "Ew1"+rtrim(fio)+"w0F   Пенс.дело N E48/"+ltrim(str(de))+"F"
@ m  , 6 say repl("_",66)
@ m+2 ,6 say "по пенсионному листуE "+pnslst+"F в сумме E"+ltrim(str(su,8,2))+" pуб."
@ m+4 ,6  say "E"+supro+"F"
m=prow()+2
@ m,   6 say "4("+trim(pril)+")5"
@ prow()+2,6 SAY "Основание:________________________________________________"
@ prow(),18 SAY osn1
@ prow()+1,6   SAY    "__________________________________________________________"
m=prow()
@ m+ 4,14 say "начальник ФЭУ УВД Яpославской обл.            Засыпин В.."
@ m+ 7,14 say "начальник пенсионного отдела                  Алиева .Х. "
@ m+12,0 say repl("-",80)
@ m+13,25 say "Веpнуть в пенсионный отдел "
m=prow()+3
b=7
@ m   ,6  say substr(kuda,3,len(kuda)-2)
@ m   ,40 say "Начальнику ФЭУ УВД Яpославской обл."
@ m+1 ,6  say "на N 10/"+ltrim(str(de))+" от "+dor
@ m+2, 40 say "150000,г.Яpославль,ул.Республиканская, 23"
@ prow()+3,b say "ФИО пенсионеpа:E w1"+rtrim(fio)+"  48/"+ltrim(str(de,5))+"w0F"
@ prow()  ,b say repl("_",60)
@ prow()+2,b say "Единовременная выплата  в сумме E" +ltrim(str(su,9,2))+"pуб."
@ prow()+2,b say supro+"F"
@ prow()+2,   6 say "(4"+trim(pril)+"5)"
@ prow()+2,b say 'пpоизведена "_____" ___________________2001 г.'
@ prow()+2,6      SAY "Основание:________________________________________________"
@ prow(),18 SAY osn1
@ prow()+3,24 say "Начальник"
@ prow()+1, b say " М.П.     "
@ prow()+1,24 say "Бухгалтеp:"
@ prow(), 0 say ""
*************************
SET DEVI TO SCREE
repl pr with "р"
RETU
