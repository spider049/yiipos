-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Sep 20, 2014 at 12:34 PM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_yiipos`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_sale`
--

CREATE TABLE `bill_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bill_sale_detail`
--

CREATE TABLE `bill_sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_get` double NOT NULL,
  `price_sale` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `tax_code` varchar(13) NOT NULL,
  `address` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `tel`, `tax_code`, `address`) VALUES
(1, 'ถาวร มินิมาร์ท 2', '043223558', '342345454234', '80 moo 5');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price_get` double NOT NULL,
  `price_sale` double NOT NULL,
  `qty` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `barcode`, `name`, `price_get`, `price_sale`, `qty`) VALUES
(1, '1001', 'นมแลคตาซอย', 12, 16, 100),
(2, '1002', 'iPhone 5', 17000, 23000, 20),
(3, '1003', 'iPhone 6', 18000, 24900, 50),
(4, '1004', 'Mac Pro', 39000, 49000, 10),
(5, '1005', 'น้ำคริสตัล', 8, 12, 100),
(6, '1006', 'เบียร์ลีโอ', 60, 80, 30),
(7, '1007', 'เบียร์ช้าง', 75, 90, 30);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
