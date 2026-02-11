-- DROP for tests, WARNING
-- DROP TABLE IF EXISTS workouts;

CREATE TABLE workouts (
    id SERIAL PRIMARY KEY,
    id_student INT NOT NULL,
    workout_description TEXT NOT NULL,
    FOREIGN KEY (id_student) REFERENCES students(id) ON DELETE CASCADE
);
