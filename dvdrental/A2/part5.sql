SELECT c.first_name
FROM customer c
WHERE (
    SELECT COUNT(*)
    FROM rental r
    WHERE c.customer_id = r.customer_id
) > (
    SELECT COUNT(*)
    FROM rental r 
    WHERE c.customer_id = r.customer_id
        AND c.first_name = :customer.first_name
);

-- usei 2 subsqueries por que parecia melhor jeito