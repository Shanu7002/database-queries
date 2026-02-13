-- Subqueries --

-- List students who are paying a price above the general average price of all plans. --
SELECT s.name AS student
FROM students s
INNER JOIN enrollments e ON s.id = e.id_student
INNER JOIN memberships m ON m.id = e.id_membership
WHERE m.price > (SELECT AVG(price) FROM memberships);

-- Use a subquery to list all students who do NOT have any workouts registered. --
SELECT s.name AS student
FROM students s
WHERE s.id NOT IN (
    SELECT id_student
    FROM workouts
);

-- Show the student's name and a column showing the average price of all plans (Scalar Subquery). --
SELECT
    name AS student,
    (SELECT ROUND(AVG(m.price), 2) FROM memberships m) AS global_avg
FROM students;