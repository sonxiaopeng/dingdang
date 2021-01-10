<template>
	<div class="keywords-tags" :selected="tagactive">
		<van-tag size="large" :name="index" v-for="(item, index) of keywords" 
            :key="index"
            :class="{active: tagactive == index}"
            @click="setActive(index)">
                {{ item }}
        </van-tag>
	</div>
</template>

<script>
export default {
	props: ["keywords"],
	data() {
		return {
			tagactive: 0,
		};
    },
    methods: {
        setActive(index){
            this.tagactive = index
        }
    }
};
</script>

<style>
.keywords-tags {
	padding: 8px 4px 20px 16px;
	display: flex;
	flex-flow: row wrap;
	align-items: center;
}

.keywords-tags .van-tag {
	padding: 8px 12px;
	font-weight: 300;
	font-size: 14px;
	line-height: 16px;
	white-space: nowrap;
	text-overflow: ellipsis;
	border-radius: 2px;
	max-width: 343px;
	margin: 12px 12px 0 0;
    overflow: hidden;
    color: #4d4d4d;
	background-color:#fafafa;
}

.keywords-tags .van-tag.active {
	color: #00c792;
	background-color: #e5f9f4;
}
</style>
