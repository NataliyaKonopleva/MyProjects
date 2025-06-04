CREATE OR REPLACE FUNCTION fnc_persons_female()
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
  WHERE gender = 'female';
 $persona$
 LANGUAGE sql;

 CREATE OR REPLACE FUNCTION fnc_persons_male()
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
  WHERE gender = 'male';
 $persona$
 LANGUAGE sql;

SELECT * FROM fnc_persons_male();
SELECT * FROM fnc_persons_female();
