-- Atividade 5: Function de classificação de filmes
-- Crie uma function chamada fn_atividade_classificar_duracao que receba a duração de um filme e retorne:
-- • Curto, para filmes com até 60 minutos;
-- • Medio, para filmes entre 61 e 120 minutos;
-- • Longo, para filmes acima de 120 minutos.

-- Depois, utilize essa function em uma consulta sobre a tabela film.

CREATE OR REPLACE FUNCTION fn_atividade_classificar_duracao(p_film_duration INT)
RETURNS TEXT AS $$
BEGIN
    IF p_film_duration <= 60 THEN
        RETURN 'Curto';
    END IF;

    IF p_film_duration <= 120 THEN
        RETURN 'Medio';
    END IF;

    RETURN 'Longo';
END;
$$ LANGUAGE plpgsql;

SELECT title, description, rental_duration, fn_atividade_classificar_duracao(length) AS duracao
FROM film;