const sqlConnect = require('./public/public')


// 添加症状
router.post('/emgcall/addsymptomimg', uploadTools.array('uploadFile'), (req, res)=>{
    let body = req.body
    // let desc = req.body.desc;
    let files = req.files
    let userid = body.userid
    let desc = body.desc
    let caeateTime = body.create_at
    console.log(files, body.userid,caeateTime)
    let imgs = files.map(item=>{
        return item.filename
    })
    let imgStr = imgs.join(',');
    console.log(imgStr)
    // let images = req.body.images.split(',');
    let sql = 'INSERT INTO ddys_symptom (description, images, user_id, create_at) VALUES (?, ?, ?, ?)';
    
    
    sqlConnect(sql, [desc, imgStr, userid, caeateTime])
    .then(value=>{
        console.log(value)
        res.send({code: 0, msg: '添加成功！', data: imgStr})
    })
    .catch(reason => res.send({code: 1, reason: `${reason}`}));

})

