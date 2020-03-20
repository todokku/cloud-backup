var express = require('express');
var app = express();
const PORT = process.env.PORT || 5000
const shell = require('shelljs')
var path = require('path');


app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname+'/homepage.html'));
  
});

app.get('/start-sync', function (req, res) {
  res.sendFile(path.join(__dirname+'/start-sync.html'));
  shell.exec('chmod +x cloud-backup.sh');
  shell.exec('./cloud-backup.sh', {async:true});
});
app.listen(PORT, function () {
  console.log(`Listening on ${ PORT }`);
});
