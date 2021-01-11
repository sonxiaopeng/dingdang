<template>
	<div class="article-list">
        <router-link :to="url">

            <van-cell :center="true">
                <!-- 使用 title 插槽来自定义标题 -->
                <template #title>
                    <p class="title" v-html="title" ref="tit"></p>
                    <p class="desc" :style="{'-webkit-line-clamp': lines}">{{ content }}</p>
                </template>
                <!-- 使用 right-icon 插槽来自定义右侧图标 -->
                <template #right-icon>
                    <van-image :src="require(`@/assets/images${imgurl}`)" />
                </template>
            </van-cell>
        </router-link>
	</div>
</template>

<script>
export default {
    props: ["title", "content", "imgurl", 'url'],
    data(){
        return {
            lines: 2
        }
    },
    mounted(){
        if(this.$refs.tit.offsetHeight > 24){
            this.lines = 1;
        }
    }
};
</script>

<style>
.article-list {
	position: relative;
}

.article-list::after {
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

.article-list .van-image {
	width: 80px;
	height: 80px;
}

.article-list .van-image img {
	object-fit: cover;
    width: 100%;
    height: 100%;
}
    
.article-list .title,
.article-list .desc {
	-webkit-box-orient: vertical;
	word-break: break-all;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	-webkit-line-clamp: 2;
	display: -webkit-box;
}

.article-list .title {
	font-size: 17px;
	font-weight: 500;
	color: #333;
	margin-bottom: 10px;
	line-height: 24px;
}

.article-list .desc {
	font-size: 13px;
	font-weight: 300;
	color: #4d4d4d;
	line-height: 18px;
}
</style>
