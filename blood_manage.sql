/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blood_manage

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-06-07 15:15:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blood
-- ----------------------------
DROP TABLE IF EXISTS `blood`;
CREATE TABLE `blood` (
  `bldCode` int(11) NOT NULL AUTO_INCREMENT COMMENT '血液编号',
  `bldName` varchar(255) NOT NULL DEFAULT '熊猫血' COMMENT '血型',
  `healthbld` varchar(255) NOT NULL DEFAULT '0' COMMENT '健康血液量',
  `checkbld` varchar(255) NOT NULL DEFAULT '0' COMMENT '待检血液量',
  `dangerbld` varchar(255) NOT NULL DEFAULT '0' COMMENT '处理血液量',
  `transportbld` varchar(255) NOT NULL DEFAULT '0' COMMENT '运输血液量',
  PRIMARY KEY (`bldCode`)
) ENGINE=MyISAM AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8 COMMENT='血液信息表';

-- ----------------------------
-- Records of blood
-- ----------------------------
INSERT INTO `blood` VALUES ('1001', 'RH阴型血', '500', '300', '25', '200');
INSERT INTO `blood` VALUES ('1002', 'A型血', '1491', '500', '300', '609');
INSERT INTO `blood` VALUES ('1003', 'B型血', '1200', '800', '400', '370');
INSERT INTO `blood` VALUES ('1004', 'AB型血', '1300', '450', '275', '480');
INSERT INTO `blood` VALUES ('1005', 'O型血', '800', '300', '75', '265');

-- ----------------------------
-- Table structure for dpt
-- ----------------------------
DROP TABLE IF EXISTS `dpt`;
CREATE TABLE `dpt` (
  `dptID` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `dptName` varchar(255) NOT NULL DEFAULT '质检科' COMMENT '部门名称',
  `dptadr` varchar(255) NOT NULL DEFAULT '101' COMMENT '部门位置',
  PRIMARY KEY (`dptID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of dpt
-- ----------------------------
INSERT INTO `dpt` VALUES ('1', '质检科', '一楼左101');
INSERT INTO `dpt` VALUES ('2', '采血科', '二楼右201');
INSERT INTO `dpt` VALUES ('3', '保卫科', '301');
INSERT INTO `dpt` VALUES ('4', '成分科', '521');
INSERT INTO `dpt` VALUES ('5', '分析科', '446');
INSERT INTO `dpt` VALUES ('6', '化验科', '621');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(255) NOT NULL DEFAULT '王毓' COMMENT '用户姓名',
  `userTel` varchar(255) NOT NULL DEFAULT '18660487073' COMMENT '联系方式',
  `userEmail` varchar(255) NOT NULL DEFAULT '1057713251@qq.com' COMMENT '电子邮件',
  `userPwd` varchar(255) NOT NULL DEFAULT '123456' COMMENT '用户密码',
  `userDpt` int(11) DEFAULT NULL COMMENT '所属部门',
  `userScrip` varchar(255) NOT NULL DEFAULT '帅字贯穿一生' COMMENT '用户描述',
  PRIMARY KEY (`userID`),
  KEY `userDpt` (`userDpt`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`userDpt`) REFERENCES `dpt` (`dptID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '王硕', '15215378621', '5201314@qq.com', '456', '3', '字贯穿一生');
INSERT INTO `user` VALUES ('4', '杜播裕', '17862857702', '1234567@qq.com', '1234', '4', '霸气两字贯穿一生');
INSERT INTO `user` VALUES ('5', '汪宇', '13791748638', '7654321@qq.com', '5678', '5', '理性两字贯穿一生');
INSERT INTO `user` VALUES ('6', '陈胜', '12365478963', '7777777@qq.com', '13579', '6', '省字贯穿一生');
INSERT INTO `user` VALUES ('8', 'user', 'tel', 'email', 'pwd', '2', 'scrip');
INSERT INTO `user` VALUES ('12', '王毓', '18660487073', '1057713251@qq.com', '123456', '5', '帅字贯穿一生');
