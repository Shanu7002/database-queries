CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    company_id INTEGER NOT NULL
);

INSERT INTO products (name, price, company_id) VALUES
('Premium Support Tier', 200.00, 2),
('Mechanical Keyboard', 110.00, 3),
('Tool Chest', 350.00, 1),
('Rubber Bumper Plates', 180.00, 5),
('Digital Coffee Scale', 55.00, 4),
('Storage Expansion 1TB', 80.00, 2),
('Workbench Light', 29.99, 1),
('Standing Desk', 450.00, 3),
('Adjustable Bench', 150.00, 5),
('Burr Grinder', 220.00, 4),
('Olympic Barbell', 210.00, 5),
('Custom Domain SSL', 25.00, 2),
('Monitor Arm', 75.00, 3),
('Espresso Machine', 850.00, 4),
('Socket Set (50pc)', 45.00, 1),
('Cable Management Kit', 15.00, 3),
('Milk Frother', 45.00, 4),
('Power Rack', 600.00, 5),
('Laser Level', 120.00, 1),
('Analytics Dashboard', 499.00, 2),
('Kettlebell Set', 90.00, 5),
('1kg Arabica Beans', 32.00, 4),
('Impact Driver', 189.99, 1),
('API Gateway Access', 150.00, 2),
('Ergonomic Chair', 299.99, 3);