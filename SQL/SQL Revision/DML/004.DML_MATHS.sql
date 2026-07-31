SELECT * FROM csvtu.smartphones;

SELECT model, resolution_width*resolution_width FROM csvtu.smartphones;

SELECT model,resolution_width*resolution_width,resolution_height*resolution_height, 
resolution_width*resolution_width + resolution_height*resolution_height FROM csvtu.smartphones;

SELECT model,resolution_width*resolution_width,resolution_height*resolution_height,
SQRT( resolution_width*resolution_width + resolution_height*resolution_height) FROM csvtu.smartphones;

SELECT model,resolution_width*resolution_width,resolution_height*resolution_height,
SQRT( resolution_width*resolution_width + resolution_height*resolution_height)/screen_size FROM csvtu.smartphones;

SELECT model,resolution_width*resolution_width,resolution_height*resolution_height,
SQRT( resolution_width*resolution_width + resolution_height*resolution_height)/screen_size AS 'ppi' FROM csvtu.smartphones;

SELECT model,resolution_width,resolution_height,screen_size,
SQRT( resolution_width*resolution_width + resolution_height*resolution_height)/screen_size AS 'ppi' FROM csvtu.smartphones;


