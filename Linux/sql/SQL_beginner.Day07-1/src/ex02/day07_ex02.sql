SELECT name, count_of_visits AS count, action_type
FROM (SELECT name, COUNT (*) AS count_of_visits,
'visit' AS action_type
FROM person_visits pv INNER JOIN pizzeria pz
ON pv.pizzeria_id = pz.id
GROUP BY name
ORDER BY 2 DESC, 1
LIMIT 3)
UNION ALL 
(SELECT pz.name, COUNT (*) AS count_of_visits,
'order' AS action_type
FROM person_order po INNER JOIN menu m
ON po.menu_id = m.id
INNER JOIN pizzeria pz
ON m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY 2 DESC, 1
LIMIT 3)
ORDER BY 3, 2 DESC;