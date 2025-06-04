SELECT order_date, (name || ' (age:' || age::varchar || ')') AS person_information 
FROM person JOIN person_order
ON person.id = person_order.person_id  
ORDER BY 1, 2;