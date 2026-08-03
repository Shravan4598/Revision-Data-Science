

-- Q05: find the number of orders placed by each customer

SELECT * FROM orders AS t1
RIGHT JOIN  users AS t2
ON t1.user_id=t2.user_id;

SELECT name,COUNT(*) AS 'number_of_orders' 
FROM orders AS t1
RIGHT JOIN  users AS t2
ON t1.user_id=t2.user_id
GROUP BY name;


