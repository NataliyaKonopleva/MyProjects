SELECT name 
FROM person p
INNER JOIN person_order po
ON p.id = po.person_id
INNER JOIN menu m
ON po.menu_id = m.id
WHERE p.gender = 'female' AND m.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT name 
FROM person p
INNER JOIN person_order po
ON p.id = po.person_id
INNER JOIN menu m
ON po.menu_id = m.id
WHERE p.gender = 'female' AND m.pizza_name = 'cheese pizza'
ORDER BY name;