SELECT * FROM csvtu.smartphones
WHERE price>10000 AND price<50000;

--         OR

SELECT * FROM csvtu.smartphones
WHERE price BETWEEN 10000 AND 20000;


SELECT * FROM csvtu.smartphones
WHERE price>10000 AND price<50000;


SELECT * FROM csvtu.smartphones
WHERE price<20000 AND rating>80;

SELECT * FROM csvtu.smartphones
WHERE price<15000 AND rating>80;


SELECT * FROM csvtu.smartphones
WHERE price<15000 AND rating>80 AND processor_brand='snapdragon';

SELECT * FROM csvtu.smartphones WHERE brand_name='samsung' AND ram_capacity>8;

SELECT * FROM csvtu.smartphones WHERE brand_name='samsung' AND processor_brand='snapdragon';

