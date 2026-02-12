-- Aggregation --

-- Count the total number of students in the database. --
SELECT 
    COUNT(*) AS students_quantity
FROM students s;

-- Count how many students currently have an 'active' status. --
SELECT
    COUNT(*) AS students_active
FROM students s
LEFT JOIN enrollments e ON s.id = e.id_student
GROUP BY e.status 
HAVING e.status = 'active';

-- Calculate the average price of all available membership plans. --
SELECT
    ROUND(AVG(m.price), 2) AS average_price
FROM memberships m;