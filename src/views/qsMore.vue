<template>
    <div>
        <!-- 头部导航开始 -->
        <div class="question-tab" style="padding:20px 16px 10px">
            <div class="question-tab-item" :class="{active:tagactive==index}" v-for="(direction,index) of directions" :key="index" @click="onTab(index)">
                {{direction}}
            </div>
        </div>
        <!-- 头部导航结束 -->
        <!-- 公开问题开始 -->
        <div>
            <div class="public-list-title">
                精选以下公开问题可查看
            </div>
            <div class="public-question" v-for="(article,index) of articles" :key="index">
                <div class="public-question-title">
                    <div style="width:20px;height:20px">
                        <img :src='`http://127.0.0.1:3000/${article.avatar}`' style="width:100%">
                    </div>
                        <span style="margin-left:6px">{{article.nickname|nicknameFormat}}</span>
                    </div>
                    <div class="public-question-content" v-html="article.content">
                    </div>
                    <div class="public-question-time">
                        <span style="margin-right:12px">{{article.create_at|dateFormat}}</span>
                    </div>
            </div>
        </div>
        <!-- 公开问题结束 -->
    </div>
</template>

<style >
.public-question::after{
    position: absolute;
    right: 16px;
    bottom: 0;
    left: 16px;
    box-sizing: border-box;
    height: 1px;
    background-color: #ebebeb;
    transform: scaleY(.5);
    content: "";
}
.public-question-time{
    color: #999;
    font-weight: 300;
    font-size: 12px;
    line-height: 1.17;
}
.public-question-content{
    margin: 12px 0;
    color: #4d4d4d;
    font-weight: 300;
    font-size: 16px;
    line-height: 1.5;
    display: -webkit-box;
    max-height: 66pxpx;
    overflow: hidden;
    line-height: 22px;
    word-break: break-all;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;
}
.public-question-title{
    display: flex;
    align-items: center;
    color: #333;
    font-weight: 500;
    font-size: 17px;
    line-height: 1.12;
}
    .public-question{
    padding: 20px 16px;
    background-color: #fff;
    position: relative;
    }
    .active{
    color: #00c792!important;
    font-weight: 400!important;
    background-color: #e5f9f4!important;
    }
    .public-list-title{
    padding: 20px 16px;
    color: #333;
    font-weight: 500;
    font-size: 17px;
    line-height: 1.12;
    }
    .question-tab-item{
    margin-right: 12px;
    display: inline-block;
    margin-bottom: 12px;
    padding: 8px 12px;
    color: #4d4d4d;
    font-weight: 300;
    font-size: 14px;
    line-height: 1.14;
    background-color: #fafafa;
    border-radius: 4px;
    }
</style>

<script>
export default {
    data() {
        return {
          doctor:{},
          directions:[],
          tagactive:'', 
          articles:[] 
        }
    },
    mounted() {
        //获取url传参
        let id=this.$route.params.id;
        let url='/question/doctor?id='+id
        this.axios.get(url).then((res)=>{
            this.doctor=res.data.data;
            //切割擅长方向
            this.directions=this.doctor.direction.split('，');
        })
        //请求问题数据
        this.axios.get('/uquestion').then((res,req)=>{
            this.articles=res.data.data.slice(0,10);
                // console.log(this.articles);
        })
        
    },
    methods:{
        onTab(index){
            this.tagactive=index;
            this.axios.get('/uquestion').then((res,req)=>{
                
                this.articles=res.data.data.slice(this.tagactive*10,(this.tagactive+1)*10);
                // console.log(this.articles);
            })
        }
    }
}
</script>