SELECT product_name, units_on_order, contact, phone FROM products, suppliers
WHERE discontinued != 1 AND units_on_order <= 20 AND (category_id = 1 or category_id = 8)
--4.1. Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood, которых в продаже менее 20 единиц. Вывести наименование продуктов, кол-во единиц в продаже, имя контакта поставщика и его телефонный номер.
