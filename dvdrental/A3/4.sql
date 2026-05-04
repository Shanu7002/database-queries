-- Atividade 4: Function de quantidade de locações por cliente
-- Crie uma function chamada fn_atividade_qtd_locacoes_cliente que receba o customer_id e retorne a quantidade de locações realizadas por esse cliente.
-- Utilize a tabela rental.
-- Depois, use a function em uma consulta com a tabela customer, exibindo:
-- • código do cliente;
-- • nome;
-- • sobrenome;
-- • quantidade de locações.

CREATE OR REPLACE FUNCTION fn_atividade_qtd_locacoes_cliente(p_customer_id INT)
RETURNS INT AS $$

DECLARE qnt_total INT;
BEGIN
SELECT COUNT(*)
INTO qnt_total
FROM rental
WHERE customer_id = p_customer_id;

RETURN qnt_total;
END;

$$ LANGUAGE plpgsql;

SELECT customer_id, first_name AS nome, last_name AS sobrenome, fn_atividade_qtd_locacoes_cliente(customer_id) AS qnt_locacoes
FROM customer;