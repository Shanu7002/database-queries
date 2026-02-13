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

-- Find the student with the highest number of workouts using a subquery in the FROM clause. --
SELECT
    s.name AS student
FROM students s
INNER JOIN (
    SELECT 
        id_student,
        COUNT(*) AS count
    FROM workouts
    GROUP BY id_student
) AS temp_table ON s.id = temp_table.id_student
ORDER BY temp_table.count DESC LIMIT 1;

-- List membership plans that have never been chosen by any student. --
SELECT name AS plan
FROM memberships
 WHERE id NOT IN (
    SELECT DISTINCT id_membership
    FROM enrollments
    WHERE id_membership IS NOT NULL
);

-- Create a report with the student's name and the total amount they have "paid" (assuming they paid for their plan once). --
SELECT
    s.name AS student,
    (SELECT COALESCE(m.price, 0) 
    FROM enrollments e
    JOIN memberships m ON m.id = e.id_membership
    WHERE e.id_student = s.id
    LIMIT 1
    ) AS amount_paid
FROM students s;

-- Find students who are on the same plan as 'Eduardo Müller' (without using his ID directly). --
SELECT s.name AS student
FROM students s
JOIN enrollments e ON s.id = e.id_student
WHERE e.id_membership = (
    SELECT id_membership
    FROM enrollments e2
    JOIN students s2 ON e2.id_student = s2.id
    WHERE s2.name = 'Eduardo Müller' 
) AND s.name != 'Eduardo Müller';

-- List students and their plan names, but only for those whose plan costs more than 100. --
SELECT 
    s.name AS student,
    m.price
FROM students s
JOIN enrollments e ON s.id = e.id_student
JOIN memberships m ON m.id = e.id_membership
WHERE m.price >= '100';

-- Show the total count of active students using a subquery in the SELECT clause. --
SELECT
    name AS student,
    (SELECT COUNT(*) AS quantity FROM enrollments WHERE status = 'active'
) AS total_active_students
FROM students;

-- List the IDs of students who have 'Strength' or 'Power' in their workout descriptions. --
SELECT
    DISTINCT s.id
FROM students s
JOIN workouts w ON s.id = w.id_student
WHERE w.workout_description ILIKE '%strength%' OR
      w.workout_description ILIKE '%power%';