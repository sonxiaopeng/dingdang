<template>
	<div id="epidemic">
		<div class="header">
			<h3>新型冠状病毒肺炎</h3>
			<h1 data-text="疫情实时大数据报告">疫情实时大数据报告</h1>
		</div>
		<div class="echarts">
			<div class="preview">
				<h3>国内疫情</h3>
				<div class="subtit">数据更新至 2021.01.06 22:52</div>
				<div class="content">
					<div class="flex-items">
						<div class="title">现有确诊</div>
						<div class="num color1">1848</div>
						<div class="yesterday">昨日<span class="color1">+88</span></div>
					</div>
					<div class="flex-items">
						<div class="title">无症状</div>
						<div class="num color2">670</div>
						<div class="yesterday">昨日<span class="color2">+88</span></div>
					</div>
					<div class="flex-items">
						<div class="title">现有疑似</div>
						<div class="num color3">1</div>
						<div class="yesterday">昨日<span class="color3">+88</span></div>
					</div>
					<div class="flex-items">
						<div class="title">现有重症</div>
						<div class="num color4">38</div>
						<div class="yesterday">昨日<span class="color4">+88</span></div>
					</div>
					<div class="flex-items">
						<div class="title">累计确诊</div>
						<div class="num color5">98554</div>
						<div class="yesterday">昨日<span class="color5">+88</span></div>
					</div>
					<div class="flex-items">
						<div class="title">境外输入</div>
						<div class="num color6">4489</div>
						<div class="yesterday">昨日<span class="color6">+88</span></div>
					</div>
					<div class="flex-items">
						<div class="title">累计治愈</div>
						<div class="num color7">91902</div>
						<div class="yesterday">昨日<span class="color7">+88</span></div>
					</div>
					<div class="flex-items">
						<div class="title">累计死亡</div>
						<div class="num color8">4804</div>
						<div class="yesterday">昨日<span class="color8">+88</span></div>
					</div>
				</div>
			</div>


            <div class="map-tab">
                <div class="tab-box">
                    <div :class="{active: mapTabActive == 1}" @click="setMapActive(1)">现有确诊</div>
                    <div :class="{active: mapTabActive == 2}" @click="setMapActive(2)">累计确诊</div>
                </div>
            </div>

			<div ref="mapbox" class="mapbox" :style="{ height: mapHeight }"></div>

            
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
            mapTabActive: 1,
            mapHeight: "300px",
            mapOption: {
				title: {
					subtext: "现有确诊病例数，排除治愈、死亡",
                    left: "center",
                    
				},
				tooltip: {
					trigger: "item",
				},
				visualMap: {
					// type: piecewise,
					pieces: [
						{ min: 10000,  label: "≥10000" }, // 不指定 max，表示 max 为无限大（Infinity）。
						{ min: 1000, max: 9999,  label: "1000-9999" },
						{ min: 100, max: 999,  label: "100-999" },
						{ min: 10, max: 99, label: "10-99" },
						{ min: 1, max: 9,  label: "1-9" },
						{ value: 0, label: "0" }, // 表示 value 等于 123 的情况。
					],
					textStyle: {
						fontSize: 8,
                    },
                    itemWidth: 12,
                    itemHeight: 10,
                     itemGap : 4,
					left: 10,
					top: "bottom",
					selectedMode: "multiple",
					inRange: {
						color: ["white", "#ffe5db", "#ff9985", "#f57567", "#e64546", "#b80909"],
					},
                },
                backgroundColor: '#f8f9fa',
				series: [
					{
						name: "累计感染人数",
						type: "map",
						mapType: "china",
						roam: false,
						label: {
							normal: {
                                show: true,
                                textStyle: {
                                fontSize: 8,
                            }
							},
							emphasis: {
								show: false,
							},
						},
						showLegendSymbol: true,
						data: [
							{ name: "湖北", value: 68149 },
							{ name: "香港", value: 9414 },
							{ name: "广东", value: 2084 },
							{ name: "上海", value: 1583 },
							{ name: "浙江", value: 1309 },
							{ name: "河南", value: 1303 },
							{ name: "黑龙江", value: 1074 },
							{ name: "湖南", value: 1022 },
							{ name: "北京", value: 999 },
							{ name: "安徽", value: 993 },
							{ name: "新疆", value: 980 },
							{ name: "河北", value: 941 },
							{ name: "江西", value: 935 },
							{ name: "山东", value: 864 },
							{ name: "四川", value: 858 },
							{ name: "台湾", value: 843 },
							{ name: "江苏", value: 688 },
							{ name: "重庆", value: 590 },
							{ name: "福建", value: 529 },
							{ name: "陕西", value: 526 },
							{ name: "辽宁", value: 396 },
							{ name: "内蒙古", value: 366 },
							{ name: "天津", value: 324 },
							{ name: "广西", value: 266 },
							{ name: "云南", value: 231 },
							{ name: "山西", value: 227 },
							{ name: "甘肃", value: 182 },
							{ name: "海南", value: 171 },
							{ name: "吉林", value: 157 },
							{ name: "贵州", value: 147 },
							{ name: "宁夏", value: 75 },
							{ name: "澳门", value: 46 },
							{ name: "青海", value: 18 },
							{ name: "西藏", value: 1 },
						],
					},
				],
			},
		};
	},
	mounted() {
		this.mapHeight = (document.documentElement.clientWidth * 300) / 375 + "px";
		this.drawMap();
	},
	methods: {
        setMapActive(index){
            this.mapTabActive = index;
        },
		drawMap() {
			console.log(this.$echarts);
			let map = this.$echarts.init(this.$refs.mapbox);
			map.setOption(this.mapOption);
		},
	},
};
</script>

<style scoped>

#epidemic .echarts .map-tab .tab-box > div.active {
    background-color: #fff;
    font-weight: 700;
}

#epidemic .echarts .map-tab .tab-box > div {
    flex: 1;
    border-radius: 6px;
    height: 100%;
    overflow: hidden;
    text-align: center;
    font-size: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
}

#epidemic .echarts .map-tab .tab-box {
    background-color: #e3e6eb;
    border-radius: 6px;
    height: 100%;
    display: flex;
    padding: 3px;
}

#epidemic .echarts .map-tab {
    height: 70px;
    background-color: #f8f9fa;
    padding: 20px 20px 10px;
    box-sizing: border-box;
}

.color8 {
	color: #4d5054;
}

.color7 {
	color: #10aeb5;
}

.color6 {
	color: #476da0;
}

.color5 {
	color: #e83132;
}

.color4 {
	color: #545499;
}

.color3 {
	color: #ec9217;
}

.color2 {
	color: #e86d48;
}

.color1 {
	color: #ff6a57;
}

#epidemic .echarts .preview .content .flex-items .yesterday {
	font-size: 12px;
	height: 16px;
	line-height: 16px;
	color: #999;
	margin-top: 5px;
}

#epidemic .echarts .preview .content .flex-items .num {
	font-size: 20px;
	height: 26px;
	line-height: 26px;
	font-family: PingFangSC-Medium;
	font-weight: 700;
}

#epidemic .echarts .preview .content .flex-items .title {
	margin-bottom: 10px;
	font-size: 15px;
}

#epidemic .echarts .preview .content .flex-items {
	box-sizing: border-box;
	flex: 0 0 25%;
	padding: 5px;
	text-align: center;
	position: relative;
	margin-bottom: 10px;
}

#epidemic .echarts .preview .content {
	padding-top: 20px;
	display: flex;
	flex-flow: row wrap;
}

#epidemic .echarts .preview .subtit {
	color: #999;
	font-size: 14px;
}

#epidemic .echarts .preview h3 {
	font-weight: 700;
	margin-bottom: 10px;
}

#epidemic .echarts .preview {
	padding: 20px;
}

#epidemic .echarts {
	padding-top: 10px;
	background-color: #fff;
	border-radius: 20px;
	overflow: hidden;
}

#epidemic .header h1::after {
	content: attr(data-text);
	display: block;
	position: absolute;
	color: #afdade;
	top: 0;
	-webkit-mask-image: -webkit-gradient(linear, 0 0, 0 bottom, from(rgba(0, 0, 255, 0)), to(#afdade));
}

#epidemic .header h1 {
	position: relative;
	margin-top: 8px;
	padding-left: 17px;
	font-size: 1.5rem;
	height: 1.5rem;
	max-width: 100%;
	line-height: 1.5rem;
	white-space: nowrap;
	font-weight: 700;
	color: #fff;
}

#epidemic .header h3 {
	display: inline-block;
	margin-top: 71px;
	margin-left: 17px;
	/* font-size: .875rem; */
	color: #c4faff;
	letter-spacing: 2px;
}

#epidemic .header {
	color: #fff;
	background-size: cover;
	position: relative;
	z-index: -1;
	background-position: 50%;
	background-repeat: no-repeat;
	padding: 0;
	height: 187px;
	margin-bottom: -20px;
	background-color: #10aeb5;
	background-image: url(../../assets/images/home/bg-header.840c435.jpg);
}

#epidemic .mapbox {
	width: 100%;
	/* background-color: #000; */
}
</style>
