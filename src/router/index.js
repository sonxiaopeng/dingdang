import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import emgCall from "./emgCall/emgCall";
import mine from "./mine/mine";
import epidemic from "./epidemic/epidemic";
import Jkbk from "../views/Jkbk.vue";
import Jk from "../views/Jk.vue";
import Article from "../views/Article.vue";
import RelatedDiseases from "../views/RelatedDiseases.vue";
import Head from "../views/Head.vue";
import OfficeDepartment from "../views/OfficeDepartment.vue";
import Consult from "../views/Consult.vue";
import ConsultDetails from "../views/ConsultDetails.vue";

import Hospital from '../views/Hospital.vue'
import Addressbar from '../views/Addressbar.vue'
import Details from '../views/Details.vue'
import Subpage from '../views/Subpage.vue'

import Question from '../views/questions.vue'
import qsDetails from '../views/qsDetails.vue'
import qsDoctor from '../views/qsDoctor'
import qsMore from '../views/qsMore'


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
		meta: { index: 0 },
	},
	{
		path: "/ask",
		name: "Ask",
		component: () => import(/* webpackChunkName: "ask" */ "@/views/Ask"),
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
		meta: { index: 1 },
	},
	{
		path: "/relatedDiseases/:id",
		name: "RelatedDiseases",
		component: RelatedDiseases,
		props: true,
		meta: { index: 1 },
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
        meta:{index:1}
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
	},
	{
		path: "/head/:id",
		name: "Head",
		component: Head,
		props: true,
	},
	{
		path: "/consultDetails/:id",
		name: "ConsultDetails",
		component: ConsultDetails,
		props: true,
	},

	{
		path: "/consult",
		name: "Consult",
		component: Consult,
    },
 
      {
        path: '/Subpage',
        name: 'Subpage',
        component: Subpage
      },
      {
        path: '/Details',
        name: 'Details',
        component: Details
      },
      {
        path: '/Addressbar',
        name: 'Addressbar',
        component: Addressbar
      },
      {
        path: '/hospital',
        name: 'Hospital',
        component: Hospital
      },
      {
        path: '/question/more/:id',
        name: 'qsMore',
        component: qsMore
      },
      {
        path: '/question/doctor/:id',
        name: 'qsDoctor',
        component: qsDoctor
      },
      {
        path: '/question/details/:id',
        name: 'qsDetails',
        component: qsDetails
      },
      {
        path: '/question',
        name: 'Question',
        component: Question
      },
	...emgCall,
	...mine,
	...epidemic,
];

const router = new VueRouter({
	mode: "history",
	base: process.env.BASE_URL,
	routes,
});

export default router;
