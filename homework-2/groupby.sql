--Задание 3
--1)
SELECT DISTINCT ship_city, ship_country FROM orders
WHERE ship_city LIKE '%burg';
--2)
SELECT order_id, customer_id, freight, ship_country FROM orders
WHERE ship_country LIKE 'P%'
ORDER BY freight DESC
LIMIT 10;
--3)
SELECT first_name, last_name, home_phone FROM employees
WHERE region IS NULL;
--4)
SELECT country, COUNT(country) FROM suppliers
GROUP BY country
ORDER BY COUNT(country) DESC
--5)
SELECT ship_country, SUM(freight) FROM orders
WHERE ship_region IS NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY SUM(freight) DESC;
--6)
SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers
INTERSECT
SELECT country FROM employees
--7)
SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers
EXCEPT
SELECT country FROM employees
