<template>
	<div id="cousilt">
		<!-- 页头开始 -->
		<div class="header">
			<van-nav-bar
				title="查疾病"
				fixed
				left-arrow
				placeholder
				@click-left="onClickLeft"
			>
				<template #left>
					<van-icon
						name="arrow-left"
						size="25"
						color="#333029"
					></van-icon>
				</template>
			</van-nav-bar>
			<!-- 页头结束 -->
			<!-- 搜索框开始 -->
			<van-search
				class="search"
				v-model="value"
				placeholder="症状，疾病"
				@focus="gotoSearch"
			/>
			<!-- 搜索框结束 -->
		</div>
		<div class="main">
			<!-- 侧边导航开始 -->
			<div class="sidebar">
				<van-sidebar v-model="activeKey">
					<van-sidebar-item
						@click="handle(item.office_id)"
						:class="{
							active: $store.state.office_id == item.office_id,
						}"
						v-for="item of officeName"
						:title="item.office_name"
						:key="item.office_id"
					/>
				</van-sidebar>
			</div>
			<!-- 侧边导航结束 -->

			<!-- 索引栏开始 -->
			<div class="IndexBar">
				<van-index-bar
					highlight-color="#00c792"
					:index-list="indexList"
				>
					<div v-for="(item, index) of indexList" :key="index">
						<van-index-anchor index="index">
							{{ item }}</van-index-anchor
						>
						<van-cell
							v-for="(item1, index) of disease[index]"
							:title="item1.name"
							:to="{
								path: `/ConsultDetails/${item1.disease_id}/${$store.state.office_id}`,
							}"
							:key="index"
						/>
					</div>
				</van-index-bar>
			</div>
			<!-- 索引栏结束 -->
		</div>
	</div>
</template>
<script>
export default {
	data() {
		return {
			value: "",
			activeKey: 0,
			officeName: {}, //科室名称
			indexList: [], //索引字母数组
			disease: [], //当前科室的疾病数组
		};
	},
	methods: {
		gotoSearch() {
			this.$router.push({
				path: "/search",
				query: {
					active: 2,
				},
			});
		},
		onClickLeft() {
			this.$router.go(-1);
		},
		//发送axios请求获取对应科室的疾病数据
		handle(officeId = 1) {
			// 将当前选中的科室存放到Vuex中
			this.$store.commit("handleOfficeId", officeId);
			this.disease = []; //更换科室时清空索引首字母数组
			this.indexList = []; //更换科室时清空索引首字母数组
			let url = `/consultId?office_id=${officeId}`;
			this.axios.get(url).then(res => {
				let data = res.data.data;
				//拼接索引字母数组和当前科室的疾病数组
				//获取首个索引并push到数组中
				let name = data[0].index_name;
				this.indexList.push(name);
				let arr = []; //定义每个字母的小数组
				for (var d of data) {
					let n = d.index_name;
					if (name != n) {
						//拼接字母索引数组--------------------------------
						this.indexList.push(n);
						name = n; //把name切换到下到下个字母
						//把arr数组添加到当前科室的疾病数组disease中-----------
						this.disease.push(arr);
						arr = []; //首字母数组，用来放下一个字母下的所有疾病
					}
					arr.push(d);
				}
				this.disease.push(arr); //循环结束后把最后一组疾病添加到disease中
			});
		},
	},
	mounted() {
		//发送axios请求获取所有科室
		this.axios.get("/consult").then(res => {
			//获取数据放入officeName数组中
			this.officeName = res.data.data;
		});
		this.handle(); //首次加载
	},
};
</script>
<style scoped>
#cousilt {
	text-align: center;
}

.header >>> .van-nav-bar__title {
	font-size: 20px;
	font-weight: 800;
}
/* 搜索样式 */
#cousilt >>> .search {
	border: 1px solid #000;
	border-radius: 30px;
	padding: 0px 14px;
	margin: 0 20px;
	border: 0.5px solid grey;
    z-index: 9;
    position: relative;
}
.main {
	width: 100%;
	display: flex;
	height: 577px;
}
/* 侧边导航样式 */
.sidebar {
	width: 108px;
	overflow: scroll;
}
.van-sidebar-item {
	font-size: 16px;
	text-align: left;
	color: #999;
	padding: 20px 0 20px 16px;
}

.active {
	font-weight: 400;
	color: #00c792;
}
.van-sidebar-item--select::before {
	background-color: #fff;
}
/* 索引栏 */
.IndexBar {
	flex: 1 1;
	text-align: left;
	overflow: scroll;
}
</style>
