set devi to scre
set date germ
set proce to spichen
set talk off
set color to w/b
@ 16,16 say "�� ������ ������� �ਭ��!"
use chechen
y=0
do while y=0
 y=inkey()
enddo
if y=27
  retu
endif
set devi to print
n=0
@ prow(),3 say "E���᮪ ���ᨮ��஢ ��� ��, ��室������ � ���� ���䫨��"
@ prow()+2,35 say "(�����)F"
do while .not. eof()
****
j=(catinv-1)*4+1
categ=substr("��� ��� ��  �� ",j,4)
inv=iif(grpinv>0 .and. grpinv<=3,str(grpinv,1)+"��."+categ,"")
****
n=n+1
 @ PROW()+2,1 SAY str(n,2)+". N/"+str(delo,5)+" "+nampns+inv
 @ PROW()+1,1 SAY nampst
* @ PROW()+1,1 SAY adres1+adres2
 @ PROW()+1,1 SAY "����� �����祭� � "+dtoc(pnsapp)+" �."
skip
enddo
set devi to scre
retu
*****

