use cherni
set talk off
publ cifra,sos1
sum posob to w
CIFRA=W
DO PEREV1
clea
@  10,3 get sos1
read
l=1
do while .t.
SET DEVI TO SCREEN
@  3,15 SAY "����=>     " get l pict "9"
read
if readkey()=12 .or. readkey()=262
retu
endif
go top
SET DEVI TO PRINT
M=PROW()
if l=1
@ M  ,75 SAY "E���������F"
@ M+1,75 SAY "��砫쭨� ��� �p�c���᪮� ���."
@ M+2,75 SAY "����p��-����p ����樨       "
@ M+3,75 SAY "E                �.�.��p����  "
M=PROW()+2
@ M,45 SAY "  ��������� "
@ M+2,15 SAY "�� ������ ��������������� ������� ����������� ��� ����������� ��� - ��������� "
@ M+4,27 SAY "        ���������� ������ �� ������������� ���. F"
@ M+7, 1 SAY "M�᭮�����: �ᯮ�殮��� �ࠢ�⥫��⢠ �� �� 21.03.1996 �.N 412"
endif
M=pROW()+1
@ M,0 SAY "M"
@ m+1, 0 say "������������������������������������������������������������������������������������������������������������������������������Ŀ"
@ m+2, 0 say "�   �                                 �����p�                                                            �  �㬬�   �          �"
@ m+3, 0 say "� N �     �������, ���, ��������      �����.�          ��������� ��������� �� ����������                 �  ��ᮡ�� �          �"
@ m+4, 0 say "�   �                                 ����� �                        �����                               �          �          �"
@ m+5 ,0 say "������������������������������������������������������������������������������������������������������������������������������Ĵ"
*                   1    6                                        47    53                                                          114      123
GO (l-1)*40+1
i=1
q="�"
m=prow()+1
do while .not. eof() .and. i<=20
np=(l-1)*20+i
@ m,0 SAY q+str(Np,3)+q+SUBSTR(fam,1,33)+q+str(delo,5)+q+dolgn+q+str(posob,10,2)+q
@ m+1, 0 say "�   �                                 �     �                                                            �          �          �"
in=iif(kodinv#"  ","������� "+ str(val(kodinv)-3,1)+"��.����","")
@ m+1, 6 say in+","+substr(namzwan,1,12)
@ m+1,45 say adres1+adres2
@ m+2 ,0 say "������������������������������������������������������������������������������������������������������������������������������Ĵ"
i=i+1
skip
if eof()
i=prow()+1
@ i, 106 say str(w,10,2)+q+SPACE(10)+Q
@ i, 0 say   "�                        � � � � �:           " +SOS1
@ i+1 ,0 say "��������������������������������������������������������������������������������������������������������������������������������"
endif
m=m+3
enddo



@ m+3,30 say "��砫쭨� ��� ���                                    �.�.���믨�"
@ m+6,30 say "��砫쭨� ���ᨮ����� ����⤥��                      �.�.������ "
@ m+9,30 say " 24.04.1996 ����                                "
return
endif
loop
enddo
 **********
set devi to print
n=0
do while .not. eof()
in=iif(kodinv#"  ","������� "+ substr(str(val(kodinv)-3,1),2,1)+"��.����","")
n=n+1
 @ PROW()+2,1 SAY str(n,2)+". N/"+str(delo,5)+" "+fam+in
 @ PROW()+1,1 SAY dolgn+"  "+namzwan
 @ PROW()+1,1 SAY adres1+adres2
 @ PROW()+1,1 SAY "����� �����祭� � "+dtoc(pennazn)+" �."
skip
enddo
