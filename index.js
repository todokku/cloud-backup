var express = require('express');
var app = express();
const PORT = process.env.PORT || 5000
const shell = require('shelljs')

app.get('/', function (req, res) {
  res.send('Hello World!');
  shell.exec('./start.sh')
});

app.listen(PORT, function () {
  console.log(`Listening on ${ PORT }`);
});
