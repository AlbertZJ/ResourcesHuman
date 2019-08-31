/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.1.49-community : Database - humanresources
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`humanresources` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `humanresources`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `department` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '工作部门种类',
  PRIMARY KEY (`id`),
  KEY `department` (`department`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `department` */

insert  into `department`(`id`,`department`) values (30,'军部'),(32,'医疗部'),(33,'后勤部'),(40,'外贸部'),(35,'外贸部长好'),(1,'技术部'),(31,'生活部'),(28,'行政部'),(2,'销售部'),(42,'飞行部');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `e_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `e_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '员工的姓名',
  `sex` enum('男','女') COLLATE utf8_unicode_ci NOT NULL COMMENT '性别',
  `age` int(20) NOT NULL COMMENT '年龄',
  `edu_background` enum('本科','硕士','博士','专科','其他') COLLATE utf8_unicode_ci NOT NULL COMMENT '学历',
  `speciality` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '专业',
  `foreign_language` enum('英语','法语','西班牙语','俄语','其他') COLLATE utf8_unicode_ci NOT NULL COMMENT '外语情况',
  `grad_time` date NOT NULL COMMENT '毕业时间',
  `marriage` enum('未婚','已婚') COLLATE utf8_unicode_ci NOT NULL COMMENT '婚姻状况',
  `post` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '工作岗位',
  `department` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '所在部门',
  `technical_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '职称',
  `state` enum('在职','辞职','转出','辞退','退休','休假') COLLATE utf8_unicode_ci NOT NULL COMMENT '状态',
  PRIMARY KEY (`e_id`),
  KEY `technical_title` (`technical_title`),
  KEY `department` (`department`),
  KEY `post` (`post`),
  KEY `speciality` (`speciality`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`speciality`) REFERENCES `think` (`speciality`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`department`) REFERENCES `department` (`department`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`technical_title`) REFERENCES `technical_title` (`technical_title`),
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`post`) REFERENCES `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee` */

insert  into `employee`(`e_id`,`e_name`,`sex`,`age`,`edu_background`,`speciality`,`foreign_language`,`grad_time`,`marriage`,`post`,`department`,`technical_title`,`state`) values (6,'刘强个','女',29,'本科','汉语言文学','法语','2019-06-14','已婚','前台','销售部','销售类','转出'),(13,'李刚','男',24,'专科','汉语言文学','英语','2019-06-08','已婚','前台','技术部','中级程序员','在职'),(19,'刘强','女',30,'博士','汉语言文学','法语','2019-08-10','未婚','后勤主任','后勤部','初级程序员','辞退'),(46,'刘欢','男',18,'本科','汉语言文学','法语','2019-08-02','未婚','前台','技术部','管理员','辞职'),(47,'刘强','男',18,'本科','汉语言文学','西班牙语','2019-08-02','未婚','生活委员','后勤部','管理员','辞退'),(48,'张建','女',18,'本科','汉语言文学','法语','2019-08-10','未婚','前台二','技术部','管理员','辞职');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `p_accounts` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员账号',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员姓名',
  PRIMARY KEY (`id`),
  KEY `p_accounts` (`p_accounts`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `manager` */

insert  into `manager`(`id`,`p_accounts`,`password`,`name`) values (1,'20161080','123456','李明'),(2,'20161081','qwer','李华'),(3,'20161082','123456','小红 '),(4,'20464083','123456','小张'),(6,'20161086','963852','小桃'),(8,'20161088','147852','小李');

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `post` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '工作岗位',
  PRIMARY KEY (`id`),
  KEY `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `post` */

insert  into `post`(`id`,`post`) values (42,'仓库管理员'),(48,'伙食'),(1,'前台'),(52,'前台二'),(53,'前台二'),(45,'后勤主任'),(58,'后勤主任'),(47,'室长'),(2,'开发'),(44,'护士'),(38,'护士长'),(46,'新闻发言人'),(56,'机长'),(3,'渔夫'),(43,'生活委员'),(41,'经理'),(50,'经理'),(57,'英语按顺序热少吃点'),(51,'行政管理'),(55,'行政管理'),(54,'队长');

/*Table structure for table `table_a` */

DROP TABLE IF EXISTS `table_a`;

CREATE TABLE `table_a` (
  `id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `table_a` */

insert  into `table_a`(`id`,`name`,`age`) values ('1','张三 ',20),('2','李四',21),('3','王五',19);

/*Table structure for table `table_b` */

DROP TABLE IF EXISTS `table_b`;

CREATE TABLE `table_b` (
  `id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `table_b` */

insert  into `table_b`(`id`,`course`,`level`) values ('1','eng',1),('1','ma',2),('2','ma',1);

/*Table structure for table `technical_title` */

DROP TABLE IF EXISTS `technical_title`;

CREATE TABLE `technical_title` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `technical_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '职称种类',
  PRIMARY KEY (`id`),
  KEY `technical_title` (`technical_title`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `technical_title` */

insert  into `technical_title`(`id`,`technical_title`) values (2,'中级程序员'),(1,'初级程序员'),(7,'后厨'),(5,'管理员'),(3,'销售类'),(9,'项目经理');

/*Table structure for table `think` */

DROP TABLE IF EXISTS `think`;

CREATE TABLE `think` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `speciality` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '专业种类',
  PRIMARY KEY (`id`),
  KEY `speciality` (`speciality`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `think` */

insert  into `think`(`id`,`speciality`) values (11,'俄语'),(9,'德语'),(3,'汉语言文学'),(6,'法语'),(5,'英语'),(2,'计算机科学与技术'),(1,'软件工程');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
