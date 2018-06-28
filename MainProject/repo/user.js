var db = require('../database/db');

exports.register=(c)=>{
	var sql=`insert into user (name,email,phone,address,password,created,gender,addition,birthday) values ('${c.name}','${c.mail}','${c.phone}','${c.address}','${c.pass}','0','${c.gender}','','${c.birthday}')`;
	return db.save(sql);
}

exports.loadUsers=()=>{
	var sql=`select * from user`;
	return db.load(sql);
}

exports.login = user => {
    var sql = `select * from user where email = "${user.username}" and password = "${user.password}"`;
    return db.load(sql);
}