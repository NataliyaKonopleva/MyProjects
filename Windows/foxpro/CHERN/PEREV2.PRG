*   ……‚Ž„ —ˆ‘‹Ž -‘ˆŒ‚Ž‹,¤«ï æ¥«ëå,6 §­ ç. æ¨äp.
*          06.02.90     á¤¥« «   ƒ®p¤®­ .ˆ.
*
SHAB1="Ž„ˆH  „‚€   ’ˆ   —…’›…Ÿ’œ  ˜…‘’œ ‘…Œœ  ‚Ž‘…Œœ„…‚Ÿ’œ"
SHAB2="„…‘Ÿ’œ       Ž„ˆHH€„–€’œ  „‚…H€„–€’œ   ’ˆH€„–€’œ   —…’›H€„–€’œ Ÿ’H€„–€’œ   ˜…‘’H€„–€’œ  ‘…ŒH€„–€’œ   ‚Ž‘…ŒœH€„–€’œ„…‚Ÿ’H€„–€’œ "
SHAB3="„‚€„–€’œ   ’ˆ„–€’œ   ‘ŽŽK      Ÿ’œ„…‘Ÿ’  ˜…‘’œ„…‘Ÿ’ ‘…Œœ„…‘Ÿ’  ‚Ž‘…Œœ„…‘Ÿ’„…‚ŸHŽ‘’Ž  "
SHAB4="Ž„H€  „‚…   ’ˆ   —…’›…Ÿ’œ  ˜…‘’œ ‘…Œœ  ‚Ž‘…Œœ„…‚Ÿ’œ"
SHAB5="‘’Ž      „‚…‘’ˆ   ’ˆ‘’€   —…’›…‘’€Ÿ’œ‘Ž’  ˜…‘’œ‘Ž’ ‘…Œœ‘Ž’  ‚Ž‘…Œœ‘Ž’„…‚Ÿ’œ‘Ž’"
STORE " " TO SLOVO0,SLOVO,SLOVO1,TIS0,TIS1,TIS2,TTTTT
***********************************
sos10=""
if cifra>1000000
  sos10=""
 cifra1=mod(cifra,1000000)           &&   å¢®áâ
* cifra1=mod(cifra,1000000)
 cifra2=(cifra-cifra1)/1000000       &&  ¬¨««¨®­ë
c2=ltrim(str(cifra2))
dl=len(c2)
if dl=1
  sos10=substr(shab1,(cifra2-1)*6+1,6) +" Œˆ‹‹ˆŽ"
  if val(c2)>1
    sos10=iif(c2$"234",sos10+"A",sos10+"Ž‚")
  endif
endif
 if dl=2 .and. cifra2<20
  sos10=substr(shab2,(cifra2-10)*13+1,13) +" Œˆ‹‹ˆŽŽ‚"
endif
 if dl=2 .and. cifra2>=20
  sos10=substr(shab3,val(substr(c2,1,1))*11+1,11)
  mi=" Œˆ‹‹ˆŽŽ‚"
  if substr(c2,2,1)#"0"
   sos10=sos10+substr(shab1,(val(substr(c2,2,1))-1)*6+1,6)

  endif
   sos10=sos10+mi
  sos10=sos10+mi
endif
endif
 cifra=cifra1
endif





sos1=sos10
***********************************
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
             RUBLI="“‹œ"
           ELSE
             NBB=VAL(SUBSTR(ISXCH,LENDD,1))
             RUBLI=IIF(NBB=0 .OR. NBB >4,"“‹…‰","“‹Ÿ")
           ENDIF
       IF LENDD>=2
         IF  SUBSTR(ISXCH,LENDD-1,1) ="1"
            SLOVO1=SUBSTR(SHAB2,VAL(SUBSTR(ISXCH,LENDD,1))*13+1,13)
            RUBLI="“‹…‰"
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
             TTTTT="’›‘Ÿ—€"
           ELSE
             NBB=VAL(SUBSTR(ISXCH,LENDD-3,1))
             TTTTT=IIF(NBB=0 .OR. NBB >4,"’›‘Ÿ—","’›‘Ÿ—ˆ")
           ENDIF
        ELSE
           EXIT
        ENDIF
       IF LENDD>=5
         IF  SUBSTR(ISXCH,LENDD-4,1) ="1"
            TIS0  =SUBSTR(SHAB2,VAL(SUBSTR(ISXCH,LENDD-3,1))*13+1,13)
            TTTTT="’›‘Ÿ—"
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
      if cifra<1000000
      SOS1=LTRIM(RTRIM(TIS2)+" "+RTRIM(TIS1)+" "+RTRIM(TIS0)+" "+TTTTT+" "+RTRIM(SLOVO0)+" "+RTRIM(SLOVO)+" "+RTRIM(SLOVO1)+" "+RUBLI+" "+DDKOP+" "+"KŽ.")
      else
      SOS1=sos10+" "+LTRIM(RTRIM(TIS2)+" "+RTRIM(TIS1)+" "+RTRIM(TIS0)+" "+TTTTT+" "+RTRIM(SLOVO0)+" "+RTRIM(SLOVO)+" "+RTRIM(SLOVO1)+" "+RUBLI+" "+DDKOP+" "+"KŽ.")
      endif
RETURN
