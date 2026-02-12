--  Joins --

-- List the student's name and the name of their membership plan. --
SELECT 
    s.name AS student, 
    COALESCE(m.name, 'Do not have a plan') AS plan
FROM students s
LEFT JOIN enrollments e ON s.id = e.id_student
LEFT JOIN memberships m ON e.id_membership = m.id;

-- List the student's name along with their workout descriptions. --
SELECT
    s.name AS student,
    COALESCE(w.workout_description, 'Do not have a workout') AS workout
FROM students s
LEFT JOIN workouts w ON s.id = w.id_student;

-- List all students and their plans, including those without a plan (status 'pending'). --
SELECT 
    s.name AS student, 
    COALESCE(m.name, 'Do not have a plan yet'), 
    e.status AS plan
FROM students s
LEFT JOIN enrollments e ON s.id = e.id_student
LEFT JOIN memberships m ON m.id = e.id_membership;

-- Show all membership plans and the students enrolled in them (even plans with no students). --
SELECT 
    m.name AS membership_name,
    s.name AS student
FROM memberships m
LEFT JOIN enrollments e ON m.id = e.id_membership
LEFT JOIN students s ON s.id = e.id_student;

