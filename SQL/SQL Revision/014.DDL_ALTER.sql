CREATE DATABASE IF NOT EXISTS csvtu;
USE csvtu;


CREATE TABLE IF NOT EXISTS student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    CONSTRAINT students_age_check CHECK (age > 6 AND age < 25)
);

INSERT INTO student (name, age)
VALUES
('Rahul Sharma', 18),
('Priya Singh', 20),
('Amit Kumar', 19),
('Neha Verma', 21),
('Rohit Gupta', 17),
('Anjali Patel', 22),
('Vikas Yadav', 23),
('Sneha Mishra', 16),
('Karan Mehta', 24),
('Pooja Jain', 15);

SELECT * FROM student;

ALTER TABLE student
ADD COLUMN password VARCHAR(255);

UPDATE student
SET password = CASE student_id
    WHEN 1 THEN 'rahul123'
    WHEN 2 THEN 'priya456'
    WHEN 3 THEN 'amit789'
    WHEN 4 THEN 'neha321'
    WHEN 5 THEN 'rohit654'
    WHEN 6 THEN 'anjali987'
    WHEN 7 THEN 'vikas111'
    WHEN 8 THEN 'sneha222'
    WHEN 9 THEN 'karan333'
    WHEN 10 THEN 'pooja444'
END;

ALTER TABLE student ADD COLUMN surname VARCHAR(35) NOT NULL DEFAULT "Kumar" AFTER name;

SELECT * FROM student;
