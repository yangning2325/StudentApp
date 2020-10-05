/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-10-05 10:36:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adm_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `admName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`adm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1000', '123', '二哈');
INSERT INTO `admin` VALUES ('2', '1001', '123', '李文');
INSERT INTO `admin` VALUES ('3', '1002', '123', '王丽');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `gradeName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `className` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '一年级', '1班');
INSERT INTO `class` VALUES ('2', '一年级', '2班');
INSERT INTO `class` VALUES ('3', '一年级', '3班');

-- ----------------------------
-- Table structure for course_table
-- ----------------------------
DROP TABLE IF EXISTS `course_table`;
CREATE TABLE `course_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `one` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `two` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `three` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `four` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `noon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `five` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `six` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `seven` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pm` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `classNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_table_ibfk_1` (`classNum`),
  CONSTRAINT `course_table_ibfk_1` FOREIGN KEY (`classNum`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of course_table
-- ----------------------------
INSERT INTO `course_table` VALUES ('1', '周一', '语文', '数学', '英语', '语文', '午休', '音乐', '政治', '语文', '晚休', '1');
INSERT INTO `course_table` VALUES ('2', '周二', '数学', '语文', '体育', '数学', '午休', '语文', '英语', '数学', '晚休', '1');
INSERT INTO `course_table` VALUES ('3', '周三', '英语', '音乐', '数学', '美术', '午休', '数学', '语文', '体育', '晚休', '1');
INSERT INTO `course_table` VALUES ('4', '周四', '语文', '数学', '英语', '语文', '午休', '音乐', '政治', '语文', '晚休', '1');
INSERT INTO `course_table` VALUES ('5', '周五', '英语', '语文', '数学', '数学', '午休', '体育', '数学', '英语', '晚休', '1');
INSERT INTO `course_table` VALUES ('6', '周一', '数学', '数学', '语文', '政治', '午休', '英语', '语文', '数学', '晚休', '2');
INSERT INTO `course_table` VALUES ('7', '周二', '语文', '数学', '英语', '语文', '午休', '英语', '英语', '美术', '晚休', '2');
INSERT INTO `course_table` VALUES ('8', '周三', '英语', '语文', '语文', '体育', '午休', '政治', '数学', '数学', '晚休', '2');
INSERT INTO `course_table` VALUES ('9', '周四', '数学', '音乐', '语文', '语文', '午休', '数学', '体育', '英语', '晚休', '2');
INSERT INTO `course_table` VALUES ('10', '周五', '语文', '数学', '音乐', '语文', '午休', '数学', '英语', '数学', '晚休', '2');
INSERT INTO `course_table` VALUES ('11', '周一', '英语', '英语', '政治', '体育', '午休', '语文', '英语', '英语', '晚休', '3');
INSERT INTO `course_table` VALUES ('12', '周二', '语文', '数学', '音乐', '语文', '午休', '英语', '数学', '语文', '晚休', '3');
INSERT INTO `course_table` VALUES ('13', '周三', '英语', '数学', '音乐', '体育', '午休', '英语', '英语', '数学', '晚休', '3');
INSERT INTO `course_table` VALUES ('14', '周四', '英语', '语文', '语文', '数学', '午休', '语文', '美术', '英语', '晚休', '3');
INSERT INTO `course_table` VALUES ('15', '周五', '数学', '英语', '数学', '政治', '午休', '语文', '语文', '数学', '晚休', '3');

-- ----------------------------
-- Table structure for esc_middle
-- ----------------------------
DROP TABLE IF EXISTS `esc_middle`;
CREATE TABLE `esc_middle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stu` (`stu_id`),
  KEY `class` (`class_id`),
  CONSTRAINT `esc_middle_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `esc_middle_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of esc_middle
-- ----------------------------
INSERT INTO `esc_middle` VALUES ('1', '1', '3');
INSERT INTO `esc_middle` VALUES ('2', '2', '2');
INSERT INTO `esc_middle` VALUES ('3', '3', '2');
INSERT INTO `esc_middle` VALUES ('4', '4', '2');
INSERT INTO `esc_middle` VALUES ('5', '5', '2');
INSERT INTO `esc_middle` VALUES ('6', '6', '3');
INSERT INTO `esc_middle` VALUES ('7', '7', '2');
INSERT INTO `esc_middle` VALUES ('8', '8', '2');
INSERT INTO `esc_middle` VALUES ('9', '9', '3');
INSERT INTO `esc_middle` VALUES ('10', '10', '2');
INSERT INTO `esc_middle` VALUES ('11', '11', '1');
INSERT INTO `esc_middle` VALUES ('12', '12', '3');
INSERT INTO `esc_middle` VALUES ('13', '13', '2');
INSERT INTO `esc_middle` VALUES ('14', '17', '1');
INSERT INTO `esc_middle` VALUES ('15', '18', '2');
INSERT INTO `esc_middle` VALUES ('16', '19', '1');
INSERT INTO `esc_middle` VALUES ('17', '20', '3');
INSERT INTO `esc_middle` VALUES ('18', '21', '1');
INSERT INTO `esc_middle` VALUES ('19', '22', '3');
INSERT INTO `esc_middle` VALUES ('20', '23', '1');
INSERT INTO `esc_middle` VALUES ('21', '24', '3');
INSERT INTO `esc_middle` VALUES ('22', '25', '2');
INSERT INTO `esc_middle` VALUES ('23', '26', '1');
INSERT INTO `esc_middle` VALUES ('24', '27', '2');
INSERT INTO `esc_middle` VALUES ('25', '28', '1');
INSERT INTO `esc_middle` VALUES ('26', '29', '3');
INSERT INTO `esc_middle` VALUES ('101', '30', '1');
INSERT INTO `esc_middle` VALUES ('102', '31', '3');

-- ----------------------------
-- Table structure for etc_middle
-- ----------------------------
DROP TABLE IF EXISTS `etc_middle`;
CREATE TABLE `etc_middle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tea_id` (`tea_id`),
  KEY `teacher_middle_ibfk_2` (`class_id`),
  CONSTRAINT `etc_middle_ibfk_1` FOREIGN KEY (`tea_id`) REFERENCES `teacher` (`tea_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `etc_middle_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of etc_middle
-- ----------------------------
INSERT INTO `etc_middle` VALUES ('2', '2', '1');
INSERT INTO `etc_middle` VALUES ('4', '4', '2');
INSERT INTO `etc_middle` VALUES ('5', '5', '2');
INSERT INTO `etc_middle` VALUES ('7', '7', '3');
INSERT INTO `etc_middle` VALUES ('8', '8', '3');
INSERT INTO `etc_middle` VALUES ('13', '1', '1');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_course` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `e_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  KEY `num` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('1', '语文', '2020-10-04T20:40', '1');
INSERT INTO `exam` VALUES ('2', '数学', '2020-10-04T20:40', '1');
INSERT INTO `exam` VALUES ('3', '英语', '2020-10-04T20:40', '1');

-- ----------------------------
-- Table structure for exam_rule
-- ----------------------------
DROP TABLE IF EXISTS `exam_rule`;
CREATE TABLE `exam_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of exam_rule
-- ----------------------------
INSERT INTO `exam_rule` VALUES ('1', '1.考试一律在指定时间和考场内进行。。。');
INSERT INTO `exam_rule` VALUES ('2', '2.学生应试时必须携带学生证,以备查对。非应试学生不得进入考场');
INSERT INTO `exam_rule` VALUES ('3', ' 3.学生应提前5分钟进入考场,服从监考教师安排,坐到指定的座位上。');
INSERT INTO `exam_rule` VALUES ('4', '4.书包、书籍、笔记、纸张等一律不得带入考场。');
INSERT INTO `exam_rule` VALUES ('5', '5.考试开始15分钟后不准再进入考场,逾时以旷考论。试题发出15分钟后,方可交卷离场。');
INSERT INTO `exam_rule` VALUES ('6', '6.学生答卷时不得互借文具、计算器、计算用图表和曲线。');
INSERT INTO `exam_rule` VALUES ('7', '7.考试中途不得离开考场(提前交卷或紧急情况除外)。');
INSERT INTO `exam_rule` VALUES ('8', '8.有疑问举手,请求监考教师解释:不得左顾右盼、看别人答卷,试卷下不准垫有资料等');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `gra_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `stu_Grade` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `stu_Class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gra_Chinese` double(11,0) DEFAULT NULL,
  `gra_Math` double(11,0) DEFAULT NULL,
  `gra_English` double(11,0) DEFAULT NULL,
  `allGrade` double(11,0) DEFAULT NULL,
  PRIMARY KEY (`gra_id`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`gra_id`) REFERENCES `student` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '刘备', '一年级', '3班', '90', '85', '70', '245');
INSERT INTO `grade` VALUES ('2', '小乔', '一年级', '1班', '70', '55', '60', '185');
INSERT INTO `grade` VALUES ('3', '诸葛亮', '一年级', '3班', '90', '90', '70', '250');
INSERT INTO `grade` VALUES ('4', '关羽', '一年级', '1班', '50', '60', '80', '190');
INSERT INTO `grade` VALUES ('5', '张飞', '一年级', '2班', '90', '80', '70', '240');
INSERT INTO `grade` VALUES ('6', '赵云', '一年级', '1班', '55', '80', '90', '225');
INSERT INTO `grade` VALUES ('7', '大乔', '一年级', '3班', '95', '60', '55', '210');
INSERT INTO `grade` VALUES ('8', '貂蝉', '一年级', '2班', '90', '50', '50', '190');
INSERT INTO `grade` VALUES ('9', '吕布', '一年级', '1班', '55', '80', '50', '185');
INSERT INTO `grade` VALUES ('10', '黄月英', '一年级', '2班', '95', '80', '70', '245');
INSERT INTO `grade` VALUES ('11', '黄忠', '一年级', '1班', '80', '65', '70', '215');
INSERT INTO `grade` VALUES ('12', '马超', '一年级', '3班', '50', '60', '60', '170');
INSERT INTO `grade` VALUES ('13', '孙权', '一年级', '3班', '80', '80', '90', '250');
INSERT INTO `grade` VALUES ('17', '曹操', '一年级', '1班', '80', '90', '75', '245');
INSERT INTO `grade` VALUES ('18', '郭嘉', '一年级', '2班', '100', '90', '50', '240');
INSERT INTO `grade` VALUES ('19', '典韦', '一年级', '3班', '50', '45', '65', '160');
INSERT INTO `grade` VALUES ('20', '关银屏', '一年级', '3班', '85', '70', '65', '220');
INSERT INTO `grade` VALUES ('21', '赵襄', '一年级', '1班', '85', '60', '55', '200');
INSERT INTO `grade` VALUES ('22', '许褚', '一年级', '2班', '65', '80', '65', '210');
INSERT INTO `grade` VALUES ('23', '董卓', '一年级', '3班', '20', '30', '55', '105');
INSERT INTO `grade` VALUES ('24', '步练师', '一年级', '2班', '90', '60', '85', '235');
INSERT INTO `grade` VALUES ('25', '姜维', '一年级', '1班', '90', '85', '80', '255');
INSERT INTO `grade` VALUES ('26', '周泰', '一年级', '2班', '85', '50', '75', '210');
INSERT INTO `grade` VALUES ('27', '孙茹', '一年级', '3班', '75', '60', '85', '220');
INSERT INTO `grade` VALUES ('28', '孙尚香', '一年级', '1班', '85', '75', '70', '230');
INSERT INTO `grade` VALUES ('29', '曹植', '一年级', '3班', '100', '70', '85', '255');
INSERT INTO `grade` VALUES ('30', '黄盖', '一年级', '1班', '65', '85', '60', '210');
INSERT INTO `grade` VALUES ('31', '陆逊', '一年级', '3班', null, null, null, null);

-- ----------------------------
-- Table structure for middle
-- ----------------------------
DROP TABLE IF EXISTS `middle`;
CREATE TABLE `middle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stu` (`stu_id`),
  KEY `class` (`class_id`),
  CONSTRAINT `class` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of middle
-- ----------------------------
INSERT INTO `middle` VALUES ('1', '1', '3');
INSERT INTO `middle` VALUES ('2', '2', '1');
INSERT INTO `middle` VALUES ('3', '3', '3');
INSERT INTO `middle` VALUES ('4', '4', '1');
INSERT INTO `middle` VALUES ('5', '5', '2');
INSERT INTO `middle` VALUES ('6', '6', '1');
INSERT INTO `middle` VALUES ('7', '7', '3');
INSERT INTO `middle` VALUES ('8', '8', '2');
INSERT INTO `middle` VALUES ('9', '9', '1');
INSERT INTO `middle` VALUES ('10', '10', '2');
INSERT INTO `middle` VALUES ('11', '11', '1');
INSERT INTO `middle` VALUES ('12', '12', '3');
INSERT INTO `middle` VALUES ('13', '13', '3');
INSERT INTO `middle` VALUES ('14', '17', '1');
INSERT INTO `middle` VALUES ('15', '18', '2');
INSERT INTO `middle` VALUES ('16', '19', '3');
INSERT INTO `middle` VALUES ('17', '20', '3');
INSERT INTO `middle` VALUES ('18', '21', '1');
INSERT INTO `middle` VALUES ('19', '22', '2');
INSERT INTO `middle` VALUES ('20', '23', '3');
INSERT INTO `middle` VALUES ('21', '24', '2');
INSERT INTO `middle` VALUES ('22', '25', '1');
INSERT INTO `middle` VALUES ('23', '26', '2');
INSERT INTO `middle` VALUES ('24', '27', '3');
INSERT INTO `middle` VALUES ('25', '28', '1');
INSERT INTO `middle` VALUES ('26', '29', '3');
INSERT INTO `middle` VALUES ('102', '30', '1');
INSERT INTO `middle` VALUES ('103', '31', '3');

-- ----------------------------
-- Table structure for school_advice
-- ----------------------------
DROP TABLE IF EXISTS `school_advice`;
CREATE TABLE `school_advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of school_advice
-- ----------------------------
INSERT INTO `school_advice` VALUES ('1', '1.所有老师到校长办公室开会', '');
INSERT INTO `school_advice` VALUES ('2', '2.这周学校取消放假', '');
INSERT INTO `school_advice` VALUES ('6', '杨宁到校长办公室来一趟！！！', '2020年10月04日20:42:21');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `stuName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `stuNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `stuSex` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `stuBirth` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `stuAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `stuPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `stuEmail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `stuQQ` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `stuName` (`stuName`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '2020001', '321', '刘备', '2020001', '男', '2020-10-03', '烟台市', '12533632325', '1238525822@qq.com', '1228033061', '2222');
INSERT INTO `student` VALUES ('2', '2020002', '123', '小乔', '2020002', '女', '2020-09-25', '烟台市', '13964509372', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('3', '2020003', '123', '诸葛亮', '2020003', '男', '2020-09-05', '临沂市', '13964509372', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('4', '2020004', '124', '关羽', '2020004', '男', '2020-09-22', '青岛市', '13964509373', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('5', '2020005', '123', '张飞', '2020005', '男', '2020-09-09', '济宁市', '13964509374', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('6', '2020006', '123', '赵云', '2020006', '男', '2020-09-09', '石家庄市', '13964509375', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('7', '2020007', '123', '大乔', '2020007', '女', '2020-09-23', '苏州市', '13964509376', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('8', '2020008', '123', '貂蝉', '2020008', '女', '2020-09-23', '济南市', '13964509377', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('9', '2020009', '123', '吕布', '2020009', '男', '2020-09-23', '上海市', '13964509380', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('10', '2020010', '123', '黄月英', '2020010', '女', '2020-09-23', '济南市', '13964509362', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('11', '2020011', '123', '黄忠', '2020011', '男', '2020-09-23', '武汉市', '13964509379', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('12', '2020012', '123', '马超', '2020012', '男', '2020-09-23', '郑州市', '13964509470', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('13', '2020013', '123', '孙权', '2020013', '男', '2020-09-23', '杭州市', '13964509472', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('17', '2020017', '123', '曹操', '2020017', '男', '2020-09-04', '西安市', '13969509380', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('18', '2020018', '123', '郭嘉', '2020018', '男', '2020-09-03', '太原市', '13964589370', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('19', '2020019', '123', '典韦', '2020019', '男', '2020-09-17', '济南市', '13964509580', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('20', '2020020', '123', '关银屏', '2020020', '女', '2020-09-04', '青岛市', '15964509372', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('21', '2020021', '123', '赵襄', '2020021', '女', '2020-09-03', '石家庄市', '18964509370', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('22', '2020022', '123', '许褚', '2020022', '男', '2020-09-03', '武汉市', '13966509370', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('23', '2020023', '123', '董卓', '2020023', '男', '2020-09-03', '北京市', '13964509870', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('24', '2020024', '123', '步练师', '2020024', '女', '2020-09-03', '天津市', '13964809370', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('25', '2020025', '123', '姜维', '2020025', '男', '2020-09-03', '桂林市', '13964509356', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('26', '2020026', '123', '周泰', '2020026', '男', '2020-09-03', '合肥市', '13864509370', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('27', '2020027', '123', '孙茹', '2020027', '女', '2020-09-03', '威海市', '13964509654', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('28', '2020028', '123', '孙尚香', '2020028', '女', '2020-09-03', '上海市', '18264509370', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('29', '2020029', '123', '曹植', '2020029', '男', '2020-09-03', '吉林市', '15964509370', '1238033061@qq.com', '1228033061', null);
INSERT INTO `student` VALUES ('30', '2020030', '123', '黄盖', '2020030', '男', '2020-10-03', null, null, null, null, null);
INSERT INTO `student` VALUES ('31', '2020031', '123', '陆逊', '2020031', '男', '2020-10-24', null, null, null, null, null);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tea_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `teaNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `teaName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `teaSex` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `teaCourse` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `teaAddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `teaPhone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `teaEmail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `teaQQ` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `teaMessage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '10000', '123', '10000', '王晓明', '女', '语文', '北京市', '17968509372', '12563654852@139.com', '125456321', null);
INSERT INTO `teacher` VALUES ('2', '10010', '123', '10010', '王丽', '女', '数学', '北京市', '15964509370', '1256369680@139.com', '256369852', null);
INSERT INTO `teacher` VALUES ('3', '10011', '123', '10011', '李华', '女', '英语', '青岛市', '18964509380', '1582569345@139.com', '214563698', null);
INSERT INTO `teacher` VALUES ('4', '10012', '123', '10012', '李四', '男', '语文', '济南市', '17964505370', '1256369852@qq.com', '33214325', null);
INSERT INTO `teacher` VALUES ('5', '10013', '123', '10013', '丁一', '男', '数学', '上海市', '15696450937', '2526365426@qq.com', '1256321452', null);
INSERT INTO `teacher` VALUES ('6', '10014', '123', '10014', '李娜', '女', '英语', '北京市', '17968509370', '12563654852@139.com', '125456321', null);
INSERT INTO `teacher` VALUES ('7', '10015', '123', '10015', '王斌', '男', '语文', '烟台市', '17968509370', '12563654852@139.com', '125456321', null);
INSERT INTO `teacher` VALUES ('8', '10016', '123', '10016', '孙悦', '女', '数学', '济南市', '17968509370', '12563654852@139.com', '125456321', null);
INSERT INTO `teacher` VALUES ('9', '10017', '123', '10017', '杨磊', '男', '英语', '青岛市', '17968509370', '12563654852@139.com', '125456321', null);
INSERT INTO `teacher` VALUES ('18', '10018', '123', '10018', '文月', '女', '美术', null, null, null, null, null);

-- ----------------------------
-- Table structure for teacher_middle
-- ----------------------------
DROP TABLE IF EXISTS `teacher_middle`;
CREATE TABLE `teacher_middle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tea_id` (`tea_id`),
  KEY `teacher_middle_ibfk_2` (`class_id`),
  CONSTRAINT `teacher_middle_ibfk_1` FOREIGN KEY (`tea_id`) REFERENCES `teacher` (`tea_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_middle_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of teacher_middle
-- ----------------------------
INSERT INTO `teacher_middle` VALUES ('1', '1', '1');
INSERT INTO `teacher_middle` VALUES ('2', '2', '1');
INSERT INTO `teacher_middle` VALUES ('3', '3', '1');
INSERT INTO `teacher_middle` VALUES ('4', '4', '2');
INSERT INTO `teacher_middle` VALUES ('5', '5', '2');
INSERT INTO `teacher_middle` VALUES ('6', '6', '2');
INSERT INTO `teacher_middle` VALUES ('7', '7', '3');
INSERT INTO `teacher_middle` VALUES ('8', '8', '3');
INSERT INTO `teacher_middle` VALUES ('9', '9', '3');
INSERT INTO `teacher_middle` VALUES ('13', '18', '2');
