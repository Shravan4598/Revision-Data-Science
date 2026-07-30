CREATE DATABASE IF NOT EXISTS csvtu;
USE csvtu;


CREATE TABLE IF NOT EXISTS student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT DEFAULT 15,
    CONSTRAINT students_age_check CHECK (age > 6 AND age < 25)
);

INSERT INTO student (name, age)
VALUES
('Rahul Sharma', 18),
('Priya Singh', 20),
('Amit Kumar', 19),
('Neha Verma', 21),
('Rohit Gupta', 17),
('Anjali Patel', DEFAULT),
('Vikas Yadav', 23),
('Sneha Mishra', 16),
('Karan Mehta', 24),
('Pooja Jain', 15);



SELECT * FROM student;

ALTER TABLE student
MODIFY COLUMN name VARCHAR(100) NOT NULL;

ALTER TABLE student
MODIFY COLUMN age INT DEFAULT 18;

INSERT INTO student (name, age) VALUES ('Shravan',DEFAULT);

SELECT * FROM student;
