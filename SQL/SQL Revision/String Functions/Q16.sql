

-- Q16.Compare two string?

SELECT STRCMP("Delhi","Mumbai"); --   -1

SELECT STRCMP("Mumbai","Delhi"); --   1

SELECT STRCMP("Delhi","Delhi"); --  0

SELECT STRCMP("Delhi","DELHI"); --  0


SELECT STRCMP("Delhi","delhi"); --   0

SELECT STRCMP("delhi","delHi");  -- 0


SELECT STRCMP("delhi","Mumbai"); --   -1


SELECT STRCMP("mumbai","Delhi"); --   1






