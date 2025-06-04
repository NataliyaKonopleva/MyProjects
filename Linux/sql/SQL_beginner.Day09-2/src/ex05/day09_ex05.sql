DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female')
 RETURNS TABLE (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
 )
 AS
 $persona$
  SELECT * FROM person
  WHERE gender = pgender;
 $persona$
 LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
