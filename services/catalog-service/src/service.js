const express = require('express');
const bodyParser = require('body-parser');
var pretty = require('express-prettify');

// Routes
const LocationRoute = require('./routes/locations.route');
const ProductRoute = require('./routes/products.route');
const ServiceRoute = require('./routes/services.route');

// Express server with GraphQL endpoint
const server = express();

// Middleware
server.use(bodyParser.json());
server.use(pretty({ always: true }));
server.use('/locations', LocationRoute);
server.use('/products', ProductRoute);
server.use('/services', ServiceRoute);

// Start server
const PORT = 4000;
server.listen(PORT, () => {
  console.log('[status: Starting] => Initializing Database');
  console.log('[status: Done] => Listening on port ' + PORT);
});

module.exports = server;
