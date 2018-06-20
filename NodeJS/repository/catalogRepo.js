//File dùng truy vấn đến catalog
var db=require('../hello');

exports.loadAllCatolog = () => {
	db.load('select * from catalog').then(rows=>{
		for (row of rows)
 		console.log(row.id);
 	});
}


