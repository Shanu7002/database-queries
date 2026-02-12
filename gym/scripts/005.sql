-- Aggregation --

-- Count the total number of students in the database. --
SELECT 
    COUNT(*) AS students_quantity
FROM students s;

-- Count how many students currently have an 'active' status. --
SELECT
    COUNT(*) AS students_active
FROM enrollments
WHERE status = 'active';

-- Calculate the average price of all available membership plans. --
SELECT
    ROUND(AVG(m.price), 2) AS average_price
FROM memberships m;

-- Calculate the total potential revenue if all active students paid their plans today. --
SELECT
    SUM(m.price) AS sum_price
FROM enrollments e
INNER JOIN memberships m ON e.id_membership = m.id
WHERE e.status = 'active';

-- Count the number of students for each enrollment status. --
SELECT
    status,
    COUNT(*)
FROM enrollments e
GROUP BY status;

-- List each membership plan name and the count of students linked to it. --
SELECT
    m.name AS plan_name,
    COUNT(e.id_student) AS students
FROM memberships m
LEFT JOIN enrollments e ON m.id = e.id_membership
GROUP BY m.name;

-- List students who have more than 2 workouts registered. --
SELECT
    s.name AS student
FROM students s
LEFT JOIN workouts w ON s.id = w.id_student
GROUP BY s.id
HAVING COUNT(*) > 2
ORDER BY s.id;

-- Find the price of the most expensive plan among students with 'active' status. --
SELECT
    MAX(m.price) AS max_price
FROM memberships m
INNER JOIN enrollments e ON m.id = e.id_membership
WHERE e.status = 'active';

-- Count how many workouts each student has (display name and count). --
SELECT
    s.name AS student,
    COUNT(*) AS workouts
FROM students s
INNER JOIN workouts w ON w.id_student = s.id
GROUP BY s.name, s.id
ORDER BY s.id;

-- Show only the membership plans that have more than 2 students enrolled. --
SELECT
    m.name AS plan_name
FROM memberships m
LEFT JOIN enrollments e ON m.id = e.id_membership
GROUP BY e.id_membership, m.name
HAVING COUNT(id_student) >= 2;