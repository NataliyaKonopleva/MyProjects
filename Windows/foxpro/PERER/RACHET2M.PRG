* ����� ������� �� �p��� ��p�p����
set esca off
set talk off
set date germ
set color to
konmes="31,29,31,30,31,30,31,31,30,31,30,31"
clea
store 0 to kol1,kol2
dp=ctod("  .  .  ")
sele 1
use kart
@  10,8 say "������ ����  ��p�p����   " get dp
@  12,8 say "����쪮 ���� � 1 �����,�� ���p� �㤥� ���᫥�� ������?" get kol1 pict "99"
@  14,8 say "����쪮 ���� � 2 �����,�� ���p� �㤥� ���᫥�� ������?" get kol2 pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
*********
     me=month(dp)
     pdm=val(substr(konmes,(me-1)*3+1,2))       && ���.���� ME1
     z1=ctod(stuff(dtoc(dp),1,2,str(pdm,2)))    && 30.04.
     z2=z1+1                                    &&  1.05.
     mee=month(z2)
     pdm1=val(substr(konmes,(mee-1)*3+1,2))       && ���.���� 2-�� ��� (31.05)
     z3=ctod(stuff(dtoc(z2),1,2,str(pdm1,2)))    && 31.05.
     pdm3=val(substr(konmes,(mee+1-1)*3+1,2))       && ���.���� 2-�� ��� (31.05)
@  16,8 say "��᫥���� ���� ����� ��p�p���� => "get z1
@  17,8 say "��᫥���� ���� 2 -�� ����� ��p�p���� => "get z3
read
if readkey()=12 .or. readkey()=262
  retu
endif
@ 20,8 say "���� ���� p���� ������� ���ᨩ �� �/��� � �� �����������"
*********
do while .not. eof()
d=day(srwipl1)
if prichwib=" " .and. kodpens#"3" .and. srwipl1<=dp     &&ctod("01.07.94")
repl  dopl with (itpens-itpens0)*2
endif
if prichwib=" " .and. kodpens#"3" .and. srwipl1>dp .and. srwipl1<=z1   &&ctod("31.07.94")
k=kol1-d+1
repl  dopl with round((itpens-itpens0)/kol1*k,0)+itpens-itpens0
endif
if prichwib=" " .and. kodpens#"3" .and. srwipl1=z2  &&ctod("01.08.94")
repl  dopl with itpens-itpens0
endif
if prichwib=" " .and. kodpens#"3" .and. srwipl1>z1 .and. srwipl1<=z3   && c c�p.2 �.
k=kol2-d+1
repl  dopl with round((itpens-itpens0)/kol2*k,0)
endif
if prichwib=" "
repl vsego with dopl+itpens
endif
if prichwib=" " .and. kodpens#"3" .and. srwipl1>z3  &&ctod("01.06.95")
repl  dopl with 0,vsego with round((itpens/pdm3)*(pdm3-d+1),0)
endif
skip
enddo
********************
@ 21,0
@ 21,8 say "����! ���� p���� ������� ���ᨩ �� ���p� ��p�����"
sele 1
use kart inde kart1
***************************
sele 2
use poluch
do while .not. eof()
d=delo
dop=0
sele 1
seek d
if prichwib=" " .and. kodpens="3"
 sele 2
d=day(srwipl1)
 if  srwipl1<=dp
  dop=(itpens-itpens0)*2
 endif
 if srwipl1>dp .and. srwipl1<=z1
 d=day(srwipl1)
 k=kol1-d+1
   dop= round((itpens-itpens0)/kol1*k,0)+itpens-itpens0
 endif
 if srwipl1=z2
  dop=itpens-itpens0
 endif
if  srwipl1>z1 .and. srwipl1<=z3   && c c�p.2 �.
k=kol2-d+1
  dop=round((itpens-itpens0)/kol2*k,0)
endif
 sele 2
 repl  dopl with dop,vsego with dop+itpens
 if srwipl1>z3
repl  dopl with 0,vsego with round((itpens/pdm3)*(pdm3-d+1),0)
 endif
endif
skip
enddo

