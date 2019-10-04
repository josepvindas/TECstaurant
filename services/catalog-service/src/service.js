const express = require('express');
const bodyParser = require('body-parser');
const request = require('request');
const Config = require('./config');

// Routes
const ProductRoute = require('./routes/products.route');

// Express server with GraphQL endpoint
const server = express();

// Middleware
server.use(bodyParser.json());
server.use('/products', ProductRoute);

// Neo4j DB credentials
const URI = Config.uri;
const USER = Config.user;
const PASS = Config.pass;

// DB request method
cypher = (query, params, cb) => {
  request
    .post(
      {
        uri: URI,
        json: {
          statements: [
            {
              statement: query,
              parameters: params
            }
          ]
        }
      },
      (err, res) => {
        cb(err, res.body);
      }
    )
    .auth(USER, PASS, false);
};
// DATABASE CREATION QUERY
queryArr = [
  "CREATE (Alajuela:Location{ name: 'Alajuela', address:'Center of Alajuela'})",
  "CREATE (Cartago:Location{ name: 'Cartago', address:'Center of Cartago'})",
  "CREATE (Guanacaste:Location{ name: 'Guanacaste', address:'Center of Guanacaste'})"
];

init = port => {
  cb = () => {
    console.log('Added data field to Neo4j');
  };
  rebuild = () => {
    console.log('Deleting all nodes inside the DataBase');
    console.log('Initializing DataBase:');
  };
  var query = 'MATCH (n) \n DETACH DELETE n';
  cypher(query, null, rebuild);
  for (var i = 0; i < queryArr.length; i++) {
    cypher(queryArr[i], null, cb);
  }

  console.log('Done');
  console.log('Server ready on port ' + port);
};

// Start server
const PORT = 4000;
server.listen(PORT, init(PORT));

module.exports = server;
