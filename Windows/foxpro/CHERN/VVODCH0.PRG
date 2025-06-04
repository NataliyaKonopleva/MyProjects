*******ฎฏฎซญฅญจฅ ช เโฎโฅชจ ็ฅเญฎก๋ซ์ๆฅข
set color to
clea
set color to r+/n
@ 1,14 say "ฎฏฎซญฅญจฅ ช pโฎโฅชจ ็ฅpญฎก๋ซ์ๆฅข"
sele 4       &&  chern
use chern
@ 24,3 say "ESC - ๋ๅฎค  "
y=0
set color to
*********

@ 3, 0 SAY 'ษอออออหออออออออออออออออออออออออออออออหอออออออออออหออออหออออออออหออออออออป '
@ 4, 0 SAY 'บฅซฎ บ           ” ฌจซจ๏            บญข ซจคญ., บฎซ.บ   โ   บp.ฏpฅก.บ '
@ 5, 0 SAY 'บ     บ           ฏฅญแจฎญฅp          บแข๏ง.แ —€‘บคฅโ.บ  pฎฆค. บข งฎญฅ  บ '
@ 6, 0 SAY 'ฬอออออฮออออออออออออออออออออออออออออออฮอออออออออออฮออออฮออออออออฮออออออออน '
@ 7,0 SAY  "บ     บ                              บ           บ    บ        บ        บ "
@ 8, 0 SAY 'ฬอออออฮออออออออออออออออออออออออออออออฮอออออออออออฮออออฮออออออออฮออออออออน '
@ 9,0 SAY  "บ     บ                              บ           บ    บ        บ        บ "
@ 10,0 SAY "ศอออออสออออออออออออออออออออออออออออออสอออออออออออสออออสออออออออสออออออออผ "
save scre to e
do while .t.
rest scre from e
i=7
  Ndelo=0
  @ i, 1 get Ndelo PICT "99999"
  read
  @ 14,3 say space(60)
  if readkey()=12 .or. readkey()=262
    close all
    retu
  endif
***************
na=""
  sele 4
 loca for delo=ndelo
   if found()                   &&1
  @ i, 1 say Ndelo PICT "99999"
  @ i, 7 get fam
   if cat#"2"
      na=inval(grp)
  fio=substr(fam,1,30)
  @ i,38 get grp pict "9"
  @ i,41 say na
  @ i,50 get kols pict "99"
  @ i,55 get datar
  @ i,65 get avar pict "9999"
   else
  @ 16,0 say "ขซ๏ฅโแ๏ ซจ ฎคญจฌ จง เฎคจโฅซฅฉ ใฌฅเ่ฅฃฎ (1-ค ,0-ญฅโ)" get sam pict "9" rang 0,1
  @ 17,0 say "ฎซจ็ฅแโขฎ คฅโฅฉ ใฌฅเ่ฅฃฎ ็ฅเญฎก๋ซ์ๆ    " get kols pict "99"
  @ 18,0 say "ง ญจๅ คฅโฅฉ คฎ 14 ซฅโ                  " get do_14 pict "99"
endi
  read
 if ndelo=0
   dele
   pack
 endif
else                            &&1
*****************
  fio=space(30)
 rod=ctod("  .  .  ")
  store 0 to kod1,kol,av,do14,sa
 na="      "
  sele 4
  i=7
   m13="“็ แโญจช ซจชขจค ๆจจ  ข เจจ ญ  —€‘ "
   m14="‘ฅฌ์๏ ใฌฅเ่ฅฃฎ ็ฅเญฎก๋ซ์ๆ          "
   m15="ฅโฅเ ญ ฏฎคเ งคฅซฅญจ๏ ฎแฎกฎฃฎ เจแช "
  do m1 with 13,15,1,7
   @ 13,1 clea to 15,78
  catch=str(g-12,1)
  @ i, 7 get fio
if G#14
  @ i,38 get kod1 pict "9" rang 1,3
  @ i,50 get kol pict "99"
  @ i,55 get rod
  @ i,65 get av pict "9999" rang 1986,1991
else
sa=0
  @ 16,0 say "ขซ๏ฅโแ๏ ซจ ฎคญจฌ จง เฎคจโฅซฅฉ ใฌฅเ่ฅฃฎ (1-ค ,0-ญฅโ)" get sa pict "9" rang 0,1
  @ 17,0 say "ฎซจ็ฅแโขฎ คฅโฅฉ ใฌฅเ่ฅฃฎ ็ฅเญฎก๋ซ์ๆ  " get kol pict "99"
  @ 18,0 say "ง ญจๅ คฅโฅฉ คฎ 14 ซฅโ                " get do14 pict "99"
endif
  read
  if readkey()=12 .or. readkey()=262
    loop
  endif
  i=i+2
    if kod1#0
      na=inval(kod1)
      @ i,41 say na
    endif
  sele 4
   appe blank
        REPL KOLS WITH KOL,grp WITH kod1,fam with fio,datar with rod,;
avar with av,delo with ndelo,cat with catch,do_14 with do14,sam with sa
******************
endif                                   &&1
i=9
if g#14
  @ i, 1 say Ndelo PICT "99999"
  @ i, 7 say fam
*  @ i,38 say grp pict "9"
  @ i,41 say na
  @ i,50 say kols pict "99"
  @ i,55 say datar
  @ i,65 say avar pict "9999"
@ 7,0 SAY  "บ     บ                              บ           บ    บ        บ        บ "
endif
enddo
return
