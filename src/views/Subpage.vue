<template>
	<div id="subpage">
		<van-nav-bar
		    fixed
			title="医院介绍"
            placeholder
			left-arrow
			@click-left="onClickLeft"
		></van-nav-bar>
		<div class="text">
			{{ article.description }}
		</div>
	</div>
</template>
<style scoped>
#subpage >>> .van-icon-arrow-left::before {
	font-size: 28px;
	color: #333029;
	font-weight: normal;
	margin-left: -10px;
}
#subpage >>> .van-nav-bar__title {
	color: #202020;
	font-size: 19px;
}
#subpage >>> .text {
	padding: 10px 16px 60px;
	color: #333;
	font-weight: 300;
	font-size: 18px;
	line-height: 32px;
	width: 100%;
	word-break: break-all;
	box-sizing: border-box;
}
</style>
<script>
export default {
	data() {
		return {
			article: { description: "" },
		};
	},
	methods: {
		onClickLeft() {
			this.$router.go(-1);
		},
	},
	mounted() {
		this.axios
			.get(`/subpage?hospital=${this.$route.query.hospital}}`)
			.then(result => {
				this.article = result.data.data;
			});
	},
};
</script>
