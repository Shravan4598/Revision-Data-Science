CREATE DATABASE IF NOT EXISTS csvtu;
USE csvtu;

CREATE TABLE IF NOT EXISTS users(
user_id INT,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
password VARCHAR(250) NOT NULL,

CONSTRAINT users_email_unique UNIQUE (email),
CONSTRAINT users_name_user_id_unique UNIQUE (user_id,name)
);

INSERT INTO users (user_id, name, email, password)
VALUES
(1, 'Rahul Sharma', 'rahul.sharma@gmail.com', 'rahul123'),
(NULL, 'Priya Singh', 'priya.singh@gmail.com', 'priya456'),
(3, 'Amit Kumar', 'amit.kumar@gmail.com', 'amit789'),
(4, 'Neha Verma', 'neha.verma@gmail.com', 'neha321'),
(5, 'Rohit Gupta', 'rohit.gupta@gmail.com', 'rohit654'),
(6, 'Anjali Patel', 'anjali.patel@gmail.com', 'anjali987'),
(NULL, 'Vikas Yadav', 'vikas.yadav@gmail.com', 'vikas111'),
(8, 'Sneha Mishra', 'sneha.mishra@gmail.com', 'sneha222'),
(9, 'Karan Mehta', 'karan.mehta@gmail.com', 'karan333'),
(10, 'Pooja Jain', 'pooja.jain@gmail.com', 'pooja444');

SELECT * FROM users;

DROP TABLE users;