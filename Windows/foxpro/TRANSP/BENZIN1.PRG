******************* WOWSAN2  ***********
*   �����୮-���.��������� ��� ��������� ���,���,���
*****************************************
set proce to benzin1
sele 5
SET CENT ON
close all
*****************
set color to
*@ 0,0,SROWS(),SCOLS() BOX '���������'
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
@ 14,18 say "������ ��� �PAH�������� ��.- 1/2" get vib pict "9" rang 1,2
read
if readkey()=12 .or. readkey()=262
  clea
  retu
endi
gg=substr(str(gg1,4),3,2)
if vib=1
benzin="benzin"+gg+".dbf"
ntx="benzin"+gg+".ntx"
if .not. file(benzin)
@ 16,18 say "��� ���� ������             "
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
ntx="transp"+gg+".ntx"
if .not. file(transp)
@ 16,18 say "��� ���� ������"
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
set color to   && n/w,n/bg
EKR=1
ip=6
y=3
DO WHILE Y#27                                      &&1
********
@ 2, 0 SAY '��������������������������������������������������������������������������������'
@ 3, 0 SAY ' ���.� ��� ���ᨮ��p� �  � � � � �  �㬬�  �                ��p��               '
@ 4, 0 SAY '���� �                �  �뤠�  � (����) �                                    '
@ 5, 0 SAY '��������������������������������������������������������������������������������'
I=6
aaa=0
z=recno()
DO WHILE .NOT. EOF() .AND. I<=21                       &&2
if y=3 .or. y=18 .or. y=-2 .or. y=-1 .or. y=4 .or. y=19 .or. y=-7
@ i, 0 SAY "     �                �          �         �                                     "
do wowsan13
endif
i=i+1         &&+2
SKIP
aaa=1
ENDDO                                                       &&2
@ i ,0 SAY "��������������������������������������������������������������������������������"
if i<22
@ i+1,0 clea to 22,79
endi
in=I-1                  &&i-2
skip -((IN-IP)+1)     && -((in-ip)/2+1)
if vv=1
i=in
 do vvod
vv=0
go bott
II=MOD(Q,16)-1
skip -ii
loop
endif
dO WHILE .T.                                         && 3
if aaa#0
 SET color to N/BG
 I=IP
 do wowsan13
 set color to  && n/w
endif
y=0
do while y=0
Y=INKEY()
ENDDO
if aaa#0
DO wowsan13
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
*  case (y=19 .or. y=4)      && � ��p���
*   storon=iif(storon=1,2,1)
*   loop
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
      do okno_vipl
*****************************
    case Y=-2                  &&  ��������
    save scre to e
       set color to r/N
       @  9, 15 clea to 11,60
       fif=" "
       da=" "
       @  10,20 say "�� 㢥७�,�� ���� 㤠����? (�/)"  get da
       read
       set color to  && n/w
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
@ i,23 get da
@ i,34 get su1 pict "999999.99"
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
   case y=-1            && ����
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
        set color to
       if readkey()#12 .and. readkey()#262
       gg=recno()
       seek ltrim(trim(fif))
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
@ i  , 0 SAY "     �                �          �         �                                 "
@ i, 0 say delo pict "99999"

  u=at(" ",nampns)
  u1=at(" ",substr(nampns,u+1,len(nampns)-u))
  fio=substr(namPNS,1,u+1)+"."+substr(nampns,u+u1+1,1)+" "
@ i,  6 say fio
@ i,23 say datav1
@ i,34 say summa1+summa2+summa3+summa4 pict "999999.99"
@ i  ,44 say adres1          &&+adres2
*@ i,55 say inv_
*@ i,65 say texosm1
*@ i+1,65 say texosm2
RETURN
****************************************
procedure okno_vipl
*defi window vipl_pens from 5,7 to 20,70 title "������" shadow color b/bg
*acti window vipl_pens
save scre to ekr
set color to   && b/bg
@ 5,7 clea to 20,70
DO RAM WITH 3,7,20,70
set color to r+/n
@ 22,15 say "ESC - ��室     ENTER - ���४�஢��"
do oknosay
zz=0
do while zz=0
zz=inkey()
enddo
if zz=27
rest scre from ekr
retu
endi
do oknoget
summa=summa1+summa2+summa3+summa4
do oknosay
wait ""
rest scre from ekr
***************************************
procedure oknosay
@ 6,8 say nampns
set color to
@ 6,50 say inv_
@ 8,8 say adres1
@ 9,8 say adres2
@ 10, 8 say "���ᬮ��      " +texosm
@ 11, 8 say "1 ��. " +"    "+str(summa1,8,2)+"  �ᯮ�殮��� " + dtoc(datav1)
@ 12, 8 say "2 ��. " +"    "+str(summa2,8,2)+"  �ᯮ�殮��� " + dtoc(datav2)
@ 13, 8 say "3 ��. " +"    "+str(summa3,8,2)+"  �ᯮ�殮��� " + dtoc(datav3)
@ 14, 8 say "4 ��. " +"    "+str(summa4,8,2)+"  �ᯮ�殮��� " + dtoc(datav4)
@ 16, 8 say "�ᥣ� " +"    "+str(summa1+summa2+summa3+summa4,8,2)
@ 18, 8 say "��� ����� "+str(codbnk,2)
retu
*******************************************
procedure oknoget
@ 6,8 get nampns
@ 6,50 get inv_
@ 8,8 get adres1
@ 9,8 get adres2
@ 10,23 get texosm
@ 11,18 get summa1 pict "99999.99"
@ 11,41 get datav1
@ 12,18 get summa2 pict "99999.99"
@ 12,41 get datav2
@ 13,18 get summa3 pict "99999.99"
@ 13,41 get datav3
@ 14,18 get summa4 pict "99999.99"
@ 14,41 get datav4
@ 18,18 get codbnk
read
if readkey()=12 .or. readkey()=262
retu
endi

***********************
procedure wowsan23
@ i, 0 get delo pict "99999"
f0=NamPNS
@ i, 6 get f0
@ i,25 get datav1
@ i,36 get summa1 pict "999999.99"
@ i,46 get vidtr1
@ i+1,46 get vidtr2
@ i,55 get inv_
@ i,65 get texosm1
*@ i+1,65 get texosm2
   read
return
*****************************
procedure vvod
i=in+2
@ i  , 0 SAY "     �                �          �         �                                    "
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
set color to r+/n
  @ row()-1 ,10 say "  ��� ���� ⠪�� ���ᨮ���,����� �� ���� ! "
  wait ""
set color to
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
a1=adres1
a2=adres2
sele 2
appe blank
repl delo with d,catinv with cart->catinv,grpinv with cart->grpinv,NamPns with f0,;
adres1 with a1,adres2 with a2,TEXOSM1 with TEX1,TEXOSM2 with TEX2,inv_ with inv,vidtr1 with vid1,vidtr2 with vid2,;
codbnk with cart->codbnk
DO RAM WITH 3,7,20,70
do oknoget
do oknosay

 else
   @  i,10 say " �訡��� ����p    "
   sele 2
  endif
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
@ 8 ,L SAY "� �⮣� ��� ���᫥�� �"
@ 9 ,L SAY '� ᯨ��: �           �'
@ 10,L SAY '���������������������͹'
@ 11,L SAY '�         �           �'
@ 12,L SAY '�         �           �'
@ 13,L SAY '�         �           �'
@ 14,L SAY '�����������������������'
count to su  for .not. deleted()
count to su0  for .not. deleted() .and. summa1+summa2+summa3+summa4#0
sum summa1+summa2+summa3+summa4 to su1
@ 12,L+2 say str(su,3)+" 祫."
@ 13,L+2 say str(su0,3)+" 祫."
@ 13,L+11 say str(su1,11,2)
go z
wait ""
set color to n/w
restore screen from e
retu
