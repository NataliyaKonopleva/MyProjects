--session #1
begin;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--session #2
begin;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--session #1
select * from pizzeria where name = 'Pizza Hut';
--session #2
update pizzeria set rating = 3.0 where name = 'Pizza Hut';
commit;
--session #1
select * from pizzeria where name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';
--session #2
select * from pizzeria where name = 'Pizza Hut';