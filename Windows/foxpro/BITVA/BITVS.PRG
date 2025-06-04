sele 1
set talk off
use kart inde kart1
sele 2
use bitva
go top
do while .not. eof()
 p=" "
 d=delo
 sele 1
 seek d
if found()       &&1
 p=prichwib
 d1=delowib
 sele 2
 repl prichwib with p,delowib with d1,kodbank with kart->kodbank,penlist with kart->penlist,;
adres1 with kart->adres1,adres2 with kart->adres2
 else
 sele 2
 repl prichwib with "*"
endif                   &&1
sele 2
skip
enddo
