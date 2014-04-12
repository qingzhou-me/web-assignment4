/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : blue

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-04-12 15:11:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `name` varchar(20) NOT NULL COMMENT '评论者姓名',
  `email` varchar(50) NOT NULL,
  `http` varchar(60) DEFAULT NULL,
  `comment` varchar(800) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('112', '1119181743@163.com', '', '1111');
INSERT INTO `comment` VALUES ('1112', '1119181743@163.com', '', '1111');
