CREATE OR REPLACE function fn_email_letra_minuscula()
RETURNS trigger AS $$
BEGIN
    NEW.email := LOWER(NEW.email);
    RETURN NEW; 
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE trigger trg_letras_minusculas
BEFORE INSERT OR UPDATE OF email ON customer
FOR each ROW
EXECUTE FUNCTION fn_email_letra_minuscula();
