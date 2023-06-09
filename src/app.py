from flask import Flask

from config import config

# Routes
from routes import Sales

app = Flask(__name__)


def page_not_found(error):
    return {"mensaje": "Pagina no encontrada"}, 404


if __name__ == "__main__":
    app.config.from_object(config["development"])
    # Bluteprints
    app.register_blueprint(Sales.main, url_prefix="/api/v1/")
    # Error handlers
    app.register_error_handler(404, page_not_found)
    app.run()
