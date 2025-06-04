****************  cher.prg ***********************
do cher1
************
function inval
parameters grpinv
na=iif(grpinv>0 .and. grpinv<=3,str(grpinv,1)+"£‡.óÄùë","        ")
retu na
**************************
procedure cher1
set color to r+/n
@ 24,0
@ 24,0 say "ESC-¢ÎÂÆ§ Enter-™Æpp.·‚pÆ™® F2 -¢¢Æ§ §†≠≠ÎÂ F3-„§†´•≠®• ·‚pÆ™®  F6 - p†·Â.Æp§•p"
sele 1
use &chernv inde &cin
go top
set color to bg+/b
y=0
*********
t=3
set color to bg+/n
@ 2,t say "48/"+str(chern->delo,5)+"   "+chern->fam+inval(chern->grp)
@ 3, t SAY '…ÕÕÕÕÕÕÕÕÀÕÕÕÕÀÕÕÕÕÕÕÕÕÕÀÕÕÕÀÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕª'
@ 4, t SAY '∫ Ñ†‚†   ∫ëpÆ™∫Ç®§ ¢ÎØ´.∫äÆ´∫ë„¨¨†   ∫ó´.·•¨Ï® ∫ÇëÖÉé:   ∫èÆ§ÆÂ. ∫1-™†c·†∫'
@ 5, t SAY '∫        ∫    ∫         ∫Á´.∫ Ø•≠·-p„∫         ∫         ∫≠†´Æ£  ∫2-Ø/Ø  ∫'
@ 6, t SAY 'ÃÕÕÕÕÕÕÕÕŒÕÕÕÕŒÕÕÕÕÕÕÕÕÕŒÕÕÕŒÕÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕπ'
ddd=chern->delo
*********
seek ddd
if .not. found()
da="§†"
@ 8 ,t+1 say  "ÇÎØ´†‚ ¢ Ì‚Æ¨ £Æ§„ ≠• °Î´Æ. Å„§•‚• ß†¢Æ§®‚Ï §†≠≠Î•?(Ñ†/≠•‚)" get da
 read
@ 8, t SAY '∫        ∫    ∫         ∫   ∫        ∫         ∫         ∫       ∫       ∫'
if da$"ÑÄ,Ñ†,§†,§Ä" .and. readkey()#12 .and. readkey()#262
  do cherv
endif
 retu
endif
set filt to delo=ddd
go top
do while y#27 .and. y#13
i=7
do while .not. eof() .and. i<23
set color to bg+/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "9999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXXXX"
i=i+1
skip
enddo
if i<23
@ i, t SAY '∫        ∫    ∫         ∫   ∫        ∫         ∫         ∫       ∫       ∫'
endif
do itog
in=i-1
skip -(in-6)
i=7
dO WHILE .T.                                                                &&3
set color to b+/w
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "9999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXXXX"
y=0
 do while y=0
  y=inkey()
 enddo
 if y#13
set color to bg+/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "9999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXXXX"
 endif
  do case
   case y=27
       KKK=0
     return
   case y=5 .and. i>7 .and. .not. bof()     && ¢¢•‡Â
     i=i-1
     skip -1
   case y=24                 && ¢≠®ß
    if i=in
Ii=7
DO WHILE iI<23
@ ii, t SAY '∫        ∫    ∫         ∫   ∫        ∫         ∫         ∫       ∫       ∫'
Ii=Ii+1
ENDDO
     skip
      if eof()
        skip -(in-6)
      endi
    exit
    else
     i=i+1
     skip
    loop
   endif
   CASE Y=3                    && PgDn ¢≠®ß
    skip (in-i)+1
    i=7
    IF EOF()
    skip -(in-i)-1
    LOOP
    ENDIF
Ii=7
DO WHILE iI<23
@ ii, t SAY '∫        ∫    ∫         ∫   ∫        ∫         ∫         ∫       ∫       ∫'
Ii=Ii+1
ENDDO
    EXIT
   CASE Y=-1   && ÇÇéÑ
   set filt to
   do cherv
   sele 1
   set filt to delo=ddd
  * exit
   CASE Y=-2   &&.and. .not. bof()      && „§†´•≠®•
   dele
   pack
   go top
   if eof()
     retu
   endif
   exit
   CASE Y=18 .and. .not. bof()
    SKIP -19-(I-7)
    if bof()
      go top
    endif
    i=7
    EXIT
   case y=-5     &&  Æp§•p
    save scree to e
   do order
    rest scre from e
   case y=13 .and. .not. eof()         && ¢Î°Æ‡
       kkk=IIF(R=1,chern->delo,lgot->KODv)
       kb=kkk
********************
  @ i,t+1  get datav
  @ i,t+10 get srok  pict "9999"
  @ i,t+15 get naim  pict "XXXXXXXXX"
  @ I,t+26 get kols  PICT "99"
  @ I,t+29 get sum1  PICT "9999999"
  @ I,t+38 get sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "9999999"
  @ I,t+58 get PN    PICT "9999999"
  @ I,t+66 get kas   PICT "XXXXX"
********************
 read
        Y=0
 loop
endcase
enddo
enddo
return
***********************
procedure itog
 sum sum1,sum2,pn to s1,s2,s3 for delo=ddd
  set color to r+/n
  @ I,t+1 say "à‚Æ£Æ:"
  @ I,t+29 say s1  PICT "9999999"
  @ I,t+38 say s2  PICT "9999999"
  @ I,t+48 say s1+s2  PICT "9999999"
  @ I,t+58 say s3  PICT "9999999"
  set color to bg+/n
retu
