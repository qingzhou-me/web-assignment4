/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : blue

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-04-12 15:12:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `myusers`
-- ----------------------------
DROP TABLE IF EXISTS `myusers`;
CREATE TABLE `myusers` (
  `cname` varchar(50) NOT NULL,
  `cpw` varchar(50) NOT NULL,
  `cemail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myusers
-- ----------------------------
INSERT INTO `myusers` VALUES ('11', '123456', '1119181743@qq.com');
INSERT INTO `myusers` VALUES ('1111', '11111111', '1119181743@163.com');
INSERT INTO `myusers` VALUES ('123', '1234567', '1119181743@qq.com');
INSERT INTO `myusers` VALUES ('1234', '123123', '1119181743@163.com');
INSERT INTO `myusers` VALUES ('222', '1234567', '1119181743@163.com');
INSERT INTO `myusers` VALUES ('zmm', '1234567', '1119181743@163.com');
