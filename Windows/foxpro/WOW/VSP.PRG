sele 1
set talk off
use f:\1998\nepens\wowsan95                && “Ž‚
inde on delo to f:\1998\nepens\wowsan95
sele 2
use f:\1998\nepens\wowsan96                && ˆŽ‚
inde on delo to f:\1998\nepens\wowsan96
sele 3
use wowiso
go top
do while .not. eof()
 g=0
 d=delo
 sele 1
 seek d
if found()       &&1
 g=1995
endif
sele 2
seek d
if found()
 g=1996
endif
sele 3
 repl god with g
skip
enddo
