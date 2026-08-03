SELECT *
FROM orders
WHERE restaurant_rating = '';

SELECT COUNT(*)
FROM orders
WHERE restaurant_rating = '';

DESCRIBE delivery_partner;
DESCRIBE food;
DESCRIBE menu;
DESCRIBE order_details;
DESCRIBE orders;
DESCRIBE restaurants;
DESCRIBE users;

-- delivery_partner
UPDATE delivery_partner
SET partner_name = NULL
WHERE partner_name = '';

-- food
UPDATE food
SET f_name = NULL
WHERE f_name = '';

UPDATE food
SET type = NULL
WHERE type = '';

-- orders
UPDATE orders
SET date = NULL
WHERE date = '';

UPDATE orders
SET restaurant_rating = NULL
WHERE restaurant_rating = '';

-- restaurants
UPDATE restaurants
SET r_name = NULL
WHERE r_name = '';

UPDATE restaurants
SET cuisine = NULL
WHERE cuisine = '';

-- users
UPDATE users
SET name = NULL
WHERE name = '';

UPDATE users
SET email = NULL
WHERE email = '';

UPDATE users
SET password = NULL
WHERE password = '';