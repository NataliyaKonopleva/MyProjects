* ********************   kartv.prg **************  12.01.95
*      ๋ฏซ โ๋ ็ฅpญฎก๋ซ์ๆ ฌ
************************************

set talk off
set proce to kartv
do chern
procedure chern
close all
set date brit
udal=0
vniz=0
SELE 4
USE chernv
t= 3
if .not. file("chernv.ndx")
  inde on delo to chernv
endif
set index to chernv
sele 1
use chern
sele 4
go top
set color to r+/n
clea
y=0
@ 0, 0 SAY 'ษอออออหออออออออออออออออออออออออออออออออออออออออหอออออออออหอออออออออป '
@ 1, 0 SAY 'บ N   บ           ” ฌจซจ๏,จฌ๏, ฎโ็ฅแโขฎ        บญข ซจค- บ  โ     บ '
@ 2, 0 SAY 'บคฅซ  บ                                        บ ญฎแโ์   บ pฎฆคฅญจ๏บ '
@ 3, 0 SAY 'ฬอออออฮออออออออออออออออออออออออออออออออออออออออฮอออออออออฮอออออออออน '
@ 4,0 SAY  "บ     บ                                        บ         บ         บ "
@ 5 ,0 SAY "ศอออออสออออออออออออออออออออออออออออออออออออออออสอออออออออสอออออออออผ "
if eof()
   @ 12,25 say "  ญญ๋ฅ ฎโแใโแโขใ๎โ "
  wait ""
  retu
endif
@ 3, t SAY 'ษออออออออหออออหอออออออออหอออหออออออออหอออออออออหอออออออออหอออออออหออออป'
@ 4, t SAY 'บ  โ    บ‘pฎชบจค ข๋ฏซ.บฎซบ‘ใฌฌ    บ—ซ.แฅฌ์จ บ‘…:   บฎคฎๅ. บ1-ช บ'
@ 5, t SAY 'บ        บ    บ         บ็ซ.บ ฏฅญแ-pใบ         บ         บญ ซฎฃ  บ2-ฏฅบ'
@ 6, t SAY 'ฬออออออออฮออออฮอออออออออฮอออฮออออออออฮอออออออออฮอออออออออฮอออออออฮออออน'
set color to r/w
@ 24,0
@ 24,0 SAY "ESC - ข๋ๅฎค F2 - ใค ซฅญจฅ  +Enter - ข๋กฎเ แโเฎชจ  PgUp,PgDn -ํชเ ญ ขขฅเๅ,ขญจง"
do while y#27
@ 10,0 clea to 23,79
 d=delo
 inv=kodinv+space(7)
@ 4,0 SAY  "บ"+str(delo,5)+"บ"+Fam+"บ"+INV+"บ "+dtoc(datar)+"บ"
set color to bg/n
i=10
sele 4
seek d
do while delo=d .and. .not. eof() .and. i<=21
@ i  ,t SAY  "บ        บ    บ         บ   บ        บ         บ         บ       บ    บ"
@ i+1,t SAY  "บ        บ    บ         บ   บ        บ         บ         บ       บ    บ"
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "9999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXX"
i=i+2
skip
enddo
@ i ,0 SAY "ศออออสอออออออออออออสอออออออออออออสออออออสออออออออออออสอออออออออออสอออออออออออผ"
if eof()
y=0
 do while y=0
  y=inkey()
 enddo
  if y= -1    && 
@ i, t   SAY 'บ        บ    บ         บ   บ        บ         บ         บ       บ    บ'
@ i+1 ,0 SAY "ศออออออออสออออสอออออออออสอออสออออออออสอออออออออสอออออออออผ"
   do nov
   loop
  endif
  else
  sele 1
   skip
   loop
  endif
in=i-2
if vniz=1
 go z
 vniz=0
else
seek d
endif
i=10
dO WHILE .T.                                                                &&3
set color to r/w
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "9999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXX"
y=0
do while y=0
y=inkey()
enddo
set color to bg/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "9999999"
  @ I,t+38 say sum2  PICT "9999999"
  @ I,t+48 say sum1+sum2  PICT "9999999"
  @ I,t+58 say PN  PICT "9999999"
  @ I,t+66 say kas  PICT "XXX"
  do case
   case y=27
if udal=1
pack
endif
     return
   case y=-1                                 && ใคซ.
      udl=1
      dele
      @ 10,0 CLEA TO 23,79
      if i=10
        SKIP
      else
        SKIP 10-I
      endif
      if eof()      &&   .or. kodm#km
        skip -1      &&  km=kodm
        if bof()
          pack
          retu
         else
         d=delo
         seek d
      endif
      endif
      I=10
    EXIT
   case y=5 .and. i>10 .and. .not. bof()     && ขขฅเๅ
     skip -1
      if delo#d
       seek d
       loop
      endif
     i=i-2
   case y=24                 && ขญจง
     skip
      if eof()
        skip -1
        loop
      endi
    if i=in
     z=recno()
     vniz=1
     exit
    endif
     i=i+2
   CASE Y=3 .or. y=18          && PgDn ขญจง   ฏฅเฅๅฎค ช ญฎขฎฌใ
   j=iif(y=3,1,-1)
   do while delo=d .and. .not. eof() .and. .not. bof()
    skip j
   enddo
    if eof()
     skip -1
    endif
    if bof()
     go top
    endif
   d=delo
    seek d
    sele 1
    exit
   case y=13 .and. .not. eof()         && ข๋กฎเ
  @ i,t+1  get datav
  @ i,t+10 get srok pict "9999"
  @ i,t+15 get naim pict "XXXXXXXXX"
  @ I,t+26 get kols  PICT "99"
  @ I,t+29 get sum1  PICT "9999999"
  @ I,t+38 get sum2  PICT "9999999"
  @ I,t+48 get sum1+sum2  PICT "9999999"
  @ I,t+58 get PN  PICT "9999999"
  @ I,t+66 get kas  PICT "XXX"
read
ee=summap+summas
@ i,65 get ee pict "99999999.99"
            READ
endcase
enddo
enddo
return
procedure nov
appe blank
repl delo with d
@ i, 2 get kodv
read
do case
 case kodv=1
  na="ชฎฌฏ.ง  ฏจโ"
 case kodv=2
  na="ฌ โ.ฏฎฌฎ้์ "
 case kodv=3
  na="ฏpฎฅงค     "
endcase
repl naim with na
@ i, 6 get naim
@ i,22 get per pict "9999"
@ i,36 get kols pict "9"
@ i,41 get summap pict "99999999.99"
@ i,54 get summas pict "99999999.99"
read
ee=summap+summas
@ i,65 get ee pict "99999999.99"
*@ i,65 get summap+summas pict "99999999.99"
            READ
retu
