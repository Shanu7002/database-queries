CREATE TABLE log_rental (
    id SERIAL PRIMARY KEY,
    table_affected TEXT,
    command TEXT,
    momment TIMESTAMP,
    nivel TEXT,
    actual_user TEXT,
    date_register DATE
);

CREATE OR REPLACE FUNCTION log_rental()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_rental (
        table_affected,
        command,
        momment,
        nivel,
        actual_user,
        date_register
    ) VALUES (
        'rental',
        'UPDATE',
        CURRENT_TIMESTAMP,
        'INFO',
        CURRENT_USER,
        now()
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER log_rental
AFTER UPDATE ON rental
FOR EACH STATEMENT
EXECUTE FUNCTION log_rental();