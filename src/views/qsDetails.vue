<template>
    <div >
        <!-- 头部固定定位区域开始 -->
        <div class="container-head">
            <!-- 公开问题详情头部 -->
            <van-nav-bar
            title="公开问题详情"
            left-arrow
            @click-left="onClickLeft"
            ></van-nav-bar>
            <!-- 公开问题详情头部结束 -->
            <!-- 医生简绍开始 -->
            <div class="header-doctor" >
                <div><!-- 头像 -->
                    <img :src="require(`../assets/img/${doctor.davatar}`)">
                </div>
                <div>
                    <p style="color:#4d4d4d;font-size:17px;margin:0">{{doctor.nickname}} <span style="margin-left:6px;font-size:14px">{{
                        doctor.level}}</span> 
                    </p>
                    <p style="color:#999;font-size:13px;margin-top:6px;">{{doctor.office_name}} {{doctor.hospitalname}}</p>
                </div>
            </div>
            <!-- 医生简绍结束 -->
        </div>
        <!-- 头固定定位区域结束 -->
        <!-- 主内容开始 -->
        <div class="container-body">
            <!-- 提问时间 -->
            <div>
                {{doctor.qcreate_at |dateFormat}}
            </div>
            <!-- 问题描述 -->
            <div>
                <div>第1次提问</div>

                <div v-html="doctor.qcontent">问题描述：</div>
                
                <p>为保护用户隐私不显示图片</p>
            </div>
            <!-- 问题回答时间 -->
            <div>
                {{doctor.acreate_at}}
            </div>
            <!-- 问题回答详情 -->
            <div>
                <a href="" style="font-weight:500;display:flex;align-items:center">
                    <div style="width:36px;height:36px;border-radius:50%;overflow:hidden">
                        <img :src="require(`../assets/img/${doctor.davatar}`)">
                    </div>
                    <span style="margin-left:10px">{{doctor.nickname}} 医生</span>
                </a>
                <div v-html="doctor.acontent">
                </div>
            </div>
        </div>
        <!-- 主内容结束 -->
        <!-- 底部提交按钮开始 -->
        <div class="container-bottom">
            <div>
                <router-link :to="`/question/doctor/${doctor.doctor_id}`">
                    <button>
                        <span>向该医生提问 (图文 ¥{{doctor.ask_price}})</span>
                    </button>
                </router-link>
            </div>
        </div>
        <!-- 底部提交按钮结束 -->
    </div>
</template>

<style>
.container-bottom>div button{
    border: none;
    outline: none;
    width: 100%;
    padding: 14px 0;
    border-radius: 26px;
    font-size: 17px;
    line-height: 1.12;
    background-color: #00c792;
    color: #fff;
}
.container-bottom>div{
    padding: 10px 16px;
}
.container-bottom:after{
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    box-sizing: border-box;
    height: 1px;
    background: #ebebeb;
    content: "";
}
.container-bottom{
    max-width: 768px;
    margin: 0 auto;
    background-color: #fff;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 8;
}
.container-body>div:nth-child(4)>div{
    font-weight: 300;
    font-size: 17px;
    line-height: 1.5;
    margin-top: 18px;
    white-space: pre-line;
}
.container-body>div:nth-child(4){
    margin: 0 15px 15px;
    padding: 20px 15px;
    border-radius: 4px;
    color: #333;
}
.container-body>div:nth-child(3){
    padding: 15px 0;
    color: #999;
    font-size: 12px;
    text-align: center;
}
.container-body>div:nth-child(2)>p{
    color: #b3b3b3;
    font-size: 13px;
    line-height: 15px;
    margin-left: 15px;
    margin-bottom: 0px;
}
.container-body>div:nth-child(2)>div:nth-child(1){
    margin-bottom: 18px;
    font-weight: 500;
}
.container-body>div:nth-child(2){
    background-color: #e6edf5;
    margin: 0 15px 15px;
    padding: 20px 15px;
    color: #333;
    border-radius: 5px;
    font-size: 17px;
    font-weight: 300;
    line-height: 1.5;
}
.container-body{
    margin-bottom: 100px;
    z-index: 0;
    margin-top: 150px;
}
.container-body>div:nth-child(1){
    padding: 15px 0;
    color: #999;
    font-size: 12px;
    text-align: center;
}
.header-doctor>div:nth-child(2){
    margin-left: 10px;
}
.header-doctor>div:nth-child(1){
    width: 44px;height: 44px;
    border-radius: 4px;
}
.header-doctor{
    display: flex;
    padding: 20px 16px;
}
img{
    max-width: 100%;
}
.container-head{
    background: #fff;
    position:fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 8;
    max-width: 768px;
    margin: 0 auto;
}
#app{
    max-width: 768px;
}
</style>

<script>
export default {
    data() {
        return {
            articleId:'',
            doctor:{
                davatar:'1.jpg'
            },
            
        }
    },
    methods: {
        // 返回问题页
        onClickLeft(){
            this.$router.go(-1)
        }
    },
    mounted() {
        window.scrollTo(0, 0)
        //获取url传参
        let id=this.$route.params.id;
        this.articleId=id;
        let url='/question/details?id='+id
        this.axios.get(url).then((res)=>{
            this.doctor=res.data.data;
            console.log(this.doctor)
        })
    },
}
</script>