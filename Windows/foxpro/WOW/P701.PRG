** ����� ᯨ᪠ �ਪ�� 701
set devi to scree
set talk off
set date germ
set color to
clea
set color to r+/n
@ 24,35 say "ESC - ��室"
sele 2
use WOWISO
if .not. file("WOWISO.ndx")
 inde on NAMPNS to WOWISO
endif
use WOWISO inde WOWISO
clea
sele 2
go top
store 1 to l1,l
set filt to god =1996
*************************
go bott
 xxx=recno()
 go top
 if eof()
 set filt to
 loop
endi
***************************
do while .t.
SET DEVI TO SCREEN
@ 16,15 SAY "������ ����p ����=>     " get l pict "99"
read
if readkey()=12 .or. readkey()=262
retu
endif
set devi to print
if l=1
  go top
*@ prow(),53 say 'x1k0'
m=prow()
*@ prow(), 0 say "w1"+nb+"w0"
@ M  ,47SAY "E���������F"
@ M+2,42 SAY "��砫쭨� ��� ��� �p�c���᪮� ���."
@ M+3,42 SAY "��������� ��.�㦡�                           "
@ M+5,42 SAY "              w1�.�.���믨�   "
m=prow()
*M+1,18 SAY "     ������w0"
*@ M+2,15 SAY '-1���ᨮ��஢ ��� �p�᫠�᪮� ���.-0'
*@ M+3, 4 SAY '-1-��������� �� �᫠ ���࠭��,������ �ࠢ� �� �������� ��������� -0x1k0'
*@ M+4, 0 SAY '-1�� ᠭ��୮-����⭮� ��祭�� �� _________ ��. � ᮮ⢥��⢨� � ���⠭��������-0x1k0'
*@ M+5, 0 SAY '-1�ࠢ�⥫��⢠ �� �� 10.07.1995 �.N 701,�।�⠢���� ����室��� ���㬥��� -0x1k0'
@ M+1,20 SAY "     ������w0"
@ M+2,15 SAY '-1���ᨮ��஢ ��� �p�᫠�᪮� ���.-0'
@ M+3, 5 SAY '-1-��������� �� �᫠ ���࠭�� ��� �믫��� �������� �������樨 -0x1k0'
@ M+4, 5 SAY '-1�� ᠭ��୮-����⭮� ��祭�� �� E1996-1997 ��.F � ᮮ⢥��⢨� -0x1k0'
@ M+5, 8 SAY '-1� ���⠭�������� �ࠢ�⥫��⢠ �� �� 10.07.1995 �.N 701.-0x1k0'
  endif
M=PROW()+1
endif
SET DEVI TO print
M=PROW()
@ prow(),0 say "   M  "
*x1k0
m=prow()
@ m+1, 0 say " ---------------------------------------------------------------------------------------- "
@ m+2, 0 say "|    |                         |                                      |�������- |  �㬬� |"
@ m+3, 0 say "| N  |  �������, ���, �������� |        ����譨� ��p��,⥫�䮭        |�����    |        |"
@ m+4, 0 say "|�/� |     N ���ᨮ����� ����  |                                      |         |        |"
@ m+5 ,0 say "|-----------------------------------------------------------------------------------------"
if l#l1 .and. l#1
go top
y=(l-2)*18+15
skip y
endif
i=1
q="|"
ip=iif(l=1,15,18)
m=prow()+1
do while .not. eof() .and. i<=ip
*******************************
if recno()=xxx .and. i>=ip-2
 set devi to scree
   @ 23,10 say  "��⠢�� ���� ����  "
 wait""
 set devi to print
endif
*******************************
np=iif(l=1,i, (l-2)*18+i+15)
sele 2
j=at(" ",NamPNS)
fa1=substr(NAMPNS,1,j-1)
fa2=substr(nampns,j,len(nampns)-j)
fa2=trim(fa2)
************
r=catinv
inv="        "
do case
   case r=1
     inv=str(grpinv,1)+" �p.���"
   case r=2
     inv=str(grpinv,1)+" �p.���"
   case r=3
     inv=str(grpinv,1)+" �p.�� "
   case r=4
     inv=str(grpinv,1)+" �p.�� "
endcase
*********
@ m,0  SAY q+str(Np,4)+q+fa1+space(20-len(fa1))+str(delo,5)+q+" "+adres1+"  "+q+" "+inv+q+str(84.19*4,8,2)+q

@ m+1,0 say q+"    "+q+fa2+space(25-len(fa2))+q+" "+adres2+"  "+q+str(year(datbst),4)+"�.p. "+q+space(8)+q
if i=ip   .or. eof()
@ m+2 ,0 say "------------------------------------------------------------------------------------------"
else
@ m+2 ,0 say "|----|-------------------------|--------------------------------------|---------|--------|"
endif
i=i+1
skip
 if eof()
w=84.19*np
cifra=w
do perev1
set devi to scre
pro=sos1+space(20)
@ 16,2 say "�p������: " get pro
READ
clea
set devi to print
m=prow()+1
@ m, 0 say   "| �����: E "+pro +"F"
@ prow() ,0 say "                                                                                |"+str(w,8,2)+"|"
@ m+1 ,0 say "------------------------------------------------------------------------------------------"


 @ m+8,4  say '��砫쭨� ���ᨮ����� �⤥�����                      ������ �.�'
 @ m+11,4  say dtoc(date())+"��.P"
endif
m=m+3
enddo
l=l+1
l1=l
loop
enddo
*������ͻ   �����Ŀ    �����͸  �����ķ
*�   �  �   �  �  �    �  �  �  �  �  �
*������͹   �����Ĵ    �����͵  �����Ķ
*�   �  �   �  �  �    �  �  �  �  �  �
*������ͼ   �������    �����;  �����Ľ
