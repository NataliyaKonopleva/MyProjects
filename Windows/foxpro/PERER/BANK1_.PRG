* ���᮪ �� ������
save scre to ek1
sele 5
use bank
set devi to screen
set date germ
   i=1
   l=0
do while .not. eof()
   if i>20
     i=1
     l=60
   endif
   @ i  ,l say kod+" "+trim(name)
   i=i+1
   skip
enddo
sele 1
go top
kb="  "
@ 12,20 say "������ ��� ����� => " get kb pict "99"
read
@ 0,0 clea to 23,19
rest scre from ek1
SET COLOR TO W/R ,R/W
   @ 10,12 say "���������������> ��ᯥ��뢠�� ᯨ᪨ <����������������ͻ"
   @ 11,12 say "�                                                       �"
   @ 12,12 say "�                                                       �"
   @ 13,12 say "�                                                       �"
   @ 14,12 say "�������������������������������������������������������ͼ"
set color to
if readkey()=12 .or. readkey()=262
  retu
endif
sele 5
go top
loca for kod=kb
nb=iif(found(),"� "+trim(name)+" ����"," ")
kb1=kb+kk
@ 2,30 Say nb
if kk="3"
  do bank2        && ᥬ�
  retu
endif
sele 1
seek kb1
store 1 to lis1,lis
do while .t.
set devi to scre
set color to w/r
@ 12,20 say "����p ����          =>" get lis pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
if lis#lis1
  seek kb1
 j=0
 do while j<(lis-1)*18
  if prichwib=" " .and. itpens#itpens0
   j=j+1
  endif
  skip
 enddo
endif
np=(lis-1)*18
set devi to print
*if lis=1
* m=prow()
* @ m,0 say " "
* @ prow()+2,10 say ""
*endif
@ prow(),1 say " "
@ prow(),2 say nb
@ prow(),45 say vid
@ prow(),30 say "-"+ltrim(str(lis,2))+"-M"
m=prow()+2
q="|"
@  m  ,0 say "----------------------------------------------------------------------------------------"
@  m+1,0 say "|N   |  N  |   �������, ��� ,����⢮          | �����p   |������   |�㬬� ���ᨨ ��  |"
@  m+2,0 say "|�/� |����.|      ���ᨮ��p�                   | ���ᨨ   |�� ��� ,  |��� � �����⮩  |"
@  m+3,0 say "|    |���� |                                   | c 1.05.96|��� 1996 | �� ���,��� 1996|"
@  m+4,0 say "|----|-----|-----------------------------------|----------|----------|-----------------|"
m=prow()+1
i=1
do while .not. eof() .and. i<=18 .and. kodbank+kodpens=kb1
ndb=""
if prichwib=" " .and. itpens#itpens0
if srwipl1>ctod("01.05.96")
@ m-1,48  say "ES1� "+dtoc(srwipl1)+"TFM"
*@ m,85  say "E� "+dtoc(srwipl1)+"FM"
endif
@ m,0   say q+str(np+i,4)+q+str(delo,5)+q+substr(fam,1,35)+q+str(itpens,10,2)+q+str(dopl,10,2)+q+str(itpens+dopl,13,2)+"    "+q
cifra=vsego
do perev1
@ m+1,0 say "|          |"+sos1+space(75-len(sos1))+q
@ m+2,0 say "|----|-----|-----------------------------------|----------|----------|-----------------|"
m=prow()+1
i=i+1
endif
 skip
enddo
if eof() .or. kodbank+kodpens#kb1
store 0 to v,v1,v2
seek kb1
 do while .not. eof() .and. kodbank+kodpens=kb1
  if prichwib= " " .and. itpens#itpens0
       v1=v1+itpens
       v2=v2+dopl
       v =v +vsego
  endif
skip
enddo
*sum itpens,dopl,vsego to v1,v2,v for prichwib=" " .and. kodbank+kodpens=kb1
  cifra=v
 m=prow()+1
@ m,0   say "|�����:    |"+space(36)+str(v1,10,0)+q+str(v2,10,0)+q+str(v,13,2)+"    "+q
@ m+1,0 say "----------------------------------------------------------------------------------------"
  do perev1
set devi to scree
@ 18,0 get sos1
read
ss=2
set devi to print
if len(sos1)>=85
@ prow(),1 say "E"
ss=8
endi
 @ prow()+2, ss say sos1
if len(sos1)>=85
@ prow(),1 say "FM"
endi
  z=iif(i<16,4,2)
 @ prow()+z, 5 say "��砫쭨� ��� ��� ��:                                 ���믨� �.�"
 @ prow()+z, 5 say "��砫쭨� ���ᨮ����� ����⤥��:                      ������ �.�."
 endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
