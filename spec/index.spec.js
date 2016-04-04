var handler = require('../lib/');

describe('Handler', function() {
  it('should response with a dummy object', function() {
  	var resonseValue;
    handler(
    	{}, 
    	{
    		send: function(res) {
    			resonseValue = res;
    		}
    	},
      function () {});
    expect(resonseValue.response_type).toBe('in_channel');
  });
});