from database.db import get_connection
from .entities.Sales import SalesDao


class SalesModel:
    @classmethod
    def get__history_sales(self):
        try:
            connection = get_connection()
            sales_array = []
            with connection.cursor() as cursor:
                sql = """
                SELECT c.nombre, c.correo, p.nombre AS nombre_producto, df.cantidad, df.subtotal, f.fecha, f.total, f.id
                FROM cliente c
                JOIN factura f ON c.id = f.cliente_id
                JOIN detalle_factura df ON f.id= df.factura_id
                JOIN productos_deportivos p ON df.producto_id = p.id;
                """
                cursor.execute(sql)
                resultset = cursor.fetchall()
            for row in resultset:
                sale = SalesDao(
                    row["nombre"],
                    row["correo"],
                    row["nombre_producto"],
                    row["cantidad"],
                    row["subtotal"],
                    row["fecha"],
                    row["total"],
                    row["id"],
                )
                # Con sale.to_JSON volvemos serializable la clase
                sales_array.append(sale.to_JSON())
            connection.close()
            return sales_array
        except Exception as ex:
            print(ex.__cause__)
            raise Exception(ex)
