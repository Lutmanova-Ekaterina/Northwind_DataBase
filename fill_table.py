import json

suppliers_table = dict()


def fill_table(connect, file):
    """ скрипт для добавления данных в таблицу suppliers из файла suppliers.json """
    with connect.cursor() as curr:
        with open(f'{file}') as file:
            suppliers = json.load(file)
            for column in suppliers:
                new_address = column['address'].split(';') # оздаем список
                curr.execute("INSERT INTO suppliers(company_name, contact, address, city, region, postal_code, country, phone, fax, homepage) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s) RETURNING supplier_id", (column['company_name'], column['contact'], new_address[0], new_address[1], new_address[2], new_address[3], new_address[4], column['phone'], column['fax'], column['homepage']))
                new_row = curr.fetchone()[0]
                for product in column['products']:
                    suppliers_table[product] = new_row
            row = []
            for i, n in suppliers_table.items():
                name = i
                name = name.replace("'", "''")
                row += f"UPDATE products SET supplier_id = {n} WHERE product_name = '{name}': "
            curr.execute(row)
            connect.commit()


