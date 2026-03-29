import os
from flask import Flask, jsonify

app = Flask(__name__)

APP_NAME = os.getenv("APP_NAME", "devops-app-2")
APP_ENV = os.getenv("APP_ENV", "dev")
APP_VERSION = os.getenv("APP_VERSION", "1.0.0")

@app.route("/")
def home():
    return f"Hello from {APP_NAME}!"

@app.route("/health")
def health():
    return jsonify({"status": "ok"}) 

@app.route("/info")
def info():
    return jsonify({
        "app": APP_NAME,
        "environment": APP_ENV,
        "version": APP_VERSION,
        "message": f"Version {APP_VERSION} rollback dev test"
    })

@app.route("/version")
def version():
    return jsonify({
        "version": APP_VERSION
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
