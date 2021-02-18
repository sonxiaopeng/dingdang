<template>
	<div id="my-ask">
		<my-navbar title="我的问诊" />
		<van-tabs
			v-model="active"
			animated
			color="#00c792"
			title-active-color="#00c792"
			line-width="60px"
		>
			<van-tab :name="1" title="图文问诊">
				<div class="tab-box" v-if="picAsk.length > 0">
					<order-list
						:imgurl="`img/${item.imgurl}`"
						:nickname="item.nickname"
						:describe="item.description"
						:committime="item.committime"
						:index="item.orderid"
						v-for="(item, index) of picAsk"
						:key="index"
					></order-list>
				</div>
				<no-data msg="暂无相关问诊" v-else></no-data>
			</van-tab>
			<van-tab :name="2" title="语音问诊">
				<div class="tab-box" v-if="phoneAsk.length > 0">
					<order-list
						:imgurl="`images/emgcall/3357420087593450504-22.png`"
						:nickname="'丁香医生'"
						:describe="item.description"
						:committime="item.committime"
						:index="item.orderid"
						v-for="(item, index) of phoneAsk"
						:key="index"
					></order-list>
				</div>
				<no-data msg="暂无相关问诊" v-else></no-data>
			</van-tab>
		</van-tabs>
	</div>
</template>

<script>
export default {
	data() {
		return {
			active: 1,
			phoneAsk: [],
			picAsk: [],
		};
	},
	mounted() {
		if (this.$store.state.userInfo) {
			this.axios
				.get("/getorderlist", {
					params: {
						userid: this.$store.state.userInfo.user_id,
					},
				})
				.then(res => {
                    if(res.data.code == 0){
                        let list = res.data.data;
                        list.forEach(item => {
                            if (item.type == 1) {
                                this.phoneAsk.push(item);
                            } else {
                                this.picAsk.push(item);
                            }
                        });
                    }
				});
		}
	},
};
</script>

<style></style>
