var restify = require('restify');

function respond(req, res, next) {
  res.send(
  	{
	    "text": "It's 80 degrees right now.",
	    "attachments": [
	        {
	            "text":"Partly cloudy today and tomorrow"
	        }
	    ]
	});
  next();
}

var server = restify.createServer();
server.get('/', respond);

server.listen(8080, function() {
  console.log('%s listening at %s', server.name, server.url);
});