*         ’ กซจๆ           6.04.94    *
set esca on
set talk off
set date germ
set color to
publ mess,sysd
mes1="€…  ”…€… €’…   €……  €…     …    …    €“‘’… ‘…’…"
Mes2="’… …  …€…"
mess=mes1+mes2
mes10="€  ”…€ €’€   €…  €             €“‘’€ ‘…’"
Mes20="’   …€"
MES=MES10+MES20
sele 4
use bank
if .not. File("bank.ntx")
 inde on kod to bank
endif
use bank inde bank
sele 2
use poluch
if .not. File("poluch.ntx")
  inde on str(delo,5)+str(npp,1) to poluch
endif
use poluch inde poluch
sele 3
use izdiw
if .not. File("izdiw.ntx")
  inde on delo to izdiw
endif
use izdiw inde izdiw
sele 1
use kart
if .not. File("kart1.ntx")
 inde on delo to kart1
endif
use kart inde kart1
publ sdat
sd=date()
sdat=substr(dtoc(sd),1,6)+str(year(sd),4)+" ฃ."
*********************************************
do while .t.                   &&1
clea
set color to r/w,n/w
@ 23,1 clea to 23,78
@ 23,2 say "E S C - ข๋ๅฎค"
SET COLOR TO W/N
@ 9,14 CLEA TO 13,70
SET COLOR TO W/GR+,R/W
   @ 10,12 say "ษออออออออออออออ>  แฏฅ็ โ๋ข โ์ โ กซจๆ๋ <ออออออออออออออออป"
   @ 11,12 say "บ                                                       บ"
   @ 12,12 say "บ                                                       บ"
   @ 13,12 say "บ                                                       บ"
   @ 14,12 say "ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออผ"
m12="         ง  ข๋แซใฃใ จ ฏฎ จญข ซจคญฎแโจ       "
m13="         ฏฎ แซใ็ ๎ ฏฎโฅpจ ชฎpฌจซ์ๆ          "
do m1 with 12,13,1,18
do case
   case g=27
    set color to
    clea
    return
   case g=12
set color to bg/n
store 0 to n1,n2
do while .t.                            &&2
@ 16,15 say " แฏฅ็ โ๋ข โ์ แ ญฎฌฅp   " get n1 pict "99999"
@ 16,45 say " ฏฎ " get n2 pict "99999"
read
if readkey()=12 .or. readkey()=262
  retu
endif
sele 1
seek n1
if .not. found()
loop
endif
skip
do while .not. eof() .and. delo<=n2             &&3
*************************************
if kodpens#"3" .and. prichwib=" " .and. itpens=round(penrub,0)
do tablv
q=0
do while q=0
q=inkey()
enddo
if q=27
retu
endif
endif
skip
*************************************
enddo                                           &&3
set devi to scre
enddo                                           &&2
  case  g=13
   do tabls
endcase
*********************************************
enddo                                           &&1
