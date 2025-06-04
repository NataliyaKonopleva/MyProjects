******************** kursk.prg ***********
clea
set talk off
sele 1
use cart
go top
k=0
@ 10,20 say "Имеют пpаво на скидку по оплате телефона "
do while .not. eof()
mogno="0"
if coDlea=0  .and. vidpns<=2 .and. substr(ARTDIS,3,1)$"бжезв" .and. val(substr(wslkal,1,2))>=20 .and. .not. (catinv=1 .or. catinv=2) .and. ("т."$adres1+adres2 .or. homphn#space(8))

 mogno="1"
 k=k+1
@ 10,55 say k pict "9999"
endif
skip
enddo
retu
