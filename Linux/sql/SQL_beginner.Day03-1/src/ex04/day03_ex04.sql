WITH main AS (
    SELECT p.gender, pi.name
    FROM person p
    INNER JOIN person_order po ON p.id = po.person_id
    INNER JOIN menu m ON po.menu_id = m.id
    INNER JOIN pizzeria pi ON pi.id = m.pizzeria_id)

(SELECT main.name as pizzeria_name
FROM main 
WHERE main.gender = 'female'
EXCEPT
SELECT main.name as pizzeria_name
FROM main 
WHERE main.gender = 'male')
UNION
(SELECT main.name as pizzeria_name
FROM main 
WHERE main.gender = 'male'
EXCEPT
SELECT main.name as pizzeria_name
FROM main 
WHERE main.gender = 'female')
ORDER BY pizzeria_name;