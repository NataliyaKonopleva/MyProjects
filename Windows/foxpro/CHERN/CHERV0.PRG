* **************  cherv.prg ***********************
set color to r+/n
set cent off
@ 24,0
     sele 9
      go top
      loca for god=gg1
if r=1
 sele 1
use &chernv inde &cin
  set filt to
  sum  sum1,sum2 to a,b for .not. deleted()
  @ 24,37 say "��������� � ������ ���� "+str(a+b,12,2)
sele 4       &&  chern
@ 24,3 say "ESC - ��室   'Enter' - �롮�"
else
sele 5      &&   lgot
@ 24,0 say "ESC - ������ � ���� �롮� ���ᨮ��p�  'Enter' - �롮�  �믫���"
endif
go top
set color to bg+/b
y=0
*********
if r=2
set color to bg+/n
@ 2,0 clea to 23,79
@ 2,t say "48/"+str(chern->delo,5)+"   "+chern->fam+inval(chern->grp)
@ 3, t SAY '������������������������������������������������������������������������ͻ'
@ 4, t SAY '� ���   ����.���� �믫.������㬬�   ���.ᥬ� ������:   ������. �1-��cc��'
@ 5, t SAY '�        �(����         ��.� ����-p�         �         ������  �2-���� �'
@ 6, t SAY '������������������������������������������������������������������������͹'
I=7
DO WHILE I<23
@ I,t SAY  "�        �    �         �   �        �         �         �       �       �"
I=I+1
ENDDO
@ 23,t SAY "������������������������������������������������������������������������ͼ "
endif
*********
if r=1
@ 2, 33 say str(gg1,4)+" ���"
set color to bg+/b
@ 3, 0 SAY '��������������������������������������������������������������������ͻ '
@ 4, 0 SAY '����� �           �������            �������� ����.�  ���  ��p.�p��.� '
@ 5, 0 SAY '�     �           ���ᨮ��p�         � �����  ����.�  p���. �� ����  � '
@ 6, 0 SAY '��������������������������������������������������������������������͹ '
I=7
DO WHILE I<23
@ I,0 SAY  "�     �                              �        �    �        �        � "
I=I+1
ENDDO
@ 23,0 SAY "��������������������������������������������������������������������ͼ "
endif
do while y#27 .and. y#13
i=7
do while .not. eof() .and. i<23
 if r=1                && chern
set color to bg+/b
  @ i, 1 say delo PICT "99999"
  @ i, 7 say substr(fam,1,30)
  na=inval(grp)
  @ i,38 say na
  @ i,47 say kols pict "99"
  @ i,52 say datar
  @ i,62 say avar
  else
set color to bg+/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT "99999.99"
  @ I,t+38 say sum2  PICT "999999.99"
  @ I,t+48 say sum1+sum2  PICT "999999.99"
* @ I,t+58 say PN  PICT "9999.99"
  @ I,t+66 say kas  PICT "XXX"
 endif
i=i+1
skip
enddo
in=i-1
skip -(in-6)
i=7
dO WHILE .T.                                                                &&3
set color to b+/w
 if r=1
  @ i, 1 say delo PICT "99999"
  @ i, 7 say substr(fam,1,30)
  na=inval(grp)
  @ i,38 say na
  @ i,47 say kols pict "99"
  @ i,52 say datar
  @ i,62 say avar
 ELSE
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT  "99999.99"
  @ I,t+38 say sum2  PICT  "999999.99"
  @ I,t+48 say sum1+sum2   PICT "999999.99"
 *@ I,t+58 say PN  PICT "9999.99"
  @ I,t+66 say kas  PICT "XXXX"
 endif
y=0
 do while y=0
  y=inkey()
 enddo
 if r=1
set color to bg+/B
  if y=13
set color to r/w
  endif
  @ i, 1 say delo PICT "99999"
  @ i, 7 say substr(fam,1,30)
  na=inval(grp)
  @ i,38 say na
  @ i,47 say kols pict "99"
  @ i,52 say datar
  @ i,62 say avar pict "9999"
 endif
 if r=2 .and. y#13
set color to bg+/n
  @ i,t+1  say datav
  @ i,t+10 say srok pict "9999"
  @ i,t+15 say naim pict "XXXXXXXXX"
  @ I,t+26 say kols  PICT "99"
  @ I,t+29 say sum1  PICT  "99999.99"
  @ I,t+38 say sum2  PICT  "999999.99"
  @ I,t+48 say sum1+sum2  PICT "999999.99"
* @ I,t+58 say PN  PICT "9999.99"
  @ I,t+66 say kas  PICT "XXXX"
 endif
  do case
   case y=27
       KKK=0
     return
   case y=5 .and. i>7 .and. .not. bof()     && �����
     i=i-1
     skip -1
   case y=24                 && ����
    if i=in
Ii=7
DO WHILE iI<23
IF R=1
@ Ii,0 SAY  "�     �                              �        �    �        �        � "
else
@ ii, t SAY '�        �    �         �   �        �         �         �       �       �'
 endif
Ii=Ii+1
ENDDO
     skip
      if eof()
        skip -(in-6)
      endi
    exit
    else
     i=i+1
     skip
    loop
   endif
   CASE Y=3                    && PgDn ����
    skip (in-i)+1
    i=7
    IF EOF()
    skip -(in-i)-1
    LOOP
    ENDIF
Ii=7
DO WHILE iI<23
IF R=1
@ Ii,0 SAY  "�     �                              �        �    �        �        � "
else
@ ii, t SAY '�        �    �         �   �        �         �         �       �       �'
endif
Ii=Ii+1
ENDDO
    EXIT
   CASE Y=18 .and. .not. bof()
    SKIP -19-(I-7)
    if bof()
      go top
    endif
    i=7
    EXIT
   case y=13 .and. .not. eof()         && �롮� �믫���
     store 0 to su1,su2
       kkk=IIF(R=1,chern->delo,lgot->KODv)
       IF R=2                           &&1
       kb=kkk
          repl datav with date(),kols with chern->kols
 mes=iif(kb<=12,"minz"+ltrim(str(kb)),"minz"+ltrim(str(month(date()))))
 mes_=minza->&mes
 cat_=chern->cat
          do case
          case kb<=12 .and. cat_#"2"
            su1=iif(chern->grp=0 .and. cat_#"3",mes_*2,mes_*3)
            su2=iif(chern->grp=0 .and. cat_#"3",0,mes_*CHERN->do_14*3)
          case kb<=12 .and. cat_="2"
            su1=0
            su2=mes_*chern->do_14*3
          case kb=13
            x=0
            do case
             case chern->grp=1 .or. chern->grp=2
              x=5
             case chern->grp=3 .or. cat_="3"
              x=4
             case str(chern->avar,4)$"1986,1987"
              x=3
             case str(chern->avar,4)$"1988"
              x=2
             case str(chern->avar,4)$"1989,1990" .or. (cat_="2" .and. chern->kols#0)
              x=1
             endcase
            su1=iif(cat_#"2",mes_*x,0)
            su2=iif(cat_="2",mes_*kols,0)
          case kb=15 .and. cat_#"2" .and. chern->grp#0
           su1=minza->put
          case kb=16
           q="100 70 50"
           k0=val(substr(q,3*(chern->grp)-3+1,3))
           su1=mes_*k0
          case kb>=17 .and. cat_="2"
           pen="minp"+ltrim(str(kb-16,0))
          su2=minza->&pen*(chern->kols+chern->sam)/2
    endcase

           su1=round(su1,2)
           su2=round(su2,2)
           repl sum1 with su1,sum2 with su2
            @ i,t+1  get datav
            @ I,t+66 get kas  PICT "9"
 read
 ka=iif(kas="1","����","�/�")
repl kas with ka
        Y=0
***************
          SELE 1
           go top
          seek chern->delo
             priz=0
             do while .not. eof() .and. delo=ddd
                if srok=lgot->srok .and. kodv=lgot->kodv
                  priz=1
                 exit
                 endif
                skip
             enddo
       if priz=0
          APPE BLANK
       endif
           REPL KOLS WITH LGOT->KOLS,KODV WITH LGOT->KODV,DELO WITH CHERN->DELO,;
naim with lgot->Naim,sum1 with su1,sum2 with su2,datav with lgot->datav,codbnk with chern->codbnk,;
kas with lgot->kas,pn with lgot->pn,srok with lgot->srok,codbnk_ with chern->codbnk


if codbnk=1 .or. codbnk>=18 .or. codbnk=4 .or. codbnk=11
   repl codbnk_ with 1
endif

          SELE 5
       loop
       ENDIF
 exit
endcase
enddo
enddo
return
