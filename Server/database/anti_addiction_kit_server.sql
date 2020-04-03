-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 172.26.1.2
-- Generation Time: 2020-04-03 05:26:01
-- 服务器版本： 5.6.39-log
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anti_addiction_kit_server`
--
CREATE DATABASE IF NOT EXISTS `anti_addiction_kit_server` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `anti_addiction_kit_server`;

-- --------------------------------------------------------

--
-- 表的结构 `identify_charge_amounts`
--

DROP TABLE IF EXISTS `identify_charge_amounts`;
CREATE TABLE IF NOT EXISTS `identify_charge_amounts` (
  `id` int(11) unsigned NOT NULL,
  `identify` varchar(255) NOT NULL,
  `amount` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '金额',
  `month` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `switchs`
--

DROP TABLE IF EXISTS `switchs`;
CREATE TABLE IF NOT EXISTS `switchs` (
  `id` int(10) unsigned NOT NULL,
  `use_time_switch` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '默认0，ps 0 ：使用客户端时间，1：使用服务器时间',
  `share_duration_switch` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '默认0，ps 0：分游戏计算时长，1：统一计算',
  `night_ban_time_start` varchar(10) NOT NULL DEFAULT '22:00' COMMENT '宵禁开始时间',
  `night_ban_time_end` varchar(10) NOT NULL DEFAULT '08:00' COMMENT '宵禁结束时间',
  `shiming_user_duration` int(3) unsigned NOT NULL DEFAULT '5400' COMMENT '实名未成年账号时长',
  `no_shiming_user_duration` int(11) NOT NULL COMMENT '未实名游戏时长',
  `shiming_user_holiday_duration` int(3) unsigned NOT NULL DEFAULT '10800' COMMENT '实名未成年账号节假日时长',
  `holiday_dates` text NOT NULL COMMENT '每年的法定节假日json',
  `version` varchar(20) NOT NULL COMMENT '版本'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户 ID',
  `is_identification` int(1) NOT NULL COMMENT '是否实名认证',
  `identify` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user_play_durations`
--

DROP TABLE IF EXISTS `user_play_durations`;
CREATE TABLE IF NOT EXISTS `user_play_durations` (
  `id` int(10) unsigned NOT NULL,
  `day` varchar(10) NOT NULL,
  `duration` int(3) unsigned NOT NULL,
  `duration_key` varchar(255) NOT NULL,
  `last_timestamp` int(11) unsigned NOT NULL COMMENT '最后一次游戏时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `identify_charge_amounts`
--
ALTER TABLE `identify_charge_amounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identify` (`identify`,`month`),
  ADD KEY `month` (`month`) USING BTREE;

--
-- Indexes for table `switchs`
--
ALTER TABLE `switchs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `identify` (`identify`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `user_play_durations`
--
ALTER TABLE `user_play_durations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `day` (`day`,`duration_key`) USING BTREE,
  ADD KEY `duration_key` (`duration_key`),
  ADD KEY `last_timestamp` (`last_timestamp`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `identify_charge_amounts`
--
ALTER TABLE `identify_charge_amounts`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `switchs`
--
ALTER TABLE `switchs`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_play_durations`
--
ALTER TABLE `user_play_durations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
