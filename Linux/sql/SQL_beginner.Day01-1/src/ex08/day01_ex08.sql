SELECT order_date, (name || ' (age:' || age::varchar || ')') AS person_information 
FROM person_order NATURAL JOIN (SELECT id AS person_id, name, age FROM person)
ORDER BY 1, 2;