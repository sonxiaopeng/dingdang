<template>
    <div id="Question">
        <div class="top">
            <div class="plate"><img src="../assets/4.png"></div>
            <div class="plate2">
                <p>导诊医生</p>
                <p class="texts"> 请描述你的性别年龄、症状、就诊经历，我将竭诚为你治疗，并保证你的隐私安全 </p>
        </div>
        </div>
            <div class="centre">
                <van-field
                v-model="value"
                rows="2"
                autosize
                type="textarea"
                maxlength="500"
                placeholder="请详细描叙您的病情"
                show-word-limit
                />
            </div>
        <div class="upload">
            <van-uploader v-model="fileList" multiple :max-count="9" />
            <p class="upload-text">上传图片辅助说明病情</p>
            <p class="upload-text2">可上传9张</p>
        </div>
        <div class="btn-text">
            <van-button type="primary" text=" 无法上传图片？ " @click="show = true" />
        </div>
        <van-overlay :show="show" @click="show = false">
            <div class="wrapper" @click.stop>
                <div class="tit"> 请提问后通过丁香医生App上传图片 </div>
                 <div class="desc">由于第三方或浏览器版本限制，图片可能无法上传。请先提交问题。医生回复后，【下载丁香医生App在“我的问诊”内追问并上传图片】，点击下方链接进行下载（若无法下载，请复制链接到浏览器粘贴）
                    <br>
                    <router-link class="link" to="https://app.dxy.cn/aspirin/index">https://app.dxy.cn/aspirin/index</router-link>
                </div>
                <div class="btn" @click="closeBtn"> 我知道了 </div>
            </div>
        </van-overlay>
        <div class="button">
            <button @click="next">下一步</button>
        </div>
        <div class="empty"></div>
        <tab-bar active="home"></tab-bar>
    </div>
</template>
<style scoped>
    #Question>>>.top{
        height: 88px;
        padding: 20px 15px;
        display: flex;
        position: relative;
    }
    #Question>>>.top::before{
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
    #Question>>> .top>.plate{
        width: 44px; height: 44px;
        border-radius: 50%;
        flex: 1;
    }
    #Question>>> .top>.plate2{
        flex: 7;
    }
    #Question>>>.top>div>img{width: 100%;}
    #Question>>>.top p{
        margin: 0;
        margin-left: 15px;
        font-size: 15px;
    }
    #Question>>>.top .texts{
        height: 44px;
        background-color: #f4f4f4;
        padding: 10px 6px;
        margin-top: 8px;
        color: #666;
        font-size: 15px;
    }
    #Question>>>.top .texts::before{
        position: absolute;
        left: 68px; top: 58px;
        content: "";
        display: block;
        width: 12px; height: 10px;
        border-radius: 50%;
        background-color: #f4f4f4;
    }
    #Question>>>.centre{
        display: block;
        height: 168px;
        padding: 14px 0 14px 15px;
        border: 0; outline: 0;
        position: relative;
    }
    #Question>>>.centre::before{
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
    #Question>>>.centre .van-field__control{
        height: 140px !important;
    }
    .van-cell{
        padding: 0;
    }
    #Question>>>.van-field__word-limit{
        position: relative;
        left: -30px;
        line-height: 35px;
        color:  #cccccc;
    }
    #Question>>>.upload{
         height: 88px;
         padding: 15px;
         position: relative;
     }
     #Question>>>.upload .upload-text{
        margin: 0;
        color: #999;
        font-size: 12px;
        position: absolute;
        left: 115px; top: 35px;
     }
    #Question>>>.upload .upload-text2{
        margin: 0;
        color: #999;
        font-size: 12px;
        position: absolute;
        left: 115px; top: 55px;
    }
    #Question>>>.wrapper{
        position: fixed;
        top: 50%;
        left: 50%;
        z-index: 112;
        width: 86%;
        max-width: 300px;
        overflow: hidden;
        text-align: center;
        background-color: #fff;
        border-radius: 6px;
        -webkit-transform: translate(-50%,-50%);
        -ms-transform: translate(-50%,-50%);
        transform: translate(-50%,-50%);
    }
     #Question>>>.wrapper .tit{
        height: 24px;
        font-weight: 400;
        font-size: 16px;
        padding-top: 10px;
     }
     #Question>>>.wrapper .desc{
        height: 126px;
        padding: 15px 4%;
        color: #666;
        font-size: 14px;
        word-wrap: break-word;
        word-break: break-all;
        position: relative;
     }
     #Question>>>.wrapper .desc::before{
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
      #Question>>>.wrapper .desc .link{
          color: #1a9f8c;
      }
     #Question>>>.wrapper .btn{
        display:block;
        height: 50px;
        line-height: 50px;
        -webkit-box-flex: 1;
        -webkit-flex: 1;
        -ms-flex: 1;
        flex: 1;
        font-size: 16px;
        color: #1a9f8c;
     }
     #Question>>>.van-button::before{
        background-color: white;
     }
     #Question>>>.van-button--primary{
        background-color: white;
        color: #00c792;
        font-size: 12px;
        border: 0; 
     }
     #Question>>>.btn-text{
         margin-top: -15px;
     }
     #Question>>>.button{
        height: 56px;
        padding: 20px 15px;
        background: #F4F4F4;
     }
      #Question>>>.button button{
          width: 100%; height: 46px;
          border-radius: 23px;
          border: 0; outline: 0;
          background-color: #00C792;
          color: white;
      }
       #Question>>>.empty{
           height: 50px;
           background: #F4F4F4;
       }
</style>
<script>
export default {
  data() {
    return {
      fileList: [],
       show: false,
       value:''
    };
  },
  methods: {
      closeBtn(){
          this.show=false
      },
       next(){
           if(this.value.length<10){
               this.$toast('请至少用10个字以上的内容描叙症状');
           }else{
            //    跳转到下一个页面
            }
      }
  },
}
</script>