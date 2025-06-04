* Для переноса данных
sele 2
set talk off
set date germ
clea
use dmo1
@ 10,10 say "Ждите !     "
sele 1
use cart
inde on str(delo,5)+str(vidpns,1) to cart1
sele 2
set filt to dmo>0 .and. vidpns#3 .and. codlea=0
go top
do while .not. eof()
  dd=str(delo,5)+str(vidpns,1)
  dmo_=dmo
sele 1
  seek dd
  if found()
  repl dmo with dmo_
  endif
sele 2
  skip
enddo
