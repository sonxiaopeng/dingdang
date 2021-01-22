<template>
  <div id="hosp">
    <van-nav-bar title="查医院" left-arrow></van-nav-bar>
    <div class="searchbox">
      <van-search class="search" v-model="value" placeholder="搜素医院">
        <template #left-icon>
          <van-icon :name="require('../assets/01.png')"></van-icon>
        </template>
      </van-search>
    </div>
    <router-link to="/Addressbar">
      <div id="location">
        <van-cell :title="city">
          <template #icon>
            <van-icon name="location" class="location-icon" color="#00C792" />
          </template>
        </van-cell>
      </div>
    </router-link>
    <router-link
      v-for="(item, index) of tables"
      :key="index"
      :to="`/details?hospital=${item.hospital_id}`"
    >
      <div id="table">
        <div class="file">
          <p class="title">{{ item.hospitalname }}</p>
          <p class="article">{{ item.address }}</p>
        </div>
        <p class="category">{{ item.hospitallevel }}</p>
      </div>
    </router-link>
  </div>
</template>
<style scoped>
#hosp >>> .searchbox {
  height: 36px;
  padding: 10px 16px;
  color: #000000;
  background-color: #ffffff;
}
#hosp >>> .search {
  height: 36px;
  padding: 7px 14px;
  /* margin: 0 auto; */
  border: 1px solid grey;
  border-radius: 16px;
}
#hosp >>> .van-nav-bar__title {
  font-size: 19px;
}
#hosp >>> .van-nav-bar__left i.van-icon::before {
  font-size: 28px;
  color: #333029;
  font-weight: normal;
  margin-left: -10px;
}
#hosp >>> .search i.van-icon {
  font-size: 22px;
}
#hosp >>> .van-search__content {
  padding-left: 0;
}
#hosp >>> .van-field__left-icon {
  margin-right: 10px;
}
#hosp >>> .van-field__body {
  font-size: 15px;
  color: #333;
}
#hosp >>> .van-field__body input::-webkit-input-placeholder {
  color: #999;
  font-weight: 600;
}
#hosp >>> #location {
  height: 55px;
  padding: 0 16px;
  margin: 0 auto;
  text-align: left;
  position: relative;
}
#hosp >>> #location::after {
  position: absolute;
  right: 16px;
  bottom: 0;
  left: 16px;
  box-sizing: border-box;
  height: 1px;
  background-color: #ebebeb;
  content: "";
  transform: scaleY(0.5);
}
.van-icon-location::before {
  font-size: 16px;
}
#hosp >>> #location .van-cell {
  padding: 20px 0;
  color: #00c792;
  padding: 0 0 0 2px;
  line-height: 55px;
}
#location .location-icon {
  line-height: 55px;
}
#table {
  height: 100px;
  position: relative;
  padding: 20px 16px;
  box-sizing: border-box;
}
#table::after {
  position: absolute;
  right: 16px;
  bottom: 0;
  left: 16px;
  box-sizing: border-box;
  height: 1px;
  background-color: #ebebeb;
  content: "";
  transform: scaleY(0.5);
}
#table .file {
  width: 72%;
  height: 60px;
}
#table .title {
  color: #333333;
  font-size: 17px;
  margin: 0;
}
#table .article {
  margin: 0;
  color: #999999;
  font-size: 13px;
}
#table .category {
  width: 48px;
  height: 14px;
  background-color: #ebebeb;
  color: #808080;
  font-size: 12px;
  line-height: 14px;
  margin: 0;
  float: right;
  position: absolute;
  right: 16px;
  top: 43px;
}
</style>
<script>
export default {
  data() {
    return {
      value: "",
      tables: [
        {
          title: "北京协和医院",
          wenzi: "北京市东城区帅府园1号（东院）;西城区大木仓胡同41号（西院）",
          lei: "三级甲等",
        },
      ],
      citys:[ {
              text: "全国",
            },
            {
              text: "北京",
              id: 1,
            },
            {
              text: "上海",
              id: 3,
            },
            {
              text: "广州",
              id: 213,
            },
            {
              text: "深圳",
              id: 214,
            },
            {
              text: "杭州",
              id: 99,
            },],
            city:'全国'
    };
    
  },
  mounted() {
    this.citys.forEach(element => {
        if(element.id == this.$route.query.city_id){
            this.city = element.text 
            return
        }
    });
    if (this.$route.query.city_id == 'undefined' || !this.$route.query.city_id) {
      this.axios.get("/hospital").then((result) => {
        this.tables = result.data.data;
      });
    }else{
      this.axios.get(`/hospital?id=${this.$route.query.city_id}`).then((result) => {
        this.tables = result.data.data;
      });       
    }
  },
  methods: {},
};
</script>