* ������� ��ᯥ���
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
inv="������� "
do case
   case cat=1
inv=inv+"��� "+str(grp,1)+" �p㯯�"
   case cat=2
inv=inv+str(grp,1)+" �p.�����.�p� �ᯮ������ �㦥�.��易����⥩"
   case cat=3
inv=inv+str(grp,1)+" �p. �� �����������,�易����� � �p�宦�.�㦡�"
   case cat=4
inv=inv+str(grp,1)+" �p㯯� �� ��饣� �����������"
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