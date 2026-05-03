-- Ocultar informações da atividade
-- Instruções
-- Atividade 1: View de clientes e pagamentos
-- Crie uma view chamada vw_clientes_pagamentos que exiba:
-- • código do cliente;
-- • nome completo do cliente;
-- • e-mail;
-- • valor do pagamento;
-- • data do pagamento.
-- Utilize as tabelas customer e payment.
-- Depois, execute consultas para:
-- 1. listar todos os registros da view;
-- 2. listar apenas pagamentos acima de 5.00;
-- 3. ordenar os registros pelo maior valor pago.

-- creating view
CREATE VIEW vw_clientes_pagamentos AS
SELECT c.customer_id, c.first_name || ' ' || c.last_name AS name, c.email, p.amount, p.payment_date
FROM customer c
LEFT JOIN payment p ON p.customer_id = c.customer_id;

-- 1. list all
SELECT * FROM vw_clientes_pagamentos;

-- 2. list all with amount > 5.0
SELECT * 
FROM vw_clientes_pagamentos
WHERE amount > 5.0
ORDER BY amount ASC;
-- order by to check

-- 3. order by amount DESC
SELECT *
FROM vw_clientes_pagamentos
ORDER BY amount DESC;
