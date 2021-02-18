<template>
  <div>
    <my-navbar title="选择科室"/>
    <!-- 常见科室开始 -->
    <div class="box_header">
      <header>常见科室</header>
      <div class="header">
        <van-row type="flex" justify="space-around">
          <van-col span="7" class="bar"
            v-for="(p,i) of itemHeader"
            :key="i"
            @click="linkTo(p.office_id)">
            <van-image
              width="40"
              height="40"
              fit="cover"
              lazy-load
              :src="p.office_img"
            >
            <template v-slot:loading>
                    <van-loading type="spinner" size="20" vertical color="#ccc"
                      ></van-loading
                    >
                  </template>
                  <template v-slot:error>加载失败</template>
                </van-image>
            <span class="font_14">{{p.office_name}}</span>
          </van-col>
        </van-row>
      </div>
    </div>
    <!-- 常见科室结束 -->
    <!-- 内科开始 -->
    <div class="box_body">
      <header>内科</header>
      <div class="body">
        <van-row type="flex" justify="space-around">
          <van-col span="7" class="bar"
            v-for="(p,i) of itembody"
            :key="i"
            @click="linkTo(p.office_id)">
            <van-image
              width="40"
              height="40"
              fit="cover"
               lazy-load
              :src="p.office_img"
            >
            <template v-slot:loading>
                    <van-loading type="spinner" size="20" vertical color="#ccc"
                      ></van-loading
                    >
                  </template>
                  <template v-slot:error>加载失败</template>
                </van-image>
            <span class="font_14">{{p.office_name}}</span>
          </van-col>
        </van-row>
      </div>
    </div>
    <!-- 内科结束 -->
    <!-- 外科开始 -->
    <div class="box_footer">
      <header>外科</header>
      <div class="footer">
        <van-row type="flex" justify="space-around">
          <van-col span="7" class="bar"
            v-for="(p,i) of itemfooter"
            :key="i"
            @click="linkTo(p.office_id)">
            <van-image
              width="40"
              height="40"
              fit="cover"
               lazy-load
              :src="p.office_img"
            >
            <template v-slot:loading>
                    <van-loading type="spinner" size="20" vertical color="#ccc"
                      ></van-loading
                    >
                  </template>
                  <template v-slot:error>加载失败</template>
                </van-image>
            <span class="font_14">{{p.office_name}}</span>
          </van-col>
        </van-row>
      </div>
    </div>
    <!-- 外科结束 -->
    <tab-bar tabbarActive="ask"></tab-bar>
  </div>
</template>
<style scoped>
  header{
    font-size: 20px;
    color: #333;
    margin-top: 20px;
  }
  .header,.body,.footer{
    box-sizing: border-box;
    margin-top: 20px;
  }
  .box_header,.box_body,.box_footer{
    padding:0 16px;
    box-sizing: border-box;
    text-align: left;
  }
  .bar{
    display: flex;
    flex-flow: column;
    align-items: center;
    padding: 20px 0;
    margin-bottom: 10px;
    background-color: #FAFAFA;
    border-radius: 20px;
  }
  .font_14{
    font-size: 14px;
    color: #333;
    padding: 6px 0;
  }
</style>
<script>
export default {
  data() {
    return {
      // 前9个科室
      itemHeader:[],
      itembody:[],
      itemfooter:[],
      officeAll:[]
    }
  },
  methods: {
    linkTo(id){
      this.$router.push(`/head/${id}`)
    }
  },
  mounted() {
    this.axios.get('/officeAll').then(res=>{
      this.officeAll=res.data.data
      this.officeAll.forEach(item=>{
        item.office_img=require("../assets/img/"+item.office_img)
      })
      this.itemHeader=this.officeAll.splice(0,9)
      this.itembody=this.officeAll.splice(0,9)
      this.itemfooter=this.officeAll.splice(0)
    })
  },
}
</script>