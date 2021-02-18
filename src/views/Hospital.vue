<template>
	<div id="hosp">
		<van-nav-bar
		    fixed
			placeholder
			title="查医院"
			left-arrow
			@click-left="goBack"
		></van-nav-bar>
		<div class="home-header">
			<van-search
				placeholder="搜索医院"
				shape="round"
				@focus="gotoSearch"
			>
				<template #left-icon>
					<img src="@/assets/images/home/search-icon.png" alt="" />
				</template>
			</van-search>
		</div>
		<router-link to="/Addressbar">
			<div id="location">
				<van-cell :title="city">
					<template #icon>
						<van-icon
							name="location"
							class="location-icon"
							color="#00C792"
						/>
					</template>
				</van-cell>
			</div>
		</router-link>
		<router-link
			v-for="(item, index) of tables"
			:key="index"
			:to="`/details?hospital=${item.hospital_id}`"
		>
			<div id="table">
				<div class="file">
					<p class="title">{{ item.hospitalname }}</p>
					<p class="article">{{ item.address }}</p>
				</div>
				<p class="category">{{ item.hospitallevel }}</p>
			</div>
		</router-link>
	</div>
</template>
<style scoped>
#hosp >>> #table .file p {
	line-height: 24px;
}

/* 顶部搜索框样式开始 */
#hosp >>> .home-header {
	width: 100%;
	box-sizing: border-box;
	max-width: 768px;
	position: sticky;
	top: 46px;
	background-color: #fff;
	z-index: 99999;
}

#hosp >>> .home-header .van-search {
	padding: 10px 16px;
}

#hosp >>> .home-header .van-search .van-search__content {
	border: 0.5px solid #d9d9d9;
	box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.05);
	background-color: #fff;
	padding-left: 15px;
}

#hosp >>> .home-header .van-search .van-cell {
	display: flex;
	align-items: center;
	height: 42px;
}

#hosp >>> .home-header .van-field__left-icon img {
	width: 22px;
	height: 22px;
	min-width: 22px;
	margin-right: 5px;
}

#hosp >>> .home-header .van-field__control::-webkit-input-placeholder {
	color: #999;
	font-weight: bold;
	font-size: 15px;
}
/* 顶部搜索框样式结束 */

#hosp >>> #location {
	height: 55px;
	padding: 0 16px;
	margin: 0 auto;
	text-align: left;
	position: relative;
}
#hosp >>> #location::after {
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
.van-icon-location::before {
	font-size: 16px;
}
#hosp >>> #location .van-cell {
	padding: 20px 0;
	color: #00c792;
	padding: 0 0 0 2px;
	line-height: 55px;
}
#location .location-icon {
	line-height: 55px;
}
#table {
	height: 100px;
	position: relative;
	padding: 20px 16px;
	box-sizing: border-box;
}
#table::after {
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
#table .file {
	width: 72%;
	height: 60px;
}
#table .title {
	color: #333333;
	font-size: 17px;
	margin: 0;
}
#table .article {
	margin: 0;
	color: #999999;
	font-size: 13px;
}
#table .category {
	padding: 4px;
	width: 48px;
	height: 14px;
	background-color: #ebebeb;
	color: #808080;
	font-size: 12px;
	line-height: 14px;
	margin: 0;
	position: absolute;
	right: 16px;
	top: 50%;
	transform: translateY(-50%);
}
</style>
<script>
export default {
	data() {
		return {
			value: "",
			tables: [
				{
					title: "北京协和医院",
					wenzi:
						"北京市东城区帅府园1号（东院）;西城区大木仓胡同41号（西院）",
					lei: "三级甲等",
				},
			],
			citys: [
				{
					text: "全国",
				},
				{
					text: "北京",
					id: 1,
				},
				{
					text: "上海",
					id: 3,
				},
				{
					text: "广州",
					id: 213,
				},
				{
					text: "深圳",
					id: 214,
				},
				{
					text: "杭州",
					id: 99,
				},
			],
			city: "全国",
		};
	},
	mounted() {
		this.citys.forEach(element => {
			if (element.id == this.$route.query.city_id) {
				this.city = element.text;
				return;
			}
		});
		if (
			this.$route.query.city_id == "undefined" ||
			!this.$route.query.city_id
		) {
			this.axios.get("/hospital").then(result => {
				this.tables = result.data.data;
			});
		} else {
			this.axios
				.get(`/hospital?id=${this.$route.query.city_id}`)
				.then(result => {
					this.tables = result.data.data;
				});
		}
	},
	methods: {
		goBack() {
			this.$router.push('/');
		},
		gotoSearch() {
			this.$router.push({
				path: "/search",
				query: {
					active: 3,
				},
			});
		},
	},
};
</script>
