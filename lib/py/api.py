from flask import Flask,request,jsonify

app = Flask(__name__)
@app.route("/signin",methods=['POST','GET'])
def signin():
       print(request.form)
       return "done"

