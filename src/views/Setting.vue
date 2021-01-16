<template>
    <div id="setting">
        <van-nav-bar
			title="设置"
			left-arrow
			@click-left="onClickLeft"
		/>
        <van-cell title="头像" value="内容" size="large" />
        <van-cell title="昵称" :value="nickname" size="large" />
        <van-cell title="自动草稿" size="large" />
        <van-cell title="消息通知" size="large" />
        <van-cell title="隐私设置" size="large" />
        <van-cell title="清理缓存" value="8.7M" size="large" />
        <van-cell title="去好评" size="large" />
        <van-cell title="推荐给朋友" size="large" />
        <van-cell title="关于我们" size="large" />
        <van-button type="danger" plain size="large">退出登录</van-button>
        
    </div>
</template>

<script>
    export default {
        data(){
            return {
                nickname: '',
            }
        },
        methods:{
            onClickLeft(){
                this.$router.back(-1)
            }
        }
    }
</script>

<style scoped>

</style>
