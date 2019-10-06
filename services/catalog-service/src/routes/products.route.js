const express = require('express');
const request = require('request');
const Config = require('../config');

// Route management
const router = express.Router();

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

// GET all available products
router.get('/', (req, res) => {
  var query = 'MATCH (n:Product) RETURN n';
  cb = (err, data) => {
    console.log(JSON.stringify(data));
    var resultArray = [];
    for (var i = 0; i < data.results[0].data.length; i++) {
      resultArray.push({ Product: data.results[0].data[i].row[0] });
    }
    res.send({ result: resultArray });
  };
  cypher(query, null, cb);
});

// GET product by id
router.get('/:id', (req, res) => {
  var query =
    'MATCH (n:Product) WHERE n.id = ' + req.params.id.toString() + ' RETURN n';
  cb = (err, data) => {
    try {
      res.send({ status: 'Success', product: data.results[0].data[0].row[0] });
    } catch (error) {
      res.send({ status: 'Failed', message: error.message });
    }
  };
  cypher(query, null, cb);
});

// POST a new product
router.post('/', (req, res) => {
  var product = req.body;
  var query =
    'CREATE (p:Product {id:' +
    product.id +
    ", name:'" +
    product.name +
    "', price:'" +
    product.price +
    "', description:'" +
    product.description +
    "' })";
  cb = (err, data) => {
    if (err) {
      res.send({ status: 'Failed', error: err });
    } else {
      res.send({ status: 'Success', data: data });
    }
  };
  cypher(query, null, cb);
});

module.exports = router;
