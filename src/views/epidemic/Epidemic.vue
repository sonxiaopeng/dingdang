<template>
	<div id="epidemic" ref="epidemic">
        <my-navbar title="今日疫情"></my-navbar>
		<div class="header">
			<h3>新型冠状病毒肺炎</h3>
			<h1 data-text="疫情实时大数据报告">疫情实时大数据报告</h1>
			<img src="@/assets/images/home/logo.png" alt="" />
		</div>
		<div class="echarts">
            <van-tabs v-model="inOutActive" color="#10aeb5"
            scrollspy sticky line-width="100px" offset-top="46">
                <van-tab title="国内疫情" name="0">


			<div class="preview">
				<h3>国内疫情</h3>
				<div class="subtit">数据更新至 {{ updateTime }}</div>
				<div class="content">
					<div class="flex-items">
						<div class="title">现有确诊</div>
						<div class="num color1">
							{{ country.currentConfirmedCount }}
						</div>
						<div class="yesterday">
							昨日<span class="color1"
								>+{{ country.currentConfirmedIncr }}</span
							>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">无症状</div>
						<div class="num color2">{{ country.seriousCount }}</div>
						<div class="yesterday">
							昨日<span class="color2"
								>+{{ country.seriousIncr }}</span
							>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">现有疑似</div>
						<div class="num color3">{{ aliData.incDoubtful }}</div>
						<div class="yesterday">
							昨日<span class="color3"
								>+{{ aliData.incDoubtful }}</span
							>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">现有重症</div>
						<div class="num color4">94</div>
						<div class="yesterday">
							昨日<span class="color4">+9</span>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">累计确诊</div>
						<div class="num color5">
							{{ country.confirmedCount }}
						</div>
						<div class="yesterday">
							昨日<span class="color5"
								>+{{ country.confirmedIncr }}</span
							>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">境外输入</div>
						<div class="num color6">
							{{ country.suspectedCount }}
						</div>
						<div class="yesterday">
							昨日<span class="color6"
								>+{{ country.suspectedIncr }}</span
							>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">累计治愈</div>
						<div class="num color7">{{ country.curedCount }}</div>
						<div class="yesterday">
							昨日<span class="color7"
								>+{{ country.curedIncr }}</span
							>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">累计死亡</div>
						<div class="num color8">{{ country.deadCount }}</div>
						<div class="yesterday">
							昨日<span class="color8"
								>+{{ country.deadIncr }}</span
							>
						</div>
					</div>
				</div>
			</div>

			<div class="map-tab">
				<div class="tab-box">
                    <div
						:class="{ active: mapTabActive == 2 }"
						@click="setMapActive(2)"
					>
						累计确诊
					</div>
					<div
						:class="{ active: mapTabActive == 1 }"
						@click="setMapActive(1)"
					>
						现有确诊
					</div>
					
				</div>
			</div>

			<div
				ref="mapbox"
				class="mapbox"
				:style="{ height: mapHeight }"
			></div>

			<div class="my-charts">
				<div
					class="new-added"
					ref="newadded"
					:style="{ width: '100%', height: chartHeight }"
				></div>

				<div
					class="out-added"
					ref="outadded"
					:style="{ width: '100%', height: chartHeight }"
				></div>

				<div
					class="whole-added"
					ref="wholeadded"
					:style="{ width: '100%', height: chartHeight }"
				></div>

				<div class="summary">
					<div class="title">国内各地区疫情统计汇总</div>
					<div class="subtitle">
						7:00-10:00为更新高峰，数据若滞后敬请谅解
					</div>
				</div>
				<div class="summary-hd">
					<div>疫情地区</div>
					<div>确诊</div>
					<div>治愈</div>
					<div>死亡</div>
				</div>
				<div
					class="summary-bd"
					v-for="(item, index) of summary"
					:key="index"
				>
					<div>
						<div class="summary-bd-content">
							<div class="tit" @click="showCitys(item)">
								<span
									class="arrow"
									v-if="item.cityArray.length > 1"
								></span>
								<span>{{
									item.childStatistic.replace(
										/(省|市|中国|自治区|维吾尔|回族|壮族)/g,
										""
									)
								}}</span>
							</div>
							<div>{{ item.totalConfirmed }}</div>
							<div>{{ item.totalCured }}</div>
							<div>{{ item.totalDeath }}</div>
						</div>
						<div class="city-box" v-if="item.show">
							<div
								class="city-content"
								v-for="(city, i) of item.cityArray"
								:key="i"
							>
								<div class="tit">
									{{
										city.childStatistic.replace(
											/(省|市|中国|自治区|维吾尔|回族|壮族)/g,
											""
										)
									}}
								</div>
								<div>{{ city.totalConfirmed }}</div>
								<div>{{ city.totalCured }}</div>
								<div>{{ city.totalDeath }}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
                </van-tab>
            <van-tab title="国外疫情" name="1">
            <div class="preview">
				<h3>国外疫情</h3>
				<div class="subtit">数据更新至 {{ updateTime }}</div>
				<div class="content">
					<div class="flex-items">
						<div class="title">现有确诊</div>
						<div class="num small color1">
							{{ global.currentConfirmedCount }}
						</div>
						<div class="yesterday">
							昨日<span class="color1"
								>+{{ global.currentConfirmedIncr }}</span
							>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">累计确诊</div>
						<div class="num small color5">
							{{ global.confirmedCount }}
						</div>
						<div class="yesterday">
							昨日<span class="color5"
								>+{{ global.confirmedIncr }}</span
							>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">累计治愈</div>
						<div class="num small color7">{{ global.curedCount }}</div>
						<div class="yesterday">
							昨日<span class="color7"
								>+{{ global.curedIncr }}</span
							>
						</div>
					</div>
					<div class="flex-items">
						<div class="title">累计死亡</div>
						<div class="num small color8">{{ global.deadCount }}</div>
						<div class="yesterday">
							昨日<span class="color8"
								>+{{ global.deadIncr }}</span
							>
						</div>
					</div>
				</div>
			</div>
            <div class="map-tab">
				<div class="tab-box">
					<div
						:class="{ active: globalMapTabActive == 1 }"
						@click="setGlobalMapActive(1)"
					>
						现有确诊
					</div>
					<div
						:class="{ active: globalMapTabActive == 2 }"
						@click="setGlobalMapActive(2)"
					>
						累计确诊
					</div>
				</div>
			</div>
			<div
				ref="globalmapbox"
				class="mapbox"
				:style="{ height: mapHeight }"
			></div>
            <div class="global-box">
            <div class="summary">
					<div class="title">国外各国家疫情统计汇总</div>
					<div class="subtitle">
						7:00-10:00为更新高峰，数据若滞后敬请谅解
					</div>
				</div>
				<div class="summary-hd global">
					<div>疫情地区</div>
					<div>确诊</div>
					<div>治愈</div>
					<div>死亡</div>
				</div>
				<div
					class="summary-bd"
					v-for="(item, index) of globalSummary"
					:key="index"
				>
					<div>
						<div class="summary-bd-content">
							<div class="tit">
								<span>{{
									item.provinceName
								}}</span>
							</div>
							<div>{{ item.confirmedCount }}</div>
							<div>{{ item.curedCount }}</div>
							<div>{{ item.deadCount }}</div>
						</div>
					</div>
				</div>
                </div>
              </van-tab>
</van-tabs>
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
            totalCount: [],
            currentCount: [
                { name: "湖北", value: 1 },
                { name: "香港", value: 812 },
                { name: "广东", value: 39 },
                { name: "上海", value: 110 },
                { name: "浙江", value: 10 },
                { name: "河南", value: 4 },
                { name: "黑龙江", value: 360 },
                { name: "湖南", value: 6 },
                { name: "北京", value: 49 },
                { name: "安徽", value: 1 },
                { name: "新疆", value: 0 },
                { name: "河北", value: 835 },
                { name: "江西", value: 0 },
                { name: "山东", value: 3 },
                { name: "四川", value: 11 },
                { name: "台湾", value: 97 },
                { name: "江苏", value: 4 },
                { name: "重庆", value: 1 },
                { name: "福建", value: 19 },
                { name: "陕西", value: 26 },
                { name: "辽宁", value: 20 },
                { name: "内蒙古", value: 14 },
                { name: "天津", value: 23 },
                { name: "广西", value: 3 },
                { name: "云南", value: 1 },
                { name: "山西", value: 11 },
                { name: "甘肃", value: 0 },
                { name: "海南", value: 0 },
                { name: "吉林", value: 194 },
                { name: "贵州", value: 0 },
                { name: "宁夏", value: 0 },
                { name: "澳门", value: 1 },
                { name: "青海", value: 0 },
                { name: "西藏", value: 0 }
						],
            globalSummary: [],
            inOutActive: 0,
            globalMapTabActive: 1,
            global: {
                confirmedCount: 95005920,
                confirmedIncr: 442775,
                curedCount: 64006287,
                curedIncr: 246854,
                currentConfirmedCount: 28967916,
                currentConfirmedIncr: 188956,
                deadCount: 2031717,
                deadIncr: 6965,
            },
            globalConfirm: [],
            globalCurr: [],
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
						color: [
							"white",
							"#ffe5db",
							"#ff9985",
							"#f57567",
							"#e64546",
							"#b80909",
						],
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
						data: [],
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
					data: [
						"黑龙江",
						"河北",
						"吉林",
						"上海",
						"广东",
						"北京",
						"山西",
						"天津",
						"江苏",
						"甘肃",
					],
				},
				yAxis: {
					type: "value",
					min: 0,
					max: 30,
				},
				series: [
					{
						name: "本土新增",
						type: "bar",
						barWidth: 10,
						stack: "new",
						itemStyle: { color: "#e83132" },
						data: [29, 19, 12, 3, 0, 2, 0, 0, 0, 0],
					},
					{
						name: "境外输入",
						type: "bar",
						barWidth: 10,
						stack: "new",
						itemStyle: { color: "#476da0" },
						data: [0, 0, 0, 3, 5, 0, 2, 1, 1, 1],
					},
				],
			},
			outAddOption: {
				title: {
					text: "当日疑似变化趋势",
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
					data: ["当日疑似数"],
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
					data: [],
				},
				yAxis: {
					type: "value",
					min: 0,
					max: 30000,
				},
				series: [
					{
						name: "当日疑似数",
						type: "line",
						symbol: "none",
						itemStyle: { color: "#ec9217" },
						data: [],
					},
				],
			},
			wholeAddOption: {
				title: {
					text: "全国 累计确诊/累计治愈/累计死亡 趋势",
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
					data: ["累计确诊", "累计治愈", "累计死亡"],
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
					data: [],
				},
				yAxis: {
					type: "value",
					min: 0,
					max: 100000,
				},
				series: [
					{
						name: "累计确诊",
						type: "line",
						symbol: "none",
						itemStyle: { color: "#f57567" },
						data: [],
					},
					{
						name: "累计治愈",
						type: "line",
						symbol: "none",
						itemStyle: { color: "#10aeb5" },
                        data: [],
                    },
					{
						name: "累计死亡",
						type: "line",
                        symbol: "none",
                        itemStyle: { color: "#b80909" },
						data: [],
					},
				],
			},
			globalMapOption: {
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
						{ min: 100000, label: "≥10000" }, // 不指定 max，表示 max 为无限大（Infinity）。
						{ min: 10000, max: 99999, label: "1000-9999" },
						{ min: 1000, max: 9999, label: "1000-9999" },
						{ min: 100, max: 999, label: "100-999" },
						{ min: 50, max: 99, label: "10-99" },
						{ min: 10, max: 49, label: "10-99" },
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
						color: [
							"white",
							"#ffe5db",
							"#ffc4b3",
							"#ff9985",
							"#f57567",
							"#e64546",
							"#b80909",
							"#8a0808",
						],
					},
				},
				backgroundColor: "#f8f9fa",
				series: [
					{
						name: "确诊",
						type: "map",
						mapType: "world",
						roam: false,
						label: {
							normal: {
								show: false,
							},
							emphasis: {
								show: false,
							},
						},
						// showLegendSymbol: true,
						data: this.globalConfirm,
						nameMap: {
							Singapore: "新加坡",

							Dominican: "多米尼加",

							Palestine: "巴勒斯坦",

							The_Bahamas: "巴哈马",

							East_Timor: "东帝汶",

							Afghanistan: "阿富汗",

							"Guinea-Bissau": "几内亚比绍",

							"Côte d'Ivoire": "科特迪瓦",

							"Siachen-Glacier": "锡亚琴冰川",

							British_Indian_Ocean_Territory: "英属印度洋领土",

							Angola: "安哥拉",

							Albania: "阿尔巴尼亚",

							United_Arab_Emirates: "阿联酋",

							Argentina: "阿根廷",

							Armenia: "亚美尼亚",

							"French Southern and Antarctic Lands": "法属南半球和南极领地",

							Australia: "澳大利亚",

							Austria: "奥地利",

							Azerbaijan: "阿塞拜疆",

							Burundi: "布隆迪",

							Belgium: "比利时",

							Benin: "贝宁",

							Burkina_Faso: "布基纳法索",

							Bangladesh: "孟加拉",

							Bulgaria: "保加利亚",

							The_Bahamas: "巴哈马",

							Bosnia_and_Herzegovina: "波斯尼亚和黑塞哥维那",

							Belarus: "白俄罗斯",

							Belize: "伯利兹",

							Bermuda: "百慕大",

							Bolivia: "玻利维亚",

							Brazil: "巴西",

							Brunei: "文莱",

							Bhutan: "不丹",

							Botswana: "博茨瓦纳",

							Central_African_Republic: "中非",

							Canada: "加拿大",

							"Switzerland": "瑞士",

							Chile: "智利",

							China: "中国",

							"Ivory Coast": "象牙海岸",

							Cameroon: "喀麦隆",

							"Congo-Kinshasa": "刚果(金)",

							"Congo-Brazzaville": "刚果(布)",

							Colombia: "哥伦比亚",

							Costa_Rica: "哥斯达黎加",

							Cuba: "古巴",

							"N. Cyprus": "北塞浦路斯",

							Cyprus: "塞浦路斯",

							Czechia: "捷克",

							Germany: "德国",

							Djibouti: "吉布提",

							Denmark: "丹麦",

							Algeria: "阿尔及利亚",

							Ecuador: "厄瓜多尔",

							Egypt: "埃及",

							Eritrea: "厄立特里亚",

							Spain: "西班牙",

							Estonia: "爱沙尼亚",

							Ethiopia: "埃塞俄比亚",

							Finland: "芬兰",

							Fiji: "斐",

							Falkland_Islands: "福克兰群岛",

							France: "法国",

							Gabon: "加蓬",

							United_Kingdom: "英国",

							Georgia: "格鲁吉亚",

							Ghana: "加纳",

							Guinea: "几内亚",

							The_Gambia: "冈比亚",

							"Guinea-Bissau": "几内亚比绍",

							Equatorial_Guinea: "赤道几内亚",

							Greece: "希腊",

							Greenland: "格陵兰",

							Guatemala: "危地马拉",

							"French-Guiana": "法属圭亚那",

							Guyana: "圭亚那",

							Honduras: "洪都拉斯",

							Croatia: "克罗地亚",

							Haiti: "海地",

							Hungary: "匈牙利",

							Indonesia: "印度尼西亚",

							India: "印度",

							"Ireland": "爱尔兰",

							Islamic_Republic_of_Iran: "伊朗",

							Iraq: "伊拉克",

							Iceland: "冰岛",

							Israel: "以色列",

							Italy: "意大利",

							Jamaica: "牙买加",

							Jordan: "约旦",

							Japan: "日本",

							Kazakhstan: "哈萨克斯坦",

							Kenya: "肯尼亚",

							Kyrgyzstan: "吉尔吉斯斯坦",

							Cambodia: "柬埔寨",

							South_Korea: "韩国",

							Republic_of_Kosovo: "科索沃",

							Kuwait: "科威特",

							Laos: "老挝",

							Lebanon: "黎巴嫩",

							Liberia: "利比里亚",

							Libya: "利比亚",

							Sri_Lanka: "斯里兰卡",

							Lesotho: "莱索托",

							Lithuania: "立陶宛",

							Luxemburg: "卢森堡",

							Latvia: "拉脱维亚",

							Morocco: "摩洛哥",

							Moldova: "摩尔多瓦",

							Madagascar: "马达加斯加",

							Mexico: "墨西哥",

							Macedonia: "马其顿",

							Mali: "马里",

							Myanmar: "缅甸",

							Montenegro: "黑山",

							Mongolia: "蒙古",

							Mozambique: "莫桑比克",

							Mauritania: "毛里塔尼亚",

							Malawi: "马拉维",

							Malaysia: "马来西亚",

							Namibia: "纳米比亚",

							"New-Caledonia": "新喀里多尼亚",

							Niger: "尼日尔",

							Nigeria: "尼日利亚",

							Nicaragua: "尼加拉瓜",

							The_Netherlands: "荷兰",

							Norway: "挪威",

							Nepal: "尼泊尔",

							New_Zealand: "新西兰",

							Oman: "阿曼",

							Pakistan: "巴基斯坦",

							Panama: "巴拿马",

							Peru: "秘鲁",

							Philippines: "菲律宾",

							Papua_New_Guinea: "巴布亚新几内亚",

							Poland: "波兰",

							"Puerto-Rico": "波多黎各",

							North_Korea: "朝鲜",

							Portugal: "葡萄牙",

							Paraguay: "巴拉圭",

							Qatar: "卡塔尔",

							Romania: "罗马尼亚",

							Russia: "俄罗斯",

							Rwanda: "卢旺达",

							"W. Sahara": "西撒哈拉",

							Saudi_Arabia: "沙特阿拉伯",

							Sudan: "苏丹",

							South_Sudan: "南苏丹",

							Senegal: "塞内加尔",

							Solomon_Islands: "所罗门群岛",

							Sierra_Leone: "塞拉利昂",

							El_Salvador: "萨尔瓦多",

							"Somaliland": "索马里兰",

							Somalia: "索马里",

							Serbia: "塞尔维亚",

							Suriname: "苏里南",

							Slovakia: "斯洛伐克",

							Slovenia: "斯洛文尼亚",

							Sweden: "瑞典",

							Swaziland: "斯威士兰",

							Syria: "叙利亚",

							Chad: "乍得",

							Togo: "多哥",

							Thailand: "泰国",

							Tajikistan: "塔吉克斯坦",

							"Turkmenistan": "土库曼斯坦",

							East_Timor: "东帝汶",

							Trinidad_and_Tobago: "特里尼达和多巴哥",

							Tunisia: "突尼斯",

							Turkey: "土耳其",

							Tanzania: "坦桑尼亚",

							Uganda: "乌干达",

							Ukraine: "乌克兰",

							Uruguay: "乌拉圭",

							"United States": "美国",

							Uzbekistan: "乌兹别克斯坦",

							Venezuela: "委内瑞拉",

							Vietnam: "越南",

							Vanuatu: "瓦努阿图",

							"West Bank": "西岸",

							Yemen: "也门",

							"South Africa": "南非",

							Zambia: "赞比亚",

							Zimbabwe: "津巴布韦",
						},
					},
				],
			},
		};
	},
	mounted() {
		document.body.scrollTop = 0;
		this.mapHeight =
			(document.documentElement.clientWidth * 300) / 375 + "px";
		this.chartHeight = (this.$refs.newadded.clientWidth * 300) / 375 + "px";
		Promise.all([
			this.axios({
				method: "get",
				url:
					"https://ncovdata.market.alicloudapi.com/ncov/cityDiseaseInfoWithTrend",
				headers: {
                    Authorization: "APPCODE b4a153dc3bf84a62a64d1cc6cd573d30",
                    
				},
			}),
			this.axios({
				method: "post",
				url: "https://api.tianapi.com/txapi/ncov/index",
				params: {
					key: "df363592f492807099b296206eee06be",
				},
			}),
			this.axios({
				method: "post",
				url: "https://api.tianapi.com/txapi/ncovabroad/index",
				params: {
					key: "df363592f492807099b296206eee06be",
				},
			}),
		])
			.then(res => {
				let aliData = res[0].data;
				let tianData = res[1].data.newslist[0].desc;
				// let tianNews = res[1].data.newslist[0].news;
                let tianGlobalData = res[2].data.newslist;
                // console.log(aliData , tianData ,tianGlobalData)
				this.updateTime = aliData.country.time.replace(/-/g, ".");
				for (var key in this.country) {
					this.$set(this.country, key, tianData[key]);
				}
				for (var key in this.aliData) {
					this.$set(this.aliData, key, aliData.country[key]);
				}
                
                this.totalCount = aliData.provinceArray.map(
					item => {
						return {
							name: item.childStatistic.replace(
								/(省|市|中国|自治区|维吾尔|回族|壮族)/g,
								""
							),
							value: item.totalConfirmed,
						};
					}
				);
                this.mapOption.series[0].data = this.totalCount;
				this.summary = aliData.provinceArray;
				this.summary.forEach(item => {
					this.$set(item, "show", false);
				});

                this.outAddOption.xAxis.data = this.wholeAddOption.xAxis.data = aliData.trend.map(item=>{
                    return item.day
                })
                this.wholeAddOption.series[0].data = aliData.trend.map(item=>{
                    return item.sure_cnt
                })
                this.wholeAddOption.series[1].data = aliData.trend.map(item=>{
                    return item.cure_cnt
                })
                this.wholeAddOption.series[2].data = aliData.trend.map(item=>{
                    return item.die_cnt
                })
                this.outAddOption.series[0].data = aliData.trend.map(item=>{
                    return item.doubt_cnt
                })


                // 全球数据
                this.global = tianData.globalStatistics
				this.globalConfirm = tianGlobalData.map(
					item => {
						return {
							name: item.provinceName,
							value: item.confirmedCount,
						};
					}
				);
				this.globalCurr = tianGlobalData.map(
					item => {
						return {
							name: item.provinceName,
							value: item.currentConfirmedCount,
						};
					}
                );
                this.globalMapOption.series[0].data = this.globalCurr

                this.globalSummary = tianGlobalData
				this.drawMap();
				this.drawNewAdded();
				this.drawOutAdded();
				this.drawWholeAdded();
				this.drawGlobalMap();
			})
			.catch(reason => console.log(reason));
	},
	methods: {
		showCitys(item) {
			if (item.cityArray.length > 1) {
				item.show = !item.show;
			}
        },
        setGlobalMapActive(index){
            this.globalMapTabActive = index;
            if(index == 1){
                this.globalMapOption.series[0].data = this.globalCurr
                this.globalMapOption.title.subtext = '现有确诊病例数，排除治愈、死亡'
                this.drawGlobalMap();
            }else{
                this.globalMapOption.series[0].data = this.globalConfirm
                this.globalMapOption.title.subtext = '累计确诊病例数，包含治愈、死亡'
                this.drawGlobalMap();
            }

        },
		setMapActive(index) {
            this.mapTabActive = index;
            if(index == 1){
                this.mapOption.series[0].data = this.currentCount
                this.mapOption.title.subtext = '现有确诊病例数，排除治愈、死亡'
                this.drawMap();
            }else{
                this.mapOption.series[0].data = this.totalCount
                this.mapOption.title.subtext = '累计确诊病例数，包含治愈、死亡'
                this.drawMap();
            }
		},
		drawMap() {
			let map = echarts.init(this.$refs.mapbox);
			map.setOption(this.mapOption);
		},
		drawNewAdded() {
			let newAdded = echarts.init(this.$refs.newadded);
			newAdded.setOption(this.newAddedOption);
		},
		drawOutAdded() {
			let outAdded = echarts.init(this.$refs.outadded);
			outAdded.setOption(this.outAddOption);
		},
		drawWholeAdded() {
			let wholeAdded = echarts.init(this.$refs.wholeadded);
			wholeAdded.setOption(this.wholeAddOption);
		},
		drawGlobalMap() {
			let globalMap = echarts.init(this.$refs.globalmapbox);
			globalMap.setOption(this.globalMapOption);
		},
    },
};
</script>

<style scoped>
.global-box {
    padding: 10px;
}

#epidemic .echarts .van-sticky--fixed {
    z-index: 99999999;
}

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
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap
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

#epidemic .echarts .summary-hd.global {
    margin-top: 10px;
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

#epidemic .echarts .summary .subtitle {
	margin-top: 8px;
	color: #999;
	font-size: 12px;
}

#epidemic .echarts .summary {
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

#epidemic .echarts .preview .content .flex-items .num.small {
    font-size: 13px;
}

#epidemic .echarts .preview .content .flex-items .num {
	font-size: 18px;
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
	padding: 10px 0 20px;
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
	-webkit-mask-image: -webkit-gradient(
		linear,
		0 0,
		0 bottom,
		from(rgba(0, 0, 255, 0)),
		to(#afdade)
	);
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
