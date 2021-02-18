<template>
	<div id="container" class="xx-question" style="height:100%">
		<!-- 头部开始 -->
		<div id="container-top">
			<van-nav-bar
				title="公开问题"
				left-arrow
				@click-left="goBack"
			></van-nav-bar>
			<van-search
				@focus="gotoSearch"
				placeholder="搜索公开问题"
				shape="round"
				:left-icon="require('../assets/serch.png')"
			/>
		</div>
		<!-- 头部结束 -->

		<!-- 标签开始 -->
		<div>
			<van-tabs
				title-active-color="#00c792"
				v-model="navactive"
				@click="onkeshi"
			>
				<van-tab
					id="tab"
					style="height:106px"
					v-for="(office, index) of offices"
					v-model="bb"
					:title="office.office_name"
					:key="index"
				>
					<div class="tag-list">
						<div
							class="tag-item"
							v-for="(disease, index) of diseases"
							:key="index"
							:class="{ active: bb == index }"
							@click="onTab(index)"
						>
							<div>{{ disease.name }}</div>
						</div>
					</div>
				</van-tab>

				<div class="shadow"></div>
				<div class="common-tabs-link" @click="common">
					<svg
						t="1611049598401"
						class="icon"
						viewBox="0 0 1024 1024"
						version="1.1"
						xmlns="http://www.w3.org/2000/svg"
						p-id="5966"
						width="16"
						height="16"
					>
						<path
							d="M38.4 409.6c19.2 32 44.8 25.6 96 25.6H396.8c6.4 0 12.8-6.4 19.2-12.8 19.2-19.2 19.2-51.2 19.2-89.6V134.4c0-44.8 6.4-70.4-19.2-89.6C396.8 25.6 352 32 320 32H102.4c-6.4 0-12.8 0-19.2 6.4-19.2 6.4-32 19.2-38.4 32-12.8 19.2-12.8 51.2-12.8 83.2V320c0 32 0 70.4 6.4 89.6z m51.2-320c0-6.4 6.4-6.4 12.8-6.4H384V384H83.2V172.8c0-19.2-6.4-70.4 6.4-83.2z m544 345.6H953.6c6.4 0 19.2-6.4 19.2-12.8 19.2-12.8 19.2-38.4 19.2-70.4V147.2c0-44.8 0-64-19.2-89.6-25.6-32-57.6-25.6-115.2-25.6H633.6c-6.4 0-6.4 0-12.8 6.4-12.8 0-19.2 12.8-25.6 25.6-6.4 6.4-6.4 25.6-6.4 44.8v294.4c6.4 12.8 25.6 25.6 44.8 32z m6.4-352h211.2c19.2 0 70.4-6.4 83.2 6.4 6.4 0 6.4 6.4 6.4 12.8V384H640V83.2z m-204.8 608c0-44.8 6.4-70.4-19.2-89.6-19.2-12.8-64-6.4-96-6.4H64c-12.8 0-19.2 12.8-25.6 25.6-6.4 12.8-6.4 25.6-6.4 38.4v268.8c6.4 32 25.6 51.2 51.2 57.6 19.2 6.4 44.8 0 70.4 0h236.8c6.4 0 12.8-6.4 19.2-12.8 19.2-19.2 19.2-51.2 19.2-89.6v-192zM384 940.8H172.8c-19.2 0-70.4 6.4-83.2-6.4-6.4-6.4-6.4-6.4-6.4-12.8V640H384v300.8z m588.8-339.2c-6.4-6.4-12.8-6.4-19.2-6.4H620.8c-12.8 0-19.2 12.8-25.6 25.6-6.4 12.8-6.4 25.6-6.4 44.8V960c6.4 19.2 19.2 32 38.4 32h294.4c12.8-6.4 25.6-12.8 32-19.2 25.6-19.2 25.6-51.2 25.6-102.4v-172.8c12.8-44.8 19.2-76.8-6.4-96z m-38.4 332.8c-6.4 6.4-6.4 6.4-12.8 6.4H640V640h300.8v211.2c0 19.2 6.4 70.4-6.4 83.2z"
							fill="#00c792"
							p-id="5967"
						></path>
					</svg>
				</div>

				<!-- 展开 -->
				<div class="expend-buttom" @click="expendButtom">
					<p>
						展开
						<svg
							style="width:8px;height:8px"
							t="1610257363537"
							class="icon"
							viewBox="0 0 1024 1024"
							version="1.1"
							xmlns="http://www.w3.org/2000/svg"
							p-id="1386"
							width="200"
							height="200"
						>
							<path
								id="sicon"
								d="M63.44644 266.24c-52.907 0-85.333 69.973-46.08 109.227L466.21944 824.32c25.6 25.6 64.853 25.6 90.453 0l450.56-448.853c39.253-39.253 8.533-109.227-44.373-109.227H63.44644z"
								fill="#888888"
								p-id="1387"
							></path>
						</svg>
					</p>
				</div>
			</van-tabs>

			<!-- 患者症状开始 -->

			<div
				class="question-card"
				v-for="(article, index) of articles"
				:key="index"
			>
				<router-link :to="`/question/details/${article.question_id}`">
					<div class="question-card-header">
						<div
							style="width:20px;height:20px;border-radius:50%;overflow:hidden"
						>
							<img
								style="width:100%"
								:src="`http://localhost:3000/${article.avatar}`"
							/>
						</div>
						<p style="margin-left:6px;font-size:17px">
							{{ article.nickname | nicknameFormat }}
						</p>
					</div>
					<div
						class="question-card-content"
						v-html="article.content"
					></div>
					<div class="question-card-footer">
						{{ article.create_at | dateFormat }}
					</div>
				</router-link>
			</div>

			<!-- 患者症状结束 -->
		</div>
		<!-- 选择科室 -->
		<div class="filter-model" style="display:none;">
			<div class="filter-model-header">
				<p>选择科室</p>
				<div class="filter-modal-header-title" @click="onoffice">
					<svg
						t="1611049598401"
						class="icon"
						viewBox="0 0 1024 1024"
						version="1.1"
						xmlns="http://www.w3.org/2000/svg"
						p-id="5966"
						width="16"
						height="16"
					>
						<path
							d="M38.4 409.6c19.2 32 44.8 25.6 96 25.6H396.8c6.4 0 12.8-6.4 19.2-12.8 19.2-19.2 19.2-51.2 19.2-89.6V134.4c0-44.8 6.4-70.4-19.2-89.6C396.8 25.6 352 32 320 32H102.4c-6.4 0-12.8 0-19.2 6.4-19.2 6.4-32 19.2-38.4 32-12.8 19.2-12.8 51.2-12.8 83.2V320c0 32 0 70.4 6.4 89.6z m51.2-320c0-6.4 6.4-6.4 12.8-6.4H384V384H83.2V172.8c0-19.2-6.4-70.4 6.4-83.2z m544 345.6H953.6c6.4 0 19.2-6.4 19.2-12.8 19.2-12.8 19.2-38.4 19.2-70.4V147.2c0-44.8 0-64-19.2-89.6-25.6-32-57.6-25.6-115.2-25.6H633.6c-6.4 0-6.4 0-12.8 6.4-12.8 0-19.2 12.8-25.6 25.6-6.4 6.4-6.4 25.6-6.4 44.8v294.4c6.4 12.8 25.6 25.6 44.8 32z m6.4-352h211.2c19.2 0 70.4-6.4 83.2 6.4 6.4 0 6.4 6.4 6.4 12.8V384H640V83.2z m-204.8 608c0-44.8 6.4-70.4-19.2-89.6-19.2-12.8-64-6.4-96-6.4H64c-12.8 0-19.2 12.8-25.6 25.6-6.4 12.8-6.4 25.6-6.4 38.4v268.8c6.4 32 25.6 51.2 51.2 57.6 19.2 6.4 44.8 0 70.4 0h236.8c6.4 0 12.8-6.4 19.2-12.8 19.2-19.2 19.2-51.2 19.2-89.6v-192zM384 940.8H172.8c-19.2 0-70.4 6.4-83.2-6.4-6.4-6.4-6.4-6.4-6.4-12.8V640H384v300.8z m588.8-339.2c-6.4-6.4-12.8-6.4-19.2-6.4H620.8c-12.8 0-19.2 12.8-25.6 25.6-6.4 12.8-6.4 25.6-6.4 44.8V960c6.4 19.2 19.2 32 38.4 32h294.4c12.8-6.4 25.6-12.8 32-19.2 25.6-19.2 25.6-51.2 25.6-102.4v-172.8c12.8-44.8 19.2-76.8-6.4-96z m-38.4 332.8c-6.4 6.4-6.4 6.4-12.8 6.4H640V640h300.8v211.2c0 19.2 6.4 70.4-6.4 83.2z"
							fill="#00c792"
							p-id="5967"
						></path>
					</svg>
				</div>
			</div>
			<div class="filter-modal-body">
				<div
					class="filter-modal-button"
					v-for="(office, index) of offices"
					:key="index"
					:class="{ active: navactive == index }"
				>
					<div @click="onoffice(index)">{{ office.office_name }}</div>
				</div>
			</div>
		</div>
	</div>
</template>

<style>
.xx-question .filter-modal-body :nth-child(2n) {
	margin-left: 12px;
}
.xx-question .filter-modal-button {
	width: calc((100% - 12px) / 2);
	height: 40px;
	border-radius: 4px;
	background-color: #fafafa;
	display: inline-block;
	text-align: center;
	margin-bottom: 12px;
	font-weight: 300;
	font-size: 14px;
	line-height: 40px;
}
.xx-question .filter-modal-body {
	overflow-y: scroll;
	height: calc(100% - 104px);
	padding: 20px 16px 14px;
	box-sizing: border-box;
}
.xx-question .filter-model-header::after {
	display: block;
	content: "";
	width: 100%;
	height: 1px;
	position: absolute;
	left: 0;
	bottom: 0;
	background-color: #e8e9eb;
	transform-origin: 0 100%;
	transform: scaleY(0.5);
}
.xx-question .filter-modal-header-title::before {
	content: "";
	height: 20px;
	margin-right: 16px;
	border-right: 1px solid #ebebeb;
}
.xx-question .filter-modal-header-title {
	color: #00c792;
	font-size: 16px;
}
.xx-question .filter-model-header {
	height: 56px;
	line-height: 56px;
	display: flex;
	justify-content: space-between;
	padding: 0 16px;
	box-sizing: border-box;
	position: relative;
	font-size: 16px;
	color: #333;
}
.xx-question .filter-model {
	width: 100%;
	height: 100%;
	background: #fff;
	position: fixed;
	top: 44px;
	left: 0;
	z-index: 14;
	max-width: 768px;
	right: 0;
	margin: auto;
}
.xx-question .icon {
	position: relative;
	top: 2px;
}
.xx-question .common-tabs-link:before {
	content: "";
	color: #d0d3d9;
	margin-right: 8px;
}
.xx-question .common-tabs-link {
	height: 20px;
	position: absolute;
	top: 13px;
	right: 0;
	background-color: #fff;
	font-size: 16px;
	padding-right: 16px;
}
.xx-question .shadow::after {
	position: absolute;
	top: 0;
	right: 36px;
	width: 16px;
	height: 50px;
	background-image: linear-gradient(270deg, #fff, hsla(0, 0%, 100%, 0.5));
	content: "";
}
.xx-question .van-icon__image {
	width: 22px !important;
	height: 22px !important;
	margin-top: -8px;
}
.xx-question a:hover,
.xx-question a:visited,
.xx-question a:link,
.xx-question a:active {
	color: #111;
}
.xx-question .question-card:after {
	position: absolute;
	right: 16px;
	bottom: 0;
	left: 16px;
	box-sizing: border-box;
	height: 1px;
	background-color: #ebebeb;
	content: "";
	transform: scaleY(0.5);
}
.xx-question .question-card-footer {
	font-size: 12px;
	font-weight: 300;
	line-height: 14px;
	color: #999;
	margin-top: 12px;
}
.xx-question .question-card-content {
	font-size: 16px;
	font-weight: 300;
	line-height: 24px;
	color: #4d4d4d;
	margin-top: 12px;
	display: -webkit-box;
	word-break: break-all;
	overflow: hidden;
	-webkit-line-clamp: 3;
	text-overflow: ellipsis;
	-webkit-box-orient: vertical;
}
.xx-question .question-card-header {
	display: flex;
	align-items: center;
	line-height: 20px;
}
.xx-question .question-card {
	background: #fff;
	padding: 20px 16px;
	position: relative;
}
.xx-question .expend-buttom {
	height: 34px;
	display: flex;
	flex-flow: row nowrap;
	align-items: center;
	width: 100%;
	font-size: 12px;
	font-weight: 300;
	color: #4d4d4d;
	justify-content: center;
}
.xx-question .active {
	background-color: #e5f9f4!important;
	color: #00c792!important;
}
.xx-question .tag-item {
	background-color: #fff;
	font-weight: 400;
	color: #4d4d4d;
	padding-bottom: 10px;
	overflow: hidden;
	/* max-height: 106px; */
	display: flex !important;
	flex-flow: row wrap !important;
	padding: 8px 12px;
	box-sizing: border-box;
	margin: 12px 12px 0 0;
	max-width: 343px;
	font-size: 14px;
	line-height: 16px;
}
.xx-question .van-tab__pane {
	overflow: hidden;
}
.xx-question .tag-list {
	padding-bottom: 10px;
	/* max-height: 106px; */
	display: flex !important;
	flex-flow: row wrap !important;
	padding: 8px 4px 30px 16px;
	box-sizing: border-box;
}
.xx-question .van-tabs__line {
	background-color: #00c792 !important;
	font-weight: 500;
	width: 30px !important;
	border-radius: 1px !important;
}
.xx-question #container .van-tabs__wrap {
	padding-right: 50px;
}

.xx-question .van-tabs__wrap--scrollable .van-tab {
	font-size: 15px;
	margin-right: 16px;
}
.xx-question .van-field__control {
	font-weight: bold;
	font-size: 15px;
}
.xx-question .van-search__content--round {
	border: 1px solid grey;
	border-radius: 18px;
}
.xx-question .van-nav-bar__title {
	font-size: 19px !important;
}
.xx-question .van-nav-bar__left {
	padding: 0 8px !important;
}
.xx-question .van-nav-bar__arrow {
	font-size: 26px !important;
}
.xx-question .van-nav-bar .van-icon {
	color: black !important;
}
.xx-question #container-top {
	z-index: 8;
	position: sticky;
	top: 0px;
}
.xx-question .container,
.xx-question .page {
	max-width: 768px;
	margin: 0 auto;
}
.xx-question  {
	max-width: 768px;
	margin: 0 auto;
}
.xx-question .van-tab--active {
	font-weight: 700 !important;
}
</style>

<script>
export default {
	data() {
		return {
			navactive: 0,
			taglisti: 0,
			tagactive: "",
			bb: 0,
			offices: [],
			diseases: [],
			articles: [],
			math: 0,
		};
	},
	watch: {
		// 监听展开按钮
		taglisti() {
			let tagList = document.getElementsByClassName("van-tab__pane")[
				this.navactive
			];
			let zhankai = document.getElementsByClassName("expend-buttom")[0];
			if (this.taglisti == 0) {
				tagList.style.overflow = "hidden";
				tagList.style.height = "106px";
				zhankai.innerHTML = `<p>展开 <svg style="width:8px;height:8px;color:#ccc" t="1610257363537" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1386" width="200" height="200"><path id="sicon" d="M63.44644 266.24c-52.907 0-85.333 69.973-46.08 109.227L466.21944 824.32c25.6 25.6 64.853 25.6 90.453 0l450.56-448.853c39.253-39.253 8.533-109.227-44.373-109.227H63.44644z" fill="#888888" p-id="1387"></path></svg></p>`;
			} else {
				tagList.style.overflow = "visible";
				tagList.style.height = "";
				zhankai.innerHTML = `<p>收起 <svg style="width:11px;height:11px;color:#ccc" t="1610292213203" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2421" width="200" height="200"><path d="M959.043 739.458l-446.71-455.792-446.71 455.792z" fill="#8a8a8a" p-id="2422"></path></svg></p>`;
			}
		},
	},
	mounted() {
		// 请求科室数据
		this.axios.get("/question").then((res, req) => {
			this.offices = res.data.data;
		});

		//请求症状数据
		let id = parseInt(this.navactive) + 1;
		this.axios.get("disease?id=" + id).then((res, req) => {
			this.diseases = res.data.data;
		});

		//请求问题数据
		this.axios.get("/uquestion").then((res, req) => {
			this.articles = res.data.data.slice(0, 10);
		});
	},
	methods: {
        gotoSearch(){
            this.$router.push({
				path: "/search",
				query: {
					active: 2,
				},
			});
        },
		goBack() {
			this.$router.go(-1);
		},
		common() {
			let modal = document.getElementsByClassName("filter-model")[0];
			modal.style.display = "block";
		},
		onoffice(index) {
			let modal = document.getElementsByClassName("filter-model")[0];
			modal.style.display = "none";
			this.navactive = parseInt(index);
			this.axios.get("/uquestion").then((res, req) => {
				this.articles = res.data.data.slice(
					this.navactive * 10,
					(this.navactive + 1) * 10
				);
			});
		},
		// 点击展开按钮改变变量值
		expendButtom() {
			if (this.taglisti == 0) {
				this.taglisti = 1;
			} else if (this.taglisti == 1) {
				this.taglisti = 0;
			}
		},
		onkeshi() {
			let tagList = document.getElementsByClassName("van-tab__pane")[
				this.navactive
			];
			tagList.style.overflow = "hidden";
			tagList.style.height = "106px";
			this.bb = 0;
			this.taglisti = 0;
			let id = parseInt(this.navactive) + 1;
			this.axios.get("disease?id=" + id).then((res, req) => {
				this.diseases = res.data.data;
			});
			this.axios.get("/uquestion").then((res, req) => {
				this.articles = res.data.data.slice(
					this.navactive * 10,
					(this.navactive + 1) * 10
				);
			});
		},
		//改变二级导航标签颜色
		onTab(index) {
			this.bb = index;
			this.math = parseInt(Math.random() * 279);
			this.axios.get("/uquestion").then((res, req) => {
				this.articles = res.data.data.slice(this.math, this.math + 3);
			});
		},
	},
};
</script>
