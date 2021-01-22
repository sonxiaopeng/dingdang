import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import emgCall from './emgCall/emgCall'
import mine from './mine/mine'
import epidemic from './epidemic/epidemic'
import Jkbk from '../views/Jkbk.vue'
import Jk from '../views/Jk.vue'
import Article from '../views/Article.vue'
import RelatedDiseases from '../views/RelatedDiseases.vue'
import Head from '../views/Head.vue'
import OfficeDepartment from '../views/OfficeDepartment.vue'
import Consult from '../views/Consult.vue'
import ConsultDetails from '../views/ConsultDetails.vue'


const originalPush = VueRouter.prototype.push
   VueRouter.prototype.push = function push(location) {
   return originalPush.call(this, location).catch(err => err)
}

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  
  {
    path: "/wiki",
    name: "wiki",
    component: () =>
        import(/* webpackChunkName: "wiki" */ "@/views/Wiki"),
},
  {
    path: "/ask",
    name: "Ask",
    component: () =>
        import(/* webpackChunkName: "ask" */ "@/views/Ask"),
},
  {
    path: "/mine",
    name: "Mine",
    component: () =>
        import(/* webpackChunkName: "mine" */ "@/views/Mine"),
},
  {
    path: "/search",
    name: "Search",
    component: () =>
        import(/* webpackChunkName: "search" */ "@/views/Search"),
},
{
    path: '/relatedDiseases/:id',
    name: 'RelatedDiseases',
    component: RelatedDiseases,
    props:true
  },
  {
    path: '/article/:id',
    name: 'Article',
    component: Article,
    props:true
  },
  {
    path: '/jkbk',
    name: 'Jkbk',
    component: Jkbk
  },
  {
    path: '/jk/:id',
    name: 'Jk',
    component: Jk,
    props:true
  },
  {
    path: '/officeDepartment',
    name: 'OfficeDepartment',
    component: OfficeDepartment,
  },
  {
    path: '/head/:id',
    name: 'Head',
    component: Head,
    props:true
  },
  {
    path: '/consultDetails/:id',
    name: 'ConsultDetails',
    component: ConsultDetails,
    props:true
  },

  {
    path: '/consult',
    name: 'Consult',
    component: Consult
  },
  ...emgCall,
  ...mine,
  ...epidemic
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
