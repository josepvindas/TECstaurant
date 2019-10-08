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

// GET all available services
router.get('/', (req, res) => {
  var query = 'MATCH (n:Service) RETURN n';
  cb = (err, data) => {
    var resultArray = [];
    for (var i = 0; i < data.results[0].data.length; i++) {
      resultArray.push(data.results[0].data[i].row[0]);
    }
    res.send({ services: resultArray });
  };
  cypher(query, null, cb);
});

// GET service by id
router.get('/:id', (req, res) => {
  var query =
    'MATCH (n:Service) WHERE n.id = ' + req.params.id.toString() + ' RETURN n';
  cb = (err, data) => {
    try {
      res.send(data.results[0].data[0].row[0]);
    } catch (error) {
      res.send({ status: 'Failed', message: error.message });
    }
  };
  cypher(query, null, cb);
});

// POST a new Service
router.post('/', (req, res) => {
  var service = req.body;
  var relationshipArr = [];
  var query =
    'CREATE (p:Service {id:' +
    service.id +
    ", name:'" +
    service.name +
    "', hourly_fee:" +
    service.hourly_fee +
    ", description:'" +
    service.description +
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
            'MATCH (p:Service), (l:Location) WHERE p.id = ' +
            service.id.toString() +
            ' AND l.id = ' +
            resultArray[i].id +
            ' CREATE (l)-[r:OFFERS]->(p) RETURN r';
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

// POST a new service to a specific Location
router.post('/:id', (req, res) => {
  var service = req.body;
  var location = req.params.id;
  var query =
    'CREATE (p:Service {id:' +
    service.id +
    ", name:'" +
    service.name +
    "', hourly_fee:" +
    service.hourly_fee +
    ", description:'" +
    service.description +
    "' })";
  cb = (err, data) => {
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      cb2 = (err, data) => {};

      var query2 =
        'MATCH (p:Service), (l:Location) WHERE p.id = ' +
        service.id.toString() +
        ' AND l.id = ' +
        location +
        ' CREATE (l)-[r:OFFERS]->(p) RETURN r';
      cypher(query2, null, cb2);
      res.send({ status: 'Success', message: 'Added node successfully' });
    }
  };
  cypher(query, null, cb);
});

// Delete a service
router.delete('/:id', (req, res) => {
  var query =
    'MATCH (n:Service) WHERE n.id = ' +
    req.params.id.toString() +
    ' DETACH DELETE n';
  cb = (err, data) => {
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      res.send({ status: 'Success', message: 'Deleted service successfully' });
    }
  };
  cypher(query, null, cb);
});

// Update service
router.put('/:id', (req, res) => {
  var service = req.body;
  var id = req.params.id;
  cb = (err, data) => {
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      console.log(data);
      res.send({ status: 'Success', message: 'Updated service successfully' });
    }
  };
  var query =
    'MATCH (p:Service) WHERE p.id = ' +
    id +
    ' SET p = { id: ' +
    id +
    ", name: '" +
    service.name +
    "', hourly_fee: " +
    service.hourly_fee +
    ', description: ' +
    "'" +
    service.description +
    "' } RETURN p";
  cypher(query, null, cb);
});

module.exports = router;
