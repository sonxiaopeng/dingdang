<template>
	<div id="mine">
        <my-navbar title="个人中心"></my-navbar>
		<div class="body-content">
			<div class="my-header">
				<div class="my-header-content">
					<div class="avatar">
						<van-image
							round
							width="52px"
							height="52px"
							:src="`http://localhost:3000/${userInfo.avatar}`"
							fit="cover"
							v-if="userInfo"
							@click="imagePreview(userInfo.avatar)"
						/>
						<van-image
							round
							width="52px"
							height="52px"
							:src="`http://localhost:3000/default-avatar.png`"
							fit="cover"
							v-else
						/>
					</div>
					<div class="personal-wrap" v-if="userInfo">
						<div class="name_wrap">
							<span class="mine_header_name">{{ userInfo.nickname }}</span>
						</div>
					</div>
					<div class="personal-wrap" v-else @click="goLogin">
						<div class="name_wrap">
							<span class="mine_header_name">登录/注册</span>
						</div>
					</div>
					<div class="setting" @click="gotoSetting"></div>
				</div>
				<div class="assets-item-list">
					<van-row type="flex" justify="center" gutter="50">
						<van-col span="5" @click="gotoFollows">
							<div>
								<span class="assets-num">{{ follows }}</span>
							</div>
							<span class="assets-key">关注医生</span>
						</van-col>
						<van-col span="5">
							<div><span class="assets-num">0</span></div>
							<span class="assets-key">医生卡</span>
						</van-col>
						<van-col span="5">
							<div><span class="assets-num">0</span></div>
							<span class="assets-key">优惠券</span>
						</van-col>
						<van-col span="5" @click="gotoStars">
							<div><span class="assets-num">{{stars}}</span></div>
							<span class="assets-key">收藏内容</span>
						</van-col>
					</van-row>
				</div>
				<div class="plus-wrap">
					<div class="plus-bg">
						<div class="plus-inner">
							<div class="plus-title">叮当会员 · 优选医生免费问</div>
							<div class="plus-subtitle">立即开通</div>
						</div>
					</div>
				</div>
			</div>
			<div class="my-order">
				<van-grid :border="false" :column-num="3">
					<van-grid-item
						:badge="orders"
						:icon="require('@/assets/images/mine/order_1.png')"
						text="我的问诊"
						@click="gotoMyAsk"
                        v-if="orders > 0"
					/>
					<van-grid-item
						:icon="require('@/assets/images/mine/order_1.png')"
						text="我的问诊"
						@click="gotoMyAsk"
                        v-else
					/>
					<van-grid-item :icon="require('@/assets/images/mine/order_2.png')" text="我的处方" />
					<van-grid-item :icon="require('@/assets/images/mine/order_3.png')" text="药品订单" />
				</van-grid>
			</div>
			<!-- <div class="my-assets">
				<van-grid :border="false" :column-num="5">
					<van-grid-item>
						<div class="my-assets-num">0</div>
						<div>优惠券</div>
					</van-grid-item>
					<van-grid-item>
						<div class="my-assets-num">1万+</div>
						<div>白条额度</div>
					</van-grid-item>
					<van-grid-item>
						<div class="my-assets-num">357</div>
						<div>京豆</div>
					</van-grid-item>
					<van-grid-item>
						<div class="my-assets-num">0</div>
						<div>红包</div>
					</van-grid-item>
					<van-grid-item :icon="require('@/assets/images/mine/assets.png')" text="我的资产" />
				</van-grid>
			</div> -->
			<div class="activity-wrap">
				<div class="activity-title">工具与服务</div>
				<van-grid :border="false">
					<van-grid-item :icon="require('@/assets/images/mine/activity_1.webp')" text="联系客服" />
					<van-grid-item :icon="require('@/assets/images/mine/activity_2.webp')" text="私人医生" />
					<van-grid-item :icon="require('@/assets/images/mine/activity_3.webp')" text="患者信息" />
					<van-grid-item :icon="require('@/assets/images/mine/activity_4.webp')" text="消息通知" />
				</van-grid>
			</div>
		</div>
		<van-image width="375" height="143" :src="require('@/assets/last-title.png')" />
		<tab-bar tabbarActive="mine"></tab-bar>
	</div>
</template>

<script>
// import Tabbar from '@/components/Tabbar'
import { mapState } from "vuex";
import { Dialog, ImagePreview } from "vant";
export default {
	data() {
		return {
			orders: 0,
            follows: 0,
            stars: 0
		};
	},
	computed: {
		...mapState(["userInfo"]),
    },
	methods: {
		imagePreview(url) {
			ImagePreview({
                images: [`http://localhost:3000/${url}`],
                showIndex: false
			});
        },
        gotoStars(){
			this.$router.push("/mystars");
        },
		gotoFollows() {
			this.$router.push("/myfollows");
		},
		gotoMyAsk() {
			this.$router.push("/myask");
		},
		goLogin() {
			this.$router.push("/login");
		},
		gotoSetting() {
			if (this.userInfo) {
				this.$router.push("/setting");
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
	components: {
		// 'tab-bar': Tabbar
	},
	mounted() {
        window.scrollTo(0, 0)
        if (this.userInfo) {
            Promise.all([
			this.axios("/getordernum", {
				params: {
					userid: this.userInfo.user_id,
				},
			}),
			this.axios.get("/getfollownum", {
				params: {
					userid: this.userInfo.user_id,
				},
			}),
			this.axios.get("/getstarnum", {
				params: {
					userid: this.userInfo.user_id,
				},
			}),
		]).then((res) => {
			let askMsg = res[0].data;
			let followMsg = res[1].data;
			let starMsg = res[2].data;
			if (askMsg.code == 0) {
				this.orders = askMsg.data.num;
			} else {
				console.log(askMsg.message);
			}
			if (followMsg.code == 0) {
				this.follows = followMsg.data.num;
			} else {
				console.log(followMsg.message);
			}
			if (starMsg.code == 0) {
				this.stars = starMsg.data.num;
			} else {
				console.log(starMsg.message);
			}
		}).catch(reason=>{console.log(reason)})

        }
		
	},
};
</script>

<style scoped>
#mine .mint-header {
	background-color: #fff;
	color: black;
}
#mine .my-header {
	width: 100%;
	background: url(../assets/images/mine/my_header.png) no-repeat scroll 0 0 / cover;
	box-sizing: border-box;
	padding-top: 12px;
	padding-bottom: 10px;
}

#mine .my-header .my-header-content {
	padding: 0 0 18px 18px;
	display: flex;
	position: relative;
}

#mine .my-header .my-header-content .setting {
	content: "";
	display: block;
	width: 25px;
	height: 25px;
	position: absolute;
	top: 5px;
	right: 10px;
	background: url(../assets/images/mine/setting.png) 0 0/100% 100% no-repeat;
}

#mine .my-header .avatar {
	border: 1px solid #fff;
	border-radius: 50%;
	flex-shrink: 0;
	height: 52px;
}

#mine .my-header .personal-wrap {
	padding-left: 15px;
	display: flex;
	align-items: center;
}

#mine .mine_header_name {
	font-size: 18px;
	color: #fff;
	text-shadow: 1px 1px 1px #8a8a8a;
	position: relative;
}

#mine .my-header .assets-item-list {
	padding: 0 14px;
	text-align: center;
	font-size: 14px;
	color: #fff;
}

#mine .my-header .assets-item-list .van-col.van-col--5 {
	padding: 10px !important;
}

#mine .my-header .assets-item-list .assets-key {
	line-height: 34px;
	font-size: 12px;
}
#mine .my-header .assets-item-list .assets-num {
	font-weight: 700;
	font-size: 16px;
}

#mine .plus-wrap {
	height: 42px;
	margin-top: 6px;
	box-sizing: border-box;
	color: #ffe678;
	font-size: 12px;
	padding: 0 18px;
}

#mine .plus-wrap .plus-bg {
	padding: 0 10px;
	background: url(../assets/images/mine/plus-bg.png) 0 0 / cover no-repeat;
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	display: flex;
	flex-flow: row nowrap;
	align-items: center;
}

#mine .plus-wrap .plus-bg .plus-inner {
	display: flex;
	justify-content: space-between;
	width: 100%;
}

#mine .plus-wrap .plus-bg .plus-inner .plus-title {
	padding-left: 35px;
	background: url(../assets/images/mine/plus.png) 10px 0px/20px no-repeat;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	height: 18px;
	line-height: 18px;
	margin-right: 10px;
	position: relative;
}

/* #mine .plus-wrap .plus-bg .plus-inner .plus-title::before {
	position: absolute;
	content: "";
	width: 1px;
	height: 7px;
	background: #ffe678;
	left: 77px;
	top: 5px;
} */

#mine .plus-wrap .plus-bg .plus-inner .plus-subtitle {
	border-radius: 9px;
	background-image: linear-gradient(-50deg, #ffe36f, #f6d44e);
	color: #262626;
	font-size: 11px;
	line-height: 18px;
	padding: 0 10px;
	height: 18px;
	position: relative;
}

#mine .plus-wrap .plus-bg .plus-inner .plus-subtitle::after {
	content: "";
	display: inline-block;
	vertical-align: middle;
	border-left: 3px solid #262626;
	border-top: 3px solid transparent;
	border-bottom: 3px solid transparent;
	margin-left: 4px;
	margin-bottom: 2px;
}

#mine .body-content {
	background-color: #f7f7f7;
}

#mine .my-order {
	margin-top: -10px;
	margin-bottom: 15px;
	padding-top: 10px;
	border-radius: 12px;
	background-color: #fff;
	overflow: hidden;
}

#mine .my-assets {
	border-radius: 12px;
	overflow: hidden;
}

#mine .my-assets .my-assets-num {
	height: 35px;
	line-height: 35px;
	color: #262626;
	font-weight: 700;
	white-space: nowrap;
	text-align: center;
}

#mine .my-assets .my-assets-num + div {
	margin-top: 8px;
	color: #646566;
	font-size: 12px;
	line-height: 1.5;
	word-break: break-all;
}

#mine .activity-wrap {
	margin: 15px 0;
	background-color: #fff;
	border-radius: 12px;
	overflow: hidden;
	padding: 12px 15px;
}

.activity-title {
	font-size: 14px;
	color: #2e2d2d;
	height: 38px;
	line-height: 38px;
	font-weight: 700;
	padding-left: 10px;
	border-bottom: 1px solid #f2f2f2;
}
</style>
