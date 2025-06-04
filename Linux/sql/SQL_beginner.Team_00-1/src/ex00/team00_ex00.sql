create table if not exists cities
( id bigint primary key,
  point1 varchar not null,
  point2 varchar not null,
  cost integer not null
  );

insert into cities(id, point1, point2, cost)

values 
(1, 'a', 'b', 10),
(2, 'b', 'a', 10),
(3, 'a', 'c', 15),
(4, 'c', 'a', 15),
(5, 'a', 'd', 20),
(6, 'd', 'a', 20),
(7, 'b', 'c', 35),
(8, 'c', 'b', 35),
(9, 'b', 'd', 25),
(10, 'd', 'b', 25),
(11, 'c', 'd', 30),
(12, 'd', 'c', 30)
ON CONFLICT (id) DO NOTHING;

WITH RECURSIVE tour_path AS (
       SELECT 'a'::VARCHAR AS current_point,
       ARRAY ['a'::VARCHAR] AS path,
       0::int AS total_cost
       FROM cities
       UNION
       SELECT cities.point2 AS current_point,
       tp.path || cities.point2 AS path,
       tp.total_cost + cities.cost AS total_cost
       FROM tour_path tp
       JOIN cities ON cities.point1 = tp.current_point
       WHERE cities.point2 != ALL(tp.path)
   ),
   full_tour AS (
	SELECT tp.path || cities.point2 AS path,
	tp.total_cost + cities.cost AS total_cost
    FROM tour_path tp
    JOIN cities ON cities.point1 = tp.current_point
	AND array_length(tp.path, 1) = 4
    WHERE cities.point2 = 'a'
   )
       SELECT total_cost, path AS tour
       FROM full_tour
       WHERE total_cost = (SELECT MIN(total_cost) FROM full_tour)
       ORDER BY 1, 2;
