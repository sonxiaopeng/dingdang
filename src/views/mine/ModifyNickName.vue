<template>
	<div id="modify-nickname">
		<van-nav-bar
			title="设置昵称"
			left-arrow
			@click-left="onClickLeft"
			@click-right="onClickRight"
		>
			<template #right>
				<van-button size="small" color="#00c792" round type="info" @click="save">保存</van-button>
			</template>
		</van-nav-bar>
        <van-field v-model="value" :clearable="true"/>
        <div class="tips">仅支持中、英文和数字</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
            value: this.$store.state.userInfo.nickname,
        };
    },
    methods: {
        onClickLeft(){
            this.$router.go(-1)
        },
        onClickRight(){
            this.axios.post('/mine/modifynickname', {
                userid: this.$store.state.userInfo.user_id,
                nickname: this.value
            })
            .then(res=>{
                if(res.data.code == 0){
                    localStorage.setItem('userInfo', encodeURI(JSON.stringify(res.data.data)))
                    this.$store.commit('updateUserInfo', res.data.data)
                    Toast(res.data.message);
                    this.$router.push('/setting')

                }else{
                    Toast(res.data.message);
                }
            })
            .catch(reason=>console.log(reason))
        },
        save(){}
    }
};
</script>

<style scoped>
#modify-nickname .van-field {
    padding: 15px 16px;
    border-bottom: 1px solid #eee;
    font-size: 18px;
}

#modify-nickname .tips {
    color: #bbb;
    font-size: 14px;
    padding-left: 20px;
    padding-top: 5px;
}

.van-button__content {
    padding: 0 5px;
}
</style>
