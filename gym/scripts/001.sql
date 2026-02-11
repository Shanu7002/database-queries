-- Show the student's name, their membership plan name, and the total count of workouts they have. Include students even if they have zero workouts.
SELECT 
    s.name, 
    m.name AS plan_name, 
    COALESCE(workout_counts.total, 0) AS total_workouts
FROM students s
LEFT JOIN enrollments e ON s.id = e.id_student
LEFT JOIN memberships m ON e.id_membership = m.id
LEFT JOIN (
    SELECT id_student, COUNT(*) AS total FROM workouts
    GROUP BY id_student
) AS workout_counts ON s.id = workout_counts.id_student;