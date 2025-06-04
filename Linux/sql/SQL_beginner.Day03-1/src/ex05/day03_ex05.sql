SELECT pi.name as pizzeria_name
FROM person_visits pv
INNER JOIN person p ON pv.person_id = p.id
INNER JOIN pizzeria pi ON pv.pizzeria_id = pi.id
WHERE p.name = 'Andrey'
EXCEPT
SELECT pi.name as pizzeria_name
FROM person_order po
INNER JOIN person p ON po.person_id = p.id
INNER JOIN menu m ON po.menu_id = m.id
INNER JOIN pizzeria pi ON m.pizzeria_id = pi.id
WHERE p.name = 'Andrey'
ORDER BY pizzeria_name;
