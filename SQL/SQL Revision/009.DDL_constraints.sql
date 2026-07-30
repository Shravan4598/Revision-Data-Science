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
VALUES ('Rahul Sharma', 'rahul@gmail.com', 20, 'MALE');

INSERT INTO student (name, email, age, gender)
VALUES ('Priya Singh', 'priya@gmail.com', 19, 'FEMALE');

INSERT INTO student (name, email, age, gender)
VALUES ('Amit Kumar', 'amit@gmail.com', 21, 'MALE');

INSERT INTO student (name, email, age, gender)
VALUES ('Rohit Gupta', 'rohit@gmail.com', DEFAULT, 'MALE');

INSERT INTO student (name, email, age, gender)
VALUES ('Pooja Jain', 'pooja@gmail.com', DEFAULT, DEFAULT);


SELECT * FROM student;

TRUNCATE student;
