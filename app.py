from flask import Flask, request, jsonify, logging
# from ddtrace import tracer, patch; patch(logging=True)
from flask_cors import CORS
import requests as req
import time
import logging
import sys
import uuid

FORMAT = ('%(asctime)s %(levelname)s [%(name)s] [%(filename)s:%(lineno)d] '
          '[dd.service=%(dd.service)s dd.env=%(dd.env)s dd.trace_id=%(dd.trace_id)s dd.span_id=%(dd.span_id)s] '
          '- %(message)s')
logging.basicConfig(stream=sys.stdout, format=FORMAT)
log = logging.getLogger(__name__)
log.setLevel(logging.INFO)

app = Flask(__name__)

def recursive_function(count):
    if count <= 0:
        return jsonify('Thanos: You should have gone for the head!')
    time.sleep(0.1)  # Simulate some processing time
    return recursive_function(count - 1)

@app.route('/delayed-response', methods=['GET'])
def delayed_response():
    log.info('Thanos: You should have gone for the head!')
    log.info('Thanos: I am inevitable!')
    log.info('Thanos: Perfectly Balanced, As All Things Should Be.')
    time.sleep(2)  # 2-second delay
    result = recursive_function(20)
    return result

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
