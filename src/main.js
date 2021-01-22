import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'



// 引入vantui组件库
import Vant from 'vant';
import 'vant/lib/index.less';
Vue.use(Vant);

//配置懒加载
import { Lazyload } from 'vant'
Vue.use(Lazyload)

// 引入axios模块
import axios from 'axios'
axios.defaults.baseURL = '/api'
Vue.prototype.axios=axios
let toast;
axios.interceptors.request.use(config=>{
    toast = Vue.prototype.$toast({
        icon: require('@/assets/images/home/loading.gif'),
        className: 'loading'
      })
    return config;
})

axios.interceptors.response.use(config=>{
    toast.clear()
    return config;
})

// 引入moment.js.模块
import moment from 'moment';
Vue.prototype.moment = moment;

// 注册格式化时间的全局过滤器
Vue.filter('dateFormat',value=>{
    value = parseInt(value);
    return moment(value).format('YYYY年MM月DD日 HH:mm')
})

// 注册格式化昵称的全局过滤器
Vue.filter('nicknameFormat',value=>{
    let firstLetter = value.slice(0, 1)
    let lastLetter = value.slice(value.length - 1)
    return firstLetter + '***' + lastLetter
})

// 注册格式化手机号的全局过滤器
Vue.filter('phoneNumberFormat',value=>{
    return value.replace(/(?<=^1[\d]{2})\d{4}/g, "****");
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
