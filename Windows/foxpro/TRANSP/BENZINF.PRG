******************* WOWSAN2  ***********
*   �����୮-���.��������� ��� ��������� ���,���,���
*****************************************
set proce to benzin1
sele 5
SET CENT ON

hide wind all
close all
*****************
defi window prosm from 3,3 to 20,70 titl "��⠩� � ����������" shadow color b/w,b/r
defi window vvodm from 3,3 to 20,70 titl "���������" shadow color n/w,b/r
defi window vvod  from 10,1 to 15,79 titl "���� ������" shadow color w/b,r/w
defi window soob  from 22,3 to 24, 73 color w/r
defi window tem from 3,3 to 18,70 titl "�롥p�� ⥬�" double color w/rb,r/w

defi window vipl_pens from 5,7 to 20,70
***************
set color to
@ 0,0,SROWS(),SCOLS() BOX '���������'


use razmer
do wowsan3
***********
procedure razmer
sele 5
use razmer
set color to n/w,n/bg
*clea
L=20
n=7
*set color to w/r
@ 3, L SAY '���������������������������������������ͻ'
@ 4 ,L SAY '� ���     �������   � ������  ��࠭ᯮ��'
@ 5 ,L SAY '�         �(���)   � (���)  ����㦨�.�'
@ 6 ,L SAY '���������������������������������������͹'
go top
DO WHILE .NOT. EOF()
@ N , L SAY '�         �         �         �         �'
@ N+1, L SAY '���������������������������������������ͼ'
@ n ,L+2 get god
@ n ,L+11 get avto pict "999999.99"
@ n,L+21 get moto pict "999999.99"
@ n,L+31 get transp pict "999999.99"
n=n+1
read
skip
n=n+1
enddo
set color to
dele for god=0
pack
retu
*************
procedure wowsan3
do nach
publ su1
sele 1
use cart inde cart0
clea
gg1=year(date())
do while .t.
set color to
vib=0
clea
@ 10,15 say "����� �� ����� ��� ��� ���p�����?" get gg1 pict "9999" rang 1997,2005
@ 11,15 say "         (1997,1998...)"
@ 14,15 say "���� ��� �PAH������� ��.- 1/2" get vib pict "9" rang 1,2
read
if readkey()=12 .or. readkey()=262
  clea
  retu
endi
gg=substr(str(gg1,4),3,2)
if vib=1
benzin="benzin"+gg+".dbf"
ntx="benzin"+gg+".idx"
if .not. file(benzin)
@ 16,18 say "�� ���� ����             "
WAIT ""
  loop
endi
sele 2
use &benzin
if .not. file(ntx)
 inde on NamPNS to &ntx
endi
use &benzin inde &ntx
endif
if vib=2
transp="transp"+gg+".dbf"
ntx="transp"+gg+".idx"
if .not. file(transp)
@ 16,18 say "�� ���� ����"
WAIT ""
  loop
endi
sele 2
use &transp
if .not. file(ntx)
 inde on NamPNS to &ntx
endi
use &transp inde &ntx
endif
vv=0
udl=0
storon=1
sele 2
count for .not. deleted() to q
if q=0
vv=1
appe blank
endif
go top
set color to w+/r
@ 23,0 clea to 24,79
@ 23,0 SAY "ESC - ��室,Enter - ���४��.,F1 - �ᥣ� �뤠�� F2- ��⠢��, F3 - 㤠�����"
@ 24,0 SAY "F4 -�뤠� �������.,F5 - ࠧ���,F6 - p���.�p��p ,F7 - � �/�  F8 - ���� �� 䠬."
 set color to n/w
@ 0,0 clea to 22,79
udl=0
set color to r/w
if vib=1
zag0=" �믫�� �������樨 ��������� ���,��� �� ������ � �审�㦨����� "+str(gg1,4)
else
zag0=" �믫�� �������樨 ��������� ���,��� �� �࠭ᯮ��� ��室� "+str(gg1,4)
endif
@ 0, 0 say zag0
@ 1,9 say " (� ᮮ⢥��⢨� � ���⠭������� ��.�� N 701 �� 10.07.95 �.)"
set color to n/w,n/bg
EKR=1
ip=6
y=3
DO WHILE Y#27                                      &&1
********
if storon=1
@ 2, 0 SAY '��������������������������������������������������������������������������������'
@ 3, 0 SAY ' ���.�   ��� ���ᨮ��p� �  � � � � �  �㬬�  ��������.� ������ � ���������    '
@ 4, 0 SAY '���� �                  �  �뤠�  �         �/��������  ����  �               '
@ 5, 0 SAY '��������������������������������������������������������������������������������'
else
@ 2, 0 SAY '������������������������������������'
@ 3, 0 SAY '                ��p��               '
@ 5, 0 SAY '������������������������������������'
endif
********
I=6
aaa=0
z=recno()
DO WHILE .NOT. EOF() .AND. I<=21                       &&2
if y=3 .or. y=18 .or. y=-2 .or. y=-1 .or. y=4 .or. y=19 .or. y=-7
 if storon=1
@ i  , 0 SAY "     �                  �          �         �        �         �               "
 else
@ i,0 clea to i,79
endif
do wowsan13 with storon
endif
i=i+1         &&+2
SKIP
aaa=1
ENDDO                                                       &&2
if storon=1
@   i ,0 SAY "��������������������������������������������������������������������������������"
else
@ i, 0 SAY '������������������������������������'
endif
if i<22
@ i+1,0 clea to 22,79
endi
in=I-1                  &&i-2
skip -((IN-IP)+1)     && -((in-ip)/2+1)
if vv=1
i=in
 do vvod
vv=0
*count for .not. deleted() to q
go bott
II=MOD(Q,16)-1
skip -ii
loop
endif
dO WHILE .T.                                         && 3
if aaa#0
 SET color to N/BG
 I=IP
 do wowsan13 with storon
 set color to n/w
endif
y=0
do while y=0
Y=INKEY()
ENDDO
if aaa#0
DO wowsan13 with storon
endif
DO CASE
  case aaa=0 .and.(y=24 .or. y=3)
    y=27
   exit
   case y=-4                       && ࠧ��� �������樨
   save scre to e
   do razmer
   sele 2
   rest scre from e
   case y=5 .and. ip>6       && �����
     iP=iP-1
     skip -1
   case y=24 .and. ip<in      && ����
     iP=iP+1
     skip
***************
   case (y=19 .or. y=4)      && � ��p���
    storon=iif(storon=1,2,1)
    loop
***************
   CASE Y=27
     EXIT
   CASE Y=3                    && PgDn ����
    skip (in-ip)+1
    ip=6
    IF EOF()
    skip -((in-ip)+1)
    LOOP
    ENDIF
    @ 6,0 CLEA TO 22,79
    EXIT
   CASE Y=18
    SKIP -16-(IP-6)
    ip=6
    EXIT
   case y=13 .and. .not. eof()   && �롮�
*     do wowsan23 with storon
      do okno_vipl

*****************************
    case Y=-2                  &&  �������
    save scre to e
       set color to r/w
       @  9, 15 clea to 11,60
       fif=" "
       da=" "
       @  10,20 say "�� 㢥७�,�� ���� 㤠����? (�/)"  get da
       read
       set color to n/w
       if readkey()=12 .or. readkey()=262 .or. .not. da$"Yy��Ll"
       rest scre from e
       loop
       endi
      udl=1
      dele
      q=q-1
      @ 6,0 CLEA TO 22,79
      if ip=6
      SKIP
      else
      SKIP (6-IP)
      endif
      if eof()
         go top
      endif
      IP=6
    EXIT
*****************************
    case Y=-3                  &&  �뤠� ���.���.
tr=vidtr1+vidtr2
sele 5
*srok0=gg1
loca for god=gg1
IF .NOT. FOUND()
  SU1=0
ELSE
do case
case vib=2
  su1=transp
case vib=1 .and.("���"$tr .or. "���"$tr)
  su1=avto
case vib=1 .and.("���"$tr .or. "���"$tr)
  su1=moto
endcase
ENDIF
da=date()
sele 2
@ i,25 get da
@ i,36 get su1 pict "999999.99"
*@ i  ,46 get vid1
*@ i+1,46 get vid2
read
if readkey()#12 .and. readkey()#262
repl summa1 with su1,datav1 with da
endif
*****************************
  case y=28
     do spr
   case y=-6                            && �����
    save scre to e
     do sb with 2
   rest scre from e
   case y=-5                            && ����� �p��p�
    save scre to e
     do order with 4
   rest scre from e
   case y=-1 .and. storon=1             && ����
count for .not. deleted() to q
ii=mod(q,16)
ip=6
   go bott
   ekr=(q-ii)/16+1
skip -ii+1
     vv=1
     exit
***********
  case y=-7
save scre to e
       set color to r/bg
       @  9, 15 clea to 11,50
       fif=space(10)
       @  10,20 say "�������   "  get fif
       read
       if readkey()#12 .and. readkey()#262
       gg=recno()
       seek ltrim(trim(fif))
        set color to n/w
       if found()                    &&a
        exit
       else
       rest scre from e
       go gg
       endif
       endif
*****************
ENDCASE
ENDDO                                              && 3
ENDDO                                              &&1
if udl=1
pack
endi
enddo
RETURN
*************************************
procedure wowsan13
parameters par
if par=1
@ i  , 0 SAY "     �                  �          �         �        �         �              "
@ i, 0 say delo pict "99999"

  u=at(" ",nampns)
  u1=at(" ",substr(nampns,u+1,len(nampns)-u))
  fio=substr(namPNS,1,u+1)+"."+substr(nampns,u+u1+1,1)+" "
  @ i, 7 say fio
*f0=substr(NamPNS,1,20)
*f1=substr(nAMpNS,21,20)
@ i,  6 say fio
*@ i+1,  6 say f1
@ i,25 say datav1
@ i,36 say summa1 pict "999999.99"
@ i  ,46 say vidtr1
*@ i+1,46 say vidtr2
@ i,55 say inv_
@ i,65 say texosm1
*@ i+1,65 say texosm2
else
@ i  , 0 say adres1
*@ i+1, 0 say adres2
endif
RETURN
****************************************
procedure okno_vipl
defi window vipl_pens from 5,7 to 20,70 title "������" shadow color gr/n
acti window vipl_pens
@ 1,1 say nampns
@ 3,1 say adres1+adres2
@ 5,1 say "1 ��. " +"    "+str(summa1,8,2)+"  �ᯮ�殮��� " + dtoc(datav1)
@ 7,1 say "2 ��. " +"    "+str(summa2,8,2)+"  �ᯮ�殮��� " + dtoc(datav2)
@ 9,1 say "3 ��. " +"    "+str(summa3,8,2)+"  �ᯮ�殮��� " + dtoc(datav3)
@ 11,1 say "4 ��. " +"    "+str(summa4,8,2)+"  �ᯮ�殮��� " + dtoc(datav4)
zz=" "
@ 13,1 say "�ᥣ� " +"    "+str(summa1+summa2+summa3+summa4,8,2) get zz
read
deact wind vipl_pens
***********************
procedure wowsan23
parameters par
if par=1
@ i, 0 get delo pict "99999"
f0=NamPNS
@ i, 6 get f0
*@ i+1, 6 get f1
@ i,25 get datav1
@ i,36 get summa1 pict "999999.99"
@ i,46 get vidtr1
@ i+1,46 get vidtr2
@ i,55 get inv_
@ i,65 get texosm1
*@ i+1,65 get texosm2
   read
*repl nampns with f0+f1
else
@ i  ,0  get adres1
@ i,  40  get adres2
   read
endif
return
*****************************
procedure vvod
i=in+2
@ i  , 0 SAY "     �                  �          �         �        �         �               "
@ i+1, 0 SAY "��������������������������������������������������������������������������������"
d=0
s1=0
x=" "
@ i ,0  get d pict "99999"
read
if readkey()=12 .or. readkey()=262
 retu
endif
loca for delo=d
if found()
set color to r+/w
  @ row()-1 ,10 say "  ��� ���� ⠪�� ���ᨮ���,����� �� ���� ! "
  wait ""
set color to n/w
retu
endi
sele 1
seek d
 if found() .and. vidpns<3  .and. codlea=0
f0=NamPns
r1=cart->catinv
r2=str(cart->grpinv,1)
inv=space(8)
do case
   case r1=1
     inv=r2+" �p.���"
   case r1=2
     inv=r2+" �p.���"
   case r1=3
     inv=r2+" �p.��"
   case r1=4
     inv=r2+" �p.��"
endcase
inv=inv+space(8-len(inv))
store space(14) to TEX1,TEX2
store space(8) to vid1,vid2
@ i, 0 get delo pict "99999"
a1=adres1
a2=adres2
@ i, 6  get f0
*@ i+1, 6  get f1
@ i,46 get vid1
*@ i+1,46 get vid2
@ i,55 get inv
@ i,65 get tex1
*@ i+1,65 get tex2
read
storon=2
@ 2,0 clea to 22,78
@ 2, 0 SAY '������������������������������������'
@ 3, 0 SAY '                ��p��               '
@ 5, 0 SAY '������������������������������������'
@ i  , 0 get a1
@ i, 37 get a2
read
if readkey()#12 .and. readkey()#262
sele 2
appe blank
repl delo with d,catinv with cart->catinv,grpinv with cart->grpinv,NamPns with f0,;
adres1 with a1,adres2 with a2,TEXOSM1 with TEX1,TEXOSM2 with TEX2,inv_ with inv,vidtr1 with vid1,vidtr2 with vid2
endif
 else
   @  i,10 say " �訡��� ����p    "
   sele 2
  endif
storon=1
retu
***   spr.prg      26.04.94     ************************
************************************************************
procedure spr
z=recno()
e=""
save screen to e
set color to r/bg
L=15
n=11
@ 7, L SAY '���������������������ͻ'
@ 8 ,L SAY "� �⮣� ��� ��᫥�� �"
@ 9 ,L SAY '� ᯨ��: �           �'
@ 10,L SAY '���������������������͹'
@ 11,L SAY '�         �           �'
@ 12,L SAY '�         �           �'
@ 13,L SAY '�         �           �'
@ 14,L SAY '�����������������������'
count to su  for .not. deleted()
count to su0  for .not. deleted() .and. summa1#0
sum summa1 to su1
@ 12,L+2 say str(su,3)+" 祫."
@ 13,L+2 say str(su0,3)+" 祫."
@ 13,L+11 say str(su1,11,2)
go z
wait ""
set color to n/w
restore screen from e
retu
