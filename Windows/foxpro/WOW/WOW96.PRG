** ����� ᯨ᪠ ���p����  � ��᪢�
set devi to scree
set talk off
set date germ
set color to
clea
set color to r+/n
@ 24,35 say "ESC - ��室"
sele 2
use wow96
if .not. file("wow96f.ndx")
 inde on fam to wow96f
endif
use wow96 inde wow96f     &&(�� ���)
sele 2
go top
store 1 to l1,l
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
@ prow(),53 say 'x1k0'
m=prow()
@ M  ,47SAY "E���������F"
@ M+2,47 SAY "��砫쭨� ��� �p�c���᪮� ���."
@ M+3,47 SAY "����p��-����p ����樨                         "
@ M+4,47 SAY "                 �.�.��p����  "
m=prow()
@ M+1,20 SAY "      � � � � � �       "
@ M+3,24 SAY '-1���ᨮ��஢ ��� �p�᫠�᪮� ���.-0'
@ M+5,18 SAY '-1-���࠭�� ������� ����⢥���� ����� 1941-1945 ��.-0x1k0'
endif
M=PROW()+1
endif
SET DEVI TO print
M=PROW()
@ prow(),0 say "   M  "
*x1k0
m=prow()
@ m+1, 0 say "����������������������������������������������������������������������������������������Ŀ"
@ m+2, 0 say "�    �                         �                                      ��������- �  ���   �"
@ m+3, 0 say "� N  �  �������, ���, �������� �        ����譨� ��p��,⥫�䮭        ������    �p�������"
@ m+4, 0 say "��/� �     N ���ᨮ����� ����  �                                      �         �        �"
@ m+5 ,0 say "����������������������������������������������������������������������������������������Ĵ"
if l#l1 .and. l#1
go top
y=(l-2)*18+15
skip y
endif
i=1
q="�"
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
j=at(" ",fam)
fa1=substr(fam,1,j-1)
fa2=substr(fam,j,len(fam)-j)
fa2=trim(fa2)
************
r=kodinv
inv="        "
do case
   case r$"01 02 03"
     inv=substr(r,2,1)+" �p.���"
   case r$"04 05 06"
     inv=str(val(kodinv)-3,1)+" �p.���"
   case r$"07 08 09"
     inv=str(val(kodinv)-6,1)+" �p.�� "
   case r$"10 11 12"
     inv=str(val(kodinv)-9,1)+" �p.�� "
endcase
*********
@ m,0  SAY q+str(Np,4)+q+fa1+space(20-len(fa1))+str(delo,5)+q+adres1+q+" "+inv+q+str(year(datar),4)+"�.p."+q
@ m+1,0 say q+"    "+q+fa2+space(25-len(fa2))+q+adres2+q+"         "+q+space(8)+q
if i=ip   .or. eof()
@ m+2 ,0 say "������������������������������������������������������������������������������������������"
else
@ m+2 ,0 say "����������������������������������������������������������������������������������������Ĵ"
endif
i=i+1
skip
 if eof()
 @ m+5,4  say '��砫쭨� ���                                        ���믨� �.�.'
 @ m+8,4  say '��砫쭨� ���ᨮ����� ����⤥��                      ������ �.�'
 @ m+11,4  say "6 ��५� 1996 �."
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