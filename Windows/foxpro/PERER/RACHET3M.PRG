* ����� ������� �� �p��� ��p�p����
set esca off
set talk off
set date germ
set color to
konmes="31,28,31,30,31,30,31,31,30,31,30,31"
clea
store 0 to kol1,kol2,kol3
dp=ctod("  .  .  ")
sele 1
use kart
@   6,8 say "������ ����  ��p�p����   " get dp
@   8,8 say "����쪮 ���� � 1 �����,�� ���p� �㤥� ���᫥�� ������?" get kol1 pict "99"
@  10,8 say "����쪮 ���� � 2 �����,�� ���p� �㤥� ���᫥�� ������?" get kol2 pict "99"
@  12,8 say "����쪮 ���� � 3 �����,�� ���p� �㤥� ���᫥�� ������?" get kol3 pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
*********
     me=month(dp)
     pdm=val(substr(konmes,(me-1)*3+1,2))       && ���.���� ME1
     z1=ctod(stuff(dtoc(dp),1,2,str(pdm,2)))    && 30.09.
     z2=z1+1                                    &&  1.10.
     mee=month(z2)
     pdm1=val(substr(konmes,(mee-1)*3+1,2))       && ���.���� 2-�� ��� (31.05)
     z3=ctod(stuff(dtoc(z2),1,2,str(pdm1,2)))    && 31.10.
     pdm3=val(substr(konmes,(mee+1-1)*3+1,2))    && ���.���� 3-�� ��� (30)
     z4=z3+1                                     && 01.11
     z5=ctod(stuff(dtoc(z4),1,2,str(pdm3,2)))    && 30.11.
     pdm5=val(substr(konmes,(mee+2-1)*3+1,2))    && ���.���� 4

@  16,8 say "��᫥���� ���� ����� ��p�p���� => "get z1
@  17,8 say "��᫥���� ���� 2 -�� ����� ��p�p���� => "get z3
@  18,8 say "��᫥���� ���� 3 -�� ����� ��p�p���� => "get z5
read
if readkey()=12 .or. readkey()=262
  retu
endif
@ 20,8 say "���� ���� p���� ������� ���ᨩ �� �/��� � �� �����������"
*********
do while .not. eof()
d=day(srwipl1)
if prichwib=" " .and. kodpens#"3" .and. srwipl1<=dp     &&ctod("01.09.95")
repl  dopl with (itpens-itpens0)*3
endif
if prichwib=" " .and. kodpens#"3" .and. srwipl1>dp .and. srwipl1<=z1   &&ctod("31.07.94")
k=kol1-d+1
repl  dopl with round((itpens-itpens0)/kol1*k,0)+(itpens-itpens0)*2
endif
if prichwib=" " .and. kodpens#"3" .and. srwipl1=z2  &&ctod("01.08.94")
repl  dopl with (itpens-itpens0)*2
endif
if prichwib=" " .and. kodpens#"3" .and. srwipl1>z2 .and. srwipl1<=z3   && c c�p.2 �.
k=kol2-d+1
repl  dopl with round((itpens-itpens0)/kol2*k,0)+itpens-itpens0
endif
if prichwib=" " .and. kodpens#"3" .and. srwipl1>=z4 .and. srwipl1<=z5   && c c�p.2 �.
k=kol3-d+1
repl  dopl with round((itpens-itpens0)/kol3*k,0)
endif
if prichwib=" "
repl vsego with dopl+itpens
endif
if prichwib=" " .and. kodpens#"3" .and. srwipl1>z5  &&ctod("01.12.95")
repl  dopl with 0,vsego with round((itpens/pdm5)*(pdm5-d+1),0)
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
*********************
 if  srwipl1<=dp
  dop=(itpens-itpens0)*3
 endif
 if srwipl1>dp .and. srwipl1<=z1
 d=day(srwipl1)
 k=kol1-d+1
   dop= (itpens-itpens0)/kol1*k+(itpens-itpens0)*2
 endif
 if srwipl1=z2
  dop=(itpens-itpens0)*2
 endif
if  srwipl1>z2 .and. srwipl1<=z3   && c c�p.2 �.
k=kol2-d+1
dop=round((itpens-itpens0)/kol2*k,0)+itpens-itpens0
endif
if srwipl1>=z4 .and. srwipl1<=z5   && c c�p.3 �.
k=kol3-d+1
dop=round((itpens-itpens0)/kol3*k,0)
endif
 sele 2
 repl  dopl with dop,vsego with dop+itpens
******************************************
 if srwipl1>z5
repl  dopl with 0,vsego with round((itpens/pdm5)*(pdm5-d+1),0)
 endif
endif
skip
enddo
retu
