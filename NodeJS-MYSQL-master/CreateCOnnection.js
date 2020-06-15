var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "db2admin"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});