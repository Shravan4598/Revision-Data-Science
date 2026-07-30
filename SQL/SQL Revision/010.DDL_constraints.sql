CREATE DATABASE IF NOT EXISTS csvtu;
USE csvtu;

CREATE TABLE IF NOT EXISTS student(
roll_number INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
age INT DEFAULT 18,
gender VARCHAR(30) DEFAULT 'Rather can not say',
registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO student (name, email, age, gender)
VALUES
('Rahul Sharma', 'rahul@gmail.com', 20, 'MALE'),
('Priya Singh', 'priya@gmail.com', 19, 'FEMALE'),
('Amit Kumar', 'amit@gmail.com', 21, 'MALE');

INSERT INTO student (name, email, gender)
VALUES
('Neha Verma', 'neha@gmail.com', 'FEMALE'),
('Rohit Gupta', 'rohit@gmail.com', 'MALE'),
('Anjali Patel', 'anjali@gmail.com', 'FEMALE');

INSERT INTO student (name, email)
VALUES
('Vikas Yadav', 'vikas@gmail.com'),
('Sneha Mishra', 'sneha@gmail.com'),
('Karan Mehta', 'karan@gmail.com'),
('Pooja Jain', 'pooja@gmail.com');


SELECT * FROM student;

TRUNCATE student;
