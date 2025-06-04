insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29'); 

WITH currency_time AS (
  SELECT b.user_id, c.id, c.name, b.money,
        COALESCE((SELECT c.rate_to_usd FROM currency c
        WHERE c.id = b.currency_id AND c.updated < b.updated
        ORDER BY c.updated DESC LIMIT 1),
        (SELECT c.rate_to_usd FROM currency c
        WHERE c.id = b.currency_id AND c.updated > b.updated
        ORDER BY c.updated LIMIT 1)) AS t
        FROM balance b 
        INNER JOIN (
            SELECT id, name FROM currency
            GROUP BY id, name) AS c
        ON c.id = b.currency_id
)

SELECT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    currency_time.name AS currency_name,
    CAST(currency_time.money * t AS float) AS currency_in_usd
FROM currency_time
LEFT JOIN "user" ON currency_time.user_id = "user".id
ORDER BY name DESC, lastname, currency_name;