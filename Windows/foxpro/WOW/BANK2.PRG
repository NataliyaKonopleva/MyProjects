* ���᮪ �� ������ (ᥬ�) - � �����⮩
sele 1
if .not. file("kart1.ntx")
inde on delo to kart1
endif
use kart inde kart1
sele 5
use bank
set devi to screen
set date germ
sele 2
seek kb
store 1 to lis1,lis
do while .t.
set devi to scre
@ 12,20 say "����p ����          =>" get lis pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
if lis#lis1
  seek kb
 j=0
 do while j<(lis-1)*18
   d=delo
   sele 1
   seek d
  if prichwib=" "
   j=j+1
  endif
  sele 2
  skip
 enddo
endif
np=(lis-1)*18
set devi to print
*if lis=1
* m=prow()
* @ m,0 say " "
* *@ m,10 say "E��p�p���� � 1 ﭢ�p� 1994 �."
* @ prow()+2,10 say ""
*endif
@ prow(),2 say "  "
@ prow(),2 say "M"
@ prow(),2 say nb
@ prow(),50 say vid
@ prow(),40 say "-"+ltrim(str(lis,2))+"-M"
m=prow()+2
q="|"
@  m  ,0 say "------------------------------------------------------------------------------------"
@  m+1,0 say "|N   |  N  |   �������, ��� ,����⢮          | �����p   |������   |�㬬� ����.��|"
@  m+2,0 say "|�/� |����.|      ���ᨮ��p�                   | ���ᨨ   |�� IX,X,XI|�����p� � ���|"
@  m+3,0 say "|    |���� |                                   | c 1.09.95|   1995 �.| �� IX,X,XI  |"
@  m+4,0 say "|----|-----|-----------------------------------|----------|----------|-------------|"
m=prow()+1
i=1
do while .not. eof() .and. i<=18 .and. kodbank=kb
ndb=""
sele 1
seek poluch->delo
if prichwib=" "
 sele 2
if srwipl1>ctod("01.09.95")
@ m-1,48  say "ES1� "+dtoc(srwipl1)+"TFM"
*@ m,85  say "E� "+dtoc(srwipl1)+"F"
endif
@ m,0   say "M"+q+str(np+i,4)+q+str(delo,5)+q+substr(fam,1,35)+q+str(itpens,10,2)+q+str(dopl,10,2)+q+str(vsego,13,2)+q
 cifra=vsego
 do perev1
@ m+1,0 say "|          |"+sos1+space(71-len(sos1))+q
@ m+2,0 say "|----|-----|-----------------------------------|----------|----------|-------------|"
 m=prow()+1
 i=i+1
endif
sele 2
 skip
enddo
if eof() .or. kodbank#kb
 sum itpens,dopl,vsego to v1,v2,v for kodbank=kb .and. prichwib=" "
 cifra=v
 m=prow()+1
@ m,0   say "|�����:    |"+space(36)+str(v1,10,1)+q+str(v2,10,1)+q+str(v,13,2)+q
@ m+1,0 say "------------------------------------------------------------------------------------"
 do perev1
set devi to scree
@ 18,0 get sos1
read
set devi to print
 @ prow()+2, 2 say sos1
  z=iif(i<16,3,2)
 @ prow()+z, 5 say "��砫쭨� ��� ��� �p.���.:                            ���믨� �.�"
 @ prow()+z, 5 say "��砫쭨� ���ᨮ����� ����⤥��:                      ������ �.�."
endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
