--session #1
begin;
--session #2
begin;
--session #1
update pizzeria set rating = 1.1 where id = 1;
--session #2
update pizzeria set rating = 2.2 where id = 2;
--session #1
update pizzeria set rating = 3.3 where id = 2;
--session #2
update pizzeria set rating = 4.4 where id = 1;
--session #1
commit;
--session #2
commit;
--session #1
select * from pizzeria where id = 1 OR id = 2;