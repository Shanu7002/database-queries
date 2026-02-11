-- DROP for tests, WARNING
-- DROP TABLE IF EXISTS memberships;

CREATE TABLE memberships (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price DECIMAL(6,2) CHECK (price >= 0)
);
