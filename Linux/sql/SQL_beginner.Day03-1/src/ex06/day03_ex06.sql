WITH main AS (
SELECT m1.pizza_name, m1.price, m1.pizzeria_id AS p1, m2.pizzeria_id AS p2
FROM menu m1
INNER JOIN menu m2
ON m1.pizza_name = m2.pizza_name AND m1.price = m2.price AND m1.pizzeria_id <> m2.pizzeria_id)

SELECT main.pizza_name, pi1.name AS pizzeria_name1, pi2.name AS pizzeria_name2, main.price
FROM main
INNER JOIN pizzeria pi1
ON pi1.id = main.p1
INNER JOIN  pizzeria pi2
ON pi2.id = main.p2 AND pi1.id > pi2.id
ORDER BY 1;