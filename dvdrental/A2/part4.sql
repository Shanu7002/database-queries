SELECT a.first_name
FROM actor a
WHERE EXISTS (
    SELECT 1
    FROM film_actor fa
    WHERE fa.actor_id = a.actor_id
      AND fa.film_id IN (
            SELECT f.film_id
            FROM film f
            JOIN film_category fc ON fc.film_id = f.film_id
            JOIN category c ON c.category_id = fc.category_id 
            WHERE c.name = :category
    )
);

-- Eu fiz dessa forma para treinar subquery e acredito que se comportou como deveria, usei :category (dica da AI) para filtrar por uma categoria informada