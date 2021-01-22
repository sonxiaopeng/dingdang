import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
	state: {
		userInfo: JSON.parse(decodeURI(localStorage.getItem("userInfo"))),
		disease_id: "1", //疾病id编号,
		office_id: 0, //当前选中的科室
	},
	mutations: {
		updateUserInfo(state, payload) {
			state.userInfo = payload;
		},
		deleteUserInfo(state, payload) {
			state.userInfo = null;
		},
		// 疾病id编号
		diseaseId(state, disease_id) {
			state.disease_id = disease_id;
		},
		// 当前选中的科室
		handleOfficeId(state, office_id) {
            state.office_id = office_id;
		},
	},
	actions: {},
	modules: {},
});
