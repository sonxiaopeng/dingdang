<template>
	<div id="qs-doctor">
		<van-nav-bar
			fixed
			placeholder
			title="医生详情"
			left-arrow
			@click-left="onClickLeft"
		    ></van-nav-bar>
		<div>
			<!-- 医生头部简介开始 -->
			<div class="doctor-card">
				<div>
					<!-- 医生简介 -->
					<div class="doctor-introduction">
						<div
							style="margin-bottom:32px;font-weight:600;font-size:30px"
						>
							{{ doctor.nickname }}
						</div>

						<div style="margin-bottom:6px">
							<span style="margin-right:6px">{{
								doctor.office_name
							}}</span>
							<span>{{ doctor.d_level }}</span>
						</div>

						<div>
							<span
								style="margin-right:6px;padding:2px;color:grey;font-size:12px;border-radius:2px;background-color:#ebebeb;"
								>三甲</span
							>
							<span>{{ doctor.hospitalname }}</span>
						</div>
					</div>
					<!-- 医生头像 -->
					<div class="doctor-avatar">
						<div @click="imagePreview(doctor.avatar)">
							<img
								:src="require(`../assets/img/${doctor.avatar}`)"
							/>
						</div>
                        <div @click="toggleFollow">
                            <div v-if="!isFollowed">关注</div>
                            <div v-else style="color: #666">取消关注</div>
                        </div>
					</div>
					<!-- 医生特长 -->
					<div class="doctor-description" @click="gotoDoctorMsg">
						{{ doctor.description }}
					</div>
				</div>
			</div>
			<!-- 医生头部简介结束 -->
			<!-- 医生评价开始 -->
			<div class="doctor-info">
				<div style="margin-right:16px">
					<div style="display: inline-block">
						<van-icon
							name="star"
							size="17px"
							color="#fa0"
						></van-icon>
					</div>
					<span
						style="margin-left:2px;color:#fa0;font-weight:600;font-size:20px"
					>
						{{doctor.star}}
					</span>
				</div>
				<div style="margin-right:16px" class="doctor-info-item">
					<span style="">{{ doctor.respond }}</span>
					<span>分钟响应</span>
				</div>
				<div style="margin-right:16px" class="doctor-info-item">
					<span>{{ doctor.answer }}</span>
					<span>月回答</span>
				</div>
				<div class="doctor-info-item">
					<span>{{ doctor.prescription }}</span>
					<span>月处方</span>
				</div>
			</div>
			<!-- 医生评价结束 -->
			<!-- 开处方 -->
			<div class="doctor-tag">
				<div>
					可开处方
				</div>
			</div>
			<!-- 擅长方向 患者提问开始 -->
			<div class="profile-questions">
				<div class="profile-title">擅长方向</div>
				<div class="question-tab">
					<div
						class="question-tab-item"
						v-for="(direction, index) of directions"
						:key="index"
					>
						{{ direction }}
					</div>
				</div>
				<div
					class="public-question"
					v-for="(article, index) of articles"
					:key="index"
				>
					<div class="public-question-title">
						<div style="width:20px;height:20px">
							<img
								:src="`http://localhost:3000/${article.avatar}`"
								style="width:100%"
							/>
						</div>
						<span style="margin-left:6px">{{
							article.nickname | nicknameFormat
						}}</span>
					</div>
					<div
						class="public-question-content"
						v-html="article.content"
					></div>
					<div class="public-question-time">
						<span style="margin-right:12px">{{
							article.create_at | dateFormat
						}}</span>
					</div>
				</div>
				<div>
					<div class="profile-more" @click="onMore">
						更多问题
					</div>
				</div>
			</div>
			<!-- 擅长方向 患者提问结束 -->
			<!-- 患者评价开始 -->
			<div class="profile-title">
				患者评价
			</div>
			<div
				class="comment"
				v-for="(comment, index) of comments"
				:key="index"
			>
				<div class="comment-title">
					<span style="margin-right:10px">d***e</span>
					<div class="vux-rater">
						<van-icon
							name="star"
							size="10px"
							color="#fa0"
							style="margin-right:2px"
						></van-icon>
						<van-icon
							name="star"
							size="10px"
							color="#fa0"
							style="margin-right:2px"
						></van-icon>
						<van-icon
							name="star"
							size="10px"
							color="#fa0"
							style="margin-right:2px"
						></van-icon>
						<van-icon
							name="star"
							size="10px"
							color="#fa0"
							style="margin-right:2px"
						></van-icon>
						<van-icon
							name="star"
							size="10px"
							color="#fa0"
							style="margin-right:2px"
						></van-icon>
					</div>
				</div>
				<div class="comment-content">{{ comment.content }}</div>
				<div class="comment-time">
					{{ comment.create_at | dateFormat }}
				</div>
			</div>
			<!-- 患者评价结束 -->

			<!-- 更多评价按钮 -->
			<div style="margin:20px 0 40px;text-align:center">
				<div class="profile-more">更多评价</div>
			</div>
			<div style="height:50px"></div>
			<!-- 提问按钮 -->
			<div class="profile-bottom" @click="gotoask"> 
				<div class="profile-bottom-btn">
					<div>
						向{{ doctor.nickname }}医生提问（￥{{
							doctor.ask_price
						}}）
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<style >
#qs-doctor .doctor-avatar img {
    width: 100%;
}


#qs-doctor .profile-bottom-btn > div {
	color: #fff;
	font-size: 16px;
	line-height: 50px;
	text-align: center;
	width: 100%;
}
#qs-doctor .profile-bottom-btn {
	display: flex;
	max-width: 768px;
	height: 50px;
	color: #fff;
	font-size: 1.6rem;
	line-height: 50px;
	text-align: center;
	background-color: #00c792;
}
#qs-doctor .profile-bottom {
	position: fixed;
	bottom: 0;
	width: 100%;
	max-width: 768px;
}
#qs-doctor .comment::after {
	position: absolute;
	right: 16px;
	bottom: 0;
	left: 16px;
	box-sizing: border-box;
	height: 1px;
	background-color: #ebebeb;
	transform: scaleY(0.5);
	content: "";
}
#qs-doctor .comment-time {
	margin-top: 12px;
	color: #999;
	font-weight: 300;
	font-size: 12px;
	line-height: 1.17;
}
#qs-doctor .comment-content {
	overflow: hidden;
	word-break: break-all;
	margin-top: 12px;
	color: #4d4d4d;
	font-weight: 300;
	font-size: 16px;
	line-height: 1.5;
}
#qs-doctor .vux-rater {
	display: inline-block;
	line-height: normal;
	text-align: left;
}
#qs-doctor .comment-title {
	color: #333;
	font-weight: 500;
	font-size: 17px;
	line-height: 1.12;
}
#qs-doctor .comment {
	padding: 20px 16px;
	background-color: #fff;
	position: relative;
}
#qs-doctor .profile-more::after {
	position: absolute;
	content: "";
	top: -50%;
	right: -50%;
	bottom: -50%;
	left: -50%;
	background-color: rgba(0, 0, 0, 0);
	border: 1px solid #ebebeb;
	border-radius: 27px;
	transform: scale(0.5);
}
#qs-doctor .profile-more {
	display: inline-block;
	padding: 6px 12px;
	color: #00c792;
	font-weight: 500;
	font-size: 13px;
	line-height: 1.15;
	background-color: #f5f5f5;
	border-radius: 27px;
	position: relative;
}
#qs-doctor .public-question::after {
	position: absolute;
	right: 16px;
	bottom: 0;
	left: 16px;
	box-sizing: border-box;
	height: 1px;
	background-color: #ebebeb;
	transform: scaleY(0.5);
	content: "";
}
#qs-doctor .public-question-time {
	color: #999;
	font-weight: 300;
	font-size: 12px;
	line-height: 1.17;
}
#qs-doctor .public-question-content {
	margin: 12px 0;
	color: #4d4d4d;
	font-weight: 300;
	font-size: 16px;
	line-height: 1.5;
	display: -webkit-box;
	max-height: 66pxpx;
	overflow: hidden;
	line-height: 22px;
	word-break: break-all;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3;
}
#qs-doctor .public-question-title {
	display: flex;
	align-items: center;
	color: #333;
	font-weight: 500;
	font-size: 17px;
	line-height: 1.12;
}
#qs-doctor .question-tab-item {
	margin-right: 12px;
	display: inline-block;
	margin-bottom: 12px;
	padding: 8px 12px;
	color: #4d4d4d;
	font-weight: 300;
	font-size: 14px;
	line-height: 1.14;
	background-color: #fafafa;
	border-radius: 4px;
}
#qs-doctor .profile-questions > div:last-child {
	margin: 20px 0 40px;
	text-align: center;
}
#qs-doctor .question-tab {
	margin-bottom: -12px;
	padding: 20px 16px 10px;
	background-color: #fff;
}
#qs-doctor .public-question {
	padding: 20px 16px;
	background-color: #fff;
	position: relative;
}
#qs-doctor .profile-title {
	padding: 20px 16px 10px;
	color: #333;
	font-weight: 600;
	font-size: 22px;
	line-height: 1.09;
}
#qs-doctor .profile-questions {
	margin-top: 24px;
}
#qs-doctor .doctor-tag > div {
	display: inline-block;
	margin-bottom: 6px;
	padding: 2px;
	color: #fa0;
	font-size: 12px;
	line-height: 1.17;
	background-color: #fffaf0;
	border-radius: 2px;
}
#qs-doctor .doctor-tag {
	padding: 10px 16px 10px;
}
#qs-doctor .doctor-info-item > span:nth-child(2) {
	color: #4d4d4d;
	font-weight: 300;
	font-size: 10px;
	line-height: 1.2;
}
#qs-doctor .doctor-info-item > span:nth-child(1) {
	margin-right: 2px;
	color: #4d4d4d;
	font-weight: 600;
	font-size: 20px;
	line-height: 1.1;
}
#qs-doctor .doctor-info {
	display: flex;
	padding: 20px 16px 10px;
	color: #4d4d4d;
	font-weight: 300;
	font-size: 10px;
	line-height: 1.2;
	align-items: baseline;
}
#qs-doctor .doctor-avatar > div:nth-child(2) {
	color: #00c792 !important;
	display: inline-block;
	height: 27px;
	margin-top: 10px;
	padding: 0 12px;
	color: grey;
	font-weight: 500;
	font-size: 13px;
	line-height: 27px;
	text-align: center;
	background-color: #f5f5f5;
	border-radius: 13.5px;
	position: relative;
}
#qs-doctor .doctor-avatar > div:nth-child(1) {
	width: 60px;
	height: 60px;
	border-radius: 4px;
    overflow: hidden;
}
#qs-doctor .doctor-description {
	/* display: flex;
	-webkit-box-align: center;
	align-items: center; */
    position: relative;
    padding-right: 30px;
	margin-top: 15px;
}

#qs-doctor .doctor-description::after {
    content: '\F00A';
    font: normal normal normal 20px/1 'vant-icon';
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    right: 5px;
    color: #999;
}

#qs-doctor .doctor-avatar {
	position: absolute;
	top: 0;
	right: 0;
	text-align: center;
    display: flex;
    flex-flow: column;
    align-items: center;
    min-width: 100px;
}
#qs-doctor .doctor-introduction {
	min-height: 97px;
	margin-right: 80px;
}
#qs-doctor .doctor-card > div {
	position: relative;
}
#qs-doctor .doctor-card {
	padding: 20px 16px 10px;
	color: #333;
	font-weight: 300;
	font-size: 14px;
	line-height: 1.14;
	background-color: #fff;
}
</style>

<script>
import {Dialog, ImagePreview} from 'vant'


export default {
	data() {
		return {
            isFollowed: false,
			doctorId: "",
			comments: [],
			doctor: {
				avatar: "1.jpg",
			},
			directions: [],
			articles: [],
			math: 0,
		};
	},
	methods: {
        imagePreview(url) {
            ImagePreview({
                images: [require(`@/assets/img/${url}`)],
                showIndex: false
			});
		},
        toggleFollow(){
            if (this.$store.state.userInfo) {
            if(this.isFollowed){
                this.axios.post('/canclefollow', {
                    doctorid: parseInt(this.doctorId),
                    userid: this.$store.state.userInfo.user_id
                }).then(res=>{
                    if(res.data.code == 0){
                        this.$toast(res.data.message)
                    }
                }).catch(reason=>console.log(reason))
            }else{
                this.axios.post('/gotofollow', {
                    doctorid: parseInt(this.doctorId),
                    userid: this.$store.state.userInfo.user_id
                }).then(res=>{
                    if(res.data.code == 0){
                        this.$toast(res.data.message)
                    }
                }).catch(reason=>console.log(reason))
            }
            this.isFollowed = !this.isFollowed
            }else{
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
        gotoask(){
			if (!this.$store.state.userInfo) {
				Dialog.confirm({
					title: "未登录",
					message: "是否前往登录？",
				})
					.then(() => {
						this.$router.push('/login');
					})
					.catch(() => {
					});
			}else{
				this.$router.push({
                    path: '/ask',
                    query: {
                        doctorid: this.doctorId
                    }
                });

			}
        },
        
        gotoDoctorMsg(){
            this.$router.push(`/detail?doctorid=${this.doctorId}`)
        },

		//进入更多问题页
		onMore() {
			this.$router.push(`/question/more/${this.doctor.d_id}`);
		},
		onClickLeft(){
			this.$router.go(-1)
		},
	},
	mounted() {
		//获取url传参
		let id = this.$route.params.id;
		this.doctorId = id;
        let url = "/question/doctor?id=" + id;
        
		Promise.all([
			this.axios.get(url),// 获取医生信息
			this.axios.get("/comment?id=" + id),// 获取患者评价
            this.axios.get("/uquestion"),//获取患者问题
            
		]).then(res => {
			let doctorMsg = res[0].data.data;
			let patientCommentMsg = res[1].data.data;
			let patientMsg = res[2].data.data;
			this.doctor = doctorMsg;
			this.directions = this.doctor.direction.split("，");//切割擅长方向
			this.comments = patientCommentMsg;
			this.math = parseInt(Math.random() * 279);
            this.articles = patientMsg.slice(this.math, this.math + 3);
            
        }).catch(reason=>console.log(reason))
        if (this.$store.state.userInfo) {
            this.axios.get(`/queryisfollowed?doctorid=${id}&userid=${this.$store.state.userInfo.user_id}`)
            .then(res=>{
                let followMsg = res.data.data;
                if(followMsg.num > 0){
                this.isFollowed = true;
            }
            })


        }
        
	},
};
</script>
