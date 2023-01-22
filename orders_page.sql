SELECT * FROM orders
ORDER BY required_date DESC, shipped_date;
--2.1. Выбрать все заказы, отсортировать по required_date (по убыванию) и отсортировать по дате отгрузке (по возрастанию)

SELECT AVG(shipped_date - order_date) FROM orders WHERE ship_country = 'USA'
--2.2. Найти среднее значение дней уходящих на доставку с даты формирования заказа в USA

SELECT SUM(unit_price * quantity) FROM order_details WHERE discount != 0;
--2.3. Найти сумму, на которую имеется товаров (количество * цену) причём таких, которые не сняты с продажи (см. на поле discontinued)