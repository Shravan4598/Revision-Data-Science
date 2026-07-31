SELECT * FROM csvtu.smartphones WHERE processor_brand='mediatek';

UPDATE csvtu.smartphones 
SET processor_brand='dimensity' 
WHERE processor_brand='mediatek';

SELECT * FROM csvtu.smartphones WHERE processor_brand='mediatek';


SELECT * FROM csvtu.users;

UPDATE csvtu.users 
SET email='amit.kumar@yahoo.com' , password ='1234567890'
WHERE name='Amit Kumar';

SELECT * FROM csvtu.users;
