from flask import Blueprint, jsonify

main = Blueprint("sales_blueprint", __name__)

# Models
from models.SalesModel import SalesModel


@main.route("/sales")
def get_sales():
    try:
        sales = SalesModel.get__history_sales()
        return jsonify(sales)
    except Exception as ex:
        return jsonify({"message": str(ex)}), 500
