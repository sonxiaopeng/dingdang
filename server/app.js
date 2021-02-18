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
		cb(null, uuid.v1() + file.originalname.slice(file.originalname.indexOf(".")));
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
//     let sql = 'UPDATE ddys_user SET username = ?, avatar = ? WHERE user_id = ?;'
//     let arr = []
//     for(var i = 1; i<174; i++){
//         arr[i] = i + 1;
//     }
//     let promises = arr.map((item,index)=>{
//         let userid = 18700000000 + parseInt(Math.random()*99999999) + ''

//         let avatar = item + '.jpg'

//         // num = String(num)
//         // console.log(num)
//         return sqlConnect(sql, [userid, avatar, item])
//     })
//     Promise.all(promises)
//     .then(value=>{
//         console.log(value)
//     })
// })

// 获取关注医生id
router.get("/getfollowid", (req, res) => {
	let userid = req.query.userid;
	let sql = `SELECT doctor_id doctorid
        FROM ddys_follow follow
        WHERE follow.user_id = ?;`;
	sqlConnect(sql, [userid])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value });
			} else {
				res.send({ code: 1, message: "没有查到相关订单！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 获取收藏文章id及标题等信息
router.get("/getmystars", (req, res) => {
	let userid = req.query.userid;
    let sql = `SELECT article.article_id articleid,
        article.subject,
        article.description,
        article.img
        FROM ddys_star star
        INNER JOIN ddys_article article ON article.article_id = star.article_id
        WHERE star.user_id = ?;`;
	sqlConnect(sql, [userid])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value });
			} else {
				res.send({ code: 1, message: "没有查到收藏文章！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});



// 查询用户是否收藏该文章
router.get('/queryisstared', (req, res)=>{
    let articleid = req.query.articleid;
    let userid = req.query.userid;
    let sql = `SELECT count(1) num FROM ddys_star WHERE article_id = ? AND user_id = ?`
    sqlConnect(sql, [articleid, userid]).then(value=>{
        res.send({ code: 0, message: "查询成功", data: value[0] })
    }).catch((reason) => res.send({ code: 1, message: `${reason}` }));
})


// 获取收藏文章数量
router.get("/getstarnum", (req, res) => {
	let userid = req.query.userid;
	let sql = `SELECT count(1) num
        FROM ddys_star star
        WHERE star.user_id = ?;`;
	sqlConnect(sql, [userid])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value[0] });
			} else {
				res.send({ code: 1, message: "没有查到相关订单！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 收藏文章
router.post('/gotostar', (req, res)=>{
    let articleid = req.body.articleid;
    let userid = req.body.userid;
    let sql = `INSERT INTO ddys_star (article_id, user_id) VALUES (?, ?)`
    sqlConnect(sql, [articleid, userid]).then(value=>{
        res.send({ code: 0, message: "收藏成功！" })
    }).catch((reason) => res.send({ code: 1, message: `${reason}` }));
})

// 取消收藏文章
router.post('/canclestar', (req, res)=>{
    let articleid = req.body.articleid;
    let userid = req.body.userid;
    let sql = `DELETE FROM ddys_star WHERE article_id = ? AND user_id = ?`
    sqlConnect(sql, [articleid, userid]).then(value=>{
        res.send({ code: 0, message: "取消收藏成功！" })
    }).catch((reason) => res.send({ code: 1, message: `${reason}` }));
})



// 获取关注医生相关信息
router.get("/getfollowdoctor", (req, res) => {
	let id = req.query.doctorid;
	let sql = `select *
        from ddys_doctor d
        inner join ddys_hospital h on d.hospital_id = h.hospital_id
        inner join ddys_office o on d.office_id = o.office_id
        where d.doctor_id=?`;
	sqlConnect(sql, [id]).then((value) => {
		if (value.length == 0) {
			res.send({ code: 1, message: "没有查到相关信息" });
		} else {
			res.send({ code: 0, message: "ok", data: value });
		}
	});
});



// 获取关注数量
router.get("/getfollownum", (req, res) => {
	let userid = req.query.userid;
	let sql = `SELECT count(1) num
        FROM ddys_follow follow
        WHERE follow.user_id = ?;`;
	sqlConnect(sql, [userid])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value[0] });
			} else {
				res.send({ code: 1, message: "没有查到相关订单！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});


// 关注医生
router.post('/gotofollow', (req, res)=>{
    let doctorid = req.body.doctorid;
    let userid = req.body.userid;
    let sql = `INSERT INTO ddys_follow (doctor_id, user_id) VALUES (?, ?)`
    sqlConnect(sql, [doctorid, userid]).then(value=>{
        res.send({ code: 0, message: "关注成功！" })
    }).catch((reason) => res.send({ code: 1, message: `${reason}` }));
})

// 取消关注医生
router.post('/canclefollow', (req, res)=>{
    let doctorid = req.body.doctorid;
    let userid = req.body.userid;
    let sql = `DELETE FROM ddys_follow WHERE doctor_id = ? AND user_id = ?`
    sqlConnect(sql, [doctorid, userid]).then(value=>{
        res.send({ code: 0, message: "取消关注成功！" })
    }).catch((reason) => res.send({ code: 1, message: `${reason}` }));
})


// 查询用户是否关注该医生
router.get('/queryisfollowed', (req, res)=>{
    let doctorid = req.query.doctorid;
    let userid = req.query.userid;
    let sql = `SELECT count(1) num FROM ddys_follow WHERE doctor_id = ? AND user_id = ?`
    sqlConnect(sql, [doctorid, userid]).then(value=>{
        res.send({ code: 0, message: "查询成功", data: value[0] })
    }).catch((reason) => res.send({ code: 1, message: `${reason}` }));
})

// 获得医院经纬度接口
router.get("/getlocation", (req, res) => {
	let hospitalId = req.query.hospitalid;
	let sql = `SELECT longitude, latitude, 
    hospitalname,
    address
    FROM ddys_hospital WHERE
    hospital_id = ?`;
	sqlConnect(sql, [hospitalId])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功", data: value[0] });
			} else {
				res.send({ code: 1, message: "没有查到数据" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 获取医生信息
router.get("/ask/getdoctormsg", (req, res) => {
	let doctorid = req.query.doctorid;
	let sql = `SELECT 
        doctor.nickname,
        doctor.avatar,
        doctor.ask_price price,
        office.office_name officename,
        hospital.hospitalname
    FROM ddys_doctor doctor
    INNER JOIN ddys_hospital hospital ON hospital.hospital_id = doctor.hospital_id
    INNER JOIN ddys_office office ON office.office_id = doctor.office_id
    WHERE doctor.doctor_id = ?;`;
	sqlConnect(sql, [doctorid])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value[0] });
			} else {
				res.send({ code: 1, message: "没有该医生！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 获取问诊订单数量信息
router.get("/getordernum", (req, res) => {
	let userid = req.query.userid;
	let sql = `SELECT count(1) num
        FROM ddys_order orders
        WHERE orders.user_id = ?;`;
	sqlConnect(sql, [userid])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value[0] });
			} else {
				res.send({ code: 1, message: "没有查到相关订单！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 获取订单列表信息
router.get("/getorderlist", (req, res) => {
	let userid = req.query.userid;
	let sql = `SELECT 
        orders.order_id,
        orders.create_at committime,
        orders.type,
        doctor.nickname,
        doctor.avatar imgurl,
        symptom.description
        FROM ddys_order orders
        INNER JOIN ddys_doctor doctor ON doctor.doctor_id = orders.doctor_id
        INNER JOIN ddys_symptom symptom ON symptom.symptom_id = orders.symptom_id
        WHERE orders.user_id = ?
        ORDER BY orders.order_id DESC;`;
	sqlConnect(sql, [userid])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value });
			} else {
				res.send({ code: 1, message: "没有查到相关订单！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 搜索文章接口
router.get("/search/article", (req, res) => {
	let keyword = decodeURI(req.query.keyword);
	let sql = `SELECT * FROM ddys_article WHERE subject LIKE "%${keyword}%"
    OR description LIKE "%${keyword}%"`;
	sqlConnect(sql)
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value });
			} else {
				res.send({ code: 1, message: "没有找到相关文章！" });
			}
		})
		.catch((reason) => res.send());
});

// 搜索问题接口
router.get("/search/question", (req, res) => {
	let keyword = decodeURI(req.query.keyword);
	let sql = `SELECT 
    ques.question_id quesid,
    ques.content 'describe',
    ques.create_at committime,
    user.avatar imgurl,
    user.nickname nickname
    FROM ddys_question ques
    INNER JOIN ddys_user user ON ques.user_id = user.user_id
    WHERE ques.content LIKE "%${keyword}%"`;
	sqlConnect(sql)
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value });
			} else {
				res.send({ code: 1, message: "没有找到相关问题！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 搜索医院接口
router.get("/search/hospital", (req, res) => {
	let keyword = decodeURI(req.query.keyword);
	let sql = `SELECT 
    hospitalname,
    hospitallevel,
    address,
    hospital_id
    FROM ddys_hospital
    WHERE hospitalname LIKE "%${keyword}%" OR address LIKE "%${keyword}%" OR description LIKE "%${keyword}%"`;
	sqlConnect(sql)
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value });
			} else {
				res.send({ code: 1, message: "没有找到相关医院！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});


// 搜索医生接口
router.get("/search/doctor", (req, res) => {
	let keyword = decodeURI(req.query.keyword);
	let sql = `SELECT 
    doctor.doctor_id doctorid
    FROM ddys_doctor doctor
    INNER JOIN ddys_office office ON office.office_id = doctor.office_id
    INNER JOIN ddys_hospital hospital ON hospital.hospital_id = doctor.hospital_id
    WHERE doctor.nickname LIKE "%${keyword}%" OR doctor.description LIKE "%${keyword}%" OR doctor.direction LIKE "%${keyword}%"
    OR office.office_name LIKE "%${keyword}%" OR hospital.hospitalname LIKE "%${keyword}%"`;
	sqlConnect(sql)
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value });
			} else {
				res.send({ code: 1, message: "没有找到相关医生！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 获取首页文章信息
router.get("/queryarticle", (req, res) => {
	// let start = parseInt(Math.random() * 500)
	sqlConnect("SELECT * FROM ddys_article LIMIT 3")
		.then((value) => {
			res.send({ code: 0, message: "查询成功！", data: value });
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 获取首页问题分类
router.get("/querydisease", (req, res) => {
	// let start = parseInt(Math.random() * 500)
	sqlConnect("SELECT * FROM ddys_disease LIMIT 7")
		.then((value) => {
			res.send({ code: 0, message: "查询成功！", data: value });
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 获取首页问题信息
router.get("/queryquestion", (req, res) => {
	let diseaseid = req.query.diseaseid;
	sqlConnect(
		`SELECT 
        ques.question_id quesid,
        ques.content 'describe',
        ques.create_at committime,
        user.avatar imgurl,
        user.nickname nickname
        FROM ddys_question ques
        INNER JOIN ddys_user user ON ques.user_id = user.user_id
        WHERE ques.disease_id = ?
        LIMIT 3`,
		[diseaseid]
	)
		.then((value) => {
			res.send({ code: 0, message: "查询成功！", data: value });
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 修改昵称
router.post("/mine/modifynickname", (req, res) => {
	let userid = req.body.userid;
	let nickname = req.body.nickname;
	let sql = `UPDATE ddys_user SET nickname = ? WHERE user_id = ?`;
	sqlConnect(sql, [nickname, userid])
		.then((value) => {
			return sqlConnect("SELECT * FROM ddys_user WHERE user_id = ?", [userid]);
		})
		.then((value) => {
			let { nickname, user_id, username, avatar } = value[0];
			res.send({ code: 0, message: "修改成功！", data: { nickname, user_id, username, avatar } });
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 修改头像
router.post("/mine/modifyavatar", uploadTools.array("uploadFile"), (req, res) => {
	let body = req.body;
	// let desc = req.body.desc;
	let files = req.files;
	let userid = body.userid;
	let imgStr = files[0].filename;
	let sql = "UPDATE ddys_user SET avatar = ? WHERE user_id = ?";

	sqlConnect(sql, [imgStr, userid])
		.then((value) => {
			res.send({ code: 0, message: "添加成功！", data: imgStr });
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 添加症状
router.post("/emgcall/addsymptomimg", uploadTools.array("uploadFile"), (req, res) => {
	let body = req.body;
	// let desc = req.body.desc;
	let files = req.files;
	let userid = body.userid;
	let desc = body.desc;
	let caeateTime = body.create_at;
	let imgs = files.map((item) => {
		return item.filename;
	});
	let imgStr = imgs.join(",");

	let sql = "INSERT INTO ddys_symptom (description, images, user_id, create_at) VALUES (?, ?, ?, ?)";

	sqlConnect(sql, [desc, imgStr, userid, caeateTime])
		.then((value) => {
            return sqlConnect(`SELECT symptom_id FROM ddys_symptom
                WHERE user_id = ?
                ORDER BY symptom_id DESC
                LIMIT 1;`, [userid])
			
        })
        .then(value=>{
            res.send({ code: 0, message: "添加成功！", data: value[0] });
        })
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 获取用户最新提交的症状

router.get("/emgcall/getsymptom", (req, res) => {
	let userid = req.query.userid;
	let sql = `SELECT * FROM ddys_symptom WHERE user_id = ? ORDER BY create_at DESC LIMIT 1`;
	sqlConnect(sql, [userid])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "获取成功！", data: value[0] });
			} else {
				res.send({ code: 1, message: `暂无症状信息！` });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 获取用户绑定的患者信息
router.get("/emgcall/getpatient", (req, res) => {
	let userid = req.query.userid;
	let sql = `SELECT * FROM ddys_patient WHERE user_id = ?`;
	sqlConnect(sql, [userid])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 0, message: "查询成功！", data: value });
			} else {
				res.send({ code: 1, message: "没有相关记录！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
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
		userMsg.age,
	])
		.then((value) => {
			return sqlConnect(
				`SELECT patient_id FROM ddys_patient WHERE user_id = ?`,
				[userMsg.user_id]
			);
		})
		.then((value) => {
			let id = value[value.length - 1].patient_id;
			res.send({ code: 0, message: "保存成功！", data: id });
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 添加电话急诊订单
router.post("/emgcall/addorder", (req, res) => {
	let params = req.body;
	let sql = `INSERT INTO ddys_order ( user_id, patient_id, office_id, create_at, price, type, symptom_id, doctor_id) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
	sqlConnect(sql, [params.userid, params.patientid, params.officeid, params.createtime, params.price, params.type, params.symid, params.doctorid])
		.then((value) => {
			res.send({ code: 0, message: "下单成功！" });
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 注册
router.post("/register", (req, res) => {
	let username = req.body.username;
	let password = req.body.password;
	let querySql = "SELECT * FROM ddys_user WHERE username = ?";
	let insertSql = 'INSERT INTO ddys_user ( nickname, username, password, avatar) VALUES (?, ?, ?, "default-avatar.png")';

	sqlConnect(querySql, [username])
		.then((value) => {
			if (value.length > 0) {
				res.send({ code: 1, message: "username exits" });
			} else {
				return sqlConnect(insertSql, [`用户${username}`, username, md5(password)]);
			}
		})
		.then((value) => {
			if (value.affectedRows == 1) {
				res.send({ code: 0, message: "注册成功！" });
			} else {
				res.send({ code: 1, message: "注册失败！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// 登录
router.post("/login", (req, res) => {
	let username = req.body.username;
	let password = req.body.password;
	let sql = "SELECT * FROM ddys_user WHERE username = ?";
	sqlConnect(sql, [username])
		.then((value) => {
			if (value.length == 0) {
				res.send({ code: 1, message: "username doesn't exit" });
			} else if (value[0].password == md5(password)) {
				let { nickname, user_id, username, avatar } = value[0];
				res.send({
					code: 0,
					message: "登录成功！",
					data: { nickname, user_id, username, avatar },
				});
			} else {
				res.send({ code: 1, message: "密码错误！" });
			}
		})
		.catch((reason) => res.send({ code: 1, message: `${reason}` }));
});

// dzy
//jkbk页面挂载后请求所有健康类别 url: /jkbk  get,返回{code:0,message:"success",data:result}
router.get('/jkbk',(req,res)=>{
    let sql='select * from ddys_category'
    sqlConnect(sql).then(valve=>{
        res.send({code:0,message:"success",data:valve});
    })
  })
//jk页面挂载后拿全部文章数据 /jk get 返回{code:0,message:"success",data:result}
router.get('/articleAll',(req,res)=>{
    let id=req.query.id
    let sql=`SELECT *FROM ddys_article RIGHT JOIN ddys_category_title ON ddys_article.category_title_id = ddys_category_title.id WHERE ddys_category_title.category_id = ?`
    sqlConnect(sql,[id]).then(valve=>{
        res.send({code:0,message:"success",data:valve});
    })
  })
//jk页面挂载后接受url地址栏参数并发送请求获取导航名称 /jk get 返回{code:0,message:"success",data:result}
router.get('/jk',(req,res)=>{
    let id=req.query.id
    let sql=`SELECT
    ddys_category.name,
    ddys_category_title.id,
    ddys_category_title.title_content
    FROM ddys_category RIGHT JOIN ddys_category_title ON ddys_category.category_id = ddys_category_title.category_id WHERE ddys_category_title.category_id = ?`
    sqlConnect(sql,[id]).then(valve=>{
        res.send({code:0,message:"success",data:valve});
    })
  })
//jk页面挂载后根据地址栏参数请求后台获取相关疾病 /relatedDiseases get返回{code:0,message:"success",data:result}
router.get('/relatedDiseases',(req,res)=>{
    let id=req.query.id
    let page=req.query.page
    let val=15
    let pageval=(page-1)*val
    let sql=`SELECT ddys_disease.disease_id,ddys_disease.name, ddys_office.office_id FROM
  ddys_office RIGHT JOIN ddys_disease ON ddys_office.office_id = ddys_disease.office_id WHERE ddys_office.category_id =? LIMIT ?,?`
    sqlConnect(sql,[id,pageval,val]).then(valve=>{
        res.send({code:0,message:"success",data:valve});
    })
  })
//Article页面挂载后拿到文章id 请求文章详情 /articleData  get 返回{code:0,message:"success",data:result}
router.get('/articleData',(req,res)=>{
    let id=req.query.id
    let sql=`SELECT content, subject FROM ddys_article WHERE article_id=?`
    sqlConnect(sql,[id]).then(valve=>{
        res.send({code:0,message:"success",data:valve});
    })
  })
//head页面筛选请求医生信息 /doctoritem post 返回{code:0,message:"success",data:result}
router.post('/doctoritem',(req,res)=>{
    let arry=Object.values(req.body)
    let sql=""
    if(arry.length==2){
        sql=`SELECT
        ddys_hospital.hospitalname,
        ddys_hospital.hospitallevel,
        ddys_doctor.doctor_id,
        ddys_doctor.nickname,
        ddys_doctor.avatar,
        ddys_doctor.office_id,
        ddys_doctor.level,
        ddys_doctor.hospital_id,
        ddys_doctor.description,
        ddys_doctor.direction,
        ddys_doctor.experience_1,
        ddys_doctor.experience_2,
        ddys_doctor.experience_3,
        ddys_doctor.respond,
        ddys_doctor.ask_price,
        ddys_doctor.answer,
        ddys_doctor.prescription,
        ddys_office.office_name
        FROM
        ddys_hospital
        INNER JOIN ddys_doctor ON ddys_hospital.hospital_id = ddys_doctor.hospital_id
        INNER JOIN ddys_office ON ddys_doctor.office_id = ddys_office.office_id
        WHERE
        ddys_office.office_id = ? AND ddys_doctor.level = ?`
    }else if(arry.length==3){
        sql=`SELECT
        ddys_hospital.hospitalname,
        ddys_hospital.hospitallevel,
        ddys_doctor.doctor_id,
        ddys_doctor.nickname,
        ddys_doctor.avatar,
        ddys_doctor.office_id,
        ddys_doctor.level,
        ddys_doctor.hospital_id,
        ddys_doctor.description,
        ddys_doctor.direction,
        ddys_doctor.experience_1,
        ddys_doctor.experience_2,
        ddys_doctor.experience_3,
        ddys_doctor.respond,
        ddys_doctor.ask_price,
        ddys_doctor.answer,
        ddys_doctor.prescription,
        ddys_office.office_name
        FROM
        ddys_hospital
        INNER JOIN ddys_doctor ON ddys_hospital.hospital_id = ddys_doctor.hospital_id
        INNER JOIN ddys_office ON ddys_doctor.office_id = ddys_office.office_id
        WHERE
        ddys_office.office_id = ? AND  ddys_doctor.ask_price >= ? AND ddys_doctor.ask_price <=?`
    }else{
        sql=`SELECT
        ddys_hospital.hospitalname,
        ddys_hospital.hospitallevel,
        ddys_doctor.doctor_id,
        ddys_doctor.nickname,
        ddys_doctor.avatar,
        ddys_doctor.office_id,
        ddys_doctor.level,
        ddys_doctor.hospital_id,
        ddys_doctor.description,
        ddys_doctor.direction,
        ddys_doctor.experience_1,
        ddys_doctor.experience_2,
        ddys_doctor.experience_3,
        ddys_doctor.respond,
        ddys_doctor.ask_price,
        ddys_doctor.answer,
        ddys_doctor.prescription,
        ddys_office.office_name
        FROM
        ddys_hospital
        INNER JOIN ddys_doctor ON ddys_hospital.hospital_id = ddys_doctor.hospital_id
        INNER JOIN ddys_office ON ddys_doctor.office_id = ddys_office.office_id
        WHERE
        ddys_office.office_id = ? AND ddys_doctor.ask_price >= ? AND ddys_doctor.ask_price <=? AND ddys_doctor.level = ?`
    }
    sqlConnect(sql,arry).then(valve=>{
        res.send({code:0,message:"success",data:valve});
    })
  })
  //head页面综合排序请求医生信息 /doctoritemDESC post 返回{code:0,message:"success",data:result}
  router.post('/doctoritemDESC',(req,res)=>{
    let value=req.body.value
    let officeID=req.body.officeID
    let sql=""
    if(value==0){
        sql=`SELECT
        ddys_hospital.hospitalname,
        ddys_hospital.hospitallevel,
        ddys_doctor.doctor_id,
        ddys_doctor.nickname,
        ddys_doctor.avatar,
        ddys_doctor.office_id,
        ddys_doctor.level,
        ddys_doctor.hospital_id,
        ddys_doctor.description,
        ddys_doctor.direction,
        ddys_doctor.experience_1,
        ddys_doctor.experience_2,
        ddys_doctor.experience_3,
        ddys_doctor.respond,
        ddys_doctor.ask_price,
        ddys_doctor.answer,
        ddys_doctor.prescription,
        ddys_office.office_name
        FROM
        ddys_hospital
        INNER JOIN ddys_doctor ON ddys_hospital.hospital_id = ddys_doctor.hospital_id
        INNER JOIN ddys_office ON ddys_doctor.office_id = ddys_office.office_id
        WHERE
        ddys_office.office_id = ?`
    }else if(value=="ask_price_ASC"){
        sql=`SELECT
        ddys_hospital.hospitalname,
        ddys_hospital.hospitallevel,
        ddys_doctor.doctor_id,
        ddys_doctor.nickname,
        ddys_doctor.avatar,
        ddys_doctor.office_id,
        ddys_doctor.level,
        ddys_doctor.hospital_id,
        ddys_doctor.description,
        ddys_doctor.direction,
        ddys_doctor.experience_1,
        ddys_doctor.experience_2,
        ddys_doctor.experience_3,
        ddys_doctor.respond,
        ddys_doctor.ask_price,
        ddys_doctor.answer,
        ddys_doctor.prescription,
        ddys_office.office_name
        FROM
        ddys_hospital
        INNER JOIN ddys_doctor ON ddys_hospital.hospital_id = ddys_doctor.hospital_id
        INNER JOIN ddys_office ON ddys_doctor.office_id = ddys_office.office_id
        WHERE
        ddys_office.office_id = ? ORDER BY ddys_doctor.${value.slice(0,-4)}`
    }else{
        sql=`SELECT
        ddys_hospital.hospitalname,
        ddys_hospital.hospitallevel,
        ddys_doctor.doctor_id,
        ddys_doctor.nickname,
        ddys_doctor.avatar,
        ddys_doctor.office_id,
        ddys_doctor.level,
        ddys_doctor.hospital_id,
        ddys_doctor.description,
        ddys_doctor.direction,
        ddys_doctor.experience_1,
        ddys_doctor.experience_2,
        ddys_doctor.experience_3,
        ddys_doctor.respond,
        ddys_doctor.ask_price,
        ddys_doctor.answer,
        ddys_doctor.prescription,
        ddys_office.office_name
        FROM
        ddys_hospital
        INNER JOIN ddys_doctor ON ddys_hospital.hospital_id = ddys_doctor.hospital_id
        INNER JOIN ddys_office ON ddys_doctor.office_id = ddys_office.office_id
        WHERE
        ddys_office.office_id = ? ORDER BY ddys_doctor.${value} DESC`
    }
    sqlConnect(sql,[officeID]).then(valve=>{
        res.send({code:0,message:"success",data:valve});
    })
  })
  //head页面用地区筛选符合条件的医生 /cityclick post 返回{code:0,message:"success",data:result}
  router.post("/cityclick",(req,res)=>{
    let arry=Object.values(req.body)
    let sql=`SELECT
    ddys_hospital.hospitalname,
    ddys_hospital.hospitallevel,
    ddys_office.office_name,
    ddys_doctor.doctor_id,
    ddys_doctor.nickname,
    ddys_doctor.avatar,
    ddys_doctor.office_id,
    ddys_doctor.level,
    ddys_doctor.hospital_id,
    ddys_doctor.description,
    ddys_doctor.direction,
    ddys_doctor.experience_1,
    ddys_doctor.experience_2,
    ddys_doctor.experience_3,
    ddys_doctor.respond,
    ddys_doctor.ask_price,
    ddys_doctor.answer,
    ddys_doctor.prescription
    FROM
    ddys_doctor
    INNER JOIN ddys_office ON ddys_doctor.office_id = ddys_office.office_id
    INNER JOIN ddys_hospital ON ddys_doctor.hospital_id = ddys_hospital.hospital_id
    WHERE
    ddys_office.office_id = ? AND
    ddys_hospital.city_id = ?`
    sqlConnect(sql,arry).then(valve=>{
        res.send({code:0,message:"success",data:valve});
    })
  })
  
  //head页面挂载后获取所有科室/officeAll get  返回{code:0,message:"success",data:result}
  router.get('/officeAll',(req,res)=>{
    let sql='select * from ddys_office'
    sqlConnect(sql).then(valve=>{
        res.send({code:0,message:"success",data:valve});
    })
  })
  //head页头根据科室筛选所有医生信息 /officeItem post 返回{code:0,message:"success",data:result}
  router.post('/officeItem',(req,res)=>{
    let id=req.body.officeItem
    let sql=`SELECT
    ddys_hospital.hospitalname,
    ddys_hospital.hospitallevel,
    ddys_doctor.doctor_id,
    ddys_doctor.nickname,
    ddys_doctor.avatar,
    ddys_doctor.office_id,
    ddys_doctor.level,
    ddys_doctor.hospital_id,
    ddys_doctor.description,
    ddys_doctor.direction,
    ddys_doctor.experience_1,
    ddys_doctor.experience_2,
    ddys_doctor.experience_3,
    ddys_doctor.respond,
    ddys_doctor.ask_price,
    ddys_doctor.answer,
    ddys_doctor.prescription,
    ddys_office.office_name
    FROM
    ddys_hospital
    INNER JOIN ddys_doctor ON ddys_hospital.hospital_id = ddys_doctor.hospital_id
    INNER JOIN ddys_office ON ddys_doctor.office_id = ddys_office.office_id
    WHERE
    ddys_office.office_id = ?`
    sqlConnect(sql,[id]).then(valve=>{
        res.send({code:0,message:"success",data:valve});
    })
  })

//   yzw

//文章详情
app.get('/yyy', (req, res) => {
    let disease_id = req.query.disease_id
    let office_id = req.query.office_id
    let sql = `select * from ddys_disease where disease_id=${disease_id}`
    pool.query(sql, (error, results) => {
        if (error) throw error;
        if (results.length) { // 有数据
            var disease = results[0];
            //判断是否有文章数据如果没有返回数据
            if (disease.description == null) {
                res.send({ code: 1, message: 'No Data' })
                return;
            }
            // 有数据则获取文章json字符串,并转换成json对象
            disease.description = JSON.parse(disease.description).article
            //删除暂时没用的就诊数据 
            disease.description.splice(7, 1)

            let sql2 = `SELECT
            d.doctor_id,
            d.nickname,
            d.avatar,
            d.office_id,
            d.level,
            d.hospital_id,
            d.direction,
            d.respond,
            d.answer,
            d.prescription,
            h.hospitalname,
            h.hospitallevel,
            o.office_id,
            o.office_name
            FROM
            ddys_doctor AS d
            INNER JOIN ddys_hospital AS h ON d.doctor_id = h.hospital_id
            INNER JOIN ddys_office AS o ON d.office_id = o.office_id
            WHERE
            d.office_id = ?
            LIMIT 0, 1`
            pool.query(sql2, [office_id], (err, result2) => {
                if (err) throw err
                if (result2.length) { // 医生名片有数据
                    res.send({ code: 0, message: 'OK', data: { disease, result2: result2[0] } })
                } else {// 医生名片没有有数据
                    res.send({ code: 0, message: 'OK', data: { disease, result2: 'NO Data' } })
                }
            })
        } else { // 没有数据
            res.send({ code: 1, message: 'No Data' })
        }
    })
})


//获取科室数据
app.get("/consult", (req, res) => {
	let sql = `select * from ddys_office`;
	pool.query(sql, (error, results) => {
		if (error) throw error;
		if (results.length) {
			// 有数据
			res.send({ code: 0, message: "OK", data: results });
		} else {
			// 没有数据
			res.send({ code: 1, message: "No Data" });
		}
	});
});

//获取对应科室的疾病名称
app.get("/consultId", (req, res) => {
	let office_id = req.query.office_id;
	let sql = `select disease_id,name,office_id,index_name,tag_category_id from ddys_disease where office_id=?`;
	pool.query(sql, [office_id], (error, results) => {
		if (error) throw error;
		if (results.length) {
			// 有数据
			res.send({ code: 0, message: "OK", data: results });
		} else {
			// 没有数据
			res.send({ code: 1, message: "No Data" });
		}
	});
});

// zxh

router.get("/hospital", (req, res) => {
	let id = req.query.id;
	let sql;
	if (!id) {
		sql = "select * from ddys_hospital";
	} else {
		sql = `select * from ddys_hospital where city_id=${id}`;
	}
	sqlConnect(sql).then((value) => {
		if (value.length == 0) {
			res.send({ code: 1, message: "error" });
		} else {
			res.send({ code: 0, message: "ok", data: value });
		}
	});
});
router.get("/details", (req, res) => {
	let id = req.query.hospital;
	let sql = `select *
        from ddys_doctor d
        inner join ddys_hospital h on d.hospital_id = h.hospital_id
        inner join ddys_office o on d.office_id = o.office_id
        where h.hospital_id=?`;
	sqlConnect(sql, [id]).then((value) => {
		if (value.length == 0) {
			res.send({ code: 1, message: "error" });
		} else {
			res.send({ code: 0, message: "ok", data: value });
		}
	});
});

router.get("/subpage", (req, res) => {
	let id = req.query.hospital;
	let sql = "select * from ddys_hospital where hospital_id = ?";
	sqlConnect(sql, [id]).then((value) => {
		if (value.length == 0) {
			res.send({ code: 1, message: "error" });
		} else {
			res.send({ code: 0, message: "ok", data: value[0] });
		}
	});
});

router.get("/addressbar", (req, res) => {
	let sql = "SELECT * FROM ddys_city city INNER JOIN ddys_province prov ON city.province_id = prov.province_id";
	let sql2 = "select * from ddys_province";
	Promise.all([sqlConnect(sql), sqlConnect(sql2)]).then((value) => {
		if (value.length == 0) {
			res.send({ code: 1, message: "error" });
		} else {
			res.send({ code: 0, message: "ok", data: value });
		}
	});
});

// xx
router.get("/question/doctor", (req, res) => {
    let id = req.query.id;
	let sql = `select 
    d.office_id office_id,
    d.doctor_id d_id,
    d.nickname nickname,
    d.avatar avatar,
    d.level d_level,
    d.hospital_id hospital_id,
    d.description description,
    d.direction direction,
    d.experience_1 experience_1,
    d.experience_2 experience_2,
    d.experience_3 experience_3,
    d.ask_price ask_price,
    d.respond respond,
    d.answer answer,
    d.star,
    d.prescription prescription,
    h.hospitalname hospitalname,
    o.office_name office_name
    from ddys_doctor d 
    inner join ddys_office o on d.office_id=o.office_id 
    inner join ddys_comment c on d.doctor_id=c.doctor_id
    inner join ddys_hospital h on d.hospital_id=h.hospital_id
    where d.doctor_id=? `;
	sqlConnect(sql, [id])
		.then((value) => {
			if (value.length) {
				res.send({ code: 0, message: "OK", data: value[0] });
			} else {
				res.send({ code: 1, message: "NO Data" });
			}
		})
		.catch((reason) => res.send({ reason: `${reason}` }));
});

router.get("/question/details", (req, res) => {
	let id = req.query.id;
	let sql = `select 
    d.doctor_id doctor_id,
    a.content acontent,
    a.create_at acreate_at,
    q.content qcontent,
    q.create_at qcreate_at,
    d.nickname nickname,
    d.avatar davatar,
    d.level level,
    o.office_name office_name,
    h.hospitalname hospitalname,
    d.ask_price ask_price
    from ddys_answer a
    inner join ddys_doctor d on a.doctor_id=d.doctor_id
    inner join ddys_question q on a.answer_id=q.question_id
    inner join ddys_office o on d.office_id=o.office_id
    inner join ddys_hospital h on d.hospital_id=h.hospital_id
    where a.answer_id=?
    `;
	sqlConnect(sql, [id])
		.then((value) => {
			if (value.length) {
				res.send({ code: 0, message: "OK", data: value[0] });
			} else {
				res.send({ code: 1, message: "NO Data" });
			}
		})
		.catch((reason) => res.send({ reason: `${reason}` }));
});

router.get("/question", (req, res) => {
	let sql = `select * from ddys_office `;
	sqlConnect(sql)
		.then((value) => {
			if (value.length) {
				res.send({ code: 0, message: "OK", data: value });
			} else {
				res.send({ code: 1, message: "NO Data" });
			}
		})
		.catch((reason) => res.send({ reason: `${reason}` }));
});

router.get("/disease", (req, res) => {
	let id = req.query.id;
	let sql = `select *
    from ddys_disease d 
    inner join ddys_office o on o.office_id=d.office_id
    where d.office_id=? limit 10;`;
	sqlConnect(sql, [id])
		.then((value) => {
			if (value.length) {
				res.send({ code: 0, message: "OK", data: value });
			} else {
				res.send({ code: 1, message: "NO Data" });
			}
		})
		.catch((reason) => res.send({ reason: `${reason}` }));
});

router.get("/comment", (req, res) => {
	let id = req.query.id;
	let sql = `select * from ddys_comment where doctor_id=? LIMIT 3`;
	sqlConnect(sql, [id])
		.then((value) => {
			if (value.length) {
				res.send({ code: 0, message: "OK", data: value });
			} else {
				res.send({ code: 1, message: "NO Data" });
			}
		})
		.catch((reason) => res.send({ reason: `${reason}` }));
});

router.get("/uquestion", (req, res) => {
	let sql = `select * from ddys_question q
    inner join ddys_user u on u.user_id=q.user_id
    `;
	sqlConnect(sql)
		.then((value) => {
			if (value.length) {
				res.send({ code: 0, message: "OK", data: value });
			} else {
				res.send({ code: 1, message: "NO Data" });
			}
		})
		.catch((reason) => res.send({ reason: `${reason}` }));
});

router.get("/HOSPA", (req, res) => {
	let doctorId = req.query.doctor_id;
	let sql = `SELECT
    ddys_doctor.doctor_id,
    ddys_doctor.nickname,
    ddys_doctor.avatar,
    ddys_doctor.office_id,
    ddys_doctor.level,
    ddys_doctor.hospital_id,
    ddys_doctor.description,
    ddys_doctor.direction,
    ddys_doctor.experience_1,
    ddys_doctor.experience_2,
    ddys_doctor.experience_3,
    ddys_doctor.respond,
    ddys_doctor.ask_price,
    ddys_doctor.answer,
    ddys_doctor.prescription,
    ddys_hospital.hospital_id,
    ddys_hospital.hospitalname,
    ddys_hospital.hospitallevel,
    ddys_hospital.longitude,
    ddys_hospital.latitude,
    ddys_hospital.address,
    ddys_hospital.description,
    ddys_hospital.phone,
    ddys_hospital.city_id,
    ddys_office.office_name
    FROM
    ddys_doctor
    INNER JOIN ddys_hospital ON ddys_doctor.hospital_id = ddys_hospital.hospital_id
    INNER JOIN ddys_office ON ddys_doctor.office_id = ddys_office.office_id
    WHERE
    ddys_doctor.doctor_id = ?`;
	pool.query(sql, [doctorId], (err, result) => {
		if (err) throw err;
		res.send(result[0]);
	});
});

//请求科室
router.get("/office", (req, res) => {
	let sql = "select * from ddys_office";
	pool.query(sql, (err, result) => {
		if (err) throw err;
		res.send(result);
	});
});
//请求医生信息
router.get("/doctor", (req, res) => {
	let officeId = req.query.office_id;
	let sql = `SELECT
        ddys_hospital.hospitalname,
        ddys_doctor.nickname,
        ddys_doctor.avatar,
        ddys_doctor.doctor_id,
        ddys_doctor.office_id,
        ddys_doctor.level,
        ddys_doctor.hospital_id,
        ddys_doctor.description,
        ddys_doctor.direction,
        ddys_doctor.experience_1,
        ddys_doctor.experience_2,
        ddys_doctor.experience_3,
        ddys_doctor.respond,
        ddys_doctor.ask_price,
        ddys_doctor.answer,
        ddys_doctor.prescription,
        ddys_office.office_id
      FROM
        ddys_office
      INNER JOIN ddys_doctor ON ddys_office.office_id = ddys_doctor.office_id
      INNER JOIN ddys_hospital ON ddys_doctor.hospital_id = ddys_hospital.hospital_id
      WHERE
        ddys_office.office_id =?`;
	pool.query(sql, [officeId], (err, result) => {
		if (err) throw err;
		res.send(result);
	});
});

//请求医院信息
router.get("/sale/hospital", (req, res) => {
	let sql = `SELECT
        ddys_hospital.hospitalname,
        ddys_doctor.nickname,
        ddys_doctor.avatar,
        ddys_doctor.doctor_id,
        ddys_doctor.office_id,
        ddys_doctor.level,
        ddys_doctor.hospital_id,
        ddys_doctor.description,
        ddys_doctor.direction,
        ddys_doctor.experience_1,
        ddys_doctor.experience_2,
        ddys_doctor.experience_3,
        ddys_doctor.respond,
        ddys_doctor.ask_price,
        ddys_doctor.answer,
        ddys_doctor.prescription,
        ddys_doctor.star,
        ddys_office.office_id
      FROM
        ddys_office
      INNER JOIN ddys_doctor ON ddys_office.office_id = ddys_doctor.office_id
      INNER JOIN ddys_hospital ON ddys_doctor.hospital_id = ddys_hospital.hospital_id
      WHERE
        ddys_office.office_id = 1`;
	pool.query(sql, (err, result) => {
		if (err) throw err;
		res.send(result);
	});
});

app.use(router);
app.listen(3000, () => console.log("running 3000..."));
