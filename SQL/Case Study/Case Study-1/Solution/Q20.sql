

-- Q20: find min and max order value for all the customers?


SELECT t1.name,MAX(amount) AS 'max_order',MIN(amount) AS 'min_order' FROM users AS t1
RIGHT JOIN orders AS t2
ON t1.user_id=t2.user_id
GROUP BY t1.name;
