//File dùng truy vấn đến catalog
var db=require('../Vinh/db.js');

exports.loadAllCatolog = () => {
<<<<<<< HEAD
	db.load('select count(*) from product where catalog_id=1').then(rows=>{
=======
	db.load('select * from catalog').then(rows=>{
>>>>>>> 11510812ae5d6e9027d2d5f4f413feaec8d11b62
 		console.log(rows);
 	});
}


