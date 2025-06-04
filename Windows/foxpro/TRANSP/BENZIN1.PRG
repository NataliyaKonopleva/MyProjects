******************* WOWSAN2  ***********
*   ‘ ญ โฎเญฎ-ชใเ.ชฎฌฏฅญแ ๆจ๏ คซ๏ จญข ซจคฎข ,‘,“
*****************************************
set proce to benzin1
sele 5
SET CENT ON
close all
*****************
set color to
*@ 0,0,SROWS(),SCOLS() BOX 'ฐฐฐฐฐฐฐฐฐ'
use razmer
do wowsan3
***********
procedure razmer
sele 5
use razmer
set color to n/w,n/bg
*clea
L=20
n=7
*set color to w/r
@ 3, L SAY 'ษอออออออออหอออออออออหอออออออออหอออออออออป'
@ 4 ,L SAY 'บ ฎค     บฅญงจญ   บ ฅญงจญ  บ’เ ญแฏฎเโบ'
@ 5 ,L SAY 'บ         บ( ขโฎ)   บ (ฌฎโฎ)  บฎกแซใฆจข.บ'
@ 6 ,L SAY 'ฬอออออออออฮอออออออออฮอออออออออฮอออออออออน'
go top
DO WHILE .NOT. EOF()
@ N , L SAY 'บ         บ         บ         บ         บ'
@ N+1, L SAY 'ศอออออออออสอออออออออสอออออออออสอออออออออผ'
@ n ,L+2 get god
@ n ,L+11 get avto pict "999999.99"
@ n,L+21 get moto pict "999999.99"
@ n,L+31 get transp pict "999999.99"
n=n+1
read
skip
n=n+1
enddo
set color to
dele for god=0
pack
retu
*************
procedure wowsan3
do nach
publ su1
sele 1
use cart inde cart0
clea
gg1=year(date())
do while .t.
set color to
vib=0
clea
@ 10,15 say " ญญ๋ฅ ง  ช ชฎฉ ฃฎค  แ จญโฅpฅแใ๎โ?" get gg1 pict "9999" rang 1997,2005
@ 11,15 say "         (1997,1998...)"
@ 14,18 say "… จซจ ’PAH‘’… .- 1/2" get vib pict "9" rang 1,2
read
if readkey()=12 .or. readkey()=262
  clea
  retu
endi
gg=substr(str(gg1,4),3,2)
if vib=1
benzin="benzin"+gg+".dbf"
ntx="benzin"+gg+".ntx"
if .not. file(benzin)
@ 16,18 say "…’ ’• €•             "
WAIT ""
  loop
endi
sele 2
use &benzin
if .not. file(ntx)
 inde on NamPNS to &ntx
endi
use &benzin inde &ntx
endif
if vib=2
transp="transp"+gg+".dbf"
ntx="transp"+gg+".ntx"
if .not. file(transp)
@ 16,18 say "…’ ’• €•"
WAIT ""
  loop
endi
sele 2
use &transp
if .not. file(ntx)
 inde on NamPNS to &ntx
endi
use &transp inde &ntx
endif
vv=0
udl=0
sele 2
count for .not. deleted() to q
if q=0
vv=1
appe blank
endif
go top
set color to w+/r
@ 23,0 clea to 24,79
@ 23,0 SAY "ESC - ข๋ๅฎค,Enter - ชฎเเฅชโจเ.,F1 - ขแฅฃฎ ข๋ค ญฎ F2- ขแโ ขช , F3 - ใค ซฅญจฅ"
@ 24,0 SAY "F4 -ข๋ค ็  ชฎฌฏฅญแ.,F5 - เ งฌฅเ,F6 - p แๅ.ฎpคฅp ,F7 - ข แก/ก  F8 - ฏฎจแช ฏฎ ไ ฌ."
 set color to n/w
@ 0,0 clea to 22,79
udl=0
set color to r/w
if vib=1
zag0=" ๋ฏซ โ  ชฎฌฏฅญแ ๆจจ จญข ซจค ฌ ,‘ ญ  กฅญงจญ จ โฅๅฎกแซใฆจข ญจฅ "+str(gg1,4)
else
zag0=" ๋ฏซ โ  ชฎฌฏฅญแ ๆจจ จญข ซจค ฌ ,‘ ญ  โเ ญแฏฎเโญ๋ฅ เ แๅฎค๋ "+str(gg1,4)
endif
@ 0, 0 say zag0
@ 1,9 say " (ข แฎฎโขฅโแโขจจ แ ฏฎแโ ญฎขซฅญจฅ เ.” N 701 ฎโ 10.07.95 ฃ.)"
set color to   && n/w,n/bg
EKR=1
ip=6
y=3
DO WHILE Y#27                                      &&1
********
@ 2, 0 SAY 'อออออหออออออออออออออออหออออออออออหอออออออออหออออออออออออออออออออออออออออออออออออ'
@ 3, 0 SAY ' ฅญ.บ ” ฏฅญแจฎญฅp  บ     โ   บ  ‘ใฌฌ   บ                €คpฅแ               '
@ 4, 0 SAY 'คฅซฎ บ                บ  ข๋ค ็จ  บ (ฎก้ ๏) บ                                    '
@ 5, 0 SAY 'อออออฮออออออออออออออออฮออออออออออฮอออออออออฮออออออออออออออออออออออออออออออออออออ'
I=6
aaa=0
z=recno()
DO WHILE .NOT. EOF() .AND. I<=21                       &&2
if y=3 .or. y=18 .or. y=-2 .or. y=-1 .or. y=4 .or. y=19 .or. y=-7
@ i, 0 SAY "     บ                บ          บ         บ                                     "
do wowsan13
endif
i=i+1         &&+2
SKIP
aaa=1
ENDDO                                                       &&2
@ i ,0 SAY "อออออสออออออออออออออออสออออออออออสอออออออออสออออออออออออออออออออออออออออออออออออ"
if i<22
@ i+1,0 clea to 22,79
endi
in=I-1                  &&i-2
skip -((IN-IP)+1)     && -((in-ip)/2+1)
if vv=1
i=in
 do vvod
vv=0
go bott
II=MOD(Q,16)-1
skip -ii
loop
endif
dO WHILE .T.                                         && 3
if aaa#0
 SET color to N/BG
 I=IP
 do wowsan13
 set color to  && n/w
endif
y=0
do while y=0
Y=INKEY()
ENDDO
if aaa#0
DO wowsan13
endif
DO CASE
  case aaa=0 .and.(y=24 .or. y=3)
    y=27
   exit
   case y=-4                       && เ งฌฅเ ชฎฌฏฅญแ ๆจจ
   save scre to e
   do razmer
   sele 2
   rest scre from e
   case y=5 .and. ip>6       && ขขฅเๅ
     iP=iP-1
     skip -1
   case y=24 .and. ip<in      && ขญจง
     iP=iP+1
     skip
***************
*  case (y=19 .or. y=4)      && ข แโฎpฎญใ
*   storon=iif(storon=1,2,1)
*   loop
***************
   CASE Y=27
     EXIT
   CASE Y=3                    && PgDn ขญจง
    skip (in-ip)+1
    ip=6
    IF EOF()
    skip -((in-ip)+1)
    LOOP
    ENDIF
    @ 6,0 CLEA TO 22,79
    EXIT
   CASE Y=18
    SKIP -16-(IP-6)
    ip=6
    EXIT
   case y=13 .and. .not. eof()   && ข๋กฎเ
      do okno_vipl
*****************************
    case Y=-2                  &&  “€……
    save scre to e
       set color to r/N
       @  9, 15 clea to 11,60
       fif=" "
       da=" "
       @  10,20 say "๋ ใขฅเฅญ๋,็โฎ ญ คฎ ใค ซจโ์? (/)"  get da
       read
       set color to  && n/w
       if readkey()=12 .or. readkey()=262 .or. .not. da$"YyคLl"
       rest scre from e
       loop
       endi
      udl=1
      dele
      q=q-1
      @ 6,0 CLEA TO 22,79
      if ip=6
      SKIP
      else
      SKIP (6-IP)
      endif
      if eof()
         go top
      endif
      IP=6
    EXIT
*****************************
    case Y=-3                  &&  ๋ค ็  ฌ โ.ฏฎฌ.
tr=vidtr1+vidtr2
sele 5
*srok0=gg1
loca for god=gg1
IF .NOT. FOUND()
  SU1=0
ELSE
do case
case vib=2
  su1=transp
case vib=1 .and.(" ขโฎ"$tr .or. "€ขโฎ"$tr)
  su1=avto
case vib=1 .and.("ฌฎโฎ"$tr .or. "ฎโฎ"$tr)
  su1=moto
endcase
ENDIF
da=date()
sele 2
@ i,23 get da
@ i,34 get su1 pict "999999.99"
*@ i  ,46 get vid1
*@ i+1,46 get vid2
read
if readkey()#12 .and. readkey()#262
repl summa1 with su1,datav1 with da
endif
*****************************
  case y=28
     do spr
   case y=-6                            && ฏฅ็ โ์
    save scre to e
     do sb with 2
   rest scre from e
   case y=-5                            && ฏฅ็ โ์ ฎpคฅp 
    save scre to e
     do order with 4
   rest scre from e
   case y=-1            && ขขฎค
count for .not. deleted() to q
ii=mod(q,16)
ip=6
   go bott
   ekr=(q-ii)/16+1
skip -ii+1
     vv=1
     exit
***********
  case y=-7
save scre to e
       set color to r/bg
       @  9, 15 clea to 11,50
       fif=space(10)
       @  10,20 say "” ฌจซจ๏   "  get fif
       read
        set color to
       if readkey()#12 .and. readkey()#262
       gg=recno()
       seek ltrim(trim(fif))
       if found()                    &&a
        exit
       else
       rest scre from e
       go gg
       endif
       endif
*****************
ENDCASE
ENDDO                                              && 3
ENDDO                                              &&1
if udl=1
pack
endi
enddo
RETURN
*************************************
procedure wowsan13
@ i  , 0 SAY "     บ                บ          บ         บ                                 "
@ i, 0 say delo pict "99999"

  u=at(" ",nampns)
  u1=at(" ",substr(nampns,u+1,len(nampns)-u))
  fio=substr(namPNS,1,u+1)+"."+substr(nampns,u+u1+1,1)+" "
@ i,  6 say fio
@ i,23 say datav1
@ i,34 say summa1+summa2+summa3+summa4 pict "999999.99"
@ i  ,44 say adres1          &&+adres2
*@ i,55 say inv_
*@ i,65 say texosm1
*@ i+1,65 say texosm2
RETURN
****************************************
procedure okno_vipl
*defi window vipl_pens from 5,7 to 20,70 title "ฅญงจญ" shadow color b/bg
*acti window vipl_pens
save scre to ekr
set color to   && b/bg
@ 5,7 clea to 20,70
DO RAM WITH 3,7,20,70
set color to r+/n
@ 22,15 say "ESC - ข๋ๅฎค     ENTER - ชฎเเฅชโจเฎขช "
do oknosay
zz=0
do while zz=0
zz=inkey()
enddo
if zz=27
rest scre from ekr
retu
endi
do oknoget
summa=summa1+summa2+summa3+summa4
do oknosay
wait ""
rest scre from ekr
***************************************
procedure oknosay
@ 6,8 say nampns
set color to
@ 6,50 say inv_
@ 8,8 say adres1
@ 9,8 say adres2
@ 10, 8 say "’ฅๅฎแฌฎโเ      " +texosm
@ 11, 8 say "1 ชข. " +"    "+str(summa1,8,2)+"  เ แฏฎเ๏ฆฅญจฅ " + dtoc(datav1)
@ 12, 8 say "2 ชข. " +"    "+str(summa2,8,2)+"  เ แฏฎเ๏ฆฅญจฅ " + dtoc(datav2)
@ 13, 8 say "3 ชข. " +"    "+str(summa3,8,2)+"  เ แฏฎเ๏ฆฅญจฅ " + dtoc(datav3)
@ 14, 8 say "4 ชข. " +"    "+str(summa4,8,2)+"  เ แฏฎเ๏ฆฅญจฅ " + dtoc(datav4)
@ 16, 8 say "แฅฃฎ " +"    "+str(summa1+summa2+summa3+summa4,8,2)
@ 18, 8 say "ฎค ก ญช  "+str(codbnk,2)
retu
*******************************************
procedure oknoget
@ 6,8 get nampns
@ 6,50 get inv_
@ 8,8 get adres1
@ 9,8 get adres2
@ 10,23 get texosm
@ 11,18 get summa1 pict "99999.99"
@ 11,41 get datav1
@ 12,18 get summa2 pict "99999.99"
@ 12,41 get datav2
@ 13,18 get summa3 pict "99999.99"
@ 13,41 get datav3
@ 14,18 get summa4 pict "99999.99"
@ 14,41 get datav4
@ 18,18 get codbnk
read
if readkey()=12 .or. readkey()=262
retu
endi

***********************
procedure wowsan23
@ i, 0 get delo pict "99999"
f0=NamPNS
@ i, 6 get f0
@ i,25 get datav1
@ i,36 get summa1 pict "999999.99"
@ i,46 get vidtr1
@ i+1,46 get vidtr2
@ i,55 get inv_
@ i,65 get texosm1
*@ i+1,65 get texosm2
   read
return
*****************************
procedure vvod
i=in+2
@ i  , 0 SAY "     บ                บ          บ         บ                                    "
@ i+1, 0 SAY "อออออสออออออออออออออออสออออออออออสอออออออออสออออออออออออออออออออออออออออออออออออ"
d=0
s1=0
x=" "
@ i ,0  get d pict "99999"
read
if readkey()=12 .or. readkey()=262
 retu
endif
loca for delo=d
if found()
set color to r+/n
  @ row()-1 ,10 say "  “ฆฅ ฅแโ์ โ ชฎฉ ฏฅญแจฎญฅเ,กฎซ์่ฅ ญฅ ญ คฎ ! "
  wait ""
set color to
retu
endi
sele 1
seek d
 if found() .and. vidpns<3  .and. codlea=0
f0=NamPns
r1=cart->catinv
r2=str(cart->grpinv,1)
inv=space(8)
do case
   case r1=1
     inv=r2+" ฃp."
   case r1=2
     inv=r2+" ฃp.‘"
   case r1=3
     inv=r2+" ฃp.‘"
   case r1=4
     inv=r2+" ฃp."
endcase
inv=inv+space(8-len(inv))
store space(14) to TEX1,TEX2
store space(8) to vid1,vid2
a1=adres1
a2=adres2
sele 2
appe blank
repl delo with d,catinv with cart->catinv,grpinv with cart->grpinv,NamPns with f0,;
adres1 with a1,adres2 with a2,TEXOSM1 with TEX1,TEXOSM2 with TEX2,inv_ with inv,vidtr1 with vid1,vidtr2 with vid2,;
codbnk with cart->codbnk
DO RAM WITH 3,7,20,70
do oknoget
do oknosay

 else
   @  i,10 say " ่จกฎ็ญ๋ฉ ญฎฌฅp    "
   sele 2
  endif
retu
***   spr.prg      26.04.94     ************************
************************************************************
procedure spr
z=recno()
e=""
save screen to e
set color to r/bg
L=15
n=11
@ 7, L SAY 'ษอออออออออหอออออออออออป'
@ 8 ,L SAY "บ โฎฃฎ ฏฎบ  ็จแซฅญฎ บ"
@ 9 ,L SAY 'บ แฏจแชใ: บ           บ'
@ 10,L SAY 'ฬอออออออออฮอออออออออออน'
@ 11,L SAY 'บ         บ           บ'
@ 12,L SAY 'บ         บ           บ'
@ 13,L SAY 'บ         บ           บ'
@ 14,L SAY 'ศอออออออออสออออออออออออ'
count to su  for .not. deleted()
count to su0  for .not. deleted() .and. summa1+summa2+summa3+summa4#0
sum summa1+summa2+summa3+summa4 to su1
@ 12,L+2 say str(su,3)+" ็ฅซ."
@ 13,L+2 say str(su0,3)+" ็ฅซ."
@ 13,L+11 say str(su1,11,2)
go z
wait ""
set color to n/w
restore screen from e
retu
