

-- Q14: find most costly restaurants(Avg price/dish)


SELECT t1.r_name,AVG(price) AS 'avg_price' FROM restaurants AS t1 
LEFT JOIN menu AS t2 
ON t1.r_id=t2.r_id
GROUP BY t1.r_name
ORDER BY avg_price DESC;

SELECT t1.r_name,AVG(price) AS 'avg_price_per_dish' FROM restaurants AS t1 
LEFT JOIN menu AS t2 
ON t1.r_id=t2.r_id
GROUP BY t1.r_name
ORDER BY avg_price_per_dish DESC
LIMIT 1;
