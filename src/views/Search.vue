<template>
	<div id="search">
		<div class="search-header">
			<van-search
				v-model="searchVal"
				placeholder="搜索文章/医生/医院/疾病"
				shape="round"
				show-action
			>
				<template #left-icon>
					<img src="@/assets/images/home/search-icon.png" alt="" />
				</template>
				<template #action>
					<div @click="onSearch">搜索</div>
				</template>
			</van-search>
		</div>
		<van-tabs v-model="active" color="#00c792">
			<van-tab title="文章" :name="1"></van-tab>
			<van-tab title="问题" :name="2"></van-tab>
			<van-tab title="医院" :name="3"></van-tab>
			<van-tab title="医生" :name="4"></van-tab>
		</van-tabs>
		<van-nav-bar
			left-text="历史搜索"
			@click-right="onClickRight"
			:border="false"
			v-if="historyShow"
		>
			<template #right>
				<van-icon name="delete-o" color="#646566" size="20" />
			</template>
		</van-nav-bar>
		<div class="questions-tags" v-if="historyShow">
			<van-tag
				size="large"
				v-for="(item, index) of keywords"
				:key="index"
				@click="setActive(item)"
			>
				{{ item }}
			</van-tag>
		</div>
        <div class="articles-content" v-if="active == 1">
            <article-list
                v-for="(item, index) of articles"
                :key="index"
                :title="item.subject"
                :content="item.description"
                :imgurl="item.img"
                :url="url + `?articleid=${item.article_id}`"
            ></article-list>
        </div>
        <div class="questions-content" v-if="active == 2">
            <question-list
                :imgurl="item.imgurl"
                :nickname="item.nickname"
                :describe="item.describe"
                :committime="item.committime"
                :index="item.quesid"
                v-for="(item, index) of questions"
                :key="index"
            ></question-list>
        </div>
	</div>
</template>

<script>
import { Toast } from 'vant';
export default {
	data() {
		return {
            questions: [],
            articles: [],
			historyShow: false,
			searchVal: "",
			active: 1,
			keywords: [],
            url: "/articledetail",
		};
	},
	methods: {
		onSearch() {
			if (this.searchVal == "") {
				return false;
			}
			let historys = [];
			let historyStr = decodeURI(localStorage.getItem("serachhistory"));
			if (historyStr != "null") {
				historys = historyStr.split(",");
			}

			if (historys.length > 5) {
				historys.shift();
            }
            
            let arr = historys.filter(item=>{
                return item == this.searchVal
            })
            if(arr.length == 0){
                historys.push(this.searchVal);
            }
			localStorage.setItem(
				"serachhistory",
				encodeURI(historys.join(","))
			);
			let searchCategory = "";
			switch (this.active) {
				case 1:
					searchCategory = "article";
					break;
				case 2:
					searchCategory = "question";
					break;
				case 3:
					searchCategory = "hospital";
					break;
				case 4:
					searchCategory = "doctor";
					break;
			}
			this.axios.get(`/search/${searchCategory}`, {
				params: {
                    keyword: this.searchVal
                }
            })
            .then(value=>{
                let resData = value.data
                if(resData.code == 0){
                    if(this.active == 1){
                        this.articles =  resData.data;
                    }else if(this.active == 2){
                        this.questions =  resData.data;
                    }
                }else {
                    Toast(resData.message)
                }
                console.log(value)

            })
            .catch(reason=>{
                console.log(reason)
            })
		},
		setActive(name) {
			this.searchVal = name;
		},
		onClickRight() {
			localStorage.removeItem("serachhistory");
			this.historyShow = false;
		},
	},
	mounted() {
		if (localStorage.getItem("serachhistory")) {
			this.historyShow = true;
			this.keywords = decodeURI(
				localStorage.getItem("serachhistory")
			).split(",");
		}
	},
};
</script>

<style scoped>
#search >>> .van-nav-bar__text {
	font-size: 18px;
	font-weight: 700;
}

/* 公开问题样式开始 */
#search >>> .questions-tags {
	padding: 5px 4px 20px 10px;
	display: flex;
	flex-flow: row wrap;
	align-items: center;
	border-bottom: 1px solid #eee;
}

#search >>> .van-tag {
	padding: 8px 12px;
	font-weight: 300;
	font-size: 14px;
	line-height: 16px;
	white-space: nowrap;
	text-overflow: ellipsis;
	border-radius: 2px;
	max-width: 343px;
	margin: 4px 12px 0 0;
	overflow: hidden;
	color: #4d4d4d;
	background-color: #fafafa;
}
/* 公开问题样式结束 */

/* 顶部搜索框样式开始 */
#search >>> .search-header .van-search__action {
	background-color: #00c792;
	border-radius: 17px;
	color: #fff;
	margin-left: 10px;
	padding: 0 15px;
}

#search >>> .search-header {
	width: 100%;
	box-sizing: border-box;
	max-width: 768px;
}

#search >>> .search-header .van-search {
	padding: 10px 16px;
}

#search >>> .search-header .van-search .van-search__content {
	border: 0.5px solid #d9d9d9;
	box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.05);
	background-color: #fff;
	padding-left: 15px;
}

#search >>> .search-header .van-search .van-cell {
	display: flex;
	align-items: center;
	height: 42px;
}

#search >>> .search-header .van-field__left-icon img {
	width: 22px;
	height: 22px;
	min-width: 22px;
	margin-right: 5px;
}

#search >>> .search-header .van-field__control::-webkit-input-placeholder {
	color: #999;
	font-weight: bold;
	font-size: 15px;
}
/* 顶部搜索框样式结束 */
</style>

怎么能没有炸鸡和啤酒
隔壁家的姑娘
蒝味的薇笑
栀子花开
暧昧分熟
深知自己不讨喜
未来败给命运
拳皇研究所
我们的约定。
男人男人最难的人。
偷网？单机去吧，孩子
麻木的躯壳
上毛线网
一撇一捺默寫回憶
第七个丢失的梦
重拾记忆的爱
有多少爱可以胡来
不要靠近我。
个性时尚微博名
讓莪嘸倁菿楿信渏迹
掐指一算姑娘你命里缺我
蹲厕唱国歌
无人像你
啭裑①羣豞
不是妹子别来了
缠绵过后的陌路
-孤独成性，
不爱才搞暧昧
若无其事才是最狠的报复
我们的未来
虚空的时间。
蹭吧！思密达！
朕射妳无罪
〆多余的表白
骑着蜗牛狂奔
你为何放弃治疗？
配角只有俄。
大王叫莪来巡山哟
个性时尚微博名
上网可以，别开QVOD
请把QQ留下！
蹭网可以
I～在。哭泣
不倾国倾城只倾他一人
你再发光我就拔你插头
家，世间最温暖的地方
挥着鸡翅膀的女孩
难不难过都是一个人过
原谅我盛装出席只为错过你
残孤星
只适合被遗忘
爱情，算个屁丶
执子辶掱
朕今晚翻你牌子
大豹有爱
①苆兜媞命
中华一样的
始于心动止于枯骨
我们幸福呢
表白失败，勿扰
髮型吥能亂
陽咣丅啲憂喐
你棺材是翻盖的还是滑盖的
孤枕
泪颜葬相思
喵星人
超拽霸气的微博名字
晚安晚安晚晚难安
却输给了秒
为什么我吃德芙没有黑丝飘
请输入我大名
瘋子范ル
浅浅の僾
尛。柒
想上我没那么容易
时光是把猪饲料
逆风飞行
回首释然
中国辣条协会会长
伸手怕犯错缩手怕错过
懷念與愛無關
WiFi中文名
活得像个女王才会吸引国王
討厭‖點點點﹌
你久居我心却不曾交过房租
免费！好人一生平安
———過客棧
明知是梦，心却在痛
打工仔专用WIFI
美丽范儿╮
美国国家安全局
聽雨的聲音滴落
咱ゝ尛傀゛
多余の解释。
看悲伤落地。
づ特有气质范
做我孩子他妈吧！
老鼠扛刀满街找猫
因为心浪所以微勃
女汉子不美不萌照样拽
想要密码吗？
汪星人的WiFi
好男人就是我
密码你猜一猜
最初不相识最终不相认
孩孒气
痛定思痛。
我有故事你有酒
没有梦是好的
伴久见人心
已沾不起高傲
伪装の快乐
伪装の、快乐
因太帅被判无妻
长不过执念
请输入WiFi名
心还是热的
认真你就输了
眼角存留的泪
念之森蓝
你们不会忘记我
〆凄凉。
誰願意當小三
尾戒如泪坠
可以让我哭但别让我输
爱情，不可信
旧心酸。
她是光久抱必凉
巴黎左岸的咖啡馆
不给糖吃就胡闹
伤却美╮
傷待續
读不懂你的悲伤づ
一米阳光三寸暖
僤纯兲眞
沉默的姿态。
万人中央孤独的漂亮
节与我无缘～
谁陪我寂寞
别来无恙你还猪模狗样
人不喂鸡天猪地灭
走了就别后悔
表白失败，勿扰
爱一个人的苦涩
有多少爱可以重来
省流量之处
纯天然绿色学渣
活的好累
把心掏空狠狠爱
渣渣快去听课
巴拉拉能量作业消失
我想陪你吹吹风
我是你想不到的无关痛痒
土豪，我们做朋友吧
柏拉图愛恋
莂哪庅認嫃
浅陌初心
殘缺的回憶
有你任性没你认命
沵残留的余温ゝ
卩s团团丨
小心有风险
ミ洄忆dē“独奏
卖个萌
你的高数过了没？
面临孤独
密码就是xxxxxx
偷网？单机去吧，孩子
万花丛中一朵菊
笑的，好凄凉
半夏半暖半倾城
渣渣快去听课
畅饮敌敌畏i
密码是
斯文禽兽゜
你长了一张欠吻的嘴
来不及流泪的人。
僤純兲眞
ゞ残傷↘誰懂
姐的智商都拿去卖萌了
放过。自己
叶落花凋零。
你已走出我的世界
太阳够大够温暖
残唸゜
伊染华泪蹒跚
奈何桥寂寞
吃素的蚊子
情绪低落
带刺的菊花
你若安好那还得了
躺在键盘上的烟灰…
______唯你懂我訫
抽烟解寂莫
超龄儿童
战天下为红颜
魂殇
快点我啊！我等不及了！
@菥蓂
不想听谎言
忘不掉的伤
失心疯〆
往事如风
炮轰女厕所
枪硬情浓
你与时光皆薄情
迩忘楽莪庅
密码你猜一猜
此名字尚未被使用
vigilia°宝瓜
▲蜡笔小星
姑娘不要怕我不是什么好人
因为心浪所以微勃
入戯太深。
我有一头小毛驴
语楪ゝ淡蓝
一起来嗨皮！
阿三◥很可爱
只上老婆也只让老婆上
夜夜醉っ
回想着同样的时光ヽ
薄凉之人终不念安。
不是你的网你连个啥嘞
双人面具
一脸惨白ヽ
ノ娃孓他爹
嘟着小嘴耍任性
别来无恙你还狗模狗样
oΟ姠袏彺祐
半夏彼岸花绽放
旧情如醉
长得丑活得久
骑猪赏看嫦娥
时间煮雨我煮粥
梦中你是主角
习惯用沵的名字拒绝别人
乱⒎バ糟oゞ
姐与爱情水土不服
作茧自缚
当做最后一次
我们可不可以不忧伤
卜许嵩手
那一絲悲
红颜ヽ祸水
㊣而⑧经的男人
按住时光不许动
农夫三拳有点疼
菊部地区有血
ㄨ菲薄的青春
我是你路过的风景
你一贱我就笑
爱生活爱你妈
何必把自己装的这么坚强
浮夸了华丶
唉哟不错这个WiFi很屌哦
崽崽╮宝贝
女生蹭网留下三围
╰堕落的青春
二到无穷大
≠自錠義
作业你和考卷私奔吧
我有多倔强就有多坚强
用时间看人心
听属于俩人的歌
遍体鳞伤。
傲娇女王
FBI专线
酸酸de快乐
想知道密码就叫我大神
宁可静静伤心
若無相思豈有悲緒
妈妈再扇我一次
幸福暗恋我
半醉半醒半浮生
ツ混ㄖ孓←┈
尔是吾戒不掉的烟
不如笑着放手
惊蛰花压重门
不如笑着放手
掩饰了难过
村委会发工资办公室
这世界没有童话只有谎话
ァ停在
芣特莂泹卻湜惟①
東京的櫻花落滿巴黎的街頭
我不温暖他却畏寒
夜放肆了寂寞
今晚我是你的人
琼瑶式爱情
恭喜发财，网费拿来
作茧自缚
McDonald
刻骨゛铭Xn╮
陌生De自己ヾ忘却
看破世情
萬劫不復的我
︶ㄣ彯逸尐苏
省流量之处
超拽霸气的微博名字
没胸还很凶
仌生洳夢
为你止不住心碎
你看到我的小熊了吗
不是你的网你连个啥嘞
你敢寻花问柳我就红杏出墙
为期待而延续
任凭寂寞沸腾
来一瓶的爽歪歪
自暴自弃
我们会发大财的！
畅饮孤独
倦了
共同饭堂
牵痛了手づ
莪比那烟花还寂寞╮
哥能毁你清白就能给你未来