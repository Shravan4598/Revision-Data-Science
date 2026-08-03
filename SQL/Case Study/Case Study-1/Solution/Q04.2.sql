SELECT * FROM orders;
SELECT * FROM users;
SELECT * FROM restaurants;
SELECT * FROM order_details;
SELECT * FROM menu;
SELECT * FROM food;
SELECT * FROM delivery_partner;

ALTER TABLE delivery_partner
CHANGE COLUMN `ï»¿partner_id` partner_id INT;