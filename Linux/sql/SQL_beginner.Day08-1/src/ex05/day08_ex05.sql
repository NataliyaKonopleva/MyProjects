--session #1
begin;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--session #2
begin;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--session #1
select sum(rating) from pizzeria;
--session #2
insert into pizzeria values (10, 'Kazan Pizza', 5);
commit;
--session #1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;
--session #2
select sum(rating) from pizzeria;