* Список по банкам (семьи) - с доплатой
set devi to screen
set date germ
sele 1
seek str(kb,2)+"4"
store 1 to lis1,lis
do while .t.                               &&1
set devi to scre
@ 12,20 say "Номеp листа          =>" get lis pict "99"
read
if readkey()=12 .or. readkey()=262
  retu
endif
if lis#lis1
  seek kb1
 j=0
 do while j<(lis-1)*18
********************
 if codlea=0 .and. itgpns#itgpns0 .and. codbnk=kb
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
@  m  ,0 say "------------------------------------------------------------------------------------"
@  m+1,0 say "|N   |  N  |   Фамилия, имя ,отчество          | Размеp   |Доплата   |Сумма пенс.за|"
@  m+2,0 say "|п/п |пенс.|      пенсионеpа                   | пенсии   |за октябрь|ноябрь с допл|"
@  m+3,0 say "|    |дела |                                   | c 1.10.97|   1997 г.|за октябрь   |"
@  m+4,0 say "|----|-----|-----------------------------------|----------|----------|-------------|"
m=prow()+1
i=1
do while .not. eof() .and. i<=18 .and. codbnk=kb
ndb=""
if itgpns#itgpns0 .and. codlea=0
if begpay>ctod("01.10.97")
@ m-1,48  say "ES1С "+dtoc(begpay)+"TFM"
*@ m,85  say "EС "+dtoc(srwipl1)+"F"
endif
itgpns_=iif(polpns,itgpns*(numdep+1),itgpns*numdep)
itgpns0_=iif(polpns,itgpns0*(numdep+1),itgpns0*numdep)
dopl_=itgpns_-itgpns0_
vsego_=itgpns_+dopl_
@ m,0 say  "M"+q+str(np+i,4)+q+str(delo,5)+q+substr(nampns,1,35)+q+str(itgpns_,10,0)+q+str(dopl_,10,0)+q+str(vsego_,13,2)+q
 cifra=vsego_
 do perev1
@ m+1,0 say "|          |"+sos1+space(71-len(sos1))+q
@ m+2,0 say "|----|-----|-----------------------------------|----------|----------|-------------|"
 m=prow()+1
 i=i+1
endif                  &&
 skip
enddo
if eof() .or. codbnk#kb
* sum itgpns*numdep,dopl,vsego to v1,v2,v for codbnk=kb .and. codlea=0 .and. itgpns#itgpns0
seek kb1
**********
store 0 to v1,v2,v
do while .not. eof() .and. str(codbnk,2)+str(vidpns,1)=kb1
if codlea=0 .and. itgpns#itgpns0
itgpns_=iif(polpns,itgpns*(numdep+1),itgpns*numdep)
itgpns0_=iif(polpns,itgpns0*(numdep+1),itgpns0*numdep)
dopl_=itgpns_-itgpns0_
vsego_=itgpns_+dopl_
v1=v1+itgpns_
v2=v2+dopl_
v=v+vsego_
endif
skip
enddo
***************
 cifra=v
 m=prow()+1
@ m,0   say "|ВСЕГО:    |"+space(36)+str(v1,10,1)+q+str(v2,10,1)+q+str(v,13,2)+q
@ m+1,0 say "------------------------------------------------------------------------------------"
 do perev1
set devi to scree
@ 18,0 get sos1
read
set devi to print
 @ prow()+2, 2 say sos1
  z=iif(i<16,3,2)
 @ prow()+z, 5 say "Начальник ФЭО УВД Яp.обл.                             Засыпин В.Н"
 @ prow()+z, 5 say "Начальник пенсионного отделения                       Алиева Н.Х."
endif
@ prow(),50 say ""
lis1=lis+1
lis=lis+1
enddo
