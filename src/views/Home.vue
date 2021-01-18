<template>
	<div class="home">
		<div class="home-header">
			<van-search
				v-model="searchVal"
				placeholder="搜索疾病/症状/医生/药品/医院"
				shape="round"
			>
				<template #left-icon>
					<img src="@/assets/images/home/search-icon.png" alt="" />
				</template>
			</van-search>
		</div>
		<div class="top-btn">
			<van-grid :column-num="3" :border="false">
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-1.png')"
						@click="gotoModule('/')"
					/>
					<p class="title">问医生</p>
					<p class="desc">按科室找医生</p>
				</van-grid-item>
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-2.png')"
						@click="gotoModule('/')"
					/>
					<p class="title">特惠义诊</p>
					<p class="desc">问诊1元起</p>
				</van-grid-item>
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-3.png')"
						@click="gotoModule('/emgcall/symptom')"
					/>
					<p class="title">电话急诊</p>
					<p class="desc">一对一电话咨询</p>
				</van-grid-item>
			</van-grid>
		</div>
		<div class="top-btn-small">
			<van-grid :column-num="4" :border="false">
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-4.png')"
						@click="gotoModule('/')"
					/>
					<p class="desc">查疾病</p>
				</van-grid-item>
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-5.png')"
						@click="gotoModule('/')"
					/>
					<p class="desc">找医院</p>
				</van-grid-item>
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-6.png')"
						@click="gotoModule('/')"
					/>
					<p class="desc">名医问答</p>
				</van-grid-item>
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-7.png')"
						@click="gotoModule('/')"
					/>
					<p class="desc">健康百科</p>
				</van-grid-item>
			</van-grid>
		</div>
		<div class="home-banner">
			<section>
				<router-link to="/epidemic">
					<img :src="require('@/assets/images/home/banner.png')" />
				</router-link>
			</section>
		</div>

		<div class="articles">
			<article-title title="科普文章" url="/articles"></article-title>
			<div class="articles-content">
				<article-list
					v-for="(item, index) of articles"
					:key="index"
					:title="item.title"
					:content="item.content"
					:imgurl="item.imgurl"
					:url="url"
				></article-list>
			</div>
		</div>
		<div class="questions">
			<article-title title="公开问题" url="/articles"></article-title>
			<div class="questions-content">
				<div class="questions-tags">
					<van-tag size="large" :class="{ active: tagactive == index }"
                        v-for="(item, index) of keywords"
						:key="index"
                        @click="setActive(index)"
                    >
						{{ item }}
					</van-tag>
				</div>
				<question-list
					:imgurl="item.imgurl"
					:nickname="item.nickname"
					:describe="item.describe"
					:committime="item.committime"
					:index="index"
					v-for="(item, index) of questions"
					:key="index"
				></question-list>
			</div>
		</div>

		<tab-bar active="home"></tab-bar>
	</div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from "@/components/HelloWorld.vue";
// import Tabbar from '@/components/Tabbar'
import ArticleTitle from "@/components/ArticleTitle";

export default {
	data() {
		return {
			keywords: [
				"痤疮",
				"感冒",
				"过敏",
				"玫瑰痤疮",
				"贫血",
				"鼻窦炎",
				"结膜炎",
				"尿路感染",
			],
			searchVal: "",
			tagactive: "",
			questions: [
				{
					nickname: "属***e",
					imgurl: "/user/default-avatar.png",
					describe: `症状描述：一开始是鼻塞，流清鼻涕，咽喉有些红肿，过了两三天鼻子通了，
                    但一直在流鼻涕，有清鼻涕和黄鼻涕，前天开始喉咙有痰，咳不出，不怎么咳嗽。今天凌晨五点多咳嗽了一会，
                    感觉咳嗽的声音和前两天不太一样了，有些发齁的，呼吸略喘。还是流鼻涕
			患病时长：六七天 医院检查：无 用药情况：喝过三天的蓝芩，两天秋梨膏（内含川贝母）`,
					committime: 1318781876000,
				},
				{
					nickname: "团***麻",
					imgurl: "/user/default-avatar.png",
					describe: `张医生您好，我母亲胃癌，10月下旬做的胃切除手术，我把住院小结发您麻烦帮我看一下，
                    做的免疫组化Her-2+++这项不好，这项代表什么是否非常严重，这项我不是很懂,麻烦帮我分析一下谢谢`,
					committime: 1318781876000,
				},
				{
					nickname: "土***豆",
					imgurl: "/user/default-avatar.png",
					describe: `您好，新生儿24天，发现从昨天开始，小孩子的吃奶量似乎有所下降…18-22天时候稳定每次喂100-120毫升，
                    甚至有两次喂到150才不吃了…可是23/24这两天，每次吃的奶量下降，吃到70-110就不再吃了，
                    拍嗝换尿布等等做完还是不吃…睡眠时间也从2.5小时下降到1-1.5小时…请问这样正常么？谢谢`,
					committime: 1318781876000,
				},
			],
			articles: [
				{
					title: "不立个新年 Flag，能叫过年吗？",
					imgurl: "/home/6065685124929975543-22.jpg",
					content:
						"2020 年，因为疫情，大家度过了特殊的一年，回首过去的一年，你觉得疫情带给你最大的变化是什么呢？为此，我们采访了丁香医",
				},
				{
					title: "为什么我摸着咪咪，那么伤心难过？",
					imgurl: "/home/9467511711679692543-22.jpg",
					content:
						"本文章转载自公众号：莓辣 MAYLOVE（meila2333）莓辣，一个欢迎所有妄想改变性教育现状的酷小孩一起搞事的地方",
				},
				{
					title: "新冠疫苗全民免费，这笔钱从哪来？",
					imgurl: "/home/5209958069434217543-22.jpg",
					content:
						"2020 年最后一天，国务院公布「国药新冠疫苗被批准附条件上市」。同一个新闻发布会上，国家卫生健康委员会副主任曾益新表示",
				},
			],

			url: "/articles",
		};
	},
	components: {
		"article-title": ArticleTitle,
		// 'tab-bar': Tabbar
	},
	methods: {
		onSearch() {},
		gotoModule(link) {
			this.$router.push(link);
		},
		setActive(index) {
			this.tagactive = index;
		},
    },
    mounted(){
        document.body.scrollTop = 0;
        this.axios.get('/queryarticle')
        .then(res=>{
            if(res.data.code == 0){
                this.articles = res.data.data

            }else{
                console.log(res.data.message)
            }
        })
        .catch(reason=>{
            console.log(reason)
        })
    }
};
</script>

<style scoped>
/* 公开问题样式开始 */
/* 公开问题样式结束 */
/* 公开问题样式开始 */
.home >>> .questions-content .questions-tags {
	padding: 8px 4px 20px 16px;
	display: flex;
	flex-flow: row wrap;
	align-items: center;
}

.home >>> .questions-content .van-tag {
	padding: 8px 12px;
	font-weight: 300;
	font-size: 14px;
	line-height: 16px;
	white-space: nowrap;
	text-overflow: ellipsis;
	border-radius: 2px;
	max-width: 343px;
	margin: 12px 12px 0 0;
	overflow: hidden;
	color: #4d4d4d;
	background-color: #fafafa;
}

.home >>> .questions-content .van-tag.active {
	color: #00c792;
	background-color: #e5f9f4;
}
/* 公开问题样式结束 */

/* 科普文章样式开始 */
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
/* 科普文章样式结束 */

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
