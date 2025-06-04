CREATE VIEW v_price_with_discount AS
SELECT p.name, m.pizza_name, m.price, (m.price - m.price * 0.1)::integer AS discount_price
FROM person p
INNER JOIN person_order po
ON p.id = po.person_id
INNER JOIN menu m
ON po.menu_id = m.id
ORDER BY 1, 2;

SELECT * FROM v_price_with_discount;