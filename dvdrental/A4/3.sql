CREATE TABLE audit_customer_email(
    audit_code SERIAL PRIMARY KEY,
    client_code INT NOT NULL,
    email_old TEXT,
    email_new TEXT,
    user_id INT,
    data_modification TIMESTAMP DEFAULT now()
);

CREATE OR REPLACE function log_email_changes()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_customer_email (
        client_code, 
        email_old, 
        email_new, 
        user_id
       ) VALUES (
        NEW.store_id, 
        OLD.email, 
        NEW.email, 
        NEW.customer_id
       );

       RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE trigger trg_email_audit
AFTER UPDATE OF email ON customer
FOR each ROW
EXECUTE FUNCTION log_email_changes();