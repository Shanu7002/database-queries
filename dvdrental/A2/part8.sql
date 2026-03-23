SELECT c.city
FROM city c
WHERE EXISTS (
    SELECT 1
    FROM customer cus
    LEFT JOIN address a ON a.address_id = cus.address_id
    WHERE a.city_id = c.city_id
)
AND NOT EXISTS (
    SELECT 1
    FROM store s
    LEFT JOIN address a ON a.address_id = s.address_id
    WHERE a.city_id = c.city_id
);