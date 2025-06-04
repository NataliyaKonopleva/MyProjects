INSERT INTO menu
values (
    (SELECT MAX(menu.id) + 1 FROM menu),
    (SELECT id FROM pizzeria WHERE pizzeria.name = 'Dominos'),
    'sicilian pizza',
    900);