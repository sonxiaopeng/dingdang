<template>
	<div class="home">
		<div class="home-header">
			<van-search
				v-model="searchVal"
				placeholder="搜索疾病/医生/医院/文章"
				shape="round"
                @focus="gotoSearch"
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
						@click="gotoModule('/officeDepartment')"
					/>
					<p class="title">问医生</p>
					<p class="desc">按科室找医生</p>
				</van-grid-item>
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-2.png')"
						@click="gotoModule('/diolog')"
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
						@click="gotoModule('/consult')"
					/>
					<p class="desc">查疾病</p>
				</van-grid-item>
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-5.png')"
						@click="gotoModule('/hospital')"
					/>
					<p class="desc">找医院</p>
				</van-grid-item>
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-6.png')"
						@click="gotoModule('/question')"
					/>
					<p class="desc">名医问答</p>
				</van-grid-item>
				<van-grid-item>
					<van-image
						:src="require('@/assets/images/home/top-btn-7.png')"
						@click="gotoModule('/jkbk')"
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
			<article-title title="科普文章" url="/jkbk"></article-title>
			<div class="articles-content">
				<article-list
					v-for="(item, index) of articles"
					:key="index"
					:title="item.subject"
					:content="item.description"
					:imgurl="item.img"
					:url="url + `/${item.article_id}`"
				></article-list>
			</div>
		</div>
		<div class="questions">
			<article-title title="公开问题" url="/question"></article-title>
			<div class="questions-content">
				<div class="questions-tags">
					<van-tag size="large" :class="{ active: tagactive == item.disease_id }"
                        v-for="(item, index) of keywords"
						:key="index"
                        @click="setActive(item.disease_id)"
                    >
						{{ item.name }}
					</van-tag>
				</div>
				<question-list
					:imgurl="item.imgurl"
					:nickname="item.nickname"
					:describe="item.describe"
					:committime="item.committime"
					:index="item.quesid"
					v-for="(item, index) of questions"
					:key="index"
				></question-list>
			</div>
		</div>

		<tab-bar tabbarActive="home"></tab-bar>
	</div>
</template>

<script>
// @ is an alias to /src
import ArticleTitle from "@/components/ArticleTitle";

export default {
	data() {
		return {
			keywords: [],
			searchVal: "",
			tagactive: 1,
			questions: [],
			articles: [],
			url: "/article",
		};
	},
	components: {
		"article-title": ArticleTitle,
		// 'tab-bar': Tabbar
	},
	methods: {
        gotoSearch(){
            this.$router.push({
                path: '/search',
                query: {
                    active: 1
                }
            })
        },
		gotoModule(link) {
			this.$router.push(link);
		},
		setActive(index) {
            this.tagactive = index;
            this.axios.get('/queryquestion', {
                params: {
                    diseaseid: this.tagactive
                }
            })
            .then(value=>{
                
            this.questions = value.data.data
        })
		},
    },
    mounted(){
        document.body.scrollTop = 0;

        Promise.all([
            this.axios.get('/queryarticle'),
            this.axios.get('/querydisease'),
        ])
        .then(value=>{
            let articleData = value[0].data;
            let diseaseData = value[1].data;

            if(articleData.code == 0){
                this.articles = articleData.data
            }
            if(diseaseData.code == 0){
                this.keywords = diseaseData.data;
                this.tagactive = diseaseData.data[0].disease_id;
            }
            return this.axios.get('/queryquestion', {
                params: {
                    diseaseid: this.tagactive
                }
            })
        })
        .then(value=>{
            this.questions = value.data.data
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
	position: sticky;
	top: 0;
	background-color: #fff;
	z-index: 99999;
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
