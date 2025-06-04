* Формирование списков на матпомощь
set talk off
clea
save scre to ek1
Z=30
sele 5
use bank
set devi to screen
set date germ
   i=1
   l=0
do while .not. eof()
   if i>20
     i=1
     l=60
   endif
   @ i  ,l say ltrim(str(codbnk))+" "+trim(nambnk)
   i=i+1
   skip
enddo
sele 1
use chernmp
 inde on str(codbnk,2)+str(delo,5) to 1
*use cart inde cartbank
go top
do while .t.
kb=0
@ 12,20 say "Укажите код банка => " get kb pict "99"
read
if readkey()=12  .or. readkey()=262
  quit
endif
@ 0,0 clea to 23,19
sele 5
go top
loca for codbnk=kb
nb=iif(found(),"В "+trim(nambnk)+" банк"," ")
kb1=str(kb,2)
@ 2,30 Say nb
sele 1
****************
store 0 to kper
seek kb1
 do while .not. eof() .and. str(codbnk,2)=kb1
 if  summa>0
    kper=kper+1
  endif
skip
enddo
@ 20,40 say "В списке будет "+str(kper,4)+ " чел"
wait ""
***************
seek kb1
store 1 to lis1,lis
spisok="mp"+ltrim(kb1)
set devi to FILE &spisok
@ prow(),50 say "1001 505 472 263 "
@ prow()+1,10 say "Список пенсионеров МВД-участников ликвидации аварии на ЧАЭС, инвалидов"
@ prow()+1,10 say " из их числа,членов их семей, ветеранов подразделения особого риска"
@ prow()+1, 7 say "для оказания материальной помощи одновременно с пенсией за апрель 2006г."
@ prow()+1,3  say "Основание: телеграмма МВД России от 10.02.2006 г. N 1/970"
*@ prow()+1,3  say "по 240 рублей на каждого члена семьи умершего (погибшего) сотрудника."
@ prow()+1,2 say nb +space(40)+"стр."+ltrim(str(lis,2))
do while .not. eof() .or. codbnk#kb
np=(lis-1)*Z
m=prow()+2
q="│"
@  m  ,0 say "┌────┬─────┬──────────────────────────────────┬──────────────────┬──────────┐"
@  m+1,0 say "│N   │  N  │   Фамилия, имя ,отчество         │Материальная      │Пенсионный│"
@  m+2,0 say "│п/п │пенс.│      пенсионеpа                  │помощь            │  лист    │"
@  m+3,0 say "│    │дела │                                  │                  │          │"
@  m+4,0 say "│────┼─────┼──────────────────────────────────┼──────────────────┼──────────│"
m=prow()+1
i=1
do while .not. eof() .and. i<=Z .and. codbnk=kb
ndb=""
*if  codlea=0 .and. vidpns#3 .AND. ITGPNS#ITGPNS0 .and. (endpay>=ctod("31.03.2002") .or. endpay=ctod("  .  .  "))
 if  summa>0
pnslst_="  "+pnslst+" "
p=0


@ m,0   say q+str(np+i,4)+q+str(delo,5)+q+substr(fam,1,34)+q+str(summa,18,2)+q+pnslst_+q
if i<z
@ PROW()+1,0 say "├────┼─────┼──────────────────────────────────┼──────────────────┼──────────┤"
endif
m=prow()+1
i=i+1
endif
 skip
enddo
if eof() .or. codbnk#kb
store 0 to v,vd,v1
seek kb1
 do while .not. eof() .and. str(codbnk,2)=kb1
 if  summa>0
       v1=v1+summa
 endif
skip
enddo
*v=v1+vd
  cifra=v1
 m=prow()+1
 @ m,0   say "│ВСЕГО:    │"+space(34)+q+str(v1,18,2)+q+"          "+q
 @ m+1,0 say "└──────────┴──────────────────────────────────┴──────────────────┴──────────┘"
  do perev1
ss=2
* prow()+1,1 say "Всего        :"
 @ prow()+2, ss say sos1
  ZZ=2
 @ prow()+2 , 5 saY "Hачальник центра пенсионного                   H.Х.Алиева "
 @ prow()+1 , 5 saY "обслуживания"
 @ prow()+2 , 5 saY "Заместитель начальника центра                  С.H.Калачева "
@ prow()+2,0 say date()
set devi to scre
exit
 else
@ prow()+1,0 say "└──────────┴──────────────────────────────────┴──────────────────┴──────────┘"
@ prow()+1,0 say ""
endif
lis1=lis+1
lis=lis+1
enddo
enddo
