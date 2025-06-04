CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
 RETURNS TABLE (fibonacci integer)
 AS
 $$
  WITH RECURSIVE fibonacci (a, b) AS (
    SELECT 0 AS a, 1 AS b
    UNION ALL
    SELECT b, a + b
    FROM fibonacci
    WHERE b < pstop
  )
  SELECT a FROM fibonacci;
 $$
 LANGUAGE sql;

select * from fnc_fibonacci(100);

select * from fnc_fibonacci();
