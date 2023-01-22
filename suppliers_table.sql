CREATE TABLE suppliers
(
    suppliers_id serial PRIMARY KEY,
    company_name varchar NOT NULL,
    contact varchar NOT NULL,
    address text,
    city varchar(100),
    region varchar(100) DEFAULT NULL,
    postal_code varchar(100) DEFAULT NULL,
    country varchar(100),
    phone varchar(50) NOT NULL,
    fax varchar(50),
    homepage text
);

ALTER TABLE products ADD COLUMN suppliers_id int;
-- Добавить информацию о поставщике в таблицу с товарами
ALTER TABLE products ADD CONSTRAINT fk_products_suppliers_id FOREIGN KEY(suppliers_id) REFERENCES suppliers(suppliers_id);
-- Связать две таблицы по ключу
