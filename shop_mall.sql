/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : shop_mall

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2023-04-18 21:59:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(128) NOT NULL AUTO_INCREMENT,
  `user_id` int(128) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `det_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('2', '1', '黎明宝宝', '18074881910', '广西玉林市玉州区', '教育东路玉林师范学院东校区', null);
INSERT INTO `address` VALUES ('6', '1', '杨某人', '13471518473', '广西贵港市平南县', '大新镇某个村', '公司');
INSERT INTO `address` VALUES ('12', '6', '杨某', '13471518473', '广西贵港市', '平南南', '');
INSERT INTO `address` VALUES ('13', '7', '杨明', '18074881910', '广西贵港市', '平南南', '');
INSERT INTO `address` VALUES ('14', '10', 'aasd', '18074881910', '广西玉林市', '玉林师范学院', '');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(128) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role` int(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'zirk', '0423', '1', '2022-09-12 15:15:24', '2023-01-13 10:32:30', '2023-01-13 10:32:30');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '小米', '#icon-XiaoMi');
INSERT INTO `brand` VALUES ('2', '华为', '#icon-huawei');
INSERT INTO `brand` VALUES ('3', '苹果', '#icon-pingguo');
INSERT INTO `brand` VALUES ('4', '一加', '#icon-yijia');
INSERT INTO `brand` VALUES ('5', 'vivo', '#icon-vivo-fill-round');
INSERT INTO `brand` VALUES ('6', '魅族', '#icon-icon-meizu');
INSERT INTO `brand` VALUES ('7', '联想', '#icon-lenovo');
INSERT INTO `brand` VALUES ('8', '机械师', null);
INSERT INTO `brand` VALUES ('9', '华硕', '#icon-asus1193370easyiconnet');
INSERT INTO `brand` VALUES ('14', 'ipad', '#icon-ipad');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cate_id` int(32) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `cate_rank` int(32) NOT NULL,
  `parent_id` int(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '手机', '1', '0', '2022-08-09 17:53:21', null);
INSERT INTO `category` VALUES ('2', '笔记本', '1', '0', '2022-08-09 17:53:22', null);
INSERT INTO `category` VALUES ('3', '平板', '1', '0', '2022-08-09 17:53:22', null);
INSERT INTO `category` VALUES ('4', '耳机', '1', '0', '2022-08-09 17:53:23', null);
INSERT INTO `category` VALUES ('5', '穿戴', '1', '0', '2022-08-09 17:53:23', null);
INSERT INTO `category` VALUES ('6', '配件', '1', '0', '2022-08-09 17:53:27', null);
INSERT INTO `category` VALUES ('7', '运行内存', '2', '1', '2022-08-15 11:50:26', null);
INSERT INTO `category` VALUES ('8', '机身内存', '2', '1', '2022-08-15 11:50:34', null);
INSERT INTO `category` VALUES ('9', 'CPU型号', '2', '1', '2022-08-15 11:50:43', null);
INSERT INTO `category` VALUES ('10', '屏幕尺寸', '2', '1', '2022-08-15 11:50:53', null);
INSERT INTO `category` VALUES ('11', '显卡类型', '2', '2', '2022-08-15 11:51:11', null);
INSERT INTO `category` VALUES ('12', 'CPU类型', '2', '2', '2022-08-15 11:52:45', null);
INSERT INTO `category` VALUES ('13', '屏幕尺寸', '2', '2', '2022-08-15 11:53:03', null);
INSERT INTO `category` VALUES ('14', '网络类型', '2', '3', '2022-08-17 16:41:16', null);

-- ----------------------------
-- Table structure for cate_brand
-- ----------------------------
DROP TABLE IF EXISTS `cate_brand`;
CREATE TABLE `cate_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cate_brand
-- ----------------------------
INSERT INTO `cate_brand` VALUES ('1', '1', '1');
INSERT INTO `cate_brand` VALUES ('2', '1', '2');
INSERT INTO `cate_brand` VALUES ('3', '1', '3');
INSERT INTO `cate_brand` VALUES ('4', '1', '4');
INSERT INTO `cate_brand` VALUES ('5', '1', '5');
INSERT INTO `cate_brand` VALUES ('6', '1', '6');
INSERT INTO `cate_brand` VALUES ('7', '1', '7');
INSERT INTO `cate_brand` VALUES ('8', '2', '1');
INSERT INTO `cate_brand` VALUES ('9', '2', '2');
INSERT INTO `cate_brand` VALUES ('10', '2', '3');
INSERT INTO `cate_brand` VALUES ('11', '2', '7');
INSERT INTO `cate_brand` VALUES ('12', '2', '8');
INSERT INTO `cate_brand` VALUES ('13', '2', '9');
INSERT INTO `cate_brand` VALUES ('14', '3', '1');
INSERT INTO `cate_brand` VALUES ('15', '3', '2');
INSERT INTO `cate_brand` VALUES ('16', '3', '7');
INSERT INTO `cate_brand` VALUES ('17', '4', '1');
INSERT INTO `cate_brand` VALUES ('18', '4', '2');
INSERT INTO `cate_brand` VALUES ('19', '5', '1');
INSERT INTO `cate_brand` VALUES ('20', '5', '2');
INSERT INTO `cate_brand` VALUES ('22', '6', '2');
INSERT INTO `cate_brand` VALUES ('28', '3', '14');
INSERT INTO `cate_brand` VALUES ('36', '2', '14');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(128) NOT NULL AUTO_INCREMENT,
  `user_id` int(128) NOT NULL,
  `pro_id` int(128) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('92', '1', '4');
INSERT INTO `collection` VALUES ('95', '1', '31');
INSERT INTO `collection` VALUES ('99', '1', '5');
INSERT INTO `collection` VALUES ('100', '6', '18');
INSERT INTO `collection` VALUES ('101', '7', '3');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(128) NOT NULL AUTO_INCREMENT,
  `address_id` int(128) NOT NULL,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(128) NOT NULL,
  `status` int(32) NOT NULL,
  `shops_remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `finish_time` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('6', '2', 'LM202208221155365497', '7299', '1', '2', null, '2022-08-22 11:55:15', null, '2022-08-22 23:01:13');
INSERT INTO `order` VALUES ('16', '2', 'LM202208221913156318', '5199', '1', '1', null, '2022-08-22 19:13:10', null, '2022-08-22 22:47:01');
INSERT INTO `order` VALUES ('35', '2', 'LM202210091955832450', '3499', '1', '2', null, '2022-10-09 19:55:44', null, '2022-10-09 19:56:23');
INSERT INTO `order` VALUES ('38', '13', 'LM202301101711588359', '5199', '7', '1', null, '2023-01-10 17:11:40', null, '2023-01-10 17:12:14');
INSERT INTO `order` VALUES ('39', '14', 'LM202301131031994689', '5938', '10', '1', null, '2023-01-13 10:31:33', null, '2023-01-13 10:31:48');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `brand_id` int(32) NOT NULL,
  `cate_id` int(32) NOT NULL,
  `exhibit` int(32) DEFAULT NULL,
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `subimages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price` decimal(20,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` int(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'Xiaomi 12S Ultra', '1', '1', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/xiaomi12SUltra.jpg', null, '徕卡专业光学镜头｜骁龙8+ 旗舰处理器｜徕卡原生双画质｜1 英寸大底专业主摄｜小米澎湃 P1 快充芯片｜全场景疾速抓拍｜IP68级防尘防水', '5999.00', '200', '1', '2022-07-30 14:18:36', null);
INSERT INTO `product` VALUES ('2', 'nova 10', '2', '1', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/nova10.jpg', null, '前置6000万双摄1|100W超级快充Turbo2新品预订省50元|享6期免息\n', '2969.00', '199', '1', '2022-07-30 14:26:33', null);
INSERT INTO `product` VALUES ('3', 'Xiaomi 12S Pro', '1', '1', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/xiaomi12Spro.jpg', null, '骁龙8+ 旗舰处理器 | 徕卡光学镜头 | 徕卡原生双画质 | 徕卡水印、大师镜头包 | 全场景疾速抓拍 | 5000万三主摄 | 小米自研澎湃P1芯片 | 120W小米澎湃秒冲 | 4600mAh大电量 | 2K AMOLED屏', '4699.00', '169', '1', '2022-07-30 14:29:36', null);
INSERT INTO `product` VALUES ('4', 'Redmi G 游戏本 2022', '1', '2', '1', 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/Redmi%20G%20%E6%B8%B8%E6%88%8F%E6%9C%AC2022.png', null, '16英寸 2.5K 165Hz 电竞大屏 | 可选 GeForce RTX™ 3050 Ti', '6299.00', '188', '1', '2022-07-31 09:46:06', null);
INSERT INTO `product` VALUES ('5', '小米平板5', '1', '3', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/%E5%B0%8F%E7%B1%B3%E5%B9%B3%E6%9D%BF5.jpg', null, '骁龙860芯片 | 2.5K超清屏 | 120Hz高刷新率｜8720mAh大电池', '1799.00', '266', '1', '2022-07-31 09:45:31', null);
INSERT INTO `product` VALUES ('7', 'Redmi Buds 4 Pro', '1', '4', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/RedmiBuds4pro.png', null, '43dB 宽频降噪 | HiFi 高保真音质 | 59ms 游戏低延迟', '369.00', '1099', '1', '2022-07-31 21:28:23', null);
INSERT INTO `product` VALUES ('8', '小米手环7 Pro', '1', '5', '1', 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/%E5%B0%8F%E7%B1%B3%E6%89%8B%E7%8E%AF7Pro.png', null, '全彩方形大屏 | 独立GPS定位 | 多重健康监测', '399.00', '166', '1', '2022-07-31 21:24:05', null);
INSERT INTO `product` VALUES ('10', '小米33W充电器', '1', '6', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/%E5%B0%8F%E7%B1%B333W%E5%85%85%E7%94%B5%E5%99%A8.jpg', null, '智能识别设备 / 智能温控设计 / 高防火等级材料 / AC100—240V宽幅电压', '69.00', '999', '1', '2022-07-31 21:44:44', null);
INSERT INTO `product` VALUES ('11', 'iphone13 苹果13', '3', '1', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/iphone13.jpg', null, 'IP68级防水，采用独家超瓷晶面板；搭载1200万广角镜头+1200万超广角镜头后置摄像系统，前置为1200万像素摄像头；搭载A15 Bionic芯片,支持5G', '5418.00', '1889', '1', '2022-07-31 21:48:21', null);
INSERT INTO `product` VALUES ('12', '一加 10 Pro', '4', '1', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/%E4%B8%80%E5%8A%A010Pro.png', null, '全新骁龙8 120Hz柔性屏 哈苏影像2.0 80W超级闪充 12GB+256GB破界黑 5G游戏手机', '4799.00', '1559', '1', '2022-07-31 21:49:39', null);
INSERT INTO `product` VALUES ('13', 'vivo S15', '5', '1', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/vivoS15.png', null, '高通骁龙870 超感光影像系统 电影感人像大片 66W闪充 5G 快充 拍照 手机', '3299.00', '1666', '1', '2022-07-31 21:51:06', null);
INSERT INTO `product` VALUES ('14', '魅族 18s Pro', '6', '1', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/%E9%AD%85%E6%97%8F18sPro.jpg', null, '飞雪流光 5G 骁龙888+ 支持40W无线超充 2K曲面屏 AR全场景大师影像系统 拍照手机', '4599.00', '1799', '1', '2022-07-31 21:52:12', null);
INSERT INTO `product` VALUES ('15', '畅享 50Pro', '2', '1', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/%E7%95%85%E4%BA%AB50Pro.jpg', null, null, '1699.00', '1699', '1', '2022-08-02 11:19:37', null);
INSERT INTO `product` VALUES ('16', 'HUAWEI MatePad Pro', '2', '3', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/huaweiMatePadPro.jpg', null, null, '3499.00', '269', '1', '2022-08-02 11:20:23', null);
INSERT INTO `product` VALUES ('17', '拯救者Y90', '7', '1', null, 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/goods/%E6%8B%AF%E6%95%91%E8%80%85Y90.jpg', null, null, '3299.00', '500', '1', '2022-08-09 21:37:59', null);
INSERT INTO `product` VALUES ('18', 'xiaomi 11', '1', '1', null, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5a260090e0e08770b0bd865845a4b4ab.jpg', null, '骁龙888｜2K AMOLED 四曲面柔性屏｜1亿像素三摄｜时尚轻薄机身｜55W 有线闪充｜50W 无线闪充｜10W 无线反充｜LPDDR5｜WiFi6（增强版）｜视频「超级夜景」｜哈曼卡顿音频认证｜立体声双扬声器', '2699.00', '123', '1', '2022-08-24 21:14:07', null);
INSERT INTO `product` VALUES ('19', '黑鲨5', '1', '1', null, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ef619ad3807b50ab8f6d12656fcc3721.png', null, '骁龙870 | 120W闪充 | 4650mAh大电量 | 磁动力升降肩键 | 144Hz AMOLED电竞屏 | 720Hz触控采样率 | 双区屏幕压感 | 双扬声器 | 6400万主摄 | 前置1600万AI美颜', '2199.00', '1123', '1', '2022-08-24 21:17:44', null);
INSERT INTO `product` VALUES ('20', ' Xiaomi Book Pro 16 2022', '1', '2', '1', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2646f1fdf7186b0efa4f0d0c32622874.jpg', null, '4K OLED 触控屏 | CNC一体精雕工艺 | 压感触控板 | 12代英特尔®酷睿™处理器 | 可选RTX2050光追独显', '7399.00', '123', '1', '2022-08-24 21:22:34', null);
INSERT INTO `product` VALUES ('21', 'MateBook 14s 2022', '2', '2', null, 'https://res.vmallres.com/pimages/uomcdn/CN/pms/202208/displayProduct/10086553037702/428_428_CD96F7C6088C690DAA1B74FE2A1A77FFmp.png', null, '英特尔Evo 12代酷睿标压 i5 16GB 1TB 14.2英寸90Hz触控屏 深空灰', '6899.00', '123', '1', '2022-08-24 21:31:31', null);
INSERT INTO `product` VALUES ('22', '联想小新Pro16', '7', '2', null, 'https://p1.lefile.cn/product/adminweb/2022/07/25/O7SoSQTdyPt1cv9gQO4CJBEzz-3067.w520.jpg', null, 'i5-12500H /Windows11家庭中文版/16.0英寸/16G/512G SSD/集成显卡/皓月银', '5599.00', '123', '1', '2022-08-24 21:44:23', null);
INSERT INTO `product` VALUES ('23', '联想小新Pro14', '7', '2', null, 'https://p4.lefile.cn/product/adminweb/2022/08/10/8tlQoayQrFgYtuOzGhjf03Plv-2708.w520.jpg', null, 'AMD Ryzen 7 6800HS/Windows11家庭中文版/14英寸/16G/512G SSD/集成显卡/深空灰', '5499.00', '123', '1', '2022-08-24 21:46:50', null);
INSERT INTO `product` VALUES ('24', '小新Pad Pro', '7', '3', '1', 'https://p4.lefile.cn/product/adminweb/2022/08/17/FEd6ggqeemIPMtHMAkgUfeAJI-4073.w520.jpg', null, 'Qualcomm Snapdragon 870/8核/Android 12 系统/11.2英寸/8GB/128GB/WIFI版/霜雪', '2499.00', '123', '1', '2022-08-24 21:51:16', null);
INSERT INTO `product` VALUES ('25', 'MacBook Pro', '3', '2', null, 'https://img11.360buyimg.com/n7/jfs/t1/125393/39/18221/47832/5fab078dEbc040aa5/590d4034236f65ef.jpg', null, '八核M1芯片 8G 256G SSD 深空灰 笔记本电脑 轻薄本 MYD82CH/A', '9499.00', '123', '1', '2022-08-24 21:55:05', null);
INSERT INTO `product` VALUES ('26', '拯救者Y7000P', '7', '2', null, 'https://p3.lefile.cn/product/adminweb/2022/02/27/YiJkOVZBERKGHjUTlSsm2VANl-5368.w520.jpg', null, '第12代英特尔®酷睿™i7-12700H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX™  3050 4G独显/钛晶灰', '7999.00', '123', '1', '2022-08-24 22:03:11', null);
INSERT INTO `product` VALUES ('27', '拯救者R7000P', '7', '2', null, 'https://p2.lefile.cn/product/adminweb/2022/06/09/J5xaiuIJT3WXSLvZMKHrTHL6f-0674.w520.jpg', null, 'AMD Ryzen 7 6800H/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/ RTX™ 3050 Ti 4GB独显/钛晶灰', '7799.00', '123', '1', '2022-08-24 22:06:48', null);
INSERT INTO `product` VALUES ('28', '曙光15', '8', '2', null, 'https://img12.360buyimg.com/n7/jfs/t1/165313/19/29591/83456/6304ff6dEdcd7f11f/ff0005fc8a2a8f6f.jpg.avif', null, '星辰笔记本电脑 加强版16G/512G PCIE高速固态', '7198.00', '123', '1', '2022-08-24 22:11:46', null);
INSERT INTO `product` VALUES ('29', '无畏Pro15', '9', '2', null, 'https://static.asus.com.cn/store/album/images/WSDFHSYPFXFAOQ/16525757484948.jpg', null, '2.8K OLED屏，GTX 1650 4G独立显卡', '4999.00', '123', '1', '2022-08-24 22:17:07', null);
INSERT INTO `product` VALUES ('30', '天选3 锐龙版', '9', '2', null, 'https://static.asus.com.cn/store/album/images/LY5P2ZG7BG6F5R/23112848985054.jpg', null, '多任务不卡，畅玩3A大作，画面真实，轻薄便携', '6799.00', '123', '1', '2022-08-24 22:25:05', null);
INSERT INTO `product` VALUES ('31', 'ROG幻16', '9', '2', null, 'https://static.asus.com.cn/store/album/images/GG4R7IRV0RXL24/10165757571025.jpg', null, '设计师轻薄高性能游戏笔记本电脑  (i7-12700H 16G 512G RTX3060 P3广色域)', '9999.00', '123', '1', '2022-08-24 22:28:51', null);
INSERT INTO `product` VALUES ('32', '小米 Air2 SE', '1', '4', null, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8a8de2281327e612f3f83fd1a4db6aea.jpg', null, '大尺寸动圈单元 | 20小时持久续航 | 双麦克风通话降噪', '119.00', '123', '1', '2022-08-24 22:32:24', null);
INSERT INTO `product` VALUES ('33', '华为 FreeBuds Pro 2', '2', '4', null, 'https://res.vmallres.com/pimages/uomcdn/CN/pms/202208/displayProduct/10086279196237/428_428_7E6456DADCB9224C38491B5DA439327Amp.png', null, '无线充 ①限时直降100元 ②享免费镌刻服务 ③享3期免息 ③晒单抽耳机收纳包', '1199.00', '123', '1', '2022-08-24 22:34:33', null);
INSERT INTO `product` VALUES ('34', '华为手环7', '2', '5', null, 'https://res.vmallres.com/pimages/uomcdn/CN/pms/202204/gbom/6941487260522/428_428_98F4C26BB746ABFA1687C9ED26E63E8Amp.png', null, '两周续航 拼团省40元', '269.00', '123', '1', '2022-08-24 22:37:02', null);
INSERT INTO `product` VALUES ('35', 'WATCH GT 2022典藏版', '2', '5', null, 'https://res.vmallres.com/pimages//uomcdn/CN/pms/202112/gbom/6941487248452/428_428_3FD380143A7B77F33EFAF9B6B9CDB276mp.png', null, null, '1750.00', '123', '1', '2022-08-24 22:40:50', null);
INSERT INTO `product` VALUES ('36', '华为 WATCH FIT 2', '2', '5', null, 'https://res.vmallres.com/pimages/uomcdn/CN/pms/202208/displayProduct/10086955927870/428_428_C3FD02474E8452028AC995BBB8A82EE7mp.jpg', null, '高清焕彩全面屏 蓝牙通话', '849.00', '123', '1', '2022-08-24 22:42:56', null);
INSERT INTO `product` VALUES ('37', '小米立式风冷无线充', '1', '6', '0', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1569240474.90093956.jpg', null, '立式充电，随放随充，无线束缚 / 30W无线闪充，兼容Qi标准无线充电电子设备 / 散热孔设计，主动散热，有效降温 / 内置静音风扇，体验生活场景静音 / 6重安全保护，确保手机安全稳定充电', '199.00', '123', '1', '2022-08-24 22:45:29', '2022-11-02 10:09:42');
INSERT INTO `product` VALUES ('38', '小米无线充电器', '1', '6', '0', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1577957538.49564124.jpg', null, 'Qi 无线标准 / 10W MAX 无线快充 / 智能兼容 / 金属质感机身', '69.00', '123', '1', '2022-08-24 22:46:36', '2023-01-13 09:23:36');
INSERT INTO `product` VALUES ('39', '华为超级快充充电器', '2', '6', '0', 'https://res.vmallres.com/pimages/uomcdn/CN/pms/202205/gbom/6941487210947/428_428_0D39E298734705DCA33C12A114C40139mp.png', null, 'Max 66W', '199.00', '123', '1', '2022-08-24 22:48:10', '2023-01-13 09:23:32');

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `id` int(128) NOT NULL AUTO_INCREMENT,
  `user_id` int(32) NOT NULL,
  `pro_id` int(32) NOT NULL,
  `number` int(64) NOT NULL,
  `memory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `total` int(255) NOT NULL,
  `repair` int(10) DEFAULT NULL,
  `choice` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of shopcart
-- ----------------------------
INSERT INTO `shopcart` VALUES ('226', '5', '13', '1', '8G+256G耀黑', '3299', '0', null, '2022-08-24 21:10:23', '2022-08-24 21:10:23');
INSERT INTO `shopcart` VALUES ('235', '1', '31', '1', '\r\ni7-12700H/RTX3060黑色', '9999', '0', '0', '2022-11-12 17:30:54', '2022-11-12 17:30:54');
INSERT INTO `shopcart` VALUES ('236', '1', '5', '1', '6G+128G绿色', '1799', '0', '0', '2022-11-10 13:18:04', '2022-11-10 13:18:04');

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `shops_nature` int(11) DEFAULT NULL COMMENT '商店性质（卖什么的）',
  `shops_grade` int(11) DEFAULT NULL COMMENT '商店等级',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `shops_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商店头像',
  `shops_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `shops_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `power` int(11) NOT NULL COMMENT '商家权限，0为未审批还不是商家，1是',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('1', 'YouLi科技', '0', '5', '18074881910', '1430920994@qq.com', 'https://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/YouLi.png', 'qiandong', '123456', '1', '2022-10-10 11:59:20', null);
INSERT INTO `shops` VALUES ('2', '小米官方旗舰店', '0', '4', '123456', '123mi@163.com', '', 'xiaomi', 'xiaomi', '1', '2022-10-10 12:02:41', null);
INSERT INTO `shops` VALUES ('3', '华为官方旗舰店', '0', '4', '123456', '123mi@163.com', '', 'xiaomi', 'xiaomi', '1', '2022-10-10 12:02:41', null);
INSERT INTO `shops` VALUES ('10', '123123', null, null, '18777510882', '3136105200@qq.com', '', '1343', '1343', '0', '2022-11-12 22:30:25', '2022-11-12 22:30:25');
INSERT INTO `shops` VALUES ('12', '123', null, null, '18074881910', '1430920994@qq.com', 'http://zirkbucket.oss-cn-guangzhou.aliyuncs.com/images/shops/cat.jpg', '123456', '123456', '0', '2023-01-13 10:35:32', '2023-01-13 10:35:32');

-- ----------------------------
-- Table structure for shops_goods
-- ----------------------------
DROP TABLE IF EXISTS `shops_goods`;
CREATE TABLE `shops_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `shops_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of shops_goods
-- ----------------------------
INSERT INTO `shops_goods` VALUES ('1', '1', '1', '2022-10-10 11:59:41', null);
INSERT INTO `shops_goods` VALUES ('2', '3', '2', '2022-10-10 12:02:57', null);
INSERT INTO `shops_goods` VALUES ('3', '4', '2', '2022-10-10 12:03:08', null);
INSERT INTO `shops_goods` VALUES ('4', '5', '2', '2022-10-10 12:03:14', null);
INSERT INTO `shops_goods` VALUES ('5', '2', '3', null, null);
INSERT INTO `shops_goods` VALUES ('6', '7', '1', null, null);
INSERT INTO `shops_goods` VALUES ('7', '8', '1', null, null);
INSERT INTO `shops_goods` VALUES ('8', '10', '1', null, null);
INSERT INTO `shops_goods` VALUES ('9', '11', '1', null, null);
INSERT INTO `shops_goods` VALUES ('10', '12', '1', null, null);
INSERT INTO `shops_goods` VALUES ('11', '13', '1', null, null);
INSERT INTO `shops_goods` VALUES ('12', '14', '1', null, null);
INSERT INTO `shops_goods` VALUES ('13', '15', '1', null, null);
INSERT INTO `shops_goods` VALUES ('14', '16', '1', null, null);
INSERT INTO `shops_goods` VALUES ('15', '17', '1', null, null);
INSERT INTO `shops_goods` VALUES ('16', '18', '1', null, null);
INSERT INTO `shops_goods` VALUES ('17', '19', '1', '2022-10-10 17:11:00', null);
INSERT INTO `shops_goods` VALUES ('18', '20', '1', null, null);
INSERT INTO `shops_goods` VALUES ('19', '21', '1', null, null);
INSERT INTO `shops_goods` VALUES ('20', '22', '1', null, null);
INSERT INTO `shops_goods` VALUES ('21', '23', '1', null, null);
INSERT INTO `shops_goods` VALUES ('22', '24', '1', null, null);
INSERT INTO `shops_goods` VALUES ('23', '25', '1', null, null);
INSERT INTO `shops_goods` VALUES ('24', '26', '1', null, null);
INSERT INTO `shops_goods` VALUES ('25', '27', '1', null, null);
INSERT INTO `shops_goods` VALUES ('26', '28', '1', null, null);
INSERT INTO `shops_goods` VALUES ('27', '29', '1', null, null);
INSERT INTO `shops_goods` VALUES ('28', '30', '1', null, null);
INSERT INTO `shops_goods` VALUES ('29', '31', '1', null, null);
INSERT INTO `shops_goods` VALUES ('30', '32', '1', null, null);
INSERT INTO `shops_goods` VALUES ('31', '33', '1', null, null);
INSERT INTO `shops_goods` VALUES ('32', '34', '1', null, null);
INSERT INTO `shops_goods` VALUES ('33', '35', '1', null, null);
INSERT INTO `shops_goods` VALUES ('34', '36', '1', null, null);
INSERT INTO `shops_goods` VALUES ('35', '37', '1', null, null);
INSERT INTO `shops_goods` VALUES ('36', '38', '1', null, null);
INSERT INTO `shops_goods` VALUES ('37', '39', '1', null, null);

-- ----------------------------
-- Table structure for spec
-- ----------------------------
DROP TABLE IF EXISTS `spec`;
CREATE TABLE `spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of spec
-- ----------------------------
INSERT INTO `spec` VALUES ('1', '1', '运行内存');
INSERT INTO `spec` VALUES ('2', '1', '机身内存');
INSERT INTO `spec` VALUES ('3', '1', '版本');
INSERT INTO `spec` VALUES ('4', '1', 'cpu');
INSERT INTO `spec` VALUES ('5', '1', '尺寸');
INSERT INTO `spec` VALUES ('6', '1', '颜色');
INSERT INTO `spec` VALUES ('7', '2', '显卡');
INSERT INTO `spec` VALUES ('8', '2', '版本');
INSERT INTO `spec` VALUES ('9', '2', 'cpu');
INSERT INTO `spec` VALUES ('10', '2', '尺寸');
INSERT INTO `spec` VALUES ('11', '2', '颜色');
INSERT INTO `spec` VALUES ('12', '3', '版本');
INSERT INTO `spec` VALUES ('13', '3', '颜色');
INSERT INTO `spec` VALUES ('14', '3', '网络类型');
INSERT INTO `spec` VALUES ('15', '4', '版本');
INSERT INTO `spec` VALUES ('16', '4', '颜色');
INSERT INTO `spec` VALUES ('17', '5', '版本');
INSERT INTO `spec` VALUES ('18', '5', '颜色');
INSERT INTO `spec` VALUES ('19', '6', '版本');
INSERT INTO `spec` VALUES ('20', '6', '颜色');

-- ----------------------------
-- Table structure for spec_order
-- ----------------------------
DROP TABLE IF EXISTS `spec_order`;
CREATE TABLE `spec_order` (
  `id` int(128) NOT NULL AUTO_INCREMENT,
  `user_id` int(128) NOT NULL,
  `pro_id` int(128) NOT NULL,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `memory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `count` int(255) DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of spec_order
-- ----------------------------
INSERT INTO `spec_order` VALUES ('8', '1', '4', 'LM202208221155365497', 'i7-12650H+RTX3050Ti黑色', '1', '7299');
INSERT INTO `spec_order` VALUES ('20', '1', '3', 'LM202208221913156318', '8G+256G白色', '1', '5199');
INSERT INTO `spec_order` VALUES ('46', '1', '16', 'LM202210091955832450', '8G+128G晶钻白', '1', '3499');
INSERT INTO `spec_order` VALUES ('52', '7', '3', 'LM202301101711588359', '8G+256G白色', '1', '5199');
INSERT INTO `spec_order` VALUES ('53', '10', '2', 'LM202301131031994689', '6G+128G白色', '2', '2969');

-- ----------------------------
-- Table structure for spec_params
-- ----------------------------
DROP TABLE IF EXISTS `spec_params`;
CREATE TABLE `spec_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `spec_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of spec_params
-- ----------------------------
INSERT INTO `spec_params` VALUES ('1', '1', '1', '8G');
INSERT INTO `spec_params` VALUES ('2', '1', '1', '12G');
INSERT INTO `spec_params` VALUES ('3', '2', '1', '256GB');
INSERT INTO `spec_params` VALUES ('4', '2', '1', '512GB');
INSERT INTO `spec_params` VALUES ('5', '3', '1', '8G+128G');
INSERT INTO `spec_params` VALUES ('6', '3', '1', '12G+256G');
INSERT INTO `spec_params` VALUES ('7', '3', '1', '12G+512G');
INSERT INTO `spec_params` VALUES ('8', '4', '1', '骁龙870');
INSERT INTO `spec_params` VALUES ('9', '5', '1', '6.5');
INSERT INTO `spec_params` VALUES ('10', '6', '1', '经典黑');
INSERT INTO `spec_params` VALUES ('11', '6', '1', '冷杉绿');
INSERT INTO `spec_params` VALUES ('12', '1', '2', '6G');
INSERT INTO `spec_params` VALUES ('13', '1', '2', '8G');
INSERT INTO `spec_params` VALUES ('14', '2', '2', '128G');
INSERT INTO `spec_params` VALUES ('15', '2', '2', '256G');
INSERT INTO `spec_params` VALUES ('16', '3', '2', '6G+128G');
INSERT INTO `spec_params` VALUES ('17', '3', '2', '8G+128G');
INSERT INTO `spec_params` VALUES ('18', '3', '2', '8G+256G');
INSERT INTO `spec_params` VALUES ('19', '4', '2', '骁龙865');
INSERT INTO `spec_params` VALUES ('20', '5', '2', '6.2');
INSERT INTO `spec_params` VALUES ('21', '6', '2', '白色');
INSERT INTO `spec_params` VALUES ('22', '1', '3', '8G');
INSERT INTO `spec_params` VALUES ('23', '1', '3', '12G');
INSERT INTO `spec_params` VALUES ('24', '2', '3', '128G');
INSERT INTO `spec_params` VALUES ('25', '2', '3', '256G');
INSERT INTO `spec_params` VALUES ('26', '2', '3', '512G');
INSERT INTO `spec_params` VALUES ('27', '3', '3', '8G+128G');
INSERT INTO `spec_params` VALUES ('28', '3', '3', '8G+256G');
INSERT INTO `spec_params` VALUES ('29', '3', '3', '12G+256G');
INSERT INTO `spec_params` VALUES ('30', '3', '3', '12G+512G');
INSERT INTO `spec_params` VALUES ('31', '4', '3', '骁龙8+');
INSERT INTO `spec_params` VALUES ('32', '5', '3', '6.73');
INSERT INTO `spec_params` VALUES ('33', '6', '3', '白色');
INSERT INTO `spec_params` VALUES ('34', '6', '3', '黑色');
INSERT INTO `spec_params` VALUES ('35', '1', '11', '4G');
INSERT INTO `spec_params` VALUES ('36', '2', '11', '128G');
INSERT INTO `spec_params` VALUES ('37', '2', '11', '256G');
INSERT INTO `spec_params` VALUES ('38', '2', '11', '512G');
INSERT INTO `spec_params` VALUES ('39', '3', '11', '128G');
INSERT INTO `spec_params` VALUES ('40', '3', '11', '256G');
INSERT INTO `spec_params` VALUES ('41', '3', '11', '512G');
INSERT INTO `spec_params` VALUES ('42', '4', '11', 'A15');
INSERT INTO `spec_params` VALUES ('43', '5', '11', '6.1');
INSERT INTO `spec_params` VALUES ('44', '6', '11', '绿色');
INSERT INTO `spec_params` VALUES ('45', '6', '11', '粉色');
INSERT INTO `spec_params` VALUES ('46', '6', '11', '蓝色');
INSERT INTO `spec_params` VALUES ('47', '6', '11', '午夜黑');
INSERT INTO `spec_params` VALUES ('48', '6', '11', '星光色');
INSERT INTO `spec_params` VALUES ('49', '6', '11', '红色');
INSERT INTO `spec_params` VALUES ('50', '1', '12', '8G');
INSERT INTO `spec_params` VALUES ('51', '1', '12', '12G');
INSERT INTO `spec_params` VALUES ('52', '2', '12', '128G');
INSERT INTO `spec_params` VALUES ('53', '2', '12', '256G');
INSERT INTO `spec_params` VALUES ('54', '2', '12', '512G');
INSERT INTO `spec_params` VALUES ('55', '3', '12', '8G+128G');
INSERT INTO `spec_params` VALUES ('56', '3', '12', '8G+256G');
INSERT INTO `spec_params` VALUES ('57', '3', '12', '12G+256G');
INSERT INTO `spec_params` VALUES ('58', '3', '12', '12G+512G');
INSERT INTO `spec_params` VALUES ('59', '4', '12', '骁龙8');
INSERT INTO `spec_params` VALUES ('60', '5', '12', '6.7');
INSERT INTO `spec_params` VALUES ('61', '6', '12', '破界黑');
INSERT INTO `spec_params` VALUES ('62', '6', '12', '万物青');
INSERT INTO `spec_params` VALUES ('63', '1', '13', '8G');
INSERT INTO `spec_params` VALUES ('64', '1', '13', '12G');
INSERT INTO `spec_params` VALUES ('65', '2', '13', '256G');
INSERT INTO `spec_params` VALUES ('66', '3', '13', '8G+256G');
INSERT INTO `spec_params` VALUES ('67', '3', '13', '12G+256G');
INSERT INTO `spec_params` VALUES ('68', '4', '13', '天玑8100');
INSERT INTO `spec_params` VALUES ('69', '5', '13', '6.56');
INSERT INTO `spec_params` VALUES ('70', '6', '13', '耀黑');
INSERT INTO `spec_params` VALUES ('71', '6', '13', '盛夏');
INSERT INTO `spec_params` VALUES ('72', '1', '14', '8G');
INSERT INTO `spec_params` VALUES ('73', '1', '14', '12G');
INSERT INTO `spec_params` VALUES ('74', '2', '14', '128G');
INSERT INTO `spec_params` VALUES ('75', '2', '14', '256G');
INSERT INTO `spec_params` VALUES ('76', '3', '14', '8G+128G');
INSERT INTO `spec_params` VALUES ('77', '3', '14', '8G+256G');
INSERT INTO `spec_params` VALUES ('78', '3', '14', '12G+256G');
INSERT INTO `spec_params` VALUES ('79', '4', '14', '骁龙888+');
INSERT INTO `spec_params` VALUES ('80', '5', '14', '6.7');
INSERT INTO `spec_params` VALUES ('81', '6', '14', '苍穹浩瀚');
INSERT INTO `spec_params` VALUES ('82', '6', '14', '银河秘境');
INSERT INTO `spec_params` VALUES ('83', '6', '14', '飞雪流光');
INSERT INTO `spec_params` VALUES ('84', '1', '15', '8G');
INSERT INTO `spec_params` VALUES ('85', '2', '15', '128G');
INSERT INTO `spec_params` VALUES ('86', '2', '15', '256G');
INSERT INTO `spec_params` VALUES ('87', '3', '15', '128G');
INSERT INTO `spec_params` VALUES ('88', '3', '15', '256G');
INSERT INTO `spec_params` VALUES ('89', '4', '15', '骁龙680');
INSERT INTO `spec_params` VALUES ('90', '5', '15', '6.7');
INSERT INTO `spec_params` VALUES ('91', '6', '15', '幻夜黑');
INSERT INTO `spec_params` VALUES ('92', '6', '15', '翡冷翠');
INSERT INTO `spec_params` VALUES ('93', '6', '15', '星海蓝');
INSERT INTO `spec_params` VALUES ('94', '1', '17', '12G');
INSERT INTO `spec_params` VALUES ('95', '1', '17', '16G');
INSERT INTO `spec_params` VALUES ('96', '1', '17', '18G');
INSERT INTO `spec_params` VALUES ('97', '2', '17', '256G');
INSERT INTO `spec_params` VALUES ('98', '2', '17', '640G');
INSERT INTO `spec_params` VALUES ('99', '3', '17', '12G+256G');
INSERT INTO `spec_params` VALUES ('100', '3', '17', '16G+256G');
INSERT INTO `spec_params` VALUES ('101', '3', '17', '18G+640G');
INSERT INTO `spec_params` VALUES ('102', '4', '17', '骁龙8');
INSERT INTO `spec_params` VALUES ('103', '5', '17', '6.92');
INSERT INTO `spec_params` VALUES ('104', '6', '17', '钛晶灰');
INSERT INTO `spec_params` VALUES ('105', '1', '18', '8G');
INSERT INTO `spec_params` VALUES ('106', '1', '18', '12G');
INSERT INTO `spec_params` VALUES ('107', '2', '18', '128G');
INSERT INTO `spec_params` VALUES ('108', '2', '18', '25G');
INSERT INTO `spec_params` VALUES ('109', '3', '18', '8G+128G');
INSERT INTO `spec_params` VALUES ('110', '3', '18', '8G+256G');
INSERT INTO `spec_params` VALUES ('111', '3', '18', '12G+256G');
INSERT INTO `spec_params` VALUES ('112', '4', '18', '骁龙888');
INSERT INTO `spec_params` VALUES ('113', '5', '18', '6.81');
INSERT INTO `spec_params` VALUES ('114', '6', '18', '蓝色');
INSERT INTO `spec_params` VALUES ('115', '6', '18', '黑色');
INSERT INTO `spec_params` VALUES ('116', '6', '18', '白色');
INSERT INTO `spec_params` VALUES ('117', '6', '18', '烟紫');
INSERT INTO `spec_params` VALUES ('118', '1', '19', '8G');
INSERT INTO `spec_params` VALUES ('119', '1', '19', '12G');
INSERT INTO `spec_params` VALUES ('120', '2', '19', '128G');
INSERT INTO `spec_params` VALUES ('121', '2', '19', '256G');
INSERT INTO `spec_params` VALUES ('122', '3', '19', '8G+128G');
INSERT INTO `spec_params` VALUES ('123', '3', '19', '12G+128G');
INSERT INTO `spec_params` VALUES ('124', '3', '19', '12G+256G');
INSERT INTO `spec_params` VALUES ('125', '4', '19', '骁龙870');
INSERT INTO `spec_params` VALUES ('126', '5', '19', '6.67');
INSERT INTO `spec_params` VALUES ('127', '6', '19', '暗宇黑');
INSERT INTO `spec_params` VALUES ('128', '6', '19', '曙光白');
INSERT INTO `spec_params` VALUES ('129', '6', '19', '探索灰');
INSERT INTO `spec_params` VALUES ('130', '7', '4', 'RTX3050');
INSERT INTO `spec_params` VALUES ('131', '7', '4', 'RTX3050Ti');
INSERT INTO `spec_params` VALUES ('132', '8', '4', 'i5-12450H+RTX3050');
INSERT INTO `spec_params` VALUES ('133', '8', '4', 'i7-12650H+RTX3050');
INSERT INTO `spec_params` VALUES ('134', '8', '4', 'i7-12650H+RTX3050Ti');
INSERT INTO `spec_params` VALUES ('135', '9', '4', 'i5-12450H');
INSERT INTO `spec_params` VALUES ('136', '9', '4', 'i7-12650H');
INSERT INTO `spec_params` VALUES ('137', '10', '4', '16');
INSERT INTO `spec_params` VALUES ('138', '11', '4', '黑色');
INSERT INTO `spec_params` VALUES ('139', '7', '20', 'RTX2050');
INSERT INTO `spec_params` VALUES ('140', '7', '20', 'UMA');
INSERT INTO `spec_params` VALUES ('141', '8', '20', 'i5-1240P/Xe Graphics');
INSERT INTO `spec_params` VALUES ('142', '8', '20', 'i7-1260P/RTX2050');
INSERT INTO `spec_params` VALUES ('143', '9', '20', 'i5-1240P');
INSERT INTO `spec_params` VALUES ('144', '9', '20', 'i7-1260P');
INSERT INTO `spec_params` VALUES ('145', '10', '20', '16.0');
INSERT INTO `spec_params` VALUES ('146', '11', '20', '灰色');
INSERT INTO `spec_params` VALUES ('147', '7', '21', 'UMA');
INSERT INTO `spec_params` VALUES ('148', '8', '21', 'i5/16GB/512GB');
INSERT INTO `spec_params` VALUES ('149', '8', '21', 'i5/16GB/1TB');
INSERT INTO `spec_params` VALUES ('150', '8', '21', 'i7/16GB/1TB');
INSERT INTO `spec_params` VALUES ('151', '9', '21', 'i5-12500H');
INSERT INTO `spec_params` VALUES ('152', '9', '21', 'i7-12700H');
INSERT INTO `spec_params` VALUES ('153', '10', '21', '14.2');
INSERT INTO `spec_params` VALUES ('154', '11', '21', '深空灰');
INSERT INTO `spec_params` VALUES ('155', '11', '21', '云杉绿');
INSERT INTO `spec_params` VALUES ('156', '7', '22', 'UMA');
INSERT INTO `spec_params` VALUES ('157', '8', '22', 'i5-12500H');
INSERT INTO `spec_params` VALUES ('158', '8', '22', 'i7-12700H');
INSERT INTO `spec_params` VALUES ('159', '9', '22', 'i5-12500H');
INSERT INTO `spec_params` VALUES ('160', '9', '22', 'i7-12700H');
INSERT INTO `spec_params` VALUES ('161', '10', '22', '16.0');
INSERT INTO `spec_params` VALUES ('162', '11', '22', '灰色');
INSERT INTO `spec_params` VALUES ('163', '7', '23', 'UMA');
INSERT INTO `spec_params` VALUES ('164', '8', '23', 'R7-6800HS');
INSERT INTO `spec_params` VALUES ('165', '8', '23', 'i5-12500H');
INSERT INTO `spec_params` VALUES ('166', '8', '23', 'i7-12700H');
INSERT INTO `spec_params` VALUES ('167', '9', '23', 'R7-6800HS');
INSERT INTO `spec_params` VALUES ('168', '9', '23', 'i5-12500H');
INSERT INTO `spec_params` VALUES ('169', '9', '23', 'i7-12700H');
INSERT INTO `spec_params` VALUES ('170', '10', '23', '14.0');
INSERT INTO `spec_params` VALUES ('171', '11', '23', '皓月银');
INSERT INTO `spec_params` VALUES ('172', '11', '23', '深空灰');
INSERT INTO `spec_params` VALUES ('173', '11', '23', '暗夜极光');
INSERT INTO `spec_params` VALUES ('174', '7', '25', 'M1');
INSERT INTO `spec_params` VALUES ('175', '8', '25', 'M1 8G+256G');
INSERT INTO `spec_params` VALUES ('176', '8', '25', 'M1 Pro 16G+256G');
INSERT INTO `spec_params` VALUES ('177', '8', '25', 'M1 Max 32G+1T');
INSERT INTO `spec_params` VALUES ('178', '9', '25', 'M1 Pro');
INSERT INTO `spec_params` VALUES ('179', '9', '25', 'M1 Max');
INSERT INTO `spec_params` VALUES ('180', '9', '25', 'M1');
INSERT INTO `spec_params` VALUES ('181', '10', '25', '14');
INSERT INTO `spec_params` VALUES ('182', '11', '25', '深空灰');
INSERT INTO `spec_params` VALUES ('183', '7', '26', 'RTX3050');
INSERT INTO `spec_params` VALUES ('184', '7', '26', 'RTX3050Ti');
INSERT INTO `spec_params` VALUES ('185', '7', '26', 'RTX3060');
INSERT INTO `spec_params` VALUES ('186', '7', '26', 'RTX3060Ti');
INSERT INTO `spec_params` VALUES ('187', '8', '26', 'i5-12500H+RTX3050');
INSERT INTO `spec_params` VALUES ('188', '8', '26', 'i5-12500H+RTX3050Ti');
INSERT INTO `spec_params` VALUES ('189', '8', '26', 'i7-12700H+RTX3060');
INSERT INTO `spec_params` VALUES ('190', '8', '26', 'i7-12700H+RTX3060Ti');
INSERT INTO `spec_params` VALUES ('191', '9', '26', 'i5-12500H');
INSERT INTO `spec_params` VALUES ('192', '9', '26', 'i7-12700H');
INSERT INTO `spec_params` VALUES ('193', '10', '26', '15.6');
INSERT INTO `spec_params` VALUES ('194', '11', '26', '钛晶灰');
INSERT INTO `spec_params` VALUES ('195', '11', '26', '星耀银');
INSERT INTO `spec_params` VALUES ('196', '7', '27', 'RTX3050');
INSERT INTO `spec_params` VALUES ('197', '7', '27', 'RTX3050Ti');
INSERT INTO `spec_params` VALUES ('198', '7', '27', 'RTX3060');
INSERT INTO `spec_params` VALUES ('199', '7', '27', 'RTX3060Ti');
INSERT INTO `spec_params` VALUES ('200', '8', '27', 'R5-6600H+RTX3050');
INSERT INTO `spec_params` VALUES ('201', '8', '27', 'R5-6600H+RTX3050Ti');
INSERT INTO `spec_params` VALUES ('202', '8', '27', 'R5-6600H+RTX3060');
INSERT INTO `spec_params` VALUES ('203', '8', '27', 'R5-6600H+RTX3060Ti');
INSERT INTO `spec_params` VALUES ('204', '8', '27', 'R7-6800H+RTX3050');
INSERT INTO `spec_params` VALUES ('205', '8', '27', 'R7-6800H+RTX3050Ti');
INSERT INTO `spec_params` VALUES ('206', '8', '27', 'R7-6800H+RTX3060');
INSERT INTO `spec_params` VALUES ('207', '8', '27', 'R7-6800H+RTX3060Ti');
INSERT INTO `spec_params` VALUES ('208', '9', '27', 'R5-6600H');
INSERT INTO `spec_params` VALUES ('209', '9', '27', 'R7-6800H');
INSERT INTO `spec_params` VALUES ('210', '10', '27', '15.6');
INSERT INTO `spec_params` VALUES ('211', '11', '27', '钛晶灰');
INSERT INTO `spec_params` VALUES ('212', '7', '28', 'RTX3050Ti');
INSERT INTO `spec_params` VALUES ('213', '8', '28', 'i7-12700H/16G/512G');
INSERT INTO `spec_params` VALUES ('214', '8', '28', 'i7-12700H/16G/1T');
INSERT INTO `spec_params` VALUES ('215', '8', '28', 'i7-12700H/32G/512G');
INSERT INTO `spec_params` VALUES ('216', '8', '28', 'i7-12700H/64G/512G');
INSERT INTO `spec_params` VALUES ('217', '9', '28', 'i7-12700H');
INSERT INTO `spec_params` VALUES ('218', '10', '28', '15.6');
INSERT INTO `spec_params` VALUES ('219', '11', '28', '皓月银');
INSERT INTO `spec_params` VALUES ('220', '7', '29', 'GTX1650');
INSERT INTO `spec_params` VALUES ('221', '8', '29', 'R7-5800H+GTX1650');
INSERT INTO `spec_params` VALUES ('222', '9', '29', 'R7-5800H');
INSERT INTO `spec_params` VALUES ('223', '10', '29', '16');
INSERT INTO `spec_params` VALUES ('224', '11', '29', '白色');
INSERT INTO `spec_params` VALUES ('225', '11', '29', '银色');
INSERT INTO `spec_params` VALUES ('226', '7', '30', 'RTX3050');
INSERT INTO `spec_params` VALUES ('227', '7', '30', 'RTX3060');
INSERT INTO `spec_params` VALUES ('228', '7', '30', 'RTX3070');
INSERT INTO `spec_params` VALUES ('229', '8', '30', 'R7-6800H+RTX3060');
INSERT INTO `spec_params` VALUES ('230', '8', '30', 'R7-6800H+RTX3050');
INSERT INTO `spec_params` VALUES ('231', '8', '30', 'R7-6800H+RTX3070');
INSERT INTO `spec_params` VALUES ('232', '8', '30', 'R7-6800H+RTX3050Ti');
INSERT INTO `spec_params` VALUES ('233', '8', '30', 'R7-6800H+RTX3070Ti');
INSERT INTO `spec_params` VALUES ('234', '9', '30', 'R7-6800H');
INSERT INTO `spec_params` VALUES ('235', '10', '30', '15.6');
INSERT INTO `spec_params` VALUES ('236', '11', '30', '青色');
INSERT INTO `spec_params` VALUES ('237', '11', '30', '灰色');
INSERT INTO `spec_params` VALUES ('238', '7', '31', 'RTX3060');
INSERT INTO `spec_params` VALUES ('239', '7', '31', 'RTX3070Ti');
INSERT INTO `spec_params` VALUES ('240', '7', '31', 'RTX3080Ti');
INSERT INTO `spec_params` VALUES ('241', '8', '31', 'i7-12700H/RTX3060');
INSERT INTO `spec_params` VALUES ('242', '8', '31', 'i9-12900H/RTX3070Ti');
INSERT INTO `spec_params` VALUES ('243', '8', '31', 'i9-12900H/RTX3080Ti');
INSERT INTO `spec_params` VALUES ('244', '8', '31', 'R9-6900HS/3060');
INSERT INTO `spec_params` VALUES ('245', '8', '31', 'R9-6900HS/3070Ti');
INSERT INTO `spec_params` VALUES ('246', '9', '31', 'i7-12700H');
INSERT INTO `spec_params` VALUES ('247', '9', '31', 'i9-12900H');
INSERT INTO `spec_params` VALUES ('248', '9', '31', 'R9-6900HS');
INSERT INTO `spec_params` VALUES ('249', '10', '31', '16');
INSERT INTO `spec_params` VALUES ('250', '11', '31', '黑色');
INSERT INTO `spec_params` VALUES ('251', '12', '5', '6G+128G');
INSERT INTO `spec_params` VALUES ('252', '12', '5', '6G+256G');
INSERT INTO `spec_params` VALUES ('253', '12', '5', '8G+256G');
INSERT INTO `spec_params` VALUES ('254', '13', '5', '绿色');
INSERT INTO `spec_params` VALUES ('255', '13', '5', '黑色');
INSERT INTO `spec_params` VALUES ('256', '13', '5', '白色');
INSERT INTO `spec_params` VALUES ('257', '14', '5', 'WiFi');
INSERT INTO `spec_params` VALUES ('258', '12', '16', '8G+128G');
INSERT INTO `spec_params` VALUES ('259', '12', '16', '8G+256G');
INSERT INTO `spec_params` VALUES ('260', '12', '16', '12G+512G');
INSERT INTO `spec_params` VALUES ('261', '13', '16', '晶钻白');
INSERT INTO `spec_params` VALUES ('262', '13', '16', '耀金黑');
INSERT INTO `spec_params` VALUES ('263', '14', '16', 'WiFi');
INSERT INTO `spec_params` VALUES ('264', '14', '16', '全网通');
INSERT INTO `spec_params` VALUES ('265', '12', '24', '6G+128G');
INSERT INTO `spec_params` VALUES ('266', '12', '24', '8G+128G');
INSERT INTO `spec_params` VALUES ('267', '12', '24', '8G+256G');
INSERT INTO `spec_params` VALUES ('268', '13', '24', '深空灰');
INSERT INTO `spec_params` VALUES ('269', '13', '24', '玄青黑');
INSERT INTO `spec_params` VALUES ('270', '13', '24', '银色');
INSERT INTO `spec_params` VALUES ('271', '14', '24', 'WiFi');
INSERT INTO `spec_params` VALUES ('272', '14', '24', '全网通');
INSERT INTO `spec_params` VALUES ('273', '16', '7', '月影黑');
INSERT INTO `spec_params` VALUES ('274', '16', '7', '星耀金');
INSERT INTO `spec_params` VALUES ('275', '16', '32', '白色');
INSERT INTO `spec_params` VALUES ('276', '16', '33', '陶瓷白');
INSERT INTO `spec_params` VALUES ('277', '16', '33', '冰霜银');
INSERT INTO `spec_params` VALUES ('278', '16', '33', '星河蓝');
INSERT INTO `spec_params` VALUES ('279', '18', '8', '夜跃黑');
INSERT INTO `spec_params` VALUES ('280', '18', '8', '静息白');
INSERT INTO `spec_params` VALUES ('281', '18', '34', '曜石黑');
INSERT INTO `spec_params` VALUES ('282', '18', '34', '原野绿');
INSERT INTO `spec_params` VALUES ('283', '18', '34', '星云粉');
INSERT INTO `spec_params` VALUES ('284', '18', '34', '烈艳红');
INSERT INTO `spec_params` VALUES ('285', '18', '35', '亮黑色');
INSERT INTO `spec_params` VALUES ('286', '18', '35', '红色');
INSERT INTO `spec_params` VALUES ('287', '18', '36', '幻夜黑');
INSERT INTO `spec_params` VALUES ('288', '18', '36', '樱语粉');
INSERT INTO `spec_params` VALUES ('289', '18', '36', '海岛蓝');
INSERT INTO `spec_params` VALUES ('290', '20', '10', '白色');
INSERT INTO `spec_params` VALUES ('291', '20', '37', '雅酷白');
INSERT INTO `spec_params` VALUES ('292', '20', '38', '黑色');
INSERT INTO `spec_params` VALUES ('293', '20', '39', '白色');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zirk', '黎明宝宝', '0423', 0x68747470733A2F2F7A69726B6275636B65742E6F73732D636E2D6775616E677A686F752E616C6979756E63732E636F6D2F696D616765732F706F7274726169742E6A7067, '18074881910', '1430920994@qq.com', '2022-08-10 16:23:25', '2023-01-25 16:17:34', '2023-01-25 16:17:34');
INSERT INTO `user` VALUES ('3', 'admin', 'test用户', '123', 0x0D0A68747470733A2F2F7A69726B6275636B65742E6F73732D636E2D6775616E677A686F752E616C6979756E63732E636F6D2F696D616765732F64656661756C74506F7274726169742E706E67, '18074881910', '1430920994@qq.com', '2022-08-11 13:49:45', '2022-08-24 21:03:24', '2022-08-24 21:03:24');
INSERT INTO `user` VALUES ('5', 'test', '用户lm2528', 'test', 0x68747470733A2F2F7A69726B6275636B65742E6F73732D636E2D6775616E677A686F752E616C6979756E63732E636F6D2F696D616765732F64656661756C74506F7274726169742E706E67, '18074881910', '1430920994@qq.com', '2022-08-24 21:03:53', '2022-08-24 21:03:58', '2022-08-24 21:03:58');
INSERT INTO `user` VALUES ('7', '3136105200', '用户lm9827', '123456', 0x68747470733A2F2F7A69726B6275636B65742E6F73732D636E2D6775616E677A686F752E616C6979756E63732E636F6D2F696D616765732F64656661756C74506F7274726169742E706E67, '', '1430920994@qq.com', '2023-01-10 17:09:43', '2023-01-10 17:10:15', '2023-01-10 17:10:15');
INSERT INTO `user` VALUES ('10', '313510', '用户lm6445', '123456', 0x68747470733A2F2F7A69726B6275636B65742E6F73732D636E2D6775616E677A686F752E616C6979756E63732E636F6D2F696D616765732F64656661756C74506F7274726169742E706E67, '', '1430920994@qq.com', '2023-01-13 10:30:46', '2023-01-13 10:30:56', '2023-01-13 10:30:56');
