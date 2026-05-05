-- Atividade 8: Procedure de reajuste por categoria
-- Crie uma procedure chamada prc_atividade_reajustar_por_categoria que receba:
-- • nome da categoria;
-- • percentual de reajuste.
-- A procedure deve reajustar apenas os filmes da categoria informada.
-- Exemplo:
-- 1 CALL prc_atividade_reajustar_por_categoria(’Action’,10);

CREATE OR REPLACE PROCEDURE prc_atividade_reajustar_por_categoria(category VARCHAR(25), percentual DECIMAL)
AS $$
BEGIN
    IF percentual <= -100 THEN
        RAISE EXCEPTION 'denovo nao seu O T A R I O';
    END IF;

    UPDATE film f
    SET rental_rate = rental_rate * (1 + percentual / 100)
    FROM film_category fc
    INNER JOIN category c ON c.category_id = fc.category_id 
    WHERE c.name = category AND f.film_id = fc.film_id; 

END;

$$ LANGUAGE plpgsql;

CALL prc_atividade_reajustar_por_categoria('Action', 10);