import markdown
import os

# Import the framework
from flask import Flask
from flask_restful import Api, Resource

#Import Neo4j functions
#from .models import Location
# Create an instance of flask
app = Flask(__name__)

# Create the RestfulAPI
api = Api(app)

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
    data = 'Location(2).getAll()'
    return {'message':'Success', 'data':data}

# Append resources to API
api.add_resource(LocationList, '/locations')