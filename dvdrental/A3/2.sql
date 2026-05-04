-- Atividade 2: View de filmes e categorias
-- Crie uma view chamada vw_filmes_categorias_atividade que exiba:
-- • código do filme;
-- • título;
-- • categoria;
-- • duração;
-- • preço de aluguel.

-- Depois, faça consultas para:
-- 1. listar os filmes da categoria Action;
-- 2. listar os filmes com duração maior que 120 minutos;
-- 3. listar os filmes com preço de aluguel maior que 3.00.

CREATE VIEW vw_filmes_categorias_atividade AS
SELECT f.film_id, f.title, c.name, f.length, f.rental_rate AS rental_price
FROM film f
LEFT JOIN film_category fc ON fc.film_id = f.film_id
LEFT JOIN category c ON c.category_id = fc.category_id;

-- 1. list all films with action category
SELECT title, name
FROM vw_filmes_categorias_atividade
WHERE name = 'Action';

-- 2. list all films with duration > 120
SELECT title, length
FROM vw_filmes_categorias_atividade
WHERE length > 120;

-- 3. list all films with rent price > 3.00
SELECT title, rental_price
FROM vw_filmes_categorias_atividade
WHERE rental_price > 3.00;