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

module.exports = router;
