<template>
	<div id="setting">
		<van-nav-bar title="设置" left-arrow @click-left="onClickLeft" />
		<van-cell title="头像" size="large" @click="goToUpload">
			<van-image
				round
				width="50px"
				height="50px"
				:src="`http://127.0.0.1:3000/${userInfo.avatar}`"
			/>
		</van-cell>
		<van-cell
			@click="goToModify"
			title="昵称"
			:value="userInfo.nickname"
			size="large"
		/>
		<van-cell title="账号管理" size="large" />
		<van-cell title="自动草稿" size="large">
			<van-switch v-model="autochecked" active-color="#00c792" />
		</van-cell>
		<van-cell title="消息通知" size="large">
			<van-switch v-model="msgchecked" active-color="#00c792" />
		</van-cell>
		<van-cell title="隐私设置" size="large" />
		<van-cell title="清理缓存" value="8.7M" size="large" />
		<van-cell title="去好评" size="large" />
		<van-cell title="推荐给朋友" size="large" />
		<van-cell title="关于我们" size="large" />
		<van-button
			class="quit-btn"
			type="danger"
			plain
			size="large"
			@click="quit"
			>退出登录</van-button
		>
		<van-uploader
			:after-read="afterRead"
			ref="uploader"
			:max-size="10 * 1024 * 1024"
			@oversize="onOversize"
		>
			<div style="display: none"></div>
		</van-uploader>
		<div
			class="img-container"
			:style="{ height: fullScreenH }"
			v-show="isShow"
		>
			<img ref="image" :src="imgSrc" />
            <div class="btn left" @click="cancel">取消</div>
            <div class="btn right" @click="save">保存</div>
		</div>
	</div>
</template>
<script>
import { mapState, mapMutations } from "vuex";
import Toast from "vant";
import Cropper from "cropperjs";
export default {
	data() {
		return {
			imgSrc: `http://127.0.0.1:3000/default-avatar.png`,
			isShow: false,
			fullScreenH: "",
			autochecked: true,
			msgchecked: false,
		};
	},
	methods: {
		afterRead(file) {
			this.isShow = true;
			// const image = this.$refs.image;
            // image.src = file.content;
            this.imgSrc = file.content
			// const cropper = new Cropper(image, {
			// 	aspectRatio: 1,
			// 	viewMode: 1,
			// 	background: false,
			// 	crop(event) {
			// 		console.log(event.detail.x);
			// 		console.log(event.detail.y);
			// 		console.log(event.detail.width);
			// 		console.log(event.detail.height);
			// 		console.log(event.detail.rotate);
			// 		console.log(event.detail.scaleX);
			// 		console.log(event.detail.scaleY);
			// 	},
			// });
        },
        save(){
            let formData = new FormData();
            let byteString = atob(
                this.imgSrc.replace(/^data:image\/\w+;base64,/, "")
            );
            let mimeString = this.imgSrc
                .split(",")[0]
                .split(":")[1]
                .split(";")[0];
            let ab = new ArrayBuffer(byteString.length);
            let ia = new Uint8Array(ab);
            for (var i = 0; i < byteString.length; i++) {
                ia[i] = byteString.charCodeAt(i);
            }
            let blob = new Blob([ia], { type: mimeString });
            formData.append("uploadFile", blob, Date.now() + ".jpg");
            formData.append("userid", this.$store.state.userInfo.user_id);
            this.axios.post('/mine/modifyavatar', formData)
            .then(res=>{
                if (res.data.code == 0) {
                    let userInfo = JSON.parse(decodeURI(localStorage.getItem('userInfo')))
                    userInfo.avatar = res.data.data
                    localStorage.setItem('userInfo', encodeURI(JSON.stringify(userInfo)))
                    this.$store.commit('updateUserInfo', userInfo)
					this.$router.push("/mine");
					} else {
						Toast(res.data.message);
					}
            })


        },
        cancel(){
            this.isShow = false;
        },
		onOversize() {
			Toast("文件大小不能超过10M");
		},
		goToUpload() {
			// this.$router.push('/setting/uploadavatar')
			this.$refs.uploader.chooseFile();
		},
		goToModify() {
			this.$router.push("/setting/modifynickname");
		},
		onClickLeft() {
			this.$router.back(-1);
		},
		quit() {
			localStorage.removeItem("userInfo");
			this.deleteUserInfo();
			this.$router.push("/mine");
		},
		...mapMutations(["deleteUserInfo"]),
	},
	computed: {
		...mapState(["userInfo"]),
	},
	mounted() {
		this.fullScreenH = document.documentElement.clientHeight + "px";
	},
};
</script>

<style scoped>
#setting .img-container > .btn.right {
    right: 0;
}

#setting .img-container > .btn.left {
    left: 0;
}

#setting .img-container > .btn {
    position: absolute;
    top: 0;
    padding: 20px;
    color: #fff;
    font-size: 16px;
}

#setting .img-container > img {
	display: block;
	width: 100%;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
}

#setting .img-container {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 100;
	width: 100%;
	background-color: #000;
}

#setting .van-cell {
	align-items: center;
}

.quit-btn {
	border: 0;
	/* margin-top: 50px; */
}
</style>
