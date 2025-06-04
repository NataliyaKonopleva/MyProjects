* Таблица
**********************************
close all
sele 2
use poluch inde poluch
sele 1
use kart inde kart1
set color to
do ram
do while .t.
     sele 1
      de=0
set color to r+/n
      store 0 to pos,pos1,pos0
      @ 10,20 say "ВВЕДИТЕ НОМЕР ПЕНСИОННОГО ДЕЛА => " get de pict "99999"
      @ 12,20 say "          (ESC - отказ) "
      @ 12,1 clea to 17,78
      @ 19,1 clea to 20,78
       read
      @ 18,1 clea to 18,78
        if readkey()=12 .or. readkey()=268
           retu
        endif
      sele 1
       seek de
       if .not. found()
       set color to r+/n
      @ 18,15 say "К сожалению,у нас нет такого пенсионеpа. Повтоpим ввод ..."
       loop
       endif
      if kodpens="3"
       do tabls
       else
       do tablv
       endif
      clea
      enddo
retu
