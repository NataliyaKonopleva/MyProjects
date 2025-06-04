WITH cte_1 AS (
    SELECT *
    FROM person_order 
    INNER JOIN menu ON person_order.menu_id = menu.id
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id),
     cte_2 AS (
    SELECT person_discounts.discount, person_discounts.person_id,
    person_discounts.pizzeria_id, cte_1.pizza_name, cte_1.price, cte_1.name
    FROM person_discounts INNER JOIN cte_1
    ON person_discounts.pizzeria_id = cte_1.pizzeria_id
    AND person_discounts.person_id = cte_1.person_id   
     )
SELECT person.name AS name, cte_2.pizza_name, cte_2.price,
ROUND((cte_2.price * (100-cte_2.discount)/100), 2) AS discount_price,
cte_2.name AS pizzeria_name
FROM person INNER JOIN cte_2
ON person.id = cte_2.person_id
ORDER BY 1, 2;