import psycopg2
from psycopg2 import OperationalError
from fill_table import fill_table

db = {
    'host': 'localhost',
    'database': 'Northwind Traders',
    'user': 'postgres',
    'password': '152478',
    'port': '5432'
}


def connect_db(db):
    """ Модуль для работы с БД """
    con = None
    try:
        con = psycopg2.connect(
            host=db.get('host'),
            darabase=db.get('database'),
            user=db.get('user'),
            password=db.get('password'),
            port=db.get('port')
        )
        print(f"Connect to DataBase")
    except OperationalError as o:
        print(f"The Error {o} occurred")
    return con


def get_product_by_id(config, id):
    """ Функция возвращает id продукта, наименование продукта, наименование категории продукта, цену продукта по указанному id """
    connection = connect_db(config)
    request = f"SELECT product_id, product_name, categories.category_name, unit_price" \
              f"FROM products INNER JOIN categories USING(category_id" \
              f"WHERE product_id = {id}"
    with connection.cursor() as curr:
        curr.execute(request)
        rows = curr.fetchall()
        for row in rows:
            return print(f"id продукта: {row[0]}, наименование продукта: {row[1]}, наименование категории продукта: {row[2]}, цена продукта: {row[3]}")


def get_category_by_id(config, id):
    """ Функция возвращает id категории, наименование категории, описание категории; список продуктов, относящихся к этой категории по указанному id """
    products = list()
    con = connect_db(config)
    request = f"SELECT categories.category_id, categories.category_name, categories.description, product_name" \
              f"FROM products INNER JOIN categories USING(category_id" \
              f"WHERE category_id = {id}"
    with con.cursor() as curr:
        curr.execute(request)
        rows = curr.fetchall()
        for row in rows:
            products.append(row[3])
        return print(f"id категории: {row[0]}, наименование категории: {row[1]}, писание категории: {row[2]}, писок продуктов, относящихся к этой категории: {products}")


if __name__ == '__main__':
    connect = connect_db(db)
    fill_table(connect, 'suppliers.json')
    get_category_by_id(db, 1)
    get_product_by_id(db, 1)
