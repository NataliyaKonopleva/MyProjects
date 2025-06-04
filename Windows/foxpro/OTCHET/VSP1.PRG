* Для отчета (в получателя переносит данные кормильца)
sele 2
set talk off
set date germ
use cart
inde on str(delo,5)+str(vidpns,1) to cart
do while .not. eof()
if vidpns=4 .AND. CODLEA=0
  Z=RECNO()
  dd=delo
  codbnk_=codbnk
  seek str(dd,5)+"3"
  IF FOUND()
     repl codbnk with codbnk_
  endi
 GO Z
endi
skip
enddo

