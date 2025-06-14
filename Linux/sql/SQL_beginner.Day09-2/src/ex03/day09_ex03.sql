CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS trigger AS
$person_audit$
BEGIN
IF (TG_OP = 'INSERT') THEN
INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
VALUES(current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address);
ELSEIF (TG_OP = 'UPDATE') THEN
  INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
  VALUES(current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address);
  ELSEIF (TG_OP = 'DELETE') THEN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES(current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address);
END IF;
RETURN NULL;
END;
$person_audit$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
AFTER DELETE OR INSERT OR UPDATE ON person FOR EACH ROW 
EXECUTE FUNCTION fnc_trg_person_audit();

DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit;

DELETE FROM person_audit;

INSERT INTO person(id, name, age, gender, address) 
           VALUES (10,'Damir', 22, 'male', 'Irkutsk'); 
UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10; 
DELETE FROM person WHERE id = 10;

SELECT * FROM person_audit;