import os

class Config:
    # Database configuration
    DB_CONFIG = {
        'host': os.environ.get('DB_HOST', 'localhost'),
        'user': os.environ.get('DB_USER', 'root'),
        'password': os.environ.get('DB_PASSWORD', ''),
        'database': os.environ.get('DB_NAME', 'ahp_db'),
        'charset': 'utf8mb4',
        'cursorclass': 'DictCursor'  # Sẽ được set trong db_manager.py
    }

    # Flask configuration
    SECRET_KEY = os.environ.get('SECRET_KEY', 'my_ahp_transport_secret_key_v12_final_final_final_!@#$') 