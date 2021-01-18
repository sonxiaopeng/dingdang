import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import emgCall from './emgCall/emgCall'
import mine from './mine/mine'
import epidemic from './epidemic/epidemic'

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
    path: "/login",
    name: "Login",
    component: () =>
        import(/* webpackChunkName: "login" */ "@/views/Login"),
},
  {
    path: "/register",
    name: "Register",
    component: () =>
        import(/* webpackChunkName: "register" */ "@/views/Register"),
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
