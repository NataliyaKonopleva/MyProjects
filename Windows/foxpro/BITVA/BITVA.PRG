** ¥ç âì ¢¥¤®¬®áâ¨ ­  ¨¬¥­¨­­¨ª®¢
set talk off
sele 2
use bitva1
*inde on delo to imen
*use imen inde imen
*inde on delo to imen
clea
l=1
do while .t.
SET DEVI TO SCREEN
@  3,15 SAY "‹¨áâ=>     " get l pict "9"
read
if readkey()=12 .or. readkey()=262
retu
endif
go top
SET DEVI TO PRINT
M=PROW()
if l=1
@ M  ,90 SAY "E“’‚…†„€ž"
@ M+1,90 SAY "F ç «ì­¨ª “‚„ Ÿp®¡«¨á¯®«ª®¬ "
@ M+2,90 SAY "Fƒ¥­¥p «-¬ ©®p ¬¨«¨æ¨¨       "
@ M+3,90 SAY "                  €.€.’®p®¯®¢  "
M=PROW()+1
@ M,40 SAY "E‚ … „ Ž Œ Ž ‘ ’ œ "
@ M+2,24 SAY "E€ ‚›„€—“ …„ˆŽ‚…Œ…ŽƒŽ Ž‘ŽˆŸ …‘ˆŽ…€Œ “‚„ ŸŽ‹ˆ‘Ž‹ŠŽŒ€"
@ M+4,24 SAY "                 ‚ —…‘’œ žˆ‹…Ÿ Š“‘ŠŽ‰ ˆ’‚›         F"
endif
M=PROW()+1
@ m+1, 0 say "ÚÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄ¿"
@ m+2, 0 say "³   ³                                        ³®¬¥p³                                                            ³‘ã¬¬    ³"
@ m+3, 0 say "³ N ³ ” € Œ ˆ ‹ ˆ Ÿ, ˆ Œ Ÿ, Ž ’ — … ‘ ’ ‚ Ž  ³¯¥­á.³          Ž‘‹…„ŸŸ „Ž‹†Ž‘’œ „Ž “‚Ž‹œ…ˆŸ                 ³¯®á®¡¨ï ³"
@ m+4, 0 say "³   ³                                        ³¤¥«  ³                                                            ³        ³"
@ m+5 ,0 say "ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄ´"
*                   1    6                                        47    53                                                          114      123
GO (l-1)*17+1
i=1
q="|"
m=prow()+1
do while .not. eof() .and. i<=20
np=(l-1)*20+i
@ m,0 SAY q+str(Np,3)+q+fam+q+str(delo,5)+q+dolgn+q+str(posob,8,2)+q
i=i+1
skip
if i=20.or. eof()
@ m+1 ,0 say "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
else
@ m+1 ,0 say "ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄ´"
endif

m=m+2
enddo
if eof()
sum posob to w
set devi to scre
pro=space(60)
@ 16,2 say "¯p®¯¨áìî: " get pro
read
set devi to print
i=prow()+1
@ i, 0 say   "|                        ˆ ’ Ž ƒ Ž:           " +trim(pro)
@ i, 113 say str(w,8,2)+q
@ m+1, 0 say "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
@ m+3,55 say " ç «ì­¨ª ”Ž “‚„                                    ‚..‡ áë¯¨­"
@ m+5,55 say " ç «ì­¨ª ¯¥­á¨®­­®£® ®â¤¥«¥­¨ï                      .•.€«¨¥¢  "
@ m+7,55 say "   .12.1993 £®¤                                 "
return
endif
loop
enddo
