USE zomato;

-- Q01: Find all users who never ordered?

SELECT user_id FROM orders;
SELECT DISTINCT(user_id) FROM orders;

SELECT user_id,name FROM users
WHERE user_id NOT IN (SELECT DISTINCT(user_id) FROM orders);