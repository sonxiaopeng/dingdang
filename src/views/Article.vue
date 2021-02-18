<template>
	<div class="article-detail">
		<!-- 导航头部开始 -->
		<my-navbar title="文章详情"></my-navbar>
		<!-- 导航头部结束 -->

		<div class="article-title">
			{{ articleDetails.subject }}
		</div>

		<!-- 文章盒子开始 -->
		<div class="article" v-html="articleDetails.content" v-if="hasContent"></div>
        <no-data msg="暂无文章数据" v-else></no-data>
		<!-- 文章盒子结束 -->
		<div class="star" @click="toggleStar">
			<van-icon size="20px" name="star-o" v-if="!isStarted" />
			<van-icon size="20px" color="#00c792" name="star" v-else />
		</div>
	</div>
</template>
<script>
import { Dialog } from "vant";
export default {
	data() {
		return {
            hasContent: true,
			isStarted: false,
			articleDetails: {},
		};
	},
	mounted() {
		// 获取路由传递的参数发送请求获取对应文章id的数据请求地址
		let val = this.$route.params.id;
		this.axios
			.get("/articleData", {
				params: {
					id: val,
				},
			})
			.then(result => {
                this.articleDetails = result.data.data[0];
                if(this.articleDetails.content == '空'){
                    this.hasContent = false
                }
			});
		if (this.$store.state.userInfo) {
			this.axios
				.get(
					`/queryisstared?articleid=${this.$route.params.id}&userid=${this.$store.state.userInfo.user_id}`
				)
				.then(res => {
					if (res.data.data.num > 0) {
						this.isStarted = true;
					}
				});
		}
	},
	methods: {
		toggleStar() {
			if (this.$store.state.userInfo) {
				if (this.isStarted) {
					this.axios
						.post("/canclestar", {
							articleid: parseInt(this.$route.params.id),
							userid: this.$store.state.userInfo.user_id,
						})
						.then(res => {
							if (res.data.code == 0) {
								this.$toast(res.data.message);
							}
						})
						.catch(reason => console.log(reason));
				} else {
					this.axios
						.post("/gotostar", {
							articleid: parseInt(this.$route.params.id),
							userid: this.$store.state.userInfo.user_id,
						})
						.then(res => {
							if (res.data.code == 0) {
								this.$toast(res.data.message);
							}
						})
						.catch(reason => console.log(reason));
				}
				this.isStarted = !this.isStarted;
			} else {
				Dialog.confirm({
					title: "未登录",
					message: "是否前往登录？",
				})
					.then(() => {
						this.$router.push("/login");
					})
					.catch(() => {
						// on cancel
					});
			}
		},
	},
};
</script>

<style scoped>
.article-detail .star {
	position: absolute;
	top: 10px;
	right: 20px;
	z-index: 999;
}

.article-detail .article-title {
	padding: 10px;
	color: #333;
	font-size: 26px;
	font-weight: 600;
	line-height: 1.5;
}

.article-detail .article >>> p span {
	font-size: 14px;
}

.article-detail .article >>> p {
	margin-top: 10px;
	font-weight: 300;
	line-height: 30px;
	margin-top: 10px;
	font-size: 17px;
}
.article-detail .article >>> h2 {
	font-size: 20px;
	font-weight: 700;
	margin: 10px 0;
}

.article-detail .article >>> img {
	width: 100%;
	border-radius: 5px;
	margin: 10px 0;
}
.article-detail .article {
	padding: 0 15px;
	text-align: left;
	overflow: auto;
	color: #333;
	font-weight: 300;
	font-size: 12px;
	line-height: 32px;
	word-break: break-word;
}
</style>
