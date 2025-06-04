* Список по банкам
save scre to ek1
sele 5
use bank
set devi to screen
set date germ
   i=1
   l=0
do while .not. eof()
   if i>20
     i=1
     l=60
   endif
   @ i  ,l say ltrim(str(codbnk))+" "+trim(nambnk)
   i=i+1
   skip
enddo
sele 1
go top
kb=0
@ 12,20 say "Укажите код банка => " get kb pict "99"
read
if readkey()=12  .or. readkey()=262
  retu
endif
@ 0,0 clea to 23,19
rest scre from ek1
SET COLOR TO W/R ,R/W
   @ 10,12 say "╔══════════════> Распечатывать списки <═════════════════╗"
   @ 11,12 say "║                                                       ║"
   @ 12,12 say "║                                                       ║"
   @ 13,12 say "║                                                       ║"
   @ 14,12 say "╚═══════════════════════════════════════════════════════╝"
set color to
if readkey()=12 .or. readkey()=262
  retu
endif
sele 5
go top
loca for codbnk=kb
nb=iif(found(),"В "+trim(nambnk)+" банк"," ")
kb1=str(kb,2)+ltrim(str(kk))
@ 2,30 Say nb
if kk>=3
  do bank2        && семьи
  retu
endif
sele 1
seek kb1
store 1 to lis1,lis
do while .t.
set devi to scre
set color to w/r
@ 12,20 say "Номеp листа          =>" get lis pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
if lis#lis1
  seek kb1
 j=0
 do while j<(lis-1)*18
  if codlea=0 .and. itgpns#itgpns0
   j=j+1
  endif
  skip
 enddo
endif
np=(lis-1)*18
set devi to print
*if lis=1
* m=prow()
* @ m,0 say " "
* @ prow()+2,10 say ""
*endif
@ prow(),1 say " "
@ prow(),2 say nb
@ prow(),45 say vid
@ prow(),30 say "-"+ltrim(str(lis,2))+"-M"
m=prow()+2
q="|"
@  m  ,0 say "----------------------------------------------------------------------------------------"
@  m+1,0 say "|N   |  N  |   Фамилия, имя ,отчество          | Размеp   |Доплата   |Сумма пенсии за  |"
@  m+2,0 say "|п/п |пенс.|      пенсионеpа                   | пенсии   |за октябрь|ноябрь с доплатой|"
@  m+3,0 say "|    |дела |                                   | c 1.10.97|   1997г. | за октябрь 1997г|"
@  m+4,0 say "|----|-----|-----------------------------------|----------|----------|-----------------|"
m=prow()+1
i=1
do while .not. eof() .and. i<=18 .and. codbnk=kb .and. vidpns=kk
ndb=""
if codlea=0 .and. itgpns#itgpns0
if begpay>ctod("01.10.97")
@ m-1,48  say "ES1С "+dtoc(begpay)+"TFM"
*@ m,85  say "EС "+dtoc(begpay)+"FM"
endif
@ m,0   say q+str(np+i,4)+q+str(delo,5)+q+substr(nampns,1,35)+q+str(itgpns,10,0)+q+str(dopl,10,0)+q+str(itgpns+dopl,13,0)+"    "+q
cifra=vsego
do perev1
@ m+1,0 say "|          |"+sos1+space(75-len(sos1))+q
@ m+2,0 say "|----|-----|-----------------------------------|----------|----------|-----------------|"
m=prow()+1
i=i+1
endif
 skip
enddo
if eof() .or. codbnk#kb .or. vidpns#kk   &&kodbank+kodpens#kb1
store 0 to v,v1,v2
seek kb1
 do while .not. eof() .and. str(codbnk,2)+str(vidpns,1)=kb1
  if codlea=0 .and. itgpns#itgpns0
       v1=v1+itgpns
       v2=v2+dopl
       v =v +vsego
  endif
skip
enddo
*sum itpens,dopl,vsego to v1,v2,v for prichwib=" " .and. kodbank+kodpens=kb1
  cifra=v
 m=prow()+1
@ m,0   say "|ВСЕГО:    |"+space(36)+str(v1,10,0)+q+str(v2,10,0)+q+str(v,13,2)+"    "+q
@ m+1,0 say "----------------------------------------------------------------------------------------"
  do perev1
set devi to scree
@ 18,0 get sos1
read
ss=2
set devi to print
if len(sos1)>=85
@ prow(),1 say "E"
ss=8
endi
 @ prow()+2, ss say sos1
if len(sos1)>=85
@ prow(),1 say "FM"
endi
  z=iif(i<16,4,2)
 @ prow()+z, 5 say "Начальник ФЭО УВД ЯО                                 Засыпин В.Н"
 @ prow()+z, 5 say "Начальник пенсионного отделения                      Алиева Н.Х."
 endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
