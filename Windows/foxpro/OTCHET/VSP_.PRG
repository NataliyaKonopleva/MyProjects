* Для отчета
sele 2
set talk off
set date germ
clea
@ 10,10 say "Ждите !     "
use cart
inde on str(delo,5)+str(vidpns,1)+str(codlea,1) to cart1
*set filt to vidpns>3 .and. codlea=0
go top
do while .not. eof()
if vidpns=3
  dd=delo
  z=recno()
  seek str(dd,5)+"4"+"0"
  if .not. found()
  go z
  repl codlea with 8
  endif
endif
  skip
enddo

count to a for codlea=0 .and. vidpns=3
@ 10,10 say "В картотеке "+ str(a,5) +"дел по потере кормильца"
wait " "
retu
