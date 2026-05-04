-- Atividade 3: Function de total pago por cliente
-- Crie uma function chamada fn_atividade_total_pago_cliente que receba o customer_id e retorne o total pago pelo cliente.
-- Requisitos:
-- • a function deve receber um parâmetro inteiro;
-- • deve retornar um valor numérico;
-- • deve usar COALESCE para evitar retorno NULL.

-- Teste a function com pelo menos três clientes diferentes.

CREATE OR REPLACE FUNCTION fn_atividade_total_pago_cliente(p_customer_id INT)
RETURNS NUMERIC AS
$$
DECLARE v_total NUMERIC;
BEGIN
SELECT COALESCE(SUM(amount), 0)
INTO v_total
FROM payment
WHERE customer_id = p_customer_id;

RETURN v_total;
END;

$$ LANGUAGE plpgsql;

SELECT fn_atividade_total_pago_cliente(1) AS 1;
SELECT fn_atividade_total_pago_cliente(2) AS 2;
SELECT fn_atividade_total_pago_cliente(3) AS 3;