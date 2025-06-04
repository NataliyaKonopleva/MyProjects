* Список по банкам
do nach
publ cifra
clea
sele 1
use wow96
if .not. File("wow96b.ntx")
 inde on kodbank+str(delo,5) to wow96b
endif
use wow96 inde wow96b
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
   @ i  ,l say kod+" "+trim(name)
   i=i+1
   skip
enddo
sele 1
go top
kb="  "
@ 12,20 say "Укажите код банка => " get kb pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
clea
sele 5
go top
loca for kod=kb
nb=iif(found(),"В "+trim(name)+" банк"," ")
kb1=kb
@ 2,30 Say nb
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
 do while j<(lis-2)*18+16
  if prichwib=" "
   j=j+1
  endif
  skip
 enddo
endif
np=(lis-2)*18+16
set devi to print
 if lis=1
@ prow(),0 say "F"
@ prow(),1 say nb
@ prow()+1,1 say " "
  m=prow()
@ M  ,20 SAY "-P    С П И С О К "
@ M+2, 2 SAY '-1пенсионеров УВД Яpославской обл.- участников Великой Отечественной войны-0'
@ M+3, 6 SAY '-11941-1945 гг., которым следует произвести единовременную выплату -0'
@ M+4,14 SAY '-1в мае 1996 г.одновременно с выплатой пенсии.-0M'
  @ prow()+1,10 say ""
else
@ prow(),37 say "-"+ltrim(str(lis,2))+"-M"
 endif
m=prow()+2
q="|"
@  m  ,0 say "--------------------------------------------------------------------------------------"
@  m+1,0 say "|N   |  N  |   Фамилия, имя ,отчество          | Размеp   |Пенсионный|      Вид      |"
@  m+2,0 say "|п/п |пенс.|      пенсионеpа                   | единовр. |  лист    |     пенсии    |"
@  m+3,0 say "|    |дела |                                   | выплаты  |          |               |"
@  m+4,0 say "|----|-----|-----------------------------------|----------|----------|---------------|"
ip=iif(lis=1,16,18)
m=prow()+1
i=1
do while .not. eof() .and. i<=ip .and. kodbank=kb1
ndb=""
store "" to vidp,vidp0
DO CASE
 CASE KODPENS="1"
 VIDP="за выслугу лет "
 CASE KODPENS="2"
 VIDP="по инвалидности"
 CASE KODPENS="3"
 VIDP="по потере корм."
endcase
np=iif(lis=1,i, (lis-2)*18+i+16)
@ m,0   say q+str(np,3)+" "+q+str(delo,5)+q+substr(fam,1,35)+q+str(komp, 8,0)+"  "+q+"  "+penlist+"  "+q+vidp+q
cifra=komp
do perev1
@ m+1,0 say "|          |"+sos1+space(73-len(sos1))+q
if i#ip
@ m+2,0 say "|----|-----|-----------------------------------|----------|----------|---------------|"
else
@  m+2,0 say "--------------------------------------------------------------------------------------"
endif
m=prow()+1
i=i+1
 skip
enddo
if eof() .or. kodbank#kb1
store 0 to v
seek kb1
 do while .not. eof() .and. kodbank=kb1
  if prichwib= " "
       v =v +komp
  endif
skip
enddo
  cifra=v
 m=prow()+1
@ m,0   say "|ВСЕГО:    |"+space(36)+str(v, 8,0)+"  |          |               |"
@  m+1,0 say "--------------------------------------------------------------------------------------"
  do perev1
set devi to scree
@ 18,0 get sos1
read
ss=2
set devi to print
if len(sos1)<=85
@ prow()+1,1 say "E" +sos1+"F"
ss=8
endi
if len(sos1)>=85
@ prow()+1,1 say "M"+sos1+"PF"
endi
  z=iif(i<16,3,2)
 @ prow()+z, 10say "Начальник ФЭО УВД ЯО:                            Засыпин В.Н"

 @ prow()+z, 10 say "Начальник пенсионного подотдела:                 Алиева Н.Х."
 endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
