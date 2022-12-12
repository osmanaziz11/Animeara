
from flask import Flask,jsonify,request,send_file
from flask_cors import CORS
import predict as predict

app = Flask(__name__)
CORS(app)
# =================
# Application Endpoints  
@app.route('/<hair>/<eyes>',methods=['GET'])
def main(hair,eyes):
    resp=predict.create(hair,eyes)
    if resp !=0:
        return send_file("predict.png", mimetype='image/png')
    else:
        return jsonify({"status":0})

app.run(debug=True,host='0.0.0.0',port=5000)

