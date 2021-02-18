<template>
	<div class="order-list" @click="gotoDetail(index)">
		<div class="order-list-header">
			<div class="img"><img :src="require(`@/assets/${imgurl}`)" alt="" /></div>
			<p>{{ nickname}}</p>
		</div>
		<div class="order-list-content">
			{{ describe }}
		</div>
		<div class="order-list-footer">{{ committime | dateFormat }}</div>
	</div>
</template>

<script>
export default {
	props: ["imgurl", "nickname", "describe", "committime", "index"],
	methods: {
		gotoDetail(index) {
			// this.$router.push({
            //     path: `/order/details/${index}`
                
            // });
		},
	},
};
</script>

<style>
.order-list {
	background: #fff;
	padding: 20px 16px;
	position: relative;
}

.order-list::after {
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

.order-list .order-list-header {
	display: flex;
	align-items: center;
	line-height: 20px;
}

.order-list .order-list-header .img {
	width: 20px;
	height: 20px;
	border-radius: 50%;
	overflow: hidden;
    border: 1px solid #eee;
}

.order-list .order-list-header .img img {
	width: 100%;
    height: 100%;
	object-fit: contain;
    margin-top: -1px;
}

.order-list .order-list-header p {
	font-size: 17px;
	font-weight: 500;
	line-height: 19px;
	color: #333;
	margin-left: 6px;
}

.order-list .order-list-content {
	font-size: 16px;
	font-weight: 300;
	line-height: 24px;
	color: #4d4d4d;
	margin-top: 12px;
	display: -webkit-box;
	word-break: break-all;
	overflow: hidden;
	-webkit-line-clamp: 3;
	text-overflow: ellipsis;
	-webkit-box-orient: vertical;
	white-space: normal;
}

.order-list .order-list-footer {
	font-size: 12px;
	font-weight: 300;
	line-height: 14px;
	color: #999;
	margin-top: 12px;
}
</style>
