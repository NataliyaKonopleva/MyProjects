SELECT person.id AS person_id, person.name AS person_name, age, gender, address,
pizzeria.id AS pizza_id, pizzeria.name AS pizza_name, rating
FROM person
CROSS JOIN pizzeria
ORDER BY person_id, pizza_id;