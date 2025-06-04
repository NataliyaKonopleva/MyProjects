CREATE INDEX idx_person_name ON person (Upper(name));
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT *
FROM person
WHERE Upper(name) = 'NATALY';