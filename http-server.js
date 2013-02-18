var connect = require('connect');
var app = connect()
  .use(connect.logger())
  .use(connect.static(__dirname + '/build', { maxAge: 0 }))
  .listen(3001);
console.log("Listening on http://%s:%d", app.address().address, app.address().port);