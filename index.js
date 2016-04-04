var restify = require('restify');
var handler = require('./app');

console.log(handler);

var server = restify.createServer();
server.get('/', handler);

server.listen(8080, function() {
  console.log('%s listening at %s', server.name, server.url);
});