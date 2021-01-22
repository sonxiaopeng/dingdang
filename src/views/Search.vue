<template>
	<div id="search">
		<div class="search-header">
			<van-search
				v-model="searchVal"
				placeholder="搜索文章/医生/医院/疾病"
				shape="round"
				show-action
			>
				<template #left-icon>
					<img src="@/assets/images/home/search-icon.png" alt="" />
				</template>
				<template #action>
					<div @click="onSearch">搜索</div>
				</template>
			</van-search>
		</div>
		<van-tabs v-model="active" color="#00c792">
			<van-tab title="文章" :name="1"></van-tab>
			<van-tab title="问题" :name="2"></van-tab>
			<van-tab title="医院" :name="3"></van-tab>
			<van-tab title="医生" :name="4"></van-tab>
		</van-tabs>
		<van-nav-bar
			left-text="历史搜索"
			@click-right="onClickRight"
			:border="false"
			v-if="historyShow"
		>
			<template #right>
				<van-icon name="delete-o" color="#646566" size="20" />
			</template>
		</van-nav-bar>
		<div class="questions-tags" v-if="historyShow">
			<van-tag
				size="large"
				v-for="(item, index) of keywords"
				:key="index"
				@click="setActive(item)"
			>
				{{ item }}
			</van-tag>
		</div>
        <div class="articles-content" v-if="active == 1">
            <article-list
                v-for="(item, index) of articles"
                :key="index"
                :title="item.subject"
                :content="item.description"
                :imgurl="item.img"
                :url="url + `?articleid=${item.article_id}`"
            ></article-list>
        </div>
        <div class="questions-content" v-if="active == 2">
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
        <div class="gospital-content">
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
	</div>
</template>

<script>
import { Toast } from 'vant';
export default {
	data() {
		return {
            tables: [],
            questions: [],
            articles: [],
			historyShow: false,
			searchVal: "",
			active: 1,
			keywords: [],
            url: "/articledetail",
		};
	},
	methods: {
		onSearch() {
			if (this.searchVal == "") {
				return false;
			}
			let historys = [];
			let historyStr = decodeURI(localStorage.getItem("serachhistory"));
			if (historyStr != "null") {
				historys = historyStr.split(",");
			}

			if (historys.length > 5) {
				historys.shift();
            }
            
            let arr = historys.filter(item=>{
                return item == this.searchVal
            })
            if(arr.length == 0){
                historys.push(this.searchVal);
            }
			localStorage.setItem(
				"serachhistory",
				encodeURI(historys.join(","))
			);
			let searchCategory = "";
			switch (this.active) {
				case 1:
					searchCategory = "article";
					break;
				case 2:
					searchCategory = "question";
					break;
				case 3:
					searchCategory = "hospital";
					break;
				case 4:
					searchCategory = "doctor";
					break;
			}
			this.axios.get(`/search/${searchCategory}`, {
				params: {
                    keyword: this.searchVal
                }
            })
            .then(value=>{
                let resData = value.data
                if(resData.code == 0){
                    if(this.active == 1){
                        this.articles =  resData.data;
                    }else if(this.active == 2){
                        this.questions =  resData.data;
                    }else if(this.active == 3){
                        this.tables =  resData.data;
                    }
                }else {
                    Toast(resData.message)
                }
                console.log(value)

            })
            .catch(reason=>{
                console.log(reason)
            })
		},
		setActive(name) {
			this.searchVal = name;
		},
		onClickRight() {
			localStorage.removeItem("serachhistory");
			this.historyShow = false;
		},
	},
	mounted() {
        this.active = parseInt(this.$route.query.active)
		if (localStorage.getItem("serachhistory")) {
			this.historyShow = true;
			this.keywords = decodeURI(
				localStorage.getItem("serachhistory")
			).split(",");
		}
	},
};
</script>

<style scoped>
#table .file p {
	line-height: 24px;
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

#search >>> .van-nav-bar__text {
	font-size: 18px;
	font-weight: 700;
}

/* 公开问题样式开始 */
#search >>> .questions-tags {
	padding: 5px 4px 20px 10px;
	display: flex;
	flex-flow: row wrap;
	align-items: center;
	border-bottom: 1px solid #eee;
}

#search >>> .van-tag {
	padding: 8px 12px;
	font-weight: 300;
	font-size: 14px;
	line-height: 16px;
	white-space: nowrap;
	text-overflow: ellipsis;
	border-radius: 2px;
	max-width: 343px;
	margin: 4px 12px 0 0;
	overflow: hidden;
	color: #4d4d4d;
	background-color: #fafafa;
}
/* 公开问题样式结束 */

/* 顶部搜索框样式开始 */
#search >>> .search-header .van-search__action {
	background-color: #00c792;
	border-radius: 17px;
	color: #fff;
	margin-left: 10px;
	padding: 0 15px;
}

#search >>> .search-header {
	width: 100%;
	box-sizing: border-box;
	max-width: 768px;
}

#search >>> .search-header .van-search {
	padding: 10px 16px;
}

#search >>> .search-header .van-search .van-search__content {
	border: 0.5px solid #d9d9d9;
	box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.05);
	background-color: #fff;
	padding-left: 15px;
}

#search >>> .search-header .van-search .van-cell {
	display: flex;
	align-items: center;
	height: 42px;
}

#search >>> .search-header .van-field__left-icon img {
	width: 22px;
	height: 22px;
	min-width: 22px;
	margin-right: 5px;
}

#search >>> .search-header .van-field__control::-webkit-input-placeholder {
	color: #999;
	font-weight: bold;
	font-size: 15px;
}
/* 顶部搜索框样式结束 */
</style>