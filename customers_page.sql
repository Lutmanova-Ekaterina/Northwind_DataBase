SELECT COUNT(*) FROM customers
--1.1. Посчитать количество заказчиков

SELECT DISTINCT city, country FROM customers
--1.2. Выбрать все уникальные сочетания городов и стран, в которых "зарегестрированы" заказчики

SELECT customers.company_name, CONCAT(employees.first_name, ' ', employees.last_name) AS full_name FROM orders
LEFT JOIN employees USING(city),
LEFT JOIN shippers ON employees.reports_to = shippers.shipper_id,
WHERE city = 'London' AND shippers.company_name = 'Speedy Express';
--1.3. Найти заказчиков и обслуживающих их заказы сотрудников, таких, что и заказчики и сотрудники из города London, а доставка идёт компанией Speedy Express. Вывести компанию заказчика и ФИО сотрудника.

SELECT customers.contact_name, orders.order_id FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id,
WHERE orders.order_id IS NULL;
--1.4. Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и order_id.
