CREATE DATABASE IF NOT EXISTS CSVTU;
USE CSVTU;

CREATE TABLE users(
user_id INTEGER,
name VARCHAR(100),
email VARCHAR(255),
password VARCHAR(255)
)


INSERT INTO users values(1,'Shravan','skp@gmail.com','abc1234');
INSERT INTO users values(1,'Bhanu','bkp@gmail.com','abc1234');
INSERT INTO users values(1,'Abhishek','akp@gmail.com','abc1234');
INSERT INTO users values(1,'Dhiraj','dkp@gmail.com','abc1234');

SELECT * FROM users

TRUNCATE TABLE users;

DROP TABLE IF EXISTS users;

DROP DATABASE IF EXISTS CSVTU;
