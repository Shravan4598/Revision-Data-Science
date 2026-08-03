

-- Q10: find restaurants with sales > x
-- x=

-- Sum of amount is greater than 1500 display name of the restaurants
-- Find restaurants whose total revenue is greater than 1500.

SELECT t2.r_name,SUM(amount) AS 'total_revenue'
FROM orders AS t1 RIGHT JOIN restaurants AS t2
ON t1.r_id=t2.r_id 
GROUP BY t2.r_name
HAVING SUM(amount)>1500;