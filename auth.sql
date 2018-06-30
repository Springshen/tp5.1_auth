-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2018-06-30 01:41:15
-- 服务器版本： 5.7.22
-- PHP Version: 7.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tp`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_auth_group`
--

DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态：1正常，0禁用',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户组表';

--
-- 转存表中的数据 `think_auth_group`
--

INSERT INTO `think_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '管理组', 1, '1,2'),
(2, '管理组', 1, '4');

-- --------------------------------------------------------

--
-- 表的结构 `think_auth_group_access`
--

DROP TABLE IF EXISTS `think_auth_group_access`;
CREATE TABLE `think_auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '用户组ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户组关系表';

--
-- 转存表中的数据 `think_auth_group_access`
--

INSERT INTO `think_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `think_auth_rule`
--

DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态：1正常，0禁用',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='规则表';

--
-- 转存表中的数据 `think_auth_rule`
--

INSERT INTO `think_auth_rule` (`id`, `title`, `name`, `status`, `condition`) VALUES
(1, '列表', 'Home/index', 1, ''),
(2, '添加', 'Home/add', 1, ''),
(3, '编辑', 'Home/edit', 1, ''),
(4, '删除', 'Home/delete', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `think_user`
--

DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `age` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户明细表';

--
-- 转存表中的数据 `think_user`
--

INSERT INTO `think_user` (`id`, `username`, `password`, `age`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `think_auth_group`
--
ALTER TABLE `think_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_auth_group_access`
--
ALTER TABLE `think_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `think_auth_rule`
--
ALTER TABLE `think_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `think_user`
--
ALTER TABLE `think_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `think_auth_group`
--
ALTER TABLE `think_auth_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `think_auth_rule`
--
ALTER TABLE `think_auth_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
