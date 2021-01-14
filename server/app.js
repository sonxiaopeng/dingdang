const express = require("express");
const app = express();

const md5 = require('js-md5')

const bodyParser = require('body-parser');
app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({limit: '50mb', extended: true}));
app.use(bodyParser.json());



const cors = require('cors')
app.use(cors({
  origin:['http://127.0.0.1:5500']
}))

const uuid = require('uuid')


const multer = require('multer')
const obj = multer.diskStorage({
    destination:function(req, file, cb){
        cb(null, 'upload')
    },
    filename:function(req, file, cb){
        cb(null, uuid.v1() + file.originalname.slice(file.originalname.indexOf('.')))
    }
})

const uploadTools = multer({
    storage: obj
})



app.use(express.static('upload'))


const router = express.Router();
const mysql = require("mysql");
let pool = mysql.createPool({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: "ddys",
    multipleStatements: true,
});


// 将请求数据库封装成promise
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


router.post('/register', (req, res)=>{
    let username = req.body.username;
    let password = req.body.password;
    let querySql = 'SELECT * FROM ddys_user WHERE username = ?';
    let insertSql = 'INSERT INTO ddys_user ( username, password) VALUES (?, ?)';
    
    sqlConnect(querySql, [username])
    .then(value=>{
        if(value.length > 0){
            res.send({ code: 1, message: "username exits" });
        }else {
            return sqlConnect(insertSql, [username, md5(password)])
        }
    })
    .then(value=>{
        if(value.affectedRows == 1){
            res.send({ code: 0, message: "register success" });
        }else{
            res.send({ code: 1, message: "register fail" });
        }

    })
    .catch(reason => res.send({reason: `${reason}`}));

})

router.post('/login', (req, res)=>{
    let username = req.body.username;
    let password = req.body.password;
    let sql = 'SELECT * FROM ddys_user WHERE username = ?'
    sqlConnect(sql, [username])
    .then(value=>{
        if(value.length == 0){
            res.send({ code: 1, message: "username doesn't exit" });
        }else if(value[0].password == md5(password)){
            res.send({ code: 0, message: "login success", data: value[0] });
        }else{
            res.send({ code: 1, message: "password is incorrect" });
        }
    })
    .catch(reason => res.send({reason: `${reason}`}));
})







router.post('/emgcall/uploadimg', uploadTools.array('uploadFile'), (req, res)=>{
    console.log(req.files)
    res.send({code: 'ok'})
})

app.use(router);
app.listen(3000, () => console.log("running 3000..."));
