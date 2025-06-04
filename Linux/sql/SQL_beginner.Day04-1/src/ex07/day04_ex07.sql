INSERT INTO person_visits 
VALUES (
    (SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person p WHERE p.name = 'Dmitriy'),
    (SELECT id FROM pizzeria pi WHERE pi.name = 'DoDo Pizza'),
    ('2022-01-08')
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;


SELECT * FROM mv_dmitriy_visits_and_eats;