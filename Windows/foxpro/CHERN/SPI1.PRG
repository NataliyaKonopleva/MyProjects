use chern
set talk off
set color to w/b
@ 16,16 say "� ������ ������� �ਭ��!"
y=0
do while y=0
 y=inkey()
enddo
if y=27
  retu
endif
set devi to file chern_.txt
n=0
do while .not. eof()
*in=iif(kodinv#"  ","������� "+ substr(str(val(kodinv)-3,1),2,1)+"��.���","")
in=iif(grp#0,"������� "+ str(grp,1)+"��.����","")
n=n+1
dr=substr(dtoc(datar),1,6)+str(year(datar))+"�.�."
*dr=str(year(datar))+"�.�."
 @ PROW()+2,1 SAY str(n,2)+". N/"+str(delo,5)+" "+fam+dr+in
 @ PROW()+1,1 SAY dolgn+"  "+namzwan
 @ PROW()+1,1 SAY adres1+adres2
 @ PROW()+1,1 SAY "����� �����祭� � "+dtoc(pennazn)+" �."
skip
enddo
set devi to scre
