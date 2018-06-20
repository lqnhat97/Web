var mysql = require('mysql');

var con=mysql.createConnection({
	host:'localhost',
	port:3305,
	user:'root',
	password:'',
	database:'navistore'
});

con.connect(err=>{
	if(err) throw err;
	console.log('Connected to the database');
});