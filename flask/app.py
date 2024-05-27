from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def index():
    return 'Web App with Python Flask!'

if __name__ == '__main__':
    port = int(os.getenv('PORT', 81))
    app.run(host='0.0.0.0', port=port)