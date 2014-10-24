# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.19)
# Database: CHWApp
# Generation Time: 2014-10-24 16:39:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table acl_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `acl_class`;

CREATE TABLE `acl_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uk_2` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `acl_class` WRITE;
/*!40000 ALTER TABLE `acl_class` DISABLE KEYS */;

INSERT INTO `acl_class` (`id`, `class`)
VALUES
	(5,'dash.pojo.Class'),
	(7,'dash.pojo.Group'),
	(6,'dash.pojo.Location'),
	(9,'dash.pojo.Post'),
	(8,'dash.pojo.Task'),
	(4,'dash.pojo.User');

/*!40000 ALTER TABLE `acl_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table acl_entry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `acl_entry`;

CREATE TABLE `acl_entry` (
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
  KEY `foreign_fk_5` (`sid`),
  CONSTRAINT `foreign_fk_4` FOREIGN KEY (`acl_object_identity`) REFERENCES `acl_object_identity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `foreign_fk_5` FOREIGN KEY (`sid`) REFERENCES `acl_sid` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `acl_entry` WRITE;
/*!40000 ALTER TABLE `acl_entry` DISABLE KEYS */;

INSERT INTO `acl_entry` (`id`, `acl_object_identity`, `ace_order`, `sid`, `mask`, `granting`, `audit_success`, `audit_failure`)
VALUES
	(1,10,0,4,1,1,1,1),
	(2,10,1,4,2,1,0,0),
	(127,46,0,35,1,1,0,0),
	(128,46,1,35,2,1,0,0),
	(129,46,2,35,8,1,0,0),
	(130,45,0,34,1,1,0,0),
	(134,57,0,39,1,1,0,0),
	(135,57,1,39,2,1,0,0),
	(136,57,2,39,8,1,0,0),
	(147,60,0,41,1,1,0,0),
	(148,60,1,41,2,1,0,0),
	(149,60,2,41,8,1,0,0),
	(195,64,0,42,1,1,0,0),
	(196,64,1,42,2,1,0,0),
	(197,64,2,42,8,1,0,0),
	(198,59,0,35,128,1,0,0),
	(199,59,1,41,64,1,0,0),
	(200,59,2,42,64,1,0,0),
	(207,63,0,41,128,1,0,0),
	(208,63,1,42,64,1,0,0),
	(212,65,0,43,1,1,0,0),
	(213,65,1,43,2,1,0,0),
	(214,65,2,43,8,1,0,0);

/*!40000 ALTER TABLE `acl_entry` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table acl_object_identity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `acl_object_identity`;

CREATE TABLE `acl_object_identity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id_class` bigint(20) NOT NULL,
  `object_id_identity` bigint(20) NOT NULL,
  `parent_object` bigint(20) DEFAULT NULL,
  `owner_sid` bigint(20) NOT NULL DEFAULT '4',
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uk_3` (`object_id_class`,`object_id_identity`),
  KEY `foreign_fk_1` (`parent_object`),
  KEY `foreign_fk_3` (`owner_sid`),
  CONSTRAINT `object_id->acl_class.id` FOREIGN KEY (`object_id_class`) REFERENCES `acl_class` (`id`),
  CONSTRAINT `object_id->acl_sid.id` FOREIGN KEY (`owner_sid`) REFERENCES `acl_sid` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `object_id->object_id.id` FOREIGN KEY (`parent_object`) REFERENCES `acl_object_identity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `acl_object_identity` WRITE;
/*!40000 ALTER TABLE `acl_object_identity` DISABLE KEYS */;

INSERT INTO `acl_object_identity` (`id`, `object_id_class`, `object_id_identity`, `parent_object`, `owner_sid`, `entries_inheriting`)
VALUES
	(10,4,1,NULL,4,0),
	(45,4,7,NULL,4,1),
	(46,4,8,NULL,4,1),
	(57,4,12,NULL,4,1),
	(59,7,16,NULL,4,1),
	(60,4,14,NULL,4,1),
	(63,8,5,NULL,4,1),
	(64,4,15,NULL,4,1),
	(65,4,18,NULL,4,1);

/*!40000 ALTER TABLE `acl_object_identity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table acl_sid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `acl_sid`;

CREATE TABLE `acl_sid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` tinyint(1) NOT NULL,
  `sid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uk_1` (`sid`,`principal`),
  CONSTRAINT `acl_sid_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `user_data` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `acl_sid` WRITE;
/*!40000 ALTER TABLE `acl_sid` DISABLE KEYS */;

INSERT INTO `acl_sid` (`id`, `principal`, `sid`)
VALUES
	(39,1,'Admin'),
	(43,1,'BrokenTest'),
	(4,1,'Root'),
	(41,1,'TaskManagerDemo'),
	(42,1,'taskUser'),
	(35,1,'User'),
	(34,1,'Visitor');

/*!40000 ALTER TABLE `acl_sid` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table authorities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authorities`;

CREATE TABLE `authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_auth_username` (`username`,`authority`),
  CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;

INSERT INTO `authorities` (`id`, `username`, `authority`)
VALUES
	(1,'Admin','ROLE_ADMIN'),
	(7,'BrokenTest','ROLE_USER'),
	(2,'Root','ROLE_ROOT'),
	(3,'TaskManagerDemo','ROLE_USER'),
	(4,'taskUser','ROLE_USER'),
	(5,'User','ROLE_USER'),
	(6,'Visitor','ROLE_VISITOR');

/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table classes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `room` varchar(128) DEFAULT NULL,
  `creation_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `core_id` int(11) DEFAULT NULL,
  `open` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `name` (`name`),
  KEY `creation_timestamp` (`creation_timestamp`),
  CONSTRAINT `class->location.id()` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
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
  KEY `post_id` (`post_id`),
  CONSTRAINT `comment->post.id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment->user_data.id` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table entered_hours
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entered_hours`;

CREATE TABLE `entered_hours` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table group_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `group_data`;

CREATE TABLE `group_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `group_data` WRITE;
/*!40000 ALTER TABLE `group_data` DISABLE KEYS */;

INSERT INTO `group_data` (`id`, `name`, `description`, `creation_timestamp`)
VALUES
	(16,'TestGroup','This is the description, \'User\' is the group manager','2014-07-29 16:14:53'),
	(17,'Breaking',NULL,'2014-08-12 15:34:08');

/*!40000 ALTER TABLE `group_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `login->user_data (id)` FOREIGN KEY (`id`) REFERENCES `user_data` (`id`) ON DELETE CASCADE,
  CONSTRAINT `login->user_data (username)` FOREIGN KEY (`username`) REFERENCES `user_data` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;

INSERT INTO `login` (`username`, `password`, `enabled`, `id`)
VALUES
	('Root','test',1,1),
	('Visitor','test',1,7),
	('User','test',1,8),
	('Admin','test',1,12),
	('TaskManagerDemo','test',1,14),
	('taskUser','test',1,15),
	('BrokenTest','test',1,18);

/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_uid` int(11) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `time` datetime NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
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
  KEY `user_id` (`user_id`),
  CONSTRAINT `post->group_data.id` FOREIGN KEY (`group_id`) REFERENCES `group_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post->user_data.id` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;

INSERT INTO `post` (`id`, `user_id`, `group_id`, `content`, `image`, `creation_timestamp`, `latest_activity_timestamp`, `like_count`, `task_link_id`)
VALUES
	(2,15,16,'This is test my post',NULL,'2014-08-07 12:53:49','2014-08-07 12:53:49',0,NULL);

/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
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
  KEY `creation_timestamp` (`creation_timestamp`),
  CONSTRAINT `task->group.id()` FOREIGN KEY (`group_id`) REFERENCES `group_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;

INSERT INTO `tasks` (`id`, `group_id`, `name`, `description`, `time`, `duration`, `location`, `creation_timestamp`, `finished`, `badge_id`)
VALUES
	(5,16,'TestTask',NULL,NULL,0,NULL,'2014-07-30 14:13:42',0,NULL);

/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_data`;

CREATE TABLE `user_data` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user_data` WRITE;
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;

INSERT INTO `user_data` (`username`, `id`, `firstName`, `lastName`, `city`, `homePhone`, `cellPhone`, `email`, `picture`, `insertion_date`)
VALUES
	('Root',1,'','',NULL,NULL,NULL,NULL,NULL,'2014-07-09 16:41:51'),
	('Visitor',7,'Client','Device',NULL,NULL,NULL,NULL,NULL,'2014-07-18 12:12:54'),
	('User',8,'Demo','ofUser',NULL,NULL,NULL,NULL,NULL,'2014-07-18 12:14:26'),
	('Admin',12,'Demo','ofAdmin',NULL,NULL,NULL,NULL,NULL,'2014-07-24 10:38:34'),
	('TaskManagerDemo',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-29 16:17:31'),
	('taskUser',15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-01 12:23:02'),
	('BrokenTest',18,'first','last','houston','2818888208','1234567890','test@gmail.com',NULL,'2014-10-22 21:26:16');

/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
