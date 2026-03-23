SELECT f.title
FROM film f
WHERE f.length > (
    SELECT AVG(f2.length)
    FROM film f2
);

-- Usei subquery para verificar o tempo medio antes de fazer a comparação real