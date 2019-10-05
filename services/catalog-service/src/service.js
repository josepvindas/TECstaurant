const express = require('express');
const bodyParser = require('body-parser');
const request = require('request');
const Config = require('./config');

// Routes
const LocationRoute = require('./routes/locations.route');
const ProductRoute = require('./routes/products.route');

// Express server with GraphQL endpoint
const server = express();

// Middleware
server.use(bodyParser.json());
server.use('/locations', LocationRoute);
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
/*
// DATABASE CREATION QUERY
locationArr = [
  CREATE (Alajuela:Location{ name: 'TECstaurant - Alajuela', address:'Center of Alajuela'}),
  CREATE (Cartago:Location{ name: 'TECstaurant - Cartago', address:'Center of Cartago'}),
  CREATE (Guanacaste:Location{ name: 'TECstaurant - Guanacaste', address:'Center of Guanacaste'}),
  CREATE (Heredia:Location{ name: 'TECstaurant - Heredia', address:'Center of Heredia'}),
  CREATE (Limon:Location{ name: 'TECstaurant - Limon', address:'Center of Limon'}),
  CREATE (Puntarenas:Location{ name: 'TECstaurant - Puntarenas', address:'Center of Puntarenas'}),
  CREATE (SanJose:Location{ name: 'TECstaurant - San Jose', address:'Center of San Jose'}),
  CREATE (Escazu:Location{ name: 'TECstaurant - Escazu', address:'Center of Escazu'}),
  CREATE (Lindora:Location{ name: 'TECstaurant - Lindora', address:'Center of Lindora'}),
  CREATE (TresRios:Location{ name: 'TECstaurant - TresRios', address:'Center of TresRios'})
];

productArr = [
  "CREATE (p:Product { name:'Beer', price:'$4', description:'600ml bottle of local beer'})",
  "CREATE (p:Product { name:'Wine', price:'$12', description:'600ml bottle of red wine' })"
];

init = () => {
  rebuild = () => {};
  var query = 'MATCH (n) \n DETACH DELETE n';
  cypher(query, null, rebuild);
  addLocations();
  addProducts();
};

addLocations = () => {
  cb = () => {};
  for (var i = 0; i < locationArr.length; i++) {
    cypher(locationArr[i], null, cb);
  }
};

addProducts = () => {
  cb = () => {};
  for (var i = 0; i < productArr.length; i++) {
    cypher(productArr[i], null, cb);
  }
};

*/
// Start server
const PORT = 4000;
server.listen(PORT, () => {
  console.log('[status: Starting] => Initializing Database');
  console.log('[status: Done] => Listening on port ' + PORT);
});

module.exports = server;
