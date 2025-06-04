WITH main AS(
    SELECT p.gender, pi.name
    FROM person p
    INNER JOIN person_visits pv ON p.id = pv.person_id
    INNER JOIN pizzeria pi ON pi.id = pv.pizzeria_id)
    
(SELECT main.name AS pizzeria_name
FROM main
WHERE main.gender = 'female'
EXCEPT ALL
SELECT main.name AS pizzeria_name
FROM main
WHERE main.gender = 'male')
UNION ALL
(SELECT main.name AS pizzeria_name
FROM main
WHERE main.gender = 'male'
EXCEPT ALL
SELECT main.name AS pizzeria_name
FROM main
WHERE main.gender = 'female')
ORDER BY pizzeria_name;