******************** sanku95.prg ***********
procedure sankur1
*   IN- ‘. ‘’€
*   IP- …—…€ ‘’€
*   aaa=0 - ไ ฉซ ฏใแโ
xd="111222333444"
ud=0
vv=0
sele 4
use kur95
if .not. file("kur195.ntx")
 inde on delo to kur195
endif
if .not. file("kur295.ntx")
 inde on fam to kur295
endif
if .not. file("kur395.ntx")
 inde on datapom to kur395
clos index
endif
if .not. file("kur495.ntx")
 inde on kodbank to kur495
endif
use kur95 inde kur195,kur295,kur395,kur495
sele A
use kart inde kart1
sele 8
use bank inde bank
sele 3
use zwan
if .not. file("zwan.ntx")
 inde on kod to zwan
endif
use zwan inde zwan
sele 4
set color to
clea
retu
*************************************
procedure vvo
    set color to
    clea
do chab1
     sele 4
      set inde kur195,kur295,kur395,kur495
mimi=0
do while .T.
d=0
s1=0
x=" "
i=10
@ i   ,2 get d pict "99999"
read
@ 3,0 clea to 4,78
@ 19,0
if readkey()=12 .or. readkey()=262
@ i   ,2 say "     "
 retu
endif
set color to r+/n
sele 4
  seek d
  if found()
set color to r+*/n
    @ 4,3 say "ญจฌ ญจฅ !"
set color to r+/n
    @ 4,14 say "ฎฌฏฅญแ ๆจ๏ ใฆฅ ข๋ค ข ซ แ์ !"
    do kor1
   loop
  endif
sele 1
seek d
 if .not. found()
    @ 4,3 say "“ ญ แ,ช แฎฆ ซฅญจ๎, ญฅโ โ ชฎฃฎ ฏฅญแจฎญฅp  ฎขโฎpจฌ ขขฎค ..."
    loop
 endif
if kodpens="3"
    @ 4,3 say "ฅญแจ๏ ญ งญ ็ฅญ  ฏฎ ฏฎโฅpฅ ชฎpฌจซ์ๆ  ฎขโฎpจฌ ขขฎค ..."
    loop
 endif
mogno="0"
if prichwib=" " .and. mestosl="1" .and. substr(statuv,3,1)$"กฆฅง" .and. val(kodzwan)>=13 .and. val(substr(wslgt,1,2))>=20
 mogno="1"
endif
if prichwib=" " .and. mestosl="1" .and.  val(substr(wslgt,1,2))>=20 .and. pennazn>=ctod("13.01.93") .and. .not. substr(statuv,3,1)$"ซฌ"
 mogno="1"
endif
if prichwib=" " .and. mestosl="2" .and. substr(statuv,3,1)$"กฆฅง" .and. val(kodzwan)>=9 .and. val(substr(wslgt,1,2))>=20
 mogno="1"
endif
f=fam
f1=iif(mestosl="1"," "," ‘€")
     sele 3
     seek kart->kodzwan
    zwanie=name
    sele 1
set color to w+/n
    st=iif(dtoc(pennazn)#"  .  .  "," c "+dtoc(pennazn),"")
    @ 3,3 say rtrim(fam)+space(6)+dtoc(datar)+" ฃ.p.  "+zwanie+f1
    @ 4,3 say "๋แซใฃ  ซ์ฃฎโญ ๏ - "+substr(wslgt,1,2)+" ซฅโ,  ใขฎซฅญ ฏฎ แโ."+statuv +st
 if mogno="0"
    set color to r+*/n
    @ 19,3 say "pฎขฅp์โฅ !"
    set color to r+/n
    @ 19,14 say " ฏฎ-ฌฎฅฌใ,  ชฎฌฏฅญแ ๆจ๏ ญฅ ฏฎซฎฆฅญ  !(ESC - ฎโช ง )"
    if prichwib="1"
    @ 19,14 say " ฏฅญแจฎญฅp ใฌฅp "+dtoc(delowib)+" ฃ.    ฆฌจโฅ ESC !"+space(15)
endif
set color to bg/n
    y=0
    do while y=0
     y=inkey()
    enddo
   if y=27 .or. mogno="0"
@ 3,0 clea to 4,78
@ 19,0
     loop
   endif
 endif
**********
inv="        "
r= kodinv
do case
    case uchwoin="1"
         inv="     "
    case uchwoin="3"
         inv="  €   "
    case uchwoin="6"
         inv="ซฎช ค  "
    case uchwoin="4"
         inv="—ฅpญฎก. "
endcase
do case
   case r$"01 02 03"
     inv=substr(kodinv,2,1)+" ฃp."
   case r$"04 05 06"
     inv=str(val(kodinv)-3,1)+" ฃp.‘"
   case r$"07 08 09"
     inv=str(val(kodinv)-6,1)+" ฃp.‘"
   case r$"10 11 12"
     inv=str(val(kodinv)-9,1)+" ฃp."
endcase
inv=inv+space(8-len(inv))
**********
store " " to x,xy,zz
kp=0
ra=" "
dat=date()
dat1=ctod("  .  .  ")
i=10
@  i,10    get dat
@  i,22   get kp pict "9"
read
m10="ญฅ p กฎโ"
m11="p กฎโ ฅโ"
do M1 WITH 10,11,1,29
RA=IIF(g=11,"1","0")
z=iif(ra$"0 ",1,0)
@ 10,29 clea to 11,36
m="m"+str(g,2)
@ i   ,2 say d pict "99999"
@ 10,29 say &m
@  i+1,48 say inv
*@  i,68   get zz  pict "9"         && ช แแ 
*@  i+1,68   get zz  pict "9"         && ช แแ 
if uchwoin="3"
z=3
endif
if kodinv$"01,02,03,04,05,06,07,08,10,11" .or. uchwoin$"1,4,6"
z=5
endif
z=iif(ra$"0 ",z,0)
rk="kv"+substr(xd,month(dat),1)+mestosl
pn=0
s11=&rk
s12=iif(mestosl="1",kp*&rk/4,kp*&rk/2)
s1=s11+s12
if s1>minz*z
pn=(s1-minz*z)*0.12
endif
pn=0            && ฅแซจ ใกp โ์ ํโใ แโpฎชใ, โฎ ฏ/ญ กใคฅโ กp โ์แ๏!!!!
s2=s1-pn
********
sele 8
seek kur95->kodbank
rovd0=iif(found(),substr(name1,1,4),"")
********
@  i,38   get s1 pict "999999.99"
@  i+1,38   get s11 pict "999999.99"
@  i+2,38   get s12 pict "999999.99"
@  i,48   get pn pict "999999.99"
@  i+2,48 say ltrim(str(z))+" min"
*@  i,58   get s2 pict "999999.99"
@  i,68   get zz  pict "9"         && ช แแ 
*@   i+1,68   get dat1
read
do case
case zz="1"
 xy="ช แแ "
case zz="2"
 xy="ฏ/ฏ  "
case zz="3"
 xy="ก ญช "
case zz="4"
 xy="p ฉฎโ"
endcase

@  i,68   say xy
@ i+1,68   say dat1
if readkey()=12 .or. readkey()=262
  retu
endif
set color to bg/n
@ 10,0 SAY 'บ        บ        บ         บ        บ         บ         บ         บ        บ'
@ 11,0 SAY 'บ        บ        บ         บ        บ         บ         บ         บ        บ'
@ 12,0 SAY 'บ        บ        บ         บ        บ         บ         บ         บ        บ'
@ 13,0 SAY 'ฬออออออออฮออออออออฮอออออออออฮออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออน'
@ 14,0 SAY 'บ        บ        บ         บ        บ         บ         บ         บ        บ'
@ 15,0 SAY 'วฤฤฤฤฤฤฤฤะฤฤฤฤฤฤฤฤะฤฤฤฤฤฤฤฤฤะฤฤฤฤฤฤฤฤะฤฤฤฤฤฤฤฤฤถ         บ         บ        บ'
@ 16,0 SAY 'บ                                              บ         บ         บ        บ'
@ 17,0 SAY "ศออออออออออออออออออออออออออออออออออออออออออออออสอออออออออสอออออออออสออออออออผ"
set color to r+/n
@  i+6,2 say trim(f)
set color to bg/n
@  i+4,2 say d pict "99999"
@  i+4,10   say dat
@  i+4,22   say kp pict "9"
@  i+4,29 say &m
@  i+4,38   say s1 pict "999999.99"
@  i+4,48   say pn pict "999999.99"
@  i+6,48 say ltrim(str(z))+" min"
@  i+4,58   say s2 pict "999999.99"
@  i+4,68   say xy
*@  i+5,68   say dat1
sele 4
appe blank
repl delo with d,summa with s1,summav with s2,datapom with dat,kassa with xy ;
lg with inv,rab with ra,podox with pn, fam with f,kol with kp,statuv with ;
A->statuv,mestosl with A->mestosl,kodzwan with A->kodzwan,uchwoin with ;
A->uchwoin,summa1 with s11,summa2 with s12,adres1 with A->adres1,adres2 with A->adres2,;
kodbank with A->kodbank,penlist with A->penlist
********
sele 8
seek kur95->kodbank
rovd0=iif(found(),substr(name1,1,3)+".","")
sele 4
repl rovd with rovd0
********
  m19=" ฅ็ โ์ p แฏฎp๏ฆฅญจ๏ ข แกฅpก ญช "
  m20=" ฅ็ โ์ จงขฅ้ฅญจ๏ ฏฅญแจฎญฅpใ    "
  m21="  ฏฅญแจฎญญฎฅ คฅซฎ              "
  m22=" ฅ็ โ์ p แฏฎp๏ฆฅญจ๏ ข p ฉฎโคฅซ "
 Do while G#27
 do m1 with 19,22,1,27
  @ 19,0 clea to 22,78
 do case
   case g=19
   do pebank
   case g=20
   do pe2
   case g=21
   do pe
   case g=22
   do pe1
 endcase
 enddo
enddo
retu
***   spros.prg       26.04.94     ************************
************************************************************
procedure spros
z=recno()
e=""
save screen to e
set color to rb+/b
sele 4
set inde kur395,kur295,kur195
L=16
n=9
@ 5, L SAY 'ษอออออออออหออออออหออออออออออออหอออออออออออหออออออออออออป'
@ 6 ,L SAY 'บ โฎฃฎ ง บฎซจ็.บ   ‘ใฌฌ     บ ฎคฎๅฎคญ๋ฉบ   ข๋ค ็ฅ  บ'
@ 7 ,L SAY 'บ ฌฅแ๏ๆ:  บ      บ            บ  ญ ซฎฃ    บ            บ'
@ 8 ,L SAY 'ฬอออออออออฮออออออฮออออออออออออฮอออออออออออฮออออออออออออน'
@ N, L SAY 'ศอออออออออสออออออสออออออออออออสอออออออออออสออออออออออออผ'
store 0 to w1,w2,w3,kl0,ghs,gh
go top
DO WHILE .NOT. EOF()
mm=month(datapom)
yy=year(datapom)
store 0 to su1,su2,su3,kl
DO WHILE .NOT. EOF() .and. month(datapom)=mm
su1=su1+summa
su2=su2+summav
su3=su3+podox
kl=kl+1
if substr(kassa,1,1)="ก"
   ghs=ghs+summa
   gh=gh+1
endif
skip
enddo
@ N , L SAY 'บ         บ      บ            บ           บ            บ'
@ n ,L+1 say str(mm,2)+"."+str(yy,4)+"ฃ"
@ n ,L+12 say kl pict "9999"
@ n,L+18 say su1 pict "999999999.99"
@ n,L+31 say su3 pict "99999999.99"
@ n,L+43 say su2 pict "999999999.99"
w1=w1+su1
w2=w2+su2
w3=w3+su3
kl0=kl0+kl
n=n+1
enddo
@ N , L SAY 'บ‘…:   บ      บ            บ           บ            บ'
@ N+1,L SAY 'บ         บ      บ            บ           บ            บ'
@ n ,L+12 say kl0 pict "9999"
@ n,L+18 say w1 pict "999999999.99"
@ n,L+31 say w3 pict "99999999.99"
@ n,L+43 say w2 pict "999999999.99"
n=n+1
@ N, L SAY  'ศอออออออออสออออออสออออออออออออสอออออออออออสออออออออออออผ'
@ N+1 , L  SAY 'บ โฏp ขซฅญฎ ็ฅpฅง ก ญชจ:                              บ'
@ N+2 , L  SAY 'บ                                                      บ'
@ N+3 , L SAY  'ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ'
*count to gh for .not. deleted() .and. substr(kassa,1,1)="ก"
@ N+1, L+25 SAY  ltrim(str(gh))+" p แฏฎp๏ฆฅญจฉ ญ  แใฌฌใ "
@ N+2, L+25 SAY  ltrim(str(ghs))+" pใก."
 wait ""
set color to w+/n
restore screen from e
use kur95
set inde kur195,kur295,kur395,kur495
retu
***************************************************
procedure  sprli
ekr=""
ud=0
 save screen to ekr
sele 4
if  g#18 .and. g#17 .and. g#15
go top
endif
set color to rb+/b
@ 0,0 clea to 0,79
@ 0,1 say "    ใpญ ซ ใ็ฅโ  ข๋ฏซ ็ฅญญ๋ๅ ชฎฌฏฅญแ ๆจฉ ญ  แ ญ.-ชใp.ซฅ็ฅญจฅ ง  1995 ฃฎค"
set color to bg+/b
@ 1,0  clea to 23,79
set color to gr+/b
@ 1, 0 SAY 'ษอออออหอออออออออออออออหออออออออหออหอออออออออหออออออออหอออออออออหออออออออหออออหอป'
@ 2, 0 SAY 'บ   N บ ”... ฏฅญแจ- บฎชใฌฅญ.บ—ซบ ‘ใฌฌ    บฎคฎๅฎค.บ ข๋ค ็ฅ บ โ  ข๋-บบ บ'
@ 3, 0 SAY 'บ คฅซ บ    ฎญฅp       บฎโฏp ขซ.บแ.บ         บญ ซฎฃ   บ         บ ค ็จ   บ    บ.บ'
@ 4, 0 SAY 'ฬอออออฮอออออออออออออออฮออออออออฮออฮอออออออออฮออออออออฮอออออออออฮออออออออฮออออฮอน'
y=0
do while y#27 .and.  y#13                 &&1                                       &1
I=5
set color to gr+/b
DO WHILE I<24
@ i ,0 SAY 'บ     บ               บ        บ  บ         บ        บ         บ        บ    บ บ'
I=I+1
ENDDO
@ 24,0 SAY "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ"
@ 24,20 say " ESC - ข๋ๅฎค   F7 - ฏฅ็ โ์  F3 - ใค ซฅญจฅ "
set color to bg+/b
i=5
do while .not. eof() .and. i<=23
do stroka
i=i+1
skip
enddo
in=i-1
skip -(in-5)-1
i=5
dO WHILE .T.                          && 2                                       &&3
set color to b+/w
 do stroka
y=0
 do while y=0
  y=inkey()
 enddo
set color to bg+/B,n/w
  do stroka
  do case
   case y=27       &&.or. y=13
     kkk="  "
     exit
   case y=13
  if .not. eof()
kassa0=substr(kassa,1,1)
  @ i, 1  get delo PICT "99999"
  @ i, 23 get datapom
  @ i, 32 get kol pict "9"
  @ i, 35 get summa pict "999999.99"
  @ i, 45 get podox pict "99999.99"
  @ i, 64 get datapom1
  @ i, 73 get ROVD
  @ i, 78 get kassa0
   read
 repl summav with summa-podox,kassa with kassa0
* @ i, 61 get summav pict "999999.99"
    endif
*    exit
  case y=-6
 g=0
 save scre to ek
 set color to w/rb,bg+/w
  @  9,26 clea to 14,59
 set color to w+/b,bg+/w
  m10=" ฅ็ โ์ p แฏฎp๏ฆฅญจ๏ ข แกฅpก ญช "
  m11=" ฅ็ โ์ จงขฅ้ฅญจ๏ ฏฅญแจฎญฅpใ    "
  m12="  ฏฅญแจฎญญฎฅ คฅซฎ              "
  m13=" ฅ็ โ์ p แฏฎp๏ฆฅญจ๏ ข p ฉฎโคฅซ "
 Do while G#27
 do m1 with 10,13,1,27
 do case
   case g=10
   do pebank
   case g=11
   do pe2
   case g=12
   do pe
   case g=13
   do pe1
 endcase
 enddo
 rest scre from ek
   case y=5 .and. i>5 .and. .not. bof()     && ขขฅเๅ
     i=i-1
     skip -1
   case y=24                 && ขญจง
    if i=in
set color to bg+/b
     skip
      if eof()
        skip -(in-5+1)
      endi
    exit
    else
     i=i+1
     skip
    loop
   endif
   CASE Y=3                    && PgDn ขญจง
    skip (in-i)+1
    i=5
    IF EOF()
    skip -(in-i)-1
    LOOP
    ENDIF
    EXIT
   CASE Y=18 .and. .not. bof()
    SKIP -19-(I-5)
    if bof()
      go top
    endif
    EXIT
   case y=13 .and. .not. eof()         && ข๋กฎเ
       kkk=delo
       exit
   case y=-2
       ud=1
       dele
       skip -(i-5)

       exit
endcase
enddo                                   && 2
enddo                                   && 1
y=0
if ud=1
 sele 4
 set color to r+*/b
 @ 24,20 say " ฎคฎฆคจโฅ ญฅฌญฎฃฎ ! คฅโ ใค ซฅญจฅ ง ฏจแฅฉ "
 pack
set color to
endif
set color to g/n
 restore scre from ekr
return
**************************
procedure stroka
  @ i, 1 say delo PICT "99999"
  u=at(" ",fam)
  u1=at(" ",substr(fam,u+1,len(fam)-u))
  fio=substr(fam,1,u+1)+"."+substr(fam,u+u1+1,1)+"."
  @ i, 7 say fio      &&substr(fam,1,19)
  @ i, 23 say datapom
  @ i, 32 say kol pict "9"
  @ i, 35 say summa pict "999999.99"
  @ i, 45 say podox pict "99999.99"
  @ i, 54 say summav pict "999999.99"
  @ i, 64 say datapom1
  @ i, 73 say ROVD
  @ i, 78 say substr(kassa,1,1)

retu
**************************
procedure chab1
set color to rb+/n
@ 0,1 say "    ใpญ ซ ใ็ฅโ  ข๋ฏซ ็ฅญญ๋ๅ ชฎฌฏฅญแ ๆจฉ ญ  แ ญ.-ชใp.ซฅ็ฅญจฅ ง  1995 ฃฎค"
 set color to bG/n
@ 6, 0 SAY 'ษออออออออหออออออออหอออออออออหออออออออหอออออออออหอออออออออหอออออออออหออออออออป'
@ 7, 0 SAY 'บ   N    บ   โ   บฎซจ็.็ซ.บ1- กฎโ.บ ‘ใฌฌ    บ ฎคฎๅฎค.บ ข๋ค ็ฅ บ(1- ช แ)บ'
@ 8, 0 SAY 'บ ค ฅ ซ  บฏฎซใ็ฅญ.บแฅฌ์จ    บ0-ญฅโ   บ         บ ญ ซฎฃ   บ         บ 2-ฏ/ฏ  บ'
@ 9, 0 SAY 'ฬออออออออฮออออออออฮอออออออออฮออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออน'
@ 10,0 SAY 'บ        บ        บ         บ        บ         บ         บ         บ        บ'
@ 11,0 SAY 'บ        บ        บ         บ        บ         บ         บ         บ        บ'
@ 12,0 SAY 'บ        บ        บ         บ        บ         บ         บ         บ        บ'
@ 13,0 SAY 'ฬออออออออฮออออออออฮอออออออออฮออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออน'
@ 14,0 SAY 'บ        บ        บ         บ        บ         บ         บ         บ        บ'
@ 15,0 SAY 'บ        บ        บ         บ        บ         บ         บ         บ        บ'
@ 16,0 SAY 'บ        บ        บ         บ        บ         บ         บ         บ        บ'
@ 17,0 SAY "ศออออออออสออออออออสอออออออออสออออออออสอออออออออสอออออออออสอออออออออสออออออออผ"
@ 18,65 say "1 - ช แแ "
@ 19,65 say "2 - ฏ/ฏ  "
@ 20,65 say "3 - ก ญช "
@ 21,65 say "4 - p ฉฎโ"
**************************
procedure kor1
do chab1
i=10
set color to r+/n
@  i+6,2 say trim(fam)
set color to g/n
@  i+6,48   say lg
@  i+4,2 get delo pict "99999"
@  i+4,10   get datapom
@  i+4,22   get kol pict "9"
@  i+4,29   get rab pict "9"
@  i+4,38   get summa1  pict "999999.99"
@  i+5,38   get summa2  pict "999999.99"
@  i+6,38   get summa pict "999999.99"
@  i+4,48   get podox pict "999999.99"
@  i+4,58   get summav pict "999999.99"
@  i+4,68   get kassa
read
retu
***************************
procedure pe
if .not. eof()
set devi to print
m=prow()
hh=iif(rab="1","(p กฎโ ฅโ)  ","(ญฅ p กฎโ ฅโ)  ")
@ m   ,8 say str(delo,5)+"  "+FAM
m=prow()+1
qw=15
@ m+1  ,8 say dtoc(datapom)+"ฃ. ฅญฅฆญ ๏ ชฎฌฏฅญแ ๆจ๏ ง  แ ญ โฎpญฎ-ชใpฎpโญฎฅ ซฅ็ฅญจฅ "
@ m+2, qw  say str(summa1,9,2)+" pใก., ฆฅญฅ (คฅโ๏ฌ) "+str(summa2,9,2)+ " pใก."
@ m+3, qw  say "ช ข๋ค ็ฅ "+str(summav,9,2)+" pใก.    "+kassa
*@ m+3, qw  say "ฏ/ญ ซฎฃ "+str(podox,9,2)+" pใก. "+hh+trim(lg)
@ m+5, 0   say repl("-",80)
@ prow(), 0 say ""
set devi to scree
endif
retu
***************************
procedure pe22
if .not. eof()
set devi to print
m=prow()
sele 8
seek kur95->kodbank
rovd0=iif(found(),rtrim(name1)+" ","")
te=tel
sele 4
do case
 case kur95->kodbank="02"
 rovd1=" “ ฃ.๋กจญแช ."
 case kur95->kodbank$"03,08,09,10"
 rovd1=rovd0+" . "
othe
 rovd1=rovd0+" . "
 endcase
f=fam
t=at(" ",f)
io=rtrim(substr(f,t+1,len(f)-t))
sele 4
m=prow()+1
@ m,  3 say "           E ”"
@ m+1,4 say   "E“€…… “’…• …F"+space(13)+adres1
@ m+2,4 say "     ‘€‘ €‘’       "+space(7)+adres2
@ m+3,4 say "150000,ฃ.pฎแซ ขซ์,ใซ.ฅแฏใกซจช ญแช ๏, 23"+space(15)+"ฅญแจฎญฅpใ :E" +substr(fam,1,t)
@ m+4,4 say "   "+sysd+space(17)+"E"+io+'F'
@ m+4,4 say "   _________________ "
@ m+5,4 say "     N 10/"+str(delo,5)
 m=prow()+3
s=(80-len(rtrim(fam))-13)/2
*@ m  , 9 say "    ฅญแจฎญญฎฅ ฎโคฅซฅญจฅ ” “ pฎแซ ขแชฎฉ ฎกซ. แฎฎกMZเ ส@€ ÿÿ- 
