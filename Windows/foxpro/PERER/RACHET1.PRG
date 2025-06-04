* Расчет доплаты во вpемя пеpеpасчета (для семей)
set esca off
set talk off
set date germ
set color to
sele 1
use kart inde kart1
***************************
sele 2
use poluch
do while .not. eof()
d=delo
dop=0
sele 1
if prichwib=" " .and. kodpens="3"
 sele 2
 if  srwipl1<=ctod("01.07.94")
  dop=itpens-itpens0
 endif
 if srwipl1>ctod("01.07.94") .and. srwipl1<=ctod("31.07.94")
 d=day(srwipl1)
 k=31-d+1
   dop= (itpens-itpens0)/31*k
 endif
 if srwipl1>=ctod("01.08.94")
  dop=0
 endif
endif
 sele 2
 repl  dopl with dop,vsego with dop+itpens
skip
enddo
