SELECT MAX(price) FROM csvtu.smartphones;

SELECT MIN(price) FROM csvtu.smartphones;

SELECT AVG(price) FROM csvtu.smartphones;

SELECT * FROM csvtu.smartphones;

SELECT MAX(ram_capacity) FROM csvtu.smartphones;

SELECT MIN(ram_capacity) FROM csvtu.smartphones;

SELECT MAX(price) FROM csvtu.smartphones WHERE brand_name='samsung';

SELECT * FROM csvtu.smartphones WHERE price='110999';

SELECT AVG(rating) FROM csvtu.smartphones WHERE brand_name='apple';
SELECT AVG(price) FROM csvtu.smartphones WHERE brand_name='apple';

SELECT SUM(price) FROM csvtu.smartphones;
SELECT SUM(price) FROM csvtu.smartphones WHERE brand_name='apple';

SELECT COUNT(brand_name) FROM csvtu.smartphones WHERE brand_name='samsung';
SELECT COUNT(*) FROM csvtu.smartphones WHERE brand_name='samsung';

SELECT COUNT(DISTINCT(brand_name)) FROM csvtu.smartphones ;
SELECT COUNT(DISTINCT(processor_brand)) FROM csvtu.smartphones ;

SELECT STD(screen_size) FROM csvtu.smartphones;
SELECT VARIANCE(screen_size) FROM csvtu.smartphones;
