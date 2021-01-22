<template>
  <div>
    <!-- 标题导航开始 -->
    <van-nav-bar
      left-arrow
      fixed
      placeholder
      title="相关疾病"
      left-text="返回"
      @click-left="onClickLeft"
    />
    <!-- 标题导航结束 -->
    <!-- 疾病栏目开始 -->
      <div class="box"
      v-for="(p,i) of relatedDiseases"
      :key="i"
      @click="linkTO(p.disease_id)">
        <span class="span">{{p.name}}</span>
        <div class="tag-item-body">
          · 早泄诊断不能只以「时间论英雄」。<br>
          · 并不能确认手淫可以导致早泄。<br>
          · 「包皮环切」等手术治疗早泄证据不充足。<br>
        </div>
        <div class="tag-item-bottom">
          <van-tag
            color="#EBEBEB"
            text-color="#808080"
            size="medium"
            class="tag"
            >症状诊断</van-tag
          >
          <van-tag
            color="#EBEBEB"
            text-color="#808080"
            size="medium"
            class="tag"
            >症状治疗</van-tag
          >
        </div>
      </div>
    <!-- 疾病栏目接结束 -->
  </div>
</template>
<style scoped>
.box {
  width: 375px;
  height: 172px;
  box-sizing: border-box;
  padding: 20px 16px;
  text-align: left;
}
.tag-item-body {
  width: 343px;
  height: 72px;
  margin-top: 10px;
  color: #4d4d4d;
  font-weight: 300;
  font-size: 16px;
  line-height: 24px;
}
.tag-item-bottom {
  width: 343px;
  height: 31px;
}
.tag {
  margin: 11px 10px 0 0;
}
.span{
  color: #1a1a1a;
  font-weight: 400;
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
    };
  },
  methods: {
    onClickLeft() {
      this.$router.back(-1);
    },
    linkTO(id){
      this.$router.push(`/${id}`)
    }
  },
  mounted() {
    let id=this.$route.params.id
    this.axios.get('/relatedDiseases',{
      params:{id:id}
    }).then(result=>{
      this.relatedDiseases=result.data.data
    })
  },
};
</script>