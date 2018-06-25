var db=require('../db.js');

exports.loadAllProduct = () => {
	var sql='select * from product';
	return db.load(sql);
}

exports.loadAsusProduct=()=>{
	db.load('select * from product where catalog_id=1').then(rows=>{
		console.log(rows);
	});
}

exports.countAsusProduct = () => {
	db.load('select count(*) from product where catalog_id=1').then(rows=>{
 		console.log(rows);
 	});
}


exports.loadDellProduct=()=>{
	db.load('select * from product where catalog_id=2').then(rows=>{
		console.log(rows);
	});
}

exports.countDellProduct = () => {
	db.load('select count(*) from product where catalog_id=2').then(rows=>{
 		console.log(rows);
 	});
}

exports.countAcerProduct = () => {
	db.load('select count(*) from product where catalog_id=3').then(rows=>{
 		console.log(rows);
 	});
}

exports.countHPProduct = () => {
	db.load('select count(*) from product where catalog_id=4').then(rows=>{
 		console.log(rows);
 	});
}

exports.countLenovoProduct = () => {
	db.load('select count(*) from product where catalog_id=5').then(rows=>{
 		console.log(rows);
 	});
}
