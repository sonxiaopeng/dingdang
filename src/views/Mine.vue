<template>
	<div id="mine">
		<div class="body-content">
			<div class="my-header">
				<div class="my-header-content">
					<div class="avatar">
						<van-image
							round
							width="52px"
							height="52px"
							:src="require('@/assets/images/mine/avatar.jpg')"
							fit="cover"
						/>
					</div>
					<div class="personal-wrap">
						<div class="name_wrap">
							<span class="mine_header_name">温柔猪丶</span>
						</div>
					
					</div>
				</div>
				<div class="assets-item-list">
					<van-row type="flex" justify="center" gutter="50">
						<van-col span="5">
							<div><span class="assets-num">0</span></div>
							<span class="assets-key">关注医生</span>
						</van-col>
						<van-col span="5">
							<div><span class="assets-num">5</span></div>
							<span class="assets-key">医生卡</span>
						</van-col>
						<van-col span="5">
							<div><span class="assets-num">13</span></div>
							<span class="assets-key">优惠券</span>
						</van-col>
						<van-col span="5">
							<div><span class="assets-num">13</span></div>
							<span class="assets-key">收藏内容</span>
						</van-col>
					</van-row>
				</div>
				<div class="plus-wrap">
					<div class="plus-bg">
						<div class="plus-inner">
							<div class="plus-title"><span>严格质控</span><span>双重审核</span><span>专业安全</span></div>
							<!-- <div class="plus-subtitle">立即查看</div> -->
						</div>
					</div>
				</div>
			</div>
			<div class="my-order">
				<van-grid :border="false" :column-num="3">
					<van-grid-item badge="9" :icon="require('@/assets/images/mine/order_1.png')" text="我的问诊" />
					<van-grid-item badge="5" :icon="require('@/assets/images/mine/order_2.png')" text="我的处方" />
					<van-grid-item badge="0" :icon="require('@/assets/images/mine/order_3.png')" text="医师讲堂" />
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
					<van-grid-item :dot="true" :icon="require('@/assets/images/mine/activity_4.webp')" text="消息通知" />
				</van-grid>
			</div>
		</div>
		<tab-bar active="mine"></tab-bar>
	</div>
</template>

<script>
// import Tabbar from '@/components/Tabbar'
export default {
	components: {
		// 'tab-bar': Tabbar
	},
};
</script>

<style>
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

#mine .my-header .my-header-content::after {
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

#mine .mine_header_name::before {
	content: "";
	display: block;
	position: absolute;
	width: 15px;
	height: 15px;
	top: 3px;
	right: -15px;
	background: url(../assets/images/mine/badge.png) no-repeat -60px 0 / cover;
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
	color: #ccc;
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
    position: relative;
	display: flex;
	justify-content: space-between;
	width: 100%;
}

#mine .plus-wrap .plus-bg .plus-inner::after,
#mine .plus-wrap .plus-bg .plus-inner::before {
    position: absolute;
    content: '';
    display: block;
    height: 1px;
    width: 50px;
    top: 50%;
    background-color: #ccc;
}

#mine .plus-wrap .plus-bg .plus-inner::before {
    left: 15px;
}
#mine .plus-wrap .plus-bg .plus-inner::after{
    right: 15px;
}

#mine .plus-wrap .plus-bg .plus-inner .plus-title {
	/* padding-left: 85px; */
	/* background: url(../assets/images/mine/plus.png) 5px 2px/40% no-repeat; */
    text-align: center;
    flex: 1;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	height: 18px;
	line-height: 18px;
	/* margin-right: 10px; */
	position: relative;
    /* font-size: 14px; */
}

#mine .plus-wrap .plus-bg .plus-inner .plus-title span + span {
    margin-left: 15px;
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
