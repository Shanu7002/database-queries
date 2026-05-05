-- Atividade 6: Function retornando tabela Crie uma function chamada fn_atividade_filmes_por_preco que receba dois parâmetros:
-- • preço mínimo;
-- • preço máximo.
-- A function deve retornar uma tabela contendo:
-- • código do filme;
-- • título;
-- • preço de aluguel;
-- • duração.
-- A function deve retornar apenas filmes cujo rental_rate esteja entre os valores informados.
-- Exemplo de execução:
-- 1 SELECT *
-- 2 FROM fn_atividade_filmes_por_preco (2.00 , 4.00) ;

CREATE OR REPLACE FUNCTION fn_atividade_filmes_por_preco(p_min DECIMAL, p_max DECIMAL)
RETURNS TABLE (id INT, titles VARCHAR(255), rental_prices DECIMAL, duration SMALLINT) AS $$
BEGIN
    RETURN QUERY
    SELECT film_id, title, rental_rate, length
    FROM film
    WHERE rental_rate >= p_min AND rental_rate <= p_max;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fn_atividade_filmes_por_preco (2.00 , 4.00);