CREATE DATABASE IF NOT EXISTS csvtu;
USE csvtu;

CREATE TABLE IF NOT EXISTS customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
email VARCHAR(100) NOT NULL UNIQUE
);


INSERT INTO customers (name, email)
VALUES
('Rahul Sharma', 'rahul.sharma@gmail.com'),
('Priya Singh', 'priya.singh@gmail.com'),
('Amit Kumar', 'amit.kumar@gmail.com'),
('Neha Verma', 'neha.verma@gmail.com'),
('Rohit Gupta', 'rohit.gupta@gmail.com'),
('Anjali Patel', 'anjali.patel@gmail.com'),
('Vikas Yadav', 'vikas.yadav@gmail.com'),
('Sneha Mishra', 'sneha.mishra@gmail.com'),
('Karan Mehta', 'karan.mehta@gmail.com'),
('Pooja Jain', 'pooja.jain@gmail.com');

SELECT * FROM customers;

TRUNCATE customers;

