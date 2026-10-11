CREATE TABLE idx_products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    company_id INTEGER NOT NULL
);

CREATE TABLE no_idx_products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    company_id INTEGER NOT NULL
);

CREATE INDEX idx_products_company_id ON idx_products(company_id);

INSERT INTO no_idx_products (name, price, company_id)
SELECT 
    'Product_' || i, 
    (random()*500)::numeric(12,2), 
    floor(random()*100)+1
FROM generate_series(1, 1000000) s(i);

INSERT INTO idx_products (name, price, company_id)
SELECT 
    'Product_' || i, 
    (random()*500)::numeric(12,2), 
    floor(random()*100)+1
FROM generate_series(1, 1000000) s(i);

SELECT * FROM no_idx_products WHERE company_id = 5;
SELECT * FROM idx_products WHERE company_id = 5;