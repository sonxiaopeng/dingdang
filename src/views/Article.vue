<template>
  <div>
    <!-- 导航头部开始 -->
    <van-nav-bar
      title="科普文章"
      left-arrow
      left-text="返回"
      @click-left="onClickLeft"
      placeholder
      fixed
    />
    <!-- 导航头部结束 -->
    <!-- 文章盒子开始 -->
    <div class="article" v-html="articleDetails"></div>
    <!-- 文章盒子结束 -->
  </div>
</template>
<style scoped>
  .article>>>img{
    width: 100%;
    height: 250px;
    border-radius: 5px;
  }
  .article{
    padding: 0 15px;
    text-align: left;
  }
</style>
<script>
export default {
  data() {
    return {
      articleDetails:""
    }
  },
  mounted() {
    // 获取路由传递的参数发送请求获取对应文章id的数据请求地址 
    let val=this.$route.params.id
    this.axios.get('/articleData',{
      params:{
        id:val
      }
    }).then(result=>{
      this.articleDetails=result.data.data
      this.articleDetails=this.articleDetails[0].content
    })
  },
  methods: {
    onClickLeft(){
      this.$router.back(-1)
    }
  },
}
</script>