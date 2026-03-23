SELECT customer_id, total_rentals
FROM (
    SELECT 
        customer_id,
        COUNT(*) AS total_rentals,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
    FROM rental
    GROUP BY customer_id
) ranked
WHERE ranking = 1;
