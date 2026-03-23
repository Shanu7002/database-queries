SELECT c.first_name
FROM customer c
WHERE EXISTS (
    SELECT 1
    FROM payment p
    WHERE p.customer_id = c.customer_id
      AND p.amount > (SELECT AVG(amount) FROM payment)
);

-- escolhi fazer dessa forma com AND para evitar mais uma subconsulta complexa