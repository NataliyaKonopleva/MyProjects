set talk off
use cart
do while .not. eof()
if vidpns#3 .and. ps45_1+ps45_2+povs16+nadrad+Nadb_1+nadb_2+nadb_3=0
 repl ps45_2 with 0.01
endif
skip
enddo
