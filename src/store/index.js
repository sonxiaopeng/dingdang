import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    userInfo: JSON.parse(decodeURI(localStorage.getItem('userInfo'))),
  },
  mutations: {
    updateUserInfo(state, payload){
        state.userInfo = payload
    },
  },
  actions: {
  },
  modules: {
  }
})
