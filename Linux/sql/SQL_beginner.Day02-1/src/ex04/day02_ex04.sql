SELECT pizza_name, pi.name, price
FROM menu m
INNER JOIN pizzeria pi
ON m.pizzeria_id = pi.id
WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1, 2;
