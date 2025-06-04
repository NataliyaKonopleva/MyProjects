****************  cherv.prg ***********************
*restore from &minza addi
set color to r+/n
@ 24,0
     sele 9
      loca for god=gg1
if r=1
 sele 1
use &chernv inde &cin
  set filt to
  sum  sum1,sum2 to a,b for .not. deleted()
  @ 24,37 say "€—… ‘ €—€€ € "+str(a+b,10,0)
sele 4       &&  chern
@ 24,3 say "ESC - ๋ๅฎค   'Enter' - ข๋กฎเ"
else
sele 5      &&   lgot
@ 24,0 say "ESC - ฎงขเ โ ข ฌฅญ๎ ข๋กฎเ  ฏฅญแจฎญฅp   'Enter' - ข๋กฎเ  ข๋ฏซ โ๋"
endif
go top
set color to bg+/b
y=0
*********
if r=2
set color to bg+/n
@ 2,0 clea to 23,79
@ 2,t say "48/"+str(chern->delo,5)+"   "+chern->fam
@ 3, t SAY 'ษออออออออหออออหอออออออออหอออหออออออออหอออออออออหอออออออออหอออออออหอออออออป'
@ 4, t SAY 'บ  โ    บฅแ.บจค ข๋ฏซ.บฎซบ‘ใฌฌ    บ—ซ.แฅฌ์จ บ‘…:   บฎคฎๅ. บ1-ช cc บ'
@ 5, t SAY 'บ        บ(ฃฎคบ         บ็ซ.บ ฏฅญแ-pใบ         บ         บญ ซฎฃ  บ2-ฏ/ฏ  บ'
@ 6, t SAY 'ฬออออออออฮออออฮอออออออออฮอออฮออออออออฮอออออออออฮอออออออออฮอออออออฮอออออออน'
endif
*********
if r=1
@ 2, 33 say str(gg1,4)+" ฃฎค"
@ 4,71 say "๋ฏซ ็."
set color to bg+/b
@ 3, 0 SAY 'ษอออออหออออออออออออออออออออออออออออออหอออออออหออออหออออออออหออออออออป '
@ 4, 0 SAY 'บฅซฎ บ           ” ฌจซจ๏            บญข ซจคบฎซ.บ   โ   บp.ฏpฅก.บ '
@ 5, 0 SAY 'บ     บ           ฏฅญแจฎญฅp          บ ญฎแโ์ บคฅโ.บ  pฎฆค. บข งฎญฅ  บ '
@ 6, 0 SAY 'ฬอออออฮออออออออออออออออออออออออออออออฮอออออออฮออออฮออออออออฮออออออออน '
I=7
DO WHILE I<23
@ I,0 SAY  "บ     บ                              บ       บ    บ        บ        บ "
I=I+1
ENDDO
@ 23,0 SAY "ศอออออสออออออออออออออออออออออออออออออสอออออออสออออสออออออออสออออออออผ "
endif
do while y#27 .and. y#13
i=7
do while .not. eof() .and. i<23
 if r=1                && chern
set color to bg+/b
  @ i, 1 say delo PICT "99999"
  @ i, 7 say substr(fam,1,30)
   if grp#0
  na=str(grp,1)+"ฃเ.—€‘"
  @ i,38 say na
  endif
  @ i,47 say kols pict "99"
  @ i,51 say datar
  @ i,62 say avar
  sele 1
  sum  sum1,sum2 to a,b for .not. deleted() .and. delo=chern->delo
set color to bg+/n
  @ i,71 say str(a+b,8,0)
  sele 4
  else
set color to bg+/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "99999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXX"
 endif
i=i+1
skip
enddo
in=i-1
skip -(in-6)
i=7
dO WHILE .T.                                                                &&3
set color to b+/w
 if r=1
  @ i, 1 say delo PICT "99999"
  @ i, 7 say substr(fam,1,30)
  if grp#0
  na=str(grp,1)+"ฃเ.—€‘"
  @ i,38 say na
  sele 4
  endif
  @ i,47 say kols pict "99"
  @ i,51 say datar
  @ i,62 say avar
 ELSE
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "99999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXXX"
 endif
y=0
 do while y=0
  y=inkey()
 enddo
 if r=1
set color to bg+/B
  if y=13
set color to r/w
  endif
  @ i, 1 say delo PICT "99999"
  @ i, 7 say substr(fam,1,30)
  if grp#0
  na=str(grp,1)+"ฃเ.—€‘"
  @ i,38 say na
  endif
  @ i,47 say kols pict "99"
  @ i,51 say datar
  @ i,62 say avar pict "9999"
 endif
 if r=2 .and. y#13
set color to bg+/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "99999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXXX"
 endif
  do case
   case y=27
       KKK=0
     return
   case y=5 .and. i>7 .and. .not. bof()     && ขขฅเๅ
     i=i-1
     skip -1
   case y=24                 && ขญจง
    if i=in
Ii=7
DO WHILE iI<23
IF R=1
@ Ii,0 SAY  "บ     บ                              บ       บ    บ        บ        บ "
else
@ ii, t SAY 'บ        บ    บ         บ   บ        บ         บ         บ       บ       บ'
 endif
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
   CASE Y=3                    && PgDn ขญจง
    skip (in-i)+1
    i=7
    IF EOF()
    skip -(in-i)-1
    LOOP
    ENDIF
Ii=7
DO WHILE iI<23
IF R=1
@ Ii,0 SAY  "บ     บ                              บ       บ    บ        บ        บ "
else
@ ii, t SAY 'บ        บ    บ         บ   บ        บ         บ         บ       บ       บ'
endif
Ii=Ii+1
ENDDO
    EXIT
   CASE Y=18 .and. .not. bof()
    SKIP -19-(I-7)
    if bof()
      go top
    endif
    i=7
    EXIT
   case y=13 .and. .not. eof()         && ข๋กฎเ
     store 0 to su1,su2
       kkk=IIF(R=1,chern->delo,lgot->KODv)

       IF R=2                           &&1
       kb=kkk
          repl datav with date(),kols with chern->kols
      ****************
          mes="minz"+ltrim(str(kb))
          mes_=minza->&mes
          if kb<=12
          su1=iif(chern->grp=0,mes_*2,mes_*3)
          su2=iif(chern->grp=0,0,mes_*kols*3)
          endif
           if kb=13
          mes="minz"+ltrim(str(month(date())))
           x=0
            do case
            case chern->grp=1 .or. grp=2
            x=5
            case chern->grp=3
            x=4
            case str(chern->avar,4)$"1986,1987"
            x=3
            case str(chern->avar,4)$"1988"
            x=2
            case str(chern->avar,4)$"1989,1990"
            x=1
            endcase
          su1=(minza->&mes)*x
          su2=0
          endif
    repl sum1 with su1,sum2 with su2
            @ i,t+1  get datav
  @ I,t+66 get kas  PICT "9"
 read
 ka=iif(kas="1","ช แแ ","ฏ/ฏ")
repl kas with ka
mes="minz"+ltrim(str(month(lgot->datav)))
pn0=0
*if kb=13
* pn0=round((sum1+sum2-&mes*5)*0.12,0)
*endif
*pn0=iif(pn0<0,0,pn0)
*repl pn with pn0
        Y=0
***************
          SELE 1
           go top
          seek chern->delo
priz=0
             do while .not. eof() .and. delo=ddd
                if srok=lgot->srok .and. kodv=lgot->kodv
                  priz=1
                 exit
                 endif
                skip
             enddo
       if priz=0
          APPE BLANK
       endif
           REPL KOLS WITH LGOT->KOLS,KODV WITH LGOT->KODV,DELO WITH CHERN->DELO,;
naim with lgot->Naim,sum1 with su1,sum2 with su2,datav with lgot->datav,;
kas with lgot->kas,pn with lgot->pn,srok with lgot->srok

          SELE 5
 loop
       ENDIF
 exit
endcase
enddo
enddo
return
