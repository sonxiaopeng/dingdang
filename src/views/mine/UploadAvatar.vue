<template>
	<simple-cropper :initParam="uploadParam" :successCallback="uploadHandle" ref="cropper">
		<img :src="userImg" @click="upload" />
	</simple-cropper>
</template>

<script>
import SimpleCropper from "@/components/Clipper";
export default {
	name: "info",
	data() {
		return {
			uploadParam: {
				fileType: "recruit", // 其他上传参数
				uploadURL: this.$dataURL + "uploadAction/qcloudImg", // 上传地址
				scale: 4, // 相对手机屏幕放大的倍数: 4倍
			},
			userImg: "http://127.0.0.1:3000/default-avatar.png",
		};
	},
	methods: {
		// 上传头像
		upload() {
			this.$refs["cropper"].upload();
		},
		// 上传头像成功回调
		uploadHandle(data) {
			if (data.state === "SUCCESS") {
				this.userImg = this.form.headImgUrl = data.fileId;
			}
		},
	},
	components: {
		SimpleCropper,
	},
};
</script>
