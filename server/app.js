const mysql = require("mysql");
let pool = mysql.createPool({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: "ddys",
    multipleStatements: true,
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
router.get('/settime', (req, res)=>{
    let sql = 'UPDATE ddys_user SET username = ?, avatar = ? WHERE user_id = ?;'
    let arr = []
    for(var i = 1; i<174; i++){
        arr[i] = i + 1;
    }
    let promises = arr.map((item,index)=>{
        let userid = 18700000000 + parseInt(Math.random()*99999999) + ''
        
        let avatar = item + '.jpg'
        
        // num = String(num)
        // console.log(num)
        return sqlConnect(sql, [userid, avatar, item])
    })
    Promise.all(promises)
    .then(value=>{
        console.log(value)
    })
})




// 搜索文章接口
router.get('/search/article', (req, res)=>{
    let keyword = decodeURI(req.query.keyword)
    let sql = `SELECT * FROM ddys_article WHERE subject LIKE "%${keyword}%"
    OR description LIKE "%${keyword}%"`
    sqlConnect(sql)
    .then(value=>{
        if(value.length > 0){
            res.send({ code: 0, message: "查询成功！", data: value })
        }else{
            res.send({ code: 1, message: "没有找到相关文章！"})
        }
    }).catch(reason => res.send({ code: 1, message: `${reason}` }));
})



// 搜索问题接口
router.get('/search/question', (req, res)=>{
    let keyword = decodeURI(req.query.keyword)
    let sql = `SELECT 
    ques.question_id quesid,
    ques.content 'describe',
    ques.create_at committime,
    user.avatar imgurl,
    user.nickname nickname
    FROM ddys_question ques
    INNER JOIN ddys_user user ON ques.user_id = user.user_id
    WHERE ques.content LIKE "%${keyword}%"`
    sqlConnect(sql)
    .then(value=>{
        console.log(value)
        if(value.length > 0){
            res.send({ code: 0, message: "查询成功！", data: value })
        }else{
            res.send({ code: 1, message: "没有找到相关问题！"})
        }
    }).catch(reason => res.send({ code: 1, message: `${reason}` }));
})

// 获取首页文章信息
router.get('/queryarticle', (req, res)=>{
    // let start = parseInt(Math.random() * 500)
    sqlConnect('SELECT * FROM ddys_article LIMIT 3')
    .then(value=>{
        res.send({ code: 0, message: "查询成功！", data: value })
    }).catch(reason => res.send({ code: 1, message: `${reason}` }));
})

// 获取首页问题分类
router.get('/querydisease', (req, res)=>{
    // let start = parseInt(Math.random() * 500)
    sqlConnect('SELECT * FROM ddys_disease LIMIT 7')
    .then(value=>{
        res.send({ code: 0, message: "查询成功！", data: value })
    }).catch(reason => res.send({ code: 1, message: `${reason}` }));
})

// 获取首页问题信息
router.get('/queryquestion', (req, res)=>{
    let diseaseid = req.query.diseaseid
    sqlConnect(`SELECT 
        ques.question_id quesid,
        ques.content 'describe',
        ques.create_at committime,
        user.avatar imgurl,
        user.nickname nickname
        FROM ddys_question ques
        INNER JOIN ddys_user user ON ques.user_id = user.user_id
        WHERE ques.disease_id = ?
        LIMIT 3`, [diseaseid])
    .then(value=>{
        res.send({ code: 0, message: "查询成功！", data: value })
    }).catch(reason => res.send({ code: 1, message: `${reason}` }));
})

// 修改昵称
router.post('/mine/modifynickname', (req, res)=>{
    let userid = req.body.userid;
    let nickname = req.body.nickname
    console.log(userid, nickname)
    let sql = `UPDATE ddys_user SET nickname = ? WHERE user_id = ?`
    sqlConnect(sql, [nickname, userid])
    .then(value => {
        return sqlConnect('SELECT * FROM ddys_user WHERE user_id = ?', [userid])
        
    })
    .then(value=>{
        let { nickname, user_id, username, avatar } = value[0];
        res.send({ code: 0, message: "修改成功！", data: { nickname, user_id, username, avatar } });
    })
    .catch(reason => res.send({ code: 1, message: `${reason}` }));
})

// 修改头像
router.post(
	"/mine/modifyavatar",
	uploadTools.array("uploadFile"),
	(req, res) => {
		let body = req.body;
		// let desc = req.body.desc;
		let files = req.files;
		let userid = body.userid;
		let imgStr = files[0].filename
		let sql =
			"UPDATE ddys_user SET avatar = ? WHERE user_id = ?";

		sqlConnect(sql, [imgStr, userid])
			.then(value => {
				res.send({ code: 0, message: "添加成功！", data: imgStr });
			})
			.catch(reason => res.send({ code: 1, message: `${reason}` }));
	}
);


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
				res.send({ code: 0, message: "添加成功！", data: imgStr });
			})
			.catch(reason => res.send({ code: 1, message: `${reason}` }));
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
                    res.send({ code: 0, message: "获取成功！", data: value[0] });

                }else{
                    res.send({ code: 1, message: `暂无症状信息！` })
                }
			})
			.catch(reason => res.send({ code: 1, message: `${reason}` }));
})


// 获取用户绑定的患者信息
router.get("/emgcall/getpatient", (req, res) => {
	let userid = req.query.userid;
	let sql = `SELECT * FROM ddys_patient WHERE user_id = ?`;
	console.log(userid);
	sqlConnect(sql, [userid]).then(value => {
		if (value.length > 0) {
			res.send({ code: 0, message: "查询成功！", data: value });
		} else {
			res.send({ code: 1, message: "没有相关记录！" });
		}
	}).catch(reason => res.send({ code: 1, message: `${reason}` }));
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
		res.send({code: 0, message: '保存成功！'})
    })
    .catch(reason => res.send({ code: 1, message: `${reason}` }));
});


// 添加电话急诊订单
router.post('/emgcall/addorder', (req, res)=>{
    let params = req.body
    let sql = `INSERT INTO ddys_order ( user_id, patient_id, office_id, create_at) VALUES (?, ?, ?, ?)`
    sqlConnect(sql, [params.userid, params.patientid, params.officeid, params.createtime])
		.then(value => {
			res.send({code: 0, message: '下单成功！'})
			
		}).catch(reason => res.send({ code: 1, message: `${reason}` }));
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
				res.send({ code: 0, message: "注册成功！" });
			} else {
				res.send({ code: 1, message: "注册失败！" });
			}
		})
		.catch(reason => res.send({ code: 1, message: `${reason}` }));
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
					message: "登录成功！",
					data: { nickname, user_id, username, avatar },
				});
			} else {
				res.send({ code: 1, message: "密码错误！" });
			}
		})
		.catch(reason => res.send({ code: 1, message: `${reason}` }));
});




// dzy
//jkbk页面挂载后请求所有健康类别 url: /jkbk  get,返回{code:1,message:"success",data:result}
router.get('/jkbk',(req,res)=>{
    let sql='select * from ddys_category'
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send({code:1,message:"success",data:result});
    })
})
//jk页面挂载后拿全部文章数据 /jk get 返回{code:1,message:"success",data:result}
router.get('/articleAll',(req,res)=>{
    let id=req.query.id
    let sql=`SELECT *FROM ddys_article RIGHT JOIN ddys_category_title ON ddys_article.category_title_id = ddys_category_title.id WHERE ddys_category_title.category_id = ?`
    pool.query(sql,[id],(err,result)=>{
        if(err)throw err;
        res.send({code:1,message:"success",data:result});
    })
})
//jk页面挂载后接受url地址栏参数并发送请求获取导航名称 /jk get 返回{code:1,message:"success",data:result}
router.get('/jk',(req,res)=>{
    let id=req.query.id
    let sql=`SELECT
    ddys_category.name,
    ddys_category_title.id,
    ddys_category_title.title_content
    FROM ddys_category RIGHT JOIN ddys_category_title ON ddys_category.category_id = ddys_category_title.category_id WHERE ddys_category_title.category_id = ?`
    pool.query(sql,[id],(err,result)=>{
        if(err)throw err;
        res.send({code:1,message:"success",data:result});
    })
})
//jk页面挂载后根据地址栏参数请求后台获取相关疾病 /relatedDiseases get返回{code:1,message:"success",data:result}
router.get('/relatedDiseases',(req,res)=>{
    let id=req.query.id
    let sql=`SELECT ddys_disease.disease_id,ddys_disease.name FROM
	ddys_office RIGHT JOIN ddys_disease ON ddys_office.office_id = ddys_disease.office_id WHERE ddys_office.category_id =?`
    pool.query(sql,[id],(err,result)=>{
        if(err)throw err;
        res.send({code:1,message:"success",data:result});
    })
})
//Article页面挂载后拿到文章id 请求文章详情 /articleData  get 返回{code:1,message:"success",data:result}
router.get('/articleData',(req,res)=>{
    let id=req.query.id
    let sql=`SELECT content FROM ddys_article WHERE article_id=?`
    pool.query(sql,[id],(err,result)=>{
        if(err)throw err;
        res.send({code:1,message:"success",data:result});
    })
})
//head页面筛选请求医生信息 /doctoritem post 返回{code:1,message:"success",data:result}
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
    pool.query(sql,arry,(err,result)=>{
        if(err)throw err;
        res.send({code:1,message:"success",data:result});
    })
})
//head页面综合排序请求医生信息 /doctoritemDESC post 返回{code:1,message:"success",data:result}
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
    pool.query(sql,[officeID],(err,result)=>{
        if(err)throw err;
        res.send({code:1,message:"success",data:result});
    })
})
//head页面挂载后获取所有科室/officeAll get  返回{code:1,message:"success",data:result}
router.get('/officeAll',(req,res)=>{
    let sql='select * from ddys_office'
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send({code:1,message:"success",data:result});
    })
})
//head页头根据科室筛选所有医生信息 /officeItem post 返回{code:1,message:"success",data:result}
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
    pool.query(sql,[id],(err,result)=>{
        if(err)throw err;
        res.send({code:1,message:"success",data:result});
    })
})


//文章详情
app.get('/yyy', (req, res) => {
    let disease_id = req.query.disease_id
    let sql = `select * from ddys_disease where disease_id=${disease_id}`
    pool.query(sql, (error, results) => {
      if (error) throw error;
      if (results.length) { // 有数据
        var _data = results[0];
        // console.log(_data)
        //判断是否有文章数据如果没有返回数据
        if(_data.description==null){
          res.send({ code: 1, message: 'No Data' })
          return;
        }
        // 有数据则获取文章json字符串,并转换成json对象
        _data.description = JSON.parse(_data.description).article
        console.log(_data.description)
   
        //删除暂时没用的就诊数据 
        _data.description.splice(7,1)
        console.log(_data.description)
        res.send({ code: 0, message: 'OK', data: _data })
      } else { // 没有数据
        res.send({ code: 1, message: 'No Data' })
      }
    })
  })
  
  
  
  
  
  //获取科室数据
  app.get('/consult', (req, res) => {
    let sql = `select * from ddys_office`
    pool.query(sql, (error, results) => {
      if (error) throw error;
      if (results.length) { // 有数据
        // console.log(results)
        res.send({ code: 0, message: 'OK', data: results})
      } else { // 没有数据
        res.send({ code: 1, message: 'No Data' })
      }
    })
  })
  
  //获取对应科室的疾病名称
  app.get('/consultId', (req, res) => {
    let office_id = req.query.office_id
    let sql = `select disease_id,name,office_id,index_name,tag_category_id from ddys_disease where office_id=?`
    pool.query(sql,[office_id],  (error,results) => {
      if (error) throw error;
      if (results.length) { // 有数据
        console.log(results)
        res.send({ code: 0, message: 'OK', data: results})
      } else { // 没有数据
        res.send({ code: 1, message: 'No Data' })
      }
    })
  })
  







app.use(router);
app.listen(3000, () => console.log("running 3000..."));
