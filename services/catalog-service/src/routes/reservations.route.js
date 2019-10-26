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

// POST a new reservation to a specific Location
router.post('/:id', (req, res) => {
  var reservation = req.body;
  var location = req.params.id;
  var query =
    'CREATE (p:Reservation {id:' +
    reservation.id +
    ", date:'" +
    reservation.date +
    "', user_id:" +
    reservation.user_id +
    ' })';
  console.log(query);
  cb = (err, data) => {
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      cb2 = (err, data) => {};

      var query2 =
        'MATCH (p:Reservation), (l:Location) WHERE p.id = ' +
        reservation.id.toString() +
        ' AND l.id = ' +
        location +
        ' CREATE (l)-[r:HAS]->(p) RETURN r';
      cypher(query2, null, cb2);
      res.send({ status: 'Success', message: 'Added node successfully' });
    }
  };
  cypher(query, null, cb);
});

// Delete a reservation
router.delete('/:id', (req, res) => {
  var query =
    'MATCH (n:Reservation) WHERE n.id = ' +
    req.params.id.toString() +
    ' DETACH DELETE n';
  cb = (err, data) => {
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      res.send({
        status: 'Success',
        message: 'Deleted reservation successfully'
      });
    }
  };
  cypher(query, null, cb);
});

// Update reservation
router.put('/:id', (req, res) => {
  var reservation = req.body;
  var id = req.params.id;
  cb = (err, data) => {
    if (err != null) {
      res.send({ status: 'Failed', error: err });
    } else {
      console.log(data);
      res.send({
        status: 'Success',
        message: 'Updated reservation successfully'
      });
    }
  };
  var query =
    'MATCH (p:Reservation) WHERE p.id = ' +
    id +
    ' SET p = { id: ' +
    id +
    ", date:'" +
    reservation.date +
    ", user_id:'" +
    reservation.user_id +
    "' } RETURN p";
  cypher(query, null, cb);
});

module.exports = router;
