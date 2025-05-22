#Ki az áruló
SELECT name
FROM Person
WHERE is_traitor = true;

#Legtöbb állítás
SELECT p.name, COUNT(*) AS statement_count
FROM Statement s
JOIN Person p ON s.person_id = p.id
GROUP BY p.name
ORDER BY statement_count DESC
LIMIT 1;

#Igaz állítások
SELECT DISTINCT p.name
FROM Statement s
JOIN Person p ON s.person_id = p.id
WHERE s.truth_value = true;

#Hamis állítások
SELECT DISTINCT p.name
FROM Statement s
JOIN Person p ON s.person_id = p.id
WHERE s.truth_value = false;

#Legjobb detektív
SELECT d.name, COUNT(*) AS true_statements
FROM Statement s
JOIN Detective d ON s.detective_id = d.id
WHERE s.truth_value = true
GROUP BY d.name
ORDER BY true_statements DESC
LIMIT 1;

#Állítások
SELECT s.id, d.name AS detective, p.name AS subject, s.statement_text, s.truth_value
FROM Statement s
JOIN Detective d ON s.detective_id = d.id
JOIN Person p ON s.person_id = p.id
ORDER BY s.id;

#Gyanús személy
SELECT p.name, COUNT(*) AS true_statements_about
FROM Statement s
JOIN Person p ON s.person_id = p.id
WHERE s.truth_value = true
GROUP BY p.name
ORDER BY true_statements_about DESC;

#Állítások az árulóról
SELECT s.statement_text, d.name AS detective
FROM Statement s
JOIN Person p ON s.person_id = p.id
JOIN Detective d ON s.detective_id = d.id
WHERE p.is_traitor = true;
