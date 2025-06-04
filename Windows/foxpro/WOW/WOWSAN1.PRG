******************** wowsan1.prg ***********
set talk off
sele A
*use wowsan
use wow98
sele 3
use c:\pens07.96\zwan
if .not. file("c:\pens07.96\zwan.ndx")
 inde on kod to c:\pens07.96\zwan
endif
use c:\pens07.96\zwan inde c:\pens07.96\zwan
sele A
do while .not. eof()
mogno="0"
if codlea=0 .and. mstslb=1 .and. substr(ArtDis,3,1)$"・ェ" .and. CodRnk>=13 .and. val(substr(wsllgt,1,2))>=20
 mogno="1"
endif
if codlea=0 .and. mstslb=1 .and.  val(substr(wsllgt,1,2))>=20 .and. pnsapp>=ctod("13.01.93")
 mogno="1"
endif
if codlea=0 .and. mstslb=2 .and. substr(ArtDis,3,1)$"・ェ" .and. CodRnk>=9 .and. val(substr(wsllgt,1,2))>=20
 mogno="1"
endif
 if mogno="1"
   repl priznak with "1"
 endif
skip
enddo
