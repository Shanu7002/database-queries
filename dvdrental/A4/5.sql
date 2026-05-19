CREATE OR REPLACE FUNCTION fn_verify_payment_amount()
RETURNS TRIGGER AS $$
BEGIN
    if (NEW.amount <= 0) THEN
        RETURN OLD;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_verify_payment_amount
BEFORE UPDATE OF amount ON payment
FOR each ROW
EXECUTE FUNCTION fn_verify_payment_amount();