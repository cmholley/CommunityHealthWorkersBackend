-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2014 at 03:46 PM
-- Server version: 5.6.16
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Truncate table before insert `acl_class`
--

TRUNCATE TABLE `acl_class`;
--
-- Dumping data for table `acl_class`
--

INSERT INTO `acl_class` (`id`, `class`) VALUES
(11, 'dash.pojo.Comment'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=837 ;

--
-- RELATIONS FOR TABLE `acl_entry`:
--   `acl_object_identity`
--       `acl_object_identity` -> `id`
--   `sid`
--       `acl_sid` -> `id`
--

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
(270, 78, 0, 46, 1, 1, 0, 0),
(271, 78, 1, 46, 2, 1, 0, 0),
(272, 78, 2, 46, 8, 1, 0, 0),
(276, 79, 0, 35, 1, 1, 0, 0),
(277, 79, 1, 35, 2, 1, 0, 0),
(278, 79, 2, 35, 8, 1, 0, 0),
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
(611, 137, 0, 46, 1, 1, 0, 0),
(612, 137, 1, 46, 2, 1, 0, 0),
(613, 137, 2, 46, 8, 1, 0, 0),
(617, 138, 0, 46, 1, 1, 0, 0),
(618, 138, 1, 46, 2, 1, 0, 0),
(619, 138, 2, 46, 8, 1, 0, 0),
(623, 139, 0, 46, 1, 1, 0, 0),
(624, 139, 1, 46, 2, 1, 0, 0),
(625, 139, 2, 46, 8, 1, 0, 0),
(629, 77, 0, 46, 64, 1, 0, 0),
(630, 102, 0, 46, 64, 1, 0, 0),
(631, 128, 0, 46, 64, 1, 0, 0),
(635, 140, 0, 46, 1, 1, 0, 0),
(636, 140, 1, 46, 2, 1, 0, 0),
(637, 140, 2, 46, 8, 1, 0, 0),
(659, 63, 0, 41, 128, 1, 0, 0),
(660, 63, 1, 42, 64, 1, 0, 0),
(661, 63, 2, 46, 64, 1, 0, 0),
(662, 142, 0, 46, 128, 1, 0, 0),
(670, 80, 0, 35, 128, 1, 0, 0),
(671, 80, 1, 46, 64, 1, 0, 0),
(675, 143, 0, 46, 1, 1, 0, 0),
(676, 143, 1, 46, 2, 1, 0, 0),
(677, 143, 2, 46, 8, 1, 0, 0),
(681, 144, 0, 46, 1, 1, 0, 0),
(682, 144, 1, 46, 2, 1, 0, 0),
(683, 144, 2, 46, 8, 1, 0, 0),
(687, 145, 0, 46, 1, 1, 0, 0),
(688, 145, 1, 46, 2, 1, 0, 0),
(689, 145, 2, 46, 8, 1, 0, 0),
(693, 146, 0, 46, 1, 1, 0, 0),
(694, 146, 1, 46, 2, 1, 0, 0),
(695, 146, 2, 46, 8, 1, 0, 0),
(699, 147, 0, 46, 1, 1, 0, 0),
(700, 147, 1, 46, 2, 1, 0, 0),
(701, 147, 2, 46, 8, 1, 0, 0),
(705, 148, 0, 46, 1, 1, 0, 0),
(706, 148, 1, 46, 2, 1, 0, 0),
(707, 148, 2, 46, 8, 1, 0, 0),
(708, 149, 0, 46, 128, 1, 0, 0),
(709, 150, 0, 46, 128, 1, 0, 0),
(710, 151, 0, 46, 128, 1, 0, 0),
(714, 152, 0, 46, 1, 1, 0, 0),
(715, 152, 1, 46, 2, 1, 0, 0),
(716, 152, 2, 46, 8, 1, 0, 0),
(720, 153, 0, 46, 1, 1, 0, 0),
(721, 153, 1, 46, 2, 1, 0, 0),
(722, 153, 2, 46, 8, 1, 0, 0),
(726, 154, 0, 46, 1, 1, 0, 0),
(727, 154, 1, 46, 2, 1, 0, 0),
(728, 154, 2, 46, 8, 1, 0, 0),
(732, 155, 0, 46, 1, 1, 0, 0),
(733, 155, 1, 46, 2, 1, 0, 0),
(734, 155, 2, 46, 8, 1, 0, 0),
(738, 156, 0, 46, 1, 1, 0, 0),
(739, 156, 1, 46, 2, 1, 0, 0),
(740, 156, 2, 46, 8, 1, 0, 0),
(744, 157, 0, 46, 1, 1, 0, 0),
(745, 157, 1, 46, 2, 1, 0, 0),
(746, 157, 2, 46, 8, 1, 0, 0),
(750, 158, 0, 46, 1, 1, 0, 0),
(751, 158, 1, 46, 2, 1, 0, 0),
(752, 158, 2, 46, 8, 1, 0, 0),
(756, 159, 0, 46, 1, 1, 0, 0),
(757, 159, 1, 46, 2, 1, 0, 0),
(758, 159, 2, 46, 8, 1, 0, 0),
(762, 160, 0, 46, 1, 1, 0, 0),
(763, 160, 1, 46, 2, 1, 0, 0),
(764, 160, 2, 46, 8, 1, 0, 0),
(768, 161, 0, 46, 1, 1, 0, 0),
(769, 161, 1, 46, 2, 1, 0, 0),
(770, 161, 2, 46, 8, 1, 0, 0),
(774, 162, 0, 46, 1, 1, 0, 0),
(775, 162, 1, 46, 2, 1, 0, 0),
(776, 162, 2, 46, 8, 1, 0, 0),
(780, 163, 0, 46, 1, 1, 0, 0),
(781, 163, 1, 46, 2, 1, 0, 0),
(782, 163, 2, 46, 8, 1, 0, 0),
(786, 164, 0, 47, 1, 1, 0, 0),
(787, 164, 1, 47, 2, 1, 0, 0),
(788, 164, 2, 47, 8, 1, 0, 0),
(792, 165, 0, 48, 1, 1, 0, 0),
(793, 165, 1, 48, 2, 1, 0, 0),
(794, 165, 2, 48, 8, 1, 0, 0),
(798, 166, 0, 49, 1, 1, 0, 0),
(799, 166, 1, 49, 2, 1, 0, 0),
(800, 166, 2, 49, 8, 1, 0, 0),
(804, 167, 0, 50, 1, 1, 0, 0),
(805, 167, 1, 50, 2, 1, 0, 0),
(806, 167, 2, 50, 8, 1, 0, 0),
(810, 168, 0, 46, 1, 1, 0, 0),
(811, 168, 1, 46, 2, 1, 0, 0),
(812, 168, 2, 46, 8, 1, 0, 0),
(816, 169, 0, 46, 1, 1, 0, 0),
(817, 169, 1, 46, 2, 1, 0, 0),
(818, 169, 2, 46, 8, 1, 0, 0),
(822, 170, 0, 46, 1, 1, 0, 0),
(823, 170, 1, 46, 2, 1, 0, 0),
(824, 170, 2, 46, 8, 1, 0, 0),
(834, 172, 0, 35, 1, 1, 0, 0),
(835, 172, 1, 35, 2, 1, 0, 0),
(836, 172, 2, 35, 8, 1, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=173 ;

--
-- RELATIONS FOR TABLE `acl_object_identity`:
--   `object_id_class`
--       `acl_class` -> `id`
--   `owner_sid`
--       `acl_sid` -> `id`
--   `parent_object`
--       `acl_object_identity` -> `id`
--

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
(137, 10, 54, NULL, 4, 1),
(138, 10, 55, NULL, 4, 1),
(139, 10, 56, NULL, 4, 1),
(140, 9, 8, NULL, 4, 1),
(142, 7, 21, NULL, 4, 1),
(143, 10, 57, NULL, 4, 1),
(144, 10, 58, NULL, 4, 1),
(145, 10, 59, NULL, 4, 1),
(146, 10, 60, NULL, 4, 1),
(147, 10, 61, NULL, 4, 1),
(148, 10, 62, NULL, 4, 1),
(149, 7, 22, NULL, 4, 1),
(150, 8, 11, NULL, 4, 1),
(151, 8, 12, NULL, 4, 1),
(152, 10, 63, NULL, 4, 1),
(153, 10, 64, NULL, 4, 1),
(154, 10, 65, NULL, 4, 1),
(155, 10, 66, NULL, 4, 1),
(156, 10, 67, NULL, 4, 1),
(157, 10, 68, NULL, 4, 1),
(158, 10, 69, NULL, 4, 1),
(159, 10, 70, NULL, 4, 1),
(160, 10, 71, NULL, 4, 1),
(161, 10, 72, NULL, 4, 1),
(162, 10, 73, NULL, 4, 1),
(163, 9, 10, NULL, 4, 1),
(164, 4, 20, NULL, 4, 1),
(165, 4, 22, NULL, 4, 1),
(166, 4, 23, NULL, 4, 1),
(167, 4, 24, NULL, 4, 1),
(168, 9, 11, NULL, 4, 1),
(169, 9, 13, NULL, 4, 1),
(170, 9, 16, NULL, 4, 1),
(172, 11, 2, NULL, 4, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- RELATIONS FOR TABLE `acl_sid`:
--   `sid`
--       `user_data` -> `username`
--

--
-- Truncate table before insert `acl_sid`
--

TRUNCATE TABLE `acl_sid`;
--
-- Dumping data for table `acl_sid`
--

INSERT INTO `acl_sid` (`id`, `principal`, `sid`) VALUES
(39, 1, 'Admin'),
(49, 1, 'chris2'),
(47, 1, 'chris3'),
(50, 1, 'chris58'),
(4, 1, 'Root'),
(41, 1, 'TaskManagerDemo'),
(42, 1, 'taskUser'),
(46, 1, 'test'),
(48, 1, 'test1'),
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
-- RELATIONS FOR TABLE `authorities`:
--   `username`
--       `login` -> `username`
--

--
-- Truncate table before insert `authorities`
--

TRUNCATE TABLE `authorities`;
--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('Admin', 'ROLE_ADMIN'),
('chris2', 'ROLE_USER'),
('chris3', 'ROLE_USER'),
('chris58', 'ROLE_USER'),
('Root', 'ROLE_ROOT'),
('TaskManagerDemo', 'ROLE_USER'),
('taskUser', 'ROLE_USER'),
('test', 'ROLE_USER'),
('test1', 'ROLE_USER'),
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
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Truncate table before insert `comment`
--

TRUNCATE TABLE `comment`;
--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `creation_timestamp`, `image`, `user_id`, `latest_activity_timestamp`, `post_id`) VALUES
(2, 'HELLO', '2014-08-19 08:32:03', NULL, 7, '2014-08-19 08:41:36', 16);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

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
(20, 'asdfaasdf', NULL, '2014-08-13 19:47:48'),
(21, 'asdfa', 'asdf', '2014-08-15 14:49:40'),
(22, 'sdfg', NULL, '2014-08-18 07:30:24');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- RELATIONS FOR TABLE `login`:
--   `id`
--       `user_data` -> `id`
--   `username`
--       `user_data` -> `username`
--

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
('test', '46469c25d7f54108c2385cea85129467ff5604925dcab1ff3589bf51ed3eb98b1bc647658ca62e6b1e19bc222301ab1e5a5f031671c3a865c6c75705650ad968', 1, 19),
('chris3', 'ffbf7030454b626a5ce30e083cde83c67812d2a3558c8d2a99950e3f9209fbd0ad930bf29a3e36432d874c606b8351f9e30f2cb70215fb45fbbfcb84c6051bab', 1, 20),
('test1', '775a818ec130b00302dea5b9b4acefab1985e8ed61b5b0fdbba40f4a8f7fe2f118af92e007b070cf5daa2021b1d60b6d55718a5ec0e3936dbd48645fa58228dc', 1, 22),
('chris2', 'b7187a37c2b79fbf83ef9b1b957effed966741313dcb58b04253114248d7b67177c5c265d2a741d9261d04d0e44fc462aa1dd22e528d502b5671581dd5593ea3', 1, 23),
('chris58', '162d27e7060c75a4a01363a7baef04c32d53b337c32c5281ae1ab61cc1924fdb1b280df0106947ad591d0e8c32c4024b0966b9e46c8bacc23b8f36030b4dd219', 1, 24);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Truncate table before insert `message`
--

TRUNCATE TABLE `message`;
--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `sender_uid`, `content`, `time`, `task_id`) VALUES
(53, 19, 'HI', '2014-08-15 12:19:38', 9),
(54, 19, 'Test message!', '2014-08-15 12:20:06', 5),
(55, 19, 'more testin''a', '2014-08-15 14:28:55', 5),
(56, 19, 'chron', '2014-08-15 14:29:10', 5),
(57, 19, 'shhsh', '2014-08-15 15:06:08', 9),
(58, 19, 'hello', '2014-08-15 15:06:20', 5),
(59, 19, 'gah', '2014-08-15 15:09:03', 7),
(60, 19, 'asdf', '2014-08-18 07:28:13', 5),
(61, 19, 'fisow', '2014-08-18 07:28:17', 5),
(62, 19, 'shs', '2014-08-18 07:29:26', 5),
(63, 19, 'xndbd', '2014-08-18 08:08:30', 10),
(64, 19, 'ytjod', '2014-08-18 08:08:33', 10),
(65, 19, 'dhbsjs', '2014-08-18 08:08:34', 10),
(66, 19, 'macro', '2014-08-18 08:08:36', 10),
(67, 19, 'schnoz', '2014-08-18 08:08:37', 10),
(68, 19, 'now', '2014-08-18 08:08:39', 10),
(69, 19, 'very', '2014-08-18 08:08:41', 10),
(70, 19, 'MHC', '2014-08-18 08:08:43', 10),
(71, 19, 'now', '2014-08-18 08:08:44', 10),
(72, 19, 'child', '2014-08-18 08:08:46', 10),
(73, 19, 'swami', '2014-08-18 08:08:47', 10);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- RELATIONS FOR TABLE `post`:
--   `group_id`
--       `group_data` -> `id`
--   `user_id`
--       `user_data` -> `id`
--

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
(7, 8, 16, 'HI', NULL, '2014-08-14 22:30:34', '2014-08-14 22:30:34', 0, NULL),
(8, 19, 16, 'My permission testings.', NULL, '2014-08-15 14:32:40', '2014-08-15 14:33:18', 0, NULL),
(10, 19, 21, 'eis', NULL, '2014-08-18 08:09:37', '2014-08-18 08:09:37', 0, NULL),
(11, 19, 16, 'HI', NULL, '2014-08-18 14:35:58', '2014-08-18 14:35:58', 0, NULL),
(13, 1, 16, 'HI', NULL, '2014-08-18 14:36:29', '2014-08-18 14:36:29', 0, NULL),
(16, 7, 16, 'HI', NULL, '2014-08-18 14:37:46', '2014-08-18 14:37:46', 0, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- RELATIONS FOR TABLE `tasks`:
--   `group_id`
--       `group_data` -> `id`
--

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
(10, 20, 'task2', NULL, '2014-08-15 10:21:45', 0, NULL, '2014-08-15 10:21:49', 0, NULL),
(11, 22, 'heck', NULL, '2014-08-18 07:31:50', 0, NULL, '2014-08-18 07:31:53', 0, NULL),
(12, 20, 'asdffas', NULL, NULL, 2, 'A house', '2014-08-18 08:03:03', 0, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

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
('test', 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-13 19:47:36'),
('chris3', 20, 'chris3', 'chris3', NULL, NULL, NULL, NULL, NULL, '2014-08-18 09:41:31'),
('test1', 22, 'test', 'test', NULL, NULL, NULL, NULL, NULL, '2014-08-18 09:43:23'),
('chris2', 23, 'chris3', 'chris3', NULL, NULL, NULL, NULL, NULL, '2014-08-18 09:44:21'),
('chris58', 24, 'chris58', 'chris58', NULL, NULL, NULL, NULL, NULL, '2014-08-18 09:45:02');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
