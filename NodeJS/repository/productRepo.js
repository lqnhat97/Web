var db=require('../Vinh/db.js');

exports.loadAllProduct = () => {
	db.load('select * from product').then(rows=>{
 		console.log(rows);
 	});
}