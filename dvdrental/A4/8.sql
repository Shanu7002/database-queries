CREATE TABLE audit_film_changes(
    audit_id SERIAL PRIMARY KEY,
    film_id INT,
    modified_collumn VARCHAR(40),
    old_value TEXT,
    new_value TEXT,
    actual_user TEXT,
    date TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION fn_register_title_alteration()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_film_changes(
        film_id,
        modified_collumn,
        old_value,
        new_value,
        actual_user
    ) VALUES (
        NEW.film_id,
        'title',
        OLD.title,
        NEW.title,
        CURRENT_USER
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_register_title_alteration
AFTER UPDATE OF title ON film
FOR EACH ROW
EXECUTE FUNCTION fn_register_title_alteration();

CREATE OR REPLACE FUNCTION fn_prevent_wrong_rental_rate_input(price DECIMAL(10,2))
RETURNS BOOLEAN AS $$
BEGIN
    RETURN price > 0;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_register_rental_rate_alteration()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT fn_prevent_wrong_rental_rate_input(NEW.rental_rate) THEN
        RAISE EXCEPTION 'Rental rate must be greater than 0';
    END IF;

    INSERT INTO audit_film_changes(
        film_id,
        modified_collumn,
        old_value,
        new_value,
        actual_user
    ) VALUES (
        NEW.film_id,
        'rental_rate',
        OLD.rental_rate,
        NEW.rental_rate,
        CURRENT_USER
    );

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_register_rental_rate_alteration
BEFORE UPDATE OF rental_rate ON film
FOR EACH ROW
EXECUTE FUNCTION fn_register_rental_rate_alteration();
