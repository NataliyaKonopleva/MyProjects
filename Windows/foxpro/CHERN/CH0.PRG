* Menu4.prg
set talk off
close all
publ gg1,gg,cin
gg1=year(date())
set proce to cher
do while .t.
SET COLOR TO W/b
DO RAM
SET COLOR TO b+/w
@ 23,1 CLEA TO 23,78
@ 23,10 SAY "  E S C  - Выход из экрана      E N D - Выход из системы "
SET COLOR TO W+/r,B/w
@ 7,14 SAY "╔══════════════════════════════════════════════════╗"
@ 8,14 SAY "║                                                  ║"
@ 9,14 SAY "║                                                  ║"
@ 10,14 SAY "║                                                  ║"
@ 11,14 SAY "║                                                  ║"
@ 12,14 SAY "║                                                  ║"
@ 13,14 SAY "║                                                  ║"
@ 14,14 SAY "╚══════════════════════════════════════════════════╝"
M9=  " Выплаты чеpнобыльцам                          "
M10= " Пополнение списка чеpнобыльцев                "
M11= " Изменение pазмеpов компенсаций                "
M12= " Печать списка чернобыльцев                    "
m13= " Ввод компенсаций на питание за месяц  всем    "
do M1 WITH 9,13,1,15
 if g=27
    return
  endif
  DO CASE
    CASE g=9
clea memo
gg1=year(date())
set color to w/b
@ 15,15 say "Данные за какой год Вас интеpесуют?" get gg1 pict "9999"
@ 16,15 say "         (1996,1997...)"
read
if readkey()=12 .or. readkey()=262
  clea
  retu
endi
gg=substr(str(gg1,4),3,2)
chernv="chernv"+gg+".dbf"
cin="cherv"+gg +".ntx"
if .not. file(chernv)  .or. .not. file("minza.dbf")
  retu
endi
sele 9
use minza
loca for god=gg1
if .not. found()
    @ 15,13 say "Нет данных о min размере оплаты труда"
    wait ""
loop
endi
     do ch
    CASE g=10
      do vvodch0
    CASE g=11
     set color to
     clea
     do rk
     case g=12
     do spichern
     case g=13
     *do sp_bnk
     do kompmes 
  ENDCASE
enddo
return
