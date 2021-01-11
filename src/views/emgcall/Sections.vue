<template>
	<div id="sections">
		<div class="sections-header">
			根据问题描述，已为你推荐以下科室
		</div>
        <div class="sections-tab" :class="{active: true}">
            <div class="sections-tab-tit">
                <div>全科</div>
                <span>推荐</span>
            </div>
            <div class="sections-tab-content">
                发热、咳嗽、腹泻、头痛、腹痛、腰腿痛、高血压、糖尿病、痛风、体检、皮疹、外伤
            </div>
        </div>

		<div class="sections-subtitle">
			你也可以选择其他科室
		</div>
        <div class="sections-tab">
            <div class="sections-tab-tit">
                <div>全科</div>
            </div>
            <div class="sections-tab-content">
                发热、咳嗽、腹泻、头痛、腹痛、腰腿痛、高血压、糖尿病、痛风、体检、皮疹、外伤
            </div>
        </div>
        <div class="sections-tab">
            <div class="sections-tab-tit">
                <div>全科</div>
            </div>
            <div class="sections-tab-content">
                发热、咳嗽、腹泻、头痛、腹痛、腰腿痛、高血压、糖尿病、痛风、体检、皮疹、外伤
            </div>
        </div>
        <div class="sections-tab">
            <div class="sections-tab-tit">
                <div>全科</div>
            </div>
            <div class="sections-tab-content">
                发热、咳嗽、腹泻、头痛、腹痛、腰腿痛、高血压、糖尿病、痛风、体检、皮疹、外伤
            </div>
        </div>
        <div class="sections-tab">
            <div class="sections-tab-tit">
                <div>全科</div>
            </div>
            <div class="sections-tab-content">
                发热、咳嗽、腹泻、头痛、腹痛、腰腿痛、高血压、糖尿病、痛风、体检、皮疹、外伤
            </div>
        </div>
        <div class="sections-tab">
            <div class="sections-tab-tit">
                <div>全科</div>
            </div>
            <div class="sections-tab-content">
                发热、咳嗽、腹泻、头痛、腹痛、腰腿痛、高血压、糖尿病、痛风、体检、皮疹、外伤
            </div>
        </div>

		<div class="next-btn">
			<van-button size="large" color="#00c792" round @click="next"
				>下一步</van-button
			>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {};
	},
	methods: {
		next() {},
	},
};
</script>

<style scoped>

#sections .sections-tab .sections-tab-tit > span {
    padding: 2px;
    color: #999;
    font-size: 12px;
    line-height: 14px;
    background-color: #f5f5f5;
    border-radius: 2px;
}

#sections .sections-tab .sections-tab-tit > div {
    padding: 20px 0;
    font-weight: 500;
    font-size: 17px;
    line-height: 19px;

}

#sections .sections-tab .sections-tab-content {
    padding-bottom: 20px;
    padding-left: 30px;
    color: #666;
    font-weight: 300;
    font-size: 13px;
    line-height: 1.5;
}

#sections .sections-tab .sections-tab-tit {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-left: 30px;
}

#sections .sections-tab.active .sections-tab-tit {
    color: #00c792;
}

#sections .sections-tab.active .sections-tab-tit::before {
    content: '\F0C8';
    position: absolute;
    left: 0;
    top: 20px;
    font: normal normal normal 20px/1 'vant-icon';
}

#sections .sections-tab {
    margin: 0 16px;
    position: relative;

}


#sections {
	color: #333;
	min-height: 100vh;
	padding-bottom: 100px;
}
#sections .sections-subtitle,
#sections .sections-header {
	padding: 20px 16px;
	font-weight: 500;

}
#sections .sections-header {
	font-size: 20px;
	line-height: 22px;
}
#sections .sections-subtitle {
    font-size: 18px;
    line-height: 20px;
}

#sections .next-btn {
	box-sizing: border-box;
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	padding: 10px 16px;
}
</style>
