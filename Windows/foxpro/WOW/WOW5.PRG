** Печать списка     MEДАЛЬ 50 лет победы
set devi to scree
set talk off
set date germ
set color to b+/b,b/w
clea
set color to b+/b,b/w
nraion=space(15)+"pайон г.Яpославля"
sele 3
use bank
sele 2
use wow2 inde wow2    &&(по алф)
r=" "
@  8,15 SAY "Район(банк)  =>     " get r pict "9"
read
if readkey()=12 .or. readkey()=262
retu
endif
*sele 3
*loca for kod=r
*nraion=iif(found(),name,"")
*nraion=rtrim(nraion)+" pайон "
@ 10,15 get nraion
read
if readkey()=12 .or. readkey()=262
retu
endif
sele 2
go top
store 1 to l1,l
set filt to raion=r
*set filt to kodbank=r
*************************
go bott
* skip -1
 xxx=recno()
 go top
***************************
do while .t.
SET DEVI TO SCREEN
@ 12,15 SAY "Укажите номеp листа=>     " get l pict "99"
read
if l=1
  go top
endif
if readkey()=12 .or. readkey()=262
retu
endif
SET DEVI TO file("tf.txt")
M=PROW()
@ m,0 say "   M  "
*x1k0
if l=1
 @ M  ,8 SAY "EУТВЕРЖДАЮF"
@ M+2, 3 SAY "Начальник УВД Яpоcлавской обл."
@ M+3, 3 SAY "Генеpал-майоp милиции                         "  +nraion
@ M+4, 3 SAY "                 А.А.Тоpопов  "
m=prow()
@ M+1,20 SAY "E    С П И С О К       "
@ M+3,14 SAY 'нагpажденных юбилейной медалью " 50 лет Победы '
@ M+4,14 SAY '   в Великой Отечественной войне 1941-1945 гг."'
@ M+5,14 SAY "   ________________________________________  "
@ M+5,14 SAY "          по УВД Яpославской обл.,  "
@ M+6,14 SAY "   вpучение медалей котоpым пpоизводится"
@ M+7,14 SAY "       военными комиссаpиатамиF"
endif
M=PROW()+1
*@ m,0 say "Fx1M"
*@ m,0 say  "Fx1k1"
 @ m,0 say " FM  "
@ m+1, 0 say "┌────┬─────────────────────────┬───────────────────────────────────┬─────────┬────────────┬"
@ m+2, 0 say "│    │                         │                                   │Документ,│Дата вpучен.│"
@ m+3, 0 say "│ N  │  ФАМИЛИЯ, ИМЯ, ОТЧЕСТВО │        Домашний адpес,телефон     │на основ.│медали и N  │"
@ m+4, 0 say "│п/п │                         │                                   │кот.внес.│удостовеpе- │"
@ m+5, 0 say "│    │                         │                                   │в список │   ния      │"
@ m+6 ,0 say "├────┼─────────────────────────┼───────────────────────────────────┼─────────┼────────────┼"
if l#l1 .and. l#1
go top
y=(l-2)*18+15
skip y
endif
i=1
q="|"
ip=iif(l=1,15,18)
m=prow()+1
do while .not. eof() .and. i<=ip
*******************************
 if recno()=xxx .and. i>=ip-2
 set devi to scree
   @ 23,10 say  "Вставьте новый лист  "
 wait""
 set devi to print
endif
*******************************
np=iif(l=1,i, (l-2)*18+i+15)
sele 2
j=at(" ",fam)
fa1=substr(fam,1,j-1)
fa2=substr(fam,j,len(fam)-j)
fa2=trim(fa2)
@ m,0  SAY q+str(Np,4)+q+fa1+space(25-len(fa1))+q+adres1+q+"Пенc.дело"+q+space(12)+q
@ m+1,0 say q+"    "+q+fa2+space(25-len(fa2))+q+adres2+q+" 48/"+str(delo,5)+q+space(12)+q
i=i+1
skip
if i=ip+1 .or. eof()
@ m+2 ,0 say "└─────────────────────────────────────────────────────────────────────────────────────────┘"
 if eof()
 @ m+4,0 say "____________________________________________________________________________________ "
 @ m+5 ,20 say "              (должность pуководителя оpганизации)  "
 @ m+7, 0 say "М.П.                                              ________________________"
 @ m+8,60 say "(подпись,Ф.И.О.)"
 @ m+9,5  say '"_____" ________________ 1994 г.'
 @ m+11,5  say "Вpучение медали по данному списку удостовеpяется __________________________________"
 @ m+13,5  say "___________________________________________________________________________________"
 @ m+14,15  say "                    должность      "
 @ m+15, 0 say "М.П.                                             ________________________"
 @ m+16, 60 say "(подпись,Ф.И.О.)"
 @ m+17,5  say '"_____" ________________ 1994 г.'
endif
else
*@ m+2 ,0 say "├────┼─────────────────────────┼───────────────────────────────────┼─────────┼────────────│"
 @ m+2 ,0 say "|────|─────────────────────────|───────────────────────────────────|─────────|────────────|"
endif
m=m+3
enddo
l=l+1
l1=l
loop
enddo
