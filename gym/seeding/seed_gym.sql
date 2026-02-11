-- TRUNCATE for tests, WARNING
TRUNCATE TABLE workouts, enrollments, memberships, students RESTART IDENTITY CASCADE;

-- Seeding memberships plans
INSERT INTO memberships (name, price) VALUES 
('Basic Plan', 79.90),
('Silver Plan', 129.90),
('Gold Plan', 199.90),
('Black Plan', 249.90);

-- Seeding students
INSERT INTO students (name, email) VALUES 
('Laura Maria', 'laura.maria@gmail.com'),
('Ana Silva', 'ana.silva@email.com'),
('Carlos Oliveira', 'carlos.o@email.com'),
('Mariana Costa', 'mari.costa@email.com'),
('João Souza', 'joao.souza@email.com');

-- Seeding enrollments
INSERT INTO enrollments (id_student, id_membership, status, start_date) VALUES 
(1, 4, 'active', '2026-01-11'),
(2, 2, 'active', '2026-01-15'),
(3, 1, 'inactive', '2026-01-20'),
(4, 4, 'active', '2026-02-01'),
(5, 3, 'active', '2026-02-05');

-- Seeding workouts
INSERT INTO workouts (id_student, workout_description) VALUES 
(1, 'Hypertrophy Training - Focus on Back and Biceps'),
(1, 'High Intensity Cardio - 30 min'),
(2, 'Functional Training for Beginners'),
(4, 'Powerlifting - Squat and Deadlift Session');
