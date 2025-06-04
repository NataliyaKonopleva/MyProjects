INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (SELECT MAX(person_order.id) + pers_id FROM person_order),
        pers_id,
        (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
        ('2022-02-25')
FROM generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person), 1) AS pers_id
