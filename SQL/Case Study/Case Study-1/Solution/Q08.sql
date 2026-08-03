

-- Q08: find the food that is being sold at most number of restaurants

SELECT t2.f_name,COUNT(*) AS 'item_count' 
FROM menu AS t1 RIGHT JOIN food AS t2
ON t1.f_id=t2.f_id
GROUP BY t2.f_id,t2.f_name
ORDER BY item_count DESC
LIMIT 1;