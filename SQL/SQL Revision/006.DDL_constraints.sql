CREATE DATABASE IF NOT EXISTS csvtu;
USE csvtu;

CREATE TABLE IF NOT EXISTS users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
password VARCHAR(250) NOT NULL
);

INSERT INTO users (name, email, password)
VALUES
('Rahul Sharma', 'rahul.sharma@gmail.com', 'rahul123'),
('Priya Singh', 'priya.singh@gmail.com', 'priya456'),
('Amit Kumar', 'amit.kumar@gmail.com', 'amit789'),
('Neha Verma', 'neha.verma@gmail.com', 'neha321'),
('Rohit Gupta', 'rohit.gupta@gmail.com', 'rohit654'),
('Anjali Patel', 'anjali.patel@gmail.com', 'anjali987'),
('Vikas Yadav', 'vikas.yadav@gmail.com', 'vikas111'),
('Sneha Mishra', 'sneha.mishra@gmail.com', 'sneha222'),
('Karan Mehta', 'karan.mehta@gmail.com', 'karan333'),
('Pooja Jain', 'pooja.jain@gmail.com', 'pooja444');

SELECT * FROM users;

DROP TABLE users;