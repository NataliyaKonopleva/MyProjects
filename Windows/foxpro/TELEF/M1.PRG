*-----------M1.PRG------21.08.90-------------------------------------
PARAMETERS A,B,H,R
PUBLIC G
G=A
DO WHILE G<=B
K=LTRIM(STR(G))
@ G,R SAY M&K
G=G+H
ENDDO
G=A
DO WHILE .T.
K=LTRIM(STR(G))
@ G,R GET M&K
Y=0
DO WHILE Y=0
Y=INKEY()
ENDDO
@ G,R SAY M&K
DO CASE
   CASE Y=24 .AND. G#B
    G=G+H
   CASE Y=5 .AND. G#A
    G=G-H
   CASE Y=5 .AND. G=A
    G=B
   CASE Y=24 .AND. G=B
    G=A
   CASE Y=13
    EXIT
   case y=6        && END
    QUIT
   case y=27       && ESC
    g=27
    exit
   case y=28       && F1
    g=28
    exit
ENDCASE
ENDDO
CLEA GETS
RETURN
