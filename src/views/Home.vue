<template>
	<div class="home">
		<div class="home-header">
			<van-search v-model="searchVal" placeholder="搜索疾病/症状/医生/药品/医院" shape="round">
				<template #left-icon>
					<img src="@/assets/images/home/search-icon.png" alt="" />
				</template>
			</van-search>
		</div>
		<div class="top-btn">
			<van-grid :column-num="3" :border="false">
				<van-grid-item>
					<van-image :src="require('@/assets/images/home/top-btn-1.png')" />
					<p class="title">问医生</p>
					<p class="desc">按科室找医生</p>
				</van-grid-item>
				<van-grid-item>
					<van-image :src="require('@/assets/images/home/top-btn-2.png')" />
					<p class="title">特惠义诊</p>
					<p class="desc">问诊1元起</p>
				</van-grid-item>
				<van-grid-item>
					<van-image :src="require('@/assets/images/home/top-btn-3.png')" />
					<p class="title">电话急诊</p>
					<p class="desc">一对一电话咨询</p>
				</van-grid-item>
			</van-grid>
		</div>
		<div class="top-btn-small">
			<van-grid :column-num="4" :border="false">
				<van-grid-item>
					<van-image :src="require('@/assets/images/home/top-btn-4.png')" />
					<p class="desc">查疾病</p>
				</van-grid-item>
				<van-grid-item>
					<van-image :src="require('@/assets/images/home/top-btn-5.png')" />
					<p class="desc">找医院</p>
				</van-grid-item>
				<van-grid-item>
					<van-image :src="require('@/assets/images/home/top-btn-6.png')" />
					<p class="desc">名医问答</p>
				</van-grid-item>
				<van-grid-item>
					<van-image :src="require('@/assets/images/home/top-btn-7.png')" />
					<p class="desc">健康百科</p>
				</van-grid-item>
			</van-grid>
		</div>
		<div class="home-banner">
			<section>
				<router-link to="">
					<img :src="require('@/assets/images/home/banner.png')" />
				</router-link>
			</section>
		</div>

		<div class="articles">
			<van-cell title="科普文章" :border="false" is-link value="查看更多" url="/articles" />
			<div class="articles-content">
				<article-list :title="title" :content="content" :imgurl="imgurl" :url="url"></article-list>
				<article-list :title="title" :content="content" :imgurl="imgurl" :url="url"></article-list>
				<article-list :title="title" :content="content" :imgurl="imgurl" :url="url"></article-list>
			</div>
		</div>
		<div class="questions">
			<van-cell title="公开问题" :border="false" is-link value="查看更多" url="/articles" />
			<div class="questions-content">
				
			</div>
		</div>




        <tab-bar></tab-bar>
	</div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from "@/components/HelloWorld.vue";

export default {
	data() {
		return {
            searchVal: "",
            title: '不立个新年 Flag，能叫过年吗？',
            imgurl: '/home/6065685124929975543-22.jpg',
            url: '/articles',
            content: '2020 年，因为疫情，大家度过了特殊的一年，回首过去的一年，你觉得疫情带给你最大的变化是什么呢？为此，我们采访了丁香医'
		};
	},
	components: {
		// HelloWorld,
	},
	methods: {
		onSearch() {},
	},
};
</script>

<style scoped>


.home >>> .articles,
.home >>> .questions {
	margin-top: 15px;
}

.home >>> .van-cell__title span {
	font-size: 20px;
	font-weight: 500;
	color: #333;
}

.home >>> .home-banner {
	padding: 10px 16px;
}

.home >>> .home-banner img {
	width: 100%;
	border-radius: 10px;
}

/* 顶部4个小图标样式开始 */
.home >>> .top-btn-small .van-grid-item__content {
	padding-top: 0;
}

.home >>> .top-btn-small .van-image {
	height: 40px;
	width: 40px;
}

.home >>> .top-btn-small .desc {
	font-size: 12px;
	margin-top: 5px;
	color: #666;
}

/* 顶部4个小图标样式结束 */

/* 顶部搜索框样式开始 */
.home >>> .home-header {
	width: 100%;
	box-sizing: border-box;
	max-width: 768px;
}

.home >>> .home-header .van-search {
	padding: 10px 16px;
}

.home >>> .home-header .van-search .van-search__content {
	border: 0.5px solid #d9d9d9;
	box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.05);
	background-color: #fff;
	padding-left: 15px;
}

.home >>> .home-header .van-search .van-cell {
	display: flex;
	align-items: center;
	height: 42px;
}

.home >>> .home-header .van-field__left-icon img {
	width: 22px;
	height: 22px;
	min-width: 22px;
	margin-right: 5px;
}

.home >>> .home-header .van-field__control::-webkit-input-placeholder {
	color: #999;
	font-weight: bold;
	font-size: 15px;
}
/* 顶部搜索框样式结束 */

/* 顶部三个大图标样式开始 */

.home >>> .top-btn .van-image {
	height: 70px;
	width: 70px;
}

.home >>> .top-btn .title {
	font-size: 15px;
	font-weight: bold;
}

.home >>> .top-btn .desc {
	font-size: 12px;
	margin-top: 5px;
	color: #666;
}

.home >>> .top-btn .van-grid-item {
	position: relative;
}

.home >>> .top-btn .van-grid-item::after {
	content: "";
	display: block;
	position: absolute;
	width: 1px;
	height: 40px;
	background-color: #ebebeb;
	right: 0;
	bottom: 40px;
	z-index: 2;
}

/* 顶部三个大图标样式结束 */
</style>
