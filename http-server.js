var connect = require('connect');
var NA = require("nodealytics");

var app = connect()
  .use(connect.logger())
  .use(connect.static(__dirname + '/build', { maxAge: 0 }))
  .use(function(req, res){
    if (req.url == '/ga.gif') {
  		NA.initialize('UA-38642802-1', 'cf-docs-contrib.cloudfoundry.com', function () {
			  NA.trackPage('GA pixel page', req.headers.referer, function (err, resp) {
			    res.end(resp.body);
			  });
			});
  		return;
  	}
  	res.statusCode = 404;
  	res.end();
  })
  .listen(3001);
console.log("Listening on http://%s:%d", app.address().address, app.address().port);