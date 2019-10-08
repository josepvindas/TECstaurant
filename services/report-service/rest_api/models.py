# Import Neo4j-Python library
from py2neo import Graph
import os

# Create connection
graph = Graph('http://neo4j:7474/db/data', username='neo4j', password='123456')

class Location:
  def __init__(self, report_type):
    self.report_type = report_type

  def getAll(self):
    query = '''
    MATCH (l:Location) RETURN l 
    '''
    return graph.run(query)
