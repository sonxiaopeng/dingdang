<template>
	<div id="symptom">
		<img src="@/assets/images/emgcall/3362051587051885721-22.png" alt="" />

		<van-field
			v-model="message"
			type="textarea"
			placeholder="简要描述你的年龄、性别及症状，我们将为你接通对症的专科医生，并确保隐私安全"
			maxlength="500"
			show-word-limit
		/>

		<div class="img-upload">
            <van-uploader v-model="fileList" multiple :max-count="9"/>
            <div class="uploader-description" v-if="isDescShow">
                上传图片辅助说明病情
                <br>
                可上传 9 张
            </div>
            <van-cell value=" 无法上传图片？ " @click="showAnswer"/>
        </div>
        <div class="next-btn">
        <van-button size="large" color="#00c792" round @click="next">下一步</van-button>

        </div>
	</div>
</template>

<script>
export default {
	data() {
		return {
            message: "",
            fileList: [],
            isDescShow: true
		};
    },
    watch: {
        fileList(){
            if(this.fileList.length > 0){
                this.isDescShow = false
            }else{
                this.isDescShow = true
            }
        }
    },
    methods: {
        showAnswer(){

        },
        next(){
            
        }
    }
};
</script>

<style scoped>

#symptom >>> .next-btn {
    box-sizing: border-box;
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    padding: 10px 16px;
}

#symptom >>> .img-upload .van-cell {
    padding: 0;
    margin-top: 10px;
}

#symptom >>> .img-upload .van-cell span {
    color: #00c792;
    font-size: 12px;
    background-color: #fff;
}

#symptom > img {
	width: 100%;
}

#symptom .img-upload {
    position: relative;
    padding: 4% 10px 4%;
}

#symptom .img-upload::after {
	content: "";
	display: block;
	position: absolute;
	left: 0;
	height: 1px;
	width: 100%;
	background-color: #ebebeb;
	transform: scaleY(0.5);
}

#symptom .img-upload::after {
	bottom: 0;
}

#symptom >>> .img-upload .van-uploader__wrapper {
    justify-content: space-between;
}

#symptom >>> .img-upload .van-uploader__preview {
    flex: 0 0 0.25;
    margin: 0 0 8px;
}

#symptom >>> .img-upload .van-uploader__preview-delete {
    left: -5px;
    top: -5px;
    width: 18px;
    height: 18px;
    background-color: #00cc96;
    border-radius: 50%;
    border: 2px solid #fff;
    
}

#symptom >>> .img-upload .van-uploader__preview-delete > i {
    line-height: 18px;
    text-align: center;
    top: 0;
    right: 0;
    width: 100%;
    height: 100%;
    position: relative;
    transform: scale(1);
}

#symptom >>> .img-upload .van-uploader__preview-image img {
    border-radius: 4px;
}

#symptom >>> .img-upload .uploader-description {
    position: absolute;
    height: 80px;
    top: 37px;
    left: 110px;
    font-size: 12px;
    line-height: 20px;
    color: #999;
}
</style>
