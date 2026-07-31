SELECT DISTINCT(processor_brand) FROM csvtu.smartphones;

SELECT DISTINCT(brand_name) FROM csvtu.smartphones WHERE 
processor_brand='snapdragon' OR processor_brand='exinos' OR processor_brand='bionic';

SELECT * FROM csvtu.smartphones WHERE 
processor_brand='snapdragon' OR processor_brand='exinos' OR processor_brand='bionic';

SELECT * FROM csvtu.smartphones WHERE processor_brand IN ('snapdragon','exinos' ,'bionic');

SELECT * FROM csvtu.smartphones WHERE processor_brand NOT IN ('snapdragon','exinos' ,'bionic');