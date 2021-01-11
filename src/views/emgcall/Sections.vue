<template>
	<div id="sections">
		<div class="sections-header">
			根据问题描述，已为你推荐以下科室
		</div>
		<div class="next-btn">
			<van-button size="large" color="#00c792" round @click="next"
				>下一步</van-button
			>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {};
	},
	methods: {
		next() {},
	},
};
</script>

<style scoped>
#sections {
	color: #333;
	min-height: 100vh;
	padding-bottom: 100px;
}

#sections .sections-header {
	padding: 20px 16px;
	font-weight: 500;
	font-size: 20px;
	line-height: 22px;
}

#sections .next-btn {
	box-sizing: border-box;
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	padding: 10px 16px;
}
</style>
