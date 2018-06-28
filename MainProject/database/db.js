var mysql = require('mysql');

exports.load = sql => {
    return new Promise((resolve, reject) => {
        var cn = mysql.createConnection({
            host: 'localhost',
            port: 3305,
            user: 'root',
            password: '',
            database: 'navistore'
        });
        cn.connect(err => {
            if (err) throw err;
            console.log('connected to db');
        });

        cn.query(sql, function(error, rows, fields) {
            if (error) {
                reject(error);
            } else {
                resolve(rows);
            }
            cn.end();


        });
    })
}

exports.save = sql=>{
    return new Promise((resolve, reject)=>{
        var con = mysql.createConnection({
            host: 'localhost',
            port: 3305,
            user: 'root',
            password: '',
            database: 'navistore'
        });

        con.connect();

        con.query(sql,(err,value)=>{
            if(err) reject(err);
            resolve(value);
            con.end();

        });

    });
}