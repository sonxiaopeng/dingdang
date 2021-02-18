const mysql = require("mysql");
let pool = mysql.createPool({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: "ddys",
    multipleStatements: true,
    // host     : process.env.MYSQL_HOST,
    // port     : process.env.MYSQL_PORT,
    // user     : process.env.ACCESSKEY,
    // password : process.env.SECRETKEY,
    // database : 'app_' + process.env.APPNAME
});


// 将查询数据库封装成promise
function sqlConnect(sql, params) {
	return new Promise((resolve, reject) => {
		pool.getConnection((err, conn) => {
			if (err) {
				reject(err);
				return;
			}
			conn.query(sql, params, (err, result) => {
				if (err) {
					reject(err);
					return;
				}
				resolve(result);
			});
			conn.release();
		});
	});
}

module.exports = sqlConnect