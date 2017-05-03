var express = require('express');
var server = express();
server.use('/', express.static(__dirname + '/'));
server.listen(8089);
console.log('listening on http://localhost:8089');
