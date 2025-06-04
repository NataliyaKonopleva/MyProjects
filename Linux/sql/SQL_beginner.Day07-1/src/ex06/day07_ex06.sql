WITH cte1 AS (
SELECT m.pizzeria_id, m.price
FROM person_order po INNER JOIN menu m
ON po.menu_id = m.id)

SELECT name, COUNT (*) AS count_of_orders,
ROUND(AVG(price), 2) AS average_price,
MAX(price) AS max_price, MIN(price) AS min_price
FROM cte1 INNER JOIN pizzeria
ON cte1.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY 1;