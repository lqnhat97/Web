//File dùng truy vấn đến catalog
var db=require('../Vinh/db.js');

exports.loadAllCatolog = () => {
	db.load('select * from catalog').then(rows=>{
 		console.log(rows);
 	});
}


