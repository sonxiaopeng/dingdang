<template>
  <div>
    <!-- 标题导航开始 -->
    <my-navbar title="相关疾病"/>
    <!-- 标题导航结束 -->

    <van-list
      v-model="loading"
      :finished="finished"
      finished-text="没有更多了"
      @load="onLoad"
      offset="50"
    >
    <!-- 疾病栏目开始 -->
      <div class="box"
        v-for="(p,i) of relatedDiseases"
        :key="i"
        @click="linkTO(p.disease_id, p.office_id)">
        <span class="span">{{p.name}}</span>
        <div class="tag-item-bottom">
          <van-tag
            color="#ccc"
            text-color="#fff"
            size="medium"
            class="tag"
            >症状治疗</van-tag
          >
        </div>
      </div>
    <!-- 疾病栏目接结束 -->
    </van-list>
  </div>
</template>
<style scoped>
.box {
  width: 375px;
  padding: 10px 16px;
  box-sizing: border-box;
  text-align: left;
  /* border: 1px solid #ccc; */
  position: relative;
  display: flex;
  align-items: center;
  margin: 10px 0;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  border-radius: 20px;
}
.tag{margin-right: 5px;}
.tag-item-bottom {
  position: absolute;
  left: 80%;
}
.span{
  color: rgba(0, 0, 0, .6);
  font-weight: 700;
  font-size: 17px;
  line-height: 1.12;
  -webkit-line-clamp: 1;
}
</style>
<script>
export default {
  data() {
    return {
      relatedDiseases: [],
      loading: false,
      finished: false,
      page:0,
    };
  },
  methods: {
    linkTO(id, officeid){
      this.$router.push('/ConsultDetails/'+id + '/' + officeid)
    },
    onLoad(){
      this.loading=true
      let id=this.$route.params.id
      this.page++;
      // 发送请求拿分页数据
      this.axios.get('/relatedDiseases',{
        params:{id:id,page:this.page}
      })
      .then(result=>{
        result.data.data.forEach(element => {
          this.relatedDiseases.push(element)
        })
        // 数据请求完毕1秒后关闭无限加载
        setTimeout(()=>{
          this.loading=false
        },500)
        if(result.data.data.length==0){
          // 如果查询回的数据为空则不再触发滚动加载事件
          this.finished = true;
        }
      })
    }
  },
  mounted() {

  },
};
</script>