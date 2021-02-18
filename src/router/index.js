import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import emgCall from "./emgCall/emgCall";
import mine from "./mine/mine";
import epidemic from "./epidemic/epidemic";
import ask from "./ask/ask";
import Jkbk from "../views/Jkbk.vue";
import Jk from "../views/Jk.vue";
import Article from "../views/Article.vue";
import RelatedDiseases from "../views/RelatedDiseases.vue";
import Head from "../views/Head.vue";
import OfficeDepartment from "../views/OfficeDepartment.vue";
import Consult from "../views/Consult.vue";
import ConsultDetails from "../views/ConsultDetails.vue";

import Hospital from "../views/Hospital.vue";
import Addressbar from "../views/Addressbar.vue";
import Details from "../views/Details.vue";
import Subpage from "../views/Subpage.vue";

import Question from "../views/questions.vue";
import qsDetails from "../views/qsDetails.vue";
import qsDoctor from "../views/qsDoctor";
import qsMore from "../views/qsMore";

import Diolog from "../views/sale/Header.vue";
import Detail from "../views/sale/Detail.vue";

const originalPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err);
};

Vue.use(VueRouter);

const routes = [
	{
		path: "/",
		name: "Home",
		component: Home,
		// meta: { index: 0, keepAlive: true },
	},
	{
		path: "/ask",
		name: "Ask",
		component: () =>
			import(/* webpackChunkName: "ask" */ "@/views/ask/Ask"),
		meta: { index: 2 },
	},
	{
		path: "/mine",
		name: "Mine",
		component: () => import(/* webpackChunkName: "mine" */ "@/views/Mine"),
		meta: { index: 3 },
	},
	{
		path: "/search",
		name: "Search",
		component: () =>
			import(/* webpackChunkName: "search" */ "@/views/Search"),
		meta: { index: 1, keepAlive: true },
	},
	{
		path: "/hospital/hospitallocation",
		name: "HospitalLocation",
		component: () =>
			import(
				/* webpackChunkName: "hospitallocation" */ "@/views/hospital/HospitalLocation"
			),
	},
	{
		path: "/relatedDiseases/:id",
		name: "RelatedDiseases",
		component: RelatedDiseases,
		props: true,
		// meta: { index: 1, keepAlive: true },
	},
	{
		path: "/article/:id",
		name: "Article",
		component: Article,
		props: true,
	},
	{
		path: "/jkbk",
		name: "Jkbk",
		component: Jkbk,
		// meta: { index: 1, keepAlive: true },
	},
	{
		path: "/jk/:id",
		name: "Jk",
		component: Jk,
		props: true,
	},
	{
		path: "/officeDepartment",
		name: "OfficeDepartment",
        component: OfficeDepartment,
        // meta: {
            // keepAlive: true
        // }
	},
	{
		path: "/head/:id",
		name: "Head",
		component: Head,
		props: true,
		// meta: {keepAlive: true}
	},
	{
		path: "/consultDetails/:id/:officeId",
		name: "ConsultDetails",
		component: ConsultDetails,
		props: true,
	},

	{
		path: "/consult",
		name: "Consult",
		component: Consult,
		meta: { keepAlive: true },
	},

	{
		path: "/Subpage",
		name: "Subpage",
		component: Subpage,
	},
	{
		path: "/Details",
		name: "Details",
		component: Details,
	},
	{
		path: "/Addressbar",
		name: "Addressbar",
		component: Addressbar,
	},
	{
		path: "/hospital",
		name: "Hospital",
		component: Hospital,
	},
	{
		path: "/question/more/:id",
		name: "qsMore",
		component: qsMore,
	},
	{
		path: "/question/doctor/:id",
		name: "qsDoctor",
		component: qsDoctor,
	},
	{
		path: "/question/details/:id",
		name: "qsDetails",
		component: qsDetails,
	},
	{
		path: "/question",
		name: "Question",
		component: Question,
	},
	{
		path: "/diolog",
		name: "Diolog",
		component: Diolog,
	},
	{
		path: "/detail",
		name: "Detail",
		component: Detail,
	},
	...emgCall,
	...mine,
	...epidemic,
	...ask,
];

const router = new VueRouter({
	// mode: "history",
	base: process.env.BASE_URL,
	routes,
});

router.beforeEach((to, from, next) => {
	if (from.name != "Register" && to.name == "Login" ) {
        localStorage.setItem('backPage', from.fullPath)
		next();
	}else{
        next()
    }
});

export default router;

// router.beforeEach((to, from, next) => {
// 	const token = localStorage.getItem("token");
// 	if (
// 		to.matched.some(
// 			record => record.meta.requireAuth || record.meta.homePages
// 		)
// 	) {
// 		//路由元信息requireAuth:true，或者homePages:true，则不做登录校验
// 		next();
// 	} else {
// 		if (token) {
// 			//判断用户是否登录
// 			if (Object.keys(from.query).length === 0) {
// 				//判断路由来源是否有query，处理不是目的跳转的情况
// 				next();
// 			} else {
// 				let redirect = from.query.redirect; //如果来源路由有query
// 				if (to.path === redirect) {
// 					//这行是解决next无限循环的问题
// 					next();
// 				} else {
// 					next({ path: redirect }); //跳转到目的路由
// 				}
// 			}
// 		} else {
// 			if (to.path === "/login") {
// 				next();
// 			} else {
// 				next({
// 					path: "/login",
// 					query: { redirect: to.fullPath }, //将目的路由地址存入login的query中
// 				});
// 			}
// 		}
// 	}
// 	return;
// });
