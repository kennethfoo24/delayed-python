from flask import Flask
import time

app = Flask(__name__)

def recursive_function(count):
    if count <= 0:
        return "Thanos: You should have gone for the head !"
    time.sleep(0.2)  # Simulate some processing time
    return recursive_function(count - 1)

@app.route('/delayed-response', methods=['GET'])
def delayed_response():
    time.sleep(2)  # 2-second delay
    result = recursive_function(10)
    return result

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
