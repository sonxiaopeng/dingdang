<template>
	<div id="patient-form">
		<van-field
			v-model="nickname"
			label="患者姓名"
			placeholder="请填写真实姓名"
			@blur="setNickname"
		/>
		<van-field v-model="message.sex" label="性别">
			<template #input>
				<span
					class="tag"
					:class="message.sex == 1 ? 'active' : ''"
					@click="setActive('sex', 1)"
					>男</span
				>
				<span
					class="tag"
					:class="{ active: message.sex == 2 }"
					@click="setActive('sex', 2)"
					>女</span
				>
			</template>
		</van-field>
		<van-field
			v-model="message.birthday"
			label="出生年月"
			placeholder="请选择出生年月"
			@focus="showBirthPop"
		/>
		<van-field
			v-model="weight"
			label="体重（kg）"
			placeholder="请输入体重"
			type="number"
			@blur="setWeight"
		/>
		<van-field v-model="message.allergy" label="过敏史">
			<template #input>
				<span
					class="tag"
					:class="{ active: message.allergy == 1 }"
					@click="setActive('allergy', 1)"
					>无</span
				>
				<span
					class="tag"
					:class="{ active: message.allergy == 2 }"
					@click="setActive('allergy', 2)"
					>有</span
				>
			</template>
		</van-field>
		<div class="allergy-desc" v-if="isAllergyShow">
			<van-field
				v-model="allergyDesc"
				rows="2"
				type="textarea"
				maxlength="20"
				placeholder="请填写过敏药物（非常重要）"
				:show-word-limit="true"
                @blur="setAllergyDesc"
			/>
		</div>
		<van-field v-model="message.history" label="过往病史">
			<template #input>
				<span
					class="tag"
					:class="{ active: message.history == 1 }"
					@click="setActive('history', 1)"
					>无</span
				>
				<span
					class="tag"
					:class="{ active: message.history == 2 }"
					@click="setActive('history', 2)"
					>有</span
				>
			</template>
		</van-field>
		<div class="history-desc" v-if="isHistoryShow">
			<van-field
				v-model="historyDesc"
				rows="2"
				type="textarea"
				maxlength="20"
				placeholder="请填写过往病史"
				:show-word-limit="true"
                @blur="setHistoryDesc"
			/>
		</div>
		<van-field v-model="message.liver" label="肝功能">
			<template #input>
				<span
					class="tag"
					:class="{ active: message.liver == 1 }"
					@click="setActive('liver', 1)"
					>正常</span
				>
				<span
					class="tag"
					:class="{ active: message.liver == 2 }"
					@click="setActive('liver', 2)"
					>异常</span
				>
			</template>
		</van-field>
		<van-field v-model="message.kidney" label="肾功能">
			<template #input>
				<span
					class="tag"
					:class="{ active: message.kidney == 1 }"
					@click="setActive('kidney', 1)"
					>正常</span
				>
				<span
					class="tag"
					:class="{ active: message.kidney == 2 }"
					@click="setActive('kidney', 2)"
					>异常</span
				>
			</template>
		</van-field>
        <div class="inoculation" v-if="isInoculationShow">

		<van-field v-model="message.inoculation" label="孕育情况">
			<template #input>
				<span
					class="tag"
					:class="{ active: message.inoculation == 1 }"
					@click="setActive('inoculation', 1)"
					>无</span
				>
				<span
					class="tag"
					:class="{ active: message.inoculation == 2 }"
					@click="setActive('inoculation', 2)"
					>怀孕中</span
				>
				<span
					class="tag"
					:class="{ active: message.inoculation == 3 }"
					@click="setActive('inoculation', 3)"
					>哺乳中</span
				>
			</template>
		</van-field>
        </div>

		<div class="next-btn">
			<van-button
				ref="asdfa"
				size="large"
				color="#00c792"
				round
				@click="next"
				>提交</van-button
			>
		</div>

		<van-popup v-model="birthdayShow" position="bottom">
			<van-datetime-picker
				v-model="currentDate"
				type="date"
				title="选择年月日"
				:min-date="minDate"
				:max-date="maxDate"
				@confirm="birthdayConfirm"
				@cancel="birthdayCancel"
			/>
		</van-popup>
	</div>
</template>

<script>
import { Toast } from "vant";
export default {
	data() {
		return {
            isInoculationShow: true,
            isHistoryShow: false,
            isAllergyShow: false,
            allergyDesc: '',
            historyDesc: '',
			nickname: "",
			weight: "",
			message: {},
			birthdayShow: false,
			currentDate: new Date(2000, 0, 1),
			minDate: new Date(1890, 0, 1),
			maxDate: new Date(),
		};
	},
	methods: {
        setHistoryDesc(){
            this.$set(this.message, "historyDesc", this.historyDesc);
        },
        setAllergyDesc(){
            this.$set(this.message, "allergyDesc", this.allergyDesc);
        },
		setNickname() {
			this.$set(this.message, "nickname", this.nickname);
		},
		setWeight() {
			this.$set(this.message, "weight", this.weight);
		},
		birthdayCancel() {
			this.birthdayShow = false;
		},
		birthdayConfirm(value) {
			this.birthdayShow = false;
			let str = this.moment(value).format("YYYY-MM-DD");
			this.$set(this.message, "birthday", str);
			console.log(str);
		},
		setActive(item, value) {
			this.$set(this.message, item, value);
			if (item == "allergy") {
				if (value == 2) {
                    this.isAllergyShow = true
				} else {
                    this.isAllergyShow = false
				}
			} else if (item == "history") {
				if (value == 2) {
                    this.isHistoryShow = true
				} else {
                    this.isHistoryShow = false
				}
			}else if(item == 'sex'){
                if (value == 2) {
                    this.isInoculationShow = true
				} else {
                    this.isInoculationShow = false
				}
            }
		},
		next() {
			if (!this.message.nickname) {
				Toast({
					message: "请输入姓名",
					position: "middle",
                });
                return;
			}
			if (!this.message.sex) {
				Toast({
					message: "请选择性别",
					position: "middle",
                });
                return;
			}
			if (!this.message.birthday) {
				Toast({
					message: "请选择出生日期",
					position: "middle",
                });
                return;
			}
			if (!this.message.weight) {
				Toast({
					message: "请输入体重",
					position: "middle",
                });
                return;
			}
			if (!this.message.allergy) {
				Toast({
					message: "请选择过敏史",
					position: "middle",
                });
                return;
			}
			if (!this.message.history) {
				Toast({
					message: "请选择过往病史",
					position: "middle",
                });
                return;
			}
			if (!this.message.liver) {
				Toast({
					message: "请选择肝功能",
					position: "middle",
                });
                return;
			}
			if (!this.message.kidney) {
				Toast({
					message: "请选择肾功能",
					position: "middle",
                });
                return;
            }
            if(this.message.sex == 2 && !this.message.inoculation) {
				Toast({
					message: "请选择备孕情况",
					position: "middle",
                });
                return;
			}
			if (Object.keys(this.message).length >= 9) {
				this.$router.push("/emgcall/sections");
			}
		},
		showBirthPop() {
			this.birthdayShow = true;
		},
	},
	watch: {},
	mounted() {
		console.log(this.$refs.asdfa);
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
#patient-form >>> .van-cell input,
#patient-form >>> textarea {
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

#patient-form {
    padding-bottom: 70px;
}
</style>
