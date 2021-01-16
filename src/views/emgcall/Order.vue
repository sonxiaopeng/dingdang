<template>
	<div id="order" :style="{ height: bodyHeight }">
		<div class="order-desc">
			<p>
				{{symptomDesc}}
			</p>
		</div>
		<div class="order-imgbox">
			<img
				:src="`http://localhost:3000${item}`"
				v-for="(item, index) of symptomImgs"
				:key="index"
			/>
		</div>

		<div class="order-doctor">
			<div class="order-doctor-left">
				<img
					src="@/assets/images/emgcall/3357420087593450504-22.png"
					alt=""
				/>
				<div>
					<p class="tit">电话急诊</p>
					<p class="desc">三甲主治以上医生接诊</p>
				</div>
			</div>
			<div class="order-doctor-price">
				¥69/15分钟
			</div>
		</div>
		<van-cell title="优惠方式" value="无可用优惠券" size="large">
			<template #right-icon>
				<van-icon name="arrow" color="#ccc" />
			</template>
		</van-cell>
		<van-cell
			title="响应时间"
			value="5分钟内响应，超10分钟退款"
			size="large"
		/>
		<van-cell value="187****0264" size="large">
			<template #title>
				<span class="custom-title">接听手机</span>
				<img
					id="tag"
					src="@/assets/images/emgcall/3406828489423469921-22.png"
					alt=""
				/>
			</template>
			<template #right-icon>
				<van-icon name="arrow" color="#ccc" />
			</template>
		</van-cell>
		<div class="order-readme">
			<div class="tit">买前必读</div>
			<div class="desc">
				1、医生将使用平台虚拟号「170 7907
				2149」拨打您的电话，请确保您的电话畅通。
				<br />
				2、未接通或通话失败全额退款，如通话意外中断医生会再次拨打您的电话。
			</div>
		</div>
		<div class="order-agree">
			<van-icon
				name="checked"
				:class="{ active: iconActive }"
				@click="isCheck"
			/>
			我确认遵守
			<span @click="showPopup">问诊协议</span>
		</div>

		<div class="check-btn" @click="gotoPay">
			<div>
				<div class="check-left">
					<div>
						合计：
						<span>￥69</span>
					</div>
					<div>(含2次免费追问机会)</div>
				</div>
				<div class="check-right">
					立即支付
				</div>
			</div>
		</div>
		<van-popup v-model="show">
			<div class="popup">
				<div class="tit">问诊协议</div>
				<div class="content">
					<div>
						请确认本次问诊为复诊，并提供相关检查资料，便于医生准确判断
					</div>
					<div>
						医生的回复仅为建议，重大疾病或紧急情况请及时前往医院就诊
					</div>
					<div>
						图文问诊在提问后有两次追问机会，需在医生回复后的24小时内追问，逾期则问题关闭
					</div>
				</div>
				<div class="btn" @click="closePopup">我知道了</div>
			</div>
		</van-popup>
	</div>
</template>

<script>
import { Toast } from "vant";
export default {
	data() {
		return {
            symptomDesc: '',
			show: false,
			iconActive: false,
			bodyHeight: "500px",
			symptomImgs: [
                '/0ef34df0-57b7-11eb-b6d3-d18fba8bdd96.jpg'
            ],
		};
	},
	methods: {
        closePopup(){
            this.show = false;
        },
		showPopup() {
			this.show = true;
		},
		isCheck() {
			this.iconActive = !this.iconActive;
		},
		gotoPay() {
			if (!this.iconActive) {
				Toast({
					message: "请确认遵守问诊协议",
					position: "middle",
				});
			}
		},
	},
	mounted() {
        this.bodyHeight = document.documentElement.clientHeight - 50 + "px";
        this.axios.get('/emgcall/getsymptom', {
            params: {
                userid: this.$store.state.userInfo.user_id
            }
        })
        .then(res=>{
            this.symptomDesc = res.data.data.description
            this.symptomImgs = res.data.data.images.split(',')
        })
        
	},
};
</script>

<style scoped>
#order .popup .content > div::before {
	position: absolute;
	top: 4px;
	left: 0px;
	content: "\F02F";
	font: normal normal normal 14px/1 "vant-icon";
}

#order .popup .content > div {
	margin-bottom: 14px;
	position: relative;
	padding-left: 27px;
}

#order .popup .btn {
	margin-top: 40px;
	padding: 12px 0;
	color: #fff;
	font-size: 18px;
	line-height: 30px;
	text-align: center;
	background: #00c792;
	border-radius: 4px;
}

#order .popup .content {
	margin: 20px 0 40px;
	color: #666;
	font-size: 16px;
	line-height: 24px;
}

#order .popup .tit {
	color: #333;
	font-weight: 500;
	font-size: 24px;
	text-align: center;
}

#order .popup {
	box-sizing: border-box;
	min-width: 325px;
	padding: 40px 30px;
}
#order .order-agree span {
	color: #00c792;
}

#order .order-agree .van-icon.active {
	color: #00c792;
}

#order .order-agree .van-icon {
	font-size: 12px;
	line-height: 1.5;
}

#order .order-agree {
	margin: 15px 16px;
	color: #999;
	font-size: 12px;
	line-height: 1.5;
	box-sizing: border-box;
}

#order .order-readme .desc {
	margin-top: 8px;
	font-weight: 300;
	font-size: 12px;
	line-height: 18px;
}

#order .order-readme .tit {
	font-size: 12px;
	line-height: 14px;
}

#order .order-readme {
	margin: 15px 16px;
	color: #999;
}

#order .check-btn .check-right {
	flex: 6;
	text-align: center;
	color: #fff;
	font-size: 16px;
	line-height: 50px;
	background-color: #00c792;
}

#order .check-btn .check-left > div + div {
	color: #999;
	font-size: 12px;
	line-height: 1.17;
}

#order .check-btn .check-left > div > span {
	color: #00c792;
	font-weight: 500;
}

#order .check-btn .check-left > div {
	color: #666;
	font-size: 16px;
	line-height: 1.13;
	text-align: center;
}

#order .check-btn .check-left {
	flex: 3;
}

#order .check-btn > div {
	display: flex;
	align-items: center;
}

#order .check-btn {
	position: fixed;
	bottom: 0;
	width: 100%;
	max-width: 768px;
    background-color: #fff;
}

#order #tag {
	position: absolute;
	top: 3px;
	left: 70px;
	width: 47px;
	height: 16px;
}

#order .van-cell {
	padding: 20px 16px;
}

#order .van-cell .van-icon {
	line-height: 24px;
}

#order .van-cell__title {
	flex: 2;
	position: relative;
}

#order .van-cell__value {
	flex: 3;
}

#order .order-doctor .order-doctor-left div p.desc {
	margin: 0;
	margin-top: 10px;
	color: #666;
	font-weight: 300;
	font-size: 13px;
	line-height: 15px;
}

#order .order-doctor .order-doctor-left div p.tit {
	color: #333;
	font-size: 16px;
	line-height: 18px;
	margin: 0;
}

#order .order-doctor .order-doctor-left img {
	width: 36px;
	height: 36px;
	border: 0.5px solid rgba(0, 0, 0, 0.05);
	border-radius: 18px;
	margin-right: 10px;
}

#order .order-doctor .order-doctor-left {
	display: flex;
	align-items: center;
}

#order .order-doctor .order-doctor-price {
	color: #00c792;
	font-weight: 500;
	font-size: 15px;
}

#order .order-doctor::after {
	position: absolute;
	content: "";
	display: block;
	height: 1px;
	bottom: 0;
	left: 20px;
	right: 20px;
	background-color: #ebedf0;
	transform: scaleY(0.5);
}

#order .order-doctor {
	padding: 20px 16px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: relative;
	background-color: #fff;
}

#order .order-imgbox::-webkit-scrollbar {
	width: 0px;
	height: 0px;
}

#order .order-imgbox img {
	width: 50px;
	height: 50px;
	-o-object-fit: cover;
	object-fit: cover;
	margin-right: 8px;
}

#order .order-imgbox {
	padding: 12px 16px;
	overflow-y: scroll;
	white-space: nowrap;
	border-bottom: 10px solid #f4f4f4;
	background-color: #fff;
}

#order .order-desc {
	padding: 15px 16px;
	color: #666;
	font-size: 15px;
	position: relative;
	background-color: #fff;
    min-height: 22px;
}

#order .order-desc p {
	display: -webkit-box;
	overflow: hidden;
	line-height: 22px;
	word-break: break-all;
	text-overflow: ellipsis;
	max-height: 44px;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
	margin: 0;
}

#order .order-desc::after {
	content: "";
	display: block;
	height: 1px;
	background-color: #ebebeb;
	position: absolute;
	bottom: 0px;
	left: 16px;
	right: 16px;
	z-index: 10;
	transform: scaleY(0.5);
}

#order {
	background-color: #f4f4f4;
    padding-bottom: 50px;
}
</style>



