* **************  cherv.prg ***********************
set color to r+/n
set cent off
@ 24,0
     sele 9
      go top
      loca for god=gg1
if r=1
 sele 1
use &chernv inde &cin
  set filt to
  sum  sum1,sum2 to a,b for .not. deleted()
  @ 24,37 say "€—… ‘ €—€€ € "+str(a+b,12,2)
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
@ 2,t say "48/"+str(chern->delo,5)+"   "+chern->fam+inval(chern->grp)
@ 3, t SAY 'ษออออออออหออออหอออออออออหอออหออออออออหอออออออออหอออออออออหอออออออหอออออออป'
@ 4, t SAY 'บ  โ    บฅแ.บจค ข๋ฏซ.บฎซบ‘ใฌฌ    บ—ซ.แฅฌ์จ บ‘…:   บฎคฎๅ. บ1-ช cc บ'
@ 5, t SAY 'บ        บ(ฃฎคบ         บ็ซ.บ ฏฅญแ-pใบ         บ         บญ ซฎฃ  บ2-ก ญช บ'
@ 6, t SAY 'ฬออออออออฮออออฮอออออออออฮอออฮออออออออฮอออออออออฮอออออออออฮอออออออฮอออออออน'
I=7
DO WHILE I<23
@ I,t SAY  "บ        บ    บ         บ   บ        บ         บ         บ       บ       บ"
I=I+1
ENDDO
@ 23,t SAY "ศออออออออสออออสอออออออออสอออสออออออออสอออออออออสอออออออออสอออออออสอออออออผ "
endif
*********
if r=1
@ 2, 33 say str(gg1,4)+" ฃฎค"
set color to bg+/b
@ 3, 0 SAY 'ษอออออหออออออออออออออออออออออออออออออหออออออออหออออหออออออออหออออออออป '
@ 4, 0 SAY 'บฅซฎ บ           ” ฌจซจ๏            บญข ซจค บฎซ.บ   โ   บp.ฏpฅก.บ '
@ 5, 0 SAY 'บ     บ           ฏฅญแจฎญฅp          บ ญฎแโ์  บคฅโ.บ  pฎฆค. บข งฎญฅ  บ '
@ 6, 0 SAY 'ฬอออออฮออออออออออออออออออออออออออออออฮออออออออฮออออฮออออออออฮออออออออน '
I=7
DO WHILE I<23
@ I,0 SAY  "บ     บ                              บ        บ    บ        บ        บ "
I=I+1
ENDDO
@ 23,0 SAY "ศอออออสออออออออออออออออออออออออออออออสออออออออสออออสออออออออสออออออออผ "
endif
do while y#27 .and. y#13
i=7
do while .not. eof() .and. i<23
 if r=1                && chern
set color to bg+/b
if deleted()
  set color to w/b
endi
  @ i, 1 say delo PICT "99999"
  @ i, 7 say substr(fam,1,30)
  na=inval(grp)
  @ i,38 say na
  @ i,47 say kols pict "99"
  @ i,52 say datar
  @ i,62 say avar
  else
set color to bg+/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "99999.99"
  @ I,t+38 say sum2  PICT "999999.99"
  @ I,t+48 say sum1+sum2  PICT "999999.99"
* @ I,t+58 say PN  PICT "9999.99"
  @ I,t+66 say kas  PICT "XXX"
 endif
i=i+1
skip
enddo
in=i-1
skip -(in-6)
i=7
dO WHILE .T.                                                                &&3
 if r=1
if deleted()
 set color to b/w
else
set color to b+/w

endi
  @ i, 1 say delo PICT "99999"
  @ i, 7 say substr(fam,1,30)
  na=inval(grp)
  @ i,38 say na
  @ i,47 say kols pict "99"
  @ i,52 say datar
  @ i,62 say avar
 ELSE
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT  "99999.99"
  @ I,t+38 say sum2  PICT  "999999.99"
  @ I,t+48 say sum1+sum2   PICT "999999.99"
 *@ I,t+58 say PN  PICT "9999.99"
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
if y=-2
  dele
  set color to w/b
endi

  @ i, 1 say delo PICT "99999"
  @ i, 7 say substr(fam,1,30)
  na=inval(grp)
  @ i,38 say na
  @ i,47 say kols pict "99"
  @ i,52 say datar
  @ i,62 say avar pict "9999"
 endif

 if r=2 .and. y#13
set color to bg+/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT  "99999.99"
  @ I,t+38 say sum2  PICT  "999999.99"
  @ I,t+48 say sum1+sum2  PICT "999999.99"
* @ I,t+58 say PN  PICT "9999.99"
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
@ Ii,0 SAY  "บ     บ                              บ        บ    บ        บ        บ "
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
@ Ii,0 SAY  "บ     บ                              บ        บ    บ        บ        บ "
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
   case y=13 .and. .not. eof()         && ข๋กฎเ ข๋ฏซ โ๋
     store 0 to su1,su2
       kkk=IIF(R=1,chern->delo,lgot->KODv)
       IF R=2                           &&1
       kb=kkk
          repl datav with date(),kols with chern->kols
 mes=iif(kb<=12,"minz"+ltrim(str(kb)),"minz"+ltrim(str(month(date()))))
 mes_=minza->&mes
 cat_=chern->cat
          do case
          case kb<=12 .and. cat_#"2"   && ญฅ ็ซ.แฅฌ์จ
            su1=iif(chern->grp=0 .and. cat_#"3",358.94,538.43)
            su2=iif(chern->grp=0 .and. cat_#"3",0,538.43*CHERN->do_14)
*           su1=iif(chern->grp=0 .and. cat_#"3",mes_*2,mes_*3)
*           su2=iif(chern->grp=0 .and. cat_#"3",0,mes_*CHERN->do_14*3)
          case kb<=12 .and. cat_="2"
            su1=0
            su2= 136.20 &&  120.53  18.35 116.72 109.08   100.54
*            su2=mes_*chern->do_14*3
          case kb=13
            x=0
            do case
             case chern->grp=1 .or. chern->grp=2
              su1=897.39     &&794.15 779.78 769 718.69  656.43

             case chern->grp=3 .or. cat_="3"
                            su1=717.91    &&635.32   623.82 615.20 574.95     525.14
             case str(chern->avar,4)$"1986,1987"
                 su1=538.43            && 476.49 467.86 461.39 431.21   393.86
             case str(chern->avar,4)$"1988"
              su1=358.94          &&317.65 311.90 287.47 307.59
             case str(chern->avar,4)$"1989,1990" .or. (cat_="2" .and. chern->kols#0)
              su1=179.48  &&158.83 155.96   143.74 153.80
             endcase
          case kb=16
      
           q="17947.6112563.33 8973.82"
            k0=val(substr(q,8*(chern->grp)-8+1,8))
           su1=mes_*k0
          case kb>=17 .and. cat_="2"
           su2=136.20   &&120.53  109.08 118.35
    endcase

           su1=round(su1,2)
           su2=round(su2,2)
           repl sum1 with su1,sum2 with su2
            @ i,t+1  get datav
            @ I,t+66 get kas  PICT "9"
 read
 ka=iif(kas="1","ช แแ ","แ/ก")
repl kas with ka
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
naim with lgot->Naim,sum1 with su1,sum2 with su2,datav with lgot->datav,codbnk with chern->codbnk,;
kas with lgot->kas,pn with lgot->pn,srok with lgot->srok,codbnk_ with chern->codbnk


if codbnk=1 .or. codbnk>=18 .or. codbnk=4 .or. codbnk=11
   repl codbnk_ with 1
endif

          SELE 5
       loop
       ENDIF
 exit
endcase
enddo
enddo
return
