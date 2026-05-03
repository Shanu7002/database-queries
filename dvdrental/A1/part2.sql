4-
SELECT f.title, a.first_name 
FROM film f
LEFT JOIN film_actor fc ON f.film_id = fc.film_id
LEFT JOIN actor a ON fc.actor_id = a.actor_id;

5-
SELECT f.title, c.name
FROM film f
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category c oN c.category_id = fc.category_id;
