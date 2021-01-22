<template>
  <div>
    <!-- 页头科室详情开始 -->
    <div class="box">
      <van-row type="flex" justify="space-between">
        <van-col
          span="7"
          v-for="(p, i) of officeItem"
          :key="i"
          :class="{ tab: true, change: officeItemColor == i }"
          @click="LinkTo(p.office_id, i)"
        >
          {{ p.office_name }}
        </van-col>
          <van-col span="7" class="tab">
            <router-link to="/sectionlist">全部科室</router-link>
          </van-col>
      </van-row>
    </div>
    <!-- 页头科室详情结束 -->
    <!-- 下拉菜单开始 -->
    <van-dropdown-menu active-color="#00c792">
      <!-- 第一栏下拉菜单开始 -->
      <van-dropdown-item
        v-model="value1"
        :options="option1"
        title="综合排序"
        @closed="closed"
      />
      <!-- 第一栏下拉菜单结束 -->
      <!-- 第二栏下拉菜单开始 -->

      <!-- 第二栏下拉菜单结束 -->
      <!-- 第三栏下拉菜单开始 -->
      <van-dropdown-item title="筛选" ref="close">
        <div class="check_box_up">
          <!-- 价格区间标题开始 -->
          <div class="title">价格区间</div>
          <!-- 价格区间标题结束 -->
          <!-- 价格从低到高开始 -->
          <ul class="bar">
            <li
              class="price"
              v-for="(p, i) of priceBox"
              :key="i"
              :class="{ change: i == priceChecked }"
              @click="PriceColorChange(p.minprice, p.maxprice, i)"
            >
              {{ p.minprice }}-{{ p.maxprice }}
            </li>
          </ul>
          <!-- 价格从低到高结束 -->
        </div>
        <div class="check_box_up">
          <!-- 医生职称标题开始 -->
          <div class="title">医生职称</div>
          <ul class="bar">
            <li
              class="price"
              v-for="(p, i) of jobBox"
              :key="i"
              :class="{ change: i == jobChecked }"
              @click="JobColorChange(p.name, i)"
            >
              {{ p.name }}
            </li>
          </ul>
          <!-- 医生职称标题结束 -->
        </div>
        <van-button plain block :hairline="true" @click="clearBoth">
          清空所有条件
        </van-button>
        <van-button color="#00C792" block @click="close(false)">
          确认搜索
        </van-button>
      </van-dropdown-item>
      <!-- 第三栏下拉菜单结束 -->
    </van-dropdown-menu>
    <!-- 下拉菜单结束 -->
    <!-- 下划线开始 -->
    <van-divider
      :style="{ color: '#000', borderColor: '#868181', padding: '0 16px' }"
    >
      {{ title }}
    </van-divider>
    <!-- 下划线结束 -->
    <!-- 医生名片盒子开始 -->
    <div class="doctor_box" v-for="(p, i) of doctoritem" :key="i">
      <!-- 左边图片开始 -->
      <van-image
        width="44"
        height="44"
        lazy-load
        round
        fit="cover"
        :src="p.avatar"
      >
        <template v-slot:loading>
          <van-loading type="spinner" size="20" vertical color="#ccc"
            ></van-loading
          >
        </template>
        <template v-slot:error>加载失败</template>
      </van-image>
      <!-- 左边图片结束 -->
      <!-- 右边详情开始 -->
      <div class="right">
        <div class="item_one">
          <div class="font_16">{{ p.nickname }}</div>
          <van-tag type="warning" class="baritem">{{ p.level }}</van-tag>
          <van-tag type="warning" class="baritem">{{
            p.hospitallevel
          }}</van-tag>
        </div>
        <div class="item_two">
          <span>{{ p.office_name }}</span>
          <span>{{ p.hospitalname }}</span>
        </div>
        <div class="item_three">
          <span>擅长:{{ p.direction }}</span>
        </div>
        <div class="item_fourth">
          <van-icon name="star" color="#FFA91F" />
          <span>5.00</span>
          <span>{{ p.answer }}个回答</span>
        </div>
        <div class="item_five">
          <van-tag plain round color="#00ad7f" class="tabbar"
            >从业十年以上</van-tag
          >
          <van-tag plain round color="#00ad7f" class="tabbar">快速响应</van-tag>
          <van-tag plain round color="#00ad7f" class="tabbar"
            >专业性优秀</van-tag
          >
        </div>
        <div class="item_six">
          <span>图文￥{{ p.ask_price }}</span>
          <van-button round plain size="mini" type="primary">问医生</van-button>
        </div>
      </div>
      <!-- 右边详情结束 -->
    </div>
    <!-- 医生名片盒子结束 -->
  </div>
</template>     
<style scoped>
.box {
  height: 100px;
  padding: 15px;
  box-sizing: border-box;
}
.tab {
  color: #333;
  font-weight: 500;
  font-size: 15px;
  line-height: 30px;
  text-align: center;
  height: 30px;
  background-color: #fafafa;
  border-radius: 4px;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  display: -webkit-box;
}
.tab>>>a{
  color: #333;
  padding: 6px 20px;
}
.check_box_up {
  box-sizing: border-box;
  padding: 10px 30px 0px;
  text-align: left;
}
.title {
  font-size: 14px;
  color: #000000;
  padding: 0 0 20px 8px;
}
.bar {
  display: flex;
  flex-flow: row wrap;
  justify-content: start;
  align-items: center;
}
.price {
  height: 21px;
  font-size: 14px;
  line-height: 21px;
  color: #666666;
  padding: 2px 13px;
  background-color: #f4f4f4;
  border-radius: 4px;
  margin: 0 10px 10px 0;
}
.change {
  color: #fff;
  background-color: #00c792;
}
.doctor_box {
  width: 375px;
  height: 184px;
  padding: 14px 15px;
  box-sizing: border-box;
  display: flex;
  text-align: left;
  justify-content: space-between;
}
.right {
  width: 289px;
  height: 156px;
  box-sizing: border-box;
}
.item_one {
  display: flex;
  align-items: flex-end;
}
.item_one > div {
  margin: 0;
  font-size: 19px;
  line-height: 1.15;
}
.font_16 {
  font-size: 16px;
  color: #333;
  font-weight: bolder;
  padding-right: 20px;
  float: left;
}
.tabbar {
  margin: 10px 8px 0 0;
  padding: 1px 6px;
}
.baritem {
  height: 16px;
  margin-right: 5px;
}
.item_two > span {
  font-size: 13px;
  color: #666666;
  padding-right: 5px;
  line-height: 25px;
  white-space: nowrap;
  word-break: break-all;
}
.item_three > span {
  font-size: 13px;
  color: #999999;
  line-height: 25px;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  display: -webkit-box;
}
.item_fourth > span {
  font-size: 12px;
  color: #666666;
  line-height: 15px;
  vertical-align: middle;
  margin-right: 20px;
}
.item_six {
  margin-top: 16px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.item_six > span {
  font-size: 15px;
  color: #6f7580;
}
</style>
<script>
export default {
  data() {
    return {
      value1: 0,
      option1: [
        { text: "综合排序", value: "doctor_id" },
        { text: "回答次数", value: "answer" },
        { text: "价格从低到高", value: "ask_price_ASC" },
        { text: "价格从高到低", value: "ask_price" },
      ],
      priceChecked: -1,
      jobChecked: -1,
      priceBox: [
        { minprice: 10, maxprice: 19 },
        { minprice: 20, maxprice: 29 },
        { minprice: 30, maxprice: 50 },
        { minprice: 50, maxprice: 199 },
      ],
      jobBox: [{ name: "医师" }, { name: "主治医师" }, { name: "副主任医师" }],
      params: { minprice: "", maxprice: "", name: "" },
      // 所有医生
      doctoritem: [],
      // 所有科室
      officeAll: [],
      // 页面头盒子中的5个科室
      officeItem: [],
      officeItemColor: -1,
      //科室标题下划线中动态生成
      title: "",
    };
  },
  methods: {
    // 添加选中颜色,获取选项的值
    PriceColorChange(min, max, i) {
      this.params.minprice = min;
      this.params.maxprice = max;
      this.priceChecked = i;
    },
    // 添加选中颜色,获取选项的值
    JobColorChange(name, i) {
      this.params.name = name;
      this.jobChecked = i;
    },
    //清除筛选所有选项以及颜色
    clearBoth() {
      this.params = { minprice: "", maxprice: "", name: "" };
      this.jobChecked = -1;
      this.priceChecked = -1;
    },
    //关闭下拉框之后发送请求
    close(bool) {
      let officeID = this.$route.params.id;
      let min = this.params.minprice;
      let max = this.params.maxprice;
      let name = this.params.name;
      //1.关闭下拉框
      this.$refs.close.toggle(bool);
      //2.发送请求
      if (min == "" && name == "") {
        this.$toast.setDefaultOptions({ duration: 500 });
        this.$toast("至少选择一个筛选条件");
        return;
      } else if (min == "" && name !== "") {
        this.axios
          .post("/doctoritem", `officeID=${officeID}&name=${name}`)
          .then((result) => {
            this.doctoritem = result.data.data;
            this.doctoritem.forEach((item) => {
              item.avatar = require("../assets/img/" + item.avatar);
            });
          });
      } else if (min != "" && name == "") {
        this.axios
          .post("/doctoritem", `officeID=${officeID}&min=${min}&max=${max}`)
          .then((result) => {
            this.doctoritem = result.data.data;
            this.doctoritem.forEach((item) => {
              item.avatar = require("../assets/img/" + item.avatar);
            });
          });
      } else {
        this.axios
          .post(
            "/doctoritem",
            `officeID=${officeID}&min=${min}&max=${max}&name=${name}`
          )
          .then((result) => {
            this.doctoritem = result.data.data;
            this.doctoritem.forEach((item) => {
              item.avatar = require("../assets/img/" + item.avatar);
            });
          });
      }
    },
    //综合排序下拉框关闭后执行的事件
    closed() {
      let officeID = this.$route.params.id;
      this.axios
        .post("/doctoritemDESC", `value=${this.value1}&officeID=${officeID}`)
        .then((result) => {
          this.doctoritem = result.data.data;
          this.doctoritem.forEach((item) => {
            item.avatar = require("../assets/img/" + item.avatar);
          });
          this.title = this.doctoritem[0].office_name;
        });
    },
    // 点击页头科室，根据id请求关联医生信息展示，并将点击的科室随机替换
    LinkTo(officeId, i) {
      // 1.随机在所有科室中生成一个科室下标
      let office = Math.floor(Math.random() * this.officeAll.length);
      let newOffice = this.officeAll[office];
      //根据传递索引删除五个科室数组中的对应科室并替换
      this.officeItem.splice(i, 1, newOffice);
      //渲染颜色
      this.officeItemColor = i;
      //发送请求相关科室关联的医生
      this.axios
        .post("/officeItem", `officeItem=${officeId}`)
        .then((result) => {
          this.doctoritem = result.data.data;
          this.doctoritem.forEach((item) => {
            item.avatar = require("../assets/img/" + item.avatar);
          });
          this.title = this.doctoritem[0].office_name;
        });
    },
  },
  mounted() {
    // 挂载后请求所有相关科室医生信息,调用closed函数 后台传参value=0
    this.closed();
    //请求所有科室信息
    this.axios.get("/officeAll").then((result) => {
      this.officeAll = result.data.data;
      this.officeItem = this.officeAll.slice(0, 5);
    });
  },
};
</script>