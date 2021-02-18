<template>
	<div id="login">
		<van-nav-bar
			title="登录"
			left-arrow
			@click-left="onClickLeft"
		/>
        <van-field v-model="username" placeholder="请输入手机号" @blur="checkUsername"/>
        <van-field type="password" v-model="password" placeholder="请输入密码"  @blur="checkPassword"/>
        <div class="btns">
            <van-button @click="login" class="login-btn" color="#00c792" round type="primary" size="large">登录</van-button>
            <van-button @click="gotoRegister" color="#00c792" round plain type="primary" size="large">注册</van-button>
        </div>
	</div>
</template>

<script>
import { Toast } from 'vant';
export default {
	data() {
		return {
            username: '',
            password: '',
            usernameReg: /^1[0-9]{10}$/,
            passwordReg: /^[a-zA-Z](?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{5,19}$/
        };
    },
    methods: {
        checkUsername(){
            if(this.username.trim() == ''){
                Toast('请输入手机号');
                return;
            }
            if(!this.usernameReg.test(this.username)){
                Toast('手机号不正确');
                return false;
            }
        },
        checkPassword(){
            if(this.password.trim() == ''){
                Toast('请输入密码');
                return;
            }
            if(!this.passwordReg.test(this.password)){
                Toast('密码必须为字母开头的字母数字组合');
                return false;
            }
        },
        onClickLeft(){
            this.$router.back(-1)
        },
        gotoRegister(){
            this.$router.push('/register')
        },
        login(){
                var usernameReg = /^1[0-9]{10}$/;
                var passwordReg = /^[a-zA-Z](?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{5,19}$/;
                if(!usernameReg.test(this.username)){
                    
                    Toast('手机号不正确');
                    return false;
                }
                if(!passwordReg.test(this.password)){
                    Toast('密码必须为字母开头的字母数字组合');
                    return false;
                }
                
                this.axios.post('/login', {
                    username: this.username,
                    password: this.password
                })
                .then(res=>{
                    if(res.data.code == 0){
                        // this.$store.state.user = res.data.data
                        localStorage.setItem('userInfo', encodeURI(JSON.stringify(res.data.data)))
                        this.$store.commit('updateUserInfo', res.data.data)
                        Toast('登录成功！');
                        if(localStorage.getItem('backPage')){
                            this.$router.replace({path: localStorage.getItem('backPage')})
                            localStorage.removeItem('backPage')
                        }else{
                            this.$router.push('/')
                        }
                        // if(this.$route.query.from == 'register'){
                        //     this.$router.push('/')
                        // }else{
                        //     this.$router.go(-1)
                        // }
                    }else{
                        Toast(res.data.message);
                    }
                })
                .catch(reason=>console.log(reason))
            }
    }
};
</script>

<style scoped>
#login .van-field {
    padding: 20px 20px;
    font-size: 16px;
}

#login .btns {
    padding: 0 20px;
}

#login .login-btn {
    margin: 20px 0;
}

</style>
