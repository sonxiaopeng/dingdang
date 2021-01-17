<template>
	<div id="epidemic" ref="epidemic">
		<div class="header">
			<h3>新型冠状病毒肺炎</h3>
			<h1 data-text="疫情实时大数据报告">疫情实时大数据报告</h1>
			<img src="@/assets/images/home/logo.png" alt="" />
		</div>
		<div class="echarts">
			<div class="preview">
				<h3>国内疫情</h3>
				<div class="subtit">数据更新至 {{ updateTime }}</div>
				<div class="content">
					<div class="flex-items">
						<div class="title">现有确诊</div>
						<div class="num color1">{{ country.currentConfirmedCount }}</div>
						<div class="yesterday">
							昨日<span class="color1">+{{ country.currentConfirmedIncr }}</span>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">无症状</div>
						<div class="num color2">{{ country.seriousCount }}</div>
						<div class="yesterday">
							昨日<span class="color2">+{{ country.seriousIncr }}</span>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">现有疑似</div>
						<div class="num color3">{{ aliData.incDoubtful }}</div>
						<div class="yesterday">
							昨日<span class="color3">+{{ aliData.incDoubtful }}</span>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">现有重症</div>
						<div class="num color4">38</div>
						<div class="yesterday">昨日<span class="color4">+0</span></div>
					</div>
					<div class="flex-items">
						<div class="title">累计确诊</div>
						<div class="num color5">{{ country.confirmedCount }}</div>
						<div class="yesterday">
							昨日<span class="color5">+{{ country.confirmedIncr }}</span>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">境外输入</div>
						<div class="num color6">{{ country.suspectedCount }}</div>
						<div class="yesterday">
							昨日<span class="color6">+{{ country.suspectedIncr }}</span>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">累计治愈</div>
						<div class="num color7">{{ country.curedCount }}</div>
						<div class="yesterday">
							昨日<span class="color7">+{{ country.curedIncr }}</span>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">累计死亡</div>
						<div class="num color8">{{ country.deadCount }}</div>
						<div class="yesterday">
							昨日<span class="color8">+{{ country.deadIncr }}</span>
						</div>
					</div>
				</div>
			</div>

			<div class="map-tab">
				<div class="tab-box">
					<div :class="{ active: mapTabActive == 1 }" @click="setMapActive(1)">现有确诊</div>
					<div :class="{ active: mapTabActive == 2 }" @click="setMapActive(2)">累计确诊</div>
				</div>
			</div>

			<div ref="mapbox" class="mapbox" :style="{ height: mapHeight }"></div>

			<div class="my-charts">
				<div class="new-added" ref="newadded" :style="{ width: '100%', height: chartHeight }"></div>

				<div class="out-added" ref="outadded" :style="{ width: '100%', height: chartHeight }"></div>

				<div class="whole-added" ref="wholeadded" :style="{ width: '100%', height: chartHeight }"></div>

				<div class="summary">
					<div class="title">国内各地区疫情统计汇总</div>
					<div class="subtitle">7:00-10:00为更新高峰，数据若滞后敬请谅解</div>
				</div>
                <div class="summary-hd">
                    <div>疫情地区</div>
                    <div>确诊</div>
                    <div>治愈</div>
                    <div>死亡</div>
                </div>
                <div class="summary-bd" v-for="(item, index) of summary" :key="index">
                    <div>
                        <div class="summary-bd-content">
                            <div class="tit" @click="showCitys(item)">
                                <span class="arrow" v-if="item.cityArray.length > 1"></span>
                                <span>{{item.childStatistic.replace(/(省|市|中国|自治区|维吾尔|回族|壮族)/g, "")}}</span>
                            </div>
                            <div>{{item.totalConfirmed}}</div>
                            <div>{{item.totalCured}}</div>
                            <div>{{item.totalDeath}}</div>
                        </div>
                        <div class="city-box" v-if="item.show">
                            <div class="city-content" v-for="(city, i) of item.cityArray" :key="i">
                                <div class="tit">{{city.childStatistic.replace(/(省|市|中国|自治区|维吾尔|回族|壮族)/g, "")}}</div>
                                <div>{{city.totalConfirmed}}</div>
                                <div>{{city.totalCured}}</div>
                                <div>{{city.totalDeath}}</div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>

		<div class="footer">
			<div class="msg">积极防护，保护自己，戴口罩，勤洗手</div>
			<div class="tips">
				<div>上叮当医生APP搜索 新型冠状病毒肺炎</div>
				<div>了解最新进展及权威预防知识</div>
			</div>
		</div>
	</div>
</template>

<script>
import moment from "moment";
export default {
	data() {
		return {
            summary: [],
			country: {
				confirmedCount: 98627, // 累计确诊人数
				confirmedIncr: 168, // 相比昨天累计确诊人数
				createTime: 1579537899000, // 数据统计截止时间
				curedCount: 91909, // 	累计治愈人数
				curedIncr: 68, // 相比昨天新增治愈人数
				currentConfirmedCount: 1914, // 现存确诊人数
				currentConfirmedIncr: 99, // 相比昨天现存确诊人数
				deadCount: 4804, // 	累计死亡人数
				deadIncr: 1, // 相比昨天新增死亡人数
				seriousCount: 746, // 	现存无症状人数
				seriousIncr: 76, // 	相比昨天现存无症状人数
				suspectedCount: 4502, // 	累计境外输入人数
				suspectedIncr: 13, // 新增境外输入人数
			},
			aliData: {
				incDoubtful: 1,
				totalDoubtful: 2,
			},
			updateTime: "",
			mapTabActive: 2,
			mapHeight: "300px",
			chartHeight: "300px",
			mapOption: {
				title: {
					subtext: "累计确诊病例数，包含治愈、死亡",
					left: "center",
				},
				tooltip: {
					trigger: "item",
				},
				visualMap: {
					// type: piecewise,
					pieces: [
						{ min: 10000, label: "≥10000" }, // 不指定 max，表示 max 为无限大（Infinity）。
						{ min: 1000, max: 9999, label: "1000-9999" },
						{ min: 100, max: 999, label: "100-999" },
						{ min: 10, max: 99, label: "10-99" },
						{ min: 1, max: 9, label: "1-9" },
						{ value: 0, label: "0" }, // 表示 value 等于 123 的情况。
					],
					textStyle: {
						fontSize: 8,
					},
					itemWidth: 12,
					itemHeight: 10,
					itemGap: 4,
					left: 10,
					top: "bottom",
					selectedMode: "multiple",
					inRange: {
						color: ["white", "#ffe5db", "#ff9985", "#f57567", "#e64546", "#b80909"],
					},
				},
				backgroundColor: "#f8f9fa",
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
								},
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
			newAddedOption: {
				title: {
					text: "新增确诊分布",
					subtext: "单位：例",
					left: 0,
					textStyle: {
						fontWeight: "normal",
						fontSize: 14,
						color: "black",
					},
					subtextStyle: {
						fontSize: 10,
					},
				},
				tooltip: {
					trigger: "axis",
				},
				legend: {
					data: ["本土新增", "境外输入"],
					right: 0,
					top: 10,
					height: 10,
					itemHeight: 6,
					itemWidth: 6,
					textStyle: {
						color: "#666",
					},
				},
				grid: {
					left: "3%",
					right: "4%",
					bottom: "3%",
					containLabel: true,
				},

				xAxis: {
					type: "category",
					boundaryGap: true,
					axisLine: {
						show: false,
					},
					axisTick: {
						show: false,
					},
					axisLabel: {
						rotate: 45,
						fontSize: 10,
					},
					data: ["河北", "黑龙江", "吉林", "上海", "北京", "四川", "广东", "福建", "天津", "山东"],
				},
				yAxis: {
					type: "value",
					min: 0,
					max: 100,
				},
				series: [
					{
						name: "本土新增",
						type: "bar",
						barWidth: 10,
						stack: "new",
						itemStyle: { color: "#e83132" },
						data: [72, 12, 10, 0, 2, 0, 0, 0, 0, 0],
					},
					{
						name: "境外输入",
						type: "bar",
						barWidth: 10,
						stack: "new",
						itemStyle: { color: "#476da0" },
						data: [0, 0, 0, 4, 0, 2, 2, 2, 1, 1],
					},
				],
			},
			outAddOption: {
				title: {
					text: "境外输入新增趋势",
					subtext: "单位：例",
					left: 0,
					textStyle: {
						fontWeight: "normal",
						fontSize: 14,
						color: "black",
					},
					subtextStyle: {
						fontSize: 10,
					},
				},
				tooltip: {
					trigger: "axis",
				},
				legend: {
					data: ["新增境外输入"],
					right: 0,
					top: 10,
					height: 10,
					itemHeight: 6,
					itemWidth: 6,
					textStyle: {
						color: "#666",
					},
				},
				grid: {
					left: "3%",
					right: "4%",
					bottom: "3%",
					containLabel: true,
				},
				xAxis: {
					type: "category",
					boundaryGap: true,
					axisLine: {
						show: false,
					},
					axisTick: {
						show: false,
					},
					axisLabel: {
						rotate: 45,
						fontSize: 10,
					},
					data: [
						"2.21",
						"2.22",
						"2.23",
						"2.24",
						"2.25",
						"2.26",
						"2.27",
						"2.28",
						"2.29",
						"3.1",
						"3.2",
						"3.3",
						"3.4",
						"3.5",
						"3.6",
						"3.7",
						"3.8",
						"3.9",
						"3.10",
						"3.11",
						"3.12",
						"3.13",
						"3.14",
						"3.15",
						"3.16",
						"3.17",
						"3.18",
						"3.19",
						"3.20",
						"3.21",
						"3.22",
						"3.23",
						"3.24",
						"3.25",
						"3.26",
						"3.27",
						"3.28",
						"3.29",
						"3.30",
						"3.31",
						"4.1",
						"4.2",
						"4.3",
						"4.4",
						"4.5",
						"4.6",
						"4.7",
						"4.8",
						"4.9",
						"4.10",
						"4.11",
						"4.12",
						"4.13",
						"4.14",
						"4.15",
						"4.16",
						"4.17",
						"4.18",
						"4.19",
						"4.20",
						"4.21",
						"4.22",
						"4.23",
						"4.24",
						"4.25",
						"4.26",
						"4.27",
						"4.28",
						"4.29",
						"4.30",
						"5.1",
						"5.2",
						"5.3",
						"5.4",
						"5.5",
						"5.6",
						"5.7",
						"5.8",
						"5.9",
						"5.10",
						"5.11",
						"5.12",
						"5.13",
						"5.14",
						"5.15",
						"5.16",
						"5.17",
						"5.18",
						"5.19",
						"5.20",
						"5.21",
						"5.22",
						"5.23",
						"5.24",
						"5.25",
						"5.26",
						"5.27",
						"5.28",
						"5.29",
						"5.30",
						"5.31",
						"6.1",
						"6.2",
						"6.3",
						"6.4",
						"6.5",
						"6.6",
						"6.7",
						"6.8",
						"6.9",
						"6.10",
						"6.11",
						"6.12",
						"6.13",
						"6.14",
						"6.15",
						"6.16",
						"6.17",
						"6.18",
						"6.19",
						"6.20",
						"6.21",
						"6.22",
						"6.23",
						"6.24",
						"6.25",
						"6.26",
						"6.27",
						"6.28",
						"6.29",
						"6.30",
						"7.1",
						"7.2",
						"7.3",
						"7.4",
						"7.5",
						"7.6",
						"7.7",
						"7.8",
						"7.9",
						"7.10",
						"7.11",
						"7.12",
						"7.13",
						"7.14",
						"7.15",
						"7.16",
						"7.17",
						"7.18",
						"7.19",
						"7.20",
						"7.21",
						"7.22",
						"7.23",
						"7.24",
						"7.25",
						"7.26",
						"7.27",
						"7.28",
						"7.29",
						"7.30",
						"7.31",
						"8.1",
						"8.2",
						"8.3",
						"8.4",
						"8.5",
						"8.6",
						"8.7",
						"8.8",
						"8.9",
						"8.10",
						"8.11",
						"8.12",
						"8.13",
						"8.14",
						"8.15",
						"8.16",
						"8.17",
						"8.18",
						"8.19",
						"8.20",
						"8.21",
						"8.22",
						"8.23",
						"8.24",
						"8.25",
						"8.26",
						"8.27",
						"8.28",
						"8.29",
						"8.30",
						"8.31",
						"9.1",
						"9.2",
						"9.3",
						"9.4",
						"9.5",
						"9.6",
						"9.7",
						"9.8",
						"9.9",
						"9.10",
						"9.11",
						"9.12",
						"9.13",
						"9.14",
						"9.15",
						"9.16",
						"9.17",
						"9.18",
						"9.19",
						"9.20",
						"9.21",
						"9.22",
						"9.23",
						"9.24",
						"9.25",
						"9.26",
						"9.27",
						"9.28",
						"9.29",
						"9.30",
						"10.1",
						"10.2",
						"10.3",
						"10.4",
						"10.5",
						"10.6",
						"10.7",
						"10.8",
						"10.9",
						"10.10",
						"10.11",
						"10.12",
						"10.13",
						"10.14",
						"10.15",
						"10.16",
						"10.17",
						"10.18",
						"10.19",
						"10.20",
						"10.21",
						"10.22",
						"10.23",
						"10.24",
						"10.25",
						"10.26",
						"10.27",
						"10.28",
						"10.29",
						"10.30",
						"10.31",
						"11.1",
						"11.2",
						"11.3",
						"11.4",
						"11.5",
						"11.6",
						"11.7",
						"11.8",
						"11.9",
						"11.10",
						"11.11",
						"11.12",
						"11.13",
						"11.14",
						"11.15",
						"11.16",
						"11.17",
						"11.18",
						"11.19",
						"11.20",
						"11.21",
						"11.22",
						"11.23",
						"11.24",
						"11.25",
						"11.26",
						"11.27",
						"11.28",
						"11.29",
						"11.30",
						"12.1",
						"12.2",
						"12.3",
						"12.4",
						"12.5",
						"12.6",
						"12.7",
						"12.8",
						"12.9",
						"12.10",
						"12.11",
						"12.12",
						"12.13",
						"12.14",
						"12.15",
						"12.16",
						"12.17",
						"12.18",
						"12.19",
						"12.20",
						"12.21",
						"12.22",
						"12.23",
						"12.24",
						"12.25",
						"12.26",
						"12.27",
						"12.28",
						"12.29",
						"12.30",
						"12.31",
						"1.1",
						"1.2",
						"1.3",
						"1.4",
						"1.5",
						"1.6",
						"1.7",
						"1.8",
						"1.9",
						"1.10",
						"1.11",
						"1.12",
						"1.13",
						"1.14",
						"1.15",
						"1.16",
						"1.17",
					],
				},
				yAxis: {
					type: "value",
					min: 0,
					max: 100,
				},
				series: [
					{
						name: "新增境外输入",
						type: "line",
						symbol: "none",
						itemStyle: { color: "#476da0" },
						data: [
							7,
							2,
							26,
							26,
							27,
							23,
							27,
							15,
							17,
							15,
							19,
							18,
							29,
							9,
							2,
							22,
							7,
							6,
							16,
							7,
							12,
							1,
							1,
							15,
							6,
							1,
							45,
							50,
							54,
							57,
							58,
							53,
							55,
							50,
							52,
							56,
							55,
							78,
							90,
							30,
							20,
							29,
							9,
							8,
							0,
							4,
							8,
							2,
							12,
							22,
							26,
							27,
							29,
							23,
							28,
							8,
							0,
							19,
							0,
							23,
							13,
							23,
							24,
							9,
							29,
							1,
							13,
							15,
							10,
							10,
							11,
							16,
							7,
							9,
							18,
							16,
							22,
							4,
							10,
							16,
							7,
							19,
							27,
							14,
							22,
							18,
							22,
							25,
							21,
							12,
							10,
							18,
							6,
							19,
							10,
							25,
							11,
							26,
							1,
							7,
							6,
							22,
							8,
							11,
							29,
							17,
							18,
							14,
							1,
							2,
							7,
							27,
							5,
							10,
							17,
							20,
							12,
							12,
							9,
							26,
							28,
							26,
							25,
							21,
							18,
							9,
							19,
							11,
							10,
							25,
							4,
							9,
							23,
							17,
							15,
							27,
							7,
							29,
							26,
							8,
							19,
							26,
							0,
							5,
							29,
							0,
							9,
							2,
							25,
							27,
							15,
							0,
							9,
							25,
							22,
							15,
							29,
							0,
							9,
							13,
							20,
							27,
							5,
							6,
							26,
							22,
							15,
							11,
							12,
							14,
							29,
							0,
							28,
							13,
							3,
							4,
							20,
							13,
							13,
							27,
							28,
							12,
							8,
							18,
							19,
							18,
							12,
							4,
							11,
							20,
							27,
							27,
							25,
							24,
							10,
							11,
							18,
							24,
							13,
							16,
							10,
							4,
							6,
							15,
							25,
							5,
							23,
							29,
							4,
							13,
							28,
							16,
							22,
							28,
							21,
							9,
							5,
							18,
							22,
							0,
							25,
							0,
							5,
							23,
							13,
							27,
							19,
							16,
							0,
							13,
							24,
							12,
							12,
							4,
							2,
							12,
							9,
							9,
							12,
							7,
							14,
							11,
							16,
							12,
							8,
							7,
							12,
							16,
							17,
							12,
							17,
							8,
							0,
							12,
							12,
							28,
							12,
							27,
							27,
							7,
							16,
							0,
							4,
							20,
							11,
							2,
							25,
							1,
							26,
							19,
							13,
							6,
							18,
							3,
							15,
							9,
							21,
							23,
							20,
							11,
							18,
							18,
							18,
							25,
							13,
							1,
							10,
							25,
							23,
							0,
							18,
							14,
							3,
							16,
							6,
							22,
							17,
							7,
							4,
							11,
							0,
							16,
							6,
							26,
							27,
							28,
							28,
							15,
							23,
							12,
							0,
							22,
							1,
							23,
							20,
							0,
							8,
							27,
							24,
							17,
							2,
							16,
							27,
							12,
							16,
							16,
							18,
							27,
							9,
							2,
							6,
							14,
						],
					},
				],
			},
			wholeAddOption: {
				title: {
					text: "全国 总新增确诊/新增境外输入确诊 趋势",
					subtext: "单位：例",
					left: 0,
					textStyle: {
						fontWeight: "normal",
						fontSize: 14,
						color: "black",
					},
					subtextStyle: {
						fontSize: 10,
					},
				},
				tooltip: {
					trigger: "axis",
				},
				legend: {
					data: ["总新增输入", "新增境外输入"],
					right: 0,
					top: 25,
					height: 10,
					itemHeight: 6,
					itemWidth: 6,
					textStyle: {
						color: "#666",
					},
				},
				grid: {
					left: "3%",
					right: "4%",
					bottom: "3%",
					containLabel: true,
				},
				xAxis: {
					type: "category",
					boundaryGap: true,
					axisLine: {
						show: false,
					},
					axisTick: {
						show: false,
					},
					axisLabel: {
						rotate: 45,
						fontSize: 10,
					},
					data: [
						"湖北",
						"香港",
						"广东",
						"上海",
						"浙江",
						"河南",
						"黑龙江",
						"湖南",
						"北京",
						"安徽",
						"新疆",
						"河北",
						"江西",
						"山东",
						"四川",
						"台湾",
						"江苏",
						"重庆",
						"福建",
						"陕西",
						"辽宁",
						"内蒙古",
						"天津",
						"广西",
						"云南",
						"山西",
						"甘肃",
						"海南",
						"吉林",
						"贵州",
						"宁夏",
						"澳门",
						"青海",
						"西藏",
					],
				},
				yAxis: {
					type: "value",
					min: 0,
					max: 10000,
				},
				series: [
					{
						name: "总新增输入",
						type: "line",
						symbol: "none",
						itemStyle: { color: "#e83132" },
						data: [
							8149,
							9414,
							2084,
							1583,
							1309,
							1303,
							1074,
							1022,
							999,
							993,
							980,
							941,
							935,
							864,
							858,
							843,
							688,
							590,
							529,
							526,
							396,
							366,
							324,
							266,
							231,
							227,
							182,
							171,
							157,
							147,
							75,
							46,
							18,
							1,
						],
					},
					{
						name: "新增境外输入",
						type: "line",
						symbol: "none",
						itemStyle: { color: "#476da0" },
						data: [
							18,
							46,
							999,
							993,
							980,
							941,
							935,
							864,
							1074,
							858,
							843,
							324,
							1022,
							157,
							590,
							529,
							231,
							147,
							1309,
							75,
							526,
							1,
							396,
							1583,
							366,
							688,
							1303,
							266,
							227,
							182,
							171,
							2084,
							8149,
							9414,
						],
					},
				],
			},
		};
	},
	mounted() {
        document.body.scrollTop = 0;
		this.mapHeight = (document.documentElement.clientWidth * 300) / 375 + "px";
		this.chartHeight = (this.$refs.newadded.clientWidth * 300) / 375 + "px";
		Promise.all([
			this.axios({
				method: "get",
				url: "https://ncovdata.market.alicloudapi.com/ncov/cityDiseaseInfoWithTrend",
				headers: { Authorization: "APPCODE b4a153dc3bf84a62a64d1cc6cd573d30" },
			}),
			this.axios({
				method: "post",
				url: "http://api.tianapi.com/txapi/ncov/index",
				params: {
					key: "df363592f492807099b296206eee06be",
				},
			}),
		])
			.then((res) => {
				let aliData = res[0].data;
				let tianData = res[1].data.newslist[0].desc;
				let tianDNews = res[1].data.newslist[0].news;
				this.updateTime = aliData.country.time.replace(/-/g, ".");
				for (var key in this.country) {
					this.$set(this.country, key, tianData[key]);
				}
				for (var key in this.aliData) {
					this.$set(this.aliData, key, aliData.country[key]);
				}

				this.mapOption.series[0].data = aliData.provinceArray.map((item) => {
					return {
						name: item.childStatistic.replace(/(省|市|中国|自治区|维吾尔|回族|壮族)/g, ""),
						value: item.totalConfirmed,
					};
                });
                
                this.summary = aliData.provinceArray
                this.summary.forEach(item=>{
                    this.$set(item, 'show', false)
                })
				// this.outAddOption.series[0].data

				// console.log(res);
				console.log(aliData, tianData, tianDNews);

				this.drawMap();
				this.drawNewAdded();
				this.drawOutAdded();
				this.drawWholeAdded();
			})
			.catch((reason) => console.log(reason));

		
	},
	methods: {
        showCitys(item){
            if(item.cityArray.length > 1){
                item.show = !item.show
            }
        },
		setMapActive(index) {
			this.mapTabActive = index;
		},
		drawMap() {
			let map = this.$echarts.init(this.$refs.mapbox);
			map.setOption(this.mapOption);
		},
		drawNewAdded() {
			let newAdded = this.$echarts.init(this.$refs.newadded);
			newAdded.setOption(this.newAddedOption);
		},
		drawOutAdded() {
			let outAdded = this.$echarts.init(this.$refs.outadded);
			outAdded.setOption(this.outAddOption);
		},
		drawWholeAdded() {
			let wholeAdded = this.$echarts.init(this.$refs.wholeadded);
			wholeAdded.setOption(this.wholeAddOption);
		},
	},
};
</script>

<style scoped>

#epidemic .echarts .summary-bd .city-box .city-content > div.tit {
    color: #00bec9;
    font-weight: 700;
}

#epidemic .echarts .summary-bd .city-box .city-content > div {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 12px;
}

#epidemic .echarts .summary-bd .city-box .city-content:last-child {
    border: 0;
}

#epidemic .echarts .summary-bd .city-box .city-content {
    display: flex;
    padding: 15px 0;
    border-bottom: 1px solid #eee;
}

#epidemic .echarts .summary-bd .summary-bd-content > div.tit span.arrow {
    position: absolute;
    top: 50%;
    left: 10px;
    transform: translateY(-50%);
    width: 10px;
    height: 5px;
    background-image: url(../../assets/images/home/arrow.png);
    background-repeat: no-repeat;
    background-size: contain;
    vertical-align: middle;
}

#epidemic .echarts .summary-bd .summary-bd-content > div.tit {
    position: relative;
    font-weight: 700;
    color: #fff;
    background-color: #00bec9;
    
}

#epidemic .echarts .summary-bd .summary-bd-content > div {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px 0;
}

#epidemic .echarts .summary-bd .summary-bd-content {
    background-color: #f5f6f7;
    display: flex;
    justify-content: space-between;
    border-radius: 4px;
    overflow: hidden;
    color: #555;
    font-size: 12px;
}

#epidemic .echarts .summary-bd {
    margin-bottom: 5px;
}

#epidemic .echarts .summary-hd > div {
    flex: 1;
    background-color: #f5f6f7;
    border: 1px solid #fff;
    font-size: 12px;
    font-weight: 700;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px 0;
}

#epidemic .echarts .summary-hd {
    display: flex;
    justify-content: space-between;
    border-radius: 4px;
    overflow: hidden;
    color: #555;
    margin-bottom: 5px;
}

#epidemic .footer .tips > div {
	margin-bottom: 5px;
}

#epidemic .footer .tips {
	font-size: 14px;
	color: #fff;
	text-align: center;
	opacity: 0.7;
	padding-bottom: 30px;
}

#epidemic .footer .msg::before {
	background: linear-gradient(to left, #10aeb5, white);
	left: 10px;
}

#epidemic .footer .msg::after {
	background: linear-gradient(to right, #10aeb5, white);
	right: 10px;
}

#epidemic .footer .msg::before,
#epidemic .footer .msg::after {
	content: "";
	position: absolute;
	top: 50%;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	transform: translateY(-50%);
}

#epidemic .footer .msg {
	position: relative;
	background-color: #fff;
	border-radius: 10px;
	font-weight: 700;
	margin: 20px 20px;
	padding: 20px;
	text-align: center;
}

#epidemic .footer {
	margin-top: -20px;
	padding-top: 20px;
	background-color: #10aeb5;
	position: relative;
	z-index: -1;
}

#epidemic .my-charts .summary .subtitle {
	margin-top: 8px;
	color: #999;
	font-size: 12px;
}

#epidemic .my-charts .summary {
	padding-top: 10px;
}

#epidemic .my-charts .new-added,
#epidemic .my-charts .out-added,
#epidemic .my-charts .whole-added {
	border: 1px solid #eee;
	padding: 10px 0 30px;
}

#epidemic .my-charts > div {
	margin-bottom: 20px;
}

#epidemic .my-charts {
	padding: 20px;
	box-sizing: border-box;
}

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
	height: 65px;
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
	padding: 10px 0;
	background-color: #fff;
	border-radius: 20px;
	overflow: hidden;
	width: 100%;
	box-sizing: border-box;
}

#epidemic .header h1::after {
	content: attr(data-text);
	display: block;
	position: absolute;
	color: #afdade;
	top: 0;
	-webkit-mask-image: -webkit-gradient(linear, 0 0, 0 bottom, from(rgba(0, 0, 255, 0)), to(#afdade));
}

#epidemic .header img {
	position: absolute;
	top: 25px;
	left: 12px;
	height: 24px;
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
