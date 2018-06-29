var db = require('../database/db');
var config=require('../config/config')

exports.loadAll = () => {
    var sql = 'select * from catalog';
    return db.load(sql);
}

exports.addBrand= c=>{
	return db.save(`insert into catalog(name,parent_id,sort_order) values ('${c.name}',0,0)`);
}

exports.delBrand=(pid)=>{
	var sql=`delete from catalog where id = "${pid}"`;
	return db.save(sql);
}
