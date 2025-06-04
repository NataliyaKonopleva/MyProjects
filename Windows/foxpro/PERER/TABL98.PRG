*         í†°´®Ê†          6.04.94    *
set esca on
set talk off
set date germ
set color to
publ mess,sysd
mes1="üçÇÄêÖ  îÖÇêÄãÖ åÄêíÖ   ÄèêÖãÖ  åÄÖ     àûçÖ    àûãÖ    ÄÇÉìëíÖ ëÖçíüÅêÖ"
Mes2="éäíüÅêÖ çéüÅêÖ  ÑÖäÄÅêÖ"
mess=mes1+mes2
mes10="üçÇÄêü  îÖÇêÄãü åÄêíÄ   ÄèêÖãü  åÄü     àûçü    àûãü    ÄÇÉìëíÄ ëÖçíüÅêü"
Mes20="éäíüÅêü çéüÅêü  ÑÖäÄÅêü"
MES=MES10+MES20
sele 4
use bank
if .not. File("bank0.ntx")
 inde on codbnk to bank0
endif
use bank inde bank0
***************************
sele 1
*use d:\pens20n\1997\cart inde d:\pens20n\1997\cart0
use cart inde cart0

***************************
*sele 2
*use D:\pens1097\1997\cart inde d:\pens1097\1997\cart0
publ sdat
sd=date()
sdat=substr(dtoc(sd),1,6)+str(year(sd),4)+" £."
*********************************************
sele 1
do while .t.                   &&1
clea
set color to r/w,n/w
@ 23,1 clea to 23,78
@ 23,2 say "E S C - ¢ÎÂÆ§"
SET COLOR TO W/N
@ 9,14 CLEA TO 13,70
SET COLOR TO W/GR+,R/W
   @ 10,12 say "…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕ> ê†·Ø•Á†‚Î¢†‚Ï ‚†°´®ÊÎ <ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª"
   @ 11,12 say "∫                                                       ∫"
   @ 12,12 say "∫                                                       ∫"
   @ 13,12 say "∫                                                       ∫"
   @ 14,12 say "»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº"
m12="         ß† ¢Î·´„£„ ® ØÆ ®≠¢†´®§≠Æ·‚®       "
m13="         ØÆ ·´„Á†Ó ØÆ‚•p® ™Æp¨®´ÏÊ†         "
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
@ 16,15 say "ê†·Ø•Á†‚Î¢†‚Ï · ≠Æ¨•p†  " get n1 pict "99999"
@ 16,45 say " ØÆ " get n2 pict "99999"
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
if vidpns<3 .and. codlea=0  .and. begpay>=ctod("01.05.98")
do tabl98v
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