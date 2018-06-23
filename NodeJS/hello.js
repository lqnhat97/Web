var mysql = require('mysql');



// Dùng export để các file khác có thể sử dụng
//
exports.load=sql=>{

	//resolve là hàm kết quả trả về, reject là lỗi
	return new Promise((resolve, reject)=>{
		var con=mysql.createConnection({
			host:'localhost',
			port:3305,
			user:'root',
			password:'',
			database:'navistore'
		});
		//Hàm kiểm tra kết nối
		con.connect(err=>{
			if(err) throw err;
			console.log('Connected to the database');
		});

		con.query(sql,(err,rows,fields)=>{
			if(err) reject(err);
			resolve(rows);
		});

		con.end();
	})
}
