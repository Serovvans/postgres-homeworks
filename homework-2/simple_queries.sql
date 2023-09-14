--Задание 1
--1)
SELECT contact_name, city FROM customers;
--2)
SELECT order_id, shipped_date - order_date
FROM orders
--3)
SELECT DISTINCT city FROM customers
--4)
SELECT count(*) FROM orders
--5)
SELECT count(DISTINCT ship_country) FROM orders
