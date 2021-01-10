import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'


// 引入vantui组件库
import Vant from 'vant';
import 'vant/lib/index.less';
Vue.use(Vant);


import moment from 'moment';

Vue.filter('dateFormat',value=>{
    return moment(value).format('YYYY年MM月DD日 HH:mm')
})


import ArticleList from '@/components/ArticleList'
import Tabbar from '@/components/Tabbar'
import Tags from '@/components/Tags'
import QuestionList from '@/components/QuestionList'
Vue.component('article-list', ArticleList)
Vue.component('tab-bar', Tabbar)
Vue.component('tags', Tags)
Vue.component('question-list', QuestionList)


Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
