import os
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import func

app = Flask(__name__)

app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

@app.route("/")
def hello():
    return "Report Service"

@app.route("/getTop")
def get_top():
    import models
    try:
        #query = db.select([Order.columns.userid, db.func.count(Order.columns.orderid)]).group_by(Order.columns.clientid).order_by(db.desc(db.func.count(Order.columns.orderid)))
        orders = models.Order.query(models.Order.clientid)).
        
        
        return  jsonify([e.serialize() for e in orders])
    except Exception as e:
	    return(str(e))

if __name__ == '__main__':
    app.run()