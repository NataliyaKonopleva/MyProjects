CREATE TABLE person_audit (
    created timestamp with time zone DEFAULT current_timestamp NOT NULL,
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS trigger AS
$person_audit$
BEGIN
INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
VALUES(current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address);
RETURN NULL;
END;
$person_audit$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit 
AFTER INSERT
    ON person
    FOR EACH ROW 
    EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;