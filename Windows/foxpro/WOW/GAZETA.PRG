** ����� ᯨ᪠ �� ��������
set devi to scree
set talk off
set date germ
set color to
clea
set color to r+/n
@ 24,35 say "ESC - ��室"
sele 5
*use c:\pens01.96\bank
sele 2
use gazeta
if .not. file("gazeta.ndx")
 inde on delo to gazeta
endif
use gazeta inde gazeta
kb="  "
ra=" "
nb="                        p����"
set devi to scre
*@ 12,20 say "������ ��� ����� => " get kb pict "99"
*@ 14,20 say "�����             => " get ra pict "9"
*@ 16,20 get nb
*read
clea
if readkey()=12 .or. readkey()=262
  retu
endif
*sele 5
*go top
*loca for kod=kb
*nb=iif(found(),trim(name)+" p����"," ")
*go top
*clea
sele 2
*set filt to kodbank=kb
*set filt to raion=ra
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
m=prow()
*sele 5
*go top
*loca for kod=kb
*nb=iif(found(),trim(name)+" p����"," ")
*go top
*clea
sele 2
*set filt to kodbank=kb
*set filt to raion=ra
*go top
*@ prow(),50 say "E"+nb+"F"
m=prow()+1
@ M+1,20 SAY "  w1   ������ w0 M"
@ M+3,5  SAY '4-1-���ᨮ��஢ ��� �p�᫠�᪮� ���., ������ ���������� ����� � ��� 22 ����-0'
@ M+4,3  SAY '-1� �����, 㢮������ �� �������,�������,��࠭�祭���� ���ﭨ ���஢�� ��� ᮪�饭��-0'
@ M+5,4  SAY '-1��⮢, ���� ������ ������������,�易���� � �ᯮ������� �㦥���� ��易����⥩ -0P5'
  endif
M=PROW()+1
endif
SET DEVI TO print
M=PROW()
@ prow(),0 say "     "
m=prow()+1
@ m  , 0 say "---------------------------------------------------------------------------------------------------------------------------------"
@ m+1, 0 say "| N  |  �������, ���, �������� |        ����譨� ��p��,⥫�䮭     |                       ���������                            |"
@ m+2, 0 say "|�/� |     N ���ᨮ����� ����  |                                   |                                                            |"
@ m+3 ,0 say "|----|-------------------------|-----------------------------------|------------------------------------------------------------|"
if l#l1 .and. l#1
go top
y=(l-2)*30+25
skip y
endif
i=1
q="|"
ip=iif(l=1,25,30)
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
np=iif(l=1,i, (l-2)*30+i+25)
sele 2
j=at(" ",fam)
fa1=substr(fam,1,j-1)
fa2=substr(fam,j,len(fam)-j)
fa2=trim(fa2)
************
@ m,0  SAY q+str(Np,4)+q+fa1+space(20-len(fa1))+str(delo,5)+q+adres1+q+dolgn+q
@ m+1,0 say "-1"+q+"    "+q+fa2+space(25-len(fa2))+q+adres2+"|"+space(60)+q+"-0"
if i=ip   .or. eof()
@ m+2 ,0 say "--------------------------------------------------------------------------------------------------------------------------------"
else
*@ m+2 ,0 say "|----|-------------------------|-----------------------------------|-----------------------------------------------------------|"
endif
i=i+1
skip
if eof()
m=prow()+1
*@ prow() ,0 say "                                                                             |"+str(w,8,0)+"|"
 @ m+3,4  say '��砫쭨� ���                          ___________   ���믨� �.�.'
 @ m+6,4  say '��砫쭨� ���ᨮ����� �⤥�����        ___________   ������ �.�'
 @ m+9 ,4  say "4 ����� 1996 �."
endif
m=m+2
enddo
l=l+1
l1=l
loop
enddo
