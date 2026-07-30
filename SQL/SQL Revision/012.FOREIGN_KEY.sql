CREATE DATABASE IF NOT EXISTS csvtu;
USE csvtu;

CREATE TABLE IF NOT EXISTS orders(
order_id VARCHAR(80) PRIMARY KEY,
customer_id INT,
order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT orders_fk FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id)
VALUES
('ORD001', 1),
('ORD002', 2),
('ORD003', 1),
('ORD004', 3);

SELECT * FROM orders;