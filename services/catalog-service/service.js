var express = require('express');
var server = express();

server.listen(4007);

server.get('/', function(req, res) {
  res.send('Waho! this is my containerized node service');
});
