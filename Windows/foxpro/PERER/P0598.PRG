* Перерасчет с 01.05.1998 г.в 1.25  без изменения пайков
********************************************************
set esca off
set talk off
set date germ
set color to
konmes="31,28,31,30,31,30,31,31,30,31,30,31"
clea
sele 1
use cart
do while .not. eof()
 if codlea=0 .and. vidpns<=2 .and. pnsapp>=ctod("01.03.95") .and. increg>0
*   repl salpst with round(salpst*1.25,2),increg with round(salpst*prcreg/100,2)
   repl increg with round(salpst*prcreg/100,2)
 w=val(substr(wslnad,1,2))
 do case
        case w>1 .and. w<2
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
 repl totsal with salpst+increg+salrnk+incwsl+sumprp,sumclc with totsal,;
penrub with round(totsal*penprc/100,2)
raionk=round(prccof*penrub/100,2)
su= penrub+povs16+nadb_1+nadb_2+nadb_3+nadrad+ps45_1+ps45_2+raionk
repl sumcof with raionk,itgpns with su,begpay with ctod("01.05.98")
endif
skip
enddo
retu
