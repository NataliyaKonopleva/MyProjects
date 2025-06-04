sele 2
use tf
sele 1
use kart
*inde on delo to kart1
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
 a1=adres1
 a2 =adres2
 k=kodinv

 a=iif(row()<23,row()+1,12)
 @ a+1,6 say str(delo,5)+"   "+fam+space(10)
 sele 2
 appe blank
 repl delo with d,fam with f,dolgn with dol,kodinv with k,uchwoin with a->uchwoin,datar with a->datar
 repl adres1 with a1,adres2 with a2,mestosl with a->mestosl,kodzwan with ;
a->kodzwan,kodzwan1 with a->koDZwan1,KODBANK WITH a->kodbank

 sele 1
endif
enddo
