const mysql = require("mysql");
let pool = mysql.createPool({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: "ddys",
    multipleStatements: true,
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