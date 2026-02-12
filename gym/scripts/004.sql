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
