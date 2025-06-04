*   ……‚„ —‘‹ -‘‚‹,¤«ο ζ¥«λε,6 §­ η. ζ¨δp.
*          06.02.90
*
***********************************
publ SLOVO0,SLOVO,SLOVO1,sos1
sos10=""
if cifra>1000000
  sos10=""
 cifra1=mod(cifra,1000000)           &&   εΆ®αβ
 cifra2=(cifra-cifra1)/1000000       &&  ¬¨««¨®­λ
c2= ltrim(trim(str(cifra2,0)))             &&  ¬¨««¨®­λ
*c2= ltrim(trim(str(cifra2)))             &&  ¬¨««¨®­λ
 cifra=cifra2
do perev
mi=""
 pc=val(substr(c2,len(c2),1))
 do case
    case pc=1 .and. cifra2#11
        mi=" ‹‹ "
    case (pc>1 .and. pc<5) .and. cifra2#13 .and. cifra2#14 .and. cifra#12
        MI=" ‹‹€ "
    case (pc>=5 .or. pc=0) .or. cifra2>10
        mi=" ‹‹‚ "
 endcase
  SOS10=ltrim(RTRIM(SLOVO0))+" "+RTRIM(SLOVO)+" "+trim(RTRIM(SLOVO1))+mi
  cifra= cifra1               &&  εΆ®αβ
do perev
  SOS2=sos10+ltrim(sos1)
  sos1=ltrim(sos2)
 else
  do perev
endif
RETURN
