import pymysql.cursors
import pymysql
from pymysql import DatabaseError
from decouple import config


def get_connection():
    try:
        return pymysql.connect(
            host=config("MYSQL_HOST"),
            user=config("MYSQL_USER"),
            password=config("MYSQL_PASSWORD"),
            database=config("MYSQL_DATABASE"),
            charset="utf8mb4",
            cursorclass=pymysql.cursors.DictCursor,
        )
    except DatabaseError as ex:
        print("Error en la conexión de la bd : ", ex)
        raise ex
