<template>
	<div id="address">
		<van-nav-bar
			title="选择地区"
			left-text="取消"
			@click-left="onClickLeft"
		></van-nav-bar>
		<van-tree-select
			class="bar"
			:height="height"
			:items="items"
			:active-id.sync="activeId"
			:main-active-index.sync="activeIndex"
			@click-nav="initactiveId"
			@click-item="hospital"
		/>
	</div>
</template>
<style scoped>


#address >>> .van-nav-bar__text {
	color: #333333;
	font-size: 16px;
}
#address >>> .van-nav-bar__title {
	font-size: 19px;
}
#address >>> .van-sidebar-item--select::before {
	background-color: transparent;
}
#address >>> .van-tree-select__item {
	color: #4d4d4d;
}
#address >>> .van-tree-select__item--active {
	color: #00c792;
}
#address >>> .van-sidebar-item__text {
	font-size: 16px;
	font-weight: 300;
	line-height: 18px;
	color: #999;
	width: 100%;
}
.van-tree-select__nav-item {
	padding: 16px 12px;
}
#address >>> .van-sidebar-item__text:visited {
	font-weight: 400;
	color: #00c792;
}
#address >>> .van-sidebar-item--select .van-sidebar-item__text {
	color: #00c792;
}
</style>
<script>
export default {
	data() {
		return {
			item: {
				// 导航名称
				text: "热门地区",
				// 导航节点额外类名
				// className: 'my-class',
				// 该导航下所有的可选项
				children: [
					{
						text: "全国",
						id: 0,
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
				],
			},
			items: [],
			activeId: 0,
			activeIndex: 0,
			height: 600,
		};
	},
	methods: {
		onClickLeft() {
			this.$router.go(-1);
		},
		initactiveId() {
			this.activeId = 1;
		},
		hospital(data) {
			this.$router.push(`/hospital?city_id=${data.id}`);
		},
	},
	mounted() {
		this.axios.get("/addressbar").then(result => {
			let total = [];
			let provinces = result.data.data[1];
			let citys = result.data.data[0];
			provinces.forEach(province => {
				let tempCity = citys.filter(city => {
					return province.province_id == city.province_id;
				});
				if (tempCity.length == 1) {
					return;
				}
				tempCity = tempCity.map(c => {
					return { text: c.cityname, id: c.city_id };
				});

				total.push({
					text: province.province_name,
					children: tempCity,
				});
			});
			total.unshift(this.item);
			this.items = total;
		});
	},
};
</script>
