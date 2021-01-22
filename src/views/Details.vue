<template>
    <div id="details">
        <van-nav-bar title="医院详情" left-arrow @click-left="onClickLeft"></van-nav-bar>
        <router-link class="essay" :to="`/Subpage?hospital=${context[0].hospital_id}`">
            <p>{{context[0].hospitalname}}</p>
            <div class="_title">
                <van-cell class="tag" :title="context[0].hospitallevel" icon="checked" />
                <van-cell  title="医保" icon="checked" />
            </div>
            <p class="cotent">{{context[0].description}}</p>
        </router-link>
        <p class="ADR">{{context[0].address}}</p>
        <p class="ADR">联系电话（总机）<span>{{context[0].phone}}</span><img src="../assets/03.png"></p>
        <router-link :to="`/Subpage?hospital=${context[0].hospital_id}`"><van-tag round type="primary" text-color="#00c792">更多医院介绍信息</van-tag></router-link>
        <p class="adr">支持在线咨询医生</p>
        <div class="Doctors" v-for="(item,index) of context" :key="index">
            <a href="">
                <div class="Photo"><img :src="require(`../assets/img/${item.avatar}`)"></div>
                <div class="Text">
                <p>{{item.nickname}} <span>{{item.level}}</span><van-tag size="medium">三甲</van-tag></p>
                <p><span>{{item.office_name}}</span> <span>{{item.address}}</span></p>
                <p class="lab">擅长:  <span>{{item.direction}}</span></p>
                <van-cell title="5.00" icon="shop-o">
                    <!-- 使用 right-icon 插槽来自定义右侧图标 -->
                    <template #icon>
                        <van-icon name="star" class="star-icon" />
                    </template>
                    <span class="Tag">月回答253</span>
                    <span class="Tag">18分钟响应</span>
                    </van-cell>
                    <p class="van-Tag">
                        <span>全国百强医院</span>
                        <span>医学博士</span>
                        <span>周好评前十</span>
                        <span>耐心细致</span>
                    </p>
                <p class="van-tag">
                    <span>图文 ¥{{item.ask_price}}</span>
                    <router-link to="/question">
                    <button>问医生</button>
                    </router-link>
                </p>
            </div>
            </a>
        </div>
    </div>
</template>
<style scoped>
    #details>>> .van-icon-arrow-left::before{
        font-size: 28px;
        color: #333029;
        font-weight: normal;
        margin-left: -10px;
    }
    #details>>>.van-nav-bar__title{
        color: #202020;
        font-size: 19px;
    }
    #details>>>.essay{
        display: block;
        height: 163px;
        padding: 0 16px 20px;
        margin-top: 20px;
        position: relative;
    }
    #details>>>.essay p{
        color: #333333;
        font-size: 22px;
        margin: 0;
    }
    #details>>>._title{
        display: flex; 
    }
     #details>>>div.van-cell{
        margin-top: 10px;
        padding: 0px;
        color: #b38c3e;
        font-size: 12px;
        display: inline-flex;
        align-items: center;
     }
     #details>>>div.tag{
        width: 100px;
     }
     #details>>>div.van-cell span{
        margin-left: -3px;
     }
     #details>>> .essay .cotent{
        margin-top: 20px;
        color: #4d4d4d;
        font-weight: 300;
        font-size: 14px;
        line-height: 22px;
        display: -webkit-box;
        word-break: break-all;
        overflow: hidden;
        -webkit-line-clamp: 3;
        text-overflow: ellipsis;
        -webkit-box-orient: vertical;
        white-space: normal;
     }
     #details>>>.essay::after{
        position: absolute;
        right: 16px;
        bottom: 0;
        left: 16px;
        box-sizing: border-box;
        height: 1px;
        background-color: #ebebeb;
        content: "";
        transform: scaleY(.5);
     }
     #details>>> .ADR{
         height: 59px;
         padding: 0 16px;
         padding-right: 16px;
         color: #333333;
         font-size: 17px;
         line-height: 59px;
         margin: 0;
         position: relative;
     }
     #details>>> .ADR::after{
        position: absolute;
        right: 16px;
        bottom: 0;
        left: 16px;
        box-sizing: border-box;
        height: 1px;
        background-color: #ebebeb;
        content: "";
        transform: scaleY(.5);
     }
     #details>>> .ADR span{
        font-weight: 400;
        font-size: 14px;
        line-height: 16px;
        max-width: 221px;
        color: #b3b3b3;
        position: absolute;
        left: 185px; top: 21.5px;
     }
     #details>>> .ADR img{
         display: block;
         width: 0.7em; height: 1em;
         position: absolute;
         right: 15px; top: 21.5px;
     }
     .van-tag--primary{
         display: block;
         width: 120px; height: 25px;
         text-align: center; line-height: 25px;
         background-color: #f5f5f5;
         border: .5px solid #ebebeb;
         font-size: 13px;
         margin: 20px auto;
     }
     .adr{
         color: #333;
         font-size: 22px;
         padding: 20px 16px 10px;
         margin: 0;
     }
     #details>>> .Doctors{
         height: 233PX;
         box-sizing: border-box;
         padding: 20PX 16PX;
         position: relative;
     }
     #details>>> .Doctors::after{
        position: absolute;
        right: 16px;
        bottom: 0;
        left: 16px;
        box-sizing: border-box;
        height: 1px;
        background-color: #ebebeb;
        content: "";
        transform: scaleY(.5);
     }
     #details>>> .Doctors .Photo{
         width: 54px; height: 54px;
         float: left;
     }
     #details>>> .Doctors .Photo img{width: 100%;}
     #details>>> .Text{
         width: 79%; height: 193px;
         margin: 0 0 0 15px;
         position: absolute;
         right: 0;
     }
      #details>>> .Text p{
          margin: 0;
          color: #333333;
          font-size: 17px;
      }
      #details>>> .Text p>span{
          font-size: 14px;
      }
      .van-tag--default{
          background-color: #e6c37e;
          color: #fff;
          padding: 2px 1px;
          margin-left: 8px;
      }
      #details>>> .Text .lab{
          color: #4D4D4D;
          font-size: 13px;
          margin-top: 14px;
          padding-right: 42px;
      }
      #details>>> .Text .lab span{
          margin-left: 5px;
      }
      .van-icon-star::before{
            color: #faa700;
            margin-right: 5px;
      }
      #details>>> .Doctors div.van-cell{
          color: #faa700;
          margin-top: 1px;
          font-weight: 600;
      }
      #details>>> .Doctors div.van-cell__value {
          flex: 11;
          text-align: left  ;
      }
      #details>>> .Doctors div.van-cell__value .Tag{
          color: #666;
          font-size: 12px;
          margin-left: 5px;
          font-weight: 100;
      }
      #details>>> .Doctors .Text .van-Tag{
          color: #ffaa00;
          margin-top: 5px;
      }
      #details>>> .Text .van-Tag span{
          margin-right: 15px; font-size: 12px;}
      #details>>> .Doctors .van-tag{
          margin-top: 18px;
          position: relative;
      }
      #details>>> .Doctors .van-tag>span{
          font-size: 13px;
      }
      #details>>> .Doctors .van-tag button{
          padding: 6px 12px;
          border-radius: 14px;
          font-size: 13px;
          line-height: 14px;
          border: 0;
          background-color: #f5f5f5;
          border: .5px solid #ebebeb;
          color:#00c792;
          margin-left: 162px;
      }
      #details>>> .Doctors .van-tag button:active{background-color: #C9C9C9;}
</style>
<script>
export default {
    data (){
        return {
            context:[{
                hospitalname:"",
                avatar:"1.jpg",
                nickname:""
                }]
        }
    },
    methods:{
        onClickLeft(){
            this.$router.push('/hospital')
        }
    },
    mounted() {
            window.scrollTo(0, 0)

        this.axios.get(`/details?hospital=${this.$route.query.hospital}}`).then((result)=>{
            this.context = result.data.data
            for(var i=0;i<this.context.length;i++){
                this.context[i].direction = this.context[i].direction.split('，').join('、')   
            }
             
            // console.log(result.data.data.direction.split(","))
            console.log(this.context)
        })

        // this.axios.get("/details").then((result)=>{
        //     this. = result.data.data
        //     console.log(this.)
        // })
    },
 }
</script>