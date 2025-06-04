set talk off
minp=63250
*sele 2
*use vig
sele 1
use kart
set filt to kodpens="2" .and. prichwib=" " .and. kodinv$"01,02" .and. ;
val(substr(wslgt,1,2))>=20
go top
set devi to print
do while .not. eof()
  do case
   case kodinv$"01" .or. year(datar)<=1915
    itp=round(sumras*(3*val(substr(wslgt,1,2))-10)/100+5*minp,0)
    if itp>itpens
     @ prow()+1,1 say str(delo)+substr(fam,1,35)+str(itpens,10,0)+str(itp,10,2)+"  "+kodbank
    endif
   case kodinv$"02"
    itp=round(sumras*(3*val(substr(wslgt,1,2))-10)/100+4*minp,0)
    if itp>itpens
     @ prow()+1,1 say str(delo)+substr(fam,1,35)+str(itpens,10,0)+str(itp,10,2)+"  "+kodbank
    endif
  endcase
skip
enddo
set devi to scre
