<template>
	<div class="article-title">
		<div class="van-cell">
			<div class="van-cell__title">
				<span>{{ title }}</span>
			</div>
			<router-link :to="url" class="van-cell__value">
				<div>
					<span>查看更多</span>
				</div>
				<i class="van-icon"></i>
			</router-link>
		</div>
	</div>
</template>

<script>
export default {
	name: "article-title",
	props: ["title", "url"],
};
</script>

<style>
.article-title .van-cell {
    display: flex;
    justify-content: space-around;
	box-sizing: border-box;
	width: 100%;
	padding: 10px 16px;
	overflow: hidden;
	color: #323233;
	font-size: 14px;
	line-height: 24px;
	background-color: #fff;
}

.article-title .van-cell .van-cell__title {
	flex: 3;
	-webkit-box-flex: 1;
}

.article-title .van-cell .van-cell__title span {
	font-size: 20px;
	font-weight: 500;
	color: #333;
}

.article-title .van-cell .van-cell__value {
    flex: 1;
	position: relative;
	overflow: hidden;
	color: #969799;
	text-align: right;
	vertical-align: middle;
	display: flex;
	justify-content: right;
}

.article-title .van-cell .van-cell__value > div {
	flex: 1;
}

.article-title .van-cell .van-icon {
	margin-left: 4px;
	color: #969799;
	height: 24px;
	font-size: 16px;
	line-height: 24px;
	position: relative;
	display: inline-block;
	text-rendering: auto;
	-webkit-font-smoothing: antialiased;
}

.article-title .van-cell .van-icon::after {
	content: "\F00A";
	display: inline-block;
}
</style>
