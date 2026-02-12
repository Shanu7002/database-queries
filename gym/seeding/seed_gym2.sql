TRUNCATE TABLE workouts, enrollments, memberships, students RESTART IDENTITY CASCADE;

INSERT INTO memberships (name, price) VALUES 
('Basic Plan', 79.90), ('Silver Plan', 129.90), ('Gold Plan', 199.90), ('Black Plan', 249.90), ('Platinum Plan', 399.90);

INSERT INTO students (name, email, registration_date) VALUES 
('Eduardo Müller', 'eduardoaum2007@gmail.com', '2026-01-01'),
('Ana Silva', 'ana.silva@email.com', '2026-01-05'),
('Carlos Oliveira', 'carlos.o@email.com', '2026-01-10'),
('Mariana Costa', 'mari.costa@email.com', '2026-01-15'),
('João Souza', 'joao.souza@email.com', '2026-01-20'),
('Beatriz Reis', 'beareis@email.com', '2026-02-01'),
('Ricardo Santos', 'ricardo.s@email.com', '2026-02-05'),
('Julia Ferraz', 'jferraz@email.com', '2026-02-10'),
('Fernando Lima', 'flima@email.com', '2026-02-11'),
('Larissa Dias', 'ldias@email.com', '2026-02-12');

INSERT INTO enrollments (id_student, id_membership, status, start_date, end_date) VALUES 
(1, 4, 'active', '2026-01-01', NULL),
(2, 2, 'active', '2026-01-05', NULL),
(3, 1, 'inactive', '2026-01-10', '2026-02-01'),
(4, 4, 'active', '2026-01-15', NULL),
(5, 3, 'active', '2026-01-20', NULL),
(6, 5, 'active', '2026-02-01', NULL),
(7, 2, 'active', '2026-02-05', NULL),
(8, 1, 'active', '2026-02-10', NULL),
(9, NULL, 'pending', '2026-02-11', NULL),
(10, 4, 'cancelled', '2026-01-01', '2026-02-10');

INSERT INTO workouts (id_student, workout_description) VALUES 
(1, 'Upper Body - Strength'), (1, 'Lower Body - Power'), (1, 'Cardio - LISS'),
(2, 'Yoga Session'), (2, 'Pilates'),
(4, 'Powerlifting - Deadlift focus'), (4, 'Powerlifting - Bench press'),
(6, 'Swimming - 1000m'), (6, 'Core workout'), (6, 'HIIT Training'),
(7, 'Bodyweight basics'),
(8, 'Rehab exercises - Shoulder');