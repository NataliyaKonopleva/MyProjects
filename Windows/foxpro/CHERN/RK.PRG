***** RK    (min p����p ���ᨨ � ������ �p㤠)
gg_=gg1
*procedure rk
SET COLOR TO W+/RB+
@  5,10 SAY "����������������������������������������������������������ͻ"
@  6,10 SAY "�     ����       ������ p����p �������쭮�       ��Ŀ     �"
@  7,10 SAY "�     � ������ �p㤠                       ���ᨨ    �     �"
set color to r+/rb
@  7,18 SAY "������ �p㤠 "
@  7,53 SAY "���ᨨ "
SET COLOR TO W+/RB+
@  8,10 SAY "�     ��������������>                 <�������������Ĵ     �"
@  9,10 SAY "� ﭢ.����������>                         <���������Ĵ     �"
@ 10,10 SAY "� 䥢.����������>                         <���������Ĵ     �"
@ 11,10 SAY "� ��p�����������>                         <���������Ĵ     �"
@ 12,10 SAY "� ��p.����������>                         <���������Ĵ     �"
@ 13,10 SAY "� ��� ����������>                         <���������Ĵ     �"
@ 14,10 SAY "� �������������>                         <���������Ĵ     �"
@ 15,10 SAY "� �������������>                         <���������Ĵ     �"
@ 16,10 SAY "� ���.����������>                         <���������Ĵ     �"
@ 17,10 SAY "� ᥭ.����������>                         <���������Ĵ     �"
@ 18,10 SAY "� ���.����������>                         <���������Ĵ     �"
@ 19,10 SAY "� �������������>                         <���������Ĵ     �"
@ 20,10 SAY "� ���.����������>                         <�����������     �"
@ 21,10 SAY "� �⮨����� �୮���᪮� ��⥢��                          �"
@ 22,10 SAY "����������������������������������������������������������ͼ"
@  7,40 say "���"
@  7,35 get gg_ pict "9999"
read
if readkey()=12 .or. readkey()=262 .or. gg_<1995
retu
endif
ggg=substr(str(gg_,4),3,2)
sele 9
use minza
loca for god=gg_
if .not. found()
appe blank
repl god with gg_
endif
@  9,29 GET minz1 pict "99999.99"
@  9,41 GET minp1 pict "99999.99"
@ 10,29 GET minz2 pict "99999.99"
@ 10,41 GET minp2 pict "99999.99"
@ 11,29 GET minz3 pict "99999.99"
@ 11,41 GET minp3 pict "99999.99"
@ 12,29 GET minz4 pict "99999.99"
@ 12,41 GET minp4 pict "99999.99"
@ 13,29 GET minz5 pict "99999.99"
@ 13,41 GET minp5 pict "99999.99"
@ 14,29 GET minz6 pict "99999.99"
@ 14,41 GET minp6 pict "99999.99"
@ 15,29 GET minz7 pict "99999.99"
@ 15,41 GET minp7 pict "99999.99"
@ 16,29 GET minz8 pict "99999.99"
@ 16,41 GET minp8 pict "99999.99"
@ 17,29 GET minz9 pict "99999.99"
@ 17,41 GET minp9 pict "99999.99"
@ 18,29 GET minz10 pict "99999.99"
@ 18,41 GET minp10 pict "99999.99"
@ 19,29 GET minz11 pict "99999.99"
@ 19,41 GET minp11 pict "99999.99"
@ 20,29 GET minz12 pict "99999.99"
@ 20,41 GET minp12 pict "99999.99"
@ 21,41 GET put pict "99999999"
READ
retu
