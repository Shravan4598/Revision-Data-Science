

-- Q11: find customers who have never ordered?

SELECT t2.name,COUNT(*) AS 'num_of_order'
FROM orders AS t1 
RIGHT JOIN users AS t2
ON t1.user_id=t2.user_id
GROUP BY t1.user_id,t2.name;

-- ANSWER

SELECT t2.name
FROM orders AS t1 
RIGHT JOIN users AS t2
ON t1.user_id=t2.user_id
WHERE t1.order_id IS NULL;