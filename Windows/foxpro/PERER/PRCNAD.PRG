set talk off
use cart
do while .not. eof()
if vidpns=3 .or. (vidpns=4 .and. codlea=0)
*repl salpst with round(salpst*1.25,2),increg with round(salpst*prcreg/100,2)
pr=0
w=val(substr(wslnad,1,2))
 do case
        case w>=1 .and. w<2
        pr=5
        case w>=2 .and. w<5
        pr=10
        case w>=5 .and. w<10
        pr=20
        case w>=10 .and. w<15
        pr=25
        case w>=15 .and. w<20
        pr=30
        case w>=20 .and. w<25
        pr=35
        case w>=25
        pr=40
 endcase
 repl incwsl with round(pr*(salpst+increg+salrnk)/100,2)
 repl totsal with salpst+increg+salrnk+incwsl+sumprp,sumclc with totsal
 repl penrub with round(totsal*penprc/100,2)
 k=iif(polpns,numdep+1,numdep)
 if vidpns=4
 repl itgpns with   penrub+ps45_1+ps45_2+nadb_1+nadb_2+nadb_3
endif
endif
skip
enddo
