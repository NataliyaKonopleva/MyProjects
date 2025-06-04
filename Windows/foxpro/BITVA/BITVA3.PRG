sele 2
use japon
sele 1
use kart
inde on delo to kart1
use kart inde kart1
set talk off
go top
clea
store 1 to lis1,lis
do while .t.
set devi to screen
nomer=0
@ 10,12 say "Укажите номеp дела => " get nomer pict "99999"
read
if readkey()=12 .or. readkey()=262
   yn=" "
    clea
   @ 10,12 say "Ввод закончен (Y/N) ?=> " get yn pict "x"
    read
   if yn$"yYДд"
   retu
   else
   loop
   endif
endif
seek nomer
if found()
 d=delo
 f=fam
 dol=dolgn
 s=itpens
 a1=adres1
 a2 =adres2

 a=iif(row()<23,row()+1,12)
 @ a+1,6 say str(delo,5)+"   "+fam+str(s,8,2)+space(10)
 sele 2
 appe blank
 repl delo with d,fam with f,adres1 with a1,adres2 with a2,dolgn with dol,;
kodbank with kart->kodbank,penlist with kart->penlist,prichwib with kart->prichwib,delowib with kart->delowib
 sele 1
endif
enddo
