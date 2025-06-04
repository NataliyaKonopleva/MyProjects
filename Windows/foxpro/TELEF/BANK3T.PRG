*Списки по банкам
save scre to ek1
parameters x
set devi to screen
sele 4
set inde  &tel4,&tel2,&tel1,&tel3
             kkk="100"
             chap=1
 do while .t.                                      &&1
              do sprbank
              SET COLOR TO n/w,b/w
               @ 19,25 clea to 19,55
                 sele 4
                 if kkk="0"
                     RETU
                 ENDI
                      kb=val(kkk)
                      seek kkk
                      if .not. found()
                        @ 19,25 say "Компенсация не выдавалась"
                       wait ""
                       loop
                      endi
************
if x=2
 do otr
endif
if x=1
store 0 to kol_,de,V
do while .not. eof() .and. str(codbnk,2)=kkk
if " "=pr
kol_=kol_+1
de=delo
pz=recno()
v=v+summa
endif
skip
enddo
@ 17,20 say "В списке будет "+ltrim(str(kol_))+" чел. -" +str(v,10,2)+"руб."
if kol_=0
 loop
endi
kb=val(kkk)
nb="В "+trim(bank->nambnk)+" сбербанк"
***********
do while .t.
set devi to scre
set color to  b/w
M20="  Печать списка               "
M21="  Сопроводиловка в сбербанк   "
M22="  Отработка списка            "
do M1 WITH 20,22,1,25
  if G=27
   exit
  endif
do case
   case g=20
    do spisokT
   case g=21
    do sopr
   case g=22
    do Spisok_
endcase
enddo                 && по второму меню
endif
enddo
**********************************
procedure sopr
set devi to print
@ prow(),1 say  "E"
sele 4
seek str(kb,2)
m=prow()
@ m+1,4 say   trim(bank->nambnk)+" сбербанк "
@ m+1,45 say "Пенсионный отдел УВД ЯО "
@ m+2,4  say "Eна N____от "+sysd
@ m+2,47 say "Ярославской области       "
@ m+3,45 say "150000,г.Яpославль,ул.Республиканская, 23F"
@ prow()+2,10 say "4Выплата компенсации за телефон  за "+str(gg1,4)+ " год "
@ prow()+1, 5 say " произведена '_____' _____________г. в соответствии со спискомFM5"
i=1
@ prow(),0 say " "
m=prow()+2
do while .not. eof() .and. codbnk=kb
a=0
do while a<=2 .and. .not. eof() .and. codbnk=kb
if pr=" "
 @ m,a*43 say str(i+a,3)+".48/"+str(delo,5)+" "+substr(nampns,1,at(" ",nampns))+space(14-at(" ",nampns))+str(summa,9,2)
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
**********************************
procedure spisok_
D0=date()
seek str(kb,2)
do while .not. eof() .and. codbnk=kb
if " "=pr
repl pr    with "с",datav with  d0
endif
skip
enddo
retu
**********************************************
procedure otr
set cent on
store ctod("  .  .  ") to dn,dk
kolvsp=0
@ 18,15 say "Дата списка: " get dN
@ 18,40 say "Дата выдачи: " get dk
read
if readkey()=12 .or. readkey()=262
 retu
endif
sele 4
seek str(kb,2)
do while .not. eof() .and. codbnk=kb
if  datav=dn .and. pr="с" .and. data2=ctod("  .  .  ")
repl data2   with dk
kolvsp=kolvsp+1
endif
skip
enddo
@ 19,15 say kolvsp pict "9999"
set cent off
retu
**********************************
procedure spisokT
sele 4
seek str(kb,2)
store 1 to lis1,lis
do while .t.                                            &&3
set devi to scre
set color to w/n
chap=1
@ 18,20 say "Номеp листа          =>" get lis pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
if lis#lis1
  seek str(kb,2)
 j=0
 do while j<(lis-1)*16
   j=iif(pr=' ',j+1,j)
  skip
 enddo
endif
np=(lis-1)*16
set devi to print
@ prow(),1 say " "
if lis=1
sele 4
m=prow()
nb_="В "+trim(bank->nambnk)+" сбербанк"
@ m+1,4 say   "EУПРАВЛЕНИЕ ВНУТРЕННИХ ДЕЛ                  4"+nb_+"5"
@ m+1,45 say repl("_",len(nb_))
@ m+2,4 say "    ЯРОСЛАВСКОЙ ОБЛАСТИ F         "
@ m+3,45 say bank->adres1
@ m+3,4 say "150000,г.Яpославль,ул.Республиканская, 23"
@ m+4,45 say bank->adres2
@ m+4,4 say "   "+sysd
@ m+4,4 say "   _________________ "
@ m+5,4 say "         10/"
@ prow()+2,20 say "E4  Список пенсионеров для выплаты компенсации"
@ prow()+1,20 say "        за телефон  за "+str(gg1,4)+" год FM5"
else
@ prow(),30 say "-"+ltrim(str(lis,2))+"-M"
endi
m=prow()+1
q="|"
t=2
@  m  ,t say "-----------------------------------------------------------------------------------"
@  m+1,t say "|N   |  N  |   Фамилия, имя ,отчество          |                                  |"
@  m+2,t say "|п/п |пенс.|      пенсионеpа                   | Размеp компенсации на  телефон   |"
@  m+3,t say "|    |дела |                                   |                                  |"
@  m+4,t say "|----|-----|-----------------------------------|----------------------------------|"
m=prow()+1
i=1
do while .not. eof() .and. i<=16 .and. codbnk=kb
ndb=""
if pr=" "
cifra=summa
do perev1
@ m, t   say q+str(np+i,4)+q+str(delo,5)+q+substr(nampns,1,35)+q+"w1"+str(summa,10,2)+"w0"+space(14)+q
@ m+1,t say "|          |"+lower(sos1)+space(70-len(sos1))+q+""
@ m+2,t say "|----|-----|-----------------------------------|----------------------------------|"
m=prow()+1
i=i+1
************
if recno()=pz
  chap=0
endif
************
endif
skip
ENDDO
if eof() .or. codbnk#kb .or. chap=0
  cifra=v
 m=prow()+1
@ m,t   say "|ВСЕГО:    |"+space(36)+"w1"+str(v,10,2)++"w0"+space(14)+q
@ m+1,t say "-----------------------------------------------------------------------------------"
  do perev1
ss=2
 @ prow()+2, ss say sos1
if len(sos1)>=85
@ prow(),1 say "FM"
endi
  z=iif(i<14,3,2)
 @ prow()+z, 5 say "Начальник ФЭУ УВД ЯО:                              Засыпин В."
 @ prow()+z, 5 say "Начальник пенсионного отдела:                      Алиева .Х."
 endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
set devi to scre
retu
