SELECT action_date, name AS person_name
FROM
  (SELECT order_date AS action_date, person_id, name 
   FROM person_order CROSS JOIN person
   WHERE person.id = person_order.person_id
   INTERSECT
   SELECT visit_date, person_id, name
   FROM person_visits CROSS JOIN person)
ORDER BY action_date, person_name DESC;