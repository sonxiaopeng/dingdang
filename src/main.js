import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'


// 引入vantui组件库
import Vant from 'vant';
import 'vant/lib/index.less';
Vue.use(Vant);





import ArticleList from '@/components/ArticleList'
import Tabbar from '@/components/Tabbar'
Vue.component('article-list', ArticleList)
Vue.component('tab-bar', Tabbar)


Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
