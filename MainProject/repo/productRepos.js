var db = require('../database/db');
var config=require('../config/config')

exports.loadAll = () => {
    var sql = 'select * from product';
    return db.load(sql);
}

exports.addProduct= c=>{
	return db.save(`insert into product (catalog_id,name,price,content,discount,image_link,created,view) values ('${c.catalogid}','${c.name}','${c.price}','${c.content}','${c.discount}','${c.image_link}','${c.created}','0')`);
}

exports.delProduct=(pid)=>{
	var sql=`delete from product where id = "${pid}"`;
	return db.save(sql);
}


//hien 12 sp moi nhat
exports.loadNewProduct = ()=>{
	var sql=`select * from product order by created desc limit 4`;
	return db.load(sql);
}

exports.loadNewProduct2 = ()=>{
	var sql=`select * from product order by created desc limit 4 offset 4`;
	return db.load(sql);
}

exports.loadNewProduct3 = ()=>{
	var sql=`select * from product order by created desc limit 4 offset 8`;
	return db.load(sql);
}


//hien 12 sp ban chay nhat
exports.loadbestsell = ()=>{
	var sql=`select * from product order by id desc limit 12` ;
	return db.load(sql);
}


//12 san pham xem nhieu
//hien 12 sp moi nhat
exports.loadMostView = ()=>{
	var sql=`select * from product order by view desc limit 4`;
	return db.load(sql);
}

exports.loadMostView2 = ()=>{
	var sql=`select * from product order by view desc limit 4 offset 4`;
	return db.load(sql);
}

exports.loadMostView3 = ()=>{
	var sql=`select * from product order by view desc limit 4 offset 8`;
	return db.load(sql);
}


//danh sach theo loai
exports.allbrandProduct=(catId)=>{
	var sql=`select * from product where catalog_id = "${catId}" `;
	return db.load(sql);
}

//Hien thong tin san pham
exports.productDetail=(id)=>{
	var sql=`select * from product where id = "${id}" `;
	return db.save(sql);
}

//Hien thi san pham  theo khung gia duoi 10000000
exports.loadProductBasePrice=(catId,price1,price2)=>{
	var sql = `select * from product where price <= "${price1}" and price > "${price2}" and catalog_id="${catId}"`;
	return db.load(sql);
}


//Tim san pham theo ten gan dung 
exports.searchProductName=(name)=>{
	var sql=`select * from product where name like '%${name}%'`;
	return db.load(sql);
}

//5 san pham cung nha san xuat
exports.loadSameBrandProduct=(id)=>{
	var sql=`select p2.* from product p1,product p2 where p1.id="${id}" and p2.catalog_id=p1.catalog_id limit 5`;
	return db.load(sql);
}

//5 san pham cung loai
exports.loadSameCategoryProduct=(price)=>{
	var sql=`select p2.* from product p1,product p2 where p1.id=16 and p2.catalog_id=p1.catalog_id limit 5`;
	return db.load(sql);
}



