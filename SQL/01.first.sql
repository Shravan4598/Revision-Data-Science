CREATE DATABASE practice_db;
USE practice_db;
create table amazon_orders
(
order_id integer,
order_date date,employee
product_name varchar(50),
total_price decimal(10,2),
payment_method varchar(15)
); 
insert into amazon_orders values (1,'2023-10-01','cricket bat',1200,'UPI');
insert into amazon_orders values (2,'2024-10-01','cricket ball',70,'UPI');
insert into amazon_orders values (3,'2025-10-01','Wicket',300,'UPI');
insert into amazon_orders values (2,'2022-10-01','cream',150,'Credit Card');
insert into amazon_orders values (3,'2026-10-01','bag',500,'Cash');

select * from amazon_orders;

select order_date from amazon_orders;

select order_date,product_name from amazon_orders;

select product_name,order_date from amazon_orders;

select * from amazon_orders limit 2;

select * from amazon_orders order by order_date;

select * from amazon_orders order by order_date desc;

select * from amazon_orders order by payment_method;

select * from amazon_orders order by payment_method desc;

select * from amazon_orders order by payment_method,order_id;

select * from amazon_orders order by payment_method,order_id desc;

delete from amazon_orders;
-- drop table amazon_orders;
