-- That's a gym database just for postgres training --
-- Create and connect --
-- CREATE DATABASE gym;
-- \c gym

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    registration_date TIMESTAMP DEFAULT NOW()
)

CREATE TABLE memberships (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price FLOAT
)