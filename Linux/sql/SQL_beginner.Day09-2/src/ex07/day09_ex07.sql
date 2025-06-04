CREATE OR REPLACE FUNCTION func_minimum(arr numeric[])
 RETURNS numeric
 AS
 $min$
  SELECT MIN(values)
  FROM UNNEST(arr) AS values;
 $min$
 LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
