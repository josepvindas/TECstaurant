import markdown
import os

# Import the framework
from flask import Flask, jsonify
from flask_restful import Api, Resource
from neo4j import GraphDatabase
# Create an instance of flask
app = Flask(__name__)

# Create the RestfulAPI
api = Api(app)

# Create Neo4j Driver
driver = GraphDatabase.driver("bolt://neo4j:7687", auth=("neo4j", "123456"))
session = driver.session()
q1="MATCH (l:Location) RETURN l.name"

# Handle root request
@app.route("/")
def index(): 
  #Open README.md
  with open(os.path.dirname(app.root_path) + '/README.md', 'r') as markdown_file:
    # Read the content of the file
    content = markdown_file.read()

    # convert to html
    return markdown.markdown(content)

# Create RestAPI resources
class LocationList(Resource):
  def get(self):
    data = session.run(q1)
    records = []
    for record in data: 
      records.append({"location":record["l.name"]})
    return {'message':'Success', 'data':jsonify(records)}

# Append resources to API
api.add_resource(LocationList, '/locations')