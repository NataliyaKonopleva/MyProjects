WITH pers AS (
    SELECT pv.pizzeria_id
    FROM person p
    INNER JOIN person_visits pv
    ON p.id = pv.person_id
    WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08')
SELECT pi.name
FROM pizzeria pi
INNER JOIN pers
ON pi.id = pers.pizzeria_id
INNER JOIN menu m 
ON m.pizzeria_id = pi.id
WHERE m.price < 800;
