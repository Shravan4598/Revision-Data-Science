CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.18: Group smartphones by the brand, and 
-- find the brand with the highest number of models that have both NFC and an IR blaster?

SELECT brand_name, COUNT(*) AS 'model_num' , has_nfc,has_ir_blaster
FROM smartphones_data 
WHERE has_nfc='True' and has_ir_blaster='True'
GROUP BY brand_name
ORDER BY model_num DESC;