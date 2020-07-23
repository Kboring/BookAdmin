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

 Date: 22/07/2020 22:01:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(50) NOT NULL AUTO_INCREMENT,
  `book_id` int(50) NULL DEFAULT NULL,
  `order_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `booksId`(`book_id`) USING BTREE,
  INDEX `booksName`(`order_username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (20, 1, 'boring');
INSERT INTO `order` VALUES (21, 1, '小康');
INSERT INTO `order` VALUES (22, 2, '小康');
INSERT INTO `order` VALUES (23, 4, '小康');
INSERT INTO `order` VALUES (25, 1, 'wanting');
INSERT INTO `order` VALUES (26, 2, 'wanting');
INSERT INTO `order` VALUES (28, 2, 'boring');
INSERT INTO `order` VALUES (29, 3, '小康');
INSERT INTO `order` VALUES (30, 5, '小康');
INSERT INTO `order` VALUES (31, 6, '小康');
INSERT INTO `order` VALUES (32, 7, '小康');
INSERT INTO `order` VALUES (33, 8, '小康');
INSERT INTO `order` VALUES (36, 3, 'wanting');
INSERT INTO `order` VALUES (37, 4, 'wanting');
INSERT INTO `order` VALUES (38, 3, 'boring');
INSERT INTO `order` VALUES (41, 1, '康玻瑞');
INSERT INTO `order` VALUES (42, 2, '康玻瑞');
INSERT INTO `order` VALUES (43, 3, '康玻瑞');

SET FOREIGN_KEY_CHECKS = 1;
