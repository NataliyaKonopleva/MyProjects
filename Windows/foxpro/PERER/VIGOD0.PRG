set talk off
minp=63250
*sele 2
*use vig
sele 1
use kart
set filt to kodpens="1" .and. prichwib=" " .and. kodinv$"01,02"
go top
set devi to print
do while .not. eof()
  do case
   case kodinv$"01" .or. year(datar)<=1915
    itp=round(sumras*0.85+minp*4,0)
   case kodinv$"02"
    itp=round(sumras*0.85+minp*3,0)
  endcase
    if itp>itpens
     @ prow()+1,1 say str(delo,5)+substr(fam,1,35)+str(itpens,10,0)+str(itp,10,2)+"  "+kodbank
    endif
skip
enddo
set devi to scre
