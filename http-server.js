var connect = require('connect');
var NA = require("nodealytics");

var app = connect()
  .use(connect.logger())
  .use(connect.static(__dirname + '/build', { maxAge: 0 }))
  .use(function(req, res){
  	//Any other unmatched .gif request is treated as a tracking pixel
  	if (req.url.indexOf('.gif') > -1) {
			NA.initialize('UA-38642802-1', 'cf-docs-contrib.cloudfoundry.com', function () {
			  NA.trackPage('GA pixel page', req.headers.referer, function (err, resp) {
			  	res.setHeader('Cache-control', 'private, no-cache, no-cache=Set-Cookie, proxy-revalidate, max-age=0, no-store, must-revalidate');
			  	res.setHeader('Cache-directive', 'no-cache');
			  	res.setHeader('Expires', 'Wed, 17 Sep 1975 21:32:10 GMT');
			  	res.setHeader('Pragma', 'no-cache');
			  	res.setHeader('Pragma-directive', 'no-cache');
					res.setHeader('X-Powered-By', 'NodeJs hamsters');
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