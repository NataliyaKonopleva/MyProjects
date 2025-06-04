CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
IN pperson varchar DEFAULT 'Dmitriy',
IN pprice integer DEFAULT 500, IN pdate date DEFAULT '2022-01-08')
 RETURNS TABLE (name varchar)
 AS
 $persona$
  BEGIN
  RETURN QUERY
  SELECT pi.name 
  FROM pizzeria pi 
  INNER JOIN menu m ON pi.id = m.pizzeria_id
  INNER JOIN person_visits pv ON pi.id = pv.pizzeria_id
  INNER JOIN person p ON p.id = pv.person_id
  WHERE m.price < pprice AND pv.visit_date = pdate AND p.name = pperson;
  END;
 $persona$
 LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

