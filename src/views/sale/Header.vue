<template>
  <div id="sale">
      <my-navbar title="特惠义诊"></my-navbar>
    <div class="album__banner">
      <!-- <van-cell @click="showPopup">展示弹出层</van-cell>
      <van-popup v-model="show">内容</van-popup> -->
      <div class="album__banner-icon">
        <div class="instruction-text">
          本周可问义诊 5次
          <!-- <van-icon name="arrow" /> -->
        </div>
      </div>
    </div>
    <div style="position: sticky; top: 0px; z-index: 1400; display: flex">
      <div class="section-scroll-contain">
        <van-tabs
          style="width: 90%"
          color="#00c792"
          title-active-color="#00c792"
          @click="handle"
          v-model="active"
        >
          <van-tab
            v-for="(item, index) of officeName"
            :title="item.office_name"
            :key="index"
          >
          </van-tab>
        </van-tabs>
        <div class="page">
          <!-- 弹出层 -->
          <van-cell @click="showPopup">
            <div class="section-expand">
              <img src="@/assets/images/042.png" />
            </div>
          </van-cell>
          <van-popup
            v-model="show"
            closeable
            click-close-icon
            
            style="width: 100%; height: 100%"
          >
            <div class="section-select-container">选择科室</div>
            <div class="section-container">
              <div v-for="(item, index) of officeName" class="section-item" :key="index">
                <div
                  class="expand-selected"
                  @click="showClick(item.office_id)"
                  :class="{ hide: active == item.office_id - 1 }"
                >
                  {{ item.office_name }}
                </div>
              </div>
            </div>
          </van-popup>
        </div>
      </div>
    </div>

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
      <van-dropdown-item title="地区" ref="closeitem">
        <van-tree-select
          :items="items"
          :active-id.sync="activeIds"
          :main-active-index.sync="activeIndex"
          height="350"
          selected-icon="revoke"
          @click-item="clickItem"
        />
      </van-dropdown-item>
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

    <!-- 医生信息 -->
    <router-link :to="`/question/doctor/${item.doctor_id}`" v-for="(item, index) of doctorCart" :key="index">
      <div class="doctor-card">
        <div class="doctor-card-container">
          <div class="doctor-card-container-left">
            <div class="doctor-card-avatar">
              <img :src="item.avatar" />
            </div>
          </div>
          <div class="doctor-card-container-right">
            <div class="doctor-card-name-container">
              <div class="doctor-card-name">{{ item.nickname }}</div>
              <div class="doctor-card-job">{{ item.level }}</div>
              <div class="dxd-tag gold1 mini" style="margin-left: 10px">
                三甲
              </div>
            </div>
            <div class="doctor-card-hospital-container">
              <div class="doctor-card-section">{{ item.level }}</div>
              <div class="doctor-card-hospital">{{ item.hospitalname }}</div>
            </div>
            <div class="doctor-card-skill-container">
              <div class="doctor-card-skill">擅长：{{ item.direction }}</div>
            </div>
            <div class="doctor-card-star-container">
              <img class="doctor-card-star" src="@/assets/images/xx.png" />
              <span class="doctor-card-star-point">{{item.star}}</span>
              <span class="doctor-card-star-count"
                >月回答{{ item.answer }}</span
              >
            </div>
            <div class="volunteer-doctor-price-container">
              <div class="volunteer-doctor-price-normal">图文 ￥{{item.ask_price}}</div>
              <div class="volunteer-doctor-price-origin">
                ￥{{ item.ask_price * 2 }}
              </div>
              <div class="volunteer-doctor-price-tag-group">
                <div class="volunteer-doctor-price-tag-discount">5折</div>
                <div class="volunteer-doctor-price-tag-limit">仅剩7个名额</div>
              </div>
            </div>
            <div class="volunteer-doctor-newprice-container">
              <div class="volunteer-doctor-newprice-tag">新</div>
              <div class="volunteer-doctor-newprice-desc">
                新人专享，折后仅需 2 元
              </div>
            </div>
          </div>
        </div>
      </div>
    </router-link>
  </div>
</template>
<script>
export default {
  data() {
    return {
      active: 0,
      doctorCart: [],
      officeName: [],
      show: false,
      officeID: 0,
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
      activeIds: 1,
      activeIndex: 0,
      item: {
        // 导航名称
        text: "热门城市",
        children: [],
      },
      items: [],
    };
  },
  methods: {
    showClick(office_id) {
      this.show = false;
      this.active = office_id - 1;
      this.handle(office_id)
    },
    showPopup() {
      this.show = true;
    },
    // 添加选中颜色,获取选项的值
    PriceColorChange(min, max, i) {
      if (i != this.priceChecked) {
        this.params.minprice = min;
        this.params.maxprice = max;
        this.priceChecked = i;
      } else {
        this.params.minprice = "";
        this.params.maxprice = "";
        this.priceChecked = -1;
      }
    },
    // 添加选中颜色,获取选项的值
    JobColorChange(name, i) {
      if (i != this.jobChecked) {
        this.params.name = name;
        this.jobChecked = i;
      } else {
        this.params.name = "";
        this.jobChecked = -1;
      }
    },
    //清除筛选所有选项以及颜色
    clearBoth() {
      this.params = { minprice: "", maxprice: "", name: "" };
      this.jobChecked = -1;
      this.priceChecked = -1;
    },
    //关闭下拉框之后发送请求
    close(bool) {
      let officeID = this.officeID;
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
            this.doctorCart = result.data.data;
            this.doctorCart.forEach((item) => {
              item.avatar = require("@/assets/img/" + item.avatar);
            });
          });
      } else if (min != "" && name == "") {
        this.axios
          .post("/doctoritem", `officeID=${officeID}&min=${min}&max=${max}`)
          .then((result) => {
            this.doctorCart = result.data.data;
            this.doctorCart.forEach((item) => {
              item.avatar = require("@/assets/img/" + item.avatar);
            });
          });
      } else {
        this.axios
          .post(
            "/doctoritem",
            `officeID=${officeID}&min=${min}&max=${max}&name=${name}`
          )
          .then((result) => {
            this.doctorCart = result.data.data;
            this.doctorCart.forEach((item) => {
              item.avatar = require("@/assets/img/" + item.avatar);
            });
          });
      }
    },
    //综合排序下拉框关闭后执行的事件
    closed() {
      let officeID = this.officeID;
      this.axios
        .post("/doctoritemDESC", `value=${this.value1}&officeID=${officeID}`)
        .then((result) => {
          this.doctorCart = result.data.data;
          this.doctorCart.forEach((item) => {
            item.avatar = require("@/assets/img/" + item.avatar);
          });
        });
    },
    //点击全国地区筛选之后触发
    clickItem(data) {
      let officeID = this.officeID;
      //获取回调参数中的唯一城市id
      let cityId = data.id;
      //关闭下拉菜单
      this.$refs.closeitem.toggle(false);
      // 发送请求 获取对应科室 所选取城市的所有医生
      this.axios
        .post("/cityclick", `officeID=${officeID}&cityId=${cityId}`)
        .then((result) => {
          this.doctorCart = result.data.data;
          this.doctorCart.forEach((item) => {
            item.avatar = require("@/assets/img/" + item.avatar);
          });
        });
    },
    handle(office_id = 0) {
      // 获取医生信息
      let url = `/doctor?office_id=${office_id + 1}`;
      this.axios.get(url).then((res) => {
        this.doctorCart = res.data;
        // 医生头像遍历
        this.doctorCart.forEach((item) => {
          item.avatar = require("@/assets/img/" + item.avatar);
        });
        this.officeID = this.doctorCart[0].office_id;
      });
    },
  },
  mounted() {
    this.axios.get("/addressbar").then((result) => {
      let total = [];
      let provinces = result.data.data[1];
      let citys = result.data.data[0];
      provinces.forEach((province) => {
        //对城市的请求返回结果进行过滤
        let tempCity = citys.filter((city) => {
          return province.province_id == city.province_id;
        });
        //如果返回结果一个省份仅对应一个城市,则当前城市是直辖市
        if (tempCity.length == 1) {
          tempCity = tempCity.map((c) => {
            return { text: c.cityname, id: c.city_id };
          });
          this.item.children.push(tempCity[0]);
          return;
        }
        //如果数组返回多个结果,则更改对应省份下的城市格式
        tempCity = tempCity.map((c) => {
          return { text: c.cityname, id: c.city_id };
        });
        //将当前省份和所对应的城市修改为分类选择组件所需要的格式并循环追加
        total.push({ text: province.province_name, children: tempCity });
      });
      total.unshift(this.item);
      this.items = total;
    });
    // 获取科室
    this.axios.get("/office").then((res) => {
      this.officeName = res.data;
    });
    this.handle();
    //获取医院的表
    this.axios.get("/sale/hospital").then((res) => {
      this.doctorCart = res.data;
      // 医生头像遍历
      this.doctorCart.forEach((item) => {
        item.avatar = require("@/assets/img/" + item.avatar);
      });
    });
  },
};
</script>
<style scoped>

#sale >>> .van-overlay{
    background-color: #fff;
}
#sale >>> .van-tree-select__item--active {
  color: #00c792;
}
#sale >>> .van-sidebar-item--select::before {
  background-color: #00c792;
}
#sale >>> .check_box_up {
  box-sizing: border-box;
  padding: 10px 30px 0px;
  text-align: left;
}
#sale >>> .title {
  font-size: 14px;
  color: #000000;
  padding: 0 0 20px 8px;
}
#sale >>> .bar {
  display: flex;
  flex-flow: row wrap;
  justify-content: flex-start;
  align-items: center;
}
#sale >>> .price {
  height: 21px;
  font-size: 14px;
  line-height: 21px;
  color: #666666;
  padding: 2px 13px;
  background-color: #f4f4f4;
  border-radius: 4px;
  margin: 0 10px 10px 0;
}
#sale >>> .change {
  color: #fff;
  background-color: #00c792;
}
#sale >>> .album__banner {
  height: 150px;
  background: url(../../assets/img/b1.png) no-repeat 50%;
  background-size: 100%;
}
#sale >>> .album__banner-icon {
  position: absolute;
  top: 10px;
  right: 10px;
  align-items: center;
  padding: 7px 9px;
  color: #fff;
  font-size: 12px;
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 25px;
}
#sale >>> .van-cell >>> .van-cell__value--alone {
  width: 22px;
}
#sale >>> .section-scroll-contain {
  width: 100%;
}
/* 弹出层 */
#sale >>> .page {
  position: absolute;
  top: 0px;
  right: 0;
  z-index: 99;
}
#sale >>> .section-expand img {
  width: 22px;
  height: 22px;
}
#sale >>> .section-select-container {
  text-align: left;
  padding-left: 16px;
  padding-top: 20px;
  font-size: 14px;
}
#sale >>> .section-container {
  font-size: 15px;
  padding: 30px 16px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
#sale >>> .section-item {
  text-align: center;
  width: 50%;
}
#sale >>> .expand-selected {
  color: #949494;
  padding: 18px;
}

#sale >>> .hide {
  background-color: #e5f9f4;
  font-weight: 400;
  color: #00c792;
}
/* 医生信息 */
#sale >>> .doctor-card {
  box-sizing: border-box;
  padding: 20px 16px;
  background-color: #fff;
}
#sale >>> .doctor-card-container {
  display: flex;
}
#sale >>> .doctor-card-container .doctor-card-container-left {
  flex: 0 0 56px;
}
#sale >>> .doctor-card-container .doctor-card-avatar {
  width: 56px;
  height: 56px;
  border-radius: 4px;
}
#sale >>> .doctor-card-container .doctor-card-avatar img {
  width: 100%;
  object-fit: cover;
}

#sale >>> .doctor-card-container .doctor-card-container-right {
  flex: 1 0;
  margin-left: 14px;
}
#sale >>> .doctor-card-container .doctor-card-name-container {
  display: flex;
  align-items: center;
}
#sale >>> .doctor-card-container .doctor-card-name {
  height: 19px;
  color: #333;
  font-weight: 500;
  font-size: 16px;
  line-height: 19px;
}
#sale >>> .doctor-card-container .doctor-card-job {
  height: 16px;
  margin-left: 6px;
  color: #333;
  font-size: 14px;
  line-height: 16px;
}
#sale >>> .doctor-card-container .dxd-tag {
  height: 14px;
  padding: 2px;
  font-size: 12px;
  line-height: 14px;
  border-radius: 2px;
  color: #fff;
  background-color: #e6c37e;
}
#sale >>> .doctor-card-container .doctor-card-hospital-container {
  display: flex;
  align-items: center;
  margin-top: 6px;
}
#sale >>> .doctor-card-container .doctor-card-section {
  flex-shrink: 0;
  height: 16px;
  color: #333;
  font-size: 14px;
  line-height: 16px;
}
#sale >>> .doctor-card-container .doctor-card-hospital {
  height: 16px;
  margin-left: 6px;
  color: #333;
  font-size: 14px;
  overflow: hidden;
}
#sale >>> .doctor-card-container .doctor-card-skill-container {
  display: flex;
  flex: 1;
  height: 14px;
  margin-top: 14px;
  color: #666;
  font-weight: 300;
  font-size: 10px;
  line-height: 14px;
}
#sale >>> .doctor-card-container .doctor-card-skill {
  text-align: left;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}
#sale >>> .doctor-card-container .doctor-card-star-container {
  display: flex;
  align-items: center;
  margin-top: 6px;
}
#sale >>> .doctor-card-container .doctor-card-star {
  position: relative;
  top: -1px;
  display: block;
  width: 9px;
  height: 9px;
}
#sale >>> .doctor-card-container .doctor-card-star-point {
  height: 14px;
  margin-left: 2px;
  color: #faa700;
  font-weight: 600;
  font-size: 10px;
  line-height: 14px;
}
#sale >>> .doctor-card-container .doctor-card-star-count {
  height: 14px;
  margin-left: 10px;
  color: #666;
  font-weight: 300;
  font-size: 10px;
  line-height: 14px;
}
#sale >>> .doctor-card-container .volunteer-doctor-price-container {
  display: flex;
  align-items: center;
  margin-top: 20px;
}
#sale >>> .doctor-card-container .volunteer-doctor-price-normal {
  height: 15px;
  color: #666;
  font-weight: 500;
  font-size: 12px;
  line-height: 15px;
}
#sale >>> .doctor-card-container .volunteer-doctor-price-origin {
  height: 14px;
  margin-left: 2px;
  color: #999;
  font-weight: 300;
  font-size: 12px;
  line-height: 14px;
  text-decoration: line-through;
}
#sale >>> .doctor-card-container .volunteer-doctor-price-tag-group {
  display: flex;
  align-items: center;
  margin-left: 10px;
  border-radius: 2px;
  position: relative;
}
#sale >>> .doctor-card-container .volunteer-doctor-price-tag-discount {
  height: 14px;
  padding: 0 2px;
  color: #fff;
  font-size: 10px;
  line-height: 14px;
  background: #ff5b4d;
  border-radius: 2px 0 0 2px;
}
#sale >>> .doctor-card-container .volunteer-doctor-price-tag-limit {
  box-sizing: border-box;
  height: 14px;
  padding: 0 2px;
  color: #ff5b4d;
  font-size: 10px;
  line-height: 14px;
  background: #fff;
}
#sale >>> .doctor-card-container .volunteer-doctor-newprice-container {
  display: flex;
  align-items: center;
  margin-top: 6px;
}
#sale >>> .doctor-card-container .volunteer-doctor-newprice-tag {
  box-sizing: border-box;
  height: 14px;
  padding: 0 2px;
  color: #ff5b4d;
  font-size: 10px;
  line-height: 14px;
  border-radius: 2px;
  position: relative;
}
#sale >>> .doctor-card-container .volunteer-doctor-newprice-desc {
  height: 12px;
  margin-left: 4px;
  color: #999;
  font-size: 10px;
  line-height: 12px;
}
</style>