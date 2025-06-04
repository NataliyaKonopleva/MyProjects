* Ввод компенсаций за месяц  всем
save scre to e
set date brit
gg1=year(date())
mesk=iif(month(date())=12,1,month(date())+1)
set color to w/b
@ 15,15 say "Введите год  " get gg1 pict "9999"
@ 16,15 say "и месяц      " get mesk pict "99"
read
if readkey()=12 .or. readkey()=262 .or. mesk>12 .or. mesk<1
  clea
rest scre from e
  retu
endi
gg=substr(str(gg1,4),3,2)

chernv="chernv"+gg+".dbf"
cin="cherv"+gg +".ntx"

sele 1
use &chernv inde &cin
sele 4       &&  chern
use chern
set filt to .not. deleted() .and. (cat="3" .or. (cat="1" .and. avar<=1987))
go top
do while .not. eof()

store 0 to su1,su2
 cat_=chern->cat
 if  chern->grp=0 .and. (cat_="3" .or. (cat_="1" .and. avar<=1987))
            su1=358.94   &&   317.65
             su2=0
 endi

 if  chern->grp>0
             su1=538.43   &&    476.49
             su2=538.43*CHERN->do_14
 endi
sele 1
appe blank


repl datav with date(),kols with chern->kols,delo with chern->DELO,;
KODV WITH MESK,naim with "за питание",sum1 with su1,sum2 with su2,codbnk with chern->codbnk,;
kas with "c/б",srok with mesk,codbnk_ with chern->codbnk

if codbnk=1 .or. codbnk>=18 .or. codbnk=4 .or. codbnk=11 .or. codbnk=5
   repl codbnk_ with 1
endif
sele 4
skip
enddo
return
