*     -,€«ο ζ₯«λε,6 §­ η. ζ¨δp.
*
SHAB1="H             "
SHAB2="       HH  H   H   H H   H  H   HH "
SHAB3="      K           H  "
SHAB4="H             "
SHAB5="                 "
STORE " " TO SLOVO0,SLOVO,SLOVO1,TIS0,TIS1,TIS2,TTTTT
     LL=1
     VVCIFR=CIFRA
     DDKOP  =SUBSTR(STR(CIFRA,9,2),8,2)
     promeg1=STR(VVCIFR,9,2)
     promeg2=SUBSTR(promeg1,1,6)
     ISXCH=LTRIM(PROMEG2)
STORE LEN(ISXCH) TO LENDD,LENDD1
     DO WHILE LENDD1>0
         IF SUBSTR(ISXCH,LENDD,1)#"0"
           SLOVO1=SUBSTR(SHAB1,(VAL(SUBSTR(ISXCH,LENDD,1))-1)*6+1,6)
         ENDIF
           IF SUBSTR(ISXCH,LENDD,1)="1"
             RUBLI=""
           ELSE
             NBB=VAL(SUBSTR(ISXCH,LENDD,1))
             RUBLI=IIF(NBB=0 .OR. NBB >4,"","")
           ENDIF
       IF LENDD>=2
         IF  SUBSTR(ISXCH,LENDD-1,1) ="1"
            SLOVO1=SUBSTR(SHAB2,VAL(SUBSTR(ISXCH,LENDD,1))*13+1,13)
            RUBLI=""
         ELSE
         IF SUBSTR(ISXCH,LENDD-1,1) #"0"
            SLOVO=SUBSTR(SHAB3,(VAL(SUBSTR(ISXCH,LENDD-1,1))-2)*11+1,11)
         ENDIF
         ENDIF
       ELSE
         EXIT
       ENDIF
       IF LENDD>=3
         IF SUBSTR(ISXCH,LENDD-2,1) #"0"
          SLOVO0 =SUBSTR(SHAB5,(VAL(SUBSTR(ISXCH,LENDD-2,1))-1)*9+1,9)
         ENDIF
       ELSE
            EXIT
     ENDIF
       IF LENDD>=4
         IF SUBSTR(ISXCH,LENDD-3,1)#"0"
           TIS0  =SUBSTR(SHAB4,(VAL(SUBSTR(ISXCH,LENDD-3,1))-1)*6+1,6)
         ENDIF
           IF SUBSTR(ISXCH,LENDD-3,1)="1"
             TTTTT=""
           ELSE
             NBB=VAL(SUBSTR(ISXCH,LENDD-3,1))
             TTTTT=IIF(NBB=0 .OR. NBB >4,"","")
           ENDIF
        ELSE
           EXIT
        ENDIF
       IF LENDD>=5
         IF  SUBSTR(ISXCH,LENDD-4,1) ="1"
            TIS0  =SUBSTR(SHAB2,VAL(SUBSTR(ISXCH,LENDD-3,1))*13+1,13)
            TTTTT=""
         ELSE
         IF SUBSTR(ISXCH,LENDD-4,1) #"0"
            TIS1 =SUBSTR(SHAB3,(VAL(SUBSTR(ISXCH,LENDD-4,1))-2)*11+1,11)
         ENDIF
         ENDIF
       ELSE
         EXIT
       ENDIF
       IF LENDD>=6
            TIS2   =SUBSTR(SHAB5,(VAL(SUBSTR(ISXCH,LENDD-5,1))-1)*9+1,9)
       ELSE
            EXIT
       ENDIF
            EXIT
     ENDDO
      SOS1=LTRIM(RTRIM(TIS2)+" "+RTRIM(TIS1)+" "+RTRIM(TIS0)+" "+TTTTT+" "+RTRIM(SLOVO0)+" "+RTRIM(SLOVO)+" "+RTRIM(SLOVO1)+" "+RUBLI+" "+DDKOP+" "+"K.")
RETURN
