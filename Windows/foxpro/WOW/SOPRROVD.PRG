* ®¯à®¢®¤¨«®¢ª¨
set talk off
do c:\prg\nach
set devi to screen
set date germ
mes10="                      "
Mes20="   "
MES=MES10+MES20
MO=rtrim(SUBSTR(MES,8*month(date())-7,8))+" "
GOD=STR(YEAR(date()),5)+" £."
sysd=str(day(date()),2)+" "+mo+god
sele 5
use c:\pens01.96\bank
sele 1
use wow961
set color to bg/n
clea
do while .t.
kb="  "
kb0="  "
*@ 10,5 say " ©®­=>" get kb  pict "9"
@ 12,5 say " ­ª =>" get kb pict "99"  &&kb0
read
if readkey()=12 .or. readkey()=262
  retu
endif
sele 1
*count to j1 for raion=kb
*sum komp to j2 for raion=kb
count to j1 for kodbank=kb
sum komp to j2 for kodbank=kb
@ 22,1 say j1
@ 22,40 say j2
sele 5
go top
loca for kod=kb
rovd0=iif(found(),rtrim(name1)+" ","")
q=" ç «ì­¨ª"
do case
 case kb="02"
 rovd1=" £.ë¡¨­áª ."
 case kb$"03,08,09,10"
 rovd1=rovd0+" . "
othe
 rovd1=rovd0+" . "
 endcase
nb=q+"ã "+rovd1
nbo=q+" "+rovd1
*************************************
set devi to print
l=prow()
m=prow()
@ m,  3 say "           E "
@ m+1,4 say   "    "
@ m+2,4 say "                        "+nb
@ m+3,4 say "150000,£.p®á« ¢«ì,ã«.¥á¯ã¡«¨ª ­áª ï, 23"
@ m+4,10 say sysd
*@ m+4,46 say bank->adres1
@ m+4,4 say "     __________________ "
*@ m+5,46 say bank->adres2
@ m+5,4 say "       N 10/__________ E"
m=prow()+4
b=3
@ m  ,b say "    p¨ ¯®áâã¯«¥­¨¨ áp¥¤áâ¢ ¨§  p®á« ¢áª®© ®¡«. ¯p®á¨¬ ¢ë¯« â¨âì    "
@ m+2, b say "¥¤¨­®¢p¥¬¥­­ë¥ ¯®á®¡¨ï ¯¥­á¨®­¥p ¬  - ¢¥â¥à ­ ¬   á®£« á­® "
@ m+4, b say "¯p¨« £ ¥¬®£® á¯¨áª  "
@ prow()+2, b say "( ¢ ª®«¨ç¥áâ¢¥ "+ltrim(str(j1))+" ç¥«. ­  áã¬¬ã "+ltrim(str(j2))+" pã¡)"
@ prow()+2, b say "ë¯« âã ¯®¤â¢¥p¤¨â¥ ¯¨áì¬¥­­®         "
@ prow()+4,b+11 say " ç «ì­¨ª                                  áë¯¨­ .."
@ prow()+3,b+11 say " ç «ì­¨ª ¯¥­á¨®­­®£® ¯®¤®â¤¥«                  «¨¥¢   .."
@ prow()+5,0 say repl("-",80)
@ prow()+1,30 say "F¥p­ãâì ¢ ¯¥­á¨®­­ë© ¯®¤®â¤¥« E  "
m=prow()+3
b=4
*@ m,3 say substr(nb,2,len(nb)-1)
@ m   ,42 say " ç «ì­¨ªã   p®á« ¢áª®© ®¡«."
@ m+2, 42 say "150000,£.p®á« ¢«ì,ã«.¥á¯ã¡«¨ª ­áª ï, 23"
@ prow()+4,b say "     ¯¨á®ª ¯¥­á¨®­¥p®¢  - ¢¥â¥à ­®¢  ¤«ï ¢ë¯« âë ¥¤¨­®¢p¥¬¥­­®£®  "
@ prow()+2,b say "¯®á®¡¨ï ª ­î ®¡¥¤ë ¢ ª®«¨ç¥áâ¢¥ "+ltrim(str(j1))+" ç¥«. ­  áã¬¬ã "+ltrim(str(j2))+" pã¡"
@ prow()+2,b say  '¯®«ãç¥­ .  ë¯« â  ¯p®¨§¢¥¤¥­  "_____"______________ 1996 £.'
@ prow()+4,b+13 say nbo+":"
@ prow()+1,b-1 say ".."
@ prow()+2,b+13 say "«.¡ãå£ «â¥p:"
set devi to scre
enddo
retu
