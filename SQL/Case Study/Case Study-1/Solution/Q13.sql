

-- Q13: Customer favorite food
-- customer who ordered food most of the time--> favourite food


SELECT t1.name,t4.f_name, COUNT(*) AS 'count'
FROM users AS t1
RIGHT JOIN orders AS t2
ON t1.user_id=t2.user_id
LEFT JOIN order_details AS t3
ON t2.order_id=t3.order_id
LEFT JOIN food AS t4
ON t4.f_id=t3.f_id
GROUP BY t1.name,t4.f_name;