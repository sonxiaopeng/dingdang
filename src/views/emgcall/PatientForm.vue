<template>
	<div id="patient-form">
		<van-field v-model="message.nickname" label="患者姓名" placeholder="请填写真实姓名" />
		<van-field v-model="message.sex" label="性别">
			<template #input>
				<span class="tag" :class="{active: message.sex == '1'}" @click="setactive('sex', '1')">男</span>
				<span class="tag" :class="{active: message.sex == '2'}" @click="setactive('sex', '2')">女</span>
			</template>
		</van-field>
		<van-field v-model="message.birthday" label="出生年月" placeholder="请选择出生年月" />
		<van-field v-model="message.weight" label="体重（kg）" placeholder="请输入体重" />
		<van-field v-model="message.allergy" label="过敏史">
			<template #input>
				<span class="tag" :class="{active: message.allergy == '1'}" @click="setactive('allergy', '1')">无</span>
				<span class="tag" :class="{active: message.allergy == '2'}" @click="setactive('allergy', '2')">有</span>
			</template>
		</van-field>
		<van-field v-model="message.history" label="过往病史">
			<template #input>
				<span class="tag" :class="{active: message.history == '1'}" @click="setactive('history', '1')">无</span>
				<span class="tag" :class="{active: message.history == '2'}" @click="setactive('history', '2')">有</span>
			</template>
		</van-field>
		<van-field v-model="message.liver" label="肝功能">
			<template #input>
				<span class="tag" :class="{active: message.liver == '1'}" @click="setactive('liver', '1')">正常</span>
				<span class="tag" :class="{active: message.liver == '2'}" @click="setactive('liver', '2')">异常</span>
			</template>
		</van-field>
		<van-field v-model="message.kidney" label="肾功能">
			<template #input>
				<span class="tag" :class="{active: message.kidney == '1'}" @click="setactive('kidney', '1')">正常</span>
				<span class="tag" :class="{active: message.kidney == '2'}" @click="setactive('kidney', '2')">异常</span>
			</template>
		</van-field>
		<van-field v-model="message.inoculation" label="孕育情况">
			<template #input>
				<span class="tag" :class="{active: message.inoculation == '1'}" @click="setactive('inoculation', '1')">无</span>
				<span class="tag" :class="{active: message.inoculation == '2'}" @click="setactive('inoculation', '2')">怀孕中</span>
				<span class="tag" :class="{active: message.inoculation == '3'}" @click="setactive('inoculation', '3')">哺乳中</span>
			</template>
		</van-field>
		
		<div class="next-btn">
			<van-button size="large" color="#00c792" round @click="next">提交</van-button>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			message: {},
		};
	},
	methods: {
        setactive(item, value){
            this.message[item] = value
            console.log(this.message);
        },
		next() {
			this.$router.push("/symptom/sections");
		},
	},
};
</script>

<style scoped>

#patient-form >>> .van-cell .tag.active {
    color: #00c792;
    background-color: #e5f9f4;
}

#patient-form >>> .van-cell .tag {
    display: inline-block;
    padding: 8px 5px;
    min-width: 32px;
    background-color: #fafafa;
    border-radius: 4px;
    color: #4d4d4d;
    text-align: center;
    margin-right: 20px;
    font-size: 14px;
}

#patient-form >>> .van-cell .van-cell__title,
#patient-form >>> .van-cell input {
    font-size: 17px;
    line-height: 32px;
}

#patient-form .van-cell {
    padding: 14px 16px;
    box-sizing: border-box;
}

#patient-form .next-btn {
	background-color: #fff;
	box-sizing: border-box;
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	padding: 10px 16px;
}
</style>
