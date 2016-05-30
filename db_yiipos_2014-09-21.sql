# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.34)
# Database: db_yiipos
# Generation Time: 2557-09-21 09:35:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bill_sale
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bill_sale`;

CREATE TABLE `bill_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `bill_sale` WRITE;
/*!40000 ALTER TABLE `bill_sale` DISABLE KEYS */;

INSERT INTO `bill_sale` (`id`, `created_date`)
VALUES
	(4,'2014-09-21 16:25:56');

/*!40000 ALTER TABLE `bill_sale` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table bill_sale_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bill_sale_detail`;

CREATE TABLE `bill_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_get` double NOT NULL,
  `price_sale` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `bill_sale_detail` WRITE;
/*!40000 ALTER TABLE `bill_sale_detail` DISABLE KEYS */;

INSERT INTO `bill_sale_detail` (`id`, `bill_sale_id`, `product_id`, `price_get`, `price_sale`)
VALUES
	(4,4,6,60,80),
	(5,4,6,60,80),
	(6,4,6,60,80);

/*!40000 ALTER TABLE `bill_sale_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `tax_code` varchar(13) NOT NULL,
  `address` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;

INSERT INTO `company` (`id`, `name`, `tel`, `tax_code`, `address`)
VALUES
	(1,'ถาวร มินิมาร์ท 2','043223558','342345454234','80 moo 5');

/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price_get` double NOT NULL,
  `price_sale` double NOT NULL,
  `qty` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `barcode`, `name`, `price_get`, `price_sale`, `qty`)
VALUES
	(1,'1001','นมแลคตาซอย',12,16,100),
	(2,'1002','iPhone 5',17000,23000,20),
	(3,'1003','iPhone 6',18000,24900,50),
	(4,'1004','Mac Pro',39000,49000,10),
	(6,'1006','เบียร์ลีโอ',60,80,30),
	(7,'1007','เบียร์ช้าง',75,90,30),
	(8,'1008','Yii Framework',200,300,50),
	(10,'1009','ปลั้กไฟ DATA',155,200,50),
	(11,'1010','กระดาษ Green iDea',450,550,100),
	(12,'1011','ไม้ปิงปอง Butterfly F3',350,400,20);

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
