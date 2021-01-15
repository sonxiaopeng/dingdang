/*
 Navicat Premium Data Transfer

 Source Server         : hongxl
 Source Server Type    : MariaDB
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : ddys

 Target Server Type    : MariaDB
 Target Server Version : 100128
 File Encoding         : 65001

 Date: 15/01/2021 21:04:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ddys_answer
-- ----------------------------
DROP TABLE IF EXISTS `ddys_answer`;
CREATE TABLE `ddys_answer`  (
  `answer_id` int(255) NOT NULL COMMENT '回答id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回答内容',
  `create_at` int(255) NOT NULL COMMENT '回答时间',
  `user_id` int(255) NOT NULL COMMENT '回答的用户的id',
  `doctor_id` int(255) NOT NULL COMMENT '回答的医生id',
  PRIMARY KEY (`answer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_answer
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_article
-- ----------------------------
DROP TABLE IF EXISTS `ddys_article`;
CREATE TABLE `ddys_article`  (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `category_id` int(11) NOT NULL COMMENT '所属类别',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章头图',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_article
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_category
-- ----------------------------
DROP TABLE IF EXISTS `ddys_category`;
CREATE TABLE `ddys_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_category
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_city
-- ----------------------------
DROP TABLE IF EXISTS `ddys_city`;
CREATE TABLE `ddys_city`  (
  `city_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '城市id',
  `province_id` int(11) NOT NULL COMMENT '所属省份id',
  `cityname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市名称',
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_city
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_comment
-- ----------------------------
DROP TABLE IF EXISTS `ddys_comment`;
CREATE TABLE `ddys_comment`  (
  `comment_id` int(255) NOT NULL COMMENT '评论id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价内容',
  `user_id` int(255) NOT NULL COMMENT '用户id',
  `doctor_id` int(255) NOT NULL COMMENT '医生id',
  `create_at` int(255) NOT NULL COMMENT '评价时间',
  `level` int(255) NOT NULL COMMENT '评价星级（1-5星）',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_comment
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_disease
-- ----------------------------
DROP TABLE IF EXISTS `ddys_disease`;
CREATE TABLE `ddys_disease`  (
  `disease_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '疾病名称',
  `office_id` int(11) NOT NULL COMMENT '科室id',
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '疾病介绍',
  PRIMARY KEY (`disease_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_disease
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_doctor
-- ----------------------------
DROP TABLE IF EXISTS `ddys_doctor`;
CREATE TABLE `ddys_doctor`  (
  `dcotor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医生id',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生姓名',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生头像',
  `office_id` int(11) NOT NULL COMMENT '科室id',
  `level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生职称',
  `hospital_id` int(10) NOT NULL COMMENT '所属医院',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '擅长方向',
  `experience_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执业经历',
  `experience_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学术经历',
  `experience_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业资历',
  `ask_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '问答价格',
  PRIMARY KEY (`dcotor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_doctor
-- ----------------------------
INSERT INTO `ddys_doctor` VALUES (1, '田利民', '../assets/dtavatar/1.jpg', 1, '医师', 1, '硕士研究生2014毕业包头医学院临床医学专业2019毕业内蒙古医科大学皮肤病与性病专业研究方向激光美容和常见病诊断和治疗', '湿疹，痤疮，玫瑰痤疮， 足癣 ，性病，皮肤过敏', '2014-2016年 内蒙古赤峰克旗妇幼保健院 妇产科医师<br>2019年至今  内蒙古科技大学第一附属医院 皮肤科医师', NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (2, '王京哲', '../assets/dtavatar/2.jpg', 1, '主治医师', 1, '211硕士毕业，临床工作五年，对于常见病多发病有清晰的认识，现就职于省重点皮肤外科，对医疗美容有较好的了解', '痤疮，皮炎，荨麻疹，体癣，足癣，湿疹·', '2014-2016年 内蒙古赤峰克旗妇幼保健院 妇产科医师<br>2019年至今  内蒙古科技大学第一附属医院 皮肤科医师', NULL, '211医学院校毕业，曾从事外科学3年，独立完成数百例手术。', 49.00);
INSERT INTO `ddys_doctor` VALUES (3, '曹国秀', '../assets/dtavatar/3.jpg', 1, '主治医师', 1, '研究生毕业于重庆医科大学，师从王华教授，熟悉的掌握各种儿童皮肤性病学，同时也深入学习了成人相关皮肤病', '特应性皮炎，银屑病，痤疮，药物性皮炎，梅毒，性病', NULL, '重庆医科大学附属儿童医院<br>重庆医科大学附属第一医院<br>遵义市第一人民医院', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (4, '孙园园', '../assets/dtavatar/4.jpg', 1, '主治医师', 1, '湿疹，激素依赖性皮炎、痤疮，急性荨麻疹，过敏，皮炎，疖子，色素痣，尖锐湿疣等', '激素依赖性皮炎，痤疮，皮炎， 足癣 ，黄褐斑，皮肤过敏', NULL, '上海市第七人民医院三年研究生学习', NULL, 129.00);
INSERT INTO `ddys_doctor` VALUES (5, '马春烨', '../assets/dtavatar/5.jpg', 1, '主治医师', 1, '本人黑龙江中医药大学毕业。工作皮肤科四小龙医院沈阳市第七人民医院。擅长治疗中西医结合治疗常见皮肤病。', '皮炎，荨麻疹，皮炎，体癣，银屑病，痤疮', '一直从事皮肤科性病专业。对皮肤性病中西医结合治疗疗效显著', NULL, NULL, 39.00);
INSERT INTO `ddys_doctor` VALUES (6, '宫晓峰', '../assets/dtavatar/6.jpg', 1, '主治医师', 1, '医学硕士，9年大型三甲医院临床工作经验。擅长:痤疮（青春痘）、性病、湿疹荨麻疹、带状疱疹、白癜风、银屑病、皮肤外科等。', '皮炎，荨麻疹，皮炎，湿疹，白癜风，痤疮', NULL, NULL, NULL, 99.00);
INSERT INTO `ddys_doctor` VALUES (7, '罗丽君', '../assets/dtavatar/7.jpg', 2, '主治医师', 1, '主要擅长呼吸道感染，小儿喂养，小儿营养性疾病，胃肠道及泌尿系统常见疾病。', '鼻窦炎，幼儿急疹，急性喉炎，急性荨麻疹，急性支气管炎，小儿发热', '市级课题1项，发表论文数篇', '2016年硕士研究生毕业后一直从业嘉兴市第一院儿科工作。', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (8, '吴本荣', '../assets/dtavatar/8.jpg', 2, '副主任医师', 1, '本人毕业于赣南医学院，毕业后在河源市人民医院儿科工作至今，对儿科常见疾病有丰富的临床经验。', '小儿腹泻，感冒，湿疹，过敏，咳嗽与咳痰，小儿发热', NULL, NULL, NULL, 39.00);
INSERT INTO `ddys_doctor` VALUES (9, '郭允强', '../assets/dtavatar/9.jpg', 2, '主治医师', 1, '从医近15年，擅长儿童常见病多发病的诊疗，尤其是儿童消化系统及重症专业', '小儿腹泻，肺炎，心脏病，腹痛，小儿咳嗽，小儿发热', NULL, NULL, NULL, 29.00);
INSERT INTO `ddys_doctor` VALUES (10, '王铁锋', '../assets/dtavatar/10.jpg', 2, '主治医师', 1, '擅长新生儿及儿童常见疾病诊治，危重新生儿救治', '新生儿肺炎，新生儿疾病，新生儿败血症，新生儿感染性疾病', NULL, '硕士毕业，工作六年，2020年在上海复旦大学附属儿科医院学习', '周口市儿童重症委员会委员，周口市儿童康复委员会委员', 39.00);
INSERT INTO `ddys_doctor` VALUES (11, '廖耘生', '../assets/dtavatar/11.jpg', 3, '医师', 1, '美国心脏协会（AHA）基础生命支持导师,美国心脏协会（AHA）成人高级生命支持导师', 'HPV感染，先兆流产，阴道炎，人工流产，激素避孕，安全用药', NULL, '三甲医院医生', NULL, 69.00);
INSERT INTO `ddys_doctor` VALUES (12, '龙萍', '../assets/dtavatar/12.jpg', 3, '主治医师', 1, '从事妇产科工作五年，工作经历丰富', '妇科疾病', '2012-2015就读于青岛大学<br>2015-2018年于山东省千佛山医院规培', '2015-2018于山东省千佛山医院规培<br>2018-至今工作于滕州市中心人民医院', NULL, 25.00);
INSERT INTO `ddys_doctor` VALUES (13, '王光耀', '../assets/dtavatar/13.jpg', 3, '主治医师', 1, '中国医科大学硕士毕业，从事妇科2年，生殖中心6年。擅长不孕不育的治疗，月经失调，内分泌紊乱，围绝经期综合征的治疗等。', '不孕不育， 围绝经期综合征 阴道炎，月经不调，盆腔炎， 多囊卵巢综合征 ', '1、中国医科大学硕士毕业。<br>2、毕业从事妇产科2年。<br>3、.现辅助生殖中心工作6年<br>4、曾在重庆、广州、长春各大医院进修学习。', NULL, NULL, 49.00);
INSERT INTO `ddys_doctor` VALUES (14, '许奇伟', '../assets/dtavatar/14.jpg', 3, '主治医师', 1, '擅长各类妇产科疾病的诊治，有丰富的妇产科临床工作经验，熟练掌握妇产科常见病，多发病，疑难危重病和妇科肿瘤的诊治。', '阴道炎，盆腔炎，痛经，功能失调性子宫出血，HPV感染，月经', NULL, '华中科技大学同济医学院毕业，发表国际期刊论文数篇，多年从事干细胞相关研究', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (15, '姜雪', '../assets/dtavatar/15.jpg', 4, '主治医师', 1, '1、孕期的产前管理<br>2、妊娠期糖尿病的饮食、运动管理及营养学<br>3、妊娠期高血压的诊疗等', ' 妊娠期高血压疾病 ， 妊娠期糖尿病 ，阴道炎，人工流产，先兆流产，早期妊娠 ', NULL, NULL, NULL, 10.00);
INSERT INTO `ddys_doctor` VALUES (16, '龙小云', '../assets/dtavatar/16.jpg', 4, '主治医师', 1, '暨南大学医学硕士，高年资主治医师，擅长先兆流产、先兆早产、妊娠合并症、产后并发症，阴道炎，子宫肌瘤等各种妇产科问题。', '先兆流产，妊娠期糖尿病，胎儿生长受限，人工流产，阴道炎，正常月经与异常月经', NULL, NULL, NULL, 29.00);
INSERT INTO `ddys_doctor` VALUES (17, '周海仙', '../assets/dtavatar/17.jpg', 4, '副主任医师', 1, '2007年毕业于温州医学院（现为温州医科大学），硕士学位，2018年进修于浙江大学附属妇产科医院。知识扎实，手术熟练。', ' Rh血型不合，妊娠期糖尿病 ，阴道炎，无创产前基因检测，TORCH筛查 ', '主持一项温州市科技局课题，发表论文数篇。', '就业于温州市中西医结合医院，熟练掌握各项产科技术。', NULL, 39.00);
INSERT INTO `ddys_doctor` VALUES (18, '孙沁沁', '../assets/dtavatar/18.jpg', 4, '主治医师', 1, '从事妇产科临床工作十年，对高危妊娠、妇科疾病均有研究。', '子宫肌瘤，妊娠期糖尿病，异位妊娠，早期妊娠，子宫内膜异位症，子宫内膜息肉', NULL, '浙江中医药大学毕业<br>温州医科大学硕士学位', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (19, '黄陈孝', '../assets/dtavatar/19.jpg', 5, '医师', 1, '小儿包皮过长、包茎，隐匿性阴茎，肾脏肿瘤,血尿，泌尿系结石，泌尿系感染等', '  包皮过长，包茎， 前列腺炎 ，肾结石 ', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (20, '张朝阳', '../assets/dtavatar/20.jpg', 5, '主治医师', 1, '提供体检咨询服务，擅长包皮龟头炎，睾丸疼痛，腰痛，血尿、血精，尿潴留，中老年人排尿困难', '性病，血精，血尿，包皮龟头炎， 精索静脉曲张 ', '多家知名网络问诊平台特邀专家。义诊24小时内回复。特别急请挂电话急诊。<br>在医院很忙的医生是没有时间在这里接诊很多咨询的，有时间欢迎到医院面诊。', '勃起功能障碍，阳痿，早泄，慢性前列腺炎属于治不好的病，请勿咨询', '大专家和教授是没有时间给大家提供咨询的，如果有需要。你们问到我了，我会帮你找相应的专家解决你确实需要解决的困难和难题。', 129.00);
INSERT INTO `ddys_doctor` VALUES (21, '张凤林', '../assets/dtavatar/21.jpg', 6, '主治医师', 1, '硕士研究生，曾于复旦大学附属华山医院学习。擅长四肢麻木，肩颈腰痛，面瘫，脑出血，脑梗塞等诊断及治疗。', ' 颈椎病，腰椎间盘突出症，腰肌劳损，脑卒中，脊髓损伤，肩痛 ', NULL, NULL, NULL, 45.00);
INSERT INTO `ddys_doctor` VALUES (22, '张率功', '../assets/dtavatar/22.jpg', 6, '主治医师', 1, '本人三甲医院工作多年，对于四肢骨折，创伤，颈椎病，腰椎间盘突出，颈肩腰腿痛，关节炎等有深刻认识及治疗', '骨折，骨关节炎，颈椎病，腰椎间盘突出症， 腰椎椎管狭窄症 ', '国家级及SCI发表多篇文章', '研究生学历，自行开展手术多年', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (23, '李鸿鹏', '../assets/dtavatar/23.jpg', 6, '医师', 1, '医学硕士。现就职于聊城市人民医院', ' 骨关节炎，创伤性关节炎，骨折，腰椎间盘突出症 ', '参与骨折手术。关节置换手术等大型手术上千余台', '1.温州医科大学本科毕业</br>2.山东第一医科大学硕士毕业', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (24, '宋远征', '../assets/dtavatar/24.jpg', 6, '主治医师', 1, '主治医师，讲师，硕士研究生学历。师从东部战区总医院(南京军区南京总医院)骨科赵建宁教授。擅长骨科常见疾病的诊断及治疗。', '骨折，骨关节炎，颈椎病，腰椎间盘突出症', '主持济宁医学院教师科研基金二项，参与二项，多次在国际顶尖骨科学术会议COA大会做发言，壁报及书面交流。在国内外期刊以第一作者或通讯作者发表学术论文10余篇。', '2013年毕业于南京大学医学院，熟练掌握骨科尤其是创伤骨科疾病的诊断及治疗，学术成果获得枣庄市自然科学优秀学术成果奖一等奖。', '中国解剖学会会员<br>山东省中西医结合学会骨科专业委员会，委员', 19.00);
INSERT INTO `ddys_doctor` VALUES (25, '缪磊', '../assets/dtavatar/25.jpg', 7, '医师', 1, '医学博士，中国抗幽门螺杆菌协会会员，特别擅长治疗幽门螺杆菌，除菌成功率高达95%以上，对胃炎，肠炎消化疾病治疗深刻造诣。', '  幽门螺杆菌感染 , 胃食管反流病 , 急性胃肠炎 , 功能性便秘 , 功能性消化不良 , 慢性胃炎  ', '长事幽门螺杆菌感染根除，除菌成功率高达到95%，擅长治幽门螺杆菌感染胃炎，糜烂性胃炎，消化性溃疡，消化道肿瘤，内镜量每年达10000台，擅长胃肠镜报告单解读。', '曾在国内外顶级杂志如Gastroenterology，  中华消化杂志 ，临床消化病杂志等发表论文及SCI数篇，累计影响因子20分。', NULL, 39.00);
INSERT INTO `ddys_doctor` VALUES (26, '孟菲菲', '../assets/dtavatar/26.jpg', 7, '医师', 1, '消化科常见病诊治', '胃炎，胃溃疡，急性肠胃炎，十二指肠溃疡，幽门螺杆菌感染，反流性食管炎', NULL, NULL, NULL, 35.00);
INSERT INTO `ddys_doctor` VALUES (27, '尹春梅', '../assets/dtavatar/27.jpg', 7, '主治医师', 1, '尹春梅，硕士，对于消化系统常见疾病和动力障碍所致消化系统疾病有丰富的诊疗经验，开展食管测压、24小时PH检测和阻抗检查。', '  幽门螺杆菌感染 , 慢性胃炎，功能性肠胃病，消化性溃疡，上消化道出血，肝硬化  ', NULL, NULL, NULL, 49.00);
INSERT INTO `ddys_doctor` VALUES (28, '谢敏', '../assets/dtavatar/28.jpg', 7, '医师', 1, '从事消化内科、肝病科工作十余年，熟练掌握了了常见消化道疾病、病毒性肝炎的诊断与治疗。', '慢性胃炎，急性肠胃炎幽门螺杆菌感染，急性胃肠炎，肝炎，腹痛，便秘', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (29, '刘模', '../assets/dtavatar/29.jpg', 8, '医师', 1, '多次参加全国性口腔学术学会。擅长牙髓病的诊断与治疗，龋坏的诊断与处理；前后牙美学修复；各种复杂牙埋伏牙阻生牙的拔除。', ' 牙髓炎，智齿冠周炎，牙周炎，牙龈退缩，牙痛， 龋齿 ', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (30, '薛凯佳', '../assets/dtavatar/30.jpg', 8, '主治医师', 1, '擅长蛀牙牙髓炎牙周病等口腔常见病的诊断和治疗', '慢性胃炎，急性肠胃炎幽门螺杆菌感染，急性胃肠炎，肝炎，腹痛，便秘', NULL, NULL, NULL, 39.00);
INSERT INTO `ddys_doctor` VALUES (31, '孙长安', '../assets/dtavatar/31.jpg', 8, '主治医师', 1, '口腔医学硕士，口腔全科主治医师，能够完成牙齿的无痛治疗，美学修复，牙周炎及牙齿的修复和种植义齿修复，冷光美白等', ' 牙髓炎 ，牙周炎，口腔溃疡，牙龈炎，根尖周炎，牙龈退缩', '2011年至今工作于锦州医科大学附属第二医院', '发表国家核心期刊论文2篇，参与省级课题两项，主持辽宁省教育厅课题一项', '中华口腔医学会颞下颌关节学会委员<br>中华口腔医学会牙体牙髓病学会员<br>口腔全科主治医师<br>口腔内科主治医师', 39.00);
INSERT INTO `ddys_doctor` VALUES (32, '王美丽', '../assets/dtavatar/32.jpg', 8, '医师', 1, '口腔医学博士，现在就职于知名三甲医院口腔科', '牙髓炎，龋齿，牙龈炎，牙周炎，口腔溃疡，智齿冠周炎', '口腔医学博士，现在就职于知名三甲医院口腔科', NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (33, '刘吉林', '../assets/dtavatar/33.jpg', 9, '医师', 1, '本人毕业于广东医科大学，从业6年，擅长耳鼻咽喉头颈外科各种如急慢性咽喉炎，急慢性扁桃体炎，急慢性鼻-鼻窦炎等疾病的诊治。', '中耳炎，甲状腺疾病，鼻窦炎，咽喉炎，扁桃体炎，鼻咽癌', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (34, '孙珂', '../assets/dtavatar/34.jpg', 9, '主治医师', 1, '毕业于泰山医学院，工作十余年，一直从事小儿及成人耳鼻喉工作，2012年进修于复旦大学附属儿科医院耳鼻喉科。', '中耳炎，鼻炎，小儿鼻窦炎，扁桃体炎，腺样体肥大，小儿中耳炎', NULL, '泰山医学院毕业，每年开展儿童扁桃体腺样体手术500余例。', NULL, 39.00);
INSERT INTO `ddys_doctor` VALUES (35, '冀少杰', '../assets/dtavatar/35.jpg', 9, '主治医师', 1, '研究生毕业，师从省内耳鼻喉科著名专家赵玉林教授，16年毕业后至郑州大学第五附属医院耳鼻喉科工作', '鼻窦炎，鼻息肉，鼻中隔偏曲，中耳炎，声带息肉，睡眠呼吸暂停综合征', NULL, '郑州大学研究生毕业，能独立完成参加常规耳鼻喉手术，熟悉常见耳鼻喉疾病的诊疗', '河南省中西医耳鼻喉委员', 49.00);
INSERT INTO `ddys_doctor` VALUES (36, '陆齐生', '../assets/dtavatar/36.jpg', 9, '主治医师', 1, '从医二十余年，曾在中山大学附属第一医院耳鼻喉医院等三甲医院进修两年。掌握耳鼻喉科疾病诊治，对五官科疾病有一定的钻研。', '神经性耳鸣，慢性鼻窦炎，过敏性鼻炎，慢性咽炎，小儿急性喉炎，喉癌', '右江民族医学院临床医学毕业。<br>从事耳鼻喉科临床工作二十余年。<br>先后在三甲医院耳鼻喉科进修两年。', NULL, NULL, 39.00);
INSERT INTO `ddys_doctor` VALUES (37, '梁秀玮', '../assets/dtavatar/37.jpg', 10, '医师', 1, '南昌大学眼科学研究生毕业，上海同济大学附属医院眼科培养经历，擅长各类眼表眼底，屈光不正等眼科常见病的诊断和鉴别。', '老年性黄斑变性，白内障，糖尿病视网膜病变，青光眼，屈光不正', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (38, '王佳琪', '../assets/dtavatar/38.jpg', 10, '主治医师', 1, '硕士毕业于国内知名大学华中科技大学同济医学院，毕业后进入国家三级甲等医院工作，19年考入武汉大学医学部攻读博士学位。', '结膜炎，脸腺炎，干眼，近视，过敏性结膜炎，青光眼', '1.熟练掌握眼科各类常见病及多发病的诊治，擅长各类眼科常规治疗及手术操作。2.于2018年获中华医学会全国十佳图片奖，多次参加各类眼科培训班及全国眼科年会。', '2011-2014学习于华中科技大学同济医学院，硕士毕业后就职于襄阳第一人民医院，2019年于武汉大学在职攻读博士学位，发表多篇核心期刊及SCI论文。', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (39, '林刚', '../assets/dtavatar/39.jpg', 10, '主治医师', 1, '毕业于遵义医学院，从事眼科工作十九年，擅长各种儿童眼病、青少年近视防控、斜弱视、干眼症、白内障等。', '干眼，近视，弱视，脸腺炎，过敏性结膜炎，斜视', '1.2000年遵义医学院临床医学毕业<br>2.2000年至今黔东南州人民医院眼科<br>3.2003年2008年2010年参加中华健康快车复明行动，获优秀工作者称号。', NULL, NULL, 59.00);
INSERT INTO `ddys_doctor` VALUES (40, '周展勋', '../assets/dtavatar/40.jpg', 10, '主治医师', 1, '眼科主治医师，擅长干眼症、青光眼、白内障、虹膜炎、眼底病变等眼科常见病多发病的诊断及治疗，有着丰富的经验', '脸腺炎，结膜炎，白内障，青光眼，糖尿病视网膜病变，干眼', NULL, '发表核心期刊论文10篇', '医学会委员', 19.00);
INSERT INTO `ddys_doctor` VALUES (41, '张昊', '../assets/dtavatar/41.jpg', 11, '医师', 1, '本人三甲医院呼吸与危重症科大夫。研究生学历。有丰富的医学临床医学经验。对呼吸道系统的主要疾病有深入研究', '慢性支气管炎，哮喘，肺炎，感冒，慢性阻塞性肺疾病，咳嗽与咳痰', '对急性上呼吸道感染，急性肠胃炎。慢性支气管炎，慢性阻塞性肺疾病急性发作的诊疗，擅长气管插管，呼吸机，深静脉穿刺，CRRT等医学操作，医学理论扎实。', NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (42, '何火珍', '../assets/dtavatar/42.jpg', 11, '医师', 1, '2019年呼吸内科硕士研究生毕业，毕业后在九江某三甲医院工作，擅长治疗慢性阻塞性肺疾病、支气管哮喘和慢性咳嗽。', '慢性阻塞性肺疾病，哮喘，咳嗽与咳痰', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (43, '韩静', '../assets/dtavatar/43.jpg', 11, '主治医师', 1, '硕士研究生毕业，三甲医院呼吸内科工作十余年，曾于北京朝阳医院进修一年，有丰富的临床经验', '呼吸道感染，睡眠呼吸暂停综合征，慢性阻塞性肺疾病，支气管扩张，哮喘，肺炎，肺癌，肺栓塞，肺脓肿，呼吸衰竭', '毕业后一直从事临床工作，救治大量疑难危重病人。首批参与新冠疫情一线工作。', '参与省科研立项。发表多篇核心论文', '中国医师协会青年委员', 39.00);
INSERT INTO `ddys_doctor` VALUES (44, '张宁', '../assets/dtavatar/44.jpg', 11, '主治医师', 1, '博士医师，擅长呼吸道疾病、老年疾病', '呼吸道感染，高血压病，冠心病', '主持3项河北省卫生厅项目', '2011年毕业至今一直于河北省人民医院就职', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (45, '李小燕', '../assets/dtavatar/45.jpg', 12, '副主任医师', 1, '本人从事内科工作多年，尤其擅长消化道疾病的诊断治疗。', '肝炎，慢性胃炎，脂肪肝，慢性腹泻，功能性胃肠病', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (46, '张静', '../assets/dtavatar/46.jpg', 12, '主治医师', 1, '自工作以来，一直从事内科常见病，多发病的诊治', '高血压病，糖尿病，冠心病，脑梗死，痛风，发热', NULL, NULL, NULL, 49.00);
INSERT INTO `ddys_doctor` VALUES (47, '曾艳', '../assets/dtavatar/47.jpg', 12, '医师', 1, '全日制硕士研究生毕业，从事医师工作，单独管床，熟练掌握内科常见疾病及多发病的诊疗，承但娄底及周边地区群众的医疗救治任务。', '冠心病，糖尿病，急性上呼吸道感染，高血压病，甲状腺疾病，肺炎', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (48, '徐晓明', '../assets/dtavatar/48.jpg', 12, '主治医师', 1, '擅长咳嗽，发热，消化不良，高血压糖尿病，脑梗，头晕，头痛，失眠症，帕金森病，面瘫，肢体麻木，腰痛肩痛足痛，双膝关节炎康复', '急性上呼吸道感染，肺炎，颈椎病，腰椎间盘突出症，急性肠胃炎，功能性消化不良', '2009年毕业于新乡医学院临床医学系，2016年曾进修于北京积水潭医院物理康复科，学习骨关节康复。欢迎大家有临床和康复的问题可以来问。', NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (49, '周学超', '../assets/dtavatar/49.jpg', 13, '医师', 1, '从事肝病工作5年，有丰富的肝病治疗经验；<br>在全国著名肝病专家，肝病学分会青年副主委杨永峰教授领导团队下工作。', '慢性乙型病毒性肝炎，狂犬病，病毒性肝炎，肝功能不全，肝硬化，乙肝两对半', '曾在东部战区总医院工作<br>目前在南京市第二医院肝病科工作', '毕业于天津医科大学传染病学专业（肝病学）<br>发表中华消化内镜杂志论著1篇', NULL, 49.00);
INSERT INTO `ddys_doctor` VALUES (50, '赵振', '../assets/dtavatar/50.jpg', 13, '主治医师', 1, '首批援鄂医疗队员，医学硕士，在职博士，济宁市第一人民医院主治医师，科副主任，擅长:恐艾咨询，艾滋病，肝病，不明原因发热。', '艾滋病，慢性乙型病毒性肝炎，狂犬病，丙型病毒性肝炎，酒精性肝病', '重庆医科大学附属第一医院感染科毕业；<br>济宁市第一人民医院感染科工作；<br>复旦大学附属华山医院进修学习；<br>山东省首批援鄂医疗队队员，黄冈市大别山区域医疗中心抗疫。', '参与国家自然科学基金1项。发表SCI论文及核心期刊数篇。复旦大学附属华山医院感染科进修半年。', '山东省医学会感染病分会青年委员，济宁市预防医学会感染分会委员，济宁市医学会感染病分会委员，济宁市医师协会传染病分会委员。新浪微博医学科普作者。', 28.00);
INSERT INTO `ddys_doctor` VALUES (51, '徐娟娟', '../assets/dtavatar/51.jpg', 13, '副主任医师', 1, '毕业于中国医科大学七年制临床医学系，硕士学位。天津医科大学总医院感染科，主治医师，北京协和医院进修，从事感染性疾病的诊治', '新型冠状病毒肺炎，狂犬病，结核病，急性上呼吸道感染，慢性乙型病毒性肝炎，发热', '发表数篇学术论文<br>承担天津医科大学国际学院内科学和诊断学教学以及七年制和本科学生的临床带教工作<br>北京协和医院进修<br>新冠病毒会诊专家', '中国医科大学七年制临床医学毕业<br>天津医科大学总医院感染科主治医师', '天津市新型冠状病毒会诊专家，参与抗击新冠肺炎疑难重症病例诊治一线工作。', 39.00);
INSERT INTO `ddys_doctor` VALUES (52, '王光东', '../assets/dtavatar/52.jpg', 13, '主治医师', 1, '毕业于天津医科大学内科学，目前为三甲医院主治医师，从医多年，有丰富临床工作经验。', '狂犬病，艾滋病，慢性乙型病毒性肝炎，新型冠状病毒肺炎，流行性出血热，手足口病', '1.天津医科大学传染病研究生毕业<br>2.从事传染病工作7年<br>3.丰富的理论和临床经验', '1翻译国外医学著作一部<br>2独立完成论文2篇<br>3参编著作3本', '1山东医学会感染病学分会青年委员<br>2山东艾防协会理事<br>3山东肝病学组成员<br>4日照市感染病学会委员', 49.00);
INSERT INTO `ddys_doctor` VALUES (53, '索艳', '../assets/dtavatar/53.jpg', 14, '医师', 1, '硕士研究生，从事内分泌科工作十年余，对糖尿病降糖药选择、并发症的诊治、甲亢、甲减药物调整有着丰富的临床经验。', '糖尿病，甲状腺功能亢进症，甲状腺功能减退症', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (54, '杨柳', '../assets/dtavatar/54.jpg', 14, '医师', 1, '哈医大硕士研究生毕业，擅长各种内分泌代谢性疾病，糖尿病，桥本氏甲状腺炎，痛风，甲状腺功能亢进及减退，甲状腺结节等。', '糖尿病，痛风，甲状腺疾病，高尿酸血症，肥胖症，垂体瘤', '毕业于哈尔滨医科大学附属第一医院，硕士研究生学历，从事内分泌代谢性疾病方向。擅长各种内分泌代谢性疾病。发表国家级核心期刊SCI 论文3篇，国内核心期刊1篇。', '毕业于哈尔滨医科大学附属第一医院，硕士研究生学历，从事内分泌代谢性疾病方向，现于大庆龙南医院工作至今。发表国家级核心期刊SCI 论文3篇，国内核心期刊1篇。', NULL, 29.00);
INSERT INTO `ddys_doctor` VALUES (55, '梁亚茹', '../assets/dtavatar/55.jpg', 14, '主治医师', 1, '硕士研究生，对患者负责、认真。', '2型糖尿病，甲状腺功能亢进症', NULL, '毕业于西安交通大学临床医学专业', NULL, 10.00);
INSERT INTO `ddys_doctor` VALUES (56, '赵冬丽', '../assets/dtavatar/56.jpg', 14, '主治医师', 1, '硕士研究生学历，内分泌与代谢性疾病专业。擅长糖尿病、甲状腺与甲状旁腺疾病、垂体瘤、库欣综合征、肥胖症、痛风等疾病的诊治。', '糖尿病，甲状腺功能亢进症，甲状腺功能减退症，亚急性甲状腺炎，垂体瘤，库欣综合征', '毕业于哈尔滨医科大学附属第一医院。', '毕业于哈尔滨医科大学附属第一医院。', NULL, 39.00);
INSERT INTO `ddys_doctor` VALUES (57, '刘彤', '../assets/dtavatar/57.jpg', 15, '医师', 1, '北京协和医学院心内科博士；<br>北京积水潭医院心内科医生；<br>北京心衰中心团队核心成员。', '冠心病，高血压，高脂血症，心脏病，心律失常，胸痛', '已发表文章9篇，其中SCI共6篇；<br>参与整理《19年中国心衰指南》；<br>参编《心脏病药物治疗学》人卫出版社；<br>主持一项中央高校科研项目课题。', '1、北京协和医学院心内科博士；<br>2、参与中国心衰中心示范基地建设。', '丰富的临床及科研经验。', 49.00);
INSERT INTO `ddys_doctor` VALUES (58, '杨帆', '../assets/dtavatar/58.jpg', 15, '主治医师', 1, '心血管病工作二十余年，在常见的心血管疾病的诊断治疗中有丰富的临床经验。', '高血压病，冠心病，高脂血症，心律失常，不稳定型心绞痛，心力衰竭', NULL, NULL, NULL, 79.00);
INSERT INTO `ddys_doctor` VALUES (59, '钱恒博', '../assets/dtavatar/59.jpg', 15, '主治医师', 1, '2008年本科毕业于济宁医学院；2014年获心血管内科主治医师资格证书，2017年获青岛大学医学院急诊医学硕士学位；', '冠心病，急性心肌梗死，高血压病，心律失常，心力衰竭，心肌病', '冠脉造影<br>冠脉支架植入<br>有各种急救，处理急性中毒等急诊科工作经历', '2019年心血管介入诊疗培训基地中国医科院阜外医院第十四期学员。', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (60, '冷海', '../assets/dtavatar/60.jpg', 15, '主治医师', 1, '本科毕业于山东医科大学，研究生毕业于潍坊医学院，主要擅长高血压、冠心病、心律失常、心力衰竭等心血管疾病的诊断及治疗。', '高血压病，冠心病，心律失常，心力衰竭', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (61, '段文慧', '../assets/dtavatar/61.jpg', 16, '医师', 1, '2010-2015年就读于山西医科大学七年制本硕连读专业；后与住院医师规范化培训并轨，继续攻读经病学硕士学位，表现优异。', '脑梗死，脑出血，睡眠障碍，失眠，头晕，头痛', '发表两篇中华论文；参与一项省级基金课题。', '2018年7月硕士毕业后就业于长治市人民医院，主攻神经重症方向', '2010-2015年就读于山西医科大学七年制本硕连读专业；后与住院医师规范化培训并轨，继续攻读经病学硕士学位，表现优异。', 19.00);
INSERT INTO `ddys_doctor` VALUES (62, '廖志东', '../assets/dtavatar/62.jpg', 16, '主治医师', 1, '擅长脑梗塞，脑出血，脑炎，癫痫，头晕头痛，睡眠障碍，在神经内科工作已10余年，具有丰富的临床经验。', '睡眠障碍，脑出血，脑梗死，脑炎，头晕，头痛', NULL, '本人毕业于右江民族医院院，本科学历，学士学位，在神经内科工作10余年，具有丰富的临床经验，发表了多篇论文和综述。', NULL, 29.00);
INSERT INTO `ddys_doctor` VALUES (63, '秦丽丽', '../assets/dtavatar/63.jpg', 16, '主治医师', 1, '在大内科及神经内科工作10年多，一直从事临床一线工作，积累了丰富的经验，知识扎实、勤奋好学、乐于助人，对病患耐心、仔细。', '脑梗死，高血压病，2型糖尿病，高脂血症，头痛，头晕', NULL, '毕业至今 临床一线工作（轮转过呼吸内科、心内科、内分泌科、消化科、风湿免疫科、血液科等，定科后一直在神经内科工作）（问诊后可帮忙一起开处方，直接寄送到家，方便）', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (64, '孙琴琴', '../assets/dtavatar/64.jpg', 16, '主治医师', 1, '研究方向为神经病学，亚专业为睡眠与癫痫。擅长脑梗死、脑出血等神经内科常见病，以及各种睡眠障碍。', '心脑血管疾病，睡眠障碍，睡眠呼吸暂停综合征，癫痫，多导睡眠图', '参与编写“睡眠医学图谱”、“睡眠科普”系列丛书，发表睡眠相关论文10余种，每年参与及筹备睡眠相关会议10余场，开展心肺耦合技术、脑功能状态技术、失眠治疗仪技术等新技术、新疗法。', '毕业于吉林大学，在吉林大学第一医院神经内科工作，从事神经内科门诊、急诊、病房工作，睡眠监测判读，呼吸机压力滴定，失眠患者认知及行为治疗，以及失眠治疗仪和脑功能状态治疗睡眠障碍疾病。', '中国睡眠研究会青年委员会委员，中国医师协会睡眠专业委员会青年委员，吉林省医学会神经病学分会睡眠学组秘书，东北三省及内蒙古睡眠障碍诊治联盟秘书，吉林省卒中学会睡眠障碍专业委员会秘书及青年学组委员、吉林省健康管理学会睡眠医学专委会mi s q', 10.00);
INSERT INTO `ddys_doctor` VALUES (65, '王琼爱', '../assets/dtavatar/65.jpg', 17, '医师', 1, '2014年毕业，从事肾脏疾病6年，对各种肾脏常见病、多发病有一定的经验。', '肾病综合征，慢性肾衰竭，急性肾衰竭，狼疮性肾炎', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (66, '丁文飞', '../assets/dtavatar/66.jpg', 17, '主治医师', 1, '擅长血管通路的建立（临时、长期置换，动静脉内瘘）及维护，肾穿刺等！', '急性肾小球肾炎，狼疮性肾炎，尿路感染，慢性肾衰竭，急性肾衰竭，慢性神小球肾炎', '研究生期间工作于江西省人民医院肾病内科！研究生毕业后长期工作于西南医科大学附属医院肾病内科！', '目前已发表北大核心多篇，主持课题两项！', NULL, 10.00);
INSERT INTO `ddys_doctor` VALUES (67, '赵岩', '../assets/dtavatar/67.jpg', 17, '医师', 1, '本人2011年毕业，一直从事医学相关工作', '透析相关性低血压，透析失衡综合征，尿毒症，血液透析', NULL, '2018年2月至今工作医院血液透析室', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (68, '沈晓琪', '../assets/dtavatar/68.jpg', 17, '主治医师', 1, '毕业于浙江大学医学院，擅长常见原发及继发肾脏疾病、慢性肾衰竭等的诊治', '肾病综合征，慢性肾小球肾炎', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (69, '李杏', '../assets/dtavatar/69.jpg', 18, '主治医师', 1, '医学博士，主治医师，师从国内著名免疫学专家孙尔维教授，擅长风湿免疫常见疾病如类风湿、狼疮、强直以及各种关节痛腰腿痛诊治。', '强直性脊柱炎，类风湿关节炎，痛风性关节炎，系统性红斑狼疮，过敏，口腔溃疡', '1.主持国家自然科学基金青年项目1项；2.以第一作者发表2区SCI论文3篇，以共同第一作者发表SCI论文3篇', '本科、硕士、博士均毕业于南方医科大学，博士毕业就职于南方医科大学第三附属医院（广东省骨科医院）。', '1.广东省免疫学会女科学家工作委员会委员；2.广东省免疫学会临床免疫分会委员', 19.00);
INSERT INTO `ddys_doctor` VALUES (70, '张峰', '../assets/dtavatar/70.jpg', 18, '主治医师', 1, '师从国务院特殊津贴风湿免疫病及感染病学专家，擅长类风湿关节炎、痛风等风湿免疫性疾病以及各种发热、风湿病合并感染的诊治。', '类风湿关节炎，痛风，系统性红斑狼疮，强直性脊柱炎，发热', NULL, '师从国务院特殊津贴专家<br>长期在感染/风湿免疫科学习和工作<br>2020年赴鄂支援武汉抗击新冠疫情', NULL, 39.00);
INSERT INTO `ddys_doctor` VALUES (71, '郭晓峰', '../assets/dtavatar/71.jpg', 18, '主治医师', 1, '擅长类风湿关节炎，强直性脊柱炎，红斑狼疮，痛风，疑难风湿病，如结节病、成人斯蒂尔病、IgG4 相关性疾病、血管炎诊治。', '强制性脊柱炎，痛风性关节炎，类风湿关节炎，系统性红斑狼疮，结节病，成人斯蒂尔病', '福建医科大学风湿免疫科专业研究生毕业，曾在北京协和医院进修学习。', NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (72, '丁香', '../assets/dtavatar/72.jpg', 18, '医师', 1, '临床职业7年', '痛风，痛风性关节炎，风湿性多肌痛，类风湿关节炎，强直性脊柱炎，系统性红斑狼疮', NULL, '曾于蚌埠医学院第一附属医院规培3年', '安徽省风湿病协会委员', 29.00);
INSERT INTO `ddys_doctor` VALUES (73, '姜明', '../assets/dtavatar/73.jpg', 19, '副主任医师', 1, '2007年毕业后从事血液病临床，教学，科研工作<br>擅长常见血液科疾病的诊疗，<br>对于危重症抢救和疑难杂症有自己的见解', '白血病，淋巴瘤，血小板减少症，贫血，多发性骨髓瘤，骨髓增生异常综合征', NULL, '本科就读于哈尔滨医科大学<br>硕士就读于吉林大学<br>07年于三甲医院工作至今', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (74, '宋明英', '../assets/dtavatar/74.jpg', 19, '主治医师', 1, '主治医师，硕士研究生，擅长各种血液病的诊疗，于三甲医院血液科从事临床工作。', '地中海贫血，缺铁性贫血，血小板减少症，原发性血小板增多症，贫血，血常规', NULL, '主治医师，硕士研究生，擅长各种血液病的诊疗，于三甲医院血液科从事临床工作。擅长淋巴瘤，地中海贫血，白血病，血小板增多症，各种血液科及内科常见疾病。', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (75, '赵雪琴', '../assets/dtavatar/75.jpg', 19, '副主任医师', 1, '副主任医师，医学博士学位，硕士研究生导师', '贫血，血小板减少症，白血病，多发性骨髓瘤，骨髓增生异常综合征，血常规', NULL, '发表文章10余篇，SCI文章2篇', '从事血液科临床工作13年，临床经验丰富', 19.00);
INSERT INTO `ddys_doctor` VALUES (76, '黄磊', '../assets/dtavatar/76.jpg', 19, '主治医师', 1, '从事血液病数年，致力于各种贫血、白细胞数目异常、血小板数目异常、紫癜，白血病、骨髓瘤、淋巴瘤、MPN等疾病的诊治。', '白血病，缺铁性贫血，淋巴瘤，贫血，发热，血常规', '徐州医科大学毕业。', '省慢性粒细胞白血病协会委员。', '发表国家级论文三篇，省级论文数篇。', 19.00);
INSERT INTO `ddys_doctor` VALUES (77, '房建忠', '../assets/dtavatar/77.jpg', 20, '主治医师', 1, '从事神经外科5年余，现为神经外科主治医师。在临床一线，积累大量临床经验，熟练掌握神经外科疾病的诊治。', '脑出血，颅内动脉瘤，颅内肿瘤，三叉神经痛，颅脑损伤，面肌痉挛', NULL, '从事神经外科5年，现为主治医师。', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (78, '丁超', '../assets/dtavatar/78.jpg', 20, '主治医师', 1, '毕业于天津医科大学，医学与法学双学位，就读浙大同等学力研究生，从事神经外科工作10年。', '脑出血，颅脑损伤，脑震荡，癫痫，颅内肿瘤，腰椎间盘突出症', NULL, '台州市中心医院（台州学院附属医院）从事神经外科工作10年，贵州铜仁万山区人民医院脑病中心建科帮扶半年。', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (79, '雏朦', '../assets/dtavatar/79.jpg', 20, '主治医师', 1, '     2011年7月至今在九江市第三人民医院工作。', '脑出血，脑梗死，脑积水，脑膜瘤，脑挫伤，头痛', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (80, '王凡', '../assets/dtavatar/80.jpg', 20, '主治医师', 1, '硕士学位，市级专家，政府津贴获得者，省卫生系统拔尖创新人才。擅长三叉神经痛，脑血管病，脑出血，创伤，肿瘤、脑积水等。', '三叉神经痛，脑出血，颅脑损伤，神经胶质瘤，脑膜瘤，颅内动脉瘤', '省市科技进步奖6项，新技术奖9项，著作和学术论文十余篇。', '1996年毕业，2005年获硕士学位，曾在北京天坛，宣武医院进修，并在国外，国内如北京三博，辽宁省人民医院，天津医科大学总医院等专项学习。', NULL, 10.00);
INSERT INTO `ddys_doctor` VALUES (81, '王蔚', '../assets/dtavatar/81.jpg', 21, '副主任医师', 1, '97年开始从事心血管外科工作，擅长心脏瓣膜疾病、冠心病、常见先天性心脏病以及大血管疾病的外科治疗。', '房间隔缺损，室间隔缺损，法洛四联症，冠心病，二尖瓣狭窄，主动脉瓣狭窄', NULL, '华西医学中心临床外科硕士研究生，从事心血管外科工作二十余年。', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (82, '王大春', '../assets/dtavatar/82.jpg', 21, '主治医师', 1, '擅长胸外科常见疾病诊治！如：肺癌 食管癌 胸痛 气胸 肺结核 胸腔积液 肋骨骨折 胸膜炎 肺部结节 肺炎 咳嗽 纵膈肿瘤', '肺癌，食管癌，气胸，肺结核，胸腔积液，肋骨骨折', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (83, '闫明亮', '../assets/dtavatar/83.jpg', 21, '主治医师', 1, '从事心脏疾病诊疗数年，有丰富的临床经验', '先天性心脏病，心脏瓣膜病，主动脉夹层，冠心病，胸主动脉瘤', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (84, '陈磊', '../assets/dtavatar/84.jpg', 21, '副主任医师', 1, '擅长肺癌，肺结节（肺实性结节，亚实性结节，磨玻璃结节，混合性结节），食管癌，胸腺瘤，气胸，胸腔积液，肋骨骨折诊断及治疗。', '肺癌，肺部结节，食管癌，气胸，胸痛，胸部CT检查', NULL, NULL, NULL, 29.00);
INSERT INTO `ddys_doctor` VALUES (85, '秦哲', '../assets/dtavatar/85.jpg', 22, '医师', 1, '本人主要从事肝胆胰脾疾病的微创外科治疗，擅长腹腔镜微创治疗胆囊结石及息肉，肝胆管结石，肝脏良恶性肿瘤，胰腺良恶性肿瘤。', '胆囊息肉，胆总管结石，胆囊结石，胆囊癌，肝癌，脂肪肝', '发表核心期刊论文数篇，参与国家自然科学基金2项', '1.中南大学湘雅医学院毕业，博士研究生学历2. 2015年至今工作于昆明医科大学第一附属医院，完成肝胆微创手术1000余台。', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (86, '孔杰', '../assets/dtavatar/86.jpg', 22, '主治医师', 1, '本人擅长肝胆胰腺脾脏疾病诊治工作，尤其是对微创手术更是熟练。', '肝癌，脂肪肝，胆囊肿，肝硬化，肝血管瘤，胆石症', '1.青岛大学医学院附属医院毕业，师从著名教授吴力群教授2.在中华肝胆外科杂志发表论文3.执业后对腹部CT，彩超及手术有全面的技术实力', '1.青岛大学医学院附属医院 2.菏泽市立医院', '山东医师学会青年医师委员', 19.00);
INSERT INTO `ddys_doctor` VALUES (87, '兰辉', '../assets/dtavatar/87.jpg', 22, '副主任医师', 1, '从事肝胆结石，肝肿瘤，胰腺疾病及脾脏疾病诊治工作20年', '胆囊炎，胰腺炎，胆总管结石，胆囊结石，肝功能不全，胆囊息肉', NULL, NULL, NULL, 39.00);
INSERT INTO `ddys_doctor` VALUES (88, '刘成科', '../assets/dtavatar/88.jpg', 22, '主治医师', 1, '毕业青岛大学，在菏泽市立医院工作，上海瑞金医院进修，对肝胆胰外科常见病和疑难病症有独到见解，推崇微创及肿瘤靶向免疫治疗。', '肝癌，门静脉高压症，胆总管结石，胆囊结石，胆囊癌，胰腺癌', '1.青岛大学医学院研究生毕业2.上海交通大学附属瑞金医院肝胆外科，胰腺中心进修学习3.对肝脏肿瘤切除，靶向免疫治疗，胰十二指肠切除，胰腺癌新辅助治疗有深入研究', '青岛大学医学院毕业，在菏泽市立医院肝胆外科工作', '山东省菏泽市普外科学会委员', 19.00);
INSERT INTO `ddys_doctor` VALUES (89, '毛宁', '../assets/dtavatar/89.jpg', 23, '医师', 1, '本科毕业于北京中医药大学中西医结合专业，硕士攻读乳腺外科，于北京中医药大学东直门医院、西安交通大学第一附属医院进修学习。', '乳腺纤维腺瘤，乳腺癌，乳腺增生症，男性乳房发育症，甲状腺结节，甲状腺癌', '熟悉各类乳腺相关手术', '发表学术论文数篇<br>参与省部级课题2项', '陕西省抗癌协会乳腺癌专业委员会委员', 19.00);
INSERT INTO `ddys_doctor` VALUES (90, '严泽文', '../assets/dtavatar/90.jpg', 23, '医师', 1, '外科学硕士，毕业于吉林大学白求恩医学部，擅长普外科常见疾病尤其甲状腺、甲状旁腺疾病的诊治；已通过普外科主治医师资格考试。', '甲状腺癌，乳腺癌，乳腺纤维腺瘤，急性乳腺炎，甲状腺疾病，甲状腺结节', '毕业于吉林大学白求恩医学部，管理甲状腺手术病人超1000人，管理甲状腺微波消融患者140余人。现就职于我院外四科（普外、乳腺科）。', '于中文核心期刊发表论文3篇，一作2篇，二作1篇。', NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (91, '高慧', '../assets/dtavatar/91.jpg', 23, '主治医师', 1, '广西中医药大学附属瑞康医院乳腺科主治医师 广西中医药大学讲师。广西中医药大学附属瑞康医院乳腺科主诊医师。', '乳腺囊性增生病，乳腺纤维腺瘤，乳腺癌，急性乳腺炎，男性乳房发育症，乳腺结节', '本人2008年参加工作，2011年研究生毕业后从事乳腺病学研究与工作，同时担任广西中医药大学瑞康临床医学院教学工作。', '主持和参与多项自治区级科研项目工作。', '中国医师协会会员<br>广西肿瘤专业委员会会员<br>广西肿瘤转移专业委员会会员<br>广西肿瘤转移专业委员会青年委员会会员', 39.00);
INSERT INTO `ddys_doctor` VALUES (92, '文小强', '../assets/dtavatar/92.jpg', 23, '医师', 1, '知名医学院校毕业，在三甲医院工作至今，有扎实的理论基础及良好的临床经验，愿为您解除病痛，重拾靓丽人生！', '急性乳腺炎，导管周围乳腺炎，乳腺增生症，乳腺纤维腺瘤，乳腺良性肿瘤，乳腺癌', '1.西安交通大学医学院硕士研究生学位<br>2.熟练掌握乳腺良恶性肿瘤及乳腺疾病的外科治疗', '发表本专业学术论文数篇', '1.陕西省医师协会会员<br>2.陕西省抗癌协会委员会委员<br>3.陕西省保健协会肿瘤多学科协作诊疗专业委员会委员', 19.00);
INSERT INTO `ddys_doctor` VALUES (93, '邓汝琪', '../assets/dtavatar/93.jpg', 24, '主治医师', 1, '血管外科硕士毕业，擅长下肢静脉曲张，动静脉血栓，下肢动脉硬化性闭塞症，颈动脉狭窄，各种动脉瘤及动脉夹层的诊治。', '下肢静脉曲张，下肢深静脉血栓形成，血栓性浅静脉炎，腹主动脉瘤，下肢动脉硬化闭塞症', '中国科学技术大学附属第一医院血管外科硕士毕业<br>取得国家级住院医师规范化培训合格证书', NULL, '中国微循环学会压力学组委员<br>亚太血管联盟安徽分会青年委员<br>亳州市人民医院新星人才', 19.00);
INSERT INTO `ddys_doctor` VALUES (94, '柴玉林', '../assets/dtavatar/94.jpg', 24, '主治医师', 1, '哈尔滨医科大学普外科硕士研究生，普外科专业，对甲状腺，乳腺疾病，肝胆，胃肠疾病可以很好的诊断及治疗。', '甲状腺疾病，乳腺纤维腺瘤，乳腺癌，乳腺增生症，胆囊炎，胆囊息肉', '国家级核心期刊发表论文三篇。', '2015年9月至今盘锦市中心医院执业', '盘锦市医学会肠外肠内营养分会会员', 19.00);
INSERT INTO `ddys_doctor` VALUES (95, '曾志伟', '../assets/dtavatar/95.jpg', 24, '主治医师', 1, '2012年毕业于北京大学医学部获得博士学位，善长胃肠肿瘤，肛肠疾病，疝与腹壁外科，急腹症，体表肿物，体表感染，淋巴结肿大', '直肠癌，痔疮，阑尾炎，创伤，疝气， 疖和痈 ', '科室目前分设：胃肠组、肛肠组、疝与腹壁组和门诊换药室，门诊换药室针对各种体表肿物及体表感染进行治疗，另外设有专业造口门诊。本人目前在上述各组定期出诊诊治病人。', '2018年美国匹兹堡大学访问学者，参与国家自然科学基金项目1项。第一作者发表SCI论文3篇，中文核心期刊7篇', '北京癌症防治协会直肠癌新辅助治疗委员会青年委员', 69.00);
INSERT INTO `ddys_doctor` VALUES (96, '胡子龙', '../assets/dtavatar/96.jpg', 24, '主治医师', 1, '普外科专家 主刀医生<br>中国人民解放军总医院(301医院)外科学博士，擅长胃癌结直肠癌 痔疮肛裂便血等肛周疾病的综合治疗', '结直肠癌，痔疮，下肢静脉曲张，阑尾炎，疝气，淋巴结肿大', NULL, '发表sci期刊论文6篇 国家核心期刊论文9篇<br>参与国家自然科学基金面上项目1项<br>参与结直肠外科学译著一部', NULL, 79.00);
INSERT INTO `ddys_doctor` VALUES (97, '杨陆涛', '../assets/dtavatar/97.jpg', 25, '主治医师', 1, '主治医师，硕士研究生毕业于南昌大学，毕业后一直于三甲医院的烧伤整形美容科工作，熟练掌握相关疾病的诊治及各项美容手术。', '烧伤，瘢痕，色素痣，痤疮，双眼皮成形术，鼻整形', NULL, '南昌大学医学院硕士毕业', NULL, 26.00);
INSERT INTO `ddys_doctor` VALUES (98, '江华', '../assets/dtavatar/98.jpg', 25, '主任医师', 1, '乳房整形与再造、隆乳、隆鼻、乳房下垂、巨乳缩小、耳再造、鼻再造、生殖器整复再造、疤痕畸形整复，重睑、眼袋、除皱、吸脂等。', '鼻中隔偏曲，烧伤，巨乳症，先天性小耳畸形，乳房下垂，植发', NULL, NULL, NULL, 19.00);
INSERT INTO `ddys_doctor` VALUES (99, '张国佑', '../assets/dtavatar/99.jpg', 25, '主治医生', 1, '十余年临床经验，擅长各种美容、整形手术（各种肿物，痣，疤，眼鼻整形，脂肪抽吸填充，微整形，乳房整形等）。', '色素痣，去眼袋，瘢痕，鼻整形，隆胸，微整形', '德国医学博士，上海交通大学博士后，原丁香园烧伤整形版块版主，曾获WHS“Young Investigator Award”等，受邀10余次于国际大会发言。', '主持包括国家自然科学基金、省自然科学基金、留学回国人员启动基金、博士后一等/特别资助基金、教育厅、卫生厅等在内的课题10余项。曾获WHS青年科学家奖等。', '国际创面愈合研究协会(WHS) 会员<br>国际烧伤学会会员(ISBI) 会员<br>中国整形协会瘢痕医学会青年委员<br>国际皮肤研究协会（SID）会员', 35.00);
INSERT INTO `ddys_doctor` VALUES (100, '张艺龄', '../assets/dtavatar/100.jpg', 25, '主治医师', 1, '皮肤美容从业7年。擅长痤疮，瘢痕，敏感肌，化妆品皮炎，胎记，色素痣，黄褐斑等损容性皮病。擅长水光针，肉毒素微整等。', '痤疮，敏感肌，瘢痕，黄褐斑，胎记，色素痣', '毕业于上海交大医学院，第九人民医院研修。主攻激光美容，皮肤外科及注射微整。', '发表核心期刊论文数篇，发表sci论文两篇。', NULL, 19.00);

-- ----------------------------
-- Table structure for ddys_hospital
-- ----------------------------
DROP TABLE IF EXISTS `ddys_hospital`;
CREATE TABLE `ddys_hospital`  (
  `hospital_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医院id',
  `hospitalname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医院名称',
  `hospitallevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医院等级(1-3)',
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纬度',
  `descrition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '介绍',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `city_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属市id',
  PRIMARY KEY (`hospital_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_hospital
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_office
-- ----------------------------
DROP TABLE IF EXISTS `ddys_office`;
CREATE TABLE `ddys_office`  (
  `office_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科室id',
  `office_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室名称',
  PRIMARY KEY (`office_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_office
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_patient
-- ----------------------------
DROP TABLE IF EXISTS `ddys_patient`;
CREATE TABLE `ddys_patient`  (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '患者id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `sex` int(10) NOT NULL COMMENT '性别',
  `brithday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生日',
  `weight` int(255) NOT NULL COMMENT '体重',
  `allergy` int(10) NOT NULL COMMENT '有无过敏史',
  `allergy_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过敏史描述',
  `history` int(10) NOT NULL COMMENT '有无过往病史',
  `history_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过往病史描述',
  `liver` int(255) NOT NULL COMMENT '肝功能',
  `kidney` int(255) NOT NULL COMMENT '肾功能',
  `inoculation` int(255) NULL DEFAULT NULL COMMENT '孕育情况',
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_patient
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_province
-- ----------------------------
DROP TABLE IF EXISTS `ddys_province`;
CREATE TABLE `ddys_province`  (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`province_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_province
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_question
-- ----------------------------
DROP TABLE IF EXISTS `ddys_question`;
CREATE TABLE `ddys_question`  (
  `question_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `create_at` int(255) NOT NULL COMMENT '创建时间',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `watched` int(255) NOT NULL COMMENT '几人看过',
  `user_id` int(255) NOT NULL COMMENT '提问用户',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_question
-- ----------------------------
INSERT INTO `ddys_question` VALUES (1, 1516165, '轻微的群多', 4, 5);

-- ----------------------------
-- Table structure for ddys_symptom
-- ----------------------------
DROP TABLE IF EXISTS `ddys_symptom`;
CREATE TABLE `ddys_symptom`  (
  `symptom_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '症状id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '症状描述',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '症状图片',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属患者id',
  `create_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`symptom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_symptom
-- ----------------------------
INSERT INTO `ddys_symptom` VALUES (1, '驱蚊器翁无群企鹅全文群', 'f065a7a0-5731-11eb-96cf-b5f31ab8aaf9.jpg', 2, '1610715756000');

-- ----------------------------
-- Table structure for ddys_user
-- ----------------------------
DROP TABLE IF EXISTS `ddys_user`;
CREATE TABLE `ddys_user`  (
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ddys_user
-- ----------------------------
INSERT INTO `ddys_user` VALUES ('用户18758230264', 2, '18758230264', '90a1693fbc726cd84731a03267f60665', 'default-avatar.png');

SET FOREIGN_KEY_CHECKS = 1;
