/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80030
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80030
File Encoding         : 65001

Date: 2022-10-18 22:22:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_blog
-- ----------------------------
DROP TABLE IF EXISTS `b_blog`;
CREATE TABLE `b_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户id',
  `blog_type` int DEFAULT '0' COMMENT '博客类型：0-原创，1-转载，2-翻译，3-其他',
  `blog_title` varchar(255) NOT NULL COMMENT '博客标题',
  `blog_cover` varchar(255) DEFAULT NULL COMMENT '博客封面',
  `blog_content` text NOT NULL COMMENT '博客内容',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_del` int DEFAULT '0' COMMENT '是否删除，0-未删除，1-已删除',
  `status` int DEFAULT '0' COMMENT '状态：未发布，1-已发布待审核，2-已通过审核，3-审核驳回',
  `praised_count` int DEFAULT '0' COMMENT '点赞数量',
  `browse_count` int DEFAULT '0' COMMENT '浏览量',
  `blog_tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '博客标签id集合，用;隔开，例如：1912456;654565;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of b_blog
-- ----------------------------

-- ----------------------------
-- Table structure for b_comments
-- ----------------------------
DROP TABLE IF EXISTS `b_comments`;
CREATE TABLE `b_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '发布评论人的id',
  `type` int DEFAULT '0' COMMENT '评论类型：0-文章，1-博客',
  `content_id` int DEFAULT NULL COMMENT '文章或者资源的id',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `praised_count` int DEFAULT '0' COMMENT '点赞数量',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_del` int DEFAULT '0' COMMENT '是否删除，0-未删除，1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of b_comments
-- ----------------------------

-- ----------------------------
-- Table structure for b_level
-- ----------------------------
DROP TABLE IF EXISTS `b_level`;
CREATE TABLE `b_level` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '等级名称',
  `level_describe` varchar(255) DEFAULT NULL COMMENT '等级说明',
  `equity` varchar(255) DEFAULT NULL COMMENT '权益',
  `is_banned` int NOT NULL DEFAULT '0' COMMENT '是否禁用：0-启用，1-禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `level_name` (`level_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of b_level
-- ----------------------------

-- ----------------------------
-- Table structure for b_resources
-- ----------------------------
DROP TABLE IF EXISTS `b_resources`;
CREATE TABLE `b_resources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resources_title` varchar(255) NOT NULL COMMENT '资源标题',
  `resources_content` varchar(255) DEFAULT NULL COMMENT '资源内容',
  `resources_cover` varchar(255) DEFAULT NULL COMMENT '资源封面',
  `resources_tags` varchar(255) DEFAULT NULL COMMENT '资源标签id集合，用;隔开，例如：1912456;654565;',
  `status` int DEFAULT '0' COMMENT '状态：未发布，1-已发布待审核，2-已通过审核，3-审核驳回',
  `praised_count` int DEFAULT '0' COMMENT '点赞数量',
  `browse_count` int DEFAULT '0' COMMENT '浏览数量',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_del` int DEFAULT '0' COMMENT '是否删除，0-未删除，1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of b_resources
-- ----------------------------

-- ----------------------------
-- Table structure for b_tags
-- ----------------------------
DROP TABLE IF EXISTS `b_tags`;
CREATE TABLE `b_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名称',
  `tag_content` varchar(255) DEFAULT NULL COMMENT '标签简介',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_del` int DEFAULT '0' COMMENT '是否删除，0-未删除，1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of b_tags
-- ----------------------------

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL COMMENT '电话号码',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `head__img` varchar(255) DEFAULT NULL COMMENT '头像路径',
  `b_level` int DEFAULT NULL COMMENT '博客等级id',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_del` int DEFAULT '0' COMMENT '是否删除：0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`,`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of b_user
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_info
-- ----------------------------
DROP TABLE IF EXISTS `b_user_info`;
CREATE TABLE `b_user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户id',
  `week_count` int DEFAULT NULL COMMENT '周排名',
  `total_count` int DEFAULT NULL COMMENT '总排名',
  `access_count` int DEFAULT '0' COMMENT '访问量',
  `score` int DEFAULT '0' COMMENT '积分',
  `fans_count` int DEFAULT '0' COMMENT '粉丝数量',
  `attention_count` int DEFAULT '0' COMMENT '关注数量',
  `praised_count` int DEFAULT '0' COMMENT '点赞数量',
  `comment_count` int DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of b_user_info
-- ----------------------------
