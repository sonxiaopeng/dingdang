import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// 引入echarts组件库
const echarts = require('echarts')
import 'echarts/map/china'
Vue.prototype.$echarts = echarts

// 引入vantui组件库
import Vant from 'vant';
import 'vant/lib/index.less';
Vue.use(Vant);

// 引入axios模块
import axios from 'axios'
axios.defaults.baseURL = '/api'
Vue.prototype.axios=axios


// 引入moment.js.模块
import moment from 'moment';
Vue.prototype.moment = moment;

// 注册格式化时间的全局过滤器
Vue.filter('dateFormat',value=>{
    value = parseInt(value);
    return moment(value).format('YYYY年MM月DD日 HH:mm')
})

// 引入并注册全局组件
import ArticleList from '@/components/ArticleList'
import Tabbar from '@/components/Tabbar'
import QuestionList from '@/components/QuestionList'
Vue.component('article-list', ArticleList)
Vue.component('tab-bar', Tabbar)
Vue.component('question-list', QuestionList)


Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
