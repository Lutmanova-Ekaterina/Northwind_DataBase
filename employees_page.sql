SELECT last_name, first_name, home_phone, region FROM employees WHERE region IS NULL;
--3.1. Выбрать записи работников (включить колонки имени, фамилии, телефона, региона) в которых регион неизвестен

SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers
EXCEPT
SELECT country FROM employees;
--3.2. Выбрать такие страны в которых "зарегистированы" одновременно заказчики и поставщики, но при этом в них не "зарегистрированы" работники