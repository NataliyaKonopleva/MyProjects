sele 1
set talk off
use f:\1998\nepens\cart inde f:\1998\nepens\cart1
sele 2
use chern
go top
do while .not. eof()
d=delo
 sele 1
 seek d
if found()       &&1
 sele 2
* repl adres1 with A->adres1,CODBNK WITH a->CODBNK,;
*adres2 with A->adres2,dolgn with A->nampst,pennazn with A->pnsapp
REPL PNSLST WITH A->PNSLST
endif                   &&2
*******
skip
enddo
retu


sele 1
use c:\pens01.96\zwan inde c:\pens01.96\zwan
sele 2
go top
do while .not. eof()
d=kodzwan
 sele 1
 seek d
if found()       &&1
 sele 2
 repl namzwan with A->name
endif                   &&2
*******
skip
enddo
