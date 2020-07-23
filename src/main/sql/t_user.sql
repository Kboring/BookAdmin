/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.101.8
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : bootvue

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 22/07/2020 22:01:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(50) NULL DEFAULT NULL,
  `classname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '小康', 20, '20181701', '123');
INSERT INTO `t_user` VALUES (4, 'wanting', 123, '201805', '123');
INSERT INTO `t_user` VALUES (5, 'kboring', 123, '201805', '123');
INSERT INTO `t_user` VALUES (21, '578727807@qq.com', 18, '201806', '123');
INSERT INTO `t_user` VALUES (23, 'boring', 18, '201806', '123');
INSERT INTO `t_user` VALUES (36, '康玻瑞', 19, '201807', '123');

SET FOREIGN_KEY_CHECKS = 1;
