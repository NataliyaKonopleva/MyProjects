* ��� ����
sele 2
set talk off
set date germ
clea
@ 10,10 say "���� !     "
use cart
inde on str(delo,5)+str(vidpns,1) to cart1
*set filt to vidpns>3 .and. codlea=0
go top
do while .not. eof()
if vidpns=3
  dd=delo
  z=recno()
  seek str(dd,5)+"4"
  if .not. found()
  go z
  repl codlea with 8
  endif

endif
  skip
enddo
clea
count to a for codlea=0 .and. vidpns=3
@ 10,10 say "� ����⥪� "+ str(a,5) +"���"
wait " "
retu
