CREATE OR REPLACE function fn_atividade_validar_replacement_cost()
RETURNs trigger AS $$
BEGIN
    if NEW.replacement_cost <= 0 THEN
        RAISE EXCEPTION 'cannot 0 or less the price';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_atividade_validar_replacement_cost
BEFORE INSERT OR UPDATE OF replacement_cost ON film
FOR EACH ROW
EXECUTE FUNCTION fn_atividade_validar_replacement_cost();