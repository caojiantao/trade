/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : trade

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-10-30 18:11:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
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
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'wulitaotao', '曹建涛', '1');
INSERT INTO `admin` VALUES ('2', '1', '测试', '1');
INSERT INTO `admin` VALUES ('3', 'test', '呵呵', 'test');

-- ----------------------------
-- Table structure for advertisement
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
-- Records of advertisement
-- ----------------------------
INSERT INTO `advertisement` VALUES ('6', '3', 'http://www.wulitao.xyz', '/upload/advertisement/2_20171027184827.jpg', 'D:\\upload\\advertisement\\2_20171027184827.jpg');
INSERT INTO `advertisement` VALUES ('7', '1', '123123214214', '/upload/advertisement/6_20171027184806.jpg', 'D:\\upload\\advertisement\\6_20171027184806.jpg');
INSERT INTO `advertisement` VALUES ('11', '2', 'http://www.rufer.site', '/upload/advertisement/3_20171027184819.jpg', 'D:\\upload\\advertisement\\3_20171027184819.jpg');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `trade_id` int(11) DEFAULT NULL COMMENT '所属商品行业id',
  `name` varchar(20) DEFAULT NULL COMMENT '品牌名称',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `show` tinyint(1) DEFAULT NULL COMMENT '是否首页展示',
  `logo_url` varchar(100) DEFAULT NULL COMMENT 'logo网络地址',
  `logo_real_url` varchar(100) DEFAULT NULL COMMENT 'logo磁盘地址',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '1', '品牌1', '1', '品牌', '', 'subscription', '1', '/upload/brand/IMG_0427_20170212221429.JPG', 'H:\\upload\\brand\\IMG_0427_20170212221429.JPG', '哈哈e&nbsp;');
INSERT INTO `brand` VALUES ('7', '5', '品牌3', '24', 'sdaf', 'adfzxcv', 'asd23r', '1', '/upload/brand/IMG_0426_20170212233719.JPG', 'H:\\upload\\brand\\IMG_0426_20170212233719.JPG', '这是品牌3的内容。。。。。。');
INSERT INTO `brand` VALUES ('9', '1', '品牌4', '2', '标题', '关键字', '描述', '1', '/upload/brand/taiyan_20161215000450.jpg', 'H:\\upload\\brand\\taiyan_20161215000450.jpg', '<img alt=\"\" src=\"http://kopi6.com/upload/image/20160310/20160310212514_5797.jpg\" /><span style=\"font-size:24px;\"><strong>ロレックス</strong></span><span>&nbsp;【</span><a href=\"http://www.kopi6.com/\"><span style=\"color:#000000;\">www.kopi6.com】</span></a><span></span>\r\n<p>\r\n	1908年、創業者のハンス・ウィルスドルフによって商標登録されたロレックス。圧倒的な人気・知名度を誇る、まさに\"機械式時計の王者\"です。<br />\r\nドレッシーな定番モデル「デイトジャスト」は、様々な文字盤・サイズ・素材で幅広いバリエーションを展開しています。<br />\r\n他方、スポーツモデルでは「エクスプローラー」「サブマリーナー」そして「コスモグラフ デイトナ」など、時計好きでなくとも耳にする大人気モデルを擁しています。<br />\r\n基本的なデザインを踏襲しつつ、飽きのこないデザインと、抜群の実用性・信頼性を誇っています。近年ではパラクロム・ヘアスプリングやセラミックベゼルなどの先端技術も積極的に取入れており、誰もがその動向から目を離せない､時計業界を牽引する存在です。&nbsp;\r\n</p>');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT '0',
  `order` int(10) DEFAULT '0',
  `type` enum('类型','品牌','行业') DEFAULT '行业',
  `name` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `logo_real_url` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('8', '0', '0', '行业', 'スーパーコピー時計', null, null, null, null, null);
INSERT INTO `category` VALUES ('9', '0', '0', '行业', 'スーパーコピーバッグ', null, null, null, null, null);
INSERT INTO `category` VALUES ('10', '0', '0', '行业', 'スーパーコピー財布', null, null, null, null, null);
INSERT INTO `category` VALUES ('11', '0', '0', '行业', 'その他商品', null, null, null, null, null);
INSERT INTO `category` VALUES ('12', '10', '0', '品牌', '哈哈哈', null, null, null, null, null);
INSERT INTO `category` VALUES ('13', '11', '0', '行业', '哈哈哈哈嗝', null, null, null, null, null);
INSERT INTO `category` VALUES ('14', '13', '0', '行业', 'hello', null, null, null, null, null);

-- ----------------------------
-- Table structure for code_set
-- ----------------------------
DROP TABLE IF EXISTS `code_set`;
CREATE TABLE `code_set` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of code_set
-- ----------------------------
INSERT INTO `code_set` VALUES ('1', '县郡');

-- ----------------------------
-- Table structure for code_value
-- ----------------------------
DROP TABLE IF EXISTS `code_value`;
CREATE TABLE `code_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of code_value
-- ----------------------------
INSERT INTO `code_value` VALUES ('1', '1', '都道府県');
INSERT INTO `code_value` VALUES ('2', '1', '北海道');
INSERT INTO `code_value` VALUES ('3', '1', '青森県');
INSERT INTO `code_value` VALUES ('4', '1', '岩手県');
INSERT INTO `code_value` VALUES ('5', '1', '宮城県');
INSERT INTO `code_value` VALUES ('6', '1', '秋田県');
INSERT INTO `code_value` VALUES ('7', '1', '山形県');
INSERT INTO `code_value` VALUES ('8', '1', '福島県');
INSERT INTO `code_value` VALUES ('9', '1', '茨城県');
INSERT INTO `code_value` VALUES ('10', '1', '栃木県');
INSERT INTO `code_value` VALUES ('11', '1', '群馬県');
INSERT INTO `code_value` VALUES ('12', '1', '埼玉県');
INSERT INTO `code_value` VALUES ('13', '1', '千葉県\r');
INSERT INTO `code_value` VALUES ('14', '1', '東京都\r');
INSERT INTO `code_value` VALUES ('15', '1', '神奈川県');
INSERT INTO `code_value` VALUES ('16', '1', '新潟県\r');
INSERT INTO `code_value` VALUES ('17', '1', '富山県\r');
INSERT INTO `code_value` VALUES ('18', '1', '石川県\r');
INSERT INTO `code_value` VALUES ('19', '1', '福井県');
INSERT INTO `code_value` VALUES ('20', '1', '山梨県');
INSERT INTO `code_value` VALUES ('21', '1', '長野県\r');
INSERT INTO `code_value` VALUES ('22', '1', '岐阜県');
INSERT INTO `code_value` VALUES ('23', '1', '静岡県');
INSERT INTO `code_value` VALUES ('24', '1', '愛知県');
INSERT INTO `code_value` VALUES ('25', '1', '三重県\r');
INSERT INTO `code_value` VALUES ('26', '1', '滋賀県\r');
INSERT INTO `code_value` VALUES ('27', '1', '京都府\r');
INSERT INTO `code_value` VALUES ('28', '1', '大阪府\r');
INSERT INTO `code_value` VALUES ('29', '1', '兵庫県\r');
INSERT INTO `code_value` VALUES ('30', '1', '奈良県');
INSERT INTO `code_value` VALUES ('31', '1', '和歌山県');
INSERT INTO `code_value` VALUES ('32', '1', '鳥取県');
INSERT INTO `code_value` VALUES ('33', '1', '島根県\r');
INSERT INTO `code_value` VALUES ('34', '1', '岡山県\r');
INSERT INTO `code_value` VALUES ('35', '1', '広島県');
INSERT INTO `code_value` VALUES ('36', '1', '山口県');
INSERT INTO `code_value` VALUES ('37', '1', '徳島県');
INSERT INTO `code_value` VALUES ('38', '1', '香川県\r');
INSERT INTO `code_value` VALUES ('39', '1', '愛媛県\r');
INSERT INTO `code_value` VALUES ('40', '1', '高知県');
INSERT INTO `code_value` VALUES ('41', '1', '福岡県\r');
INSERT INTO `code_value` VALUES ('42', '1', '佐賀県\r');
INSERT INTO `code_value` VALUES ('43', '1', '長崎県\r');
INSERT INTO `code_value` VALUES ('44', '1', '熊本県');
INSERT INTO `code_value` VALUES ('45', '1', '大分県\r');
INSERT INTO `code_value` VALUES ('46', '1', '宮崎県');
INSERT INTO `code_value` VALUES ('47', '1', '鹿児島県\r');
INSERT INTO `code_value` VALUES ('48', '1', '沖縄県');

-- ----------------------------
-- Table structure for ems
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
-- Records of ems
-- ----------------------------
INSERT INTO `ems` VALUES ('1', '曹建涛', '12345', '标题', '关键字', '摘要', '<p>\r\n	<a href=\"http://www.kopi6.com/protype/list.aspx?id=148\" target=\"_blank\"><strong><span style=\"color:#000000;\">ロレックス ヨットマスター コピー</span></strong></a><strong>II スーパーコピー 116688 カウントダウン クロノ ホワイト</strong><br />\r\n【&nbsp; 型&nbsp;&nbsp;&nbsp; 番&nbsp; 】116688<br />\r\n【&nbsp; 機&nbsp;&nbsp;&nbsp; 械&nbsp; 】自動巻き<br />\r\n【 材&nbsp; 質&nbsp; 名 】イエローゴールド<br />\r\n【 タ&nbsp; イ&nbsp; プ 】新品 メンズ<br />\r\n【文 字 盤 色 】ホワイト<br />\r\n【外 装 特 徴 】回転ベゼル<br />\r\n【ケースサイズ】44.0mm<br />\r\n【&nbsp; 機&nbsp;&nbsp;&nbsp; 能&nbsp; 】カウントダウン<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; クロノグラフ<br />\r\n【 付&nbsp; 属&nbsp; 品 】内 外箱<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ギャランティー\r\n</p>\r\n<img alt=\"\" src=\"http://www.kopi6.com/upload/image/20160420/20160420111507_1973.jpg\" /><img alt=\"\" src=\"http://www.kopi6.com/upload/image/20160420/20160420111507_9473.jpg\" /><img alt=\"\" src=\"http://www.kopi6.com/upload/image/20160420/20160420111508_7130.jpg\" /><span></span>\r\n<p>\r\n	&nbsp;\r\n</p>');

-- ----------------------------
-- Table structure for feedback
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
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for goods
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
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '4', 'NO.123', '商品1', '12346', '', '', '商品1售价1234', 'dfgdafg', '234213', 'H:\\upload\\goods\\taiyan_20161213235619.jpg', '/upload/goods/taiyan_20161213235619.jpg', '<p>\r\n	<a href=\"http://www.kopi6.com/protype/list.aspx?id=167\" target=\"_blank\"><strong><span style=\"color:#000000;\">シャネル スーパーコピー</span></strong></a><strong>&nbsp;J12 42 GMT H2126</strong><br />\r\n【&nbsp; 型&nbsp;&nbsp;&nbsp; 番&nbsp; 】H2126&nbsp;<br />\r\n【&nbsp; 機&nbsp;&nbsp;&nbsp; 械&nbsp; 】自動巻き&nbsp;<br />\r\n【 材&nbsp; 質&nbsp; 名 】セラミック&nbsp;<br />\r\n【 タ&nbsp; イ&nbsp; プ 】新品 メンズ&nbsp;<br />\r\n【文 字 盤 色 】ホワイト<br />\r\n【文字 盤 特徴】アラビア&nbsp;<br />\r\n【ケースサイズ】42.0mm&nbsp;<br />\r\n【&nbsp; 機&nbsp;&nbsp;&nbsp; 能&nbsp; 】2タイム表示<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; デイト表示&nbsp;<br />\r\n【 付&nbsp; 属&nbsp; 品 】内 外箱<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ギャランティー\r\n</p>\r\n<img alt=\"\" src=\"http://kopi6.com/upload/image/20160425/20160425121329_3120.jpg\" />', '2017-05-10 01:44:48', '0');
INSERT INTO `goods` VALUES ('4', '8', '', 'test', '29000', '', '\0', '这是一个测试的商品', '关键字', 'tsaetsdf', 'H:\\upload\\goods\\3167854_105129_1_20170416234933.jpg', '/upload/goods/3167854_105129_1_20170416234933.jpg', '<div style=\"text-align:right;\">\r\n	<img src=\"http://localhost/plugins/editor/plugins/emoticons/images/21.gif\" border=\"0\" alt=\"\" /> \r\n</div>', '2017-05-02 23:25:22', '0');
INSERT INTO `goods` VALUES ('5', '6', '', '妹纸', '19000', '', '', '这里是谭慧的直播间', '库里', '库里', 'H:\\upload\\goods\\IMG_0448_20170217230103.JPG', '/upload/goods/IMG_0448_20170217230103.JPG', '<span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span><span>下方</span>', '2017-03-19 20:56:05', null);
INSERT INTO `goods` VALUES ('9', '4', '123', '2', '99800', '', '', '123', '', '', '', null, '这里是内容，看清楚了', '2017-05-10 01:45:09', '0');

-- ----------------------------
-- Table structure for menu
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
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '功能列表', '0', null);
INSERT INTO `menu` VALUES ('2', '商城管理', '0', null);
INSERT INTO `menu` VALUES ('3', '系统设置', '0', null);
INSERT INTO `menu` VALUES ('4', '信息单页', '1', null);
INSERT INTO `menu` VALUES ('5', '文章管理', '1', null);
INSERT INTO `menu` VALUES ('6', '用户反馈', '1', null);
INSERT INTO `menu` VALUES ('7', '广告反馈', '1', null);
INSERT INTO `menu` VALUES ('8', '会社概要', '4', '/backend/pageInfo.action?type=0');
INSERT INTO `menu` VALUES ('9', '注文方法', '4', '/backend/pageInfo.action?type=1');
INSERT INTO `menu` VALUES ('10', '重要事项', '4', '/backend/pageInfo.action?type=2');
INSERT INTO `menu` VALUES ('11', '割引情报', '4', '/backend/pageInfo.action?type=3');
INSERT INTO `menu` VALUES ('12', '注意事项', '4', '/backend/pageInfo.action?type=4');
INSERT INTO `menu` VALUES ('13', '返品返金', '4', '/backend/pageInfo.action?type=5');
INSERT INTO `menu` VALUES ('14', '营业时间', '4', '/backend/pageInfo.action?type=6');
INSERT INTO `menu` VALUES ('15', '配送方式', '4', '/backend/pageInfo.action?type=7');
INSERT INTO `menu` VALUES ('16', '文章列表', '5', '/backend/articleList.action');
INSERT INTO `menu` VALUES ('17', '文章添加', '5', '/backend/articleAdd.action');
INSERT INTO `menu` VALUES ('18', '用户反馈', '6', '/backend/feedback.action');
INSERT INTO `menu` VALUES ('19', '广告列表', '7', '/backend/advertisementList.action');
INSERT INTO `menu` VALUES ('20', '商品类型', '2', null);
INSERT INTO `menu` VALUES ('21', '商品管理', '2', null);
INSERT INTO `menu` VALUES ('22', '订单管理', '2', null);
INSERT INTO `menu` VALUES ('23', '用户管理', '2', null);
INSERT INTO `menu` VALUES ('24', 'EMS管理', '2', null);
INSERT INTO `menu` VALUES ('25', '商品行业', '20', null);
INSERT INTO `menu` VALUES ('26', '品牌类型', '20', null);
INSERT INTO `menu` VALUES ('27', '产品类型', '20', null);
INSERT INTO `menu` VALUES ('28', '行业列表', '25', '/backend/tradeList.action');
INSERT INTO `menu` VALUES ('29', '行业添加', '25', '/backend/tradeAdd.action');
INSERT INTO `menu` VALUES ('30', '品牌列表', '26', '/backend/brandList.action');
INSERT INTO `menu` VALUES ('31', '品牌添加', '26', '/backend/brandAdd.action');
INSERT INTO `menu` VALUES ('32', '产品列表', '27', '/backend/productList.action');
INSERT INTO `menu` VALUES ('33', '产品添加', '27', '/backend/productAdd.action');
INSERT INTO `menu` VALUES ('34', '商品列表', '21', '/backend/goodsList.action');
INSERT INTO `menu` VALUES ('35', '商品添加', '21', '/backend/goodsAdd.action');
INSERT INTO `menu` VALUES ('36', '订单列表', '22', '/backend/orderList.action');
INSERT INTO `menu` VALUES ('37', '用户列表', '23', '/backend/userList.action');
INSERT INTO `menu` VALUES ('38', '追踪列表', '24', '/backend/emsList.action');
INSERT INTO `menu` VALUES ('39', '追踪添加', '24', '/backend/emsAdd.action');
INSERT INTO `menu` VALUES ('40', '管理员管理', '3', '');
INSERT INTO `menu` VALUES ('41', '网站信息', '3', '');
INSERT INTO `menu` VALUES ('42', '管理员列表', '40', '/backend/admin.action');
INSERT INTO `menu` VALUES ('43', '基本信息', '41', '/backend/website.action');

-- ----------------------------
-- Table structure for order
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
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('16', '20170325173958', '姓名', '昵称', '邮编', '2', '住所', '1234567', '1234', '揭示板', null, '113560.00', '[{\"count\":2,\"goodsId\":10}]', '2017-03-25 17:39:58');

-- ----------------------------
-- Table structure for pageinfo
-- ----------------------------
DROP TABLE IF EXISTS `pageinfo`;
CREATE TABLE `pageinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `content` text,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pageinfo
-- ----------------------------
INSERT INTO `pageinfo` VALUES ('1', '8', '标题', '关键字', '阿斯蒂芬', '阿斯蒂芬阿斯蒂芬asd发到付<img src=\"http://localhost/plugins/editor/plugins/emoticons/images/9.gif\" border=\"0\" alt=\"\" />', '2017-01-03 23:06:44');
INSERT INTO `pageinfo` VALUES ('3', '8', '文章2', '啊', '啊', '<img src=\"http://localhost/plugins/editor/plugins/emoticons/images/9.gif\" border=\"0\" alt=\"\" />\r\n<hr />', '2017-01-03 23:48:09');
INSERT INTO `pageinfo` VALUES ('4', '2', '重要事项-スーパーコピー時計|スーパーコピー ブランド 時計(N級品)激安通販店！', 'スーパーコピー時計,スーパーコピーブランド,スーパーコピー代引き,ブランドコピー,ロレックス スーパーコピー', '弊社大人気のスーパーブランドコピー販売、スーパーコピーブランド激安通販専門店。人気ブランド腕時計、バッグ、財布N品が大集合,誠実と信用のサービス!ロレックススーパーコピー,オメガスーパーコピー,シャネルスーパーコピーなど世界有名なブランドコピー商品激安通販！最高級のスーパーコピー時計を激安価格でお届け！送料無料!', '<p align=\"center\">\r\n	<strong><span style=\"color:#E53333;\">お支払い方法について</span></strong> \r\n</p>\r\n<p align=\"left\">\r\n	ご注文完了後に弊社より在庫の有無をメールにてお知らせいたします。メールをお受け取り頂いた後に、指定の口座に代金を振り込んでいただきます。弊社でご入金を確認後、発送手配をいたします。<br />\r\n*1&nbsp;商品の性質上、弊社にご注文いただいた時点での在庫確認となります。完売の場合にはご連絡いたしますので、その時に入荷までお待ちいただくか、キャンセルされるかお決め下さい。<br />\r\n*2&nbsp;お振込手数料はお客様のご負担でお願いいたします。<br />\r\n*3&nbsp;ご注文頂いた後に当方から確認メールをさせて頂きます。(在庫がない場合もメールにてお知らせ致します。)その内容を確認して頂いてから1週間以内にご連絡頂けない場合はキャンセルとさせて頂きます。<br />\r\n*4&nbsp;ご入金確認後、順次発送いたします。<br />\r\n*5&nbsp;商品到着日指定はお受けしておりません。<br />\r\n振込先口座:三菱東京ＵＦＪ銀行、三井住友銀行、楽天銀行&nbsp;等。\r\n</p>\r\n<p align=\"left\">\r\n	<br />\r\n</p>\r\n<p align=\"left\">\r\n	<br />\r\n</p>\r\n<p align=\"center\">\r\n	<strong><span style=\"color:#E53333;\">&nbsp;</span></strong><strong><span style=\"color:#E53333;\">返品交換について</span></strong> \r\n</p>\r\n<p align=\"left\">\r\n	商品の品質には万全の注意を払っておりますが、万が一配送中に下記のような事故が生じた場合、返品?交換を諸費用当店負担にて対応させていただきます。<br />\r\n<span style=\"color:#E53333;\">※下記項目の場合、返品、交換をお受け出来ません?</span><br />\r\n1)ブレス調整を行った商品、またはお取り寄せの商品は<br />\r\n&nbsp; 返品、交換は一切お受け出来ませんのでご了承下さい。<br />\r\n2)返品、交換の場合、送料及び返金の際の振込み手数料は、<br />\r\n&nbsp; お客様のご負担とさせて頂きます。<br />\r\n3)店頭にてお買上げ頂いた商品は、お客様にご納得の上、お買い求め頂いておりますの&nbsp; で 商品の&nbsp; 性質上いかなる場合であっても、ご返品はお受けできませんのでご注意下&nbsp; さい<br />\r\n&nbsp; ※ご返品のお取り扱いが出来ない場合でも、お買取<br />\r\n4)時計についている保護シール等をはがした場合、返品、交換は一切お受け出来ません&nbsp; のでご了&nbsp; 承下さい。<br />\r\n5)革、ラバーベルトは、ベルト穴に通された商品の返品、交換は一切お受け出来ません&nbsp; のでご了&nbsp; 承下さい。<br />\r\n&nbsp; ご返金は、返品商品到着後、ご指定の口座にお振込みいたします。<br />\r\n&nbsp; メールアドレス：<strong><span style=\"color:#E53333;\">acopy777@163.com</span></strong> \r\n</p>\r\n<p align=\"left\">\r\n	<br />\r\n</p>\r\n<p align=\"left\">\r\n	<br />\r\n</p>\r\n<p align=\"left\">\r\n	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style=\"color:#E53333;\"><strong>個人情報保護方針</strong></span>&nbsp;&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n	ウォッチゲート（以下、「当サイト」）は、サービスのご提供にあたり、お客様の個人情報をお預かりしております。<br />\r\n当サイトは、お客様の個人情報を保護し、お客様に更なる信頼性と安心感をご提供できるように努めて参ります。<br />\r\n当サイトは、個人情報に関する法令を遵守し、個人情報の適切な取り扱いを実現致します。<br />\r\n1.&nbsp;<span style=\"color:#006600;\">個人情報の取得について</span><br />\r\n当サイトは、偽りその他不正の手段によらず適正に個人情報を取得致します。<br />\r\n2.&nbsp;<span style=\"color:#006600;\">個人情報の利用について</span><br />\r\n当サイトは、個人情報を以下の利用目的の達成に必要な範囲内で、利用致します。<br />\r\n以下に定めのない目的で個人情報を利用する場合、あらかじめご本人の同意を得た上で行います。\r\n</p>\r\n<p>\r\n	(1):ご注文<br />\r\n&nbsp;&nbsp;&nbsp; 取得内容:&nbsp;&nbsp;&nbsp; お名前.郵便番号.ご住所.電話番号.メールアドレス.商品名.宅配伝票名.希望配達日時?備考<br />\r\n&nbsp;&nbsp;&nbsp; 利用目的:&nbsp; A.ご注文の確認.発送完了メールなどのご注文に関するお知らせ<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B.ご注文いただいた商品の梱包.発送<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C.ご購入された商品の情報は商品売上の集計や購入動向などの統計の為に使用しますが、個人が特&nbsp;定 可能な処&nbsp;\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"background-color:#FFFFFF;\">理は致しません</span><br />\r\n&nbsp;3.&nbsp;<span style=\"color:#006600;\">個人情報の安全管理について</span><br />\r\n当サイトは、取り扱う個人情報の漏洩、滅失または、き損の防止その他の個人情報の安全管理のために必要かつ適切な措置を講じます。<br />\r\n4.&nbsp;<span style=\"color:#006600;\">個人情報の委託について</span><br />\r\n当サイトは、個人情報の取り扱いの全部または一部を第三者に委託する場合は、当該第三者について厳正な調査を行い、取り扱いを委託された個人情報の安全管理が図られるよう当該第三者に対する必要かつ適切な監督を行います。<br />\r\n5.&nbsp;<span style=\"color:#006600;\">個人情報の第三者提供について</span><br />\r\n当サイトは、個人情報保護法等の法令に定めのある場合を除き、個人情報をあらかじめご本人の同意を得ることなく、第三者に提供致しません。<br />\r\n6.&nbsp;<span style=\"color:#006600;\">個人情報の開示?訂正等について</span><br />\r\n当サイトは、ご本人から自己の個人情報についての開示の請求がある場合、速やかに開示を致します。<br />\r\nその際、ご本人であることが確認できない場合には、開示に応じません。<br />\r\n個人情報の内容に誤りがあり、ご本人から訂正、追加、削除の請求がある場合、調査の上、速やかにこれらの請求に対応致します。<br />\r\nその際、ご本人であることが確認できない場合には、これらの請求に応じません。<br />\r\n当サイトの個人情報の取り扱いにつきまして、上記の請求、お問い合わせ等ございましたら、<br />\r\n下記までご連絡くださいますようお願い申し上げます。<br />\r\nメールアドレス:<strong><span style=\"color:#E53333;\">acopy777@163.com</span></strong> \r\n</p>', '2017-10-27 17:20:29');
INSERT INTO `pageinfo` VALUES ('5', '6', '', '', '', '<p>\r\n	<span style=\"color:#E53333;\"> </span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#E53333;\"><strong>※ご注文</strong></span><br />\r\n<span style=\"color:#000000;\">営業時間9:00～24:00 \r\nご注文受付、24時間受け付けております。 メールご注文は9:00～24:00の受け付けとなっております。</span><br />\r\n<span style=\"color:#E53333;\"><strong>※お問い合わせ</strong></span><br />\r\n<span style=\"color:#000000;\">ホームページ.メールのお問い合わせは、24時間受け付けております。 \r\nサーバメンテナンス等でお休みを頂く場合や、年末年始等の長期休暇の際にはサイト上にてご案内させて頂きます。</span><br />\r\n<span style=\"color:#E53333;\"><strong>返品について</strong></span><br />\r\n<span style=\"color:#000000;\">お客様の都合による商品の返品/交換、キャンセル等は承っておりません。お届けした商品に破損や品違いがございましたら、商品到着後3日以内にご連絡ください。</span><br />\r\n<span style=\"color:#E53333;\"><strong>受注発注について</strong></span><br />\r\n<span style=\"color:#000000;\">「受注発注」表記の仕様は、ご決済完了後にお取り寄せする商品です。在庫状況により5日から最大2週間程度お時間を頂く場合がございます。予め納期をご確認の上、ご購入いただきますようお願いいたします。</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '2017-10-27 17:12:08');
INSERT INTO `pageinfo` VALUES ('6', '0', '会社概要-スーパーコピー時計|スーパーコピー ブランド 時  計(N級品)激安通販店！', 'スーパーコピー時計,スーパーコピーブランド,スー  パーコピー代引き,ブランドコピー,ロレックス ス  ーパーコピー', '弊社大人気のスーパーブランドコピー販売、スーパーコピーブランド激安通販専門店。人気ブランド腕時計、バッグ、財布N品が大集合,誠実と信用のサービス!ロレックススーパーコピー,オメガスーパーコピー,シャネルスーパーコピーなど世界有名なブランドコピー商品激安通販！最高級のスーパーコピー時計を激安価格でお届け！送料無料!', '<div class=\"__kindeditor_paste__\">\r\n	<table border=\"5\" cellspacing=\"0\" bordercolor=\"#666666\" cellpadding=\"2\" align=\"left\" style=\"margin:0px;padding:0px;color:#434343;font-family:微软雅黑;font-size:12px;width:750px;height:50px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<p align=\"center\">\r\n						<strong><span style=\"font-size:18px;\">&nbsp;</span></strong><strong><span style=\"font-size:18px;\">業界最高品質</span></strong><strong><span style=\"font-size:18px;\">スーパーコピーブランド</span><span style=\"font-size:18px;\">激安専門店</span><span style=\"font-size:18px;\"><span style=\"color:#E53333;\">&nbsp;acopy777</span></span></strong> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p style=\"color:#434343;font-family:微软雅黑;font-size:12px;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"color:#434343;font-family:微软雅黑;font-size:12px;\">\r\n		<br />\r\n	</p>\r\n	<table border=\"3\" cellspacing=\"0\" bordercolor=\"#999999\" cellpadding=\"2\" style=\"margin:0px;padding:0px;color:#434343;font-family:微软雅黑;font-size:12px;background-color:#DFC5A4;width:754px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<p align=\"center\">\r\n						<span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span><span><span style=\"color:#333333;font-size:14px;\"><strong>社&nbsp;</strong></span><span style=\"color:#333333;font-size:14px;\"><strong>名</strong></span></span></span> \r\n					</p>\r\n				</td>\r\n				<td>\r\n					<p align=\"left\">\r\n						<span><span style=\"color:#333333;font-size:14px;\"><strong>&nbsp;トウウ株式会社</strong></span><span style=\"color:#333333;font-size:14px;\"><strong>--acopy777<strong>ブランドコピー館</strong></strong></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<p align=\"center\">\r\n						<span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\"><strong>本社住所</strong></span> \r\n					</p>\r\n				</td>\r\n				<td>\r\n					<p align=\"left\">\r\n						<span><span style=\"color:#333333;font-size:14px;\">&nbsp;<span>中国&nbsp;</span><span>広州</span></span><span style=\"color:#333333;font-size:14px;\">&nbsp;（商品配送）</span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<p align=\"center\">\r\n						<span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\"><strong>お問合せ先</strong></span> \r\n					</p>\r\n				</td>\r\n				<td>\r\n					<p align=\"left\">\r\n						<span style=\"color:#333333;\"><span style=\"font-size:14px;\">&nbsp;<b>acopy777@163.com</b></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<p align=\"center\">\r\n						<span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\"><strong>店舗URL</strong></span> \r\n					</p>\r\n				</td>\r\n				<td>\r\n					<p align=\"left\">\r\n						<span style=\"color:#333333;\"><span style=\"font-size:14px;\"><strong><em>&nbsp;http://www.acopy777.com</em></strong></span></span><strong><em><a href=\"http://www.2020-kopi.com/\" target=\"_blank\"></a></em></strong> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<p align=\"center\">\r\n						<span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\"><strong>運営責任者</strong></span> \r\n					</p>\r\n				</td>\r\n				<td>\r\n					<p align=\"left\">\r\n						<span><span style=\"color:#333333;font-size:14px;\">&nbsp;上井 合香</span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<p align=\"center\">\r\n						<span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\"><strong>会社の設立</strong></span> \r\n					</p>\r\n				</td>\r\n				<td>\r\n					<p align=\"left\">\r\n						<span><span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\">2008年12月</span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<p align=\"center\">\r\n						<span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\"><strong>資本金</strong></span> \r\n					</p>\r\n				</td>\r\n				<td>\r\n					<p align=\"left\">\r\n						<span><span><span style=\"color:#333333;font-size:14px;\">&nbsp;3</span><span style=\"color:#333333;font-size:14px;\">000万円</span></span><span style=\"color:#333333;font-size:14px;\">&nbsp;</span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<p align=\"center\">\r\n						<span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\"><strong>従業員数</strong></span> \r\n					</p>\r\n				</td>\r\n				<td>\r\n					<p align=\"left\">\r\n						<span><span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\">30名</span><span style=\"color:#333333;font-size:14px;\">&nbsp;</span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<p align=\"center\">\r\n						<span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\"><strong>営業時間</strong></span> \r\n					</p>\r\n				</td>\r\n				<td>\r\n					<span style=\"color:#333333;font-size:14px;\">&nbsp;</span><span style=\"color:#333333;font-size:14px;\">09:00～22:00 (365天</span><strong><span style=\"color:#333333;font-size:14px;\">メール2</span></strong><strong><span style=\"color:#333333;font-size:14px;\">4</span></strong><strong><span style=\"color:#333333;font-size:14px;\">時間受付中</span></strong><span style=\"color:#333333;font-size:14px;\">)</span> \r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<table border=\"3\" cellspacing=\"0\" bordercolor=\"#999999\" cellpadding=\"2\" style=\"margin:0px;padding:0px;color:#434343;font-family:微软雅黑;font-size:12px;background-color:#DFC5A4;width:754px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<span style=\"color:#333333;font-size:14px;\"><strong>弊</strong></span><span style=\"color:#333333;font-size:14px;\"><strong>社</strong></span><span style=\"color:#333333;font-size:14px;\"><strong>方</strong></span><span style=\"color:#333333;font-size:14px;\"><strong>針</strong></span> \r\n				</td>\r\n				<td>\r\n					<span style=\"color:#333333;\"><span style=\"color:#E53333;font-size:14px;\">1.当社の目標は最高のインターネットサービスご提供することです.弊社は24時間営業、年中無休.&nbsp;</span><br />\r\n<span style=\"color:#E53333;font-size:14px;\">2.品質を重視、納期も厳守、信用第一は当社の方針です.&nbsp;</span><br />\r\n<span style=\"color:#E53333;font-size:14px;\">3.日本には無い商品,日本では高価な商品,弊社のない商品,取引先を代理して製造会社を連絡することができる.&nbsp;</span><br />\r\n<span style=\"color:#E53333;font-size:14px;\">4.弊社長年の豊富な経験と実績があり.輸入手続も一切は弊社におまかせできます.ご希望の商品を責任を持ってお届けします.&nbsp;</span><br />\r\n<span style=\"color:#E53333;\"></span><span style=\"color:#E53333;font-size:14px;\"><strong>★経営理念:</strong></span><br />\r\n<span style=\"color:#E53333;font-size:14px;\">1.最も合理的な価格で商品を消費者に提供致します.&nbsp;</span><br />\r\n<span style=\"color:#E53333;font-size:14px;\">2.弊社の商品品数大目で、商品は安めです]！★商品現物写真★&nbsp;</span><br />\r\n<span style=\"color:#E53333;font-size:14px;\">3.数量制限無し、一個の注文も、ＯＫです.&nbsp;</span><br />\r\n<span style=\"color:#E53333;font-size:14px;\">4.1個も1万個も問わず、誠心誠意対応します.&nbsp;</span><br />\r\n<span style=\"color:#E53333;font-size:14px;\">5不良品の場合、弊社が無償で交換します.&nbsp;</span><br />\r\n<span style=\"color:#E53333;font-size:14px;\">( スーパーコピーブランドの計算方法数量、重量品目に関わらず、速達便一律送料無料)</span></span> \r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<span style=\"color:#333333;font-size:14px;\"><span><strong>個人情報</strong></span></span> \r\n				</td>\r\n				<td>\r\n					<span style=\"font-size:14px;\"><span style=\"color:#333333;\">個人情報は保護する:お客様から頂いた個人情報は商品の発送とご連絡以外には一切使用致しま&nbsp;</span><span style=\"color:#333333;\">せん。</span> \r\n					<p>\r\n						<span></span><span style=\"color:#333333;\">当社</span><span style=\"color:#333333;\">が責</span><span style=\"color:#333333;\">任を持って安全に蓄積・保管し、第三者に譲渡・提供することはございません。</span> \r\n					</p>\r\n</span> \r\n					<p>\r\n						<br />\r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<span style=\"color:#333333;font-size:14px;\"><span><span><strong>営業種目</strong></span></span></span> \r\n				</td>\r\n				<td>\r\n					<span style=\"font-size:14px;\"><span><span style=\"color:#333333;\">スーパーコピー時計、ブランドバックコピー、スーパーコピー財布、ブランドベルトコピー、</span><span style=\"color:#333333;\">万年筆偽物等。</span></span></span> \r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<span style=\"color:#333333;font-size:14px;\"><strong>ブランド</strong></span> \r\n				</td>\r\n				<td>\r\n					<p>\r\n						<span style=\"color:#333333;\"><span style=\"font-size:14px;\">【</span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">ロレックス</span></span><span style=\"color:#333333;\">】</span></span><span style=\"font-size:14px;color:#333333;\"><span>【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">オメガ</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">IWC</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">ウブロ</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">カルティエ</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">パネライ</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">シャネル</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">ゼニス</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">エルメス</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">グッチ</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">ブルガリ</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">ガガミラノ</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">チュードル</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">ルイヴィトン</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">タグホイヤー</span></span><span style=\"color:#333333;\">】【</span></span></span><span><span style=\"font-size:14px;\"><span style=\"color:#333333;\"><span style=\"color:#333333;\">ブライトリング</span></span><span style=\"color:#333333;\">】</span></span><span style=\"color:#333333;font-size:14px;\">等</span></span><strong><span style=\"color:#333333;font-size:14px;\"></span></strong> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<span style=\"color:#333333;font-size:14px;\"><strong>メール連絡</strong></span> \r\n				</td>\r\n				<td>\r\n					<span style=\"color:#333333;font-size:14px;\">不明点、疑問点等があれば、ご遠慮なく言って下さい. 以上　よろしくお願いいたします。</span> \r\n					<p>\r\n						<span><span style=\"color:#333333;font-size:14px;\"><strong>連絡</strong></span><span style=\"color:#333333;font-size:14px;\"><strong>Email :acopy777@163.com</strong></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>', '2017-10-27 17:39:26');
INSERT INTO `pageinfo` VALUES ('7', '1', '注文方法-スーパーコピー時計|スーパーコピー ブランド 時計(N級品)激安通販店！', 'スーパーコピー時計,スーパーコピーブランド,スーパーコピー代引き,ブランドコピー,ロレックス スーパーコピー', '弊社大人気のスーパーブランドコピー販売、スーパーコピーブランド激安通販専門店。人気ブランド腕時計、バッグ、財布N品が大集合,誠実と信用のサービス!ロレックススーパーコピー,オメガスーパーコピー,シャネルスーパーコピーなど世界有名なブランドコピー商品激安通販！最高級のスーパーコピー時計を激安価格でお届け！送料無料!', '<h2>\r\n	<strong> \r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		1.新規会員登録、ご利用いただくのは会員登録は必用です、既に登録済みの場合ログイン後にご利用くださませ。<br />\r\n2.商品を選び。<br />\r\n<span style=\"font-size:14px;\">3.</span><span><span style=\"font-size:14px;\">ご購入商品の商品名</span><span style=\"font-size:14px;\">、</span><span style=\"font-size:14px;\">価格</span><span style=\"font-size:14px;\">、</span><span style=\"font-size:14px;\">小計金額をお確かめ。</span></span><br />\r\n<span style=\"font-size:14px;\">4.</span><span><span style=\"font-size:14px;\">ご注文を承り後</span><span style=\"font-size:14px;\">、</span><span style=\"font-size:14px;\">在庫確認をし</span><span style=\"font-size:14px;\">、</span><span style=\"font-size:14px;\">お客様への商品を確保しました上で</span><span style=\"font-size:14px;\">、</span><span style=\"font-size:14px;\">ご注文日の12時間以内</span><span style=\"font-size:14px;\">、</span><span style=\"font-size:14px;\">注文確認メールをお</span></span> \r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<span><span style=\"font-size:14px;\">&nbsp; &nbsp;送</span></span>りいたします。万一メール届かないの場合、当社まで御一報お願いします。\r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<span style=\"font-size:14px;\">5.</span><span><span style=\"font-size:14px;\">支払い総額とお振り替え口座名のメール到着後</span><span style=\"font-size:14px;\">、</span><span style=\"font-size:14px;\">ご入金にお願いいたします。</span></span><br />\r\n<span style=\"font-size:14px;\">6.</span><span style=\"font-size:14px;\">入金確認後、商品を発送準備します。発送完了ご追跡番号をメールにてご連絡いたします。</span><br />\r\n<span style=\"font-size:14px;\">7.</span><span><span style=\"font-size:14px;\">商品到着</span><span style=\"font-size:14px;\">、</span><span style=\"font-size:14px;\">商品平</span></span><span style=\"font-size:14px;\">均到着時間：4～6営業日</span><span style=\"font-size:14px;\">。</span> \r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"color:#333333;font-family:Tahoma;background-color:#FFFFFF;\">\r\n		<span><br />\r\n</span> \r\n	</p>\r\n	<p style=\"background-color:#FFFFFF;\">\r\n		<strong><span style=\"color:#E53333;\">E-mail注文</span><span><span style=\"font-size:14px;color:#E53333;\">：</span><span style=\"font-size:14px;\"><span style=\"font-size:18px;color:#E53333;\">acopy777@163.com</span><span style=\"font-size:18px;\"></span></span></span></strong> \r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<strong><span style=\"color:#E53333;\">例：</span></strong> \r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<span style=\"font-size:16px;color:#333333;\"></span> \r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<span style=\"color:#E53333;\"><span style=\"font-size:16px;color:#E53333;\">井上 合香 &nbsp;様&nbsp;</span></span> \r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<span><span style=\"font-size:16px;color:#337FE5;\">こんばんは！&nbsp;<br />\r\nはじめまして！<br />\r\n当方注文依頼。<br />\r\n在庫確認願う。&nbsp;<br />\r\n☆ 商品品番：XXXX&nbsp;<br />\r\n☆ サイズ：XXXX&nbsp;<br />\r\n☆ 価格：XXXX&nbsp;<br />\r\n☆ 氏名：XXXX&nbsp;<br />\r\n☆ フリガナ：XXXX&nbsp;<br />\r\n☆ 住所：XXXX&nbsp;<br />\r\n☆ 電話：XXXX&nbsp;<br />\r\n☆ 郵便番号：XXXX&nbsp;<br />\r\n在庫有場合即注文＆振込可能連絡待つ。<br />\r\n以上</span></span> \r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<span style=\"font-size:9px;line-height:1.5;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span> \r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<br />\r\n	</p>\r\n	<h2>\r\n		<strong> \r\n		<p style=\"color:#333333;font-family:Tahoma;background-color:#FFFFFF;\">\r\n			<span style=\"color:#9933E5;\"><span style=\"color:#009900;\"><span style=\"color:#000000;\"><span style=\"color:#666666;\"><span style=\"color:#000000;\"><span style=\"color:#009900;\"><span style=\"color:#000000;\"><span style=\"color:#009900;\"><span style=\"color:#000000;\"><strong><span style=\"font-size:14px;\">注意事項</span></strong><span style=\"color:#E53333;font-size:18px;\"><strong></strong></span><span style=\"color:#E53333;font-size:18px;\"><strong></strong></span></span></span></span></span></span></span></span></span></span> \r\n		</p>\r\n		<p style=\"color:#333333;font-family:Tahoma;background-color:#FFFFFF;\">\r\n			<span style=\"color:#9933E5;\"><span style=\"color:#009900;\"><span style=\"color:#000000;font-size:14px;\"><span style=\"color:#333333;font-size:14px;\"><strong>※&nbsp;</strong></span></span><span style=\"color:#000000;\"><span style=\"color:#333333;font-size:14px;\">お</span><strong><span style=\"color:#E53333;font-size:14px;\">@docomo.ne.jp</span></strong><span style=\"color:#333333;font-size:14px;\">のメールアドレス.私達はあなたと連絡することができません.その他のメールアドレスを変更して下さい。</span></span></span></span><strong></strong> \r\n		</p>\r\n		<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n			<br />\r\n		</p>\r\n</strong> \r\n	</h2>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p style=\"color:#333333;font-family:Tahoma;background-color:#FFFFFF;\">\r\n		<span><span style=\"color:#9933E5;\"><span style=\"color:#009900;\"><span style=\"color:#000000;\"><span style=\"color:#333333;\"> </span></span></span></span></span>\r\n	</p>\r\n	<p style=\"font-size:13px;color:#444444;font-family:Simsun;\">\r\n		<strong><strong><span style=\"color:#E53333;font-size:14px;\"><strong>@docomo.ne.jp受信／拒否設定とは、</strong></span><span style=\"font-size:14px;\">&nbsp;<span style=\"color:#000000;\">「取引先の情報、当店は絶対に秘密にします.@docomo.ne.jpのメールアドレス.私達はあなたと連絡することができません,非常に申し訳なくて、メールアドレスを変更して下さい.」</span></span></strong></strong> \r\n	</p>\r\n	<p style=\"font-size:13px;color:#444444;font-family:Simsun;\">\r\n		<strong><span style=\"color:#E53333;font-size:14px;\"><strong>あるいは、地域の制限を解除します</strong></span><span style=\"font-size:14px;\">&nbsp;<span style=\"color:#000000;\">詳しい方法:下記のＵＲ</span>Ｌ</span><a href=\"http://www.nttdocomo.co.jp/info/spam_mail/measure/domain/\"><span style=\"font-size:14px;color:#003399;\">http://www.nttdocomo.co.jp/info/spam_mail/measure/domain/</span></a><span style=\"font-size:14px;\">&nbsp;<span style=\"color:#000000;\">「注文前にご希望の商品の在庫を確認してお知らせいたしま</span><span style=\"color:#000000;\">す。」</span></span><br />\r\n<span style=\"font-size:14px;color:#000000;\">「ご希望に添えない場合も御座いますがご了承ください」&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">「ＨＰ未掲載品でも他店の商品の詳細ページのＵＲＬを送っていただければ在庫を確認しご連絡いたします。」&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">トラブル、誤解などを防止するために以下の注意事項を記載させていただきました。&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">不快を生じないために、よくお読みください。&nbsp;</span><br />\r\n<br />\r\n<span style=\"font-size:14px;color:#000000;\">当ショップでは商品の品質保証をさせていただきますので、ご安心ください。&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">発送には最大な注意を計らいますが、万一不良品が届いた場合は、無条件で再送いたします。不良品が届いた時 は、その商品の不良箇所をデ</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">ジタルカメラで撮影し、サポートページの送信フォームを利用して送ってください。&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">海外からの商品直送になりますので、通関による到着遅れが生じることがございます。当ショップでは商品必着保証をしていますので、ご安心くだ&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">さい。到着遅れですぐに”詐欺”だと騒ぎ立てる方の購入はご遠慮ください。&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">当ショップは長い期間経営してきましたので、品質、発送、サービスには問題が一切ありません。</span></strong> \r\n	</p>\r\n<span style=\"color:#333333;\"></span> \r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p style=\"color:#333333;font-family:Tahoma;background-color:#FFFFFF;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"color:#333333;font-family:Tahoma;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:24px;color:#9933E5;\"><strong>振込方法</strong></span><span style=\"font-size:16px;\"><strong>【弊社は銀行振込のみとなります】</strong></span> \r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<span><span style=\"font-size:14px;color:#333333;\"><br />\r\n</span></span> \r\n	</p>\r\n	<p style=\"color:#444444;font-family:Simsun;font-size:12px;\">\r\n		<span><span style=\"font-size:14px;color:#333333;\">ご注文後、在庫を確認の上、ご注文日の12時間以内、当店よりお支払い総額とお振り替え口座名をメール</span><span style=\"font-size:14px;color:#333333;\">にてお知らせいたします</span><span style=\"font-size:14px;color:#333333;\">。万か一メール届かないの場合、当社まで御一報お願いします。</span></span> \r\n	</p>\r\n<span style=\"color:#E53333;font-family:Simsun;font-size:12px;\"><strong><span style=\"color:#333333;font-size:14px;\"><span><span><span><span><span><span><span><span><span><span><span><span><span><span><span><span><strong><span>※</span></strong></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></strong><span style=\"color:#333333;font-size:14px;\">振り込み手数料は、お客様負担となり、送料は弊社が負担致します。</span></span><br />\r\n<span style=\"color:#E53333;font-family:Simsun;font-size:12px;\"><span style=\"color:#333333;font-size:14px;\"><strong><span><span><span><span><span><span><span><span><span><span><span><span><span><span><span><span><span><strong><span>※</span></strong></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></strong></span><span style=\"color:#333333;font-size:14px;\">入金確認後の発送となります。</span></span><br />\r\n<span style=\"color:#E53333;font-family:Simsun;font-size:12px;\"><strong><span style=\"color:#333333;font-size:14px;\"><span><span><span><span><span><span><span><span><span><span><span><span><span><span><span><span><strong><span>※</span></strong></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></strong><span style=\"color:#333333;font-size:14px;\">ご注文確定日より3日経っても入金がない場合、キャンセル扱いとします。</span></span><br />\r\n<span style=\"color:#E53333;font-family:Simsun;font-size:12px;\"><span style=\"color:#333333;font-size:14px;\"><strong><span><span><span><span><span><span><span><span><span><span><span><span><span><span><span><span><span><strong><span>※</span></strong></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></strong></span><span style=\"color:#333333;font-size:14px;\">ご希望の銀行から振込みしてください。</span></span><span style=\"color:#333333;font-family:Simsun;\">&nbsp;</span><span style=\"color:#444444;font-family:Simsun;font-size:12px;\">&nbsp;</span><span><span style=\"background-color:#999999;\"></span></span></strong> \r\n</h2>\r\n<p>\r\n	<strong><span style=\"color:#444444;font-family:Simsun;font-size:12px;\"><img src=\"http://www.007copy.com/kindeditor/attached/image/20141021/20141021101107_5831.gif\" /><br />\r\n</span></strong> \r\n</p>', '2017-10-27 17:50:50');
INSERT INTO `pageinfo` VALUES ('8', '3', '割引情报-スーパーコピー時計|スーパーコピー ブランド 時計(N級品)激安通販店！', 'スーパーコピー時計,スーパーコピーブランド,スーパーコピー代引き,ブランドコピー,ロレックス スーパーコピー', '弊社大人気のスーパーブランドコピー販売、スーパーコピーブランド激安通販専門店。人気ブランド腕時計、バッグ、財布N品が大集合,誠実と信用のサービス!ロレックススーパーコピー,オメガスーパーコピー,シャネルスーパーコピーなど世界有名なブランドコピー商品激安通販！最高級のスーパーコピー時計を激安価格でお届け！送料無料!', '<p>\r\n	<strong><span style=\"color:#E53333;\">&nbsp;</span></strong> \r\n</p>\r\n<p align=\"center\">\r\n	<strong><strong><span style=\"font-size:16px;\">最新フィードバックイベント!注文割引開催中</span></strong></strong> \r\n</p>\r\n<p align=\"center\">\r\n	<strong><strong><span style=\"font-size:16px;\"></span></strong>&nbsp;</strong> \r\n</p>\r\n<p align=\"center\">\r\n	<strong><br />\r\n</strong> \r\n</p>\r\n<p align=\"center\">\r\n	<strong><span style=\"color:#333333;\"><strong>1.</strong></span><span style=\"color:#333333;\">&nbsp;</span></strong> \r\n</p>\r\n<p align=\"center\">\r\n	<strong><span style=\"color:#E53333;\">★注文金額5万円【割引：8%OFF】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;★注文金額10万円【割引：14%OFF】</span><br />\r\n<span style=\"color:#E53333;\">★注文金額20万円【割引：19%OFF】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;★注文金額30万円【割引：22%OFF】</span><br />\r\n*低価格を提供する。&nbsp;<br />\r\n*実物写真、付属品を完備する。&nbsp;<br />\r\n*100%品質を保証する。&nbsp;<br />\r\n*納期を厳守する。&nbsp;<br />\r\n*送料は無料です(日本全国)! みんなのご光臨を歓迎します。</strong> \r\n</p>\r\n<p align=\"center\">\r\n	<strong>&nbsp;</strong> \r\n</p>\r\n<p align=\"center\">\r\n	<strong>2 .</strong> \r\n</p>\r\n<p align=\"center\">\r\n	<strong><span style=\"color:#E53333;\"></span></strong><strong>新規会員登録、注文金額2万円以上，記念品を贈る（一回制限）。</strong> \r\n</p>\r\n<p align=\"center\">\r\n	<span style=\"color:#E53333;\"><strong>累計注文金額5万円以上，贈呈価値5000円商品。</strong></span> \r\n</p>\r\n<p align=\"center\">\r\n	<span style=\"color:#E53333;\"><strong>累計注文金額10万円以上，贈呈価値15000円商品。</strong></span> \r\n</p>\r\n<p align=\"center\">\r\n	<span style=\"color:#E53333;\"><strong>累計注文金額20万円以上，贈呈価値4万円商品。</strong></span> \r\n</p>\r\n<p align=\"center\">\r\n	<span style=\"color:#E53333;\"><strong>累計注文金額50万円以上，贈呈価値11万円商品。</strong></span> \r\n</p>\r\n<p align=\"center\">\r\n	<span style=\"color:#E53333;\"><strong>累計注文金額100万円以上，贈呈価値25万円商品。</strong></span> \r\n</p>', '2017-10-27 17:10:02');
INSERT INTO `pageinfo` VALUES ('9', '4', '', '', '', '<p>\r\n	<strong><span style=\"font-size:24px;font-family:Tahoma;color:#E53333;\">振込方法<span class=\"Apple-converted-space\">&nbsp;</span><span style=\"font-size:14px;\"><span style=\"font-size:16px;color:#000000;\">【</span><strong><span style=\"font-size:16px;color:#000000;\">弊社は銀行振込のみとなります</span></strong><span style=\"font-size:16px;color:#000000;\">】</span></span></span></strong> \r\n</p>\r\n<p>\r\n	<strong><span style=\"font-size:24px;font-family:Tahoma;color:#E53333;\"><span style=\"font-size:14px;\"><span style=\"font-size:16px;color:#000000;\"></span></span></span></strong>ご注文後、在庫を確認の上、ご注文日の12時間以内、当店よりお支払い総額とお振り替え口座名をメールにてお知らせいたします。万か一メール届かないの場合、当社まで御一報お願いします。<br />\r\n&nbsp;※ 振り込み手数料は、お客様負担となり、送料は弊社が負担致します。<br />\r\n&nbsp;※ 入金確認後の発送となります。<br />\r\n&nbsp;※ ご注文確定日より3日経っても入金がない場合、キャンセル扱いとします。<br />\r\n&nbsp;※ ご希望の銀行から振込みしてください。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>ご注文する前にご確認下さい。</strong> \r\n</p>\r\n<p style=\"color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\">（1）実際の商品とモニター上の画像に差が生じる場合があります。パソコンのモニターの特性や設定に色が異なって表現される場合があります。また、大きな商品を小さな画像で表現している関係上、細部の仕様が不鮮明であったり、素材感等にも違いが出る場合もあります。予めご了承下さい。※ お電話によるご注文は受け付けておりません。 （2）ご注文頂いてから三日間以内に入金されてない場合、注文書は自動的にキャンセルとさせて頂きます。</span> \r\n</p>\r\n<p style=\"color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\">お問い合わせご質問・お問い合わせは掲示板または下記のメールアドレスをご利用下さい。メールアドレス<span style=\"color:#E53333;\"><span style=\"background-color:#FFFFFF;color:#000000;\">：</span><strong>acopy777@163.com</strong><strong></strong></span></span>\r\n</p>\r\n<p style=\"color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><span style=\"color:#E53333;\"><strong><br />\r\n</strong></span></span>\r\n</p>\r\n<p style=\"color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><span style=\"color:#E53333;\"><strong>\r\n	<p style=\"font-size:13px;color:#444444;font-family:Simsun;\">\r\n		<strong><strong><span style=\"color:#E53333;font-size:14px;\"><strong>.@docomo.ne.jp受信／拒否設定とは、</strong></span><span style=\"font-size:14px;\">&nbsp;<span style=\"color:#000000;\">「取引先の情報、当店は絶対に秘密にします.@docomo.ne.jpのメールアドレス.私達はあなたと連絡することができません,非常に申し訳なくて、メールアドレスを変更して下さい.」</span></span></strong></strong>\r\n	</p>\r\n	<p style=\"font-size:13px;color:#444444;font-family:Simsun;\">\r\n		<strong><span style=\"color:#E53333;font-size:14px;\"><strong>あるいは、地域の制限を解除します</strong></span><span style=\"font-size:14px;\">&nbsp;<span style=\"color:#000000;\">詳しい方法:下記のＵＲ</span>Ｌ</span><a href=\"http://www.nttdocomo.co.jp/info/spam_mail/measure/domain/\"><span style=\"font-size:14px;color:#003399;\">http://www.nttdocomo.co.jp/info/spam_mail/measure/domain/</span></a><span style=\"font-size:14px;\">&nbsp;<span style=\"color:#000000;\">「注文前にご希望の商品の在庫を確認してお知らせいたしま</span><span style=\"color:#000000;\">す。」</span></span><br />\r\n<span style=\"font-size:14px;color:#000000;\">「ご希望に添えない場合も御座いますがご了承ください」&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">「ＨＰ未掲載品でも他店の商品の詳細ページのＵＲＬを送っていただければ在庫を確認しご連絡いたします。」&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">トラブル、誤解などを防止するために以下の注意事項を記載させていただきました。&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">不快を生じないために、よくお読みください。&nbsp;</span><br />\r\n<br />\r\n<span style=\"font-size:14px;color:#000000;\">当ショップでは商品の品質保証をさせていただきますので、ご安心ください。&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">発送には最大な注意を計らいますが、万一不良品が届いた場合は、無条件で再送いたします。不良品が届いた時 は、その商品の不良箇所をデ</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">ジタルカメラで撮影し、サポートページの送信フォームを利用して送ってください。&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">海外からの商品直送になりますので、通関による到着遅れが生じることがございます。当ショップでは商品必着保証をしていますので、ご安心くだ&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">さい。到着遅れですぐに”詐欺”だと騒ぎ立てる方の購入はご遠慮ください。&nbsp;</span><br />\r\n<span style=\"font-size:14px;color:#000000;\">当ショップは長い期間経営してきましたので、品質、発送、サービスには問題が一切ありません。</span></strong>\r\n	</p>\r\n<br />\r\n</strong></span></span>\r\n</p>', '2017-10-27 17:09:58');
INSERT INTO `pageinfo` VALUES ('10', '5', '', '', '', '<p>\r\n	<span style=\"line-height:1.5;\"><span style=\"color:#FF0000;background-color:#FFFFFF;\"><span style=\"background-color:#FFFFFF;\">返品•交換について</span><br />\r\n</span><span style=\"color:#666666;background-color:#FFFFFF;\">1、交換 •返品をご希望される場合には下記の注意事項をご確認の上、原則</span><br />\r\n<span style=\"color:#666666;background-color:#FFFFFF;\">として、商品到着後2日以内にメールにて弊社までご連絡下さい。&nbsp;</span><br />\r\n<span style=\"color:#666666;background-color:#FFFFFF;\">２、商品到着後7日以降の交換 • 返品には、応じかねる場合がありますので</span><br />\r\n<span style=\"color:#666666;background-color:#FFFFFF;\">ご注意下さい。</span></span> \r\n</p>\r\n<p style=\"color:#333333;\">\r\n	<span style=\"color:#666666;background-color:#FFFFFF;\"><span style=\"color:#FF0000;\"><span style=\"background-color:#FFFFFF;\">ご返品の流れ</span><br />\r\n</span><span style=\"background-color:#FFFFFF;\">1.当店までご連絡ください&nbsp;</span><br />\r\n<span style=\"background-color:#FFFFFF;\"> 商品到着後、2日以内にメールにてご連絡ください</span><br />\r\n<span style=\"background-color:#FFFFFF;\"> 2.商品の返品は到着時の状態が保たれているものに限ります。ご使用に</span><br />\r\n<span style=\"background-color:#FFFFFF;\"> なられた商品やお届け後に汚れ、破損等が生じた商品、付属品付き商品</span><br />\r\n<span style=\"background-color:#FFFFFF;\"> で付属品が揃わない場合は返品をお受け出来ませんので、ご了承ください。</span></span> \r\n</p>\r\n<p style=\"color:#333333;\">\r\n	<span style=\"background-color:#FFFFFF;\">あらゆる問題メール連絡ください</span> \r\n</p>\r\n<p style=\"color:#666666;background-color:#FFFFFF;\">\r\n	<span style=\"background-color:#FFFFFF;\">連絡メール：</span><span style=\"color:#E53333;background-color:#FFFFFF;\"><strong>acopy777@163.com</strong></span>\r\n</p>\r\n<p style=\"color:#666666;background-color:#FFFFFF;\">\r\n	<span style=\"background-color:#FFFFFF;\">★ごメールが届かない場合は、当店までご連絡頂くようお願い致します。</span>\r\n</p>\r\n<p style=\"color:#666666;background-color:#FFFFFF;\">\r\n	<span style=\"background-color:#FFFFFF;\">★<strong><span style=\"color:#E53333;\">docomo</span></strong>以外のメールアドレスをご使用ください</span>\r\n</p>', '2017-10-27 17:09:54');
INSERT INTO `pageinfo` VALUES ('11', '7', '', '', '', '<p>\r\n	ご注文いただいた商品は、ご決済完了後に発送手配を開始いたします。在庫のある商品は約1-2週間でのお届けとなります。配送状況、配送エリアによってさらにお時間がかかる場合があります。<br />\r\n<strong><span style=\"color:#E53333;\">お支払い方法について</span></strong><br />\r\n<strong><span style=\"color:#E53333;\">1</span></strong> 銀行振り込み \r\nご注文完了後に弊社より在庫の有無をメールにてお知らせいたします。メールをお受け取り頂いた後に、指定の口座に代金を振り込んでいただきます。弊社でご入金を確認後、発送手配をいたします。&nbsp;<br />\r\n<strong><span style=\"color:#E53333;\">2</span></strong> 送料は日本全国一律送料无料です。&nbsp;<br />\r\n<strong><span style=\"color:#E53333;\">3</span></strong> 振込手数料振込手数料は、お振込み時にご確認下さい。振込手数料はお客様のご負担となりますのでご了承下さい。&nbsp;<br />\r\n<strong><span style=\"color:#E53333;\">4</span></strong> 商品発送手配完了後、E-mailにて配送日のご連絡をさせていただきます。&nbsp;<br />\r\n<strong><span style=\"color:#E53333;\">※ </span></strong>ご注文が集中した場合や、土日祝日・弊社休業日による連休がある場合、弊社倉庫における棚卸し時期及びその前後の時期には、納品までに通常より長い時間がかかることがあります。予めご了承ください。\r\n</p>', '2017-10-27 17:12:02');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品类型id',
  `brand_id` int(11) DEFAULT NULL COMMENT '所属品牌类型id',
  `name` varchar(20) DEFAULT NULL COMMENT '产品名称',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `logo_real_url` varchar(100) DEFAULT NULL COMMENT 'logo真实地址',
  `logo_url` varchar(100) DEFAULT NULL COMMENT 'logo地址',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('4', '1', '产品1', '123', 'sfsad ', 'asdf asd', ' dsf ', 'H:\\upload\\product\\taiyan_20161213220930.jpg', '/upload/product/taiyan_20161213220930.jpg', '<img src=\"http://localhost/plugins/editor/plugins/emoticons/images/10.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost/plugins/editor/plugins/emoticons/images/20.gif\" border=\"0\" alt=\"\" />');
INSERT INTO `product` VALUES ('6', '7', '产品2', '3', '标题', '', '', 'H:\\upload\\product\\tanhui_20170213000159.jpg', '/upload/product/tanhui_20170213000159.jpg', '<span>阿斯顿发送到凡所大声道发送到发斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬asd</span><span>阿斯顿发送到凡所大声道发送到发斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬asd</span><span>阿斯顿发送到凡所大声道发送到发斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬asd</span><span>阿斯顿发送到凡所大声道发送到发斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬asd</span><span>阿斯顿发送到凡所大声道发送到发斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬asd</span>');
INSERT INTO `product` VALUES ('8', '9', '产品4', null, '', '', '', 'H:\\upload\\product\\tanhui_20170213002013.jpg', '/upload/product/tanhui_20170213002013.jpg', '兄弟，这个是产品4');

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品行业id',
  `name` varchar(20) DEFAULT NULL,
  `order` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade
-- ----------------------------
INSERT INTO `trade` VALUES ('1', 'スーパーコピー時計', '5');
INSERT INTO `trade` VALUES ('4', 'スーパーコピーバッグ', '4');
INSERT INTO `trade` VALUES ('5', 'スーパーコピー財布', '3');
INSERT INTO `trade` VALUES ('6', 'その他商品', '2');

-- ----------------------------
-- Table structure for user
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
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('14', '曹建涛', '111', 'wulitao', '4100000', '14', '光谷青年城', '13437104137', 'wulitaotao', '坑爹啊！~~~', '2017-04-24 23:37:16');
INSERT INTO `user` VALUES ('15', null, null, null, null, '1', null, null, 'test', null, null);
INSERT INTO `user` VALUES ('16', '姓名', '123', '昵称', '431111', '4', '武汉', '13437104137', 'wulihong', '这里是备注', '2017-03-26 03:01:50');
INSERT INTO `user` VALUES ('17', null, '123', null, null, '0', null, null, '123', null, null);
INSERT INTO `user` VALUES ('18', '姓名', '1234', '昵称', '邮编', '2', '住所', '1234567', '1234', '揭示板', null);
INSERT INTO `user` VALUES ('19', '昵称', 'test', '', '', '15', '', '', '13437104137@163.com', '这是我的163测试账号，哈哈哈！', '2017-04-24 23:49:44');
INSERT INTO `user` VALUES ('20', null, null, null, null, '0', null, null, null, null, '2017-07-26 07:44:19');
INSERT INTO `user` VALUES ('21', null, null, null, null, '0', null, null, null, null, '2017-09-03 23:32:33');

-- ----------------------------
-- Table structure for website
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

-- ----------------------------
-- Records of website
-- ----------------------------
INSERT INTO `website` VALUES ('3', 'スーパーコピー時計|スーパーコピー ブランド 時計(N級品)激安通販店！', '/upload/logo.png', '井上 合香', '9:00-24:00', 'acopy777@163.com', '邮箱密码', 'スーパーコピー時計,スーパーコピーブランド,スーパーコピー代引き,ブランドコピー,ロレックス スーパーコピー', '弊社大人気のスーパーコピーブランド販売、スーパーコピーブランド激安通販専門店。人気ブランド腕時計、バッグ、財布N品が大集合,誠実と信用のサービス!ロレックススーパーコピー,オメガスーパーコピー,シャネルスーパーコピーなど世界有名なブランドコピー商品激安通販！最高級のスーパーコピー時計を激安価格でお届け！送料無料!', 'スーパーコピーブランド販売、ロレックススーパーコピー、オメガスーパーコピー、シャネルスーパーコピーなど世界有名なブランドコピー商品激安通販！', 'スーパーコピー ブランド 時計(N級品)激安通販店！', '※ ご注文後、在庫を確認の上、当店よりお支払い総額とお振り替え口座名をメールにてお知らせいたします。万か一メール届かないの場合、当社まで御一報お願いします。<span></span>', '<div style=\"text-align:left;\">\r\n	弊社大人気のスーパーブランドコピー販売、スーパーコピーブランド激安通販専門店。人気ブランド腕時計、バッグ、財布N品が大集合,誠実と信用のサービス!国際一流のブランドコピー、スーパーコピーブランド、最も手頃な価格でお気に入りの商品を購入プロの誠実品質保証.<br />\r\n</div>', '弊社大人気のスーパーブランドコピー販売、スーパーコピーブランド激安通販専門店。人気ブランド腕時計、バッグ、財布N品が大集合,誠実と信用のサービス!ロレックススーパーコピー,オメガスーパーコピー,シャネルスーパーコピーなど世界有名なブランドコピー商品激安通販！最高級のスーパーコピー時計を激安価格でお届け！送料無料!<br />\r\n<div>\r\n	<br />\r\n</div>');
