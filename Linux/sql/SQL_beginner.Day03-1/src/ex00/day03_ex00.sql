WITH pers AS (
    SELECT id 
    FROM person
    WHERE name = 'Kate')

SELECT m.pizza_name, m.price, pi.name AS pizzeria_name, pv.visit_date
FROM pers
INNER JOIN person_visits pv
ON pers.id = pv.person_id
INNER JOIN pizzeria pi
ON pi.id = pv.pizzeria_id
INNER JOIN menu m
ON m.pizzeria_id = pi.id
WHERE m.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;