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

// Get all locations
router.get('/', (req, res) => {
  var query = 'MATCH (n:Location) RETURN n';
  cb = (err, data) => {
    console.log(JSON.stringify(data));
    var resultArray = [];
    for (var i = 0; i < data.results[0].data.length; i++) {
      resultArray.push(data.results[0].data[i].row[0]);
    }
    res.send({ locations: resultArray });
  };
  cypher(query, null, cb);
});

// Get location by id
router.get('/:id', (req, res) => {
  var query = 'MATCH (l:Location) WHERE l.id = ' + req.params.id + ' RETURN l';
  cb = (err, data) => {
    try {
      res.send(data.results[0].data[0].row[0]);
    } catch (error) {
      res.send({ status: 'Failed', message: error.message });
    }
  };
  cypher(query, null, cb);
});

// Get location's menu
router.get('/:id/menu', (req, res) => {
  var query =
    'MATCH (p:Product), (l:Location) WHERE l.id = ' +
    req.params.id +
    ' AND (l)-[:SELLS]->(p) RETURN p';
  cb = (err, data) => {
    var resultArray = [];
    for (var i = 0; i < data.results[0].data.length; i++) {
      resultArray.push(data.results[0].data[i].row[0]);
    }
    res.send({ menu: resultArray });
  };
  cypher(query, null, cb);
});

// Get location's service list
router.get('/:id/services', (req, res) => {
  var query =
    'MATCH (s:Service), (l:Location) WHERE l.id = ' +
    req.params.id +
    ' AND (l)-[:OFFERS]->(s) RETURN s';
  cb = (err, data) => {
    console.log(JSON.stringify(data));
    var resultArray = [];
    for (var i = 0; i < data.results[0].data.length; i++) {
      resultArray.push(data.results[0].data[i].row[0]);
    }
    res.send({ services: resultArray });
  };
  cypher(query, null, cb);
});

// POST a new location
router.post('/', (req, res) => {
  var location = req.body;
  var query =
    'CREATE (p:Location {id:' +
    location.id +
    ", name:'" +
    location.name +
    "', address:'" +
    location.address +
    "' })";
  cb = (err, data) => {
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      res.send({ status: 'Success', message: 'Added location successfully!' });
    }
  };
  cypher(query, null, cb);
});

// Delete a location
router.delete('/:id', (req, res) => {
  var query =
    'MATCH (n:Location) WHERE n.id = ' +
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

// Update location
router.put('/:id', (req, res) => {
  var location = req.body;
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
    'MATCH (p:Location) WHERE p.id = ' +
    id +
    ' SET p = { id: ' +
    id +
    ", name: '" +
    location.name +
    "', address: " +
    "'" +
    location.address +
    "' } RETURN p";
  cypher(query, null, cb);
});

module.exports = router;
