* ���᮪ �� ������ (ᥬ�) - � �����⮩
set devi to screen
set date germ
sele 1
seek str(kb,2)+"4"
store 1 to lis1,lis
do while .t.
set devi to scre
@ 12,20 say "����p ����          =>" get lis pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
if lis#lis1
  seek kb1
 j=0
 do while j<(lis-1)*18
********************
 if codlea=0 .and. begpay>=ctod("01.12.97") .and. codbnk=kb
 j=j+1
 endif
  skip
 enddo
endif
np=(lis-1)*18
set devi to print
@ prow(),2 say "  "
@ prow(),2 say "M"
@ prow(),2 say nb
@ prow(),50 say vid
@ prow(),40 say "-"+ltrim(str(lis,2))+"-M"
m=prow()+2
q="|"
@  m  ,0 say "-----------------------------------------------------------------------------------"
@  m+1,0 say "|N   |  N  |   �������, ��� ,����⢮          |                                  |"
@  m+2,0 say "|�/� |����.|      �������p�                    |  �����p ���ᨨ c 1 ������� 1997  |"
@  m+3,0 say "|    |���� |                                   |                                  |"
@  m+4,0 say "|----|-----|-----------------------------------|----------------------------------|"
m=prow()+1
i=1
do while .not. eof() .and. i<=18 .and. codbnk=kb
ndb=""
if codlea=0 .and. begpay>=ctod("01.12.97")
if begpay>ctod("01.12.97")
@ m-1,48  say "ES1� "+dtoc(begpay)+"TFM"
endif
itgpns_=iif(polpns,itgpns*(numdep+1),itgpns*numdep)
@ m,0 say "M"+q+str(np+i,4)+q+str(delo,5)+q+substr(nampns,1,35)+q+"w1"+str(itgpns_,10,0)+space(7)+"w0"+q
cifra=itgpns_
 do perev1
@ m+1,0 say "|          |"+sos1+space(70-len(sos1))+q
@ m+2,0 say "|----|-----|-----------------------------------|----------------------------------|"
 m=prow()+1
 i=i+1
endif
 skip
enddo
if eof() .or. codbnk#kb
seek kb1
**********
store 0 to v
do while .not. eof() .and. str(codbnk,2)+str(vidpns,1)=kb1
if codlea=0 .and. begpay>=ctod("01.12.97")
itgpns_=iif(polpns,itgpns*(numdep+1),itgpns*numdep)
v=v+itgpns_
endif
skip
enddo
***************

 cifra=v
 m=prow()+1
@ m,0   say "|�����:    |"+space(36)+"w1"+str(v,10,0)+space(7)+"w0"+q
@ m+1,0 say "-----------------------------------------------------------------------------------"
 do perev1
set devi to scree
@ 18,0 get sos1
read
set devi to print
 @ prow()+2, 2 say sos1
  z=iif(i<16,3,2)
 @ prow()+z, 5 say "��砫쭨� ��� ��� �p.���.:                            ���믨� �.�"
 @ prow()+z, 5 say "��砫쭨� ���ᨮ����� �⤥�����:                      ������ �.�."
 @ prow()+1, 5 say " "
endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
