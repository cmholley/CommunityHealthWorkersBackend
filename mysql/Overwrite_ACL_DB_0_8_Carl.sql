-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2014 at 08:41 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET FOREIGN_KEY_CHECKS=0;
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Truncate table before insert `acl_class`
--

TRUNCATE TABLE `acl_class`;
--
-- Dumping data for table `acl_class`
--

INSERT INTO `acl_class` (`id`, `class`) VALUES
(7, 'dash.pojo.Group'),
(10, 'dash.pojo.Message'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=614 ;

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
(212, 65, 0, 42, 1, 1, 0, 0),
(213, 65, 1, 42, 2, 1, 0, 0),
(214, 65, 2, 42, 8, 1, 0, 0),
(218, 66, 0, 42, 1, 1, 0, 0),
(219, 66, 1, 42, 2, 1, 0, 0),
(220, 66, 2, 42, 8, 1, 0, 0),
(263, 76, 0, 46, 1, 1, 0, 0),
(264, 76, 1, 46, 2, 1, 0, 0),
(265, 76, 2, 46, 8, 1, 0, 0),
(266, 77, 0, 46, 128, 1, 0, 0),
(270, 78, 0, 46, 1, 1, 0, 0),
(271, 78, 1, 46, 2, 1, 0, 0),
(272, 78, 2, 46, 8, 1, 0, 0),
(276, 79, 0, 35, 1, 1, 0, 0),
(277, 79, 1, 35, 2, 1, 0, 0),
(278, 79, 2, 35, 8, 1, 0, 0),
(279, 80, 0, 35, 128, 1, 0, 0),
(283, 81, 0, 35, 1, 1, 0, 0),
(284, 81, 1, 35, 2, 1, 0, 0),
(285, 81, 2, 35, 8, 1, 0, 0),
(295, 83, 0, 35, 1, 1, 0, 0),
(296, 83, 1, 35, 2, 1, 0, 0),
(297, 83, 2, 35, 8, 1, 0, 0),
(301, 84, 0, 35, 1, 1, 0, 0),
(302, 84, 1, 35, 2, 1, 0, 0),
(303, 84, 2, 35, 8, 1, 0, 0),
(308, 86, 0, 46, 1, 1, 0, 0),
(309, 86, 1, 46, 2, 1, 0, 0),
(310, 86, 2, 46, 8, 1, 0, 0),
(314, 87, 0, 46, 1, 1, 0, 0),
(315, 87, 1, 46, 2, 1, 0, 0),
(316, 87, 2, 46, 8, 1, 0, 0),
(320, 88, 0, 46, 1, 1, 0, 0),
(321, 88, 1, 46, 2, 1, 0, 0),
(322, 88, 2, 46, 8, 1, 0, 0),
(326, 89, 0, 46, 1, 1, 0, 0),
(327, 89, 1, 46, 2, 1, 0, 0),
(328, 89, 2, 46, 8, 1, 0, 0),
(332, 90, 0, 46, 1, 1, 0, 0),
(333, 90, 1, 46, 2, 1, 0, 0),
(334, 90, 2, 46, 8, 1, 0, 0),
(338, 91, 0, 46, 1, 1, 0, 0),
(339, 91, 1, 46, 2, 1, 0, 0),
(340, 91, 2, 46, 8, 1, 0, 0),
(344, 92, 0, 46, 1, 1, 0, 0),
(345, 92, 1, 46, 2, 1, 0, 0),
(346, 92, 2, 46, 8, 1, 0, 0),
(350, 93, 0, 46, 1, 1, 0, 0),
(351, 93, 1, 46, 2, 1, 0, 0),
(352, 93, 2, 46, 8, 1, 0, 0),
(356, 94, 0, 46, 1, 1, 0, 0),
(357, 94, 1, 46, 2, 1, 0, 0),
(358, 94, 2, 46, 8, 1, 0, 0),
(362, 95, 0, 46, 1, 1, 0, 0),
(363, 95, 1, 46, 2, 1, 0, 0),
(364, 95, 2, 46, 8, 1, 0, 0),
(368, 96, 0, 46, 1, 1, 0, 0),
(369, 96, 1, 46, 2, 1, 0, 0),
(370, 96, 2, 46, 8, 1, 0, 0),
(374, 97, 0, 46, 1, 1, 0, 0),
(375, 97, 1, 46, 2, 1, 0, 0),
(376, 97, 2, 46, 8, 1, 0, 0),
(380, 98, 0, 46, 1, 1, 0, 0),
(381, 98, 1, 46, 2, 1, 0, 0),
(382, 98, 2, 46, 8, 1, 0, 0),
(386, 99, 0, 46, 1, 1, 0, 0),
(387, 99, 1, 46, 2, 1, 0, 0),
(388, 99, 2, 46, 8, 1, 0, 0),
(392, 100, 0, 46, 1, 1, 0, 0),
(393, 100, 1, 46, 2, 1, 0, 0),
(394, 100, 2, 46, 8, 1, 0, 0),
(398, 101, 0, 46, 1, 1, 0, 0),
(399, 101, 1, 46, 2, 1, 0, 0),
(400, 101, 2, 46, 8, 1, 0, 0),
(401, 102, 0, 46, 128, 1, 0, 0),
(405, 103, 0, 46, 1, 1, 0, 0),
(406, 103, 1, 46, 2, 1, 0, 0),
(407, 103, 2, 46, 8, 1, 0, 0),
(411, 104, 0, 46, 1, 1, 0, 0),
(412, 104, 1, 46, 2, 1, 0, 0),
(413, 104, 2, 46, 8, 1, 0, 0),
(417, 105, 0, 46, 1, 1, 0, 0),
(418, 105, 1, 46, 2, 1, 0, 0),
(419, 105, 2, 46, 8, 1, 0, 0),
(423, 106, 0, 46, 1, 1, 0, 0),
(424, 106, 1, 46, 2, 1, 0, 0),
(425, 106, 2, 46, 8, 1, 0, 0),
(429, 107, 0, 46, 1, 1, 0, 0),
(430, 107, 1, 46, 2, 1, 0, 0),
(431, 107, 2, 46, 8, 1, 0, 0),
(435, 108, 0, 46, 1, 1, 0, 0),
(436, 108, 1, 46, 2, 1, 0, 0),
(437, 108, 2, 46, 8, 1, 0, 0),
(441, 109, 0, 46, 1, 1, 0, 0),
(442, 109, 1, 46, 2, 1, 0, 0),
(443, 109, 2, 46, 8, 1, 0, 0),
(447, 110, 0, 46, 1, 1, 0, 0),
(448, 110, 1, 46, 2, 1, 0, 0),
(449, 110, 2, 46, 8, 1, 0, 0),
(453, 111, 0, 46, 1, 1, 0, 0),
(454, 111, 1, 46, 2, 1, 0, 0),
(455, 111, 2, 46, 8, 1, 0, 0),
(459, 112, 0, 46, 1, 1, 0, 0),
(460, 112, 1, 46, 2, 1, 0, 0),
(461, 112, 2, 46, 8, 1, 0, 0),
(465, 113, 0, 46, 1, 1, 0, 0),
(466, 113, 1, 46, 2, 1, 0, 0),
(467, 113, 2, 46, 8, 1, 0, 0),
(471, 114, 0, 46, 1, 1, 0, 0),
(472, 114, 1, 46, 2, 1, 0, 0),
(473, 114, 2, 46, 8, 1, 0, 0),
(477, 115, 0, 46, 1, 1, 0, 0),
(478, 115, 1, 46, 2, 1, 0, 0),
(479, 115, 2, 46, 8, 1, 0, 0),
(483, 116, 0, 46, 1, 1, 0, 0),
(484, 116, 1, 46, 2, 1, 0, 0),
(485, 116, 2, 46, 8, 1, 0, 0),
(489, 117, 0, 46, 1, 1, 0, 0),
(490, 117, 1, 46, 2, 1, 0, 0),
(491, 117, 2, 46, 8, 1, 0, 0),
(495, 118, 0, 46, 1, 1, 0, 0),
(496, 118, 1, 46, 2, 1, 0, 0),
(497, 118, 2, 46, 8, 1, 0, 0),
(501, 119, 0, 46, 1, 1, 0, 0),
(502, 119, 1, 46, 2, 1, 0, 0),
(503, 119, 2, 46, 8, 1, 0, 0),
(507, 120, 0, 46, 1, 1, 0, 0),
(508, 120, 1, 46, 2, 1, 0, 0),
(509, 120, 2, 46, 8, 1, 0, 0),
(513, 121, 0, 46, 1, 1, 0, 0),
(514, 121, 1, 46, 2, 1, 0, 0),
(515, 121, 2, 46, 8, 1, 0, 0),
(519, 122, 0, 46, 1, 1, 0, 0),
(520, 122, 1, 46, 2, 1, 0, 0),
(521, 122, 2, 46, 8, 1, 0, 0),
(525, 123, 0, 46, 1, 1, 0, 0),
(526, 123, 1, 46, 2, 1, 0, 0),
(527, 123, 2, 46, 8, 1, 0, 0),
(531, 124, 0, 46, 1, 1, 0, 0),
(532, 124, 1, 46, 2, 1, 0, 0),
(533, 124, 2, 46, 8, 1, 0, 0),
(537, 125, 0, 46, 1, 1, 0, 0),
(538, 125, 1, 46, 2, 1, 0, 0),
(539, 125, 2, 46, 8, 1, 0, 0),
(543, 126, 0, 46, 1, 1, 0, 0),
(544, 126, 1, 46, 2, 1, 0, 0),
(545, 126, 2, 46, 8, 1, 0, 0),
(549, 127, 0, 46, 1, 1, 0, 0),
(550, 127, 1, 46, 2, 1, 0, 0),
(551, 127, 2, 46, 8, 1, 0, 0),
(552, 128, 0, 46, 128, 1, 0, 0),
(556, 129, 0, 46, 1, 1, 0, 0),
(557, 129, 1, 46, 2, 1, 0, 0),
(558, 129, 2, 46, 8, 1, 0, 0),
(562, 130, 0, 46, 1, 1, 0, 0),
(563, 130, 1, 46, 2, 1, 0, 0),
(564, 130, 2, 46, 8, 1, 0, 0),
(568, 131, 0, 46, 1, 1, 0, 0),
(569, 131, 1, 46, 2, 1, 0, 0),
(570, 131, 2, 46, 8, 1, 0, 0),
(574, 132, 0, 46, 1, 1, 0, 0),
(575, 132, 1, 46, 2, 1, 0, 0),
(576, 132, 2, 46, 8, 1, 0, 0),
(580, 133, 0, 46, 1, 1, 0, 0),
(581, 133, 1, 46, 2, 1, 0, 0),
(582, 133, 2, 46, 8, 1, 0, 0),
(592, 135, 0, 46, 1, 1, 0, 0),
(593, 135, 1, 46, 2, 1, 0, 0),
(594, 135, 2, 46, 8, 1, 0, 0),
(598, 136, 0, 46, 1, 1, 0, 0),
(599, 136, 1, 46, 2, 1, 0, 0),
(600, 136, 2, 46, 8, 1, 0, 0),
(601, 59, 0, 35, 128, 1, 0, 0),
(602, 59, 1, 41, 64, 1, 0, 0),
(603, 59, 2, 42, 64, 1, 0, 0),
(604, 59, 3, 46, 64, 1, 0, 0),
(605, 63, 0, 41, 128, 1, 0, 0),
(606, 63, 1, 42, 64, 1, 0, 0),
(607, 63, 2, 46, 64, 1, 0, 0),
(611, 137, 0, 46, 1, 1, 0, 0),
(612, 137, 1, 46, 2, 1, 0, 0),
(613, 137, 2, 46, 8, 1, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=138 ;

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
(64, 4, 15, NULL, 4, 1),
(65, 9, 1, NULL, 4, 1),
(66, 9, 2, NULL, 4, 1),
(67, 4, 16, NULL, 4, 1),
(69, 4, 17, NULL, 4, 1),
(70, 7, 19, NULL, 4, 1),
(71, 9, 3, NULL, 4, 1),
(72, 8, 6, NULL, 4, 1),
(73, 4, 18, NULL, 4, 1),
(74, 9, 4, NULL, 4, 1),
(75, 9, 5, NULL, 4, 1),
(76, 4, 19, NULL, 4, 1),
(77, 7, 20, NULL, 4, 1),
(78, 9, 6, NULL, 4, 1),
(79, 9, 7, NULL, 4, 1),
(80, 8, 7, NULL, 4, 1),
(81, 10, 1, NULL, 4, 1),
(83, 10, 3, NULL, 4, 1),
(84, 10, 4, NULL, 4, 1),
(86, 10, 5, NULL, 4, 1),
(87, 10, 6, NULL, 4, 1),
(88, 10, 7, NULL, 4, 1),
(89, 10, 8, NULL, 4, 1),
(90, 10, 9, NULL, 4, 1),
(91, 10, 10, NULL, 4, 1),
(92, 10, 11, NULL, 4, 1),
(93, 10, 12, NULL, 4, 1),
(94, 10, 13, NULL, 4, 1),
(95, 10, 14, NULL, 4, 1),
(96, 10, 15, NULL, 4, 1),
(97, 10, 16, NULL, 4, 1),
(98, 10, 17, NULL, 4, 1),
(99, 10, 18, NULL, 4, 1),
(100, 10, 19, NULL, 4, 1),
(101, 10, 20, NULL, 4, 1),
(102, 8, 9, NULL, 4, 1),
(103, 10, 21, NULL, 4, 1),
(104, 10, 22, NULL, 4, 1),
(105, 10, 23, NULL, 4, 1),
(106, 10, 24, NULL, 4, 1),
(107, 10, 25, NULL, 4, 1),
(108, 10, 26, NULL, 4, 1),
(109, 10, 27, NULL, 4, 1),
(110, 10, 28, NULL, 4, 1),
(111, 10, 29, NULL, 4, 1),
(112, 10, 30, NULL, 4, 1),
(113, 10, 31, NULL, 4, 1),
(114, 10, 32, NULL, 4, 1),
(115, 10, 33, NULL, 4, 1),
(116, 10, 34, NULL, 4, 1),
(117, 10, 35, NULL, 4, 1),
(118, 10, 36, NULL, 4, 1),
(119, 10, 37, NULL, 4, 1),
(120, 10, 38, NULL, 4, 1),
(121, 10, 39, NULL, 4, 1),
(122, 10, 40, NULL, 4, 1),
(123, 10, 41, NULL, 4, 1),
(124, 10, 42, NULL, 4, 1),
(125, 10, 43, NULL, 4, 1),
(126, 10, 44, NULL, 4, 1),
(127, 10, 45, NULL, 4, 1),
(128, 8, 10, NULL, 4, 1),
(129, 10, 46, NULL, 4, 1),
(130, 10, 47, NULL, 4, 1),
(131, 10, 48, NULL, 4, 1),
(132, 10, 49, NULL, 4, 1),
(133, 10, 50, NULL, 4, 1),
(135, 10, 52, NULL, 4, 1),
(136, 10, 53, NULL, 4, 1),
(137, 10, 54, NULL, 4, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

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
(46, 1, 'test'),
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
('test', 'ROLE_USER'),
('User', 'ROLE_USER'),
('Visitor', 'ROLE_VISITOR');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Truncate table before insert `group_data`
--

TRUNCATE TABLE `group_data`;
--
-- Dumping data for table `group_data`
--

INSERT INTO `group_data` (`id`, `name`, `description`, `creation_timestamp`) VALUES
(16, 'TestGroup', 'This is the description, ''User'' is the group manager', '2014-07-29 16:14:53'),
(17, 'Breaking', NULL, '2014-08-12 15:34:08'),
(19, 'asdf', NULL, '2014-08-13 19:31:17'),
(20, 'asdfaasdf', NULL, '2014-08-13 19:47:48');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

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
('taskUser', 'test', 1, 15),
('test', '46469c25d7f54108c2385cea85129467ff5604925dcab1ff3589bf51ed3eb98b1bc647658ca62e6b1e19bc222301ab1e5a5f031671c3a865c6c75705650ad968', 1, 19);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Truncate table before insert `message`
--

TRUNCATE TABLE `message`;
--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `sender_uid`, `content`, `time`, `task_id`) VALUES
(53, 19, 'HI', '2014-08-15 12:19:38', 9),
(54, 19, 'Test message!', '2014-08-15 12:20:06', 5);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Truncate table before insert `post`
--

TRUNCATE TABLE `post`;
--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `user_id`, `group_id`, `content`, `image`, `creation_timestamp`, `latest_activity_timestamp`, `like_count`, `task_link_id`) VALUES
(2, 15, 16, 'This is test my post', NULL, '2014-08-07 12:53:49', '2014-08-07 12:53:49', 0, NULL),
(6, 19, 20, 'just a test edit', NULL, '2014-08-13 19:47:52', '2014-08-15 11:42:32', 0, NULL),
(7, 8, 16, 'HI', NULL, '2014-08-14 22:30:34', '2014-08-14 22:30:34', 0, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Truncate table before insert `tasks`
--

TRUNCATE TABLE `tasks`;
--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `group_id`, `name`, `description`, `time`, `duration`, `location`, `creation_timestamp`, `finished`, `badge_id`) VALUES
(5, 16, 'TestTask', NULL, NULL, 0, NULL, '2014-07-30 14:13:42', 0, NULL),
(6, 19, 'asdf', NULL, '2014-08-13 19:31:21', 0, NULL, '2014-08-13 19:31:23', 0, NULL),
(7, 16, 'HI', NULL, NULL, 0, NULL, '2014-08-14 22:41:57', 0, NULL),
(9, 20, 'fasdf', NULL, '2014-08-15 08:30:46', 0, NULL, '2014-08-15 08:30:49', 0, NULL),
(10, 20, 'task2', NULL, '2014-08-15 10:21:45', 0, NULL, '2014-08-15 10:21:49', 0, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

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
('taskUser', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-01 12:23:02'),
('test', 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-13 19:47:36');

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
  ADD CONSTRAINT `post->user_data.id` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `task->group.id()` FOREIGN KEY (`group_id`) REFERENCES `group_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
