-- Select all names and emails from the students table. --
SELECT name, email FROM students;

-- Select all memberships with a price greater than 150.00. --
SELECT name FROM memberships WHERE price > 150.00;

-- List all student names in alphabetical order. --
SELECT name FROM students ORDER BY name ASC;

-- List all students who registered in January 2026. --
SELECT name FROM students WHERE '2026-01-01' <= registration_date AND registration_date < '2026-02-01';

-- Select all enrollments where the status is 'active'. --
SELECT id FROM enrollments WHERE status = 'active';

-- Display the name and price of the most expensive membership. --
SELECT name, price FROM memberships ORDER BY price DESC LIMIT 1;

-- Display the name and price of the cheapest membership. --
SELECT name, price FROM memberships ORDER BY price ASC LIMIT 1;

-- List students who use a 'gmail.com' email address. --
SELECT name FROM students WHERE email LIKE '%@gmail.com';

-- Select all workouts that mention the word 'Powerlifting' in the description. --
SELECT id_student AS student, workout_description FROM workouts WHERE workout_description LIKE '%Powerlifting%';

-- List all unique status values from the enrollments table. --
SELECT status FROM enrollments GROUP BY status;
