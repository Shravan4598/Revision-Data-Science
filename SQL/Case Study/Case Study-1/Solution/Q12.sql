

-- Q12: Show order details of a particular customer in a given date range

-- user_id=2 AND DATE:15/02/2022 TO 15/06/2022

SELECT * FROM orders 
WHERE user_id=2 AND date BETWEEN '2022-05-15' AND '2022-06-15';

-- ANSWER
SELECT t1.order_id,t1.amount,t1.date,t3.f_id,t3.f_name,t3.type FROM orders AS t1
LEFT JOIN order_details AS t2 ON t1.order_id=t2.order_id
LEFT JOIN food AS t3 ON t2.f_id=t3.f_id
WHERE t1.user_id=2 AND date BETWEEN '2022-05-15' AND '2022-06-15';


