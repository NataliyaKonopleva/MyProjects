** ¥ç âì á¯¨áª  ¤«ï ¢®¥­ª®¬ â  (ãç áâ­¨ª¨ ‚Ž‚)
set talk off
set date germ
sele 3
use zwan inde zwan
sele 2
use wow
set filt to raion="2"
go top
*inde on delo to imen
*use imen inde imen
*nde on delo to imen
clea
store 1 to l1,l
do while .t.
SET DEVI TO SCREEN
@  3,15 SAY "‹¨áâ=>     " get l pict "99"
read
if readkey()=12 .or. readkey()=262
retu
endif
SET DEVI TO PRINT
M=PROW()
if l=1
*@ M  ,90 SAY "E“’‚…†„€ž"
*@ M+1,90 SAY "F ç «ì­¨ª “‚„ Ÿp®¡«¨á¯®«ª®¬ "
*@ M+2,90 SAY "Fƒ¥­¥p «-¬ ©®p ¬¨«¨æ¨¨       "
*@ M+3,90 SAY "                  €.€.’®p®¯®¢  "
*M=PROW()+1
@ M,60 SAY "‹¥­¨­áª¨© p ©®­"
@ M+1,25 SAY "E    ‘  ˆ ‘ Ž Š       "
@ M+3,14 SAY "E…‘ˆŽ…Ž‚ “‚„ ŸŽ‘‹€‚‘ŠŽ‰ Ž‹€‘’ˆ - “—€‘’ˆŠŽ‚ ‚…‹ˆŠŽ‰ Ž’…—…‘’‚…Ž‰ ‚Ž‰›F"
endif
M=PROW()+1
@ m,0 say ""
@ m+1, 0 say "ÚÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂ"
@ m+2, 0 say "³   ³                               ³®¬¥p³  ƒpã¯¯  ³  „ â     ³              ³                                                                        ³                                                              ³"
@ m+3, 0 say "³ N ³     ”€Œˆ‹ˆŸ, ˆŒŸ, Ž’—…‘’‚Ž    ³¯¥­á.³         ³ p®¦¤¥­¨ï ³   ‡¢ ­¨¥     ³                       € ¤ p ¥ á                                        ³   “¤®áâ®¢¥p¥­¨¨¥ “Ž‚, ˆŽ‚ , ª¥¬ ¢ë¤ ­®                       ³"
@ m+4, 0 say "³   ³                               ³¤¥«  ³  ¨­¢ «. ³          ³              ³                                                                        ³                                                              ³"
@ m+5 ,0 say "ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅ"
*             0    5                               37    43      51         62                                99        109      118         130          43
if l#l1
go top
skip (l-1)*25
endif
*GO (l-1)*25+1
i=1
q="³"
m=prow()+1
do while .not. eof() .and. i<=25
np=(l-1)*25+i
r=kodinv
inv="        "
do case
   case r$"01 02 03"
     inv=substr(r,2,1)+" £p.ˆŽ‚"
   case r$"04 05 06"
     inv=str(val(kodinv)-3,1)+" £p.ˆ‘Ž"
   case r$"07 08 09"
     inv=str(val(kodinv)-6,1)+" £p.‘ "
   case r$"10 11 12"
     inv=str(val(kodinv)-9,1)+" £p.Ž‡ "
endcase
z=kodzwan
sele 3
seek z
zw=name
sele 2
@ m,0  SAY q+str(Np,3)+q+substr(fam,1,31)+" " +STr(delo,5)+"  "+inv+"  "+dtoc(datar)+"  "+zw
*@ m,0 say "³   ³                               ³     ³         ³          ³              ³"+adres1+adres2+"  ³ "+dolgn+" ³"
@ m,0 say "³   ³                               ³     ³         ³          ³              ³"+adres1+adres2+"  ³ "+udost+" ³"
* m,70 SAY q+str(edposr,10,2)
i=i+1
skip
if i=26.or. eof()
@ m+1 ,0 say "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
 if eof()
 @ m+4,30 say " ç «ì­¨ª ¯¥­á¨®­­®£® ®â¤¥«¥­¨ï                      .•.€«¨¥¢  "
 @ m+6,30 say " ç «ì­¨ª ”Ž “‚„                                    ‚..‡ áë¯¨­"
endif
else
@ m+1 ,0 say "ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³"
endif
m=m+2
enddo
*if eof()
*sum posob to w
*set devi to scre
*pro=space(60)
*@ 16,2 say "¯p®¯¨áìî: " get pro
*read
*set devi to print
*i=prow()+1
*@ i, 0 say   "|                        ˆ ’ Ž ƒ Ž:           " +trim(pro)
*@ i, 113 say str(w,8,2)+q
*@ m+1, 0 say "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
*@ m+3,55 say " ç «ì­¨ª ”Ž “‚„                                    ‚..‡ áë¯¨­"
*@ m+5,55 say " ç «ì­¨ª ¯¥­á¨®­­®£® ®â¤¥«¥­¨ï                      .•.€«¨¥¢  "
*@ m+7,55 say "   .07.1993 £®¤                                 "
*return
*endif
l=l+1
l1=l
loop
enddo
