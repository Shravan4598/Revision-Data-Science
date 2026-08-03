

-- Q19: find all the veg restaurants?

SELECT *  FROM restaurants AS t1
RIGHT JOIN menu AS t2
ON t1.r_id=t2.r_id
LEFT JOIN food AS t3
on t2.f_id=t3.f_id
WHERE type='veg';

SELECT DISTINCT(t1.r_name) FROM restaurants AS t1
RIGHT JOIN menu AS t2
ON t1.r_id=t2.r_id
LEFT JOIN food AS t3
on t2.f_id=t3.f_id
WHERE type='veg';