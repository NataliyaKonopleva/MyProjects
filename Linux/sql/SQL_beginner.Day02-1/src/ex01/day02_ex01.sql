SELECT missing_date::date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missing_date
LEFT JOIN (
    SELECT person_id, visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2 
)
ON missing_date = visit_date
WHERE person_id IS NULL
ORDER BY 1;