* Итого по банку в особом случае
sele 5
use bank
set devi to screen
set date germ
clea
sele 1
use kart inde kartbank
go top
kb="  "
vp=" "
store 0 to v1,v2,v
@ 12,20 say "Укажите код банка => " get kb pict "99"
@ 14,20 say "Вид пенсии        => " get vp pict "9"
read
@ 0,0 clea to 23,19
if readkey()=12 .or. readkey()=262
  retu
endif
sele 1
kb1=kb+vp
seek kb1
 do while .not. eof() .and. kodbank+kodpens=kb1
  if prichwib= " " .and. itpens#itpens0
       v1=v1+itpens
       v2=v2+dopl
       v =v +vsego
  endif
skip
enddo
*sum itpens,dopl,vsego to v1,v2,v for prichwib=" " .and. kodbank+kodpens=kb1
  cifra=v
 m=prow()+1
q="|"
set devi to print
@ prow(),row() say "M"
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
 @ prow()+1, ss say sos1
if len(sos1)>=85
@ prow(),1 say "FM"
endi
z=2
 @ prow()+2, 5 say "Начальник ФЭО УВД ЯО:                                 Засыпин В.Н"
 @ prow()+z, 5 say "Начальник пенсионного подотдела:                      Алиева Н.Х."
