/*
Navicat MySQL Data Transfer

Source Server         : shaonian
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2015-06-14 17:26:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏Id',
  `useid` int(11) DEFAULT NULL COMMENT '用户编号id',
  `rouID` int(11) DEFAULT NULL COMMENT '线路ID',
  `sceID` int(11) DEFAULT NULL COMMENT '风景ID',
  `colType` int(11) NOT NULL COMMENT '收藏类型',
  `creatDate` date NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `FK6362ED0AF52F8BAD` (`sceID`),
  KEY `FK6362ED0A8685103` (`useid`),
  KEY `FK6362ED0A3CC595A6` (`rouID`),
  CONSTRAINT `FK6362ED0A3CC595A6` FOREIGN KEY (`rouID`) REFERENCES `route` (`ID`),
  CONSTRAINT `FK6362ED0A8685103` FOREIGN KEY (`useid`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK6362ED0AF52F8BAD` FOREIGN KEY (`sceID`) REFERENCES `scenery` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `useid` int(11) NOT NULL COMMENT '用户编号id',
  `sceID` int(11) NOT NULL COMMENT '风景ID',
  `score` int(11) NOT NULL COMMENT '评分',
  `createDate` date NOT NULL COMMENT '评论时间',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`ID`),
  KEY `FK63717A3FF52F8BAD` (`sceID`),
  KEY `FK63717A3F8685103` (`useid`),
  CONSTRAINT `FK63717A3F8685103` FOREIGN KEY (`useid`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK63717A3FF52F8BAD` FOREIGN KEY (`sceID`) REFERENCES `scenery` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `friendlink`;
CREATE TABLE `friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '友情链接编号',
  `useid` int(11) NOT NULL COMMENT '用户编号id',
  `url` varchar(255) NOT NULL COMMENT '友情链接URL',
  `logo` varchar(255) NOT NULL COMMENT 'logo',
  `summary` varchar(255) DEFAULT NULL COMMENT '简介',
  `grade` int(11) DEFAULT NULL COMMENT '友好程度',
  PRIMARY KEY (`id`),
  KEY `FKB44027988685103` (`useid`),
  CONSTRAINT `FKB44027988685103` FOREIGN KEY (`useid`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendlink
-- ----------------------------

-- ----------------------------
-- Table structure for `hotel`
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '酒店ID',
  `useid` int(11) NOT NULL COMMENT '用户编号id',
  `logo` varchar(1024) DEFAULT NULL COMMENT 'logo',
  `realName` varchar(20) NOT NULL COMMENT '名字',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `longitude` decimal(10,7) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10,7) DEFAULT NULL COMMENT '纬度',
  `grade` int(11) DEFAULT NULL COMMENT '酒店级别',
  `picture` varchar(200) DEFAULT NULL COMMENT '图片',
  `telphone` varchar(12) DEFAULT NULL COMMENT '酒店电话',
  PRIMARY KEY (`ID`),
  KEY `FK41BC9948685103` (`useid`),
  CONSTRAINT `FK41BC9948685103` FOREIGN KEY (`useid`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel
-- ----------------------------

-- ----------------------------
-- Table structure for `images`
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `sceID` int(11) NOT NULL COMMENT '风景ID',
  `description` varchar(1024) DEFAULT NULL COMMENT '图片描述',
  `url` varchar(1024) NOT NULL COMMENT '图片路径',
  `USEID` int(11) DEFAULT NULL COMMENT '管理员编号id',
  PRIMARY KEY (`id`),
  KEY `FK80ED7678F52F8BAD` (`sceID`),
  KEY `FK80ED76788685103` (`USEID`),
  CONSTRAINT `FK80ED76788685103` FOREIGN KEY (`USEID`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK80ED7678F52F8BAD` FOREIGN KEY (`sceID`) REFERENCES `scenery` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of images
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `userId` int(11) DEFAULT NULL COMMENT '用户编号id',
  `adminId` int(11) DEFAULT NULL COMMENT '用户编号id',
  `content` text NOT NULL COMMENT '内容',
  `stats` int(11) NOT NULL COMMENT '状态',
  `createDate` date NOT NULL COMMENT '停留天数',
  PRIMARY KEY (`ID`),
  KEY `FK63B68BE7BDD43CCB` (`adminId`),
  KEY `FK63B68BE7CFECF647` (`userId`),
  CONSTRAINT `FK63B68BE7CFECF647` FOREIGN KEY (`userId`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK63B68BE7BDD43CCB` FOREIGN KEY (`adminId`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `useid` int(11) NOT NULL COMMENT '用户编号id',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `subTitle` varchar(50) NOT NULL COMMENT '子标题',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` text NOT NULL COMMENT '内容',
  `publicTime` date NOT NULL COMMENT '发布时间',
  `click` varchar(255) DEFAULT NULL COMMENT '浏览量',
  `hot` tinyint(1) NOT NULL COMMENT '热门',
  PRIMARY KEY (`ID`),
  KEY `FK2482D38685103` (`useid`),
  CONSTRAINT `FK2482D38685103` FOREIGN KEY (`useid`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `roombook`
-- ----------------------------
DROP TABLE IF EXISTS `roombook`;
CREATE TABLE `roombook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '酒店预订ID',
  `useid` int(11) DEFAULT NULL COMMENT '用户编号id',
  `rooID` int(11) NOT NULL COMMENT '房型ID',
  `creatDate` date NOT NULL COMMENT '预定时间',
  `enterDate` date NOT NULL COMMENT '入住日期',
  `leaveDate` date NOT NULL COMMENT '离开日期',
  `realName` varchar(20) NOT NULL COMMENT '名字',
  `roomNum` int(11) NOT NULL COMMENT '房间数量',
  `telphone` varchar(12) NOT NULL COMMENT '手机号',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`ID`),
  KEY `FK2457C6445632758D` (`rooID`),
  KEY `FK2457C6448685103` (`useid`),
  CONSTRAINT `FK2457C6448685103` FOREIGN KEY (`useid`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK2457C6445632758D` FOREIGN KEY (`rooID`) REFERENCES `roomstyle` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roombook
-- ----------------------------

-- ----------------------------
-- Table structure for `roomstyle`
-- ----------------------------
DROP TABLE IF EXISTS `roomstyle`;
CREATE TABLE `roomstyle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '房型ID',
  `hotID` int(11) NOT NULL COMMENT '酒店ID',
  `realName` varchar(20) NOT NULL COMMENT '名字',
  `bedStyle` int(11) NOT NULL COMMENT '名称',
  `limitPerson` int(11) NOT NULL COMMENT '床型',
  `breakfast` int(11) NOT NULL COMMENT '最多可入住人数',
  `broadband` int(11) NOT NULL COMMENT '早餐',
  `cancel` int(11) NOT NULL COMMENT '宽带',
  `price` float(8,2) NOT NULL COMMENT '价格',
  `number` int(11) NOT NULL COMMENT '数量',
  `picture` varchar(200) DEFAULT NULL COMMENT '图片',
  `introduce` text COMMENT '介绍',
  PRIMARY KEY (`ID`),
  KEY `FK6792FD963BABB646` (`hotID`),
  CONSTRAINT `FK6792FD963BABB646` FOREIGN KEY (`hotID`) REFERENCES `hotel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomstyle
-- ----------------------------

-- ----------------------------
-- Table structure for `route`
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '线路ID',
  `useid` int(11) DEFAULT NULL COMMENT '用户编号id',
  `realName` varchar(20) NOT NULL COMMENT '名字',
  `logo` varchar(1024) NOT NULL COMMENT 'logo',
  `startDate` date NOT NULL COMMENT '出发时间',
  `endDate` date NOT NULL COMMENT '结束时间',
  `routeType` int(11) NOT NULL COMMENT '类型',
  `money` float(8,2) NOT NULL COMMENT '价钱',
  `description` text NOT NULL COMMENT '描述',
  `numPeople` int(11) DEFAULT NULL COMMENT '报名人数',
  `suggest` tinyint(1) DEFAULT NULL COMMENT '推荐',
  `content` text COMMENT '行程建议',
  PRIMARY KEY (`ID`),
  KEY `FK4A8BA298685103` (`useid`),
  CONSTRAINT `FK4A8BA298685103` FOREIGN KEY (`useid`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of route
-- ----------------------------

-- ----------------------------
-- Table structure for `routebook`
-- ----------------------------
DROP TABLE IF EXISTS `routebook`;
CREATE TABLE `routebook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '线路预定ID',
  `rouID` int(11) NOT NULL COMMENT '线路ID',
  `useid` int(11) NOT NULL COMMENT '用户编号id',
  `leaveTel` varchar(12) NOT NULL COMMENT '报名手机',
  `peopleNum` int(11) NOT NULL COMMENT '人数',
  `leaveName` varchar(12) NOT NULL COMMENT '报名姓名',
  `totalPrice` float(8,2) NOT NULL COMMENT '价钱',
  PRIMARY KEY (`ID`),
  KEY `FKB01CB0928685103` (`useid`),
  KEY `FKB01CB0929EBC3F0F` (`rouID`),
  CONSTRAINT `FKB01CB0929EBC3F0F` FOREIGN KEY (`rouID`) REFERENCES `routebook` (`ID`),
  CONSTRAINT `FKB01CB0928685103` FOREIGN KEY (`useid`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of routebook
-- ----------------------------

-- ----------------------------
-- Table structure for `routeplan`
-- ----------------------------
DROP TABLE IF EXISTS `routeplan`;
CREATE TABLE `routeplan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '线路计划ID',
  `sceID` int(11) NOT NULL COMMENT '风景ID',
  `rouID` int(11) NOT NULL COMMENT '线路ID',
  `step` int(11) NOT NULL COMMENT '步骤',
  `day` int(11) NOT NULL COMMENT '停留天数',
  `description` text COMMENT '描述',
  PRIMARY KEY (`ID`),
  KEY `FKB02300D2F52F8BAD` (`sceID`),
  KEY `FKB02300D23CC595A6` (`rouID`),
  CONSTRAINT `FKB02300D23CC595A6` FOREIGN KEY (`rouID`) REFERENCES `route` (`ID`),
  CONSTRAINT `FKB02300D2F52F8BAD` FOREIGN KEY (`sceID`) REFERENCES `scenery` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of routeplan
-- ----------------------------

-- ----------------------------
-- Table structure for `scenery`
-- ----------------------------
DROP TABLE IF EXISTS `scenery`;
CREATE TABLE `scenery` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '风景ID',
  `sceID` int(11) DEFAULT NULL COMMENT '风景ID',
  `realName` varchar(20) NOT NULL COMMENT '名字',
  `address` varchar(255) NOT NULL COMMENT '名字',
  `longitude` decimal(10,7) NOT NULL COMMENT '经度',
  `latitude` decimal(10,7) NOT NULL COMMENT '纬度',
  `logo` varchar(1024) DEFAULT NULL COMMENT 'logo',
  `introduction` text NOT NULL COMMENT '介绍',
  `url` varchar(255) DEFAULT NULL COMMENT '网址',
  `openDime` varchar(50) NOT NULL COMMENT '开放时间',
  `grade` int(11) DEFAULT NULL COMMENT '景区级别',
  `telphone` varchar(12) DEFAULT NULL COMMENT '景区联系电话',
  `viwepager` tinyint(1) NOT NULL COMMENT '轮播',
  `suggest` tinyint(1) DEFAULT NULL COMMENT '推荐',
  PRIMARY KEY (`ID`),
  KEY `FK9CEABFB3F52F8BAD` (`sceID`),
  CONSTRAINT `FK9CEABFB3F52F8BAD` FOREIGN KEY (`sceID`) REFERENCES `scenery` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenery
-- ----------------------------

-- ----------------------------
-- Table structure for `travels`
-- ----------------------------
DROP TABLE IF EXISTS `travels`;
CREATE TABLE `travels` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '游记ID',
  `useid` int(11) NOT NULL COMMENT '用户编号id',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `publicTime` date NOT NULL COMMENT '发布时间',
  `click` int(11) DEFAULT NULL COMMENT '浏览量',
  PRIMARY KEY (`ID`),
  KEY `FKEB34F0798685103` (`useid`),
  CONSTRAINT `FKEB34F0798685103` FOREIGN KEY (`useid`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of travels
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号id',
  `mobile` varchar(12) NOT NULL COMMENT '手机号',
  `pwd` varchar(20) NOT NULL COMMENT '密码',
  `role` int(11) NOT NULL COMMENT '角色',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `realName` varchar(20) NOT NULL COMMENT '名字',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `birth` date DEFAULT NULL COMMENT '出生日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
