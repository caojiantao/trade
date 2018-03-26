/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : trade

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 11/07/2017 17:11:43 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账号',
  `account` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '管理员姓名',
  `pwd` varchar(12) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `advertisement`
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `logo_real_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT '0',
  `order` int(10) DEFAULT '0',
  `type` int(2) DEFAULT NULL COMMENT '0：行业；\n1：品牌；\n2：类型；',
  `name` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `logo_real_url` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `code_set`
-- ----------------------------
DROP TABLE IF EXISTS `code_set`;
CREATE TABLE `code_set` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `code_value`
-- ----------------------------
DROP TABLE IF EXISTS `code_value`;
CREATE TABLE `code_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ems`
-- ----------------------------
DROP TABLE IF EXISTS `ems`;
CREATE TABLE `ems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ems_no` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱地址',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `content` text COMMENT '留言内容',
  `date_time` datetime DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品行业id',
  `product_id` int(11) DEFAULT NULL COMMENT '产品类型id',
  `number` varchar(20) DEFAULT NULL COMMENT '商品编号',
  `name` varchar(20) DEFAULT NULL COMMENT '商品名称',
  `price` double DEFAULT NULL COMMENT '商品价格',
  `scroll` bit(1) DEFAULT NULL COMMENT '滚动商品（0：不是；1：是）',
  `hot` bit(1) DEFAULT NULL COMMENT '人气商品（0：不是；1：是）',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '商品描述',
  `logo_real_url` varchar(100) DEFAULT NULL COMMENT 'logo实际地址',
  `logo_url` varchar(100) DEFAULT NULL COMMENT 'logo地址',
  `content` text COMMENT '商品内容',
  `update_time` datetime DEFAULT NULL COMMENT '最近修改时间',
  `browse_times` int(11) DEFAULT NULL COMMENT '浏览次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(255) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '收货人姓名',
  `nick_name` varchar(100) DEFAULT NULL COMMENT '收货地址',
  `post_code` varchar(255) DEFAULT '',
  `county` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ems_no` varchar(20) DEFAULT NULL COMMENT 'EMS编号',
  `total_price` decimal(10,2) DEFAULT NULL,
  `goods_json` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pageinfo`
-- ----------------------------
DROP TABLE IF EXISTS `pageinfo`;
CREATE TABLE `pageinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `content` text,
  `update_time` datetime DEFAULT NULL,
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '0: ''文章信息''，\n1: ''会社概要'',\n2: ''注文方法'',\n3: ''重要事项'',\n4: ''割引情报'',\n5: ''注意事项'',\n6: ''返品返金'',\n7: ''营业时间'',\n8: ''配送方式''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(10) DEFAULT NULL COMMENT '昵称',
  `post_code` varchar(10) DEFAULT NULL COMMENT '邮编',
  `county` varchar(10) DEFAULT NULL COMMENT '县',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱地址',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `website`
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '网站名称',
  `logo_url` varchar(100) DEFAULT NULL COMMENT 'logo地址',
  `manager` varchar(20) DEFAULT NULL COMMENT '店长',
  `business_hour` varchar(20) DEFAULT NULL COMMENT '营业时间',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `email_pwd` varchar(20) DEFAULT NULL COMMENT '邮箱密码',
  `keyword` varchar(100) DEFAULT NULL COMMENT '网站关键字',
  `description` text COMMENT '描述',
  `top_scroll_text` varchar(200) DEFAULT NULL COMMENT '顶部滚动文字',
  `top_fix_text` varchar(200) DEFAULT NULL COMMENT '顶部固定文字',
  `goods_detail_bottom` text COMMENT '商品详情页logo下方文字',
  `goods_detail_right` text COMMENT '商品详情页logo右侧文字',
  `introduction` text COMMENT '网站图文简介，固定侧边栏展示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
