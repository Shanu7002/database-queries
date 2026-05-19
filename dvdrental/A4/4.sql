CREATE TABLE user_active_history (
    store_id INT NOT NULL,
    active_old INT NOT NULL,
    active_new INT NOT NULL,
    modify_date TIMESTAMP DEFAULT now(),
    user_id INT NOT NULL
);

CREATE OR REPLACE FUNCTION log_user_active_history()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO user_active_history(
        store_id,
        active_old,
        active_new,
        user_id
    ) VALUES (
        NEW.store_id,
        OLD.active,
        NEW.active,
        NEW.customer_id
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_log_user_active_history
AFTER UPDATE OF active ON customer
FOR each ROW
EXECUTE FUNCTION log_user_active_history();