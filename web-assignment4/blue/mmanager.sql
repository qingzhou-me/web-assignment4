/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : blue

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-04-12 15:12:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mmanager`
-- ----------------------------
DROP TABLE IF EXISTS `mmanager`;
CREATE TABLE `mmanager` (
  `mname` varchar(50) NOT NULL,
  `mpw` varchar(50) NOT NULL,
  `mpermitted` varchar(50) NOT NULL,
  PRIMARY KEY (`mname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mmanager
-- ----------------------------
INSERT INTO `mmanager` VALUES ('123', '123456', '1');
INSERT INTO `mmanager` VALUES ('mm', 'asdfgh', '1');
