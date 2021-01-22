<template>
	<div id="consult-detail">
		<!-- 导航开始 -->
		<van-nav-bar
			class="header"
			:title="titleName"
			left-arrow
			fixed
			placeholder
			@click-left="onClickLeft"
		>
			<template #left>
				<van-icon
					name="arrow-left"
					size="25"
					color="#333029"
				></van-icon>
			</template>
		</van-nav-bar>
		<!-- 导航结束 -->
		<template v-if="visible == true">
			<!-- 介绍开始 -->
			<div class="introduce">
				<h1>{{ article.name }}</h1>
				<h3>就诊科室：儿科</h3>
				<p>
					词条作者<img src="../assets/img/img1.png" /><span
						>叮当医生医学团队</span
					>
				</p>
				<p>
					审核专家<img src="../assets/img/img2.jpg" /><span
						>吴菲菲 小儿内科 医师</span
					>
				</p>
				<div>
					<p>发布时间 2018年01月13日</p>
					<p>最后修订时间 2020年06月04日</p>
				</div>
			</div>
			<!-- 介绍结束 -->

			<!-- 标签页开始 -->
			<van-tabs
				c
				v-model="active"
				color="#00c792"
				title-active-color="#00c792"
				scrollspy
				sticky
				offset-top="46px"
			>
				<img style="width:100%" src="../assets/img/img4.png" />
				<van-tab
					class="tab-style"
					v-for="(item, index) in article.description"
					:title="item.title"
					v-html="'<h1>' + item.title + '</h1>' + item.detail"
					:key="index"
				>
					内容
				</van-tab>
				<!-- 就诊布局开始 -->
				<van-tab v-if="close == true" class="tab-style" title="就诊">
					<h1>就诊</h1>
					<h2>推荐医生</h2>
					<!-- 医生信息开始 -->
					<div>
						<van-row type="flex" class="doctor">
							<van-col span="4">
								<div class="doctor_left">
									<van-image
										width="54px"
										height="54px"
										radius="3px"
										fit="cover"
										:src="require(`@/assets/img/10.jpg`)"
									/>
								</div>
							</van-col>
							<van-col span="20">
								<div class="doctor_right" @click="goToDetail">
									<p>
										王铁锋<span>副主任医师</span
										><van-tag type="warning">三甲</van-tag>
									</p>
									<p class="van-ellipsis">
										儿科 北京医院
									</p>
									<div class="van-multi-ellipsis--l2">
										<span>擅长：</span>
										<span> 新生儿及儿童常见疾病诊治、</span>
										<span>危重新生儿救治、</span>
										<span>小儿支气管肺炎、</span>
										<span>注意缺陷多动障碍、</span>
										<span>抽动症、</span>
										<span>癫痫</span>
									</div>
									<div>
										<span style="color:#FAA700;"
											><img src="" />4.98</span
										>
										<span class="span_ml">月回答152</span>
										<span class="span_ml">月处方308</span>
										<span class="span_ml">44分钟响应</span
										><br />
										<span style="color:#FAA700;"
											>从业10年以上</span
										>
									</div>
								</div>
							</van-col>
						</van-row>
					</div>
					<!-- 医生信息结束 -->
					<!-- 药品开始 -->
					<div>
						<h2>推荐药品</h2>
						<div class="treat">
							<p>右旋布洛芬栓 (山西泽圣堂)</p>
							<span>山西迈迪制药有限公司</span>
						</div>
						<h2>推荐科室</h2>
						<p>儿科</p>
						<div class="treat">
							<p>首都医科大学附属北京儿童医院</p>
							<span>北京市西城区南礼士路56号</span>
						</div>
					</div>
					<!-- 药品结束 -->
				</van-tab>
				<!-- 就诊布局结束 -->
			</van-tabs>
			<!-- 标签页结束 -->
		</template>
		<img v-else src="/img/NO_DATA.png" id="no-data" :style="{height: '200px', width: '200px', margin: '100px auto', display: 'block'}" />
	</div>
</template>
<style scoped>
#consult-detail {
	text-align: center;
}



/* 导航页样式 */
.header >>> .van-nav-bar__title {
	font-size: 20px;
	font-weight: 800;
}
/* 介绍div样式 */
.introduce {
	padding: 20px 16px 0;
	text-align: left;
}
.introduce > h1 {
	font-size: 20px;
	font-weight: 800;
}
.introduce > h3 {
	margin: 20px 0 12px 0;
	font-size: 14px;
	font-weight: 300;
	line-height: 16px;
	color: #666;
	margin-bottom: 12px;
}
.introduce > p {
	font-size: 12px;
	line-height: 14px;
	color: #b38c3e;
	padding: 2px;
	border-radius: 2px;
	background-color: #fffaf0;
	margin-right: 14px;
	flex-shrink: 0;
}
.introduce > p > span {
	font-size: 12px;
	line-height: 16px;
	color: grey;
}
.introduce img {
	width: 16;
	height: 16px;
	margin: 0 8px 0 14px;
}
.introduce > div > p {
	display: inline-block;
	color: #b3b3b3;
	font-size: 12px;
	line-height: 11px;
	/* 字体靠边 */
	-webkit-transform-origin-x: 0;
	/* 字体缩放 */
	transform: scale(0.83);
}
/* 标签页的样式 */

.tab-style {
	text-align: left;
	color: #333;
	padding: 10px 16px 0;
}
.tab-style >>> img {
	width: 100%;
}
.tab-style >>> h1 {
	text-align: left;
	font-size: 26px;
	font-weight: 600;
	line-height: 37px;
}
.tab-style >>> h2 {
	margin-top: 30px;
	font-size: 20px;
	font-weight: 600;
	line-height: 30px;
	padding-bottom: 10px;
}
.tab-style >>> p {
	margin-top: 10px;
	font-size: 17px;
	font-weight: 300;
	line-height: 30px;
}
.tab-style >>> strong {
	font-weight: bold;
}
.tab-style >>> li {
	margin-top: 10px;
	font-size: 17px;
	font-weight: 300;
	line-height: 30px;
}
.tab-style >>> ul > li {
	list-style: inside disc;
}
.tab-style >>> li p:first-child {
	display: inline;
}
.tab-style >>> ol > li {
	list-style: inside decimal;
}
/* 就诊样式*/
.doctor {
	padding: 20px 0;
}
.doctor p {
	margin: 0px;
	padding: 0;
}
.doctor_right {
	margin-left: 5px;
}
.doctor_right > p {
	color: #333;
	font-size: 14px;
	font-weight: 500;
	line-height: 20px;
}
.doctor_right > p:first-child {
	font-size: 17px;
}
.doctor_right > p > span {
	font-size: 14px;
	margin: 10px;
}
.doctor_right > div {
	margin-top: 5px;
}
.doctor_right > div > span {
	display: inline-block;
	color: #4d4d4d;
	font-weight: 300;
	font-size: 13px;
	line-height: 20px;
	overflow: hidden;
}
.span_ml {
	margin-left: 10px;
}
/* 推荐药品样式 */
.treat span {
	font-size: 13px;
	line-height: 15px;
	margin-top: 10px;
	color: #999;
	font-weight: 300;
}
</style>
<script>
export default {
	data() {
		return {
			visible: false, //如果没有文章则所有内容不再显示
			active: 0,
			titleName: "", //导航标题
			article: [], //文章数据
			close: false,
		};
	},
	methods: {
        goToDetail(){
            this.$router.push(`/question/doctor/10`)
        },
		onClickLeft() {
			// 跳转到上一页
			this.$router.go(-1);
		},
		//滚动事件
		onScroll() {
			let scr = document.documentElement.scrollTop;
			if (scr >= 100) {
				this.titleName = this.article.name;
			} else {
				this.titleName = "";
			}
		},
	},
	mounted() {
		// 获取疾病id，并存入Vuex
		let id = this.$route.params.id;
		this.$store.commit("diseaseId", id);

		// 滚动事件监听
		window.addEventListener("scroll", this.onScroll); // 监听（绑定）滚轮滚动事件
		//添加获取文章事件
		this.axios
			.get(`/yyy?disease_id=${this.$store.state.disease_id}`)
			.then(res => {
				// 判断是否有文章数据
				if (res.data.code == 1) {
					// 没有数据不显示页面
					this.titleName = "暂时没有相关文章😥！";
					this.visible = false;
				} else {
					this.visible = true; //显示文章数据
					//有数据输出内容
					this.article = res.data.data;
					if (this.article.description.length >= 7) {
						this.close = true;
					} else {
						this.close = false;
					}
				}
			});
	},
};
</script>
