from .app import db

class Client(db.Model):
    __tablename__ = 'users'

    userid = db.Column(db.Integer, primary_key=True)
    firstname = db.Column(db.String())
    lastname = db.Column(db.String())
    email = db.Column(db.String())
    username = db.Column(db.String())
    
    def __init__(self, firstname, lastname, email, username):
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.username = username

    def __repr__(self):
        return '<userid {}>'.format(self.userid)
    
    def serialize(self):
        return {
            'userid': self.userid, 
            'firstname': self.firstname,
            'lastname': self.lastname,
            'email': self.email,
            'username': self.username
        }

class Order(db.Model):
    __tablename__ = 'orders'

    orderid = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.String())
    totalprice = db.Column(db.Float)
    rating = db.Column(db.Float)
    clientid = db.Column(db.Integer)
    locationid = db.Column(db.Integer)
    
    def __init__(self, date, totalprice, rating, clientid, locationid):
        self.date = date
        self.totalprice = totalprice
        self.rating = rating
        self.clientid = clientid
        self.locationid = locationid

    def __repr__(self):
        return '<orderid {}>'.format(self.orderid)
    
    def serialize(self):
        return {
            'orderid': self.orderid, 
            'date': self.date,
            'totalprice': self.totalprice,
            'rating': self.rating,
            'clientid': self.clientid,
            'locationid': self.locationid
        }