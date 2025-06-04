&&*         ‘ฏจแชจ ข ก ญช 27.04.94    *
set esca on
set talk off
set date germ
set color to
publ cifra,sos1
clea
sele 5
use bank
sele 1
use cart
if .not. File("cartbnk.ntx")
 inde on str(codbnk,2)+str(vidpns,1)+str(delo,5) to cartbnk
endif
use cart inde cartbnk
publ sdat,kb1,kk
sd=date()
sdat=substr(dtoc(sd),1,6)+str(year(sd),4)+" ฃ."
*********************************************
do while .t.                   &&1
sele 1
set filt to
go top
set color to
clea
set color to r/w,n/w
@ 23,1 clea to 23,78
@ 23,2 say "E S C - ข๋ๅฎค"
SET COLOR TO W/N
@ 9,14 CLEA TO 13,65
SET COLOR TO W/R ,R/W
   @ 10,12 say "ษออออออออออออออ>  แฏฅ็ โ๋ข โ์ แฏจแชจ <อออออออออออออออออป"
   @ 11,12 say "บ                                                       บ"
   @ 12,12 say "บ                                                       บ"
   @ 13,12 say "บ                                                       บ"
   @ 14,12 say "ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออผ"
m11="         ง  ข๋แซใฃใ ซฅโ                     "
m12="         ฏฎ จญข ซจคญฎแโจ                    "
m13="         ฏฎ แซใ็ ๎ ฏฎโฅpจ ชฎpฌจซ์ๆ          "
do m1 with 11,13,1,18
save scre to ek
@ 11,13 clea to 13,65
   if g=27
    set color to
    clea
    return
   endif
  kk=iif(g<=12,g-10,g-9)
m="m"+str(g,2)
vid=ltrim(&m)
set color to
do bank3
rest scre from ek
*********************************************
enddo                                           &&1
