-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2022 at 08:30 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_restautant`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bil_id` int(11) NOT NULL,
  `bil_address` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `bil_after_note` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bil_before_note` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bil_rate` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `del_id` int(11) DEFAULT NULL,
  `bil_regdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_name_en` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_regdate` date DEFAULT NULL,
  `cat_thumball` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_name`, `cat_name_en`, `cat_regdate`, `cat_thumball`, `cat_image`, `cat_id`) VALUES
('wazeer', 'abood', '2022-07-14', 'hgjhgjgj', 'ss', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL,
  `cus_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_pwd` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_mobile` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `cus_email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_regdate` datetime DEFAULT NULL,
  `cus_block` int(11) DEFAULT NULL,
  `cus_token` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `cus_address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_lan` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `cus_lat` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `cus_not` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_thumbnail` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `cus_image` varchar(250) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_pwd`, `cus_mobile`, `cus_email`, `cus_regdate`, `cus_block`, `cus_token`, `cus_address`, `cus_lan`, `cus_lat`, `cus_not`, `cus_thumbnail`, `cus_image`) VALUES
(1, 'wazeerabood', 'a', 'a', 'wazeer@gmail.com', NULL, NULL, 'ww', 'gadeer', 'dfsd', 'dds', 'dfsfsf', 'dsfs', NULL),
(2, 'rrr', '1111111', '1111111', 'rrrr@e', '2022-07-01 15:21:30', NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(3, 'wazeer', '123456', '123456', 'gdjghjf', '2022-07-12 16:35:14', 2132, 'gsdfgsg', 'fdsfdf', NULL, 'dsfsdf', 'fsdfsdf', 'gdfgdgdfg', 'wqeqeqe'),
(4, 'dd', 'dd', 'dd', 'dd', '2022-07-24 16:43:09', NULL, 'dd', 'dd', 'dd', 'dd', 'dd', 'dd', 'dd'),
(5, 'rrr', '1111111', '1111111', 'rrrr@e', '2022-07-01 15:21:30', NULL, 'gfjhgfhg', NULL, NULL, 'gjhgjhg', NULL, '', ''),
(6, 'rrr', '1111111', '1111111', 'rrrr@e', '2022-07-01 15:21:30', NULL, 'gfjhgfhg', NULL, NULL, 'gjhgjhg', NULL, '', ''),
(7, 'hgjhjh', 'hhhhhhhhh', 'jkjhk', 'hjhgjhg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hjghgjh', 'ghjgfhgf'),
(8, 'hgjhjh', 'hhhhhhhhh', 'jkjhk', 'hjhgjhg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hjghgjh', 'ghjgfhgf'),
(9, 'hgjhjh', 'hhhhhhhhh', 'jkjhk', 'hjhgjhg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hjghgjh', 'ghjgfhgf'),
(10, 'g', 'g', 'g', 'g', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'g', 'g'),
(11, 'wazzeer', 'wazeer', '1111111', 'ddddddd', '2022-07-01 18:05:49', NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(12, 'www', '1111111', '1111111', 'tttt', '2022-07-01 18:07:31', NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(13, 'eeeeeeee', 'eeeeeeee', '2222222', 'eeeeeeee', '2022-07-01 18:09:10', NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(14, 'hgjhgjhgj', '1111111', '1', 'hg', '2022-07-25 04:56:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `del_id` int(11) NOT NULL,
  `del_name` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `del_mobile` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `del_pwd` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `del_regdate` datetime DEFAULT NULL,
  `del_lastedate` datetime DEFAULT NULL,
  `del_thumbnail` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `del_image` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `del_note` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`del_id`, `del_name`, `del_mobile`, `del_pwd`, `del_regdate`, `del_lastedate`, `del_thumbnail`, `del_image`, `del_note`) VALUES
(4, 'tttttt', '2222321', 'ttuuu', '2022-07-02 06:12:44', NULL, '', '', 'tyrrg'),
(5, 'yuons', '221122', 'ttttttt', '2022-07-02 06:13:10', NULL, '', '', 'hhhhh');

-- --------------------------------------------------------

--
-- Table structure for table `detail_bill`
--

CREATE TABLE `detail_bill` (
  `det_id` int(11) NOT NULL,
  `foo_id` int(11) NOT NULL,
  `det_price` int(11) NOT NULL,
  `det_qty` int(11) NOT NULL,
  `bil_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `fav_id` int(11) NOT NULL,
  `foo_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `fav_regdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `foo_id` int(11) NOT NULL,
  `foo_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foo_name_en` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foo_regdate` datetime NOT NULL,
  `foo_image` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `food_thumbnail` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foo_price` int(11) NOT NULL,
  `foo_offer` int(11) NOT NULL,
  `foo_info` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foo_info_en` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`foo_id`, `foo_name`, `foo_name_en`, `foo_regdate`, `foo_image`, `food_thumbnail`, `foo_price`, `foo_offer`, `foo_info`, `foo_info_en`, `cat_id`) VALUES
(1, 'daseem', 'gfghfhgf', '2022-07-02 03:03:49', 'jkjhkjhkj', 'hgjhgjhgjh', 3000, 1213, 'jhjhgjhgj', 'uiyiuyiui', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `use_id` int(11) NOT NULL,
  `use_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_mobile` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `use_pwd` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_datetime` datetime DEFAULT NULL,
  `use_active` tinyint(1) DEFAULT 1,
  `use_token` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL,
  `use_lastdatetime` datetime DEFAULT NULL,
  `use_note` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`use_id`, `use_name`, `use_mobile`, `use_pwd`, `use_datetime`, `use_active`, `use_token`, `use_lastdatetime`, `use_note`) VALUES
(1, 'wazeer', '1', '1', '2022-07-20 05:29:25', 1, 'hjggh', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bil_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`del_id`);

--
-- Indexes for table `detail_bill`
--
ALTER TABLE `detail_bill`
  ADD PRIMARY KEY (`det_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`fav_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`foo_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`use_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bil_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `del_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detail_bill`
--
ALTER TABLE `detail_bill`
  MODIFY `det_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `foo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `use_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
