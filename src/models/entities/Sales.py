from utils.DateFormat import DateFormat


class SalesDao:
    def __init__(
        self,
        nombre=None,
        correo=None,
        nombre_producto=None,
        cantidad=None,
        subtotal=None,
        fecha=None,
        total=None,
        id=None,
    ) -> None:
        self.nombre = nombre
        self.correo = correo
        self.nombre_producto = nombre_producto
        self.cantidad = cantidad
        self.subtotal = subtotal
        self.fecha = fecha
        self.total = total
        self.id_factura = id

    def to_JSON(self):
        return {
            "nombre": self.nombre,
            "correo": self.correo,
            "nombre_producto": self.nombre_producto,
            "cantidad": self.cantidad,
            "subtotal": self.subtotal,
            "fecha": DateFormat.convert_date(self.fecha),
            "total": self.total,
            "id_factura": self.id_factura,
        }
