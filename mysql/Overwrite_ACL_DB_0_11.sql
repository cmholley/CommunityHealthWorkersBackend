-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2014 at 12:01 AM
-- Server version: 5.6.16-log
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `volunteermanagementapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl_class`
--

DROP TABLE IF EXISTS `acl_class`;
CREATE TABLE IF NOT EXISTS `acl_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uk_2` (`class`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Truncate table before insert `acl_class`
--

TRUNCATE TABLE `acl_class`;
--
-- Dumping data for table `acl_class`
--

INSERT INTO `acl_class` (`id`, `class`) VALUES
(7, 'dash.pojo.Group'),
(9, 'dash.pojo.Post'),
(8, 'dash.pojo.Task'),
(4, 'dash.pojo.User');

-- --------------------------------------------------------

--
-- Table structure for table `acl_entry`
--

DROP TABLE IF EXISTS `acl_entry`;
CREATE TABLE IF NOT EXISTS `acl_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acl_object_identity` bigint(20) NOT NULL,
  `ace_order` int(11) NOT NULL,
  `sid` bigint(20) NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uk_4` (`acl_object_identity`,`ace_order`),
  UNIQUE KEY `Permission` (`sid`,`acl_object_identity`,`mask`) COMMENT 'Prevents duplicate permissions',
  KEY `foreign_fk_5` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=221 ;

--
-- Truncate table before insert `acl_entry`
--

TRUNCATE TABLE `acl_entry`;
--
-- Dumping data for table `acl_entry`
--

INSERT INTO `acl_entry` (`id`, `acl_object_identity`, `ace_order`, `sid`, `mask`, `granting`, `audit_success`, `audit_failure`) VALUES
(1, 10, 0, 4, 1, 1, 1, 1),
(2, 10, 1, 4, 2, 1, 0, 0),
(127, 46, 0, 35, 1, 1, 0, 0),
(128, 46, 1, 35, 2, 1, 0, 0),
(129, 46, 2, 35, 8, 1, 0, 0),
(130, 45, 0, 34, 1, 1, 0, 0),
(134, 57, 0, 39, 1, 1, 0, 0),
(135, 57, 1, 39, 2, 1, 0, 0),
(136, 57, 2, 39, 8, 1, 0, 0),
(147, 60, 0, 41, 1, 1, 0, 0),
(148, 60, 1, 41, 2, 1, 0, 0),
(149, 60, 2, 41, 8, 1, 0, 0),
(195, 64, 0, 42, 1, 1, 0, 0),
(196, 64, 1, 42, 2, 1, 0, 0),
(197, 64, 2, 42, 8, 1, 0, 0),
(198, 59, 0, 35, 128, 1, 0, 0),
(199, 59, 1, 41, 64, 1, 0, 0),
(200, 59, 2, 42, 64, 1, 0, 0),
(207, 63, 0, 41, 128, 1, 0, 0),
(208, 63, 1, 42, 64, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_object_identity`
--

DROP TABLE IF EXISTS `acl_object_identity`;
CREATE TABLE IF NOT EXISTS `acl_object_identity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id_class` bigint(20) NOT NULL,
  `object_id_identity` bigint(20) NOT NULL,
  `parent_object` bigint(20) DEFAULT NULL,
  `owner_sid` bigint(20) NOT NULL DEFAULT '4',
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uk_3` (`object_id_class`,`object_id_identity`),
  KEY `foreign_fk_1` (`parent_object`),
  KEY `foreign_fk_3` (`owner_sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Truncate table before insert `acl_object_identity`
--

TRUNCATE TABLE `acl_object_identity`;
--
-- Dumping data for table `acl_object_identity`
--

INSERT INTO `acl_object_identity` (`id`, `object_id_class`, `object_id_identity`, `parent_object`, `owner_sid`, `entries_inheriting`) VALUES
(10, 4, 1, NULL, 4, 0),
(45, 4, 7, NULL, 4, 1),
(46, 4, 8, NULL, 4, 1),
(57, 4, 12, NULL, 4, 1),
(59, 7, 16, NULL, 4, 1),
(60, 4, 14, NULL, 4, 1),
(63, 8, 5, NULL, 4, 1),
(64, 4, 15, NULL, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `acl_sid`
--

DROP TABLE IF EXISTS `acl_sid`;
CREATE TABLE IF NOT EXISTS `acl_sid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` tinyint(1) NOT NULL,
  `sid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uk_1` (`sid`,`principal`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Truncate table before insert `acl_sid`
--

TRUNCATE TABLE `acl_sid`;
--
-- Dumping data for table `acl_sid`
--

INSERT INTO `acl_sid` (`id`, `principal`, `sid`) VALUES
(39, 1, 'Admin'),
(4, 1, 'Root'),
(41, 1, 'TaskManagerDemo'),
(42, 1, 'taskUser'),
(35, 1, 'User'),
(34, 1, 'Visitor');

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE IF NOT EXISTS `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `ix_auth_username` (`username`,`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `authorities`
--

TRUNCATE TABLE `authorities`;
--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('Admin', 'ROLE_ADMIN'),
('Root', 'ROLE_ROOT'),
('TaskManagerDemo', 'ROLE_USER'),
('taskUser', 'ROLE_USER'),
('User', 'ROLE_USER'),
('Visitor', 'ROLE_VISITOR');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(10240) NOT NULL,
  `creation_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `latest_activity_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `comment`
--

TRUNCATE TABLE `comment`;
-- --------------------------------------------------------

--
-- Table structure for table `entered_hours`
--

DROP TABLE IF EXISTS `entered_hours`;
CREATE TABLE IF NOT EXISTS `entered_hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `duration` int(11) NOT NULL,
  `pending` tinyint(1) NOT NULL DEFAULT '1',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Truncate table before insert `entered_hours`
--

TRUNCATE TABLE `entered_hours`;
-- --------------------------------------------------------

--
-- Table structure for table `group_data`
--

DROP TABLE IF EXISTS `group_data`;
CREATE TABLE IF NOT EXISTS `group_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Truncate table before insert `group_data`
--

TRUNCATE TABLE `group_data`;
--
-- Dumping data for table `group_data`
--

INSERT INTO `group_data` (`id`, `name`, `description`, `creation_timestamp`) VALUES
(16, 'TestGroup', 'This is the description, ''User'' is the group manager', '2014-07-29 16:14:53'),
(17, 'Breaking', NULL, '2014-08-12 15:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Truncate table before insert `login`
--

TRUNCATE TABLE `login`;
--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `enabled`, `id`) VALUES
('Root', 'test', 1, 1),
('Visitor', 'test', 1, 7),
('User', 'test', 1, 8),
('Admin', 'test', 1, 12),
('TaskManagerDemo', 'test', 1, 14),
('taskUser', 'test', 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_uid` int(11) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `time` datetime NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `message`
--

TRUNCATE TABLE `message`;
-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `image` varchar(256) DEFAULT NULL,
  `creation_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latest_activity_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `task_link_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `latest_activity_timestamp` (`latest_activity_timestamp`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Truncate table before insert `post`
--

TRUNCATE TABLE `post`;
--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `user_id`, `group_id`, `content`, `image`, `creation_timestamp`, `latest_activity_timestamp`, `like_count`, `task_link_id`) VALUES
(2, 15, 16, 'This is test my post', NULL, '2014-08-07 12:53:49', '2014-08-07 12:53:49', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL,
  `creation_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `badge_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `name` (`name`),
  KEY `creation_timestamp` (`creation_timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Truncate table before insert `tasks`
--

TRUNCATE TABLE `tasks`;
--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `group_id`, `name`, `description`, `time`, `duration`, `location`, `creation_timestamp`, `finished`, `badge_id`) VALUES
(5, 16, 'TestTask', NULL, NULL, 0, NULL, '2014-07-30 14:13:42', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
CREATE TABLE IF NOT EXISTS `user_data` (
  `username` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `homePhone` varchar(10) DEFAULT NULL,
  `cellPhone` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `insertion_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Truncate table before insert `user_data`
--

TRUNCATE TABLE `user_data`;
--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`username`, `id`, `firstName`, `lastName`, `city`, `homePhone`, `cellPhone`, `email`, `picture`, `insertion_date`) VALUES
('Root', 1, '', '', NULL, NULL, NULL, NULL, NULL, '2014-07-09 16:41:51'),
('Visitor', 7, 'Client', 'Device', NULL, NULL, NULL, NULL, NULL, '2014-07-18 12:12:54'),
('User', 8, 'Demo', 'ofUser', NULL, NULL, NULL, NULL, NULL, '2014-07-18 12:14:26'),
('Admin', 12, 'Demo', 'ofAdmin', NULL, NULL, NULL, NULL, NULL, '2014-07-24 10:38:34'),
('TaskManagerDemo', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-07-29 16:17:31'),
('taskUser', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-01 12:23:02');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acl_entry`
--
ALTER TABLE `acl_entry`
  ADD CONSTRAINT `foreign_fk_4` FOREIGN KEY (`acl_object_identity`) REFERENCES `acl_object_identity` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `foreign_fk_5` FOREIGN KEY (`sid`) REFERENCES `acl_sid` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `acl_object_identity`
--
ALTER TABLE `acl_object_identity`
  ADD CONSTRAINT `object_id->acl_class.id` FOREIGN KEY (`object_id_class`) REFERENCES `acl_class` (`id`),
  ADD CONSTRAINT `object_id->acl_sid.id` FOREIGN KEY (`owner_sid`) REFERENCES `acl_sid` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `object_id->object_id.id` FOREIGN KEY (`parent_object`) REFERENCES `acl_object_identity` (`id`);

--
-- Constraints for table `acl_sid`
--
ALTER TABLE `acl_sid`
  ADD CONSTRAINT `acl_sid_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `user_data` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment->post.id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment->user_data.id` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login->user_data (id)` FOREIGN KEY (`id`) REFERENCES `user_data` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `login->user_data (username)` FOREIGN KEY (`username`) REFERENCES `user_data` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post->group_data.id` FOREIGN KEY (`group_id`) REFERENCES `group_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post->user_data.id` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `task->group.id()` FOREIGN KEY (`group_id`) REFERENCES `group_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
