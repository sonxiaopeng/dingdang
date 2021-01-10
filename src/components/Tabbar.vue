<template>
	<div>
		<div class="tab-bar">
			<van-tabbar v-model="selected" router>
				<van-tabbar-item to="/" name="home" icon="wap-home">首页</van-tabbar-item>
				<van-tabbar-item to="/wiki" name="wiki" icon="column">健康百科</van-tabbar-item>
				<van-tabbar-item to="/ask" name="ask" icon="chat">问诊</van-tabbar-item>
				<van-tabbar-item to="/mine" name="mine" icon="manager">我的</van-tabbar-item>
			</van-tabbar>
		</div>
		<div style="height: 50px; width: 100%;"></div>
	</div>
</template>

<script>
export default {
    props: ['active'],
	data() {
		return {
			selected: this.active
		};
	},
    methods: {
        
    },
    mounted(){
    },
    watch :{
        
    }
};
</script>

<style>
.tab-bar {
	position: fixed;
	bottom: 0;
	left: 0;
}
</style>
