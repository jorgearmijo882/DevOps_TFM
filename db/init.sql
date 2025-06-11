-- Creamos la tabla con los cinco campos
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    product VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    value NUMERIC(10,2) NOT NULL,
    category VARCHAR(100) NOT NULL,
    entry_date DATE NOT NULL
);

-- Datos de ejemplo
INSERT INTO products (product, quantity, value, category, entry_date) VALUES
  ('Tornillos M4 x 10', 100, 0.15, 'Ferretería', '2025-06-11'),
  ('Tuerca M4', 200, 0.10, 'Ferretería', '2025-06-11');
