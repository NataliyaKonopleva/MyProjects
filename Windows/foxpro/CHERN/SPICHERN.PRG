use chern
set talk off
set color to w/b
@ 16,16 say "                            "
y=0
do while y=0
 y=inkey()
enddo
if y=27
  retu
endif
set devi to file sp
n=0
do while .not. eof()
*in=iif(kodinv#"  ","������� "+ substr(str(val(kodinv)-3,1),2,1)+"��.���","")
*if grp>0
in=iif(grp#0,"������� "+ str(grp,1)+"��.����","")
n=n+1
 @ PROW()+1,1 SAY str(n,2)+". N/"+str(delo,5)+" "+fam+in+str(avar,5)+"�"
* @ PROW()+1,1 SAY dolgn+"  "+namzwan
* @ PROW()+1,1 SAY adres1+adres2
* @ PROW()+1,1 SAY "����� �����祭� � "+dtoc(pennazn)+" �."
*endif
skip
enddo
set devi to scre
