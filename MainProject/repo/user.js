var db = require('../database/db');

exports.register=(c=>{
	var sql=`insert into user (name,email,phone,address,password,created) values ('${c.name}','${c.mail}','${c.phone}',${c.address},'${c.pass}','0')`;
	return db.save(sql);
})