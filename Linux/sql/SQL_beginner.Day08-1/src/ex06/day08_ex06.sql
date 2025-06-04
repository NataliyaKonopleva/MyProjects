--session #1
begin;
SET TRANSACTION ISOLATION LEVEL REPEATABLE  READ;
--session #2
begin;
SET TRANSACTION ISOLATION LEVEL REPEATABLE  READ;
--session #1
select sum(rating) from pizzeria;
--session #2
insert into pizzeria values (11, 'Kazan Pizza 2', 4.0);
commit;
--session #1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;
--session #2
select sum(rating) from pizzeria;