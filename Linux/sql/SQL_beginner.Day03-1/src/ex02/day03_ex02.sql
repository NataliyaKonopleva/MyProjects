WITH pizza AS (
    SELECT id FROM menu
    EXCEPT
    SELECT menu_id FROM person_order),
     pizza1 AS (
        SELECT pizza_name, price, pizzeria_id
        FROM menu m
        INNER JOIN pizza
        ON pizza.id = m.id)
SELECT pizza_name, price, pi.name AS pizzeria_name
FROM pizza1
INNER JOIN pizzeria pi
ON pizza1.pizzeria_id = pi.id
ORDER BY 1, 2;