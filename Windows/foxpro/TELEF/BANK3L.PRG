*  ���᮪ ᠭ����� �� ������
*  sp=1 - ����� ᯨ᪠     sp=0 - ��ࠡ�⪠ ������᪮�� ���誠 ᯨ᪠
PARAMETERS  sp
save scre to ek1
set devi to screen
set cent on
sele 4
               set inde &kin4,&kin2,&kin3,&kin1
             kkk=100
             chap=1
 do while .t.                                      &&1
               do sprbank
               SET COLOR TO w/n,b/w
               @ 19,1 clea to 19,78
                 sele 4
                 if kkk="0"
                     RETU
                 ENDI
                      seek kkk
                     if .not. found()
                        @ 19,30 say "��������� �� �뤠������"
                       wait ""
                       loop
                      endi
************
store 0 to kol_,de,V
IF SP=1
do while .not. eof() .and. str(kodbank,2)=kkk
if " "=kassa
kol_=kol_+1
de=delo
pz=recno()
v=v+summav
endif
skip
enddo
@ 18,20 say "� ᯨ᪥ �㤥� "+ltrim(str(kol_))+" 祫. -" +str(v,10,2)+"��."
if kol_=0
 loop
endi
endif
kb=val(kkk)
nb=trim(bank->nambnk)+" ᡥࡠ��"
***********
if sp=0
    do korech
    loop
endif
do while .t.
set devi to scre
M20="  ����� ᯨ᪠                 "
M21="  ���஢�������� � ᡥࡠ��     "
M22="  ��ࠡ�⪠ ᯨ᪠ ��᫥ ���� "
do M1 WITH 20,22,1,20
  if G=27
   exit
  endif
do case
   case g=20
    do spisok
   case g=21
    do sopr
   case g=22
    do Spisok_
endcase
enddo                 && �� ��஬� ����
enddo
**********************************
procedure sopr
set devi to print
@ prow(),1 say  "  "
sele 4
seek str(kb,2)
m=prow()
@ m+1,4 say   bank->nambnk+" ᡥࡠ�� "
@ m+1,45 say "���ᨮ��� �⤥� ��� ��"
@ m+2,4  say "�� N____�� "+sysd
@ m+2,45 say "150000 �.�p�᫠��� "
@ m+3,45 say "�.���㡫����᪠�,23"
@ prow()+2,10 say "�믫�� �������樨 �� ᠭ��୮-����⭮� ��祭�� �� "+str(gg1,4)+" ��� "
@ prow()+1, 5 say " �ந������� '_____' __________ "+str(gg1,4)+" �. � ᮮ⢥��⢨� � ᯨ᪮�"
i=1
*@ prow(),0 say "   "

*@ prow()+1,0 say "&l26A"
*@ prow(),0 say "&l0O"
*@ prow(),0 say "(3R"
*@ prow(),0 say "(s0p#15.00#h#12.0#v0s0b0T"

m=prow()+2
do while .not. eof() .and. kodbank=kb
a=0
do while a<=2 .and. .not. eof() .and. kodbank=kb
if kassa=" "
 @ m,a*40 say str(i+a,3)+".48/"+str(delo,5)+" "+substr(fam,1,at(" ",fam))+space(14-at(" ",fam))+str(summav,8,2)
 a=a+1
endif
skip
enddo
m=m+1
i=i+3
enddo
@ prow()+2, 5 say " "
@ prow()+2, 6 say "�.�.        ��砫쭨� "
@ prow()+2, 6 say "            ��壠���"
set devi to scre
retu
**********************************
procedure spisok_
D0=date()
seek str(kb,2)
do while .not. eof() .and. kodbank=kb
if " "=kassa
repl kassa with "�",datapom with  d0
endif
skip
enddo
retu
**********************************************
procedure korech
store ctod("  .  .  ") to dn,dk
kolvsp=0
@ 18,15 say "��� ᯨ᪠: " get dN
@ 18,40 say "��� �뤠�: " get dk
read
if readkey()=12 .or. readkey()=262
 retu
endif
seek str(kb,2)
do while .not. eof() .and. kodbank=kb
if  datapom=dn .and. kassa="�" .and. datapom1=ctod("  .  .  ")
repl datapom1 with dk
kolvsp=kolvsp+1
endif
skip
enddo
@ 19,15 say kolvsp pict "9999"
retu
**********************************
procedure spisok
sele 4
seek str(kb,2)
store 1 to lis1,lis
do while .t.                                            &&3
set devi to scre
set color to w/n
chap=1
@ 18,20 say "����p ����          =>" get lis pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
if lis#lis1
  seek str(kb,2)
 j=0
 do while j<(lis-1)*16
   j=iif(kassa=' ',j+1,j)
  skip
 enddo
endif
np=(lis-1)*16
set devi to print
@ prow(),1 say " "
if lis=1
sele 4
m=prow()
@ m+1,4 say   "  ���������� ���������� ���             "+nb
*@ m+1,45 say repl("_",len(nb))
@ m+2,4 say "    ����������� �������   "
@ m+3,45 say bank->adres1
@ m+3,4 say "      150000,�.�p�᫠���"
@ m+4,4 say "   �.���㡫����᪠�,23 "
@ m+4,45 say bank->adres2
@ m+5,4 say "   "+sysd
@ m+5,4 say "   _________________ "
@ m+6,4 say "         10/"
@ prow()+2,20 say "      ���᮪ ���ᨮ��஢ ��� �믫��� �������樨"
@ prow()+1,20 say "     �� ᠭ��୮-����⭮� ��祭�� �� "+str(gg1,4)+" ��� "
else
@ prow()+1,30 say "-"+ltrim(str(lis,2))+"-"
m=prow()+2
endi
m=prow()+1
q="|"
t=2
@  m  ,t say "--------------------------------------------------------------------------"
@  m+1,t say "|N   |  N  |   �������, ��� ,����⢮          |                         |"
@  m+2,t say "|�/� |����.|      ���ᨮ��p�                   | �����p �������樨 ��   |"
@  m+3,t say "|    |���� |                                   |   ᠭ.-���.  ��祭��    |"
@  m+4,t say "|----|-----|-----------------------------------|-------------------------|"
m=prow()+1
i=1
do while .not. eof() .and. i<=16 .and. kodbank=kb
ndb=""
if kassa=" "
cifra=summav
do perev1
@ m, t   say q+str(np+i,4)+q+str(delo,5)+q+substr(fam,1,35)+q+str(summav,10,2)+space(15)+q

@ m+1,t say "|          |"+lower(sos1)+space(61-len(sos1))+q
@ m+2,t say "|----|-----|-----------------------------------|-------------------------|"
m=prow()+1
i=i+1
************
if recno()=pz
  chap=0
endif
************
endif
skip
ENDDO
if eof() .or. kodbank#kb .or. chap=0
  cifra=v
 m=prow()+1
@ m,t   say "|�����:    |"+space(36)+str(v,10,2)+space(15)+q
@ m+1,t say "--------------------------------------------------------------------------"
  do perev1
ss=2
 @ prow()+2, ss say sos1
if len(sos1)>=85
@ prow(),1 say "     "
endi
  z=iif(i<14,3,2)
 @ prow()+z, 5 say "��砫쭨� ��� ��� ��:                                 ���믨� �.�"
 @ prow()+z, 5 say "��砫쭨� ���ᨮ����� �⤥��:                         ������ �.�."
 endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
set devi to scre
retu
