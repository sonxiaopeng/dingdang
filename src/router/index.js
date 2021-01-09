import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import emgCall from './emgCall/emgCall'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  ...emgCall
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
