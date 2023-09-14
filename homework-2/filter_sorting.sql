--Задание 2
--1)
SELECT * FROM orders
WHERE ship_country IN ('France', 'Germany', 'Spain');
--2)
SELECT DISTINCT ship_country, ship_city FROM orders
ORDER BY ship_country, ship_city;
--3)
SELECT AVG(shipped_date-order_date) FROM orders
WHERE ship_country='Germany';
--4)
SELECT MIN(unit_price), MAX(unit_price) FROM products
WHERE discontinued <>  1;
--5)
SELECT MIN(unit_price), MAX(unit_price) FROM products
WHERE discontinued <> 1 AND units_in_stock >= 20;
