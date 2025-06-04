CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
--SELECT DISTINCT pizzeria_id, pizza_name
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizzeria_id = 1;