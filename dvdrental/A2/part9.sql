SELECT f.title
FROM film f
WHERE (
    SELECT COUNT(*)
    FROM film_category fc
    WHERE fc.film_id = f.film_id
) > 1;