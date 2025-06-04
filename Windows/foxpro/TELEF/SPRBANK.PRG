****************  sprbank.prg ***********************
save screen to ekr0
nb=""
sele 8
use bank
go top
set color to bg+/b
@ 1,48 clea to 23,79
set color to gr+/b
@  1,48 SAY "ษออออออออออออออออออออออออออออออป"
I=2
DO WHILE I<24
@ I,48 SAY   "บ                              บ"
I=I+1
ENDDO
@ 24,48 SAY "ศออออออออออออออออออออออออออออออผ"
set color to bg+/b
y=0
do while y#27 .and. y#13
i=2
do while .not. eof() .and. i<=23
  @ i,53 say CODBNK PICT "99"
  @ i,57 say nambnk
i=i+1
skip
enddo
in=i-1
skip -(in-1)
i=2
dO WHILE .T.                                                                &&3
set color to b+/w
  @ i,53 say CODBnk PICT "99"
  @ i,57 say nambnk
y=0
 do while y=0
  y=inkey()
 enddo
set color to bg+/B
  @ i,53 say CODBNK PICT "99"
  @ i,57 say nambnk
  do case
   case y=27
     kkk="0"
     sele 5
restore scre from ekr0
     return
   case y=5 .and. i>2 .and. .not. bof()     && ขขฅเๅ
     i=i-1
     skip -1
   case y=24                 && ขญจง
    if i=in
set color to bg+/b
    @ 2,50 CLEA TO 23,78
     skip
      if eof()
        skip -(in-1)
      endi
    exit
    else
     i=i+1
     skip
    loop
   endif
   CASE Y=3                    && PgDn ขญจง
    skip (in-i)+1
    i=2
    IF EOF()
    skip -(in-i)-1
    LOOP
    ENDIF
set color to bg+/b
    @ 3,50 CLEA TO 23,78
    EXIT
   CASE Y=18 .and. .not. bof()
    SKIP -22-(I-2)
    if bof()
      go top
    endif
    i=4
    EXIT
   case y=13 .and. .not. eof()         && ข๋กฎเ
       kkk=str(codBnk,2)
       nb=nambnk
exit
endcase
enddo
enddo
set color to bg/n
 restore scre from ekr0
sele 5
return
