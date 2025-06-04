SELECT name, SUM(COALESCE(count, 0)) AS total_count
FROM ((SELECT name, COUNT (*) AS count
FROM person_visits pv INNER JOIN pizzeria pz
ON pv.pizzeria_id = pz.id
GROUP BY name)
UNION ALL
(SELECT pz.name, COUNT (*) AS count
FROM person_order po INNER JOIN menu m
ON po.menu_id = m.id
INNER JOIN pizzeria pz
ON m.pizzeria_id = pz.id
GROUP BY pz.name))
GROUP BY name
ORDER BY 2 DESC, 1;