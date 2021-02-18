<template>
	<div id="my-follows">
		<my-navbar title="我关注的医生"></my-navbar>

		<div class="follow-box" v-if="myFollows.length > 0">
			<van-swipe-cell v-for="(item, index) of myFollows"
					:key="index"
                    @click="canclefollow($event, item.doctorid, index)">
				<doctor-card
					:doctorid="item.doctorid"
					
				></doctor-card>
				<template #right>
					<van-button
						square
						text="取消关注"
						type="danger"
						class="delete-button"
					/>
				</template>
			</van-swipe-cell>
		</div>
		<div v-else>
			<no-data msg="暂无关注医生"></no-data>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			myFollows: [],
		};
    },
    methods: {
        canclefollow(pos,doctorid, index){
            if(pos == 'right'){
                this.axios.post('/canclefollow', {
                    doctorid: parseInt(doctorid),
                    userid: this.$store.state.userInfo.user_id
                }).then(res=>{
                    if(res.data.code == 0){
                        this.$toast(res.data.message)
                    }
                }).catch(reason=>console.log(reason))
                this.myFollows.splice(index, 1)
            }
        }
    },
	mounted() {
		if (this.$store.state.userInfo) {
			this.axios
				.get("/getfollowid", {
					params: {
						userid: this.$store.state.userInfo.user_id,
					},
				})
				.then(res => {
					if (res.data.code == 0) {
						this.myFollows = res.data.data;
					}
				});
		}
	},
};
</script>

<style>
#my-follows .delete-button {
    height: 100%;
    background-color: red;
    border: 0;
    color: #fff;
  }

</style>
