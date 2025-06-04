WITH RECURSIVE tour_path AS (
       SELECT 'a'::VARCHAR AS current_point,
       ARRAY ['a'::VARCHAR] AS tour,
       0::int AS total_cost
       FROM cities
       UNION
       SELECT cities.point2 AS current_point,
       tp.tour || cities.point2 AS tour,
       tp.total_cost + cities.cost AS total_cost
       FROM tour_path tp
       JOIN cities ON cities.point1 = tp.current_point
       WHERE cities.point2 != ALL(tp.tour)
   ),
   full_tour AS (
	SELECT tp.tour || cities.point2 AS tour,
	tp.total_cost + cities.cost AS total_cost
    FROM tour_path tp
    JOIN cities ON cities.point1 = tp.current_point
	AND array_length(tp.tour, 1) = 4
    WHERE cities.point2 = 'a'
   )
       SELECT total_cost, tour
       FROM full_tour
       WHERE total_cost = (SELECT MIN(total_cost) FROM full_tour)
       UNION
       SELECT total_cost, tour
       FROM full_tour
       WHERE total_cost = (SELECT MAX(total_cost) FROM full_tour)
       ORDER BY 1, 2;
