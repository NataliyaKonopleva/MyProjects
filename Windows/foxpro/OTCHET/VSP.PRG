* Для отчета (в получателя переносит данные кормильца)
sele 2
set talk off
set date germ
use cart
inde on str(delo,5)+str(vidpns,1) to cart
do while .not. eof()
if vidpns=3
  dd=delo
  codrnk_=codrnk
  mstslb_=mstslb
  codbnk_=codbnk
  STAT45_=STAT45
  skip
  do while  delo=dd .and. vidpns=4
     repl CODrnk with CODrnk_,mstslb  with mstslb_,STTVET WITH STAT45_
    skip
  endd
skip -1
endi
skip
enddo

