sele 1
set talk off
SET DATE GERM
sele 2
use zwan
*use d:\pens20n\1998\wowsan94
*if .not. file("wowsan95.ndx")
*inde on delo to d:\pens20n\1998\wowsan94
endif
*use d:\pens20n\1998\wowsan94 inde d:\pens20n\1998\wowsan94
*sele 2
*use wow98
SELE 1
USE WOWISO
DO WHILE .NOT. EOF()
mogno=0
if vidpns<3 .and. CodLea=0 .and. mstslb=1 .and. substr(ArtDis,3,1)$"・ェ" .and. CodRnk>=13 .and. val(substr(wsllgt,1,2))>=20 .AND. (pnsapp =ctod("  .  .  ").OR. PNSAPP<CTOD("13.01.93"))
 mogno=1
endif
if vidpns<3 .and. CodLea=0 .and. mstslb=1 .and. val(substr(wsllgt,1,2))>=20 .and. pnsapp>=ctod("13.01.93")
 mogno=1
endif
if vidpns<3 .and. CodLea=0 .and. mstslb=2 .and. substr(ArtDis,3,1)$"・ェ" .and. CodRnk>=9 .and. val(substr(wsllgt,1,2))>=20
 mogno=1
endif
REPL PR WITH MOGNO
SKIP
ENDDO
RETU

go top
do while .not. eof()
 d=delo
sele 1
 seek d
if found()       &&1
sele 2
REPL codlea with 0
endif                   &&1
sele 2
skip
endd
retu
