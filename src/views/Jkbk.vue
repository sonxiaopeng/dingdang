<template>
	<div id="jkbk">
		<!-- 输入框开始 -->
		<van-search
			v-model="value"
			placeholder="搜索疾病/症状/医生/药品/医院"
			shape="round"
			class="input"
			@focus="gotoSearch"
		>
			<template #left-icon>
				<van-icon :name="require('../assets/443-22.png')"></van-icon>
			</template>
		</van-search>
		<!-- 输入框结束 -->
		<div class="box">
			<!-- 查询栏开始 -->
			<van-row
				type="flex"
				align="center"
				justify="space-around"
				class="query"
			>
				<van-col span="6">
					<van-image
						width="40"
						:src="require('../assets/Check-the-disease1.png')"
					/>
					<p>查疾病</p>
				</van-col>
				<van-col span="6">
					<van-image
						width="40"
						:src="require('../assets/Check-drug2.png')"
					/>
					<p>查药品</p>
				</van-col>
				<van-col span="6">
					<van-image
						width="40"
						:src="require('../assets/Check-the-hospital3.png')"
					/>
					<p>查医院</p>
				</van-col>
				<van-col span="6">
					<van-image
						width="40"
						:src="require('../assets/Check-the-vaccine4.png')"
					/>
					<p>查疫苗</p>
				</van-col>
				<van-col span="6">
					<van-image
						width="40"
						:src="require('../assets/operative-treatment5.png')"
					/>
					<p>手术检查</p>
				</van-col>
				<van-col span="6">
					<van-image
						width="40"
						:src="require('../assets/First-aid-guide6.png')"
					/>
					<p>急救指南</p>
				</van-col>
				<van-col span="6">
					<van-image
						width="40"
						:src="require('../assets/Summer-guide7.png')"
					/>
					<p>夏季指南</p>
				</van-col>
				<van-col span="6">
					<van-image
						width="40"
						:src="require('../assets/popular-video8.png')"
					/>
					<p>科普视频</p>
				</van-col>
			</van-row>
			<!-- 查询栏结束 -->
			<!-- 大众健康栏开始 -->
			<header>大众健康</header>
			<van-row
				type="flex"
				justify="space-around"
				align="center"
				class="module-body"
			>
				<router-link
					v-for="(p, i) of arryJk"
					:key="i"
					:to="{ path: '/jk/' + p.category_id }"
				>
					<van-col span="7">
						<van-image
							width="105"
							height="55.66"
							fit="cover"
							lazy-load
							show-loading
							:src="p.background_img"
						>
							<template v-slot:loading>
								<van-loading
									type="spinner"
									size="20"
									vertical
									color="#ccc"
									>加载中...</van-loading
								>
							</template>
							<template v-slot:error>加载失败</template>
						</van-image>
					</van-col>
				</router-link>
			</van-row>
			<!-- 大众健康栏结束 -->
			<!-- 生活手册栏开始 -->
			<header>生活手册</header>
			<van-row
				type="flex"
				justify="space-around"
				align="center"
				class="module-enchiridion"
			>
				<router-link
					v-for="(p, i) of arrySh"
					:key="i"
					:to="{ path: '/jk/' + p.category_id }"
				>
					<van-col span="7">
						<van-image
							width="105"
							height="55.66"
							fit="cover"
							lazy-load
							show-loading
							:src="p.background_img"
						>
							<template v-slot:loading>
								<van-loading
									type="spinner"
									size="20"
									vertical
									color="#ccc"
									>加载中...</van-loading
								>
							</template>
							<template v-slot:error>加载失败</template>
						</van-image>
					</van-col>
				</router-link>
			</van-row>
			<!-- 生活手册栏结束 -->
			<van-image
				width="375"
				height="143"
				:src="require('../assets/last-title.png')"
			/>
		</div>
		<tab-bar active="wiki"></tab-bar>
	</div>
</template>
<style scoped>
#jkbk {
	text-align: center;
}

.box {
	padding-top: 56px;
}
.input {
	width: 100%;
	position: fixed;
	z-index: 1;
}
.input >>> ::-webkit-input-placeholder {
	font-weight: 700;
	font-size: 15px;
	line-height: 1;
	color: rgb(131, 128, 128);
}
.van-icon__image {
	width: 22px;
	height: 22px;
}
.query {
	height: 140px;
	padding: 0 8px;
}
.module-body {
	padding: 0 10px;
	height: 278px;
	margin-top: 8px;
}
.module-enchiridion {
	padding: 0 10px;
	height: 207px;
	margin-top: 8px;
}
header {
	text-align: left;
	padding: 20px 16px 6px 18px;
	font-size: 18px;
	color: #333;
	font-weight: bolder;
}
p {
	margin: 0;
	font-size: 12px;
	font-weight: 500;
}
</style>
<script>
export default {
	data() {
		return {
			value: "",
			arryJk: [],
			arrySh: [],
		};
	},
	methods: {
		gotoSearch() {
			this.$router.push({
				path: "/search",
				query: {
					active: 1,
				},
			});
		},
	},
	mounted() {
		window.scrollTo(0, 0);
		//发送请求渲染页面
		this.axios.get("/jkbk").then(result => {
			// console.log(result.data.data)
			let titleImg = result.data.data;
			titleImg.forEach(element => {
				element.background_img = require("../assets/img/" +
					element.background_img);
			});
			this.arryJk = titleImg.slice(0, 12);
			this.arrySh = titleImg.slice(12);
		});
	},
};
</script>
