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
  var relationshipArr = [];
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
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      cb2 = (err, data) => {
        var resultArray = [];
        for (var i = 0; i < data.results[0].data.length; i++) {
          resultArray.push(data.results[0].data[i].row[0]);
        }
        console.log(resultArray);
        for (var i = 0; i < resultArray.length; i++) {
          cb3 = (err, data) => {
            console.log(relationshipArr);
            relationshipArr.push(data);
            console.log(relationshipArr);
            console.log(data.data);
          };
          var query3 =
            'MATCH (p:Product), (l:Location) WHERE p.id = ' +
            product.id.toString() +
            ' AND l.id = ' +
            resultArray[i].id +
            ' CREATE (l)-[r:SELLS]->(p) RETURN r';
          cypher(query3, null, cb3);
        }
      };

      var query2 = 'MATCH (l:Location) RETURN l';
      cypher(query2, null, cb2);
      res.send({ status: 'Success', message: 'Added node successfully!' });
    }
  };
  cypher(query, null, cb);
});

// POST a new product to a specific Location
router.post('/:id', (req, res) => {
  var product = req.body;
  var location = req.params.id;
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
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      cb2 = (err, data) => {};

      var query2 =
        'MATCH (p:Product), (l:Location) WHERE p.id = ' +
        product.id.toString() +
        ' AND l.id = ' +
        location +
        ' CREATE (l)-[r:SELLS]->(p) RETURN r';
      cypher(query2, null, cb2);
      res.send({ status: 'Success', message: 'Added node successfully' });
    }
  };
  cypher(query, null, cb);
});

// Delete a product
router.delete('/:id', (req, res) => {
  var query =
    'MATCH (n:Product) WHERE n.id = ' +
    req.params.id.toString() +
    ' DETACH DELETE n';
  cb = (err, data) => {
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      res.send({ status: 'Success', message: 'Deleted Product successfully' });
    }
  };
  cypher(query, null, cb);
});

// Update product
router.put('/:id', (req, res) => {
  var product = req.body;
  var id = req.params.id;
  cb = (err, data) => {
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      console.log(data);
      res.send({ status: 'Success', message: 'Updated product successfully' });
    }
  };
  var query =
    'MATCH (p:Product) WHERE p.id = ' +
    id +
    ' SET p = { id: ' +
    id +
    ", name: '" +
    product.name +
    "', price: " +
    "'" +
    product.price +
    "', description: " +
    "'" +
    product.description +
    "' } RETURN p";
  cypher(query, null, cb);
});

module.exports = router;
