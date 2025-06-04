SELECT p.address, pz.name, COUNT (*) AS count_of_orders
FROM person p INNER JOIN person_order po
ON p.id = po.person_id
INNER JOIN menu m
ON po.menu_id = m.id
INNER JOIN pizzeria pz
ON pz.id = m.pizzeria_id
GROUP BY p.address, pz.name
ORDER BY 1, 2;