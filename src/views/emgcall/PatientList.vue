<template>
	<div id="patient-list">
		<div class="patient-list-header">
			<div class="title">请选择患者信息</div>
			<div class="sub">以便医生给出更准确的治疗，信息仅医生可见</div>
		</div>
		<div class="patient-list-record">
			<div class="record-item" :class="{ active: recordActive == item.id }" @click="setActive(item.id)"
             v-for="(item, index) of recordItems" :key="index">
				<div class="name">{{ item.name }}</div>
				<div class="msg">
					<div>{{ item.sex }}</div>
					<div>{{ `${item.age}岁` }}</div>
					<div>{{ `${item.weight}kg` }}</div>
				</div>
			</div>
			<div class="add-record" @click="addRecord">
				<div class="add-text">
					<van-icon name="plus" class="plus-icon" />
				</div>
				<div class="add-text">
					添加患者
				</div>
			</div>
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
            recordActive: '',
			recordItems: [
				{
                    id: 1,
					name: "adasd",
					sex: "男",
					age: 25,
					weight: 55,
				},
				{
                    id: 2,
					name: "add",
					sex: "女",
					age: 45,
					weight: 45,
				},
			],
		};
	},
	methods: {
        setActive(id){
            this.recordActive = id
        },
		next() {
			this.$router.push("/emgcall/sections");
		},
        addRecord(){
            this.$router.push('/emgcall/patient-form')
        }
	},
};
</script>

<style>
#patient-list .next-btn {
	background-color: #fff;
	box-sizing: border-box;
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	padding: 10px 16px;
}

#patient-list .patient-list-record .record-item.active {
	color: #00c792;
	background-color: #e5f9f4;
}

#patient-list .patient-list-record .record-item.active .msg > div + div::before {
	background-color: #00c792;
}

#patient-list .patient-list-record .record-item .msg {
	display: flex;
	flex-flow: row nowrap;
	justify-content: center;
	font-size: 14px;
	width: 100%;
	line-height: 21px;
}

#patient-list .patient-list-record .record-item .msg > div {
	padding: 1px 2px;
}

#patient-list .patient-list-record .record-item .msg > div + div {
	margin-left: 10px;
	position: relative;
}

#patient-list .patient-list-record .record-item .msg > div + div::before {
	content: "";
	display: block;
	background-color: #333;
	width: 1px;
	height: 10px;
	position: absolute;
	left: -6px;
	top: 7px;
}

#patient-list .patient-list-header,
#patient-list .patient-list-record {
	padding: 20px 16px;
}

#patient-list .patient-list-header .title {
	margin-bottom: 10px;
	color: #333;
	font-weight: 500;
	font-size: 22px;
	line-height: 24px;
}

#patient-list .patient-list-header .sub {
	color: #666;
	font-weight: 300;
	font-size: 14px;
	line-height: 26px;
}

#patient-list .patient-list-record {
	display: flex;
	flex-flow: row wrap;
	justify-content: space-between;
}

#patient-list .patient-list-record > div {
	flex: 0 0 45%;
	margin-bottom: 12px;
	color: #4d4d4d;
	background-color: #fafafa;
	border-radius: 4px;
	height: 80px;
	display: flex;
	justify-content: center;
	flex-flow: column nowrap;
	align-items: center;
}

#patient-list .patient-list-record div.add-record .add-text {
	color: #999;
	font-weight: 300;
	font-size: 12px;
}

#patient-list .patient-list-record div.add-record .add-text .plus-icon {
	font-size: 30px;
}
</style>
