set proce to sankur
clea all
SET BELL OFF
SET TALK OFF
SET SCOREBOARD OFF
SET STATUS OFF
SET ESCAPE On
SET EXACT Off
SET CONF ON
SET SAFETY OFF
sET DELE ON
set proce to sankur
publ xd,sos1,sysd,kkk
mes10="������  ������� �����   ������  ���     ����    ����    ������� ��������"
Mes20="������� ������  �������"
MES=MES10+MES20
MO=SUBSTR(MES,8*month(date())-7,8)
GOD=STR(YEAR(date()),5)+" �."
sysd=str(day(date()),2)+" "+mo+god
set date germ
do sankur1
rest from kur addi
rest from minz addi
DO WHILE .T.
SET COLOR TO W+/n,b+/w
DO RAM
SET COLOR TO b+/w
@ 23,1 CLEA TO 23,78
@ 23,10 SAY "  E S C  - ��室 �� ��࠭�      E N D - ��室 �� ��⥬� "
SET COLOR TO r+/n
@ 5,14 CLEA TO 14,68
SET COLOR TO W+/bg+
@ 6,12 CLEA TO 15,66
@ 6 ,13 SAY "����������������������������������������������������ͻ"
@ 7 ,13 SAY "�                                                    �"
@ 8 ,13 SAY "�                                                    �"
@ 9 ,13 SAY "�                                                    �"
@ 10,13 SAY "�                                                    �"
@ 11,13 SAY "�                                                    �"
@ 12,13 SAY "�                                                    �"
@ 13,13 SAY "�                                                    �"
@ 14,13 SAY "�                                                    �"
@ 15,13 SAY "����������������������������������������������������ͼ"
M8= "  �p�ᬮ�p ��p���� �뤠� �������権               "
M9 ="  ���� ������                                       "
M10="  �⮣��� �㬬�                                    "
M11="  ��������� p����p�� �������権                    "
M12="  ����� ��p����                                    "
M13="  ����p������ ������                                "
do M1 WITH 8,13,1,14
  if G=27
set proce to
   RETURN
  endif
 m0="M"+ltrim(str(g))
SET COLOR TO gr+/Bg+
  @ g,14 say &M0
   g1=g
SET COLOR TO B/W,W/RB
DO CASE
  CASE G =8
    do menu2
  CASE G=9
   do chab1
   DO vvo
  CASE G =10
   DO spros
  CASE G =11
   DO razkomp
  CASE G =12
   DO pkur
  CASE G =13
@ 17,13 say " ���� ! ���� ����p������ !"
   copy file  kur.dbf to a:kur.dbf
   copy file  kur.mem to a:kur.mem
    ENDCASE
ENDDO
