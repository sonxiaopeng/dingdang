const express = require("express");
const app = express();

const md5 = require("js-md5");

const bodyParser = require("body-parser");
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
app.use(bodyParser.json());

const cors = require("cors");
app.use(
	cors({
		origin: ["http://127.0.0.1:8080"],
	})
);

const uuid = require("uuid");

const multer = require("multer");
const obj = multer.diskStorage({
	destination: function(req, file, cb) {
		cb(null, "upload");
	},
	filename: function(req, file, cb) {
		cb(
			null,
			uuid.v1() + file.originalname.slice(file.originalname.indexOf("."))
		);
	},
});

const uploadTools = multer({
	storage: obj,
});

app.use(express.static("upload"));

const router = express.Router();

const sqlConnect = require("./public/public");
// const symptomRouter = require('./public/router/symptom')
// app.use(symptomRouter)


// // 批量更改数据库接口
// router.get('/settime', (req, res)=>{
//     let sql = 'INSERT INTO `ddys`.`ddys_comment`( `content`, `user_id`, `doctor_id`, `create_at`, `level`) VALUES ( "卓医生讲解的很到位，解答也很有耐心，五星好评！", ?, ?, 0, 5);'
//     let arr = []
//     for(var i = 0; i<100; i++){
//         arr[i] = i + 1;
//     }
//     let promises = arr.map(item=>{
//         let userid = parseInt(Math.random()*100)
        
//         // num = String(num)
//         // console.log(num)
//         return sqlConnect(sql, [userid,  item])
//     })
//     Promise.all(promises)
//     .then(value=>{
//         console.log(value)
//     })
// })






// 添加症状
router.post(
	"/emgcall/addsymptomimg",
	uploadTools.array("uploadFile"),
	(req, res) => {
		let body = req.body;
		// let desc = req.body.desc;
		let files = req.files;
		let userid = body.userid;
		let desc = body.desc;
		let caeateTime = body.create_at;
		let imgs = files.map(item => {
			return item.filename;
		});
		let imgStr = imgs.join(",");
		
		let sql =
			"INSERT INTO ddys_symptom (description, images, user_id, create_at) VALUES (?, ?, ?, ?)";

		sqlConnect(sql, [desc, imgStr, userid, caeateTime])
			.then(value => {
				res.send({ code: 0, msg: "添加成功！", data: imgStr });
			})
			.catch(reason => res.send({ code: 1, reason: `${reason}` }));
	}
);

// 获取用户最新提交的症状

router.get('/emgcall/getsymptom', (req, res)=>{
    let userid = req.query.userid;
    console.log(userid)
    let sql = `SELECT * FROM ddys_symptom WHERE user_id = ? ORDER BY create_at DESC LIMIT 1`
    sqlConnect(sql, [userid])
			.then(value => {
                console.log(value);
                if(value.length > 0){
                    res.send({ code: 0, msg: "获取成功！", data: value[0] });

                }else{
                    res.send({ code: 1, msg: `暂无症状信息！` })
                }
			})
			.catch(reason => res.send({ code: 1, reason: `${reason}` }));
})


// 获取用户绑定的患者信息
router.get("/emgcall/getpatient", (req, res) => {
	let userid = req.query.userid;
	let sql = `SELECT * FROM ddys_patient WHERE user_id = ?`;
	console.log(userid);
	sqlConnect(sql, [userid]).then(value => {
		if (value.length > 0) {
			res.send({ code: 0, msg: "查询成功！", data: value });
		} else {
			res.send({ code: 1, msg: "没有相关记录！" });
		}
	}).catch(reason => res.send({ code: 1, reason: `${reason}` }));
});

// 添加患者信息
router.post("/emgcall/addpatient", (req, res) => {
	let userMsg = req.body;
	let sql = `INSERT INTO ddys_patient (
        nickname,
        sex,
        brithday,
        weight,
        allergy,
        allergy_desc,
        history,
        history_desc,
        liver,
        kidney,
        inoculation,
        user_id,
        age
        ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
	sqlConnect(sql, [
		userMsg.nickname,
		userMsg.sex,
		userMsg.birthday,
		userMsg.weight,
		userMsg.allergy,
		userMsg.allergy_desc,
		userMsg.history,
		userMsg.history_desc,
		userMsg.liver,
		userMsg.kidney,
		userMsg.inoculation,
		userMsg.user_id,
		userMsg.age
	]).then(value => {
		res.send({code: 0, msg: '保存成功！'})
    })
    .catch(reason => res.send({ code: 1, reason: `${reason}` }));
});


// 添加电话急诊订单
router.post('/emgcall/addorder', (req, res)=>{
    let params = req.body
    let sql = `INSERT INTO ddys_order ( user_id, patient_id, symptom_id, office_id) VALUES (?, ?, ?, ?)`
    sqlConnect(sql, [params.userid, params.patientid, params.symptomrid, params.officeid,])
		.then(value => {
			res.send({code: 0, msg: '保存成功！'})
			
		}).catch(reason => res.send({ code: 1, reason: `${reason}` }));
})

// 注册
router.post("/register", (req, res) => {
	let username = req.body.username;
	let password = req.body.password;
	let querySql = "SELECT * FROM ddys_user WHERE username = ?";
	let insertSql =
		'INSERT INTO ddys_user ( nickname, username, password, avatar) VALUES (?, ?, ?, "default-avatar.png")';

	sqlConnect(querySql, [username])
		.then(value => {
			if (value.length > 0) {
				res.send({ code: 1, message: "username exits" });
			} else {
				return sqlConnect(insertSql, [
					`用户${username}`,
					username,
					md5(password),
				]);
			}
		})
		.then(value => {
			if (value.affectedRows == 1) {
				res.send({ code: 0, message: "register success" });
			} else {
				res.send({ code: 1, message: "register fail" });
			}
		})
		.catch(reason => res.send({ code: 1, reason: `${reason}` }));
});

// 登录
router.post("/login", (req, res) => {
	let username = req.body.username;
	let password = req.body.password;
	let sql = "SELECT * FROM ddys_user WHERE username = ?";
	sqlConnect(sql, [username])
		.then(value => {
			if (value.length == 0) {
				res.send({ code: 1, message: "username doesn't exit" });
			} else if (value[0].password == md5(password)) {
				let { nickname, user_id, username, avatar } = value[0];
				res.send({
					code: 0,
					message: "login success",
					data: { nickname, user_id, username, avatar },
				});
			} else {
				res.send({ code: 1, message: "password is incorrect" });
			}
		})
		.catch(reason => res.send({ code: 1, reason: `${reason}` }));
});

router.post(
	"/emgcall/uploadimg",
	uploadTools.array("uploadFile"),
	(req, res) => {
		console.log(req.files);
		res.send({ code: "ok" });
	}
);

app.use(router);
app.listen(3000, () => console.log("running 3000..."));
