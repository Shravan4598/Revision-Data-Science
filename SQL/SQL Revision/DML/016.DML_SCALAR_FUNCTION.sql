SELECT ABS(price-100000) AS 'temp' FROM cstvu.smartphones;

SELECT model,resolution_width,resolution_height,screen_size,
ROUND(SQRT( resolution_width*resolution_width + resolution_height*resolution_height)/screen_size) AS 'ppi' FROM csvtu.smartphones;

SELECT model,resolution_width,resolution_height,screen_size,
ROUND(SQRT( resolution_width*resolution_width + resolution_height*resolution_height)/screen_size,2) AS 'ppi' FROM csvtu.smartphones;

SELECT * FROM csvtu.smartphones;

SELECT CEIL(processor_speed) FROM csvtu.smartphones;

SELECT FLOOR(processor_speed) FROM csvtu.smartphones;