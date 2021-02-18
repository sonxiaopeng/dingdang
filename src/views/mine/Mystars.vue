<template>
	<div id="my-stars">
		<my-navbar title="我的收藏"></my-navbar>
		<div class="article-box" v-if="myStars.length > 0">
            <van-swipe-cell @click="cancleStar($event, item.articleid, index)" v-for="(item, index) of myStars"
				:key="index">
			<article-list
				:title="item.subject"
				:content="item.description"
				:imgurl="item.img"
				:url="`/article/${item.articleid}`"
			></article-list>
            <template #right>
					<van-button
						square
						text="取消收藏"
						type="danger"
						class="delete-button"
					/>
				</template>
            </van-swipe-cell>
		</div>
        <div v-else>
			<no-data msg="暂无收藏文章"></no-data>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			myStars: [],
		};
    },
    methods: {
        cancleStar(pos,articleid, index){
            if(pos == 'right'){
                this.axios
                    .post("/canclestar", {
                        articleid: parseInt(articleid),
                        userid: this.$store.state.userInfo.user_id,
                    })
                    .then(res => {
                        if (res.data.code == 0) {
                            this.$toast(res.data.message);
                        }
                    })
                    .catch(reason => console.log(reason));
                this.myStars.splice(index, 1)
            }
        }
    },
	mounted() {
		if (this.$store.state.userInfo) {
			this.axios
				.get("/getmystars", {
					params: {
						userid: this.$store.state.userInfo.user_id,
					},
				})
				.then(res => {
					if (res.data.code == 0) {
						this.myStars = res.data.data;
					}
				}).catch(reason=>console.log(reason))
		}
	},
};
</script>

<style scoped>
#my-stars .delete-button {
    height: 100%;
    background-color: red;
    border: 0;
    color: #fff;
  }
</style>
