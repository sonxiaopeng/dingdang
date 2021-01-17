/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : ddys

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 17/01/2021 21:10:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ddys_answer
-- ----------------------------
DROP TABLE IF EXISTS `ddys_answer`;
CREATE TABLE `ddys_answer`  (
  `answer_id` int NOT NULL COMMENT '回答id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回答内容',
  `create_at` int NOT NULL COMMENT '回答时间',
  `user_id` int NOT NULL COMMENT '回答的用户的id',
  `doctor_id` int NOT NULL COMMENT '回答的医生id',
  PRIMARY KEY (`answer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_answer
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_article
-- ----------------------------
DROP TABLE IF EXISTS `ddys_article`;
CREATE TABLE `ddys_article`  (
  `article_id` int NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `category_id` int NOT NULL COMMENT '所属类别',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章头图',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_article
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_category
-- ----------------------------
DROP TABLE IF EXISTS `ddys_category`;
CREATE TABLE `ddys_category`  (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_category
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_city
-- ----------------------------
DROP TABLE IF EXISTS `ddys_city`;
CREATE TABLE `ddys_city`  (
  `city_id` int NOT NULL AUTO_INCREMENT COMMENT '城市id',
  `province_id` int NOT NULL COMMENT '所属省份id',
  `cityname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市名称',
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_city
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_comment
-- ----------------------------
DROP TABLE IF EXISTS `ddys_comment`;
CREATE TABLE `ddys_comment`  (
  `comment_id` int NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价内容',
  `user_id` int NOT NULL COMMENT '用户id',
  `doctor_id` int NOT NULL COMMENT '医生id',
  `create_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价时间',
  `level` int NOT NULL COMMENT '评价星级（1-5星）',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1373 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_comment
-- ----------------------------
INSERT INTO `ddys_comment` VALUES (1, '谢谢医生', 40, 75, '1501921523808', 5);
INSERT INTO `ddys_comment` VALUES (2, '很好，很满意', 96, 88, '1442234497254', 5);
INSERT INTO `ddys_comment` VALUES (3, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 11, 60, '1422741661936', 5);
INSERT INTO `ddys_comment` VALUES (4, '非常详细的解答，谢谢您', 92, 68, '1599126513896', 5);
INSERT INTO `ddys_comment` VALUES (5, '医生讲解的非常好 太细心了', 45, 67, '1515149334745', 5);
INSERT INTO `ddys_comment` VALUES (6, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 48, 92, '1553610027390', 5);
INSERT INTO `ddys_comment` VALUES (7, '我这种情况会不会是痛风？因为我尿酸也很好', 40, 72, '1588435601995', 5);
INSERT INTO `ddys_comment` VALUES (8, '感谢卢医生的耐心仔细的回答', 21, 19, '1439249774353', 5);
INSERT INTO `ddys_comment` VALUES (9, '回答非常细致，通俗易懂，给人信心很重要！', 33, 11, '1451944358865', 5);
INSERT INTO `ddys_comment` VALUES (10, '非常感谢您', 98, 90, '1431122186957', 5);
INSERT INTO `ddys_comment` VALUES (11, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 92, 12, '1565235550396', 5);
INSERT INTO `ddys_comment` VALUES (12, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 8, 38, '1485681222207', 5);
INSERT INTO `ddys_comment` VALUES (13, '感谢医生！', 30, 92, '1453518762141', 5);
INSERT INTO `ddys_comment` VALUES (14, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 13, 70, '1434647666333', 5);
INSERT INTO `ddys_comment` VALUES (15, '韦主任很专业，认真负责，回复很详细，非常感谢！', 2, 40, '1447412072220', 5);
INSERT INTO `ddys_comment` VALUES (16, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 79, 4, '1430551711166', 5);
INSERT INTO `ddys_comment` VALUES (17, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 81, 23, '1575267511996', 5);
INSERT INTO `ddys_comment` VALUES (18, '谢谢医生耐心详细地回答，非常有帮助', 87, 51, '1535914332857', 5);
INSERT INTO `ddys_comment` VALUES (19, '感谢卢医生的耐心仔细的回答', 77, 58, '1535360534179', 5);
INSERT INTO `ddys_comment` VALUES (20, '专业 细心 和蔼可亲。简直“完美”', 27, 93, '1520535097634', 5);
INSERT INTO `ddys_comment` VALUES (21, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 9, 39, '1523592756741', 5);
INSERT INTO `ddys_comment` VALUES (22, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 70, 87, '1494648046688', 5);
INSERT INTO `ddys_comment` VALUES (23, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 46, 71, '1551691834408', 5);
INSERT INTO `ddys_comment` VALUES (24, '服务热情，观察图片和回答都认真详细。谢谢！', 52, 18, '1556588879573', 5);
INSERT INTO `ddys_comment` VALUES (25, '感谢医生，回复的很详细很专业', 60, 50, '1457531925683', 5);
INSERT INTO `ddys_comment` VALUES (26, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 16, 89, '1607110840611', 5);
INSERT INTO `ddys_comment` VALUES (27, '谢谢医生', 60, 35, '1447591647497', 5);
INSERT INTO `ddys_comment` VALUES (28, '很好，很满意', 72, 98, '1582148092428', 5);
INSERT INTO `ddys_comment` VALUES (29, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 94, 10, '1577356584592', 5);
INSERT INTO `ddys_comment` VALUES (30, '非常详细的解答，谢谢您', 19, 5, '1587388333740', 5);
INSERT INTO `ddys_comment` VALUES (31, '医生讲解的非常好 太细心了', 11, 85, '1421915236328', 5);
INSERT INTO `ddys_comment` VALUES (32, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 75, 60, '1505950274485', 5);
INSERT INTO `ddys_comment` VALUES (33, '我这种情况会不会是痛风？因为我尿酸也很好', 7, 32, '1484283294308', 5);
INSERT INTO `ddys_comment` VALUES (34, '感谢卢医生的耐心仔细的回答', 50, 62, '1458483745910', 5);
INSERT INTO `ddys_comment` VALUES (35, '回答非常细致，通俗易懂，给人信心很重要！', 24, 9, '1427173604690', 5);
INSERT INTO `ddys_comment` VALUES (36, '非常感谢您', 94, 47, '1462734994225', 5);
INSERT INTO `ddys_comment` VALUES (37, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 55, 30, '1451582842226', 5);
INSERT INTO `ddys_comment` VALUES (38, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 53, 35, '1431103746494', 5);
INSERT INTO `ddys_comment` VALUES (39, '感谢医生！', 38, 41, '1481869994684', 5);
INSERT INTO `ddys_comment` VALUES (40, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 14, 21, '1587784568358', 5);
INSERT INTO `ddys_comment` VALUES (41, '韦主任很专业，认真负责，回复很详细，非常感谢！', 50, 82, '1495956355477', 5);
INSERT INTO `ddys_comment` VALUES (42, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 36, 81, '1574346342258', 5);
INSERT INTO `ddys_comment` VALUES (43, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 36, 59, '1578269675189', 5);
INSERT INTO `ddys_comment` VALUES (44, '谢谢医生耐心详细地回答，非常有帮助', 94, 75, '1426214703441', 5);
INSERT INTO `ddys_comment` VALUES (45, '感谢卢医生的耐心仔细的回答', 17, 32, '1510546703321', 5);
INSERT INTO `ddys_comment` VALUES (46, '专业 细心 和蔼可亲。简直“完美”', 17, 75, '1515788818127', 5);
INSERT INTO `ddys_comment` VALUES (47, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 26, 42, '1608686986042', 5);
INSERT INTO `ddys_comment` VALUES (48, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 2, 17, '1551425532978', 5);
INSERT INTO `ddys_comment` VALUES (49, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 91, 67, '1436397535151', 5);
INSERT INTO `ddys_comment` VALUES (50, '服务热情，观察图片和回答都认真详细。谢谢！', 58, 19, '1473919088270', 5);
INSERT INTO `ddys_comment` VALUES (51, '感谢医生，回复的很详细很专业', 21, 94, '1444655006621', 5);
INSERT INTO `ddys_comment` VALUES (52, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 70, 49, '1500576726158', 5);
INSERT INTO `ddys_comment` VALUES (53, '谢谢医生', 97, 21, '1463555877083', 5);
INSERT INTO `ddys_comment` VALUES (54, '很好，很满意', 25, 36, '1453720479642', 5);
INSERT INTO `ddys_comment` VALUES (55, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 31, 8, '1463919121486', 5);
INSERT INTO `ddys_comment` VALUES (56, '非常详细的解答，谢谢您', 14, 36, '1447998395547', 5);
INSERT INTO `ddys_comment` VALUES (57, '医生讲解的非常好 太细心了', 10, 23, '1609441470949', 5);
INSERT INTO `ddys_comment` VALUES (58, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 2, 60, '1570666881008', 5);
INSERT INTO `ddys_comment` VALUES (59, '我这种情况会不会是痛风？因为我尿酸也很好', 91, 14, '1521048653571', 5);
INSERT INTO `ddys_comment` VALUES (60, '感谢卢医生的耐心仔细的回答', 97, 75, '1567644142957', 5);
INSERT INTO `ddys_comment` VALUES (61, '回答非常细致，通俗易懂，给人信心很重要！', 66, 96, '1589913510241', 5);
INSERT INTO `ddys_comment` VALUES (62, '非常感谢您', 76, 55, '1530405854942', 5);
INSERT INTO `ddys_comment` VALUES (63, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 47, 69, '1451802531106', 5);
INSERT INTO `ddys_comment` VALUES (64, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 89, 47, '1479537860882', 5);
INSERT INTO `ddys_comment` VALUES (65, '感谢医生！', 31, 18, '1532993654236', 5);
INSERT INTO `ddys_comment` VALUES (66, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 64, 5, '1542790643097', 5);
INSERT INTO `ddys_comment` VALUES (67, '韦主任很专业，认真负责，回复很详细，非常感谢！', 20, 92, '1459821689200', 5);
INSERT INTO `ddys_comment` VALUES (68, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 53, 70, '1596980781549', 5);
INSERT INTO `ddys_comment` VALUES (69, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 3, 28, '1466681827527', 5);
INSERT INTO `ddys_comment` VALUES (70, '谢谢医生耐心详细地回答，非常有帮助', 71, 49, '1470965830897', 5);
INSERT INTO `ddys_comment` VALUES (71, '感谢卢医生的耐心仔细的回答', 73, 77, '1466440032357', 5);
INSERT INTO `ddys_comment` VALUES (72, '专业 细心 和蔼可亲。简直“完美”', 85, 59, '1437559789945', 5);
INSERT INTO `ddys_comment` VALUES (73, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 98, 26, '1462034865511', 5);
INSERT INTO `ddys_comment` VALUES (74, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 98, 37, '1465385559032', 5);
INSERT INTO `ddys_comment` VALUES (75, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 9, 23, '1514619893418', 5);
INSERT INTO `ddys_comment` VALUES (76, '服务热情，观察图片和回答都认真详细。谢谢！', 58, 52, '1439057078830', 5);
INSERT INTO `ddys_comment` VALUES (77, '感谢医生，回复的很详细很专业', 20, 6, '1515323697614', 5);
INSERT INTO `ddys_comment` VALUES (78, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 23, 57, '1460248853490', 5);
INSERT INTO `ddys_comment` VALUES (79, '谢谢医生', 56, 29, '1495370587713', 5);
INSERT INTO `ddys_comment` VALUES (80, '很好，很满意', 70, 44, '1558233091881', 5);
INSERT INTO `ddys_comment` VALUES (81, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 63, 61, '1423976924247', 5);
INSERT INTO `ddys_comment` VALUES (82, '非常详细的解答，谢谢您', 21, 94, '1547116407574', 5);
INSERT INTO `ddys_comment` VALUES (83, '医生讲解的非常好 太细心了', 40, 46, '1595367176726', 5);
INSERT INTO `ddys_comment` VALUES (84, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 72, 58, '1579606840634', 5);
INSERT INTO `ddys_comment` VALUES (85, '我这种情况会不会是痛风？因为我尿酸也很好', 91, 80, '1541155284758', 5);
INSERT INTO `ddys_comment` VALUES (86, '感谢卢医生的耐心仔细的回答', 40, 96, '1606022885144', 5);
INSERT INTO `ddys_comment` VALUES (87, '回答非常细致，通俗易懂，给人信心很重要！', 87, 5, '1507353390059', 5);
INSERT INTO `ddys_comment` VALUES (88, '非常感谢您', 73, 72, '1594791793642', 5);
INSERT INTO `ddys_comment` VALUES (89, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 42, 13, '1458618096990', 5);
INSERT INTO `ddys_comment` VALUES (90, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 69, 97, '1557812015194', 5);
INSERT INTO `ddys_comment` VALUES (91, '感谢医生！', 90, 7, '1533694059911', 5);
INSERT INTO `ddys_comment` VALUES (92, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 6, 12, '1590136515398', 5);
INSERT INTO `ddys_comment` VALUES (93, '韦主任很专业，认真负责，回复很详细，非常感谢！', 7, 75, '1541642312398', 5);
INSERT INTO `ddys_comment` VALUES (94, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 50, 77, '1604239666690', 5);
INSERT INTO `ddys_comment` VALUES (95, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 41, 20, '1577024464952', 5);
INSERT INTO `ddys_comment` VALUES (96, '谢谢医生耐心详细地回答，非常有帮助', 58, 69, '1558484232426', 5);
INSERT INTO `ddys_comment` VALUES (97, '感谢卢医生的耐心仔细的回答', 15, 79, '1452786634402', 5);
INSERT INTO `ddys_comment` VALUES (98, '专业 细心 和蔼可亲。简直“完美”', 39, 0, '1423471781722', 5);
INSERT INTO `ddys_comment` VALUES (99, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 53, 96, '1571738396862', 5);
INSERT INTO `ddys_comment` VALUES (100, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 76, 3, '1447162284586', 5);
INSERT INTO `ddys_comment` VALUES (101, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 9, 94, '1520371888060', 5);
INSERT INTO `ddys_comment` VALUES (102, '服务热情，观察图片和回答都认真详细。谢谢！', 90, 85, '1453957647146', 5);
INSERT INTO `ddys_comment` VALUES (103, '感谢医生，回复的很详细很专业', 70, 26, '1543565218483', 5);
INSERT INTO `ddys_comment` VALUES (104, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 90, 63, '1426239880194', 5);
INSERT INTO `ddys_comment` VALUES (105, '谢谢医生', 35, 46, '1458783034169', 5);
INSERT INTO `ddys_comment` VALUES (106, '很好，很满意', 51, 64, '1443580659891', 5);
INSERT INTO `ddys_comment` VALUES (107, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 80, 80, '1495266079729', 5);
INSERT INTO `ddys_comment` VALUES (108, '非常详细的解答，谢谢您', 28, 71, '1574667339200', 5);
INSERT INTO `ddys_comment` VALUES (109, '医生讲解的非常好 太细心了', 60, 78, '1562992642455', 5);
INSERT INTO `ddys_comment` VALUES (110, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 82, 83, '1517937518773', 5);
INSERT INTO `ddys_comment` VALUES (111, '我这种情况会不会是痛风？因为我尿酸也很好', 43, 18, '1497936832266', 5);
INSERT INTO `ddys_comment` VALUES (112, '感谢卢医生的耐心仔细的回答', 88, 20, '1466458528303', 5);
INSERT INTO `ddys_comment` VALUES (113, '回答非常细致，通俗易懂，给人信心很重要！', 25, 52, '1594779024525', 5);
INSERT INTO `ddys_comment` VALUES (114, '非常感谢您', 55, 6, '1608289454769', 5);
INSERT INTO `ddys_comment` VALUES (115, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 24, 5, '1509453397948', 5);
INSERT INTO `ddys_comment` VALUES (116, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 98, 89, '1497619563091', 5);
INSERT INTO `ddys_comment` VALUES (117, '感谢医生！', 19, 37, '1498273373354', 5);
INSERT INTO `ddys_comment` VALUES (118, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 65, 26, '1445008746482', 5);
INSERT INTO `ddys_comment` VALUES (119, '韦主任很专业，认真负责，回复很详细，非常感谢！', 9, 18, '1604645591428', 5);
INSERT INTO `ddys_comment` VALUES (120, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 27, 7, '1475304290708', 5);
INSERT INTO `ddys_comment` VALUES (121, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 20, 68, '1576253696760', 5);
INSERT INTO `ddys_comment` VALUES (122, '谢谢医生耐心详细地回答，非常有帮助', 76, 91, '1554765754381', 5);
INSERT INTO `ddys_comment` VALUES (123, '感谢卢医生的耐心仔细的回答', 36, 87, '1478038097281', 5);
INSERT INTO `ddys_comment` VALUES (124, '专业 细心 和蔼可亲。简直“完美”', 20, 73, '1429463566473', 5);
INSERT INTO `ddys_comment` VALUES (125, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 9, 42, '1584487662027', 5);
INSERT INTO `ddys_comment` VALUES (126, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 85, 72, '1561958324164', 5);
INSERT INTO `ddys_comment` VALUES (127, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 19, 3, '1497519625490', 5);
INSERT INTO `ddys_comment` VALUES (128, '服务热情，观察图片和回答都认真详细。谢谢！', 21, 43, '1442562148595', 5);
INSERT INTO `ddys_comment` VALUES (129, '感谢医生，回复的很详细很专业', 6, 61, '1597922944753', 5);
INSERT INTO `ddys_comment` VALUES (130, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 94, 33, '1517647734138', 5);
INSERT INTO `ddys_comment` VALUES (131, '谢谢医生', 93, 9, '1521957694650', 5);
INSERT INTO `ddys_comment` VALUES (132, '很好，很满意', 25, 84, '1474349708913', 5);
INSERT INTO `ddys_comment` VALUES (133, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 83, 82, '1505207452170', 5);
INSERT INTO `ddys_comment` VALUES (134, '非常详细的解答，谢谢您', 27, 29, '1582128082979', 5);
INSERT INTO `ddys_comment` VALUES (135, '医生讲解的非常好 太细心了', 36, 83, '1445490339464', 5);
INSERT INTO `ddys_comment` VALUES (136, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 20, 85, '1542885806841', 5);
INSERT INTO `ddys_comment` VALUES (137, '我这种情况会不会是痛风？因为我尿酸也很好', 60, 84, '1430268947458', 5);
INSERT INTO `ddys_comment` VALUES (138, '感谢卢医生的耐心仔细的回答', 22, 94, '1598937031845', 5);
INSERT INTO `ddys_comment` VALUES (139, '回答非常细致，通俗易懂，给人信心很重要！', 12, 73, '1600619055876', 5);
INSERT INTO `ddys_comment` VALUES (140, '非常感谢您', 60, 64, '1532377815245', 5);
INSERT INTO `ddys_comment` VALUES (141, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 7, 4, '1493573835517', 5);
INSERT INTO `ddys_comment` VALUES (142, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 75, 28, '1600265920835', 5);
INSERT INTO `ddys_comment` VALUES (143, '感谢医生！', 9, 35, '1484671544520', 5);
INSERT INTO `ddys_comment` VALUES (144, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 33, 81, '1603474530560', 5);
INSERT INTO `ddys_comment` VALUES (145, '韦主任很专业，认真负责，回复很详细，非常感谢！', 66, 24, '1462828650766', 5);
INSERT INTO `ddys_comment` VALUES (146, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 90, 78, '1463509532724', 5);
INSERT INTO `ddys_comment` VALUES (147, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 16, 21, '1588972878239', 5);
INSERT INTO `ddys_comment` VALUES (148, '谢谢医生耐心详细地回答，非常有帮助', 68, 56, '1549824538974', 5);
INSERT INTO `ddys_comment` VALUES (149, '感谢卢医生的耐心仔细的回答', 87, 45, '1463889599581', 5);
INSERT INTO `ddys_comment` VALUES (150, '专业 细心 和蔼可亲。简直“完美”', 86, 30, '1606012788227', 5);
INSERT INTO `ddys_comment` VALUES (151, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 65, 78, '1431448211529', 5);
INSERT INTO `ddys_comment` VALUES (152, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 84, 95, '1474060583248', 5);
INSERT INTO `ddys_comment` VALUES (153, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 93, 50, '1586542377815', 5);
INSERT INTO `ddys_comment` VALUES (154, '服务热情，观察图片和回答都认真详细。谢谢！', 0, 48, '1471162784701', 5);
INSERT INTO `ddys_comment` VALUES (155, '感谢医生，回复的很详细很专业', 95, 18, '1553907573975', 5);
INSERT INTO `ddys_comment` VALUES (156, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 92, 90, '1533188611863', 5);
INSERT INTO `ddys_comment` VALUES (157, '谢谢医生', 45, 36, '1570730852615', 5);
INSERT INTO `ddys_comment` VALUES (158, '很好，很满意', 49, 90, '1598411010192', 5);
INSERT INTO `ddys_comment` VALUES (159, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 77, 85, '1606081706229', 5);
INSERT INTO `ddys_comment` VALUES (160, '非常详细的解答，谢谢您', 82, 52, '1450622065213', 5);
INSERT INTO `ddys_comment` VALUES (161, '医生讲解的非常好 太细心了', 32, 11, '1553239050085', 5);
INSERT INTO `ddys_comment` VALUES (162, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 6, 92, '1430407742186', 5);
INSERT INTO `ddys_comment` VALUES (163, '我这种情况会不会是痛风？因为我尿酸也很好', 76, 51, '1451848618800', 5);
INSERT INTO `ddys_comment` VALUES (164, '感谢卢医生的耐心仔细的回答', 66, 48, '1487590299684', 5);
INSERT INTO `ddys_comment` VALUES (165, '回答非常细致，通俗易懂，给人信心很重要！', 88, 16, '1561770477970', 5);
INSERT INTO `ddys_comment` VALUES (166, '非常感谢您', 48, 98, '1458069791535', 5);
INSERT INTO `ddys_comment` VALUES (167, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 1, 86, '1545806700354', 5);
INSERT INTO `ddys_comment` VALUES (168, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 13, 43, '1481175442093', 5);
INSERT INTO `ddys_comment` VALUES (169, '感谢医生！', 37, 3, '1568163413311', 5);
INSERT INTO `ddys_comment` VALUES (170, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 63, 75, '1579050279640', 5);
INSERT INTO `ddys_comment` VALUES (171, '韦主任很专业，认真负责，回复很详细，非常感谢！', 13, 33, '1430992847813', 5);
INSERT INTO `ddys_comment` VALUES (172, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 77, 75, '1556527883857', 5);
INSERT INTO `ddys_comment` VALUES (173, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 49, 38, '1436361258423', 5);
INSERT INTO `ddys_comment` VALUES (174, '谢谢医生耐心详细地回答，非常有帮助', 12, 55, '1491825300710', 5);
INSERT INTO `ddys_comment` VALUES (175, '感谢卢医生的耐心仔细的回答', 79, 3, '1487111436859', 5);
INSERT INTO `ddys_comment` VALUES (176, '专业 细心 和蔼可亲。简直“完美”', 51, 57, '1568897571233', 5);
INSERT INTO `ddys_comment` VALUES (177, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 79, 11, '1532236826538', 5);
INSERT INTO `ddys_comment` VALUES (178, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 72, 93, '1509772220761', 5);
INSERT INTO `ddys_comment` VALUES (179, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 43, 77, '1594870014170', 5);
INSERT INTO `ddys_comment` VALUES (180, '服务热情，观察图片和回答都认真详细。谢谢！', 40, 7, '1496788961692', 5);
INSERT INTO `ddys_comment` VALUES (181, '感谢医生，回复的很详细很专业', 66, 81, '1550701039352', 5);
INSERT INTO `ddys_comment` VALUES (182, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 68, 64, '1529733589677', 5);
INSERT INTO `ddys_comment` VALUES (183, '谢谢医生', 78, 42, '1455712667009', 5);
INSERT INTO `ddys_comment` VALUES (184, '很好，很满意', 50, 58, '1424980692667', 5);
INSERT INTO `ddys_comment` VALUES (185, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 83, 52, '1581533533122', 5);
INSERT INTO `ddys_comment` VALUES (186, '非常详细的解答，谢谢您', 89, 37, '1489210970420', 5);
INSERT INTO `ddys_comment` VALUES (187, '医生讲解的非常好 太细心了', 36, 14, '1523128022044', 5);
INSERT INTO `ddys_comment` VALUES (188, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 63, 15, '1429794805015', 5);
INSERT INTO `ddys_comment` VALUES (189, '我这种情况会不会是痛风？因为我尿酸也很好', 45, 20, '1588199964461', 5);
INSERT INTO `ddys_comment` VALUES (190, '感谢卢医生的耐心仔细的回答', 45, 27, '1515806675594', 5);
INSERT INTO `ddys_comment` VALUES (191, '回答非常细致，通俗易懂，给人信心很重要！', 74, 83, '1471789580488', 5);
INSERT INTO `ddys_comment` VALUES (192, '非常感谢您', 90, 47, '1513739598518', 5);
INSERT INTO `ddys_comment` VALUES (193, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 85, 62, '1528519463694', 5);
INSERT INTO `ddys_comment` VALUES (194, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 69, 16, '1586949675667', 5);
INSERT INTO `ddys_comment` VALUES (195, '感谢医生！', 67, 96, '1500655616844', 5);
INSERT INTO `ddys_comment` VALUES (196, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 89, 81, '1480509915696', 5);
INSERT INTO `ddys_comment` VALUES (197, '韦主任很专业，认真负责，回复很详细，非常感谢！', 76, 21, '1562759419550', 5);
INSERT INTO `ddys_comment` VALUES (198, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 17, 94, '1469809149704', 5);
INSERT INTO `ddys_comment` VALUES (199, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 38, 43, '1498593840654', 5);
INSERT INTO `ddys_comment` VALUES (200, '谢谢医生耐心详细地回答，非常有帮助', 16, 30, '1523437610041', 5);
INSERT INTO `ddys_comment` VALUES (201, '感谢卢医生的耐心仔细的回答', 78, 56, '1526527602807', 5);
INSERT INTO `ddys_comment` VALUES (202, '专业 细心 和蔼可亲。简直“完美”', 81, 62, '1607457961605', 5);
INSERT INTO `ddys_comment` VALUES (203, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 62, 96, '1587231708598', 5);
INSERT INTO `ddys_comment` VALUES (204, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 68, 15, '1609038776161', 5);
INSERT INTO `ddys_comment` VALUES (205, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 97, 49, '1520776611023', 5);
INSERT INTO `ddys_comment` VALUES (206, '服务热情，观察图片和回答都认真详细。谢谢！', 94, 58, '1469643200664', 5);
INSERT INTO `ddys_comment` VALUES (207, '感谢医生，回复的很详细很专业', 65, 79, '1587842914129', 5);
INSERT INTO `ddys_comment` VALUES (208, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 83, 13, '1489328427603', 5);
INSERT INTO `ddys_comment` VALUES (209, '谢谢医生', 74, 91, '1448968369871', 5);
INSERT INTO `ddys_comment` VALUES (210, '很好，很满意', 22, 92, '1609844407966', 5);
INSERT INTO `ddys_comment` VALUES (211, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 73, 57, '1443645308446', 5);
INSERT INTO `ddys_comment` VALUES (212, '非常详细的解答，谢谢您', 65, 33, '1427866006726', 5);
INSERT INTO `ddys_comment` VALUES (213, '医生讲解的非常好 太细心了', 69, 72, '1448234993201', 5);
INSERT INTO `ddys_comment` VALUES (214, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 15, 57, '1555626967349', 5);
INSERT INTO `ddys_comment` VALUES (215, '我这种情况会不会是痛风？因为我尿酸也很好', 50, 25, '1578617984483', 5);
INSERT INTO `ddys_comment` VALUES (216, '感谢卢医生的耐心仔细的回答', 55, 64, '1452256945443', 5);
INSERT INTO `ddys_comment` VALUES (217, '回答非常细致，通俗易懂，给人信心很重要！', 68, 49, '1517044704023', 5);
INSERT INTO `ddys_comment` VALUES (218, '非常感谢您', 68, 81, '1516350522910', 5);
INSERT INTO `ddys_comment` VALUES (219, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 67, 37, '1521431066055', 5);
INSERT INTO `ddys_comment` VALUES (220, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 18, 85, '1572991016363', 5);
INSERT INTO `ddys_comment` VALUES (221, '感谢医生！', 32, 68, '1514192480249', 5);
INSERT INTO `ddys_comment` VALUES (222, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 25, 46, '1481336540433', 5);
INSERT INTO `ddys_comment` VALUES (223, '韦主任很专业，认真负责，回复很详细，非常感谢！', 32, 40, '1457114132697', 5);
INSERT INTO `ddys_comment` VALUES (224, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 16, 21, '1572935315044', 5);
INSERT INTO `ddys_comment` VALUES (225, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 7, 54, '1565891810706', 5);
INSERT INTO `ddys_comment` VALUES (226, '谢谢医生耐心详细地回答，非常有帮助', 79, 46, '1482311836338', 5);
INSERT INTO `ddys_comment` VALUES (227, '感谢卢医生的耐心仔细的回答', 23, 14, '1590668539838', 5);
INSERT INTO `ddys_comment` VALUES (228, '专业 细心 和蔼可亲。简直“完美”', 2, 67, '1499577839249', 5);
INSERT INTO `ddys_comment` VALUES (229, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 21, 44, '1584862387165', 5);
INSERT INTO `ddys_comment` VALUES (230, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 98, 17, '1453064457407', 5);
INSERT INTO `ddys_comment` VALUES (231, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 55, 22, '1473055356347', 5);
INSERT INTO `ddys_comment` VALUES (232, '服务热情，观察图片和回答都认真详细。谢谢！', 78, 70, '1426249744295', 5);
INSERT INTO `ddys_comment` VALUES (233, '感谢医生，回复的很详细很专业', 57, 6, '1421123648259', 5);
INSERT INTO `ddys_comment` VALUES (234, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 2, 90, '1576777303612', 5);
INSERT INTO `ddys_comment` VALUES (235, '谢谢医生', 95, 59, '1527453163738', 5);
INSERT INTO `ddys_comment` VALUES (236, '很好，很满意', 63, 72, '1512336872086', 5);
INSERT INTO `ddys_comment` VALUES (237, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 86, 81, '1470861572878', 5);
INSERT INTO `ddys_comment` VALUES (238, '非常详细的解答，谢谢您', 81, 47, '1571618906017', 5);
INSERT INTO `ddys_comment` VALUES (239, '医生讲解的非常好 太细心了', 78, 33, '1567640454083', 5);
INSERT INTO `ddys_comment` VALUES (240, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 22, 58, '1448389154540', 5);
INSERT INTO `ddys_comment` VALUES (241, '我这种情况会不会是痛风？因为我尿酸也很好', 96, 78, '1511603103806', 5);
INSERT INTO `ddys_comment` VALUES (242, '感谢卢医生的耐心仔细的回答', 42, 4, '1521545495065', 5);
INSERT INTO `ddys_comment` VALUES (243, '回答非常细致，通俗易懂，给人信心很重要！', 20, 35, '1432495975813', 5);
INSERT INTO `ddys_comment` VALUES (244, '非常感谢您', 44, 35, '1474698217894', 5);
INSERT INTO `ddys_comment` VALUES (245, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 56, 50, '1575183952867', 5);
INSERT INTO `ddys_comment` VALUES (246, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 18, 88, '1474023823288', 5);
INSERT INTO `ddys_comment` VALUES (247, '感谢医生！', 76, 95, '1450751684367', 5);
INSERT INTO `ddys_comment` VALUES (248, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 39, 81, '1578056249093', 5);
INSERT INTO `ddys_comment` VALUES (249, '韦主任很专业，认真负责，回复很详细，非常感谢！', 62, 44, '1562468958577', 5);
INSERT INTO `ddys_comment` VALUES (250, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 63, 45, '1560176566908', 5);
INSERT INTO `ddys_comment` VALUES (251, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 73, 78, '1531072426366', 5);
INSERT INTO `ddys_comment` VALUES (252, '谢谢医生耐心详细地回答，非常有帮助', 66, 29, '1474003716129', 5);
INSERT INTO `ddys_comment` VALUES (253, '感谢卢医生的耐心仔细的回答', 81, 9, '1558379194362', 5);
INSERT INTO `ddys_comment` VALUES (254, '专业 细心 和蔼可亲。简直“完美”', 15, 56, '1465174281568', 5);
INSERT INTO `ddys_comment` VALUES (255, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 96, 8, '1542833784983', 5);
INSERT INTO `ddys_comment` VALUES (256, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 67, 84, '1543950867110', 5);
INSERT INTO `ddys_comment` VALUES (257, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 46, 24, '1583875997091', 5);
INSERT INTO `ddys_comment` VALUES (258, '服务热情，观察图片和回答都认真详细。谢谢！', 73, 93, '1482029925106', 5);
INSERT INTO `ddys_comment` VALUES (259, '感谢医生，回复的很详细很专业', 28, 33, '1531967743644', 5);
INSERT INTO `ddys_comment` VALUES (260, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 58, 71, '1579979341341', 5);
INSERT INTO `ddys_comment` VALUES (261, '谢谢医生', 8, 94, '1572579699806', 5);
INSERT INTO `ddys_comment` VALUES (262, '很好，很满意', 94, 70, '1467292161981', 5);
INSERT INTO `ddys_comment` VALUES (263, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 92, 27, '1587506647420', 5);
INSERT INTO `ddys_comment` VALUES (264, '非常详细的解答，谢谢您', 38, 22, '1441459641335', 5);
INSERT INTO `ddys_comment` VALUES (265, '医生讲解的非常好 太细心了', 78, 92, '1493312584781', 5);
INSERT INTO `ddys_comment` VALUES (266, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 96, 67, '1439969367394', 5);
INSERT INTO `ddys_comment` VALUES (267, '我这种情况会不会是痛风？因为我尿酸也很好', 27, 29, '1529289212283', 5);
INSERT INTO `ddys_comment` VALUES (268, '感谢卢医生的耐心仔细的回答', 61, 74, '1610732459677', 5);
INSERT INTO `ddys_comment` VALUES (269, '回答非常细致，通俗易懂，给人信心很重要！', 42, 73, '1481343869278', 5);
INSERT INTO `ddys_comment` VALUES (270, '非常感谢您', 84, 81, '1442452089372', 5);
INSERT INTO `ddys_comment` VALUES (271, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 41, 0, '1561994847441', 5);
INSERT INTO `ddys_comment` VALUES (272, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 36, 73, '1458560553894', 5);
INSERT INTO `ddys_comment` VALUES (273, '感谢医生！', 6, 37, '1472823080453', 5);
INSERT INTO `ddys_comment` VALUES (274, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 60, 59, '1597334281894', 5);
INSERT INTO `ddys_comment` VALUES (275, '韦主任很专业，认真负责，回复很详细，非常感谢！', 71, 40, '1428401542076', 5);
INSERT INTO `ddys_comment` VALUES (276, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 24, 10, '1598754913845', 5);
INSERT INTO `ddys_comment` VALUES (277, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 70, 32, '1462755514401', 5);
INSERT INTO `ddys_comment` VALUES (278, '谢谢医生耐心详细地回答，非常有帮助', 30, 11, '1476356395340', 5);
INSERT INTO `ddys_comment` VALUES (279, '感谢卢医生的耐心仔细的回答', 41, 26, '1507234599172', 5);
INSERT INTO `ddys_comment` VALUES (280, '专业 细心 和蔼可亲。简直“完美”', 3, 36, '1555286608637', 5);
INSERT INTO `ddys_comment` VALUES (281, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 51, 4, '1513623471401', 5);
INSERT INTO `ddys_comment` VALUES (282, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 94, 97, '1588413844692', 5);
INSERT INTO `ddys_comment` VALUES (283, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 23, 15, '1440155247251', 5);
INSERT INTO `ddys_comment` VALUES (284, '服务热情，观察图片和回答都认真详细。谢谢！', 65, 28, '1523396729281', 5);
INSERT INTO `ddys_comment` VALUES (285, '感谢医生，回复的很详细很专业', 5, 71, '1436923386949', 5);
INSERT INTO `ddys_comment` VALUES (286, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 34, 64, '1528674453334', 5);
INSERT INTO `ddys_comment` VALUES (287, '谢谢医生', 74, 44, '1532307690628', 5);
INSERT INTO `ddys_comment` VALUES (288, '很好，很满意', 63, 64, '1555499838503', 5);
INSERT INTO `ddys_comment` VALUES (289, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 53, 43, '1586632119605', 5);
INSERT INTO `ddys_comment` VALUES (290, '非常详细的解答，谢谢您', 57, 87, '1539572180217', 5);
INSERT INTO `ddys_comment` VALUES (291, '医生讲解的非常好 太细心了', 94, 40, '1460529486611', 5);
INSERT INTO `ddys_comment` VALUES (292, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 89, 26, '1600965309003', 5);
INSERT INTO `ddys_comment` VALUES (293, '我这种情况会不会是痛风？因为我尿酸也很好', 51, 38, '1425735727038', 5);
INSERT INTO `ddys_comment` VALUES (294, '感谢卢医生的耐心仔细的回答', 39, 22, '1537581543682', 5);
INSERT INTO `ddys_comment` VALUES (295, '回答非常细致，通俗易懂，给人信心很重要！', 0, 79, '1598611090619', 5);
INSERT INTO `ddys_comment` VALUES (296, '非常感谢您', 63, 10, '1512238291279', 5);
INSERT INTO `ddys_comment` VALUES (297, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 30, 89, '1479948259076', 5);
INSERT INTO `ddys_comment` VALUES (298, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 18, 54, '1428277718999', 5);
INSERT INTO `ddys_comment` VALUES (299, '感谢医生！', 0, 73, '1609443284353', 5);
INSERT INTO `ddys_comment` VALUES (300, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 65, 75, '1499049462623', 5);
INSERT INTO `ddys_comment` VALUES (301, '韦主任很专业，认真负责，回复很详细，非常感谢！', 40, 75, '1501921523808', 5);
INSERT INTO `ddys_comment` VALUES (302, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 96, 88, '1442234497254', 5);
INSERT INTO `ddys_comment` VALUES (303, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 11, 60, '1422741661936', 5);
INSERT INTO `ddys_comment` VALUES (304, '谢谢医生耐心详细地回答，非常有帮助', 92, 68, '1599126513896', 5);
INSERT INTO `ddys_comment` VALUES (305, '感谢卢医生的耐心仔细的回答', 45, 67, '1515149334745', 5);
INSERT INTO `ddys_comment` VALUES (306, '专业 细心 和蔼可亲。简直“完美”', 48, 92, '1553610027390', 5);
INSERT INTO `ddys_comment` VALUES (307, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 40, 72, '1588435601995', 5);
INSERT INTO `ddys_comment` VALUES (308, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 21, 19, '1439249774353', 5);
INSERT INTO `ddys_comment` VALUES (309, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 33, 11, '1451944358865', 5);
INSERT INTO `ddys_comment` VALUES (310, '服务热情，观察图片和回答都认真详细。谢谢！', 98, 90, '1431122186957', 5);
INSERT INTO `ddys_comment` VALUES (311, '感谢医生，回复的很详细很专业', 92, 12, '1565235550396', 5);
INSERT INTO `ddys_comment` VALUES (312, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 8, 38, '1485681222207', 5);
INSERT INTO `ddys_comment` VALUES (313, '谢谢医生', 30, 92, '1453518762141', 5);
INSERT INTO `ddys_comment` VALUES (314, '很好，很满意', 13, 70, '1434647666333', 5);
INSERT INTO `ddys_comment` VALUES (315, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 2, 40, '1447412072220', 5);
INSERT INTO `ddys_comment` VALUES (316, '非常详细的解答，谢谢您', 79, 4, '1430551711166', 5);
INSERT INTO `ddys_comment` VALUES (317, '医生讲解的非常好 太细心了', 81, 23, '1575267511996', 5);
INSERT INTO `ddys_comment` VALUES (318, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 87, 51, '1535914332857', 5);
INSERT INTO `ddys_comment` VALUES (319, '我这种情况会不会是痛风？因为我尿酸也很好', 77, 58, '1535360534179', 5);
INSERT INTO `ddys_comment` VALUES (320, '感谢卢医生的耐心仔细的回答', 27, 93, '1520535097634', 5);
INSERT INTO `ddys_comment` VALUES (321, '回答非常细致，通俗易懂，给人信心很重要！', 9, 39, '1523592756741', 5);
INSERT INTO `ddys_comment` VALUES (322, '非常感谢您', 70, 87, '1494648046688', 5);
INSERT INTO `ddys_comment` VALUES (323, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 46, 71, '1551691834408', 5);
INSERT INTO `ddys_comment` VALUES (324, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 52, 18, '1556588879573', 5);
INSERT INTO `ddys_comment` VALUES (325, '感谢医生！', 60, 50, '1457531925683', 5);
INSERT INTO `ddys_comment` VALUES (326, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 16, 89, '1607110840611', 5);
INSERT INTO `ddys_comment` VALUES (327, '韦主任很专业，认真负责，回复很详细，非常感谢！', 60, 35, '1447591647497', 5);
INSERT INTO `ddys_comment` VALUES (328, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 72, 98, '1582148092428', 5);
INSERT INTO `ddys_comment` VALUES (329, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 94, 10, '1577356584592', 5);
INSERT INTO `ddys_comment` VALUES (330, '谢谢医生耐心详细地回答，非常有帮助', 19, 5, '1587388333740', 5);
INSERT INTO `ddys_comment` VALUES (331, '感谢卢医生的耐心仔细的回答', 11, 85, '1421915236328', 5);
INSERT INTO `ddys_comment` VALUES (332, '专业 细心 和蔼可亲。简直“完美”', 75, 60, '1505950274485', 5);
INSERT INTO `ddys_comment` VALUES (333, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 7, 32, '1484283294308', 5);
INSERT INTO `ddys_comment` VALUES (334, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 50, 62, '1458483745910', 5);
INSERT INTO `ddys_comment` VALUES (335, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 24, 9, '1427173604690', 5);
INSERT INTO `ddys_comment` VALUES (336, '服务热情，观察图片和回答都认真详细。谢谢！', 94, 47, '1462734994225', 5);
INSERT INTO `ddys_comment` VALUES (337, '感谢医生，回复的很详细很专业', 55, 30, '1451582842226', 5);
INSERT INTO `ddys_comment` VALUES (338, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 53, 35, '1431103746494', 5);
INSERT INTO `ddys_comment` VALUES (339, '谢谢医生', 38, 41, '1481869994684', 5);
INSERT INTO `ddys_comment` VALUES (340, '很好，很满意', 14, 21, '1587784568358', 5);
INSERT INTO `ddys_comment` VALUES (341, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 50, 82, '1495956355477', 5);
INSERT INTO `ddys_comment` VALUES (342, '非常详细的解答，谢谢您', 36, 81, '1574346342258', 5);
INSERT INTO `ddys_comment` VALUES (343, '医生讲解的非常好 太细心了', 36, 59, '1578269675189', 5);
INSERT INTO `ddys_comment` VALUES (344, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 94, 75, '1426214703441', 5);
INSERT INTO `ddys_comment` VALUES (345, '我这种情况会不会是痛风？因为我尿酸也很好', 17, 32, '1510546703321', 5);
INSERT INTO `ddys_comment` VALUES (346, '感谢卢医生的耐心仔细的回答', 17, 75, '1515788818127', 5);
INSERT INTO `ddys_comment` VALUES (347, '回答非常细致，通俗易懂，给人信心很重要！', 26, 42, '1608686986042', 5);
INSERT INTO `ddys_comment` VALUES (348, '非常感谢您', 2, 17, '1551425532978', 5);
INSERT INTO `ddys_comment` VALUES (349, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 91, 67, '1436397535151', 5);
INSERT INTO `ddys_comment` VALUES (350, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 58, 19, '1473919088270', 5);
INSERT INTO `ddys_comment` VALUES (351, '感谢医生！', 21, 94, '1444655006621', 5);
INSERT INTO `ddys_comment` VALUES (352, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 70, 49, '1500576726158', 5);
INSERT INTO `ddys_comment` VALUES (353, '韦主任很专业，认真负责，回复很详细，非常感谢！', 97, 21, '1463555877083', 5);
INSERT INTO `ddys_comment` VALUES (354, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 25, 36, '1453720479642', 5);
INSERT INTO `ddys_comment` VALUES (355, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 31, 8, '1463919121486', 5);
INSERT INTO `ddys_comment` VALUES (356, '谢谢医生耐心详细地回答，非常有帮助', 14, 36, '1447998395547', 5);
INSERT INTO `ddys_comment` VALUES (357, '感谢卢医生的耐心仔细的回答', 10, 23, '1609441470949', 5);
INSERT INTO `ddys_comment` VALUES (358, '专业 细心 和蔼可亲。简直“完美”', 2, 60, '1570666881008', 5);
INSERT INTO `ddys_comment` VALUES (359, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 91, 14, '1521048653571', 5);
INSERT INTO `ddys_comment` VALUES (360, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 97, 75, '1567644142957', 5);
INSERT INTO `ddys_comment` VALUES (361, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 66, 96, '1589913510241', 5);
INSERT INTO `ddys_comment` VALUES (362, '服务热情，观察图片和回答都认真详细。谢谢！', 76, 55, '1530405854942', 5);
INSERT INTO `ddys_comment` VALUES (363, '感谢医生，回复的很详细很专业', 47, 69, '1451802531106', 5);
INSERT INTO `ddys_comment` VALUES (364, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 89, 47, '1479537860882', 5);
INSERT INTO `ddys_comment` VALUES (365, '谢谢医生', 31, 18, '1532993654236', 5);
INSERT INTO `ddys_comment` VALUES (366, '很好，很满意', 64, 5, '1542790643097', 5);
INSERT INTO `ddys_comment` VALUES (367, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 20, 92, '1459821689200', 5);
INSERT INTO `ddys_comment` VALUES (368, '非常详细的解答，谢谢您', 53, 70, '1596980781549', 5);
INSERT INTO `ddys_comment` VALUES (369, '医生讲解的非常好 太细心了', 3, 28, '1466681827527', 5);
INSERT INTO `ddys_comment` VALUES (370, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 71, 49, '1470965830897', 5);
INSERT INTO `ddys_comment` VALUES (371, '我这种情况会不会是痛风？因为我尿酸也很好', 73, 77, '1466440032357', 5);
INSERT INTO `ddys_comment` VALUES (372, '感谢卢医生的耐心仔细的回答', 85, 59, '1437559789945', 5);
INSERT INTO `ddys_comment` VALUES (373, '回答非常细致，通俗易懂，给人信心很重要！', 98, 26, '1462034865511', 5);
INSERT INTO `ddys_comment` VALUES (374, '非常感谢您', 98, 37, '1465385559032', 5);
INSERT INTO `ddys_comment` VALUES (375, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 9, 23, '1514619893418', 5);
INSERT INTO `ddys_comment` VALUES (376, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 58, 52, '1439057078830', 5);
INSERT INTO `ddys_comment` VALUES (377, '感谢医生！', 20, 6, '1515323697614', 5);
INSERT INTO `ddys_comment` VALUES (378, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 23, 57, '1460248853490', 5);
INSERT INTO `ddys_comment` VALUES (379, '韦主任很专业，认真负责，回复很详细，非常感谢！', 56, 29, '1495370587713', 5);
INSERT INTO `ddys_comment` VALUES (380, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 70, 44, '1558233091881', 5);
INSERT INTO `ddys_comment` VALUES (381, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 63, 61, '1423976924247', 5);
INSERT INTO `ddys_comment` VALUES (382, '谢谢医生耐心详细地回答，非常有帮助', 21, 94, '1547116407574', 5);
INSERT INTO `ddys_comment` VALUES (383, '感谢卢医生的耐心仔细的回答', 40, 46, '1595367176726', 5);
INSERT INTO `ddys_comment` VALUES (384, '专业 细心 和蔼可亲。简直“完美”', 72, 58, '1579606840634', 5);
INSERT INTO `ddys_comment` VALUES (385, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 91, 80, '1541155284758', 5);
INSERT INTO `ddys_comment` VALUES (386, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 40, 96, '1606022885144', 5);
INSERT INTO `ddys_comment` VALUES (387, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 87, 5, '1507353390059', 5);
INSERT INTO `ddys_comment` VALUES (388, '服务热情，观察图片和回答都认真详细。谢谢！', 73, 72, '1594791793642', 5);
INSERT INTO `ddys_comment` VALUES (389, '感谢医生，回复的很详细很专业', 42, 13, '1458618096990', 5);
INSERT INTO `ddys_comment` VALUES (390, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 69, 97, '1557812015194', 5);
INSERT INTO `ddys_comment` VALUES (391, '谢谢医生', 90, 7, '1533694059911', 5);
INSERT INTO `ddys_comment` VALUES (392, '很好，很满意', 6, 12, '1590136515398', 5);
INSERT INTO `ddys_comment` VALUES (393, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 7, 75, '1541642312398', 5);
INSERT INTO `ddys_comment` VALUES (394, '非常详细的解答，谢谢您', 50, 77, '1604239666690', 5);
INSERT INTO `ddys_comment` VALUES (395, '医生讲解的非常好 太细心了', 41, 20, '1577024464952', 5);
INSERT INTO `ddys_comment` VALUES (396, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 58, 69, '1558484232426', 5);
INSERT INTO `ddys_comment` VALUES (397, '我这种情况会不会是痛风？因为我尿酸也很好', 15, 79, '1452786634402', 5);
INSERT INTO `ddys_comment` VALUES (398, '感谢卢医生的耐心仔细的回答', 39, 0, '1423471781722', 5);
INSERT INTO `ddys_comment` VALUES (399, '回答非常细致，通俗易懂，给人信心很重要！', 53, 96, '1571738396862', 5);
INSERT INTO `ddys_comment` VALUES (400, '非常感谢您', 76, 3, '1447162284586', 5);
INSERT INTO `ddys_comment` VALUES (401, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 9, 94, '1520371888060', 5);
INSERT INTO `ddys_comment` VALUES (402, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 90, 85, '1453957647146', 5);
INSERT INTO `ddys_comment` VALUES (403, '感谢医生！', 70, 26, '1543565218483', 5);
INSERT INTO `ddys_comment` VALUES (404, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 90, 63, '1426239880194', 5);
INSERT INTO `ddys_comment` VALUES (405, '韦主任很专业，认真负责，回复很详细，非常感谢！', 35, 46, '1458783034169', 5);
INSERT INTO `ddys_comment` VALUES (406, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 51, 64, '1443580659891', 5);
INSERT INTO `ddys_comment` VALUES (407, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 80, 80, '1495266079729', 5);
INSERT INTO `ddys_comment` VALUES (408, '谢谢医生耐心详细地回答，非常有帮助', 28, 71, '1574667339200', 5);
INSERT INTO `ddys_comment` VALUES (409, '感谢卢医生的耐心仔细的回答', 60, 78, '1562992642455', 5);
INSERT INTO `ddys_comment` VALUES (410, '专业 细心 和蔼可亲。简直“完美”', 82, 83, '1517937518773', 5);
INSERT INTO `ddys_comment` VALUES (411, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 43, 18, '1497936832266', 5);
INSERT INTO `ddys_comment` VALUES (412, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 88, 20, '1466458528303', 5);
INSERT INTO `ddys_comment` VALUES (413, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 25, 52, '1594779024525', 5);
INSERT INTO `ddys_comment` VALUES (414, '服务热情，观察图片和回答都认真详细。谢谢！', 55, 6, '1608289454769', 5);
INSERT INTO `ddys_comment` VALUES (415, '感谢医生，回复的很详细很专业', 24, 5, '1509453397948', 5);
INSERT INTO `ddys_comment` VALUES (416, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 98, 89, '1497619563091', 5);
INSERT INTO `ddys_comment` VALUES (417, '谢谢医生', 19, 37, '1498273373354', 5);
INSERT INTO `ddys_comment` VALUES (418, '很好，很满意', 65, 26, '1445008746482', 5);
INSERT INTO `ddys_comment` VALUES (419, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 9, 18, '1604645591428', 5);
INSERT INTO `ddys_comment` VALUES (420, '非常详细的解答，谢谢您', 27, 7, '1475304290708', 5);
INSERT INTO `ddys_comment` VALUES (421, '医生讲解的非常好 太细心了', 20, 68, '1576253696760', 5);
INSERT INTO `ddys_comment` VALUES (422, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 76, 91, '1554765754381', 5);
INSERT INTO `ddys_comment` VALUES (423, '我这种情况会不会是痛风？因为我尿酸也很好', 36, 87, '1478038097281', 5);
INSERT INTO `ddys_comment` VALUES (424, '感谢卢医生的耐心仔细的回答', 20, 73, '1429463566473', 5);
INSERT INTO `ddys_comment` VALUES (425, '回答非常细致，通俗易懂，给人信心很重要！', 9, 42, '1584487662027', 5);
INSERT INTO `ddys_comment` VALUES (426, '非常感谢您', 85, 72, '1561958324164', 5);
INSERT INTO `ddys_comment` VALUES (427, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 19, 3, '1497519625490', 5);
INSERT INTO `ddys_comment` VALUES (428, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 21, 43, '1442562148595', 5);
INSERT INTO `ddys_comment` VALUES (429, '感谢医生！', 6, 61, '1597922944753', 5);
INSERT INTO `ddys_comment` VALUES (430, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 94, 33, '1517647734138', 5);
INSERT INTO `ddys_comment` VALUES (431, '韦主任很专业，认真负责，回复很详细，非常感谢！', 93, 9, '1521957694650', 5);
INSERT INTO `ddys_comment` VALUES (432, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 25, 84, '1474349708913', 5);
INSERT INTO `ddys_comment` VALUES (433, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 83, 82, '1505207452170', 5);
INSERT INTO `ddys_comment` VALUES (434, '谢谢医生耐心详细地回答，非常有帮助', 27, 29, '1582128082979', 5);
INSERT INTO `ddys_comment` VALUES (435, '感谢卢医生的耐心仔细的回答', 36, 83, '1445490339464', 5);
INSERT INTO `ddys_comment` VALUES (436, '专业 细心 和蔼可亲。简直“完美”', 20, 85, '1542885806841', 5);
INSERT INTO `ddys_comment` VALUES (437, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 60, 84, '1430268947458', 5);
INSERT INTO `ddys_comment` VALUES (438, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 22, 94, '1598937031845', 5);
INSERT INTO `ddys_comment` VALUES (439, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 12, 73, '1600619055876', 5);
INSERT INTO `ddys_comment` VALUES (440, '服务热情，观察图片和回答都认真详细。谢谢！', 60, 64, '1532377815245', 5);
INSERT INTO `ddys_comment` VALUES (441, '感谢医生，回复的很详细很专业', 7, 4, '1493573835517', 5);
INSERT INTO `ddys_comment` VALUES (442, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 75, 28, '1600265920835', 5);
INSERT INTO `ddys_comment` VALUES (443, '谢谢医生', 9, 35, '1484671544520', 5);
INSERT INTO `ddys_comment` VALUES (444, '很好，很满意', 33, 81, '1603474530560', 5);
INSERT INTO `ddys_comment` VALUES (445, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 66, 24, '1462828650766', 5);
INSERT INTO `ddys_comment` VALUES (446, '非常详细的解答，谢谢您', 90, 78, '1463509532724', 5);
INSERT INTO `ddys_comment` VALUES (447, '医生讲解的非常好 太细心了', 16, 21, '1588972878239', 5);
INSERT INTO `ddys_comment` VALUES (448, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 68, 56, '1549824538974', 5);
INSERT INTO `ddys_comment` VALUES (449, '我这种情况会不会是痛风？因为我尿酸也很好', 87, 45, '1463889599581', 5);
INSERT INTO `ddys_comment` VALUES (450, '感谢卢医生的耐心仔细的回答', 86, 30, '1606012788227', 5);
INSERT INTO `ddys_comment` VALUES (451, '回答非常细致，通俗易懂，给人信心很重要！', 65, 78, '1431448211529', 5);
INSERT INTO `ddys_comment` VALUES (452, '非常感谢您', 84, 95, '1474060583248', 5);
INSERT INTO `ddys_comment` VALUES (453, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 93, 50, '1586542377815', 5);
INSERT INTO `ddys_comment` VALUES (454, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 0, 48, '1471162784701', 5);
INSERT INTO `ddys_comment` VALUES (455, '感谢医生！', 95, 18, '1553907573975', 5);
INSERT INTO `ddys_comment` VALUES (456, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 92, 90, '1533188611863', 5);
INSERT INTO `ddys_comment` VALUES (457, '韦主任很专业，认真负责，回复很详细，非常感谢！', 45, 36, '1570730852615', 5);
INSERT INTO `ddys_comment` VALUES (458, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 49, 90, '1598411010192', 5);
INSERT INTO `ddys_comment` VALUES (459, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 77, 85, '1606081706229', 5);
INSERT INTO `ddys_comment` VALUES (460, '谢谢医生耐心详细地回答，非常有帮助', 82, 52, '1450622065213', 5);
INSERT INTO `ddys_comment` VALUES (461, '感谢卢医生的耐心仔细的回答', 32, 11, '1553239050085', 5);
INSERT INTO `ddys_comment` VALUES (462, '专业 细心 和蔼可亲。简直“完美”', 6, 92, '1430407742186', 5);
INSERT INTO `ddys_comment` VALUES (463, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 76, 51, '1451848618800', 5);
INSERT INTO `ddys_comment` VALUES (464, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 66, 48, '1487590299684', 5);
INSERT INTO `ddys_comment` VALUES (465, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 88, 16, '1561770477970', 5);
INSERT INTO `ddys_comment` VALUES (466, '服务热情，观察图片和回答都认真详细。谢谢！', 48, 98, '1458069791535', 5);
INSERT INTO `ddys_comment` VALUES (467, '感谢医生，回复的很详细很专业', 1, 86, '1545806700354', 5);
INSERT INTO `ddys_comment` VALUES (468, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 13, 43, '1481175442093', 5);
INSERT INTO `ddys_comment` VALUES (469, '谢谢医生', 37, 3, '1568163413311', 5);
INSERT INTO `ddys_comment` VALUES (470, '很好，很满意', 63, 75, '1579050279640', 5);
INSERT INTO `ddys_comment` VALUES (471, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 13, 33, '1430992847813', 5);
INSERT INTO `ddys_comment` VALUES (472, '非常详细的解答，谢谢您', 77, 75, '1556527883857', 5);
INSERT INTO `ddys_comment` VALUES (473, '医生讲解的非常好 太细心了', 49, 38, '1436361258423', 5);
INSERT INTO `ddys_comment` VALUES (474, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 12, 55, '1491825300710', 5);
INSERT INTO `ddys_comment` VALUES (475, '我这种情况会不会是痛风？因为我尿酸也很好', 79, 3, '1487111436859', 5);
INSERT INTO `ddys_comment` VALUES (476, '感谢卢医生的耐心仔细的回答', 51, 57, '1568897571233', 5);
INSERT INTO `ddys_comment` VALUES (477, '回答非常细致，通俗易懂，给人信心很重要！', 79, 11, '1532236826538', 5);
INSERT INTO `ddys_comment` VALUES (478, '非常感谢您', 72, 93, '1509772220761', 5);
INSERT INTO `ddys_comment` VALUES (479, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 43, 77, '1594870014170', 5);
INSERT INTO `ddys_comment` VALUES (480, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 40, 7, '1496788961692', 5);
INSERT INTO `ddys_comment` VALUES (481, '感谢医生！', 66, 81, '1550701039352', 5);
INSERT INTO `ddys_comment` VALUES (482, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 68, 64, '1529733589677', 5);
INSERT INTO `ddys_comment` VALUES (483, '韦主任很专业，认真负责，回复很详细，非常感谢！', 78, 42, '1455712667009', 5);
INSERT INTO `ddys_comment` VALUES (484, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 50, 58, '1424980692667', 5);
INSERT INTO `ddys_comment` VALUES (485, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 83, 52, '1581533533122', 5);
INSERT INTO `ddys_comment` VALUES (486, '谢谢医生耐心详细地回答，非常有帮助', 89, 37, '1489210970420', 5);
INSERT INTO `ddys_comment` VALUES (487, '感谢卢医生的耐心仔细的回答', 36, 14, '1523128022044', 5);
INSERT INTO `ddys_comment` VALUES (488, '专业 细心 和蔼可亲。简直“完美”', 63, 15, '1429794805015', 5);
INSERT INTO `ddys_comment` VALUES (489, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 45, 20, '1588199964461', 5);
INSERT INTO `ddys_comment` VALUES (490, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 45, 27, '1515806675594', 5);
INSERT INTO `ddys_comment` VALUES (491, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 74, 83, '1471789580488', 5);
INSERT INTO `ddys_comment` VALUES (492, '服务热情，观察图片和回答都认真详细。谢谢！', 90, 47, '1513739598518', 5);
INSERT INTO `ddys_comment` VALUES (493, '感谢医生，回复的很详细很专业', 85, 62, '1528519463694', 5);
INSERT INTO `ddys_comment` VALUES (494, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 69, 16, '1586949675667', 5);
INSERT INTO `ddys_comment` VALUES (495, '谢谢医生', 67, 96, '1500655616844', 5);
INSERT INTO `ddys_comment` VALUES (496, '很好，很满意', 89, 81, '1480509915696', 5);
INSERT INTO `ddys_comment` VALUES (497, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 76, 21, '1562759419550', 5);
INSERT INTO `ddys_comment` VALUES (498, '非常详细的解答，谢谢您', 17, 94, '1469809149704', 5);
INSERT INTO `ddys_comment` VALUES (499, '医生讲解的非常好 太细心了', 38, 43, '1498593840654', 5);
INSERT INTO `ddys_comment` VALUES (500, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 16, 30, '1523437610041', 5);
INSERT INTO `ddys_comment` VALUES (501, '我这种情况会不会是痛风？因为我尿酸也很好', 78, 56, '1526527602807', 5);
INSERT INTO `ddys_comment` VALUES (502, '感谢卢医生的耐心仔细的回答', 81, 62, '1607457961605', 5);
INSERT INTO `ddys_comment` VALUES (503, '回答非常细致，通俗易懂，给人信心很重要！', 62, 96, '1587231708598', 5);
INSERT INTO `ddys_comment` VALUES (504, '非常感谢您', 68, 15, '1609038776161', 5);
INSERT INTO `ddys_comment` VALUES (505, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 97, 49, '1520776611023', 5);
INSERT INTO `ddys_comment` VALUES (506, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 94, 58, '1469643200664', 5);
INSERT INTO `ddys_comment` VALUES (507, '感谢医生！', 65, 79, '1587842914129', 5);
INSERT INTO `ddys_comment` VALUES (508, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 83, 13, '1489328427603', 5);
INSERT INTO `ddys_comment` VALUES (509, '韦主任很专业，认真负责，回复很详细，非常感谢！', 74, 91, '1448968369871', 5);
INSERT INTO `ddys_comment` VALUES (510, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 22, 92, '1609844407966', 5);
INSERT INTO `ddys_comment` VALUES (511, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 73, 57, '1443645308446', 5);
INSERT INTO `ddys_comment` VALUES (512, '谢谢医生耐心详细地回答，非常有帮助', 65, 33, '1427866006726', 5);
INSERT INTO `ddys_comment` VALUES (513, '感谢卢医生的耐心仔细的回答', 69, 72, '1448234993201', 5);
INSERT INTO `ddys_comment` VALUES (514, '专业 细心 和蔼可亲。简直“完美”', 15, 57, '1555626967349', 5);
INSERT INTO `ddys_comment` VALUES (515, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 50, 25, '1578617984483', 5);
INSERT INTO `ddys_comment` VALUES (516, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 55, 64, '1452256945443', 5);
INSERT INTO `ddys_comment` VALUES (517, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 68, 49, '1517044704023', 5);
INSERT INTO `ddys_comment` VALUES (518, '服务热情，观察图片和回答都认真详细。谢谢！', 68, 81, '1516350522910', 5);
INSERT INTO `ddys_comment` VALUES (519, '感谢医生，回复的很详细很专业', 67, 37, '1521431066055', 5);
INSERT INTO `ddys_comment` VALUES (520, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 18, 85, '1572991016363', 5);
INSERT INTO `ddys_comment` VALUES (521, '谢谢医生', 32, 68, '1514192480249', 5);
INSERT INTO `ddys_comment` VALUES (522, '很好，很满意', 25, 46, '1481336540433', 5);
INSERT INTO `ddys_comment` VALUES (523, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 32, 40, '1457114132697', 5);
INSERT INTO `ddys_comment` VALUES (524, '非常详细的解答，谢谢您', 16, 21, '1572935315044', 5);
INSERT INTO `ddys_comment` VALUES (525, '医生讲解的非常好 太细心了', 7, 54, '1565891810706', 5);
INSERT INTO `ddys_comment` VALUES (526, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 79, 46, '1482311836338', 5);
INSERT INTO `ddys_comment` VALUES (527, '我这种情况会不会是痛风？因为我尿酸也很好', 23, 14, '1590668539838', 5);
INSERT INTO `ddys_comment` VALUES (528, '感谢卢医生的耐心仔细的回答', 2, 67, '1499577839249', 5);
INSERT INTO `ddys_comment` VALUES (529, '回答非常细致，通俗易懂，给人信心很重要！', 21, 44, '1584862387165', 5);
INSERT INTO `ddys_comment` VALUES (530, '非常感谢您', 98, 17, '1453064457407', 5);
INSERT INTO `ddys_comment` VALUES (531, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 55, 22, '1473055356347', 5);
INSERT INTO `ddys_comment` VALUES (532, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 78, 70, '1426249744295', 5);
INSERT INTO `ddys_comment` VALUES (533, '感谢医生！', 57, 6, '1421123648259', 5);
INSERT INTO `ddys_comment` VALUES (534, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 2, 90, '1576777303612', 5);
INSERT INTO `ddys_comment` VALUES (535, '韦主任很专业，认真负责，回复很详细，非常感谢！', 95, 59, '1527453163738', 5);
INSERT INTO `ddys_comment` VALUES (536, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 63, 72, '1512336872086', 5);
INSERT INTO `ddys_comment` VALUES (537, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 86, 81, '1470861572878', 5);
INSERT INTO `ddys_comment` VALUES (538, '谢谢医生耐心详细地回答，非常有帮助', 81, 47, '1571618906017', 5);
INSERT INTO `ddys_comment` VALUES (539, '感谢卢医生的耐心仔细的回答', 78, 33, '1567640454083', 5);
INSERT INTO `ddys_comment` VALUES (540, '专业 细心 和蔼可亲。简直“完美”', 22, 58, '1448389154540', 5);
INSERT INTO `ddys_comment` VALUES (541, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 96, 78, '1511603103806', 5);
INSERT INTO `ddys_comment` VALUES (542, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 42, 4, '1521545495065', 5);
INSERT INTO `ddys_comment` VALUES (543, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 20, 35, '1432495975813', 5);
INSERT INTO `ddys_comment` VALUES (544, '服务热情，观察图片和回答都认真详细。谢谢！', 44, 35, '1474698217894', 5);
INSERT INTO `ddys_comment` VALUES (545, '感谢医生，回复的很详细很专业', 56, 50, '1575183952867', 5);
INSERT INTO `ddys_comment` VALUES (546, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 18, 88, '1474023823288', 5);
INSERT INTO `ddys_comment` VALUES (547, '谢谢医生', 76, 95, '1450751684367', 5);
INSERT INTO `ddys_comment` VALUES (548, '很好，很满意', 39, 81, '1578056249093', 5);
INSERT INTO `ddys_comment` VALUES (549, '熊医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 62, 44, '1562468958577', 5);
INSERT INTO `ddys_comment` VALUES (550, '非常详细的解答，谢谢您', 63, 45, '1560176566908', 5);
INSERT INTO `ddys_comment` VALUES (551, '医生讲解的非常好 太细心了', 73, 78, '1531072426366', 5);
INSERT INTO `ddys_comment` VALUES (552, '借着评论还想问一下医生，目前这个核磁的片子能否看出我的韧带究竟是松弛了，还是已经断裂了么？如果采用手术的话，是不是只针对这一条韧带手术？', 66, 29, '1474003716129', 5);
INSERT INTO `ddys_comment` VALUES (553, '我这种情况会不会是痛风？因为我尿酸也很好', 81, 9, '1558379194362', 5);
INSERT INTO `ddys_comment` VALUES (554, '感谢卢医生的耐心仔细的回答', 15, 56, '1465174281568', 5);
INSERT INTO `ddys_comment` VALUES (555, '回答非常细致，通俗易懂，给人信心很重要！', 96, 8, '1542833784983', 5);
INSERT INTO `ddys_comment` VALUES (556, '非常感谢您', 67, 84, '1543950867110', 5);
INSERT INTO `ddys_comment` VALUES (557, '非常细心。说的很多注意事项以及细节。非常非常好的医生。', 46, 24, '1583875997091', 5);
INSERT INTO `ddys_comment` VALUES (558, '这样我主要想知道的是现在驼背这么严重，那老了以后会不会更糟糕', 73, 93, '1482029925106', 5);
INSERT INTO `ddys_comment` VALUES (559, '感谢医生！', 28, 33, '1531967743644', 5);
INSERT INTO `ddys_comment` VALUES (560, '谢谢医生，讲解十分细致，专业度极高。因为提问次数没有了，以这样的方式向你表示感谢！', 58, 71, '1579979341341', 5);
INSERT INTO `ddys_comment` VALUES (561, '韦主任很专业，认真负责，回复很详细，非常感谢！', 8, 94, '1572579699806', 5);
INSERT INTO `ddys_comment` VALUES (562, '卓医生讲解的很到位，解答也很有耐心，五星好评！', 94, 70, '1467292161981', 5);
INSERT INTO `ddys_comment` VALUES (563, '谢谢大夫，回答的很仔细，很有耐心，值得信任～', 92, 27, '1587506647420', 5);
INSERT INTO `ddys_comment` VALUES (564, '谢谢医生耐心详细地回答，非常有帮助', 38, 22, '1441459641335', 5);
INSERT INTO `ddys_comment` VALUES (565, '感谢卢医生的耐心仔细的回答', 78, 92, '1493312584781', 5);
INSERT INTO `ddys_comment` VALUES (566, '专业 细心 和蔼可亲。简直“完美”', 96, 67, '1439969367394', 5);
INSERT INTO `ddys_comment` VALUES (567, '谢谢戴医生认真看诊，耐心解答，之后会来复诊。再次感谢', 27, 29, '1529289212283', 5);
INSERT INTO `ddys_comment` VALUES (568, '医生好温柔很有耐心，给出的建议很专业，我治疗痘痘看到了希望', 61, 74, '1610732459677', 5);
INSERT INTO `ddys_comment` VALUES (569, '回复及时，耐心细致，还帮忙开处方，特别感谢！', 42, 73, '1481343869278', 5);
INSERT INTO `ddys_comment` VALUES (570, '服务热情，观察图片和回答都认真详细。谢谢！', 84, 81, '1442452089372', 5);
INSERT INTO `ddys_comment` VALUES (571, '感谢医生，回复的很详细很专业', 41, 0, '1561994847441', 5);
INSERT INTO `ddys_comment` VALUES (572, '谢谢医生提醒及关心，我现已在等待检查双输尿管膀胱彩超及尿检中。', 36, 73, '1458560553894', 5);
INSERT INTO `ddys_comment` VALUES (973, '感谢医生！', 8, 1, '1459821689200', 5);
INSERT INTO `ddys_comment` VALUES (974, '感谢医生！', 40, 2, '1596980781549', 5);
INSERT INTO `ddys_comment` VALUES (975, '感谢医生！', 72, 3, '1466681827527', 5);
INSERT INTO `ddys_comment` VALUES (976, '感谢医生！', 45, 4, '1470965830897', 5);
INSERT INTO `ddys_comment` VALUES (977, '感谢医生！', 22, 5, '1466440032357', 5);
INSERT INTO `ddys_comment` VALUES (978, '感谢医生！', 85, 6, '1437559789945', 5);
INSERT INTO `ddys_comment` VALUES (979, '感谢医生！', 35, 7, '1462034865511', 5);
INSERT INTO `ddys_comment` VALUES (980, '感谢医生！', 12, 8, '1465385559032', 5);
INSERT INTO `ddys_comment` VALUES (981, '感谢医生！', 94, 9, '1514619893418', 5);
INSERT INTO `ddys_comment` VALUES (982, '感谢医生！', 85, 10, '1439057078830', 5);
INSERT INTO `ddys_comment` VALUES (983, '感谢医生！', 43, 11, '1515323697614', 5);
INSERT INTO `ddys_comment` VALUES (984, '感谢医生！', 63, 18, '1460248853490', 5);
INSERT INTO `ddys_comment` VALUES (985, '感谢医生！', 66, 16, '1495370587713', 5);
INSERT INTO `ddys_comment` VALUES (986, '感谢医生！', 39, 17, '1558233091881', 5);
INSERT INTO `ddys_comment` VALUES (987, '感谢医生！', 61, 15, '1423976924247', 5);
INSERT INTO `ddys_comment` VALUES (988, '感谢医生！', 72, 13, '1547116407574', 5);
INSERT INTO `ddys_comment` VALUES (989, '感谢医生！', 31, 14, '1595367176726', 5);
INSERT INTO `ddys_comment` VALUES (990, '感谢医生！', 78, 12, '1579606840634', 5);
INSERT INTO `ddys_comment` VALUES (991, '感谢医生！', 31, 19, '1541155284758', 5);
INSERT INTO `ddys_comment` VALUES (992, '感谢医生！', 63, 20, '1606022885144', 5);
INSERT INTO `ddys_comment` VALUES (993, '感谢医生！', 70, 29, '1507353390059', 5);
INSERT INTO `ddys_comment` VALUES (994, '感谢医生！', 98, 21, '1594791793642', 5);
INSERT INTO `ddys_comment` VALUES (995, '感谢医生！', 65, 27, '1458618096990', 5);
INSERT INTO `ddys_comment` VALUES (996, '感谢医生！', 33, 28, '1557812015194', 5);
INSERT INTO `ddys_comment` VALUES (997, '感谢医生！', 78, 23, '1533694059911', 5);
INSERT INTO `ddys_comment` VALUES (998, '感谢医生！', 45, 22, '1590136515398', 5);
INSERT INTO `ddys_comment` VALUES (999, '感谢医生！', 47, 25, '1541642312398', 5);
INSERT INTO `ddys_comment` VALUES (1000, '感谢医生！', 80, 30, '1604239666690', 5);
INSERT INTO `ddys_comment` VALUES (1001, '感谢医生！', 74, 24, '1577024464952', 5);
INSERT INTO `ddys_comment` VALUES (1002, '感谢医生！', 25, 26, '1558484232426', 5);
INSERT INTO `ddys_comment` VALUES (1003, '感谢医生！', 94, 31, '1452786634402', 5);
INSERT INTO `ddys_comment` VALUES (1004, '感谢医生！', 71, 32, '1423471781722', 5);
INSERT INTO `ddys_comment` VALUES (1005, '感谢医生！', 72, 37, '1571738396862', 5);
INSERT INTO `ddys_comment` VALUES (1006, '感谢医生！', 80, 33, '1447162284586', 5);
INSERT INTO `ddys_comment` VALUES (1007, '感谢医生！', 2, 36, '1520371888060', 5);
INSERT INTO `ddys_comment` VALUES (1008, '感谢医生！', 23, 39, '1453957647146', 5);
INSERT INTO `ddys_comment` VALUES (1009, '感谢医生！', 26, 34, '1543565218483', 5);
INSERT INTO `ddys_comment` VALUES (1010, '感谢医生！', 63, 35, '1426239880194', 5);
INSERT INTO `ddys_comment` VALUES (1011, '感谢医生！', 70, 40, '1458783034169', 5);
INSERT INTO `ddys_comment` VALUES (1012, '感谢医生！', 14, 38, '1443580659891', 5);
INSERT INTO `ddys_comment` VALUES (1013, '感谢医生！', 47, 41, '1495266079729', 5);
INSERT INTO `ddys_comment` VALUES (1014, '感谢医生！', 12, 42, '1574667339200', 5);
INSERT INTO `ddys_comment` VALUES (1015, '感谢医生！', 55, 50, '1562992642455', 5);
INSERT INTO `ddys_comment` VALUES (1016, '感谢医生！', 13, 49, '1517937518773', 5);
INSERT INTO `ddys_comment` VALUES (1017, '感谢医生！', 61, 47, '1497936832266', 5);
INSERT INTO `ddys_comment` VALUES (1018, '感谢医生！', 72, 48, '1466458528303', 5);
INSERT INTO `ddys_comment` VALUES (1019, '感谢医生！', 72, 44, '1594779024525', 5);
INSERT INTO `ddys_comment` VALUES (1020, '感谢医生！', 6, 46, '1608289454769', 5);
INSERT INTO `ddys_comment` VALUES (1021, '感谢医生！', 28, 43, '1509453397948', 5);
INSERT INTO `ddys_comment` VALUES (1022, '感谢医生！', 68, 45, '1497619563091', 5);
INSERT INTO `ddys_comment` VALUES (1023, '感谢医生！', 26, 52, '1498273373354', 5);
INSERT INTO `ddys_comment` VALUES (1024, '感谢医生！', 3, 51, '1445008746482', 5);
INSERT INTO `ddys_comment` VALUES (1025, '感谢医生！', 6, 57, '1604645591428', 5);
INSERT INTO `ddys_comment` VALUES (1026, '感谢医生！', 53, 60, '1475304290708', 5);
INSERT INTO `ddys_comment` VALUES (1027, '感谢医生！', 91, 58, '1576253696760', 5);
INSERT INTO `ddys_comment` VALUES (1028, '感谢医生！', 9, 56, '1554765754381', 5);
INSERT INTO `ddys_comment` VALUES (1029, '感谢医生！', 59, 54, '1478038097281', 5);
INSERT INTO `ddys_comment` VALUES (1030, '感谢医生！', 31, 53, '1429463566473', 5);
INSERT INTO `ddys_comment` VALUES (1031, '感谢医生！', 26, 55, '1584487662027', 5);
INSERT INTO `ddys_comment` VALUES (1032, '感谢医生！', 49, 59, '1561958324164', 5);
INSERT INTO `ddys_comment` VALUES (1033, '感谢医生！', 64, 61, '1497519625490', 5);
INSERT INTO `ddys_comment` VALUES (1034, '感谢医生！', 21, 62, '1442562148595', 5);
INSERT INTO `ddys_comment` VALUES (1035, '感谢医生！', 58, 69, '1597922944753', 5);
INSERT INTO `ddys_comment` VALUES (1036, '感谢医生！', 15, 66, '1517647734138', 5);
INSERT INTO `ddys_comment` VALUES (1037, '感谢医生！', 34, 70, '1521957694650', 5);
INSERT INTO `ddys_comment` VALUES (1038, '感谢医生！', 97, 65, '1474349708913', 5);
INSERT INTO `ddys_comment` VALUES (1039, '感谢医生！', 31, 67, '1505207452170', 5);
INSERT INTO `ddys_comment` VALUES (1040, '感谢医生！', 97, 64, '1582128082979', 5);
INSERT INTO `ddys_comment` VALUES (1041, '感谢医生！', 52, 63, '1445490339464', 5);
INSERT INTO `ddys_comment` VALUES (1042, '感谢医生！', 1, 68, '1542885806841', 5);
INSERT INTO `ddys_comment` VALUES (1043, '感谢医生！', 28, 72, '1430268947458', 5);
INSERT INTO `ddys_comment` VALUES (1044, '感谢医生！', 63, 71, '1598937031845', 5);
INSERT INTO `ddys_comment` VALUES (1045, '感谢医生！', 36, 78, '1600619055876', 5);
INSERT INTO `ddys_comment` VALUES (1046, '感谢医生！', 51, 79, '1532377815245', 5);
INSERT INTO `ddys_comment` VALUES (1047, '感谢医生！', 96, 75, '1493573835517', 5);
INSERT INTO `ddys_comment` VALUES (1048, '感谢医生！', 64, 80, '1600265920835', 5);
INSERT INTO `ddys_comment` VALUES (1049, '感谢医生！', 97, 74, '1484671544520', 5);
INSERT INTO `ddys_comment` VALUES (1050, '感谢医生！', 21, 73, '1603474530560', 5);
INSERT INTO `ddys_comment` VALUES (1051, '感谢医生！', 52, 76, '1462828650766', 5);
INSERT INTO `ddys_comment` VALUES (1052, '感谢医生！', 66, 77, '1463509532724', 5);
INSERT INTO `ddys_comment` VALUES (1053, '感谢医生！', 6, 81, '1588972878239', 5);
INSERT INTO `ddys_comment` VALUES (1054, '感谢医生！', 56, 82, '1549824538974', 5);
INSERT INTO `ddys_comment` VALUES (1055, '感谢医生！', 48, 87, '1463889599581', 5);
INSERT INTO `ddys_comment` VALUES (1056, '感谢医生！', 20, 85, '1606012788227', 5);
INSERT INTO `ddys_comment` VALUES (1057, '感谢医生！', 75, 89, '1431448211529', 5);
INSERT INTO `ddys_comment` VALUES (1058, '感谢医生！', 45, 83, '1474060583248', 5);
INSERT INTO `ddys_comment` VALUES (1059, '感谢医生！', 1, 86, '1586542377815', 5);
INSERT INTO `ddys_comment` VALUES (1060, '感谢医生！', 75, 88, '1471162784701', 5);
INSERT INTO `ddys_comment` VALUES (1061, '感谢医生！', 18, 84, '1553907573975', 5);
INSERT INTO `ddys_comment` VALUES (1062, '感谢医生！', 43, 90, '1533188611863', 5);
INSERT INTO `ddys_comment` VALUES (1063, '感谢医生！', 78, 91, '1570730852615', 5);
INSERT INTO `ddys_comment` VALUES (1064, '感谢医生！', 3, 92, '1598411010192', 5);
INSERT INTO `ddys_comment` VALUES (1065, '感谢医生！', 86, 93, '1606081706229', 5);
INSERT INTO `ddys_comment` VALUES (1066, '感谢医生！', 99, 95, '1450622065213', 5);
INSERT INTO `ddys_comment` VALUES (1067, '感谢医生！', 75, 94, '1553239050085', 5);
INSERT INTO `ddys_comment` VALUES (1068, '感谢医生！', 0, 100, '1430407742186', 5);
INSERT INTO `ddys_comment` VALUES (1069, '感谢医生！', 59, 99, '1451848618800', 5);
INSERT INTO `ddys_comment` VALUES (1070, '感谢医生！', 37, 96, '1487590299684', 5);
INSERT INTO `ddys_comment` VALUES (1071, '感谢医生！', 71, 97, '1561770477970', 5);
INSERT INTO `ddys_comment` VALUES (1072, '感谢医生！', 91, 98, '1458069791535', 5);
INSERT INTO `ddys_comment` VALUES (1073, '感谢医生！', 19, 1, '1453518762141', 5);
INSERT INTO `ddys_comment` VALUES (1074, '感谢医生！', 39, 2, '1434647666333', 5);
INSERT INTO `ddys_comment` VALUES (1075, '感谢医生！', 22, 3, '1447412072220', 5);
INSERT INTO `ddys_comment` VALUES (1076, '感谢医生！', 59, 4, '1430551711166', 5);
INSERT INTO `ddys_comment` VALUES (1077, '感谢医生！', 78, 5, '1575267511996', 5);
INSERT INTO `ddys_comment` VALUES (1078, '感谢医生！', 49, 6, '1535914332857', 5);
INSERT INTO `ddys_comment` VALUES (1079, '感谢医生！', 35, 7, '1535360534179', 5);
INSERT INTO `ddys_comment` VALUES (1080, '感谢医生！', 84, 8, '1520535097634', 5);
INSERT INTO `ddys_comment` VALUES (1081, '感谢医生！', 0, 9, '1523592756741', 5);
INSERT INTO `ddys_comment` VALUES (1082, '感谢医生！', 71, 10, '1494648046688', 5);
INSERT INTO `ddys_comment` VALUES (1083, '感谢医生！', 50, 11, '1551691834408', 5);
INSERT INTO `ddys_comment` VALUES (1084, '感谢医生！', 34, 17, '1556588879573', 5);
INSERT INTO `ddys_comment` VALUES (1085, '感谢医生！', 76, 19, '1457531925683', 5);
INSERT INTO `ddys_comment` VALUES (1086, '感谢医生！', 77, 20, '1607110840611', 5);
INSERT INTO `ddys_comment` VALUES (1087, '感谢医生！', 17, 21, '1447591647497', 5);
INSERT INTO `ddys_comment` VALUES (1088, '感谢医生！', 35, 18, '1582148092428', 5);
INSERT INTO `ddys_comment` VALUES (1089, '感谢医生！', 40, 15, '1577356584592', 5);
INSERT INTO `ddys_comment` VALUES (1090, '感谢医生！', 56, 23, '1587388333740', 5);
INSERT INTO `ddys_comment` VALUES (1091, '感谢医生！', 51, 12, '1421915236328', 5);
INSERT INTO `ddys_comment` VALUES (1092, '感谢医生！', 77, 26, '1505950274485', 5);
INSERT INTO `ddys_comment` VALUES (1093, '感谢医生！', 5, 16, '1484283294308', 5);
INSERT INTO `ddys_comment` VALUES (1094, '感谢医生！', 44, 29, '1458483745910', 5);
INSERT INTO `ddys_comment` VALUES (1095, '感谢医生！', 55, 13, '1427173604690', 5);
INSERT INTO `ddys_comment` VALUES (1096, '感谢医生！', 51, 27, '1462734994225', 5);
INSERT INTO `ddys_comment` VALUES (1097, '感谢医生！', 35, 22, '1451582842226', 5);
INSERT INTO `ddys_comment` VALUES (1098, '感谢医生！', 89, 31, '1431103746494', 5);
INSERT INTO `ddys_comment` VALUES (1099, '感谢医生！', 95, 25, '1481869994684', 5);
INSERT INTO `ddys_comment` VALUES (1100, '感谢医生！', 74, 30, '1587784568358', 5);
INSERT INTO `ddys_comment` VALUES (1101, '感谢医生！', 14, 28, '1495956355477', 5);
INSERT INTO `ddys_comment` VALUES (1102, '感谢医生！', 86, 35, '1574346342258', 5);
INSERT INTO `ddys_comment` VALUES (1103, '感谢医生！', 77, 14, '1578269675189', 5);
INSERT INTO `ddys_comment` VALUES (1104, '感谢医生！', 70, 37, '1426214703441', 5);
INSERT INTO `ddys_comment` VALUES (1105, '感谢医生！', 39, 34, '1510546703321', 5);
INSERT INTO `ddys_comment` VALUES (1106, '感谢医生！', 31, 32, '1515788818127', 5);
INSERT INTO `ddys_comment` VALUES (1107, '感谢医生！', 87, 41, '1608686986042', 5);
INSERT INTO `ddys_comment` VALUES (1108, '感谢医生！', 89, 40, '1551425532978', 5);
INSERT INTO `ddys_comment` VALUES (1109, '感谢医生！', 36, 42, '1436397535151', 5);
INSERT INTO `ddys_comment` VALUES (1110, '感谢医生！', 30, 36, '1473919088270', 5);
INSERT INTO `ddys_comment` VALUES (1111, '感谢医生！', 80, 38, '1444655006621', 5);
INSERT INTO `ddys_comment` VALUES (1112, '感谢医生！', 48, 43, '1500576726158', 5);
INSERT INTO `ddys_comment` VALUES (1113, '感谢医生！', 31, 24, '1463555877083', 5);
INSERT INTO `ddys_comment` VALUES (1114, '感谢医生！', 58, 33, '1453720479642', 5);
INSERT INTO `ddys_comment` VALUES (1115, '感谢医生！', 82, 46, '1463919121486', 5);
INSERT INTO `ddys_comment` VALUES (1116, '感谢医生！', 38, 45, '1447998395547', 5);
INSERT INTO `ddys_comment` VALUES (1117, '感谢医生！', 15, 47, '1609441470949', 5);
INSERT INTO `ddys_comment` VALUES (1118, '感谢医生！', 92, 44, '1570666881008', 5);
INSERT INTO `ddys_comment` VALUES (1119, '感谢医生！', 47, 50, '1521048653571', 5);
INSERT INTO `ddys_comment` VALUES (1120, '感谢医生！', 66, 39, '1567644142957', 5);
INSERT INTO `ddys_comment` VALUES (1121, '感谢医生！', 28, 54, '1589913510241', 5);
INSERT INTO `ddys_comment` VALUES (1122, '感谢医生！', 60, 53, '1530405854942', 5);
INSERT INTO `ddys_comment` VALUES (1123, '感谢医生！', 50, 55, '1451802531106', 5);
INSERT INTO `ddys_comment` VALUES (1124, '感谢医生！', 73, 51, '1479537860882', 5);
INSERT INTO `ddys_comment` VALUES (1125, '感谢医生！', 30, 48, '1532993654236', 5);
INSERT INTO `ddys_comment` VALUES (1126, '感谢医生！', 38, 56, '1542790643097', 5);
INSERT INTO `ddys_comment` VALUES (1127, '感谢医生！', 22, 57, '1459821689200', 5);
INSERT INTO `ddys_comment` VALUES (1128, '感谢医生！', 81, 60, '1596980781549', 5);
INSERT INTO `ddys_comment` VALUES (1129, '感谢医生！', 32, 52, '1466681827527', 5);
INSERT INTO `ddys_comment` VALUES (1130, '感谢医生！', 61, 63, '1470965830897', 5);
INSERT INTO `ddys_comment` VALUES (1131, '感谢医生！', 23, 49, '1466440032357', 5);
INSERT INTO `ddys_comment` VALUES (1132, '感谢医生！', 90, 58, '1437559789945', 5);
INSERT INTO `ddys_comment` VALUES (1133, '感谢医生！', 53, 67, '1462034865511', 5);
INSERT INTO `ddys_comment` VALUES (1134, '感谢医生！', 83, 62, '1465385559032', 5);
INSERT INTO `ddys_comment` VALUES (1135, '感谢医生！', 28, 65, '1514619893418', 5);
INSERT INTO `ddys_comment` VALUES (1136, '感谢医生！', 8, 68, '1439057078830', 5);
INSERT INTO `ddys_comment` VALUES (1137, '感谢医生！', 40, 59, '1515323697614', 5);
INSERT INTO `ddys_comment` VALUES (1138, '感谢医生！', 88, 71, '1460248853490', 5);
INSERT INTO `ddys_comment` VALUES (1139, '感谢医生！', 7, 73, '1495370587713', 5);
INSERT INTO `ddys_comment` VALUES (1140, '感谢医生！', 44, 64, '1558233091881', 5);
INSERT INTO `ddys_comment` VALUES (1141, '感谢医生！', 5, 69, '1423976924247', 5);
INSERT INTO `ddys_comment` VALUES (1142, '感谢医生！', 23, 75, '1547116407574', 5);
INSERT INTO `ddys_comment` VALUES (1143, '感谢医生！', 65, 78, '1595367176726', 5);
INSERT INTO `ddys_comment` VALUES (1144, '感谢医生！', 59, 66, '1579606840634', 5);
INSERT INTO `ddys_comment` VALUES (1145, '感谢医生！', 28, 61, '1541155284758', 5);
INSERT INTO `ddys_comment` VALUES (1146, '感谢医生！', 89, 80, '1606022885144', 5);
INSERT INTO `ddys_comment` VALUES (1147, '感谢医生！', 24, 72, '1507353390059', 5);
INSERT INTO `ddys_comment` VALUES (1148, '感谢医生！', 7, 76, '1594791793642', 5);
INSERT INTO `ddys_comment` VALUES (1149, '感谢医生！', 11, 82, '1458618096990', 5);
INSERT INTO `ddys_comment` VALUES (1150, '感谢医生！', 85, 81, '1557812015194', 5);
INSERT INTO `ddys_comment` VALUES (1151, '感谢医生！', 66, 77, '1533694059911', 5);
INSERT INTO `ddys_comment` VALUES (1152, '感谢医生！', 76, 83, '1590136515398', 5);
INSERT INTO `ddys_comment` VALUES (1153, '感谢医生！', 85, 79, '1541642312398', 5);
INSERT INTO `ddys_comment` VALUES (1154, '感谢医生！', 21, 85, '1604239666690', 5);
INSERT INTO `ddys_comment` VALUES (1155, '感谢医生！', 66, 88, '1577024464952', 5);
INSERT INTO `ddys_comment` VALUES (1156, '感谢医生！', 10, 86, '1558484232426', 5);
INSERT INTO `ddys_comment` VALUES (1157, '感谢医生！', 13, 90, '1452786634402', 5);
INSERT INTO `ddys_comment` VALUES (1158, '感谢医生！', 39, 84, '1423471781722', 5);
INSERT INTO `ddys_comment` VALUES (1159, '感谢医生！', 55, 91, '1571738396862', 5);
INSERT INTO `ddys_comment` VALUES (1160, '感谢医生！', 11, 93, '1447162284586', 5);
INSERT INTO `ddys_comment` VALUES (1161, '感谢医生！', 9, 87, '1520371888060', 5);
INSERT INTO `ddys_comment` VALUES (1162, '感谢医生！', 1, 95, '1453957647146', 5);
INSERT INTO `ddys_comment` VALUES (1163, '感谢医生！', 65, 74, '1543565218483', 5);
INSERT INTO `ddys_comment` VALUES (1164, '感谢医生！', 46, 89, '1426239880194', 5);
INSERT INTO `ddys_comment` VALUES (1165, '感谢医生！', 51, 99, '1458783034169', 5);
INSERT INTO `ddys_comment` VALUES (1166, '感谢医生！', 64, 94, '1443580659891', 5);
INSERT INTO `ddys_comment` VALUES (1167, '感谢医生！', 60, 92, '1495266079729', 5);
INSERT INTO `ddys_comment` VALUES (1168, '感谢医生！', 68, 98, '1574667339200', 5);
INSERT INTO `ddys_comment` VALUES (1169, '感谢医生！', 85, 100, '1562992642455', 5);
INSERT INTO `ddys_comment` VALUES (1170, '感谢医生！', 65, 96, '1517937518773', 5);
INSERT INTO `ddys_comment` VALUES (1171, '感谢医生！', 73, 97, '1497936832266', 5);
INSERT INTO `ddys_comment` VALUES (1172, '感谢医生！', 75, 70, '1466458528303', 5);
INSERT INTO `ddys_comment` VALUES (1173, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 23, 1, '1594779024525', 5);
INSERT INTO `ddys_comment` VALUES (1174, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 89, 2, '1608289454769', 5);
INSERT INTO `ddys_comment` VALUES (1175, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 2, 3, '1509453397948', 5);
INSERT INTO `ddys_comment` VALUES (1176, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 27, 4, '1497619563091', 5);
INSERT INTO `ddys_comment` VALUES (1177, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 45, 5, '1498273373354', 5);
INSERT INTO `ddys_comment` VALUES (1178, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 60, 6, '1445008746482', 5);
INSERT INTO `ddys_comment` VALUES (1179, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 66, 7, '1604645591428', 5);
INSERT INTO `ddys_comment` VALUES (1180, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 21, 9, '1475304290708', 5);
INSERT INTO `ddys_comment` VALUES (1181, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 98, 8, '1576253696760', 5);
INSERT INTO `ddys_comment` VALUES (1182, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 95, 10, '1554765754381', 5);
INSERT INTO `ddys_comment` VALUES (1183, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 73, 11, '1478038097281', 5);
INSERT INTO `ddys_comment` VALUES (1184, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 60, 12, '1429463566473', 5);
INSERT INTO `ddys_comment` VALUES (1185, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 33, 20, '1584487662027', 5);
INSERT INTO `ddys_comment` VALUES (1186, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 48, 13, '1561958324164', 5);
INSERT INTO `ddys_comment` VALUES (1187, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 5, 17, '1497519625490', 5);
INSERT INTO `ddys_comment` VALUES (1188, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 87, 22, '1442562148595', 5);
INSERT INTO `ddys_comment` VALUES (1189, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 73, 21, '1597922944753', 5);
INSERT INTO `ddys_comment` VALUES (1190, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 45, 19, '1517647734138', 5);
INSERT INTO `ddys_comment` VALUES (1191, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 86, 24, '1521957694650', 5);
INSERT INTO `ddys_comment` VALUES (1192, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 90, 25, '1474349708913', 5);
INSERT INTO `ddys_comment` VALUES (1193, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 15, 26, '1505207452170', 5);
INSERT INTO `ddys_comment` VALUES (1194, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 39, 16, '1582128082979', 5);
INSERT INTO `ddys_comment` VALUES (1195, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 43, 28, '1445490339464', 5);
INSERT INTO `ddys_comment` VALUES (1196, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 86, 15, '1542885806841', 5);
INSERT INTO `ddys_comment` VALUES (1197, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 34, 23, '1430268947458', 5);
INSERT INTO `ddys_comment` VALUES (1198, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 59, 30, '1598937031845', 5);
INSERT INTO `ddys_comment` VALUES (1199, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 51, 18, '1600619055876', 5);
INSERT INTO `ddys_comment` VALUES (1200, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 98, 34, '1532377815245', 5);
INSERT INTO `ddys_comment` VALUES (1201, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 33, 32, '1493573835517', 5);
INSERT INTO `ddys_comment` VALUES (1202, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 8, 14, '1600265920835', 5);
INSERT INTO `ddys_comment` VALUES (1203, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 89, 27, '1484671544520', 5);
INSERT INTO `ddys_comment` VALUES (1204, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 35, 37, '1603474530560', 5);
INSERT INTO `ddys_comment` VALUES (1205, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 96, 36, '1462828650766', 5);
INSERT INTO `ddys_comment` VALUES (1206, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 94, 29, '1463509532724', 5);
INSERT INTO `ddys_comment` VALUES (1207, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 1, 31, '1588972878239', 5);
INSERT INTO `ddys_comment` VALUES (1208, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 90, 39, '1549824538974', 5);
INSERT INTO `ddys_comment` VALUES (1209, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 17, 33, '1463889599581', 5);
INSERT INTO `ddys_comment` VALUES (1210, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 23, 38, '1606012788227', 5);
INSERT INTO `ddys_comment` VALUES (1211, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 88, 40, '1431448211529', 5);
INSERT INTO `ddys_comment` VALUES (1212, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 72, 41, '1474060583248', 5);
INSERT INTO `ddys_comment` VALUES (1213, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 72, 35, '1586542377815', 5);
INSERT INTO `ddys_comment` VALUES (1214, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 4, 43, '1471162784701', 5);
INSERT INTO `ddys_comment` VALUES (1215, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 60, 42, '1553907573975', 5);
INSERT INTO `ddys_comment` VALUES (1216, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 55, 45, '1533188611863', 5);
INSERT INTO `ddys_comment` VALUES (1217, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 21, 44, '1570730852615', 5);
INSERT INTO `ddys_comment` VALUES (1218, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 81, 51, '1598411010192', 5);
INSERT INTO `ddys_comment` VALUES (1219, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 29, 48, '1606081706229', 5);
INSERT INTO `ddys_comment` VALUES (1220, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 1, 47, '1450622065213', 5);
INSERT INTO `ddys_comment` VALUES (1221, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 90, 46, '1553239050085', 5);
INSERT INTO `ddys_comment` VALUES (1222, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 55, 50, '1430407742186', 5);
INSERT INTO `ddys_comment` VALUES (1223, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 60, 49, '1451848618800', 5);
INSERT INTO `ddys_comment` VALUES (1224, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 56, 52, '1487590299684', 5);
INSERT INTO `ddys_comment` VALUES (1225, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 44, 53, '1561770477970', 5);
INSERT INTO `ddys_comment` VALUES (1226, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 75, 61, '1458069791535', 5);
INSERT INTO `ddys_comment` VALUES (1227, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 52, 58, '1545806700354', 5);
INSERT INTO `ddys_comment` VALUES (1228, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 64, 56, '1481175442093', 5);
INSERT INTO `ddys_comment` VALUES (1229, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 6, 55, '1568163413311', 5);
INSERT INTO `ddys_comment` VALUES (1230, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 35, 60, '1579050279640', 5);
INSERT INTO `ddys_comment` VALUES (1231, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 13, 57, '1430992847813', 5);
INSERT INTO `ddys_comment` VALUES (1232, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 51, 59, '1556527883857', 5);
INSERT INTO `ddys_comment` VALUES (1233, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 19, 54, '1436361258423', 5);
INSERT INTO `ddys_comment` VALUES (1234, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 52, 63, '1491825300710', 5);
INSERT INTO `ddys_comment` VALUES (1235, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 23, 62, '1487111436859', 5);
INSERT INTO `ddys_comment` VALUES (1236, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 41, 64, '1568897571233', 5);
INSERT INTO `ddys_comment` VALUES (1237, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 23, 72, '1532236826538', 5);
INSERT INTO `ddys_comment` VALUES (1238, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 79, 68, '1509772220761', 5);
INSERT INTO `ddys_comment` VALUES (1239, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 11, 65, '1594870014170', 5);
INSERT INTO `ddys_comment` VALUES (1240, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 55, 70, '1496788961692', 5);
INSERT INTO `ddys_comment` VALUES (1241, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 30, 69, '1550701039352', 5);
INSERT INTO `ddys_comment` VALUES (1242, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 42, 66, '1529733589677', 5);
INSERT INTO `ddys_comment` VALUES (1243, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 97, 67, '1455712667009', 5);
INSERT INTO `ddys_comment` VALUES (1244, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 16, 71, '1424980692667', 5);
INSERT INTO `ddys_comment` VALUES (1245, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 30, 73, '1581533533122', 5);
INSERT INTO `ddys_comment` VALUES (1246, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 10, 74, '1489210970420', 5);
INSERT INTO `ddys_comment` VALUES (1247, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 16, 75, '1523128022044', 5);
INSERT INTO `ddys_comment` VALUES (1248, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 58, 76, '1429794805015', 5);
INSERT INTO `ddys_comment` VALUES (1249, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 30, 81, '1588199964461', 5);
INSERT INTO `ddys_comment` VALUES (1250, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 84, 82, '1515806675594', 5);
INSERT INTO `ddys_comment` VALUES (1251, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 37, 77, '1471789580488', 5);
INSERT INTO `ddys_comment` VALUES (1252, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 85, 80, '1513739598518', 5);
INSERT INTO `ddys_comment` VALUES (1253, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 13, 78, '1528519463694', 5);
INSERT INTO `ddys_comment` VALUES (1254, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 61, 79, '1586949675667', 5);
INSERT INTO `ddys_comment` VALUES (1255, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 99, 83, '1500655616844', 5);
INSERT INTO `ddys_comment` VALUES (1256, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 7, 84, '1480509915696', 5);
INSERT INTO `ddys_comment` VALUES (1257, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 56, 93, '1562759419550', 5);
INSERT INTO `ddys_comment` VALUES (1258, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 81, 90, '1469809149704', 5);
INSERT INTO `ddys_comment` VALUES (1259, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 31, 92, '1498593840654', 5);
INSERT INTO `ddys_comment` VALUES (1260, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 64, 88, '1523437610041', 5);
INSERT INTO `ddys_comment` VALUES (1261, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 47, 86, '1526527602807', 5);
INSERT INTO `ddys_comment` VALUES (1262, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 2, 91, '1607457961605', 5);
INSERT INTO `ddys_comment` VALUES (1263, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 67, 85, '1587231708598', 5);
INSERT INTO `ddys_comment` VALUES (1264, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 91, 89, '1609038776161', 5);
INSERT INTO `ddys_comment` VALUES (1265, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 8, 87, '1520776611023', 5);
INSERT INTO `ddys_comment` VALUES (1266, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 18, 94, '1469643200664', 5);
INSERT INTO `ddys_comment` VALUES (1267, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 67, 95, '1587842914129', 5);
INSERT INTO `ddys_comment` VALUES (1268, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 66, 96, '1489328427603', 5);
INSERT INTO `ddys_comment` VALUES (1269, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 97, 98, '1448968369871', 5);
INSERT INTO `ddys_comment` VALUES (1270, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 38, 99, '1609844407966', 5);
INSERT INTO `ddys_comment` VALUES (1271, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 28, 97, '1443645308446', 5);
INSERT INTO `ddys_comment` VALUES (1272, '医生特别有耐心，而且真的很专业，很有经验，根据熊医生的指导治疗，老公的腰很快好了，真的非常感谢', 11, 100, '1427866006726', 5);
INSERT INTO `ddys_comment` VALUES (1273, '医生讲解的很到位，解答也很有耐心，五星好评！', 20, 1, '1571618906017', 5);
INSERT INTO `ddys_comment` VALUES (1274, '医生讲解的很到位，解答也很有耐心，五星好评！', 90, 2, '1567640454083', 5);
INSERT INTO `ddys_comment` VALUES (1275, '医生讲解的很到位，解答也很有耐心，五星好评！', 74, 3, '1448389154540', 5);
INSERT INTO `ddys_comment` VALUES (1276, '医生讲解的很到位，解答也很有耐心，五星好评！', 51, 4, '1511603103806', 5);
INSERT INTO `ddys_comment` VALUES (1277, '医生讲解的很到位，解答也很有耐心，五星好评！', 81, 5, '1521545495065', 5);
INSERT INTO `ddys_comment` VALUES (1278, '医生讲解的很到位，解答也很有耐心，五星好评！', 82, 6, '1432495975813', 5);
INSERT INTO `ddys_comment` VALUES (1279, '医生讲解的很到位，解答也很有耐心，五星好评！', 53, 7, '1474698217894', 5);
INSERT INTO `ddys_comment` VALUES (1280, '医生讲解的很到位，解答也很有耐心，五星好评！', 40, 8, '1575183952867', 5);
INSERT INTO `ddys_comment` VALUES (1281, '医生讲解的很到位，解答也很有耐心，五星好评！', 11, 9, '1474023823288', 5);
INSERT INTO `ddys_comment` VALUES (1282, '医生讲解的很到位，解答也很有耐心，五星好评！', 38, 10, '1450751684367', 5);
INSERT INTO `ddys_comment` VALUES (1283, '医生讲解的很到位，解答也很有耐心，五星好评！', 92, 11, '1578056249093', 5);
INSERT INTO `ddys_comment` VALUES (1284, '医生讲解的很到位，解答也很有耐心，五星好评！', 34, 20, '1562468958577', 5);
INSERT INTO `ddys_comment` VALUES (1285, '医生讲解的很到位，解答也很有耐心，五星好评！', 7, 12, '1560176566908', 5);
INSERT INTO `ddys_comment` VALUES (1286, '医生讲解的很到位，解答也很有耐心，五星好评！', 72, 18, '1531072426366', 5);
INSERT INTO `ddys_comment` VALUES (1287, '医生讲解的很到位，解答也很有耐心，五星好评！', 41, 13, '1474003716129', 5);
INSERT INTO `ddys_comment` VALUES (1288, '医生讲解的很到位，解答也很有耐心，五星好评！', 25, 19, '1558379194362', 5);
INSERT INTO `ddys_comment` VALUES (1289, '医生讲解的很到位，解答也很有耐心，五星好评！', 98, 15, '1465174281568', 5);
INSERT INTO `ddys_comment` VALUES (1290, '医生讲解的很到位，解答也很有耐心，五星好评！', 74, 17, '1542833784983', 5);
INSERT INTO `ddys_comment` VALUES (1291, '医生讲解的很到位，解答也很有耐心，五星好评！', 31, 16, '1543950867110', 5);
INSERT INTO `ddys_comment` VALUES (1292, '医生讲解的很到位，解答也很有耐心，五星好评！', 60, 14, '1583875997091', 5);
INSERT INTO `ddys_comment` VALUES (1293, '医生讲解的很到位，解答也很有耐心，五星好评！', 19, 21, '1482029925106', 5);
INSERT INTO `ddys_comment` VALUES (1294, '医生讲解的很到位，解答也很有耐心，五星好评！', 12, 24, '1531967743644', 5);
INSERT INTO `ddys_comment` VALUES (1295, '医生讲解的很到位，解答也很有耐心，五星好评！', 88, 23, '1579979341341', 5);
INSERT INTO `ddys_comment` VALUES (1296, '医生讲解的很到位，解答也很有耐心，五星好评！', 58, 22, '1572579699806', 5);
INSERT INTO `ddys_comment` VALUES (1297, '医生讲解的很到位，解答也很有耐心，五星好评！', 7, 28, '1467292161981', 5);
INSERT INTO `ddys_comment` VALUES (1298, '医生讲解的很到位，解答也很有耐心，五星好评！', 73, 27, '1587506647420', 5);
INSERT INTO `ddys_comment` VALUES (1299, '医生讲解的很到位，解答也很有耐心，五星好评！', 68, 29, '1441459641335', 5);
INSERT INTO `ddys_comment` VALUES (1300, '医生讲解的很到位，解答也很有耐心，五星好评！', 60, 26, '1493312584781', 5);
INSERT INTO `ddys_comment` VALUES (1301, '医生讲解的很到位，解答也很有耐心，五星好评！', 43, 31, '1439969367394', 5);
INSERT INTO `ddys_comment` VALUES (1302, '医生讲解的很到位，解答也很有耐心，五星好评！', 42, 25, '1529289212283', 5);
INSERT INTO `ddys_comment` VALUES (1303, '医生讲解的很到位，解答也很有耐心，五星好评！', 35, 30, '1610732459677', 5);
INSERT INTO `ddys_comment` VALUES (1304, '医生讲解的很到位，解答也很有耐心，五星好评！', 44, 32, '1481343869278', 5);
INSERT INTO `ddys_comment` VALUES (1305, '医生讲解的很到位，解答也很有耐心，五星好评！', 67, 34, '1442452089372', 5);
INSERT INTO `ddys_comment` VALUES (1306, '医生讲解的很到位，解答也很有耐心，五星好评！', 7, 33, '1561994847441', 5);
INSERT INTO `ddys_comment` VALUES (1307, '医生讲解的很到位，解答也很有耐心，五星好评！', 13, 37, '1458560553894', 5);
INSERT INTO `ddys_comment` VALUES (1308, '医生讲解的很到位，解答也很有耐心，五星好评！', 51, 39, '1472823080453', 5);
INSERT INTO `ddys_comment` VALUES (1309, '医生讲解的很到位，解答也很有耐心，五星好评！', 50, 35, '1597334281894', 5);
INSERT INTO `ddys_comment` VALUES (1310, '医生讲解的很到位，解答也很有耐心，五星好评！', 91, 41, '1428401542076', 5);
INSERT INTO `ddys_comment` VALUES (1311, '医生讲解的很到位，解答也很有耐心，五星好评！', 23, 36, '1598754913845', 5);
INSERT INTO `ddys_comment` VALUES (1312, '医生讲解的很到位，解答也很有耐心，五星好评！', 42, 38, '1462755514401', 5);
INSERT INTO `ddys_comment` VALUES (1313, '医生讲解的很到位，解答也很有耐心，五星好评！', 72, 40, '1476356395340', 5);
INSERT INTO `ddys_comment` VALUES (1314, '医生讲解的很到位，解答也很有耐心，五星好评！', 79, 42, '1507234599172', 5);
INSERT INTO `ddys_comment` VALUES (1315, '医生讲解的很到位，解答也很有耐心，五星好评！', 21, 43, '1555286608637', 5);
INSERT INTO `ddys_comment` VALUES (1316, '医生讲解的很到位，解答也很有耐心，五星好评！', 48, 51, '1513623471401', 5);
INSERT INTO `ddys_comment` VALUES (1317, '医生讲解的很到位，解答也很有耐心，五星好评！', 31, 46, '1588413844692', 5);
INSERT INTO `ddys_comment` VALUES (1318, '医生讲解的很到位，解答也很有耐心，五星好评！', 24, 52, '1440155247251', 5);
INSERT INTO `ddys_comment` VALUES (1319, '医生讲解的很到位，解答也很有耐心，五星好评！', 2, 49, '1523396729281', 5);
INSERT INTO `ddys_comment` VALUES (1320, '医生讲解的很到位，解答也很有耐心，五星好评！', 54, 45, '1436923386949', 5);
INSERT INTO `ddys_comment` VALUES (1321, '医生讲解的很到位，解答也很有耐心，五星好评！', 14, 53, '1528674453334', 5);
INSERT INTO `ddys_comment` VALUES (1322, '医生讲解的很到位，解答也很有耐心，五星好评！', 26, 50, '1532307690628', 5);
INSERT INTO `ddys_comment` VALUES (1323, '医生讲解的很到位，解答也很有耐心，五星好评！', 50, 55, '1555499838503', 5);
INSERT INTO `ddys_comment` VALUES (1324, '医生讲解的很到位，解答也很有耐心，五星好评！', 98, 57, '1586632119605', 5);
INSERT INTO `ddys_comment` VALUES (1325, '医生讲解的很到位，解答也很有耐心，五星好评！', 47, 44, '1539572180217', 5);
INSERT INTO `ddys_comment` VALUES (1326, '医生讲解的很到位，解答也很有耐心，五星好评！', 80, 47, '1460529486611', 5);
INSERT INTO `ddys_comment` VALUES (1327, '医生讲解的很到位，解答也很有耐心，五星好评！', 69, 59, '1600965309003', 5);
INSERT INTO `ddys_comment` VALUES (1328, '医生讲解的很到位，解答也很有耐心，五星好评！', 18, 61, '1425735727038', 5);
INSERT INTO `ddys_comment` VALUES (1329, '医生讲解的很到位，解答也很有耐心，五星好评！', 80, 54, '1537581543682', 5);
INSERT INTO `ddys_comment` VALUES (1330, '医生讲解的很到位，解答也很有耐心，五星好评！', 80, 58, '1598611090619', 5);
INSERT INTO `ddys_comment` VALUES (1331, '医生讲解的很到位，解答也很有耐心，五星好评！', 89, 63, '1512238291279', 5);
INSERT INTO `ddys_comment` VALUES (1332, '医生讲解的很到位，解答也很有耐心，五星好评！', 54, 48, '1479948259076', 5);
INSERT INTO `ddys_comment` VALUES (1333, '医生讲解的很到位，解答也很有耐心，五星好评！', 92, 67, '1428277718999', 5);
INSERT INTO `ddys_comment` VALUES (1334, '医生讲解的很到位，解答也很有耐心，五星好评！', 40, 64, '1609443284353', 5);
INSERT INTO `ddys_comment` VALUES (1335, '医生讲解的很到位，解答也很有耐心，五星好评！', 89, 62, '1499049462623', 5);
INSERT INTO `ddys_comment` VALUES (1336, '医生讲解的很到位，解答也很有耐心，五星好评！', 60, 69, '1501921523808', 5);
INSERT INTO `ddys_comment` VALUES (1337, '医生讲解的很到位，解答也很有耐心，五星好评！', 5, 68, '1442234497254', 5);
INSERT INTO `ddys_comment` VALUES (1338, '医生讲解的很到位，解答也很有耐心，五星好评！', 26, 56, '1422741661936', 5);
INSERT INTO `ddys_comment` VALUES (1339, '医生讲解的很到位，解答也很有耐心，五星好评！', 28, 66, '1599126513896', 5);
INSERT INTO `ddys_comment` VALUES (1340, '医生讲解的很到位，解答也很有耐心，五星好评！', 3, 73, '1515149334745', 5);
INSERT INTO `ddys_comment` VALUES (1341, '医生讲解的很到位，解答也很有耐心，五星好评！', 16, 65, '1553610027390', 5);
INSERT INTO `ddys_comment` VALUES (1342, '医生讲解的很到位，解答也很有耐心，五星好评！', 38, 60, '1588435601995', 5);
INSERT INTO `ddys_comment` VALUES (1343, '医生讲解的很到位，解答也很有耐心，五星好评！', 55, 72, '1439249774353', 5);
INSERT INTO `ddys_comment` VALUES (1344, '医生讲解的很到位，解答也很有耐心，五星好评！', 76, 76, '1451944358865', 5);
INSERT INTO `ddys_comment` VALUES (1345, '医生讲解的很到位，解答也很有耐心，五星好评！', 51, 75, '1431122186957', 5);
INSERT INTO `ddys_comment` VALUES (1346, '医生讲解的很到位，解答也很有耐心，五星好评！', 59, 71, '1565235550396', 5);
INSERT INTO `ddys_comment` VALUES (1347, '医生讲解的很到位，解答也很有耐心，五星好评！', 20, 74, '1485681222207', 5);
INSERT INTO `ddys_comment` VALUES (1348, '医生讲解的很到位，解答也很有耐心，五星好评！', 42, 77, '1453518762141', 5);
INSERT INTO `ddys_comment` VALUES (1349, '医生讲解的很到位，解答也很有耐心，五星好评！', 41, 84, '1434647666333', 5);
INSERT INTO `ddys_comment` VALUES (1350, '医生讲解的很到位，解答也很有耐心，五星好评！', 77, 85, '1447412072220', 5);
INSERT INTO `ddys_comment` VALUES (1351, '医生讲解的很到位，解答也很有耐心，五星好评！', 9, 70, '1430551711166', 5);
INSERT INTO `ddys_comment` VALUES (1352, '医生讲解的很到位，解答也很有耐心，五星好评！', 21, 86, '1575267511996', 5);
INSERT INTO `ddys_comment` VALUES (1353, '医生讲解的很到位，解答也很有耐心，五星好评！', 94, 82, '1535914332857', 5);
INSERT INTO `ddys_comment` VALUES (1354, '医生讲解的很到位，解答也很有耐心，五星好评！', 3, 87, '1535360534179', 5);
INSERT INTO `ddys_comment` VALUES (1355, '医生讲解的很到位，解答也很有耐心，五星好评！', 6, 78, '1520535097634', 5);
INSERT INTO `ddys_comment` VALUES (1356, '医生讲解的很到位，解答也很有耐心，五星好评！', 98, 83, '1523592756741', 5);
INSERT INTO `ddys_comment` VALUES (1357, '医生讲解的很到位，解答也很有耐心，五星好评！', 23, 89, '1494648046688', 5);
INSERT INTO `ddys_comment` VALUES (1358, '医生讲解的很到位，解答也很有耐心，五星好评！', 88, 88, '1551691834408', 5);
INSERT INTO `ddys_comment` VALUES (1359, '医生讲解的很到位，解答也很有耐心，五星好评！', 22, 80, '1556588879573', 5);
INSERT INTO `ddys_comment` VALUES (1360, '医生讲解的很到位，解答也很有耐心，五星好评！', 59, 90, '1457531925683', 5);
INSERT INTO `ddys_comment` VALUES (1361, '医生讲解的很到位，解答也很有耐心，五星好评！', 66, 79, '1607110840611', 5);
INSERT INTO `ddys_comment` VALUES (1362, '医生讲解的很到位，解答也很有耐心，五星好评！', 22, 92, '1447591647497', 5);
INSERT INTO `ddys_comment` VALUES (1363, '医生讲解的很到位，解答也很有耐心，五星好评！', 99, 95, '1582148092428', 5);
INSERT INTO `ddys_comment` VALUES (1364, '医生讲解的很到位，解答也很有耐心，五星好评！', 61, 99, '1577356584592', 5);
INSERT INTO `ddys_comment` VALUES (1365, '医生讲解的很到位，解答也很有耐心，五星好评！', 1, 93, '1587388333740', 5);
INSERT INTO `ddys_comment` VALUES (1366, '医生讲解的很到位，解答也很有耐心，五星好评！', 87, 97, '1421915236328', 5);
INSERT INTO `ddys_comment` VALUES (1367, '医生讲解的很到位，解答也很有耐心，五星好评！', 40, 98, '1505950274485', 5);
INSERT INTO `ddys_comment` VALUES (1368, '医生讲解的很到位，解答也很有耐心，五星好评！', 47, 94, '1484283294308', 5);
INSERT INTO `ddys_comment` VALUES (1369, '医生讲解的很到位，解答也很有耐心，五星好评！', 54, 96, '1458483745910', 5);
INSERT INTO `ddys_comment` VALUES (1370, '医生讲解的很到位，解答也很有耐心，五星好评！', 1, 100, '1427173604690', 5);
INSERT INTO `ddys_comment` VALUES (1371, '医生讲解的很到位，解答也很有耐心，五星好评！', 19, 81, '1462734994225', 5);
INSERT INTO `ddys_comment` VALUES (1372, '医生讲解的很到位，解答也很有耐心，五星好评！', 49, 91, '1451582842226', 5);

-- ----------------------------
-- Table structure for ddys_disease
-- ----------------------------
DROP TABLE IF EXISTS `ddys_disease`;
CREATE TABLE `ddys_disease`  (
  `disease_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '疾病名称',
  `office_id` int NOT NULL COMMENT '科室id',
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '疾病介绍',
  PRIMARY KEY (`disease_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_disease
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_doctor
-- ----------------------------
DROP TABLE IF EXISTS `ddys_doctor`;
CREATE TABLE `ddys_doctor`  (
  `dcotor_id` int NOT NULL AUTO_INCREMENT COMMENT '医生id',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生姓名',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生头像',
  `office_id` int NOT NULL COMMENT '科室id',
  `level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生职称',
  `hospital_id` int NOT NULL COMMENT '所属医院',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '擅长方向',
  `experience_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执业经历',
  `experience_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学术经历',
  `experience_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业资历',
  `ask_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '问答价格',
  PRIMARY KEY (`dcotor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
  `hospital_id` int NOT NULL AUTO_INCREMENT COMMENT '医院id',
  `hospitalname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医院名称',
  `hospitallevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医院等级(1-3)',
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纬度',
  `descrition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '介绍',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `city_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属市id',
  PRIMARY KEY (`hospital_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_hospital
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_office
-- ----------------------------
DROP TABLE IF EXISTS `ddys_office`;
CREATE TABLE `ddys_office`  (
  `office_id` int NOT NULL AUTO_INCREMENT COMMENT '科室id',
  `office_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室名称',
  PRIMARY KEY (`office_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_office
-- ----------------------------
INSERT INTO `ddys_office` VALUES (1, '皮肤科');
INSERT INTO `ddys_office` VALUES (2, '儿科');
INSERT INTO `ddys_office` VALUES (3, '妇科');
INSERT INTO `ddys_office` VALUES (4, '产科');
INSERT INTO `ddys_office` VALUES (5, '泌尿外科');
INSERT INTO `ddys_office` VALUES (6, '骨科');
INSERT INTO `ddys_office` VALUES (7, '消化内科');
INSERT INTO `ddys_office` VALUES (8, '空腔科');
INSERT INTO `ddys_office` VALUES (9, '耳鼻咽喉科');
INSERT INTO `ddys_office` VALUES (10, '眼科');
INSERT INTO `ddys_office` VALUES (11, '呼吸内科');
INSERT INTO `ddys_office` VALUES (12, '普通内科');
INSERT INTO `ddys_office` VALUES (13, '感染科传染科');
INSERT INTO `ddys_office` VALUES (14, '内分泌科');
INSERT INTO `ddys_office` VALUES (15, '心血管内科');
INSERT INTO `ddys_office` VALUES (16, '神经内科');
INSERT INTO `ddys_office` VALUES (17, '肾脏内科');
INSERT INTO `ddys_office` VALUES (18, '风湿免疫科');
INSERT INTO `ddys_office` VALUES (19, '血液科');
INSERT INTO `ddys_office` VALUES (20, '神经外科');
INSERT INTO `ddys_office` VALUES (21, '心胸外科');
INSERT INTO `ddys_office` VALUES (22, '肝胆胰腺外科');
INSERT INTO `ddys_office` VALUES (23, '甲状腺乳腺外科');
INSERT INTO `ddys_office` VALUES (24, '普外科');
INSERT INTO `ddys_office` VALUES (25, '美容整形科');

-- ----------------------------
-- Table structure for ddys_order
-- ----------------------------
DROP TABLE IF EXISTS `ddys_order`;
CREATE TABLE `ddys_order`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `patient_id` int NOT NULL,
  `office_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ddys_order
-- ----------------------------
INSERT INTO `ddys_order` VALUES (1, 1, 1, 3);
INSERT INTO `ddys_order` VALUES (2, 1, 2, 3);

-- ----------------------------
-- Table structure for ddys_patient
-- ----------------------------
DROP TABLE IF EXISTS `ddys_patient`;
CREATE TABLE `ddys_patient`  (
  `patient_id` int NOT NULL AUTO_INCREMENT COMMENT '患者id',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `sex` int NOT NULL COMMENT '性别（1：男，2：女）',
  `brithday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生日',
  `weight` int NOT NULL COMMENT '体重',
  `allergy` int NOT NULL COMMENT '有无过敏史（1：无，2：有）',
  `allergy_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过敏史描述',
  `history` int NOT NULL COMMENT '有无过往病史（1：无，2：有）',
  `history_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过往病史描述',
  `liver` int NOT NULL COMMENT '肝功能（1：正常，2：异常）',
  `kidney` int NOT NULL COMMENT '肾功能（1：正常，2：异常）',
  `inoculation` int NULL DEFAULT NULL COMMENT '孕育情况（1：无，2：怀孕中，3：哺乳中）',
  `user_id` int NULL DEFAULT NULL COMMENT '所属用户id',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_patient
-- ----------------------------
INSERT INTO `ddys_patient` VALUES (1, '弗兰克', 1, '1993-11-08', 45, 1, '无', 1, '无', 1, 1, 1, 1, 32);
INSERT INTO `ddys_patient` VALUES (2, '王小明', 1, '1995-05-06', 60, 1, '无', 1, '无', 1, 1, 0, 1, 26);

-- ----------------------------
-- Table structure for ddys_province
-- ----------------------------
DROP TABLE IF EXISTS `ddys_province`;
CREATE TABLE `ddys_province`  (
  `province_id` int NOT NULL AUTO_INCREMENT,
  `province_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`province_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_province
-- ----------------------------

-- ----------------------------
-- Table structure for ddys_question
-- ----------------------------
DROP TABLE IF EXISTS `ddys_question`;
CREATE TABLE `ddys_question`  (
  `question_id` int NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `create_at` int NOT NULL COMMENT '创建时间',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `watched` int NOT NULL COMMENT '几人看过',
  `user_id` int NOT NULL COMMENT '提问用户',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_question
-- ----------------------------
INSERT INTO `ddys_question` VALUES (1, 1516165, '轻微的群多', 4, 5);

-- ----------------------------
-- Table structure for ddys_symptom
-- ----------------------------
DROP TABLE IF EXISTS `ddys_symptom`;
CREATE TABLE `ddys_symptom`  (
  `symptom_id` int NOT NULL AUTO_INCREMENT COMMENT '症状id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '症状描述',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '症状图片',
  `user_id` int NULL DEFAULT NULL COMMENT '所属患者id',
  `create_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`symptom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_symptom
-- ----------------------------
INSERT INTO `ddys_symptom` VALUES (2, '肚子痛，一直拉肚子，不知道怎么了', '', 1, '1610723860000');
INSERT INTO `ddys_symptom` VALUES (12, '肚子疼，头晕，睡不着，难受', '322c7c60-57b7-11eb-b6d3-d18fba8bdd96.jpg,322cf190-57b7-11eb-b6d3-d18fba8bdd96.jpg', 1, '1610772989000');
INSERT INTO `ddys_symptom` VALUES (13, '牙齿遇冷热一碰都疼，吃不了东西，怎么办？', '', 1, '1610797620000');
INSERT INTO `ddys_symptom` VALUES (14, '小孩子咳嗽为什么出汗就咳嗽 是风寒咳嗽 还是风热咳嗽', '0578f3c0-57fc-11eb-b3c2-5d073fe40edb.jpg,057bb2e0-57fc-11eb-b3c2-5d073fe40edb.jpg,057bd9f0-57fc-11eb-b3c2-5d073fe40edb.jpg', 1, '1610802549000');

-- ----------------------------
-- Table structure for ddys_user
-- ----------------------------
DROP TABLE IF EXISTS `ddys_user`;
CREATE TABLE `ddys_user`  (
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ddys_user
-- ----------------------------
INSERT INTO `ddys_user` VALUES ('你是猪吧丶', 1, '18758230264', '90a1693fbc726cd84731a03267f60665', '20201223143127.jpg');

SET FOREIGN_KEY_CHECKS = 1;
