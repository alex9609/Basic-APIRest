from decouple import config


class Config:
    SECRET_KEY = config("SECRET_KEY")


# Configuración con el parametro de configuración activo
class DevelopmentConfig(Config):
    DEBUG = True


config = {"development": DevelopmentConfig}
