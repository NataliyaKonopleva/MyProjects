* Для отчета (в получателя переносит данные кормильца)
sele 2
set talk off
set date germ
use cart
*inde on str(delo,5)+str(vidpns,1) to cart
use cart inde cart
set filt to vidpns>=3
go top
do while .not. eof()
if vidpns=3
  dd=delo
  mstslb_=mstslb
  coduin_=coduin
  do while delo=dd
  if delo=dd .and. vidpns=4
     repl coduin with CODuin_,mstslb  with mstslb_
  endi
  skip
  enddo
endi
enddo

