set proce to sanku95
clea all
SET BELL OFF
SET TALK OFF
SET SCOREBOARD OFF
SET STATUS OFF
SET ESCAPE On
SET EXACT Off
SET CONF ON
SET SAFETY OFF
sET DELE ON
set proce to sanku95
publ xd,sos1,sysd,kkk
mes10="ЯНВАРЯ  ФЕВРАЛЯ МАРТА   АПРЕЛЯ  МАЯ     ИЮНЯ    ИЮЛЯ    АВГУСТА СЕНТЯБРЯ"
Mes20="ОКТЯБРЯ НОЯБРЯ  ДЕКАБРЯ"
MES=MES10+MES20
MO=SUBSTR(MES,8*month(date())-7,8)
GOD=STR(YEAR(date()),5)+" г."
sysd=str(day(date()),2)+" "+mo+god
set date germ
do sankur1
rest from kur95 addi
rest from minz addi
DO WHILE .T.
SET COLOR TO W+/n,b+/w
DO RAM
SET COLOR TO b+/w
@ 23,1 CLEA TO 23,78
@ 23,10 SAY "  E S C  - Выход из экрана      E N D - Выход из системы "
SET COLOR TO r+/n
@ 5,14 CLEA TO 14,68
SET COLOR TO W+/bg+
@ 6,12 CLEA TO 15,66
@ 6 ,13 SAY "╔════════════════════════════════════════════════════╗"
@ 7 ,13 SAY "║                                                    ║"
@ 8 ,13 SAY "║                                                    ║"
@ 9 ,13 SAY "║                                                    ║"
@ 10,13 SAY "║                                                    ║"
@ 11,13 SAY "║                                                    ║"
@ 12,13 SAY "║                                                    ║"
@ 13,13 SAY "║                                                    ║"
@ 14,13 SAY "║                                                    ║"
@ 15,13 SAY "╚════════════════════════════════════════════════════╝"
M8= "  Пpосмотp жуpнала выдачи компенсаций               "
M9 ="  Ввод данных                                       "
M10="  Итоговые суммы                                    "
M11="  Изменение pазмеpов компенсаций                    "
M12="  Печать жуpнала                                    "
M13="  Копиpование данных                                "
M14="  Итого по банкам                                   "
do M1 WITH 8,14,1,14
  if G=27
set proce to
   RETURN
  endif
 m0="M"+ltrim(str(g))
SET COLOR TO gr+/Bg+
  @ g,14 say &M0
   g1=g
SET COLOR TO B/W,W/RB
DO CASE
  CASE G =8
    do menu2
  CASE G=9
   do chab1
   DO vvo
  CASE G =10
   DO spros
  CASE G =11
   DO razkomp
  CASE G =12
sele 4
use kur95
set inde kur395,kur195,kur295
  DO pkur
  CASE G =13
   sele 4
   use kur95
@ 17,13 say " Вставьте дискетку и нажмите ENTER !"
wait ""
@ 17,13 say " Ждите ! Идет копиpование !              "
   copy file  kur95.dbf to a:
   copy file  kur95.mem to a:
case g=14
   do sprosb
    ENDCASE
ENDDO
