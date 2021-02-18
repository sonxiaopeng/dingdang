<template>
	<div id="doctor-card">
		<div class="Doctors" v-for="(item, index) of context" :key="index" @click="goToDetail(item.doctor_id)">
			<div>
				<div class="Photo">
					<img :src="require(`../assets/img/${item.avatar}`)" />
				</div>
				<div class="Text">
					<p class="title">
						{{ item.nickname }} <span>{{ item.level }}</span
						><van-tag size="medium">三甲</van-tag>
					</p>
					<p>
						<span>{{ item.office_name }} </span>
						<span>{{ item.address }}</span>
					</p>
					<p class="lab">
						擅长: <span>{{ item.direction }}</span>
					</p>
					<van-cell title="5.00" icon="shop-o">
						<!-- 使用 right-icon 插槽来自定义右侧图标 -->
						<template #icon>
							<van-icon name="star" class="star-icon" />
						</template>
						<span class="Tag">月回答253</span>
						<span class="Tag">18分钟响应</span>
					</van-cell>
					<p class="van-Tag">
						<span>全国百强医院</span>
						<span>医学博士</span>
						<span>耐心细致</span>
					</p>
					<p class="van-tag">
						<span>图文 ¥{{ item.ask_price }}</span>
						<button>问医生</button>
					</p>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
export default {
    props: ['doctorid'],
	data() {
		return {
			context: [
				{
					hospitalname: "",
					avatar: "1.jpg",
					nickname: "",
                },
			],
		};
    },
    methods: {
        goToDetail(doctorId){
            this.$router.push({
                path: `/question/doctor/${doctorId}`,
                // params: {
                //     doctor: doctorId
                // }
            })
        }
    },
    watch: {
        doctorid(newVal){
            this.axios.get(`/getfollowdoctor?doctorid=${newVal}`)
			.then(result => {
                this.context = result.data.data;
				for (var i = 0; i < this.context.length; i++) {
					this.context[i].direction = this.context[i].direction
						.split("，")
						.join("、");
				}
			});
        }
    },
    mounted(){
        this.axios.get(`/getfollowdoctor?doctorid=${this.doctorid}`)
			.then(result => {
                this.context = result.data.data;
				for (var i = 0; i < this.context.length; i++) {
					this.context[i].direction = this.context[i].direction
						.split("，")
						.join("、");
				}
			});
    }
};
</script>

<style scoped>
#doctor-card .Doctors {
	height: 250px;
	box-sizing: border-box;
	padding: 10px 16px;
	position: relative;
}
#doctor-card .Doctors::after {
	position: absolute;
	right: 16px;
	bottom: 0;
	left: 16px;
	box-sizing: border-box;
	height: 1px;
	background-color: #ebebeb;
	content: "";
	transform: scaleY(0.5);
}
#doctor-card .Doctors .Photo {
	width: 54px;
	height: 54px;
	float: left;
    border-radius: 5px;
    overflow: hidden;
}
#doctor-card .Doctors .Photo img {
	width: 100%;
}
#doctor-card .Text {
	height: 193px;
	margin: 0 0 0 15px;
	position: absolute;
	left: 70px;
}
#doctor-card .Text p.title {
    height: 36px;
}

#doctor-card .Text p {
	color: #333333;
	font-size: 16px;
    font-weight: 700;
}
#doctor-card .Text p > span {
	font-size: 14px;
    font-weight: normal;
}
#doctor-card .van-tag--default {
	background-color: #e6c37e;
	color: #fff;
	padding: 2px;
	margin-left: 8px;
    border-radius: 2px;
    overflow: hidden;
}
#doctor-card .Text .lab {
	color: #4d4d4d;
	font-size: 14px;
	margin-top: 14px;
	padding-right: 42px;
    line-height: 16px;
    max-height: 32px;
}
#doctor-card .Text .lab span {
	margin-left: 5px;
}
.van-icon-star::before {
	color: #faa700;
	margin-right: 5px;
}
#doctor-card .Doctors div.van-cell {
	color: #faa700;
	margin-top: 1px;
	font-weight: 600;
    padding-left: 0px;
}

#doctor-card .Doctors .star-icon {
    line-height: 25px;
}

#doctor-card .Doctors div.van-cell__value {
	flex: 11;
	text-align: left;
}
#doctor-card .Doctors div.van-cell__value .Tag {
	color: #666;
	font-size: 12px;
	margin-left: 5px;
	font-weight: 100;
}
#doctor-card .Doctors .Text .van-Tag {
	color: #ffaa00;
	margin-top: 5px;
}
#doctor-card .Text .van-Tag span {
	margin-right: 15px;
	font-size: 12px;
}
#doctor-card .Doctors .Text > .van-tag {
	margin-top: 10px;
	position: relative;
    display: flex;
    justify-content: space-between;
    background-color: #fff;
}
#doctor-card .Doctors .van-tag > span {
	font-size: 13px;
}
#doctor-card .Doctors .van-tag button {
	padding: 6px 12px;
	border-radius: 14px;
	font-size: 13px;
	line-height: 14px;
	border: 0;
	background-color: #f5f5f5;
	border: 0.5px solid #ebebeb;
	color: #00c792;
    margin-right: 20px;
}
#doctor-card .Doctors .van-tag button:active {
	background-color: #c9c9c9;
}
</style>
