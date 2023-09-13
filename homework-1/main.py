"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import os
import csv


def get_data_from_csv(file_name: str) -> list[dict]:
    """Получение данных из csv файла"""
    with open(os.path.join("north_data", file_name), "r") as f:
        data = list(csv.reader(f))
        answer = list()
        for i in range(1, len(data)):
            answer.append(dict(zip(data[0], data[i])))

        return answer


# Подключаемся к базе данных
conn_params = {"host": "localhost",
               "database": "north",
               "user": "postgres",
               "password": os.getenv("PASSWORD")}

# Выполнение запросов

with psycopg2.connect(**conn_params) as conn:
    with conn.cursor() as cur:
        customers_data = get_data_from_csv("customers_data.csv")
        employees_data = get_data_from_csv("employees_data.csv")
        orders_data = get_data_from_csv("orders_data.csv")

        for item in customers_data:
            cur.execute("INSERT INTO customers VALUES (%s, %s, %s)", tuple(item.values()))

        for item in employees_data:
            cur.execute("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)", tuple(item.values()))

        for item in orders_data:
            cur.execute("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)", tuple(item.values()))

conn.close()
