set proce to sanku96
parameters gg1
clea all
SET BELL OFF
SET TALK OFF
SET SCOREBOARD OFF
SET STATUS OFF
SET ESCAPE On
SET EXACT Off
SET CONF ON
SET SAFETY OFF
sET DELE ON
publ xd,sos1,sysd,kkk,gg,kurdb,kurmem,kin1,kin2,kin3,kin4
gg1=1996
gg=substr(str(gg1,4),3,2)
kurdb="kur"+GG
kurmem="kur"+GG
mes10="Ÿ‚€Ÿ  ”…‚€‹Ÿ Œ€’€   €…‹Ÿ  Œ€Ÿ     ˆžŸ    ˆž‹Ÿ    €‚ƒ“‘’€ ‘…’ŸŸ"
Mes20="ŽŠ’ŸŸ ŽŸŸ  „…Š€Ÿ"
MES=MES10+MES20
MO=SUBSTR(MES,8*month(date())-7,8)
GOD=STR(YEAR(date()),5)+" £."
sysd=str(day(date()),2)+" "+mo+god
set date germ
do sankur1
rest from &kurmem addi
rest from minz addi
DO WHILE .T.
SET COLOR TO W+/n,b+/w
DO RAM
SET COLOR TO b+/w
@ 23,1 CLEA TO 23,78
@ 23,10 SAY "  E S C  - ‚ëå®¤ ¨§ íªà ­       E N D - ‚ëå®¤ ¨§ á¨áâ¥¬ë "
SET COLOR TO r+/n
@ 5,15 CLEA TO 14,68
SET COLOR TO W+/bg+
@ 6,13 CLEA TO 15,66
@ 6 ,13 SAY "ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»"
@ 7 ,13 SAY "º                                                    º"
@ 8 ,13 SAY "º                                                    º"
@ 9 ,13 SAY "º                                                    º"
@ 10,13 SAY "º                                                    º"
@ 11,13 SAY "º                                                    º"
@ 12,13 SAY "º                                                    º"
@ 13,13 SAY "º                                                    º"
@ 14,13 SAY "º                                                    º"
@ 15,13 SAY "º                                                    º"
@ 16,13 SAY "ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼"
M8= "  p®á¬®âp ¦ãp­ «  ¢ë¤ ç¨ ª®¬¯¥­á æ¨©               "
M9 ="  ‚¢®¤ ¤ ­­ëå                                       "
M10="  ˆâ®£®¢ë¥ áã¬¬ë                                    "
M11="  ˆ§¬¥­¥­¨¥ p §¬¥p®¢ ª®¬¯¥­á æ¨©                    "
M12="  ¥ç âì ¦ãp­ «                                     "
M13="  ˆâ®£® ¯® ¡ ­ª ¬                                   "
M14="  p¨¡«¨§¨â.ª®«¨ç¥áâ¢® ¨¬¥îé¨å ¯p ¢® ­  ª®¬¯¥­á æ¨î "
M15="  Š®¯¨p®¢ ­¨¥ ¤ ­­ëå                                "
do M1 WITH 8,14,1,14
  if G=27
set proce to
   RETURN
  endif
 m0="M"+ltrim(str(g))
SET COLOR TO gr+/Bg+
  @ g,14 say &M0
   g1=g
SET COLOR TO B/W,W/RB
DO CASE
  CASE G =8
    do menu2
  CASE G=9
   do chab1
   DO vvo
  CASE G =10
   DO spros
  CASE G =11
   DO razkomp
  CASE G =12
sele 4
use &kurdb
set inde &kin3,&kin1,&kin2
  DO pkur
case g=13
   do sprosb
  CASE G =14
  do kursk
  CASE G =15
   sele 4
   use &kurdb
@ 17,13 say " ‚áâ ¢ìâ¥ ¤¨áª¥âªã ¨ ­ ¦¬¨â¥ ENTER !"
wait ""
*@ 17,13 say " †¤¨â¥ ! ˆ¤¥â ª®¯¨p®¢ ­¨¥ !              "
*   copy to file  a:&kurdb
*   copy file  kur96.mem to a:
    ENDCASE
ENDDO
retu
procedure kursk
sele 1
use kart
go top
k=0
@ 18,25 say "ˆ¤¥â ¯®¤áç¥â ..."
do while .not. eof()
mogno="0"
if prichwib=" " .and. mestosl="1" .and. substr(statuv,3,1)$"¡¦¥§" .and. val(kodzwan)>=13 .and. val(substr(wslgt,1,2))>=20
 mogno="1"
endif
if prichwib=" " .and. mestosl="1" .and.  val(substr(wslgt,1,2))>=20 .and. pennazn>=ctod("13.01.93").and. .not. substr(statuv,3,1)$"«¬" &&.and. year(pennazn)#1995
 mogno="1"
endif
if prichwib=" " .and. mestosl="2" .and. substr(statuv,3,1)$"¡¦¥§" .and. val(kodzwan)>=9 .and. val(substr(wslgt,1,2))>=20 &&.and. year(pennazn)#1995
 mogno="1"
endif
if mogno="1"
 k=k+1
 endif
skip
enddo
@ 18,15 say "ˆ¬¥îâ ¯p ¢® ­  ª®¬¯¥­á æ¨î ¯p¨¡«¨§¨â¥«ì­® "+str(k,4)+" ç¥«."
wait ""
retu
