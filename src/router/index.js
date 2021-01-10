import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import emgCall from './emgcall/emgCall'
import mine from './mine/mine'

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
    name: "Wiki",
    component: () =>
        import(/* webpackChunkName: "symptom" */ "@/views/Wiki"),
},
  {
    path: "/ask",
    name: "Ask",
    component: () =>
        import(/* webpackChunkName: "symptom" */ "@/views/Ask"),
},
  {
    path: "/mine",
    name: "Mine",
    component: () =>
        import(/* webpackChunkName: "symptom" */ "@/views/Mine"),
},
  ...emgCall,
  ...mine
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
