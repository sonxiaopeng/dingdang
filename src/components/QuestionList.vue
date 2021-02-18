<template>
	<div class="question-list" @click="gotoDetail(index)">
		<div class="question-list-header">
			<div class="img"><img :src="`http://localhost:3000/${imgurl}`" alt="" /></div>
			<p>{{ nickname | nicknameFormat}}</p>
		</div>
		<div class="question-list-content">
			{{ describe }}
		</div>
		<div class="question-list-footer">{{ committime | dateFormat }}</div>
	</div>
</template>

<script>
export default {
	props: ["imgurl", "nickname", "describe", "committime", "index"],
	methods: {
		gotoDetail(index) {
			this.$router.push({
                path: `/question/details/${index}`
                
            });
		},
	},
};
</script>

<style>
.question-list {
	background: #fff;
	padding: 20px 16px;
	position: relative;
}

.question-list::after {
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

.question-list .question-list-header {
	display: flex;
	align-items: center;
	line-height: 20px;
}

.question-list .question-list-header .img {
	width: 20px;
	height: 20px;
	border-radius: 50%;
	overflow: hidden;
	border: 1px solid #ebebeb;
	box-sizing: border-box;
}

.question-list .question-list-header .img img {
	width: 100%;
	object-fit: contain;
}

.question-list .question-list-header p {
	font-size: 17px;
	font-weight: 500;
	line-height: 19px;
	color: #333;
	margin-left: 6px;
}

.question-list .question-list-content {
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

.question-list .question-list-footer {
	font-size: 12px;
	font-weight: 300;
	line-height: 14px;
	color: #999;
	margin-top: 12px;
}
</style>
