from flask import Flask,request,json

app = Flask(__name__)
@app.route("/signin",methods=['POST','GET'])
def signin():
       print(request.json)
       return json.dumps({"message":"done"})

