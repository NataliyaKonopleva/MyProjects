set proce to telef1
do nach
SET DELE ON
clea
publ xd,sos1,sysd,kkk,gg,teldb,tel1,tel2,tel3,tel4,nb,zagod
gg1=year(date())-1
gg=str(gg1,4)
prosm=0
mes10="������  ������� �����   ������  ���     ����    ����    ������� ��������"
Mes20="������� ������  �������"
MES=MES10+MES20
MO=SUBSTR(MES,8*month(date())-7,8)
GOD=STR(YEAR(date()),5)+" �."
sysd=str(day(date()),2)+" "+mo+god
do main with 0
DO WHILE .T.
SET COLOR TO n/w,b/w
ram=repl("��",40)
i=0
do while i<=23
 @ i,0 say ram
 i=i+1
enddo
@ 23,1 CLEA TO 23,78
@ 23,20 SAY "F1 - ᬥ���� ���    E S C  - ��室          "
@ 5,35 say str(gg1,4)+" ���"
SET COLOR TO W/b
@ 6,13 CLEA TO 15,66
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
M8= "  �p�ᬮ�p ��p���� �뤠� �������権 �� ⥫�䮭    "
M9 ="  ���� ������                                       "
M10="  �⮣��� �㬬�                                    "
M11="  ��������� p����p�� �������権                    "
M12="  �p�������.������⢮ ������ �p��� �� ��������� "
M13="  ���᪨ �� ᡥࡠ����                              "
M14="  ��ࠡ�⪠ ������᪨� ���誮�                     "
do M1 WITH 8,14,1,14
  if G=27
set proce to
   RETURN
  endif
  if g=28
do main with 1
    loop
  endif
 m0="M"+ltrim(str(g))
   g1=g
SET COLOR TO rb/W,W/RB
DO CASE
  CASE G =8
    do menu2
  CASE G=9
   do main with 0
   DO vvo
  CASE G =10
   DO spros
  CASE G =11
   DO razkomp
  CASE G =12
  do telsk
  CASE G =13
   do bank3t with 1
  CASE G =14
   do bank3t with 2
*  do otr
endcase
ENDDO
retu
procedure telsk
sele 1
use cart
go top
k=0
@ 18,25 say "���� ������ ..."
do while .not. eof()
mogno="0"
if ("�."$adres1+adres2 .or. space(8)#homphn) .and. catinv#1 .and. catinv#2 ;
.and. .not. ("�1"$adres1+adres2)
if CodLea=0 .and. mstslb=1 .and. substr(ArtDis,3,1)$"�����" .and. val(substr(wslkal,1,2))>=20
 mogno="1"
endif
if CodLea=0 .and. mstslb=2 .and. substr(ArtDis,3,1)$"����" .and. val(substr(wslkal,1,2))>=20
 mogno="1"
endif
endif
if mogno="1"
 k=k+1
 endif
skip
enddo
@ 18,15 say "����� �p��� �� ��������� �p������⥫쭮 "+str(k,4)+" 祫."
wait ""
retu
