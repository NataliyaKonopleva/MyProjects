*          กซจๆ          31.05.93    *
set talk off
set devi to screen
set date germ
mes10="                      "
Mes20="   "
MES=MES10+MES20
MO=rtrim(SUBSTR(MES,8*month(date())-7,8))+" "
GOD=STR(YEAR(date()),5)+" ฃ."
sysd=str(day(date()),2)+" "+mo+god
sele 5
use bank
set color to bg/n
clea
do while .t.
kb="  "
@ 10,5 say " ญช=>" get kb  pict "99"
read
if readkey()=12 .or.readkey()=262
  retu
endif
go top
loca for kod=kb
nb=iif(found()," "+trim(name)+" แกฅpก ญช"," ")
*************************************
set devi to print
l=prow()
m=prow()
@ m,  3 say "           Ex1k0 "
@ m+1,4 say   "    F"
@ m+2,4 say "                        "+nb
@ m+3,4 say "150000,ฃ.pฎแซ ขซ์,ใซ.ฅแฏใกซจช ญแช ๏, 23"
@ m+4,8 say sysd
@ m+4,46 say bank->adres1
@ m+4,4 say "   __________________ "
@ m+5,46 say bank->adres2
@ m+5,4 say "     N 10/__________ "
m=prow()+5
b=5
@ m  ,b say "        pฎแจฌ ข๋แซ โ์ ข ฏฅญแจฎญญ๋ฉ ฏฎคฎโคฅซ   คซ๏ ฏpฎขฅpชจ "
@ m+2, b say "ข๋ฏจแชจ จง ซจๆฅข๋ๅ แ็ฅโฎข ฏฅญแจฎญฅpฎข  ง  1995 ฃ.  "
@ prow()+5,b+11 say " ็ ซ์ญจช                             แ๋ฏจญ .."
@ prow()+3,b+11 say " ็ ซ์ญจช ฏฅญแจฎญญฎฃฎ ฏฎคฎโคฅซ             ซจฅข   .."
@ prow(),b+11 say " "
set devi to scre
enddo
retu
