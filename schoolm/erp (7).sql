-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2016 at 04:21 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `erp`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `admissionInsert`(IN `a` VARCHAR(30), IN `b` VARCHAR(30), IN `c` VARCHAR(30), IN `d` VARCHAR(30), IN `e` VARCHAR(30), IN `f` VARCHAR(30), IN `g` VARCHAR(30), IN `h` VARCHAR(30), IN `i` VARCHAR(30), IN `j` VARCHAR(30), IN `k` VARCHAR(30), IN `l` VARCHAR(30))
    NO SQL
BEGIN
INSERT INTO admission_tab(Admission_Date,Admission_Mode,Admission_No,Class,DOB,Father_Name,Last_Name,Middle_Name,Mother_Name,School,Student_Name,Year) VALUES (Adm_Date,Adm_Mode,Adm_No,_Class,_DOB,fa_name,la_name,Mi_name,Mo_Name,_School,_Student_Na,Year_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `admission_insert`(IN `Adm_No` VARCHAR(30), IN `_Student_Na` VARCHAR(30), IN `Mi_name` VARCHAR(30), IN `la_name` VARCHAR(30), IN `_DOB` VARCHAR(30), IN `fa_name` VARCHAR(30), IN `Mo_Name` VARCHAR(30), IN `Adm_Date` VARCHAR(30), IN `Adm_Mode` VARCHAR(30), IN `_School` VARCHAR(30), IN `_Class` VARCHAR(30), IN `Year_` VARCHAR(30))
    NO SQL
BEGIN
INSERT INTO admission_tab(Admission_No,Student_Name,Middle_Name,Last_Name,DOB,Father_Name,Mother_Name,Admission_Date,Admission_Mode,School,Class,Year) VALUES (Adm_No,_Student_Na,Mi_name,la_name,_DOB,fa_name,Mo_Name,Adm_Date,Adm_Mode,_School,_Class,Year_);

INSERT INTO personal_info (admission_no) VALUES
(Adm_No);
INSERT INTO contact_detail (admission_no) VALUES
(Adm_No);
INSERT INTO images (admission_no) VALUES
(Adm_No);
INSERT INTO education_detail (admission_no) VALUES
(Adm_No);
INSERT INTO welfare_tab (admission_no) VALUES
(Adm_No);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admission_tab`
--

CREATE TABLE IF NOT EXISTS `admission_tab` (
  `Admission_No` varchar(30) NOT NULL,
  `Student_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `DOB` varchar(30) NOT NULL,
  `Father_Name` varchar(70) NOT NULL,
  `Mother_Name` varchar(70) NOT NULL,
  `Admission_Date` varchar(30) NOT NULL,
  `Admission_Mode` varchar(30) NOT NULL,
  `School` varchar(30) NOT NULL,
  `Class` varchar(30) NOT NULL,
  `Year` varchar(30) NOT NULL,
  PRIMARY KEY (`Admission_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admission_tab`
--

INSERT INTO `admission_tab` (`Admission_No`, `Student_Name`, `Middle_Name`, `Last_Name`, `DOB`, `Father_Name`, `Mother_Name`, `Admission_Date`, `Admission_Mode`, `School`, `Class`, `Year`) VALUES
('855', 'rashmi', 'chandra', 'chandra', '2016-12-31', 'abc', 'ghi', '', 'Online', 'kv', 'nursery', '2015'),
('854', 'rashmi', 'chandra', 'chandra', '2016-12-31', 'abc', 'ghi', '', 'Online', 'kv', 'nursery', '2015'),
('853', 'rashmi', 'chandra', 'chandra', '2016-12-31', 'abc', 'ghi', '', 'Online', 'kv', 'nursery', '2015'),
('159', 'rashmi', '', '', '', 'abc', 'ghi', '', 'Online', '', 'nursery', '2015'),
('444', 'rashmi', '', '', '', 'abc', 'ghi', '', 'Online', '', 'nursery', '2015'),
('139', 'rashmi', 'chandra', 'chandra', '2016-07-12', 'abc', 'ghi', '', 'Online', 'army', 'nursery', '2015'),
('236', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('789', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('670', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('198', 'rashmi', '', '', '', 'abc', 'ghi', '', 'Online', '', 'nursery', '2015'),
('343', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('6789', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('67', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('49', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('990', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('87', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('89', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('6', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('29', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('19', 'rashmi', '', '', '', 'abc', 'ghi', '', 'Online', '', 'nursery', '2015'),
('18', 'rashmi', 'ram', 'ram', '2016-07-13', 'abc', 'ghi', '', 'Online', 'ram', 'nursery', '2015'),
('15', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('21', 'rashmi', 'ram', 'ram', '2016-07-13', 'abc', 'ghi', '', 'Online', 'ram', 'nursery', '2015'),
('12', 'rashmi', '', '', '', 'abc', 'ghi', '', 'Online', '', 'nursery', '2015'),
('10', 'rashmi', '', '', '', 'abc', 'ghi', '', 'Online', '', 'nursery', '2015'),
('78', 'rashmi', '', '', '', 'abc', 'ghi', '', 'Online', '', 'nursery', '2015'),
('7', 'rashmi', 'ram', '', '', 'abc', 'ghi', '', 'Online', '', 'nursery', '2015'),
('a2', 'rashmi', '', '', '', 'abc', 'ghi', '', 'Online', '', 'nursery', '2015'),
('5', 'rashmi', 'ram', 'ram', '', 'abc', 'ghi', '', 'Online', '', 'nursery', '2015'),
('4', 'rashmi', 'ram', 'ram', '2016-07-11', 'abc', 'ghi', '', 'Online', 'ram', 'nursery', '2015'),
('3', 'rashmi', 'ram', 'ram', '2016-07-11', 'abc', 'ghi', '', 'Online', 'ram', 'nursery', '2015'),
('2', 'rashmi', 'ram', 'ram', '2016-07-12', 'abc', 'ghi', '2016-07-12', 'Online', 'army', 'nursery', '2015'),
('1', 'rashmi', 'ram', 'ram', '2016-07-12', 'abc', 'ghi', '2016-07-13', 'Online', 'ram', 'nursery', '2015'),
('111', 'rashmi', 'bvbm', 'nghg', '12111996', 'hj', 'gf', '12/12/2015', 'Online', 'dfsd', 'nursery', '2015'),
('555', 'rashmi', 'bvbm', 'nghg', '12111996', 'hj', 'gf', '12/12/2015', 'Online', 'dfsd', 'nursery', '2015'),
('874', 'rashmi', 'bvbm', 'nghg', '12111996', 'hj', 'gf', '12/12/2015', 'Online', 'army', 'nursery', '2015'),
('123', 'rashmi', 'kh', 'bn', '', 'hj', 'gf', '2016-07-22', 'Online', 'army', 'Sixth', '2015'),
('100', 'rashmi', 'bvbm', 'nghg', '12111996', 'hj', 'gf', '12/12/2015', 'Online', 'army', 'nursery', '2015'),
('999', 'rashmi', '', '', '12111996', 'hj', 'gf', '', 'Online', 'army', 'nursery', '2015'),
('666', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('567', 'rashmi', '', '', '12111996', 'hj', 'gf', '', 'Online', 'army', 'nursery', '2015'),
('133', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('565', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('144', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('166', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('122', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('135', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('222', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('223', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('224', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('225', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('226', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('656', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('998', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('633', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('333', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('227', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('202', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('101', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('002', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('522', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('258', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('358', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('963', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('523', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('hhh', '', '', '', 'undefined', 'undefined', 'undefined', '', 'Online', 'undefined', 'nursery', '2015'),
('1631321', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('7896', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('0789', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('1631321erty', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('1631321ertygf', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('58566', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('58566*8*-8', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('+99597', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('654654', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('852852', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('9555', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('8962', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('895612', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('8962yr', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('4826512', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('481321656', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('456951', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('553', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('ghjk', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('653213', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('545mm', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('2465463', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('jhkj54', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('5543', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('54445m', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('jhku8o', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('uih98', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('jhlk5343', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('7895x,', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('hgk2', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('hvk', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('bjh54', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('kjhk54', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('khhk2', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('hbkjb', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('hgfhfghf', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('456', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('8909', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('8966', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('356', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('2103', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('6325', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('65', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('5624', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('646', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('546', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('5885', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('88565', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('88', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('8969', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('112', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('113', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('114', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('115', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('116', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('117', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('118', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('119', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('120', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('121', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('cat', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('bat', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('jj', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('nb5v6', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('876', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('5555', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('+5+974', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('588', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('knjjj', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('wer', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('rtty', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('411', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('des', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('op', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('trd', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('yh', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('thj', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('5r', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('57', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('fer', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('45', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('tg', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('rf', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('hj', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('ui', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('6y', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('klj', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('678', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('890', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('ty', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('98', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('3e', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('abc', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('22', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('23', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('24', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('25', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('26', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('27', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('28', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('30', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('290', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('res', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('jk', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('55', 'rashmi', 'ggd', 'hfhj', '12111996', 'hj', 'gf', '12052013', 'Online', 'army', 'nursery', '2015'),
('ghi', 'rashmi', 'kbk', 'bb', 'nn', '', 'gg', '12/06/2013', 'Online', '', 'nursery', '2015'),
('dd', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('rr', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('mayank', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015'),
('h', '', '', '', '', '', '', '', 'Online', '', 'nursery', '2015');

-- --------------------------------------------------------

--
-- Table structure for table `caste_tab`
--

CREATE TABLE IF NOT EXISTS `caste_tab` (
  `caste_id` int(11) NOT NULL AUTO_INCREMENT,
  `caste_name` varchar(50) NOT NULL,
  PRIMARY KEY (`caste_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `caste_table`
--

CREATE TABLE IF NOT EXISTS `caste_table` (
  `caste_id` int(30) NOT NULL AUTO_INCREMENT,
  `caste_name` varchar(30) NOT NULL,
  PRIMARY KEY (`caste_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `caste_table`
--

INSERT INTO `caste_table` (`caste_id`, `caste_name`) VALUES
(1, 'christian'),
(2, 'ftt');

-- --------------------------------------------------------

--
-- Table structure for table `category_tab`
--

CREATE TABLE IF NOT EXISTS `category_tab` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city_tab`
--

CREATE TABLE IF NOT EXISTS `city_tab` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city_table`
--

CREATE TABLE IF NOT EXISTS `city_table` (
  `city_id` int(30) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(30) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `city_table`
--

INSERT INTO `city_table` (`city_id`, `city_name`) VALUES
(1, 'mohenjodaro'),
(2, 'SADHADISHA');

-- --------------------------------------------------------

--
-- Table structure for table `class_tab`
--

CREATE TABLE IF NOT EXISTS `class_tab` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `class_tab`
--

INSERT INTO `class_tab` (`class_id`, `class_name`) VALUES
(1, 'Nursery'),
(2, 'L.K.G');

-- --------------------------------------------------------

--
-- Table structure for table `contact_detail`
--

CREATE TABLE IF NOT EXISTS `contact_detail` (
  `admission_no` varchar(50) NOT NULL,
  `std_address1` varchar(50) NOT NULL,
  `std_address2` varchar(50) DEFAULT NULL,
  `std_pincode` int(11) NOT NULL,
  `std_city` varchar(50) NOT NULL,
  `std_email` varchar(50) DEFAULT NULL,
  `std_mobileno` int(11) DEFAULT NULL,
  `guardian_name` varchar(50) NOT NULL,
  `guardian_occupation` varchar(50) NOT NULL,
  `guardian_contactno` int(11) DEFAULT NULL,
  `guardian_mobileno` int(11) NOT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `guardian_email` varchar(50) DEFAULT NULL,
  `std_paddress1` varchar(50) DEFAULT NULL,
  `std_paddress2` varchar(50) DEFAULT NULL,
  `p_pincode` int(11) DEFAULT NULL,
  `p_city` varchar(50) DEFAULT NULL,
  `p_contactno` int(11) DEFAULT NULL,
  `p_email` varchar(50) DEFAULT NULL,
  `p_mobileno` int(11) DEFAULT NULL,
  `emergency_pname` varchar(50) DEFAULT NULL,
  `emergency_contactno` int(11) DEFAULT NULL,
  `emergency_mobile` int(11) DEFAULT NULL,
  PRIMARY KEY (`admission_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_detail`
--

INSERT INTO `contact_detail` (`admission_no`, `std_address1`, `std_address2`, `std_pincode`, `std_city`, `std_email`, `std_mobileno`, `guardian_name`, `guardian_occupation`, `guardian_contactno`, `guardian_mobileno`, `religion`, `guardian_email`, `std_paddress1`, `std_paddress2`, `p_pincode`, `p_city`, `p_contactno`, `p_email`, `p_mobileno`, `emergency_pname`, `emergency_contactno`, `emergency_mobile`) VALUES
('+5+974', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('+99597', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('002', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('0789', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('100', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('101', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('111', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('112', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('113', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('114', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('115', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('116', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('117', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('118', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('119', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('120', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('121', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('122', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('123', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('133', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('135', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('144', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1631321', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1631321erty', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1631321ertygf', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('166', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('202', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2103', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('22', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('222', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('223', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('224', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('225', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('226', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('227', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('23', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('24', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2465463', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('25', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('258', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('26', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('27', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('28', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('290', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('30', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('333', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('356', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('358', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('3e', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('411', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('45', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('456', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('456951', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('481321656', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('4826512', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('522', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('523', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('54445m', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('545mm', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('546', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('55', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('553', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5543', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('555', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5555', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5624', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('565', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('567', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('57', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('58566', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('58566*8*-8', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('588', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5885', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5r', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6325', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('633', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('646', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('65', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('653213', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('654654', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('656', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('666', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('678', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6y', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('7895x,', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('7896', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('852852', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('874', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('876', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('88', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('88565', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('890', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8909', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('895612', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8962', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8962yr', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8966', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8969', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('9555', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('963', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('98', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('998', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('999', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('abc', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('bat', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('bjh54', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('cat', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('dd', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('des', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('fer', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ghi', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ghjk', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('h', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hbkjb', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hgfhfghf', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hgk2', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hhh', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hj', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hvk', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jhkj54', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jhku8o', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jhlk5343', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jj', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jk', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('khhk2', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('kjhk54', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('klj', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('knjjj', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('mayank', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('nb5v6', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('op', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('res', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('rf', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('rr', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('rtty', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('tg', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('thj', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('trd', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ty', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ui', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('uih98', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('wer', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('yh', '', NULL, 0, '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country_tab`
--

CREATE TABLE IF NOT EXISTS `country_tab` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE IF NOT EXISTS `data` (
  `pkey` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_tab`
--

CREATE TABLE IF NOT EXISTS `document_tab` (
  `admission_no` varchar(50) NOT NULL,
  `document_name` varchar(50) NOT NULL,
  `photo` blob NOT NULL,
  PRIMARY KEY (`admission_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `education_detail`
--

CREATE TABLE IF NOT EXISTS `education_detail` (
  `admission_no` varchar(50) NOT NULL,
  `specific_detail` varchar(50) DEFAULT NULL,
  `sno_class` varchar(50) DEFAULT NULL,
  `school_name` varchar(50) DEFAULT NULL,
  `board` varchar(50) DEFAULT NULL,
  `stream` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  PRIMARY KEY (`admission_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `education_detail`
--

INSERT INTO `education_detail` (`admission_no`, `specific_detail`, `sno_class`, `school_name`, `board`, `stream`, `year`, `percentage`) VALUES
('+5+974', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('+99597', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('002', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('0789', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('101', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('112', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('113', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('114', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('115', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('116', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('117', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('118', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('119', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('120', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('121', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1631321', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1631321erty', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1631321ertygf', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('202', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2103', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('22', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('227', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('23', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('24', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2465463', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('25', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('258', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('26', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('27', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('28', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('290', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('30', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('333', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('356', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('358', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('3e', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('411', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('45', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('456', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('456951', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('481321656', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('4826512', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('522', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('523', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('54445m', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('545mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('546', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('55', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('553', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5543', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5555', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5624', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('57', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('58566', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('58566*8*-8', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('588', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5885', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5r', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6325', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('633', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('646', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('65', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('653213', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('654654', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('656', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('678', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6y', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('7895x,', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('7896', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('852852', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('876', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('88', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('88565', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('890', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8909', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('895612', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8962', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8962yr', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8966', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8969', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('9555', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('963', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('98', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('998', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('abc', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('bat', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('bjh54', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('cat', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('dd', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('des', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('fer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ghi', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ghjk', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('h', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hbkjb', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hgfhfghf', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hgk2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hhh', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hj', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hvk', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jhkj54', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jhku8o', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jhlk5343', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jj', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jk', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('khhk2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('kjhk54', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('klj', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('knjjj', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('mayank', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('nb5v6', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('op', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('res', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('rf', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('rr', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('rtty', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('tg', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('thj', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('trd', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ty', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ui', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('uih98', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('wer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('yh', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_tab`
--

CREATE TABLE IF NOT EXISTS `enquiry_tab` (
  `enquiry_id` varchar(50) NOT NULL,
  `std_name` varchar(50) NOT NULL,
  `std_dob` varchar(50) NOT NULL,
  `std_fname` varchar(50) NOT NULL,
  `std_foccupation` varchar(50) NOT NULL,
  `std_mname` varchar(50) NOT NULL,
  `std_address` varchar(50) NOT NULL,
  `std_city` int(11) NOT NULL,
  `std_gender` varchar(50) NOT NULL,
  `std_email` varchar(50) DEFAULT NULL,
  `std_class` int(11) NOT NULL,
  `std_school` varchar(50) DEFAULT NULL,
  `std_parents` varchar(50) NOT NULL,
  `std_mobile` int(11) DEFAULT NULL,
  `std_landline` int(11) DEFAULT NULL,
  `std_alternateno` int(11) DEFAULT NULL,
  `std_category` int(11) NOT NULL,
  `std_fincome` varchar(50) NOT NULL,
  `std_admissionmode` varchar(50) DEFAULT NULL,
  `std_admissionplace` varchar(50) DEFAULT NULL,
  `std_remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enquiry_id`),
  KEY `std_city` (`std_city`),
  KEY `std_class` (`std_class`),
  KEY `std_category` (`std_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry_tab`
--

INSERT INTO `enquiry_tab` (`enquiry_id`, `std_name`, `std_dob`, `std_fname`, `std_foccupation`, `std_mname`, `std_address`, `std_city`, `std_gender`, `std_email`, `std_class`, `std_school`, `std_parents`, `std_mobile`, `std_landline`, `std_alternateno`, `std_category`, `std_fincome`, `std_admissionmode`, `std_admissionplace`, `std_remark`) VALUES
('101', 'rashmi', '12111996', 'hj', 'dd', 'gf', 'ttt', 1, 'Female', 'dsfsfd', 2, 'army', 'dw', 123, 44, 44, -1, '45625', 'Online', 'mtr', 'fx'),
('121', 'saumya', '12031996', 'hj', 'dd', 'gf', 'ttt', 1, 'Female', 'dsfsfd', 2, 'army', 'dw', 123, 44, 44, -1, '45625', 'Online', 'mtr', 'fx'),
('126', 'saumya', '12031995', 'ad', 'sd', 'gggg', 'hcj', 2, 'Female', 'tydyt', 1, 'ffy', 'fh', 123, 44, 11, -1, '45625', 'Offline', 'mtr', 'gyg'),
('155', 'cvcx', '12111996', 'ad', 'ggg', 'gf', 'nv', 2, 'Female', 'rrr', 1, 'dfsd', 'ddg', 11, 456, 44, -1, '11', 'Online', 'ftg', 'jvn');

-- --------------------------------------------------------

--
-- Table structure for table `firstlogin`
--

CREATE TABLE IF NOT EXISTS `firstlogin` (
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `house_tab`
--

CREATE TABLE IF NOT EXISTS `house_tab` (
  `house_id` int(11) NOT NULL,
  `house_name` varchar(50) NOT NULL,
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `admission_no` varchar(50) NOT NULL,
  `std_photo` varchar(50) DEFAULT NULL,
  `std_thumb` varchar(50) DEFAULT NULL,
  `std_sign` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admission_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`admission_no`, `std_photo`, `std_thumb`, `std_sign`) VALUES
('+5+974', NULL, NULL, NULL),
('+99597', NULL, NULL, NULL),
('002', NULL, NULL, NULL),
('0789', NULL, NULL, NULL),
('100', 'F:/photo/fileUploads/photo1/', 'F:/thumb/fileUploads/thumb1/', NULL),
('101', NULL, NULL, NULL),
('112', NULL, NULL, NULL),
('113', NULL, NULL, NULL),
('114', NULL, NULL, NULL),
('115', NULL, NULL, NULL),
('116', NULL, NULL, NULL),
('117', NULL, NULL, NULL),
('118', NULL, NULL, NULL),
('119', NULL, NULL, NULL),
('120', NULL, NULL, NULL),
('121', NULL, NULL, NULL),
('122', NULL, NULL, NULL),
('123', 'F:/photo/fileUploads/photo1/', 'F:/thumb/fileUploads/thumb1/', 'F:/sign/fileUploads/sign1/'),
('133', NULL, NULL, NULL),
('135', NULL, NULL, NULL),
('144', NULL, NULL, NULL),
('1631321', NULL, NULL, NULL),
('1631321erty', NULL, NULL, NULL),
('1631321ertygf', NULL, NULL, NULL),
('166', NULL, NULL, NULL),
('202', NULL, NULL, NULL),
('2103', NULL, NULL, NULL),
('22', NULL, NULL, NULL),
('222', NULL, NULL, NULL),
('223', NULL, NULL, NULL),
('224', NULL, NULL, NULL),
('225', NULL, NULL, NULL),
('226', NULL, NULL, NULL),
('227', NULL, NULL, NULL),
('23', NULL, NULL, NULL),
('24', NULL, NULL, NULL),
('2465463', NULL, NULL, NULL),
('25', NULL, NULL, NULL),
('258', NULL, NULL, NULL),
('26', NULL, NULL, NULL),
('27', NULL, NULL, NULL),
('28', NULL, NULL, NULL),
('290', NULL, NULL, NULL),
('30', NULL, NULL, NULL),
('333', NULL, NULL, NULL),
('356', NULL, NULL, NULL),
('358', NULL, NULL, NULL),
('3e', NULL, NULL, NULL),
('411', NULL, NULL, NULL),
('45', NULL, NULL, NULL),
('456', NULL, NULL, NULL),
('456951', NULL, NULL, NULL),
('481321656', NULL, NULL, NULL),
('4826512', NULL, NULL, NULL),
('522', NULL, NULL, NULL),
('523', NULL, NULL, NULL),
('54445m', NULL, NULL, NULL),
('545mm', NULL, NULL, NULL),
('546', NULL, NULL, NULL),
('55', NULL, NULL, NULL),
('553', NULL, NULL, NULL),
('5543', NULL, NULL, NULL),
('555', NULL, NULL, NULL),
('5555', NULL, NULL, NULL),
('5624', NULL, NULL, NULL),
('565', NULL, NULL, NULL),
('567', NULL, NULL, NULL),
('57', NULL, NULL, NULL),
('58566', NULL, NULL, NULL),
('58566*8*-8', NULL, NULL, NULL),
('588', NULL, NULL, NULL),
('5885', NULL, NULL, NULL),
('5r', NULL, NULL, NULL),
('6325', NULL, NULL, NULL),
('633', NULL, NULL, NULL),
('646', NULL, NULL, NULL),
('65', NULL, NULL, NULL),
('653213', NULL, NULL, NULL),
('654654', NULL, NULL, NULL),
('656', NULL, NULL, NULL),
('666', NULL, NULL, NULL),
('678', NULL, NULL, NULL),
('6y', NULL, NULL, NULL),
('7895x,', NULL, NULL, NULL),
('7896', NULL, NULL, NULL),
('852852', NULL, NULL, NULL),
('874', 'F:/photo/fileUploads/photo1/', NULL, NULL),
('876', NULL, NULL, NULL),
('88', NULL, NULL, NULL),
('88565', NULL, NULL, NULL),
('890', NULL, NULL, NULL),
('8909', NULL, NULL, NULL),
('895612', NULL, NULL, NULL),
('8962', NULL, NULL, NULL),
('8962yr', NULL, NULL, NULL),
('8966', NULL, NULL, NULL),
('8969', NULL, NULL, NULL),
('9555', NULL, NULL, NULL),
('963', NULL, NULL, NULL),
('98', NULL, NULL, NULL),
('998', NULL, NULL, NULL),
('999', 'F:/photo/fileUploads/photo1/', NULL, NULL),
('abc', NULL, NULL, NULL),
('bat', NULL, NULL, NULL),
('bjh54', NULL, NULL, NULL),
('cat', NULL, NULL, NULL),
('dd', NULL, NULL, NULL),
('des', NULL, NULL, NULL),
('fer', NULL, NULL, NULL),
('ghi', NULL, NULL, NULL),
('ghjk', NULL, NULL, NULL),
('h', NULL, NULL, NULL),
('hbkjb', NULL, NULL, NULL),
('hgfhfghf', NULL, NULL, NULL),
('hgk2', NULL, NULL, NULL),
('hhh', NULL, NULL, NULL),
('hj', NULL, NULL, NULL),
('hvk', NULL, NULL, NULL),
('jhkj54', NULL, NULL, NULL),
('jhku8o', NULL, NULL, NULL),
('jhlk5343', NULL, NULL, NULL),
('jj', NULL, NULL, NULL),
('jk', NULL, NULL, NULL),
('khhk2', NULL, NULL, NULL),
('kjhk54', NULL, NULL, NULL),
('klj', NULL, NULL, NULL),
('knjjj', NULL, NULL, NULL),
('mayank', NULL, NULL, NULL),
('nb5v6', NULL, NULL, NULL),
('op', NULL, NULL, NULL),
('res', NULL, NULL, NULL),
('rf', NULL, NULL, NULL),
('rr', NULL, NULL, NULL),
('rtty', NULL, NULL, NULL),
('tg', NULL, NULL, NULL),
('thj', NULL, NULL, NULL),
('trd', NULL, NULL, NULL),
('ty', NULL, NULL, NULL),
('ui', NULL, NULL, NULL),
('uih98', NULL, NULL, NULL),
('wer', NULL, NULL, NULL),
('yh', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `pass` varchar(50) NOT NULL,
  PRIMARY KEY (`pass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`pass`) VALUES
('abc');

-- --------------------------------------------------------

--
-- Table structure for table `personal_info`
--

CREATE TABLE IF NOT EXISTS `personal_info` (
  `admission_no` varchar(50) NOT NULL,
  `std_rollno` varchar(50) DEFAULT NULL,
  `std_enrollno` varchar(50) DEFAULT NULL,
  `std_dob` varchar(50) NOT NULL,
  `std_gender` varchar(50) NOT NULL,
  `std_foccupation` varchar(50) NOT NULL,
  `std_parentinm` varchar(50) NOT NULL,
  `std_income` int(11) NOT NULL,
  `std_mname` varchar(50) NOT NULL,
  `std_moccupation` varchar(50) NOT NULL,
  `std_caste` varchar(50) NOT NULL,
  `std_type` varchar(50) NOT NULL,
  `std_photo` blob,
  `std_sign` blob,
  `std_nationality` varchar(50) NOT NULL,
  `std_thumb` blob,
  `std_blood` varchar(10) DEFAULT NULL,
  `std_height` float DEFAULT NULL,
  `std_weight` int(11) DEFAULT NULL,
  `std_disability` varchar(50) DEFAULT NULL,
  `std_vision` int(11) DEFAULT NULL,
  `std_hobbies` varchar(50) DEFAULT NULL,
  `std_state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`admission_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal_info`
--

INSERT INTO `personal_info` (`admission_no`, `std_rollno`, `std_enrollno`, `std_dob`, `std_gender`, `std_foccupation`, `std_parentinm`, `std_income`, `std_mname`, `std_moccupation`, `std_caste`, `std_type`, `std_photo`, `std_sign`, `std_nationality`, `std_thumb`, `std_blood`, `std_height`, `std_weight`, `std_disability`, `std_vision`, `std_hobbies`, `std_state`) VALUES
('+5+974', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('+99597', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('002', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('0789', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('100', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('101', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('111', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('112', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('113', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('114', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('115', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('116', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('117', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('118', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('119', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('120', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('121', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('122', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('123', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('133', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('135', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('144', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1631321', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1631321erty', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1631321ertygf', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('166', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('202', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2103', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('22', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('222', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('223', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('224', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('225', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('226', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('227', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('23', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('24', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2465463', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('25', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('258', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('26', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('27', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('28', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('290', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('30', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('333', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('356', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('358', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('3e', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('411', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('45', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('456', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('456951', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('481321656', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('4826512', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('522', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('523', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('54445m', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('545mm', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('546', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('55', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('553', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5543', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('555', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5555', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5624', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('565', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('567', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('57', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('58566', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('58566*8*-8', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('588', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5885', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5r', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6325', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('633', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('646', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('65', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('653213', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('654654', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('656', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('666', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('678', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6y', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('7895x,', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('7896', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('852852', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('874', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('876', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('88', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('88565', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('890', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8909', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('895612', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8962', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8962yr', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8966', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8969', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('9555', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('963', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('98', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('998', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('999', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('abc', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('bat', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('bjh54', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('cat', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('dd', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('des', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('fer', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ghi', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ghjk', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('h', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hbkjb', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hgfhfghf', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hgk2', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hhh', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hj', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('hvk', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jhkj54', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jhku8o', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jhlk5343', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jj', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('jk', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('khhk2', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('kjhk54', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('klj', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('knjjj', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('mayank', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('nb5v6', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('op', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('res', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('rf', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('rr', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('rtty', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('tg', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('thj', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('trd', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ty', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ui', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('uih98', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('wer', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('yh', NULL, NULL, '', '', '', '', 0, '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `u_id` int(11) DEFAULT NULL,
  `u_name` varchar(30) NOT NULL,
  `u_pass` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`u_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `religion_tab`
--

CREATE TABLE IF NOT EXISTS `religion_tab` (
  `religion_id` int(11) NOT NULL,
  `religion_name` varchar(50) NOT NULL,
  PRIMARY KEY (`religion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `section_tab`
--

CREATE TABLE IF NOT EXISTS `section_tab` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `session_tab`
--

CREATE TABLE IF NOT EXISTS `session_tab` (
  `session_id` int(11) NOT NULL,
  `session_name` varchar(50) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stream_tab`
--

CREATE TABLE IF NOT EXISTS `stream_tab` (
  `stream_id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(50) NOT NULL,
  PRIMARY KEY (`stream_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stream_tab`
--

INSERT INTO `stream_tab` (`stream_id`, `stream_name`) VALUES
(1, 'SCIENCE'),
(2, 'COMMERCE'),
(3, 'HUMANITIES & ARTS');

-- --------------------------------------------------------

--
-- Table structure for table `subject_tab`
--

CREATE TABLE IF NOT EXISTS `subject_tab` (
  `subject_id` varchar(50) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `subject_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `welfare_tab`
--

CREATE TABLE IF NOT EXISTS `welfare_tab` (
  `admission_no` varchar(50) NOT NULL,
  `admission_type` varchar(50) DEFAULT NULL,
  `concession_name` varchar(50) DEFAULT NULL,
  `concession_by` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `approved_by` varchar(50) DEFAULT NULL,
  `approved_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admission_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `welfare_tab`
--

INSERT INTO `welfare_tab` (`admission_no`, `admission_type`, `concession_name`, `concession_by`, `remark`, `approved_by`, `approved_date`) VALUES
('+5+974', NULL, NULL, NULL, NULL, NULL, NULL),
('+99597', NULL, NULL, NULL, NULL, NULL, NULL),
('002', NULL, NULL, NULL, NULL, NULL, NULL),
('0789', NULL, NULL, NULL, NULL, NULL, NULL),
('101', NULL, NULL, NULL, NULL, NULL, NULL),
('112', NULL, NULL, NULL, NULL, NULL, NULL),
('113', NULL, NULL, NULL, NULL, NULL, NULL),
('114', NULL, NULL, NULL, NULL, NULL, NULL),
('115', NULL, NULL, NULL, NULL, NULL, NULL),
('116', NULL, NULL, NULL, NULL, NULL, NULL),
('117', NULL, NULL, NULL, NULL, NULL, NULL),
('118', NULL, NULL, NULL, NULL, NULL, NULL),
('119', NULL, NULL, NULL, NULL, NULL, NULL),
('120', NULL, NULL, NULL, NULL, NULL, NULL),
('121', NULL, NULL, NULL, NULL, NULL, NULL),
('1631321', NULL, NULL, NULL, NULL, NULL, NULL),
('1631321erty', NULL, NULL, NULL, NULL, NULL, NULL),
('1631321ertygf', NULL, NULL, NULL, NULL, NULL, NULL),
('202', NULL, NULL, NULL, NULL, NULL, NULL),
('2103', NULL, NULL, NULL, NULL, NULL, NULL),
('22', NULL, NULL, NULL, NULL, NULL, NULL),
('227', NULL, NULL, NULL, NULL, NULL, NULL),
('23', NULL, NULL, NULL, NULL, NULL, NULL),
('24', NULL, NULL, NULL, NULL, NULL, NULL),
('2465463', NULL, NULL, NULL, NULL, NULL, NULL),
('25', NULL, NULL, NULL, NULL, NULL, NULL),
('258', NULL, NULL, NULL, NULL, NULL, NULL),
('26', NULL, NULL, NULL, NULL, NULL, NULL),
('27', NULL, NULL, NULL, NULL, NULL, NULL),
('28', NULL, NULL, NULL, NULL, NULL, NULL),
('290', NULL, NULL, NULL, NULL, NULL, NULL),
('30', NULL, NULL, NULL, NULL, NULL, NULL),
('333', NULL, NULL, NULL, NULL, NULL, NULL),
('356', NULL, NULL, NULL, NULL, NULL, NULL),
('358', NULL, NULL, NULL, NULL, NULL, NULL),
('3e', NULL, NULL, NULL, NULL, NULL, NULL),
('411', NULL, NULL, NULL, NULL, NULL, NULL),
('45', NULL, NULL, NULL, NULL, NULL, NULL),
('456', NULL, NULL, NULL, NULL, NULL, NULL),
('456951', NULL, NULL, NULL, NULL, NULL, NULL),
('481321656', NULL, NULL, NULL, NULL, NULL, NULL),
('4826512', NULL, NULL, NULL, NULL, NULL, NULL),
('522', NULL, NULL, NULL, NULL, NULL, NULL),
('523', NULL, NULL, NULL, NULL, NULL, NULL),
('54445m', NULL, NULL, NULL, NULL, NULL, NULL),
('545mm', NULL, NULL, NULL, NULL, NULL, NULL),
('546', NULL, NULL, NULL, NULL, NULL, NULL),
('55', NULL, NULL, NULL, NULL, NULL, NULL),
('553', NULL, NULL, NULL, NULL, NULL, NULL),
('5543', NULL, NULL, NULL, NULL, NULL, NULL),
('5555', NULL, NULL, NULL, NULL, NULL, NULL),
('5624', NULL, NULL, NULL, NULL, NULL, NULL),
('57', NULL, NULL, NULL, NULL, NULL, NULL),
('58566', NULL, NULL, NULL, NULL, NULL, NULL),
('58566*8*-8', NULL, NULL, NULL, NULL, NULL, NULL),
('588', NULL, NULL, NULL, NULL, NULL, NULL),
('5885', NULL, NULL, NULL, NULL, NULL, NULL),
('5r', NULL, NULL, NULL, NULL, NULL, NULL),
('6325', NULL, NULL, NULL, NULL, NULL, NULL),
('633', NULL, NULL, NULL, NULL, NULL, NULL),
('646', NULL, NULL, NULL, NULL, NULL, NULL),
('65', NULL, NULL, NULL, NULL, NULL, NULL),
('653213', NULL, NULL, NULL, NULL, NULL, NULL),
('654654', NULL, NULL, NULL, NULL, NULL, NULL),
('656', NULL, NULL, NULL, NULL, NULL, NULL),
('678', NULL, NULL, NULL, NULL, NULL, NULL),
('6y', NULL, NULL, NULL, NULL, NULL, NULL),
('7895x,', NULL, NULL, NULL, NULL, NULL, NULL),
('7896', NULL, NULL, NULL, NULL, NULL, NULL),
('852852', NULL, NULL, NULL, NULL, NULL, NULL),
('876', NULL, NULL, NULL, NULL, NULL, NULL),
('88', NULL, NULL, NULL, NULL, NULL, NULL),
('88565', NULL, NULL, NULL, NULL, NULL, NULL),
('890', NULL, NULL, NULL, NULL, NULL, NULL),
('8909', NULL, NULL, NULL, NULL, NULL, NULL),
('895612', NULL, NULL, NULL, NULL, NULL, NULL),
('8962', NULL, NULL, NULL, NULL, NULL, NULL),
('8962yr', NULL, NULL, NULL, NULL, NULL, NULL),
('8966', NULL, NULL, NULL, NULL, NULL, NULL),
('8969', NULL, NULL, NULL, NULL, NULL, NULL),
('9555', NULL, NULL, NULL, NULL, NULL, NULL),
('963', NULL, NULL, NULL, NULL, NULL, NULL),
('98', NULL, NULL, NULL, NULL, NULL, NULL),
('998', NULL, NULL, NULL, NULL, NULL, NULL),
('abc', NULL, NULL, NULL, NULL, NULL, NULL),
('bat', NULL, NULL, NULL, NULL, NULL, NULL),
('bjh54', NULL, NULL, NULL, NULL, NULL, NULL),
('cat', NULL, NULL, NULL, NULL, NULL, NULL),
('dd', NULL, NULL, NULL, NULL, NULL, NULL),
('des', NULL, NULL, NULL, NULL, NULL, NULL),
('fer', NULL, NULL, NULL, NULL, NULL, NULL),
('ghi', NULL, NULL, NULL, NULL, NULL, NULL),
('ghjk', NULL, NULL, NULL, NULL, NULL, NULL),
('h', NULL, NULL, NULL, NULL, NULL, NULL),
('hbkjb', NULL, NULL, NULL, NULL, NULL, NULL),
('hgfhfghf', NULL, NULL, NULL, NULL, NULL, NULL),
('hgk2', NULL, NULL, NULL, NULL, NULL, NULL),
('hhh', NULL, NULL, NULL, NULL, NULL, NULL),
('hj', NULL, NULL, NULL, NULL, NULL, NULL),
('hvk', NULL, NULL, NULL, NULL, NULL, NULL),
('jhkj54', NULL, NULL, NULL, NULL, NULL, NULL),
('jhku8o', NULL, NULL, NULL, NULL, NULL, NULL),
('jhlk5343', NULL, NULL, NULL, NULL, NULL, NULL),
('jj', NULL, NULL, NULL, NULL, NULL, NULL),
('jk', NULL, NULL, NULL, NULL, NULL, NULL),
('khhk2', NULL, NULL, NULL, NULL, NULL, NULL),
('kjhk54', NULL, NULL, NULL, NULL, NULL, NULL),
('klj', NULL, NULL, NULL, NULL, NULL, NULL),
('knjjj', NULL, NULL, NULL, NULL, NULL, NULL),
('mayank', NULL, NULL, NULL, NULL, NULL, NULL),
('nb5v6', NULL, NULL, NULL, NULL, NULL, NULL),
('op', NULL, NULL, NULL, NULL, NULL, NULL),
('res', NULL, NULL, NULL, NULL, NULL, NULL),
('rf', NULL, NULL, NULL, NULL, NULL, NULL),
('rr', NULL, NULL, NULL, NULL, NULL, NULL),
('rtty', NULL, NULL, NULL, NULL, NULL, NULL),
('tg', NULL, NULL, NULL, NULL, NULL, NULL),
('thj', NULL, NULL, NULL, NULL, NULL, NULL),
('trd', NULL, NULL, NULL, NULL, NULL, NULL),
('ty', NULL, NULL, NULL, NULL, NULL, NULL),
('ui', NULL, NULL, NULL, NULL, NULL, NULL),
('uih98', NULL, NULL, NULL, NULL, NULL, NULL),
('wer', NULL, NULL, NULL, NULL, NULL, NULL),
('yh', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enquiry_tab`
--
ALTER TABLE `enquiry_tab`
  ADD CONSTRAINT `enquiry_tab_ibfk_1` FOREIGN KEY (`std_city`) REFERENCES `class_tab` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
