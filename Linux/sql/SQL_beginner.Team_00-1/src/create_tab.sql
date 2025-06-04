create table cities
( id bigint primary key ,
  point1 varchar not null,
  point2 varchar not null,
  cost integer not null default 10
  );

insert into cities values (1, 'a', 'b', 10);
insert into cities values (2, 'b', 'a', 10);
insert into cities values (3, 'a', 'c', 15);
insert into cities values (4, 'c', 'a', 15);
insert into cities values (5, 'a', 'd', 20);
insert into cities values (6, 'd', 'a', 20);
insert into cities values (7, 'b', 'c', 35);
insert into cities values (8, 'c', 'b', 35);
insert into cities values (9, 'b', 'd', 25);
insert into cities values (10, 'd', 'b', 25);
insert into cities values (11, 'c', 'd', 30);
insert into cities values (12, 'd', 'c', 30);

