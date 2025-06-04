SELECT object_name 
FROM (SELECT pizza_name AS object_name, '1' AS label
      FROM menu
      UNION ALL
      SELECT name, '2' AS label
      FROM person
      ORDER BY label DESC, object_name);