DROP DATABASE IF EXISTS mini;

CREATE DATABASE mini CHARACTER SET UTF8;

USE mini;

-- ---------------
-- 用户表结构
-- ---------------
CREATE TABLE `user` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(100),
  `password` VARCHAR(100),
  `attempt_times` INT(5) DEFAULT 0,
  `last_attempt_date` DATETIME,
  `account_expired_date` DATETIME,
  `credentials_expired_date` DATETIME,
  `enable` INT(1) DEFAULT 1,
  `role_id` INT(11),
  UNIQUE KEY `username_unique_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ---------------
-- 用户表数据  用户名跟密码相同，通过BCryptPasswordEncoder(9)加密了
-- ---------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$09$4UUZm8xhX0YDwGKnXPlTmev7Tp5uVk9jAX47mm0dX0J1HPp6ecjz2', 0, NULL, '2017-11-15', '2017-11-15', 1, 1);
INSERT INTO `user` VALUES (2, 'user', '$2a$09$fzdTS9caotxl7n27R3G.wuxQV5P/yJs5fa.Y2g1wz1/I5uzi4MEkG', 0, NULL, '2017-11-15', '2017-11-15', 1, 2);
INSERT INTO `user` VALUES (3, '000001', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 0, NULL, '2017-11-15', '2017-11-15', 0, 2);
INSERT INTO `user` VALUES (4, '000002', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 5, '2016-11-15', '2017-11-15', '2017-11-15', 1, 2);
INSERT INTO `user` VALUES (5, '000003', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 0, NULL, '2017-11-15', '2016-11-15', 1, 2);
INSERT INTO `user` VALUES (6, '000004', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 0, NULL, '2017-11-15', '2017-11-15', 1, 2);
INSERT INTO `user` VALUES (7, '000005', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 0, NULL, '2017-11-15', '2017-11-15', 1, 2);
INSERT INTO `user` VALUES (8, '000006', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 0, NULL, '2017-11-15', '2017-11-15', 1, 2);
INSERT INTO `user` VALUES (9, '000007', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 0, NULL, '2017-11-15', '2017-11-15', 1, 2);
INSERT INTO `user` VALUES (10, '000008', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 0, NULL, '2017-11-15', '2017-11-15', 1, 2);
INSERT INTO `user` VALUES (11, '000009', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 0, NULL, '2017-11-15', '2017-11-15', 1, 2);
INSERT INTO `user` VALUES (12, '000000', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 0, NULL, '2017-11-15', '2017-11-15', 1, 2);
INSERT INTO `user` VALUES (13, '000011', '$2a$09$A61UpCdR35PAq9omdTOnxOt4pIvuxESujsmrdETemyXKN4FDJF/sC', 0, NULL, '2017-11-15', '2017-11-15', 1, 2);

-- ----------------------------
-- 角色表结构
-- ----------------------------
CREATE TABLE `role` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,  -- 'ROLE_'为前缀
  `description` VARCHAR(50) DEFAULT NULL,
  UNIQUE KEY `name_unique_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- 角色记录
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_ADMIN', '管理员');
INSERT INTO `role` VALUES (2, 'ROLE_USER', '普通用户');

-- ----------------------------
-- 菜单表结构
-- ----------------------------
CREATE TABLE `menu` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `parent_id` INT(11) DEFAULT 0,
  `menu_name` VARCHAR(30) DEFAULT NULL,
  `icon` VARCHAR(50) DEFAULT NULL,
  `url` VARCHAR(255) DEFAULT NULL,
  `level` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- 菜单数据
-- ----------------------------
INSERT INTO menu VALUE (1, 0, '游戏', '', '', '1');
INSERT INTO menu VALUE (2, 0, '音乐', '', '', '2');
INSERT INTO menu VALUE (3, 0, '书籍', '', '', '3');
INSERT INTO menu VALUE (4, 0, '后台管理', 'glyphicon glyphicon-asterisk', '', '4');
INSERT INTO menu VALUE (5, 1, 'lol', '', '/login.jsp', '1.1');
INSERT INTO menu VALUE (6, 1, 'dota2', '', 'http://www.baidu.com', '1.2');
INSERT INTO menu VALUE (7, 2, '欧美', '', 'http://www.baidu.com', '2.1');
INSERT INTO menu VALUE (8, 2, '华语', '', 'http://www.baidu.com', '2.2');
INSERT INTO menu VALUE (9, 3, '小说', '', 'http://www.baidu.com', '3.1');
INSERT INTO menu VALUE (10, 3, '文学', '', 'http://www.baidu.com', '3.2');
INSERT INTO menu VALUE (11, 4, '用户管理', '', '/core/page/user/index', '4.1');
INSERT INTO menu VALUE (12, 4, '角色管理', '', '/core/page/role/index', '4.2');
INSERT INTO menu VALUE (13, 4, '权限管理', '', '/core/page/permission/index', '4.3');
INSERT INTO menu VALUE (14, 4, '资源管理', '', '/core/page/resource/index', '4.4');