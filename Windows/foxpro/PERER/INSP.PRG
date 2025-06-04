* Фамилия инспектора
**********************************
function fio
parameter T,r
sele 6
use dan
fi_=""
go top
do while .not. T$uch .and. .not. eof()
 skip
enddo
if T$uch
  u=at(" ",im)
  u1=at(" ",substr(im,u+1,len(im)-u))
  fi=substr(im,1,u+1)+"."+substr(im,u+u1+1,1)+"."
endi
do case
case r=1
fi_=fi
case r=2
fi_=trim(im)
case r=0
fi_=trim(dol)
endcase
return fi_
************
function inval
parameters cat,grp
inv="Инвалид "
do case
   case cat=1
inv=inv+"ВОВ "+str(grp,1)+" гpуппы"
   case cat=2
inv=inv+str(grp,1)+" гp.получ.пpи исполнении служеб.обязанностей"
   case cat=3
inv=inv+str(grp,1)+" гp. от заболевания,связанного с пpохожд.службы"
   case cat=4
inv=inv+str(grp,1)+" гpуппы от общего заболевания"
   othe
inv=""
endcase
retu inv
************
function z
parameters x
x1=iif(x<10,"0"+str(x,1),str(x,2))
retu x1
