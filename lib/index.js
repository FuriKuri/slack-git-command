function respond(req, res, next) {
  res.send(
  	{
  		"response_type": "in_channel",
	    "text": "It's 80 degrees right now.",
	    "attachments": [
	        {
	            "text":"Partly cloudy today and tomorrow"
	        }
	    ]
	});
  next();
};

module.exports = respond;