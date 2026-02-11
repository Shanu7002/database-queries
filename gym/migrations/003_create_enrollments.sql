-- DROP for tests, WARNING
-- DROP TABLE IF EXISTS enrollments;

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
