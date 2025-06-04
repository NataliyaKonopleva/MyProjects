SELECT DISTINCT name
FROM person_order po, person p
WHERE po.person_id = p.id
ORDER BY name;