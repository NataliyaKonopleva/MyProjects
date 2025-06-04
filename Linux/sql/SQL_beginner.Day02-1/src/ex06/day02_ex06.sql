WITH pers AS (
    SELECT po.menu_id
    FROM person p
    INNER JOIN person_order po
    ON p.id = po.person_id
    WHERE p.name IN ('Anna', 'Denis'))
SELECT m.pizza_name, pi.name
FROM menu m
INNER JOIN pers
ON m.id = pers.menu_id
INNER JOIN pizzeria pi 
ON m.pizzeria_id = pi.id
ORDER BY 1, 2;
