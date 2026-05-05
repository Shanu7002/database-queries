-- Atividade 7: Procedure de reajuste geral
-- Crie uma procedure chamada prc_atividade_reajustar_precos que receba um percentual e atualize o preço de aluguel de todos os filmes.
-- Requisitos:
-- • a procedure deve receber um parâmetro numérico;
-- • deve impedir percentual menor ou igual a -100;
-- • deve atualizar a coluna rental_rate da tabela film.
-- Teste com:
-- 1 CALL prc_atividade_reajustar_precos (5) ;

CREATE OR REPLACE PROCEDURE prc_atividade_reajustar_precos(percentual NUMERIC)
AS $$
BEGIN
    IF percentual <= -100 THEN
        RAISE EXCEPTION 'nao pode fica de graça burro mongo';
    END IF;
    
    UPDATE film SET rental_rate = rental_rate * (1 + percentual / 100);
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE prc_arruma_burrice(rental NUMERIC)
AS $$
BEGIN
    UPDATE film SET rental_rate = rental;
END;

$$ LANGUAGE plpgsql;

CALL prc_atividade_reajustar_precos(1000);
