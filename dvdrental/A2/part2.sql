SELECT f.title 
FROM film f
WHERE NOT EXISTS (
    SELECT 1
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE i.film_id = f.film_id
);

-- Escolhi desse jeito pois foi o melhor semanticamente que eu consegui