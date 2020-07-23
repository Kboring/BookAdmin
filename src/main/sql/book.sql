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

 Date: 22/07/2020 22:01:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '书籍编号',
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书名',
  `book_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者',
  `book_pub` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '出版社',
  `book_sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书籍类别',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '数据结构', '张三', '清华大学出版社', '计算机类');
INSERT INTO `book` VALUES (2, 'web开发', '李四', '清华大学出版社', '计算机类');
INSERT INTO `book` VALUES (3, 'java', '王五', '四川大学出版社', '计算机类');
INSERT INTO `book` VALUES (4, 'python', '小康', '成都理工出版社', '计算机类');
INSERT INTO `book` VALUES (5, 'go', '小李', '成都理工出版社', '计算机类');
INSERT INTO `book` VALUES (6, '生死场', '萧红', '同济大学出版社', '文艺类');
INSERT INTO `book` VALUES (7, '呼兰河传', '萧红', '同济大学出版社', '文艺类');
INSERT INTO `book` VALUES (8, '小城三月', '萧红', '同济大学出版社', '文艺类');

SET FOREIGN_KEY_CHECKS = 1;
