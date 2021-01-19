<template>
	<div id="setting">
		<van-nav-bar title="设置" left-arrow @click-left="onClickLeft" />
		<van-cell title="头像" size="large">
			<van-image round width="50px" height="50px" :src="`http://127.0.0.1:3000/${userInfo.avatar}`" />
		</van-cell>
		<van-cell @click="goToModify" title="昵称" :value="userInfo.nickname" size="large" />
		<van-cell title="账号管理" size="large" />
		<van-cell title="自动草稿" size="large" >
            <van-switch v-model="autochecked" active-color="#00c792"/>
        </van-cell>
		<van-cell title="消息通知" size="large" >
            <van-switch v-model="msgchecked" active-color="#00c792"/>
        </van-cell>
		<van-cell title="隐私设置" size="large" />
		<van-cell title="清理缓存" value="8.7M" size="large" />
		<van-cell title="去好评" size="large" />
		<van-cell title="推荐给朋友" size="large" />
		<van-cell title="关于我们" size="large" />
		<van-button class="quit-btn" type="danger" plain size="large" @click="quit">退出登录</van-button>
	</div>
</template>
<script>
import { mapState, mapMutations } from "vuex";
export default {
	data() {
		return {
            autochecked: true,
            msgchecked: false,
		};
	},
	methods: {
        goToModify(){
            this.$router.push('/mine/modifynickname')
        },
		onClickLeft() {
			this.$router.back(-1);
        },
        quit(){
            localStorage.removeItem('userInfo')
            this.deleteUserInfo()
            this.$router.push('/mine')
        },
        ...mapMutations(['deleteUserInfo'])
	},
	computed: {
		...mapState(["userInfo"]),
	},
};
</script>

<style scoped>
#setting .van-cell {
    align-items: center;
}

.quit-btn {
    border: 0;
    /* margin-top: 50px; */
}
</style>
