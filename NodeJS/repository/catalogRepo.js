//File dùng truy vấn đến catalog
var db=require('../hello');

exports.loadAllCatolog = () => {
	db.load('select count(*) from product where catalog_id=1').then(rows=>{
 		console.log(rows);
 	});
}


