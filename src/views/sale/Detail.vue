<template>
	<div class="main sale-detail" style="padding-bottom: 0px">
		<my-navbar title="医生信息" />
		<div class="profile">
			<!-- 医生名片 -->
			<div class="doctor">
				<div class="doctor-avatar">
					<img :src="doctorCart.avatar" />
				</div>
				<div class="doctor-container">
					<div class="doctor-info-follow">
						<div class="doctor-info">
							<h3>{{ doctorCart.nickname }}</h3>
							<div class="doctor-section-job">
								<span class="doctor-section">{{ doctorCart.office_name }}</span>
								<span class="doctor-job">{{ doctorCart.level }}</span>
							</div>
						</div>
					</div>
					<div class="doctor-hospital">
						<span class="doctor-hospital-tag">三甲</span>
						<span>{{ doctorCart.hospitalname }}</span>
					</div>
				</div>
			</div>
			<!-- 擅长方向 -->
			<div class="panel-profile">
				<div class="panel-profile-header">擅长方向</div>
				<div class="panel-profile-body">
					<div class="profile-disease">
						<div class="disease-tag" v-for="(item, index) of arr" :key="index">
							<span> {{ item }} </span>
						</div>
					</div>
				</div>
			</div>
			<!-- 个人简历 -->
			<div class="panel-profile">
				<div class="panel-profile-header">个人简历</div>
				<div class="panel-profile-body">
					<div class="profile-intro">擅长{{ doctorCart.direction }}</div>
				</div>
			</div>
			<div class="panel-profile">
				<div class="panel-profile-header">执业经历</div>
				<div class="panel-profile-body">
					<div class="profile-intro" v-html="doctorCart.experience_1"></div>
				</div>
			</div>
			<div class="panel-profile">
				<div class="panel-profile-header">医院信息</div>
				<div class="panel-profile-body">
					<div class="profile-cells">
						<div class="cell has_border">
							<div class="cell__hd">
								<img src="@/assets/img/yy.png" />
							</div>
							<div class="cell__bd">
								<h4>{{ doctorCart.hospitalname }}</h4>
								<span class="profile-hospital_tag">三甲医院</span>
								<span class="profile-hospital_tag">医保</span>
							</div>
						</div>
						<div class="cell cell_access">
							<div class="cell__hd">
								<img src="@/assets/img/phone.png" />
							</div>
							<div class="cell__bd">
								<h4>联系电话（总机）</h4>
								<span class="single-tel">{{ doctorCart.phone }}</span>
							</div>
							<van-icon class="icon" name="arrow" />
						</div>
						<div class="cell cell_access has_border" @click="gotoLocation(doctorCart.hospital_id)">
							<div class="cell__hd" style="width: 24px">
								<img src="@/assets/img/wz.png" />
							</div>
							<div class="cell__bd">
								<h4 class="text-one" :style="{ width: width }">{{ doctorCart.address }}</h4>
							</div>
							<van-icon class="icon" name="arrow" />
						</div>
					</div>
				</div>
			</div>
			<div class="second-hospital">第二执业地点：银川丁香互联网医院</div>
		</div>
	</div>
</template>
<script>
export default {
	data() {
		return {
			width: "300px",
			doctorCart: {},
            arr: [],
            doctorId: 1
		};
	},
	mounted() {
        this.width = document.documentElement.clientWidth - 70 + "px";
        this.doctorId = this.$route.query.doctorid
		this.axios.get(`/HOSPA?doctor_id=${this.doctorId}`).then((res) => {
			this.doctorCart = res.data;
			// 医生头像遍历
			let dir = this.doctorCart.direction;
			this.arr = dir.split("，");
			this.doctorCart.avatar = require("@/assets/img/" + this.doctorCart.avatar);
		});
    },
    methods: {
        gotoLocation(id){
            this.$router.push({
                path: '/hospital/hospitallocation',
                query: {
                    hospitalid: id
                }
            })
        }
    }
};
</script>
<style>
.sale-detail body {
	color: #333;
	font-size: 18px;
}
.sale-detail .profile {
	padding-bottom: 10px;
}
/* 医生名片 */
.sale-detail .doctor {
	display: flex;
	align-items: center;
	padding: 15px;
	background-color: #32b1b3;
	font-size: 13px;
	color: #fff;
	line-height: 2;
	text-align: left;
}
.sale-detail .doctor-avatar {
	flex-shrink: 0;
	width: 60px;
	height: 60px;
	margin-right: 12px;
	position: relative;
}
.sale-detail .doctor-avatar img {
	width: 100%;
	border-radius: 50%;
}
.sale-detail .doctor-container {
	flex-direction: column;
	flex-grow: 1;
}
.sale-detail .doctor-info h3 {
	font-size: 16px;
}
.sale-detail .doctor-section {
	margin-right: 5px;
}
.sale-detail .doctor-hospital-tag {
	margin-right: 6px;
	padding: 2px;
	font-size: 12px;
	background-color: #00c792;
	border-radius: 2px;
}
/* 擅长方向 */
.sale-detail .panel-profile {
	position: relative;
	margin-top: 10px;
}
.sale-detail .panel-profile .panel-profile-header {
	font-size: 16px;
	padding: 15px;
	line-height: 18px;
	text-align: left;
}
.sale-detail .panel-profile-body {
	padding-left: 15px;
}
.sale-detail .profile-disease {
	display: flex;
    flex-flow: row wrap;
}
.sale-detail .panel-profile-body .disease-tag {
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 15px;
	margin-right: 8px;
	margin-bottom: 8px;
	padding: 4px 8px;
	color: #666;
	font-size: 14px;
	line-height: 16px;
	position: relative;
}
/*个人简历  */
.sale-detail .profile-intro {
	font-size: 15px;
	line-height: 1.5;
	color: #666;
	text-align: left;
	padding: 0 15px 15.5px 0;
}
/* 医院信息 */
.sale-detail .profile-cells .has_border {
	padding-top: 9px;
	padding-bottom: 9px;
	display: flex;
}
.sale-detail .profile-cells .cell {
	padding-top: 9px;
	padding-bottom: 9px;
}
.sale-detail .cell__hd {
	width: 24px;
	height: 24px;
	margin-right: 8px;
	line-height: 22px;
}
.sale-detail .cell__hd img {
	width: 100%;
}
.sale-detail .cell__bd {
	display: flex;
}
.sale-detail .cell {
	display: flex;
	align-items: center;
}
.sale-detail .profile-cells .cell__bd h4 {
	color: #666;
	font-weight: 400;
	font-size: 15px;
	line-height: 24px;
	margin-right: 6px;
}
.sale-detail .profile-hospital_tag {
	display: inline-block;
	margin-right: 8px;
	padding: 2px 8px;
	border: 1px solid rgba(40, 183, 163, 0.3);
	border-radius: 18px;
	color: #00ad7f;
	font-size: 10px;
	line-height: 20px;
}
.sale-detail .single-tel {
	font-size: 10px;
	line-height: 24px;
	float: right;
	margin-right: 6px;
}
.sale-detail .profile .text-one {
	white-space: nowrap;
	-webkit-line-clamp: 1;
	overflow: hidden;
	word-break: break-all;
	text-overflow: ellipsis;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 320px;
	text-align: left;
}
.sale-detail .icon {
	color: #ccc;
	font-size: 10px;
	right: 0;
}
.sale-detail .profile .second-hospital {
	padding: 12px 15px;
	color: #999;
	font-size: 12px;
	line-height: 13px;
	text-align: left;
}
</style>
