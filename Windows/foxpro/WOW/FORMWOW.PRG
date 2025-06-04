* Дополнение файла УОВ участницами
set talk off
sele 2
*use wow
use wow96
sele A
use poluch inde poluch
do while .not. eof()
if uchwoin$"1" .and. prichwib=" "
sele 2
append blank
repl adres1 with A->adres1,adres2 with A->adres2,fam with a->fam ;
delo with a->delo,datar with a->datar,uchwoin with a->uchwoin,kodinv with ;
a->kodinv
endif
sele A
skip
enddo
