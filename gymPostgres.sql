-- That's a gym database just for postgres training --
-- Create and connect --
-- CREATE DATABASE gym;
-- \c gym

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    registration_date TIMESTAMP DEFAULT NOW()
);

CREATE TABLE memberships (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price DECIMAL(6,2) CHECK (price >= 0)
);

CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    id_student INT NOT NULL,
    id_membership INT,
    start_date DATE DEFAULT CURRENT_DATE,
    end_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (id_student) REFERENCES students(id),
    FOREIGN KEY (id_membership) REFERENCES memberships(id) ON DELETE SET NULL,
    CHECK (end_date IS NULL OR end_date >= start_date)
);

CREATE TABLE workouts (
    id SERIAL PRIMARY KEY,
    id_student INT NOT NULL,
    workout_description TEXT NOT NULL,
    FOREIGN KEY (id_student) REFERENCES students(id) ON DELETE CASCADE
);