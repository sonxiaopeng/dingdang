<template>
  <div>
    <!-- 导航头部开始 -->
    <my-navbar :title="barTitleName" />
    <!-- 导航头部结束 -->
    <!-- 输入框开始 -->
    <van-search
      v-model="value"
      placeholder="搜索疾病/症状/医生/药品/医院"
      shape="round"
      class="input"
      @focus="gotoSearch"
    >
      <template #left-icon>
        <van-icon :name="require('../assets/443-22.png')"></van-icon>
      </template>
    </van-search>
    <!-- 输入框结束 -->
    <div class="box">
      <!-- 相关疾病栏开始 -->
      <div class="list_title" v-if="relatedDiseases.length!=0">
        <div class="category-disease-header">
          <van-tag color="#00c792" size="medium">相关疾病</van-tag>
          <span class="span" @click="LinkTO">查看全部></span>
        </div>
        <div class="category-disease-body">
          <router-link class="a"
            v-for="(p,i) of relatedDiseases"
            :key="i"
            :to="{path:'/ConsultDetails/'+p.disease_id + '/' + p.office_id}">
            {{p.name}}
          </router-link>
        </div>
      </div>
      <!-- 相关疾病栏结束 -->
      <!-- 公开问题栏开始 -->
      <div class="category-question">
        <van-image
          width="22"
          height="22"
          :src="require('../assets/qustion.png')"
        />
        <h3 class="h3">大家都在问</h3>
        <span class="font_12">精选公开问题</span>
        <button class="btn" @click="toquestion">去看看</button>
      </div>
      <!-- 公开问题栏结束 -->
      <!-- 分割线 -->
      <van-divider
        :style="{ color: '#ccc', borderColor: '#DBDBDB', padding: '0 16px' }"
      >
        健康科普
      </van-divider>
      <!-- 分割线 -->
      <!-- 二级导航栏开始 -->
      <van-tabs
        v-model="active"
        sticky
        swipeable
        border
        :ellipsis="false"
        line-width="0"
        title-active-color="#00c792"
        offset-top="100"
        class="icon"
      >
        <!-- "全部"导航栏标题开始 -->
        <van-tab title="全部" name="bar0">
          <!-- 文章简介开始 -->
          <router-link
            :to="{ path: '/article/' + p.article_id }"
            v-for="(p, i) of articleAll"
            :key="i"
          >
            <div class="article-search">
              <div class="article-left-content">
                <div class="article-left-title">{{ p.subject }}</div>
                <div class="article-left-title_2">{{ p.description }}</div>
              </div>
              <!-- 右侧图片开始 -->
              <div class="img">
                <van-image
                  width="80"
                  height="80"
                  fit="cover"
                  lazy-load
                  show-loading
                  :src="p.img"
                >
                  <template v-slot:loading>
                    <van-loading type="spinner" size="20" vertical color="#ccc"
                      >加载中...</van-loading
                    >
                  </template>
                  <template v-slot:error>加载失败</template>
                </van-image>
              </div>
              <!-- 右侧图片结束 -->
            </div>
          </router-link>
        </van-tab>
        <!-- "全部"导航栏标题结束 -->
        <van-tab
          v-for="(p, i) of barTitle"
          :title="p.title_content"
          :name="'bar' + p.id"
          :key="i"
        >
          <!-- 文章简介开始 -->
          <router-link
            :to="{ path: '/article/' + p.article_id }"
            v-for="(p, i) of article"
            :key="i"
          >
            <div class="article-search">
              <div class="article-left-content">
                <div class="article-left-title">{{ p.subject }}</div>
                <div class="article-left-title_2">{{ p.description }}</div>
              </div>
              <!-- 右侧图片开始 -->
              <div class="img">
                <van-image
                  width="80"
                  height="80"
                  fit="cover"
                  lazy-load
                  show-loading
                  :src="p.img"
                >
                  <template v-slot:loading>
                    <van-loading type="spinner" size="20" vertical color="#ccc"
                      >加载中...</van-loading
                    >
                  </template>
                  <template v-slot:error>加载失败</template>
                </van-image>
              </div>
              <!-- 右侧图片结束 -->
            </div>
          </router-link>
          <!-- 文章简介结束 -->
        </van-tab>
      </van-tabs>
      <!-- 二级导航栏结束 -->
    </div>
  </div>
</template>
<style scoped>
.box{margin-top: 54px;}
.input {
  width: 100%;
  position: fixed;
  z-index: 1;
}
.input >>> ::-webkit-input-placeholder {
  font-weight: 700;
  font-size: 15px;
  color: rgb(131, 128, 128);
  position: relative;
  top: 3px;
  left: 20px;
}
.van-icon__image {
  width: 22px;
  height: 22px;
  position: relative;
  top: -2px;
  left: 6px;
}
.list_title {
  width: 343px;
  height: 125px;
  background-image: linear-gradient(180deg, #edfcf8, #f7fefc),
    linear-gradient(180deg, #fff, #fff);
  border-radius: 10px;
  box-shadow: 0 2px 25px 0 rgba(51, 51, 51, 0.1);
  margin: 20px auto 0;
}
.category-disease-header {
  height: 19px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 20px 14px 15px;
}
.category-disease-body {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  width: 100%;
  height: 60px;
  padding-bottom: 11px;
}
.span {
  font-size: 12px;
  color: #b3b3b3;
}
.a {
  text-align: left;
  font-size: 14px;
  color: #333333;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
  width: 33.33%;
  padding: 5px 10px 9px 22px;
  box-sizing: border-box;
}
.a::before {
  display: inline;
  content: "•";
  font-size: 15px;
  font-weight: 600;
  margin-right: 3px;
  color: #00c792;
}
.category-question {
  box-sizing: border-box;
  display: flex;
  align-items: center;
  margin: 10px 0 10px;
  padding: 20px 16px;
  position: relative;
}
.h3 {
  margin: 0 0 0 2px;
  font-size: 17px;
}
.font_12 {
  color: #4d4d4d;
  font-size: 12px;
  margin-left: 5px;
}
.btn {
  text-align: center;
  outline: 0;
  border: 0;
  font-size: 12px;
  color: #00c792;
  background: #f5f5f5;
  border-radius: 14px;
  line-height: 1;
  width: 62px;
  height: 28px;
  margin-left: 90px;
}
.article-search {
  width: 375px;
  height: 120px;
  box-sizing: border-box;
  display: flex;
  background: #fff;
  padding: 20px 16px;
  position: relative;
  text-align: left;
  overflow: hidden;
}
.article-left-content {
  width: 249px;
  height: 80px;
  box-sizing: border-box;
  overflow: hidden;
  flex: 1 1;
}
.article-left-title {
  display: -webkit-box;
  word-break: break-all;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-box-orient: vertical;
  white-space: normal;
  -webkit-line-clamp: 2;
  margin-bottom: 6px;
  line-height: 1.5;
  color: #1a1a1a;
  font-weight: 400;
  font-size: 17px;
}
.article-left-title_2 {
  display: -webkit-box;
  word-break: break-all;
  overflow: hidden;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  white-space: normal;
  text-overflow: ellipsis;
  font-size: 16px;
  font-weight: 300;
  line-height: 24px;
  color: #333;
}
.img {
  border-radius: 4px;
  overflow: hidden;
  margin-left: 14px;
  flex-shrink: 0;
}
.icon >>> .van-info {
  background: #ccc;
}
</style>
<script>
export default {
  data() {
    return {
      value: "",
      active: 1,
      barTitle: [],
      barTitleName: "",
      article: [],
      articleAll: [],
      relatedDiseases:[]
    };
  },
  methods: {
    LinkTO(){
      let id=this.$route.params.id;
      this.$router.push('/relatedDiseases/'+id)
    },
    gotoSearch() {
      this.$router.push({
        path: "/search",
        query: {
          active: 1,
        },
      });
    },
    toquestion(){
      this.$router.push("/question")
    }
  },
  mounted() {
    //拿到地址栏参数传请求后台动态获取导航栏title
    let id = this.$route.params.id;
    this.axios
      .get("/jk", {
        params: {
          id: id,
        },
      })
      .then((result) => {
        this.barTitle = result.data.data;
        this.barTitleName = this.barTitle[0].name;
      });
    //拿到地址栏参数传请求后台获取全部文章
    this.axios
      .get("/articleAll", {
        params: {
          id: id,
        },
      })
      .then((result) => {
        this.articleAll = result.data.data;
        this.articleAll.forEach((item) => {
          item.img = require("../assets/img/" + item.img);
        });
      });
    //拿到地址栏参数传请求后台获取相关疾病 /relatedDiseases get 
    this.axios.get('/relatedDiseases',{
      params:{id:id,page:1}
    }).then(result=>{
      this.relatedDiseases=result.data.data.slice(0,6)
    })
  },
  watch: {
    active(newval) {
      if (val == 0) {
        //如果点击的是全部导航标签则回到顶部
        window.scrollTo(0, 0);
      }
      // 当二级导航栏变化,则遍历所有文章数据遍历并追加到与导航id相关联的数组中
      //导航变化一次则清空上一次导航关联的文章数组
      this.article=[];
      let val = newval.slice(3);
      let articleAll=this.articleAll;
      for(var k of articleAll){
        if(k.category_title_id==val){
          this.article.push(k)
        }
      }
    },
  },
};
</script>