
-- Q03: return n random records? n==5

USE zomato;

SELECT * FROM order_details ORDER BY rand() LIMIT 5;

SELECT * FROM users ORDER BY rand() LIMIT 5;