

-- Q17. Locate the string on a another string?

       -- OR 

-- Q17. Tell the index or position of a string in another string?


SELECT LOCATE("world","Hello world"); --  7

SELECT LOCATE("world","Hello World");  -- 7

SELECT LOCATE("o","Hello world"); -- 5

SELECT LOCATE("ll","Hello world");  -- 3

SELECT LOCATE("a","Hello world"); -- 0

SELECT LOCATE("abc","Hello world"); -- 0

SELECT LOCATE("h","Hello world"); -- 1
SELECT LOCATE("H","Hello world"); -- 1

SELECT LOCATE("o","Hello world",3); -- 5

SELECT LOCATE("o","Hello world",5); -- 5

SELECT LOCATE("o","Hello world",6); -- 8

SELECT LOCATE("O","Hello world",6); -- 8

SELECT LOCATE("O","Hello world",5); -- 5

SELECT LOCATE("O","Hello world",9); -- 0

SELECT LOCATE("o","Hello world",9); -- 0