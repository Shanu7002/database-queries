6-
SELECT c.first_name, r.rental_date
FROM customer c
LEFT JOIN rental r ON r.customer_id = c.customer_id;

7-
SELECT c.first_name, p.amount, p.payment_date
FROM customer c
LEFT JOIN payment p ON p.customer_id = c.customer_id;