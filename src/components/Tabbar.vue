<template>
	<div>
		<div class="tab-bar">
			<van-tabbar v-model="active">
				<van-tabbar-item name="home" icon="wap-home">首页</van-tabbar-item>
				<van-tabbar-item name="wiki" icon="column">健康百科</van-tabbar-item>
				<van-tabbar-item name="mine" icon="manager">我的</van-tabbar-item>
			</van-tabbar>
		</div>
		<div style="height: 50px; width: 100%;"></div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			active: "home",
		};
	},
};
</script>

<style>
.tab-bar {
	position: fixed;
	bottom: 0;
	left: 0;
}
</style>
