var db = require('../database/db');

exports.register=(c)=>{
	var sql=`insert into user (name,email,phone,address,password,created,gender,addition,birthday) values ('${c.name}','${c.mail}','${c.phone}','${c.address}','${c.pass}','0','${c.gender}','','${c.birthday}')`;
	return db.save(sql).then(rows=>{
		console.log(rows);
	});
}

exports.loadUsers=(id)=>{
	var sql=`select * from user where id="${id}" `;
	return db.load(sql);
}

exports.login = (user) => {
    var sql = `select * from user where email = "${user.username}" and password = "${user.password}"`;
    return db.load(sql);
}

exports.updateUser = (c) => {
    var sql = `update categories set name = "${c.name}", phone = "${c.phone}", address = "${c.address}" , gender = "${c.gender}", addition ="${c.addition}", birthday = "${c.birthday}"`;
    return db.save(sql);
}