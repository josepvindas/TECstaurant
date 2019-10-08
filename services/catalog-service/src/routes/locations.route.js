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
      resultArray.push({ Location: data.results[0].data[i].row[0] });
    }
    res.send({ result: resultArray });
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
    console.log(JSON.stringify(data));
    var resultArray = [];
    for (var i = 0; i < data.results[0].data.length; i++) {
      resultArray.push({ Product: data.results[0].data[i].row[0] });
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
      resultArray.push({ Service: data.results[0].data[i].row[0] });
    }
    res.send({ services: resultArray });
  };
  cypher(query, null, cb);
});
module.exports = router;
