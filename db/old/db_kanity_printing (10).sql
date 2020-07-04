-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2020 at 01:49 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kanity_printing`
--

-- --------------------------------------------------------

--
-- Table structure for table `kp_acknowledgment_receipt`
--

CREATE TABLE `kp_acknowledgment_receipt` (
  `id` bigint(20) NOT NULL,
  `purchase_order_id` bigint(20) NOT NULL DEFAULT '0',
  `received_by` varchar(256) NOT NULL,
  `company_name` varchar(128) NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_date` date NOT NULL,
  `delivery_status` tinyint(2) NOT NULL DEFAULT '0',
  `particular` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `no` varchar(64) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_announcement`
--

CREATE TABLE `kp_announcement` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_announcement`
--

INSERT INTO `kp_announcement` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Our Transaction', 'There\'s no transaction on November 1, 2019 (Friday) in observance to All Saints\' Day.', 1, 1, 1, '0000-00-00 00:00:00', '2020-12-24 14:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `kp_base_stock`
--

CREATE TABLE `kp_base_stock` (
  `id` bigint(20) NOT NULL,
  `base_stock_category_id` bigint(20) NOT NULL DEFAULT '0',
  `base_stock_unit_id` bigint(20) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `max_stock` int(11) NOT NULL,
  `min_stock` int(11) NOT NULL,
  `current_stock` int(11) NOT NULL,
  `stock_status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_base_stock`
--

INSERT INTO `kp_base_stock` (`id`, `base_stock_category_id`, `base_stock_unit_id`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`, `name`, `description`, `max_stock`, `min_stock`, `current_stock`, `stock_status`) VALUES
(1, 2, 3, 1, 1, 1, '0000-00-00 00:00:00', '2020-03-01 09:07:30', '31', '23123', 112, 12, 10, 2),
(2, 1, 2, 1, 1, 1, '0000-00-00 00:00:00', '2020-03-01 09:07:31', 'Paper', 'test', 100, 20, 280, 3),
(3, 2, 3, 1, 1, 1, '0000-00-00 00:00:00', '2020-03-01 09:07:32', '312321', '123123', 23123, 23, 123212, 3),
(4, 3, 2, 1, 1, 1, '0000-00-00 00:00:00', '2020-03-01 09:07:34', 'dasdasd', 'wqeqwe', 23232, 123, 121, 2),
(5, 3, 2, 1, 1, 1, '0000-00-00 00:00:00', '2020-03-01 09:07:35', '23123123123', '232', 222, 22, 222, 1),
(6, 2, 2, 1, 1, 1, '0000-00-00 00:00:00', '2020-03-01 09:07:37', 'roel', '111', 11111, 11, 1111, 1),
(7, 2, 3, 1, 1, 1, '0000-00-00 00:00:00', '2020-03-01 09:07:39', 'asdasdasdasdsadsadasd', '111', 1111, 1, 11, 1),
(8, 2, 2, 1, 1, 1, '0000-00-00 00:00:00', '2020-03-01 09:07:41', 'qqq', 'qq', 1111, 111, 1, 2),
(9, 2, 2, 1, 1, 1, '2020-02-29 14:08:52', '2020-03-01 09:07:13', 'longcop', '11212', 1111, 11, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_base_stock_category`
--

CREATE TABLE `kp_base_stock_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_base_stock_category`
--

INSERT INTO `kp_base_stock_category` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'papers', 'papers', 1, 1, 1, '2020-02-29 12:42:25', '2020-02-29 12:42:25'),
(2, 'Coating', 'Coating', 1, 1, 1, '2020-02-29 12:42:38', '2020-02-29 12:42:38'),
(3, 'Materials', 'Materials', 1, 1, 1, '2020-02-29 12:42:48', '2020-02-29 12:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `kp_base_stock_issue`
--

CREATE TABLE `kp_base_stock_issue` (
  `id` bigint(20) NOT NULL,
  `base_stock_id` bigint(20) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_base_stock_issue`
--

INSERT INTO `kp_base_stock_issue` (`id`, `base_stock_id`, `user_id`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`, `quantity`) VALUES
(1, 1, 1, 1, 1, 1, '2020-02-29 13:34:15', '2020-02-29 13:34:15', 12),
(2, 1, 1, 1, 1, 1, '2020-02-29 13:37:42', '2020-02-29 13:37:42', 2),
(3, 2, 1, 1, 1, 1, '2020-02-29 13:40:54', '2020-02-29 13:40:54', 20),
(4, 3, 1, 1, 1, 1, '2020-02-29 13:42:58', '2020-02-29 13:42:58', 1),
(5, 4, 1, 1, 1, 1, '2020-02-29 13:44:45', '2020-02-29 13:44:45', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_base_stock_unit`
--

CREATE TABLE `kp_base_stock_unit` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_base_stock_unit`
--

INSERT INTO `kp_base_stock_unit` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sheeted / LooseLeaf', 'Sheeted / LooseLeaf', 1, 1, 1, '2020-02-29 12:43:12', '2020-02-29 12:43:12'),
(2, 'Packed (100 Pcs)', 'Packed (100 Pcs)', 1, 1, 1, '2020-02-29 12:43:28', '2020-02-29 12:43:28'),
(3, 'In Pcs', 'In Pcs', 1, 1, 1, '2020-02-29 12:43:47', '2020-02-29 12:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `kp_daily_output`
--

CREATE TABLE `kp_daily_output` (
  `id` bigint(20) NOT NULL,
  `job_order_id` bigint(20) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_dashboard_carousel`
--

CREATE TABLE `kp_dashboard_carousel` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `image` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_dashboard_carousel`
--

INSERT INTO `kp_dashboard_carousel` (`id`, `name`, `description`, `created_by`, `updated_by`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Reasonable Pricing', 'Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. ', 1, 1, 'uploads/dashboard-carousel/slider.jpg', 1, '0000-00-00 00:00:00', '2020-02-23 20:38:13'),
(2, 'Extra Ordinary Printing Experience', 'Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, 1, 'uploads/dashboard-carousel/slider1.jpg', 1, '0000-00-00 00:00:00', '2020-02-23 20:38:28'),
(3, 'Leverage Output', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', 1, 1, 'uploads/dashboard-carousel/gallery10.jpg', 9, '0000-00-00 00:00:00', '2020-02-23 20:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `kp_equipment`
--

CREATE TABLE `kp_equipment` (
  `id` bigint(20) NOT NULL,
  `equipment_category_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(256) NOT NULL,
  `tag_line` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_equipment`
--

INSERT INTO `kp_equipment` (`id`, `equipment_category_id`, `name`, `tag_line`, `description`, `created_by`, `updated_by`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Modern Design', 'Colorful design architecture', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.', 1, 1, 1, 'uploads/products/Service 1/img1.jpg', '0000-00-00 00:00:00', '2020-02-23 23:58:03'),
(2, 1, 'High Quality', 'Durable and complicated design', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.', 1, 1, 1, 'uploads/products/Service 1/img2.jpg', '0000-00-00 00:00:00', '2020-02-23 23:58:06'),
(3, 1, 'Mixed paper', 'Product with mixed design', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.', 1, 1, 1, 'uploads/products/Service 1/img3.jpg', '2020-02-24 05:05:08', '2020-02-23 23:58:08'),
(4, 2, 'test', 'test', 'test', 1, 1, 1, 'uploads/equipments/Printing/img1.jpg', '2020-02-24 08:13:53', '2020-02-24 08:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `kp_equipment_category`
--

CREATE TABLE `kp_equipment_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_equipment_category`
--

INSERT INTO `kp_equipment_category` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PLATE MAKING MACHINE', 'PLATE MAKING MACHINE', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-24 08:28:41'),
(2, 'OFFSET PRESS', 'OFFSET PRESS', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-24 08:28:59'),
(3, 'CUT Machine', 'CUT Machine', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-24 08:28:19'),
(4, 'Printing Machine', 'Printing Machine', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-24 08:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `kp_job_order`
--

CREATE TABLE `kp_job_order` (
  `id` bigint(20) NOT NULL,
  `purchase_order_id` bigint(20) NOT NULL DEFAULT '0',
  `jo_no` varchar(64) NOT NULL,
  `quantity` int(11) NOT NULL,
  `served_quantity` int(11) NOT NULL DEFAULT '0',
  `pending_quantity` int(11) NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `process_status` tinyint(2) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_log`
--

CREATE TABLE `kp_log` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `ref_id` bigint(20) NOT NULL DEFAULT '0',
  `request_data` text NOT NULL,
  `change_attribute` text NOT NULL,
  `method` varchar(32) NOT NULL,
  `url` text NOT NULL,
  `action` varchar(64) NOT NULL,
  `controller` varchar(64) NOT NULL,
  `model` varchar(64) NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `user_agent` text NOT NULL,
  `ip` varchar(32) NOT NULL,
  `browser` varchar(64) NOT NULL,
  `os` varchar(64) NOT NULL,
  `device` varchar(64) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_log`
--

INSERT INTO `kp_log` (`id`, `user_id`, `ref_id`, `request_data`, `change_attribute`, `method`, `url`, `action`, `controller`, `model`, `created_by`, `updated_by`, `user_agent`, `ip`, `browser`, `os`, `device`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 18, '{\"_csrf\":\"Ck1wu3ud3wv68TGDEAQFSJJqoWBVL73BA6oV4zseqhU4LjjkEMqHWs-jVtt3cW0nph2MWBFk-KQ2xCa6bFb1YA==\",\"User\":{\"role_id\":\"11\",\"username\":\"admin12345\",\"password\":\"admin12345\",\"password_confirm\":\"admin12345\",\"super_admin\":\"0\"}}', '{\"role_id\":null,\"username\":null,\"password\":null,\"super_admin\":null,\"status\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"authkey\":null,\"access_token\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/user/create', 'create', 'user', 'User', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-03-02 08:22:51', '2020-03-02 08:22:51'),
(2, 1, 8, '{\"_csrf\":\"IHLdCt7iszCSppMx3y-qOt4FW-hCpr6Ax5h_qOU-AScSEZVVtbXrYaf09Gm4WsJV6nJ20Abt--Xy9kzxsnZeUg==\",\"Profile\":{\"last_name\":\"Doe\",\"middle_name\":\"Bendita\",\"first_name\":\"John\",\"email\":\"johnadmin@gmail.com\",\"contact_number\":\"09876543\",\"tin\":\"876543\",\"company_name\":\"Filweb asia inc\",\"position\":\"CEO\",\"company_address\":\"Cavite carmona\",\"image_input\":\"\"}}', '{\"user_id\":null,\"last_name\":null,\"middle_name\":null,\"first_name\":null,\"email\":null,\"contact_number\":null,\"tin\":null,\"company_name\":null,\"position\":null,\"company_address\":null,\"status\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/user/create-profile/18', 'create-profile', 'user', 'Profile', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-03-02 08:23:41', '2020-03-02 08:23:41'),
(3, 1, 19, '{\"_csrf\":\"eARzoUGUSkeJv1_DbTrp3EdTDI5Hr8-MZA39tIF8vtpKZzv-KsMSFrztOJsKT4GzcyQhtgPkiulRY87t1jThrw==\",\"User\":{\"role_id\":\"10\",\"username\":\"finance123456\",\"password\":\"finance123456\",\"password_confirm\":\"finance123456\",\"super_admin\":\"0\"}}', '{\"role_id\":null,\"username\":null,\"password\":null,\"super_admin\":null,\"status\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"authkey\":null,\"access_token\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/user/create', 'create', 'user', 'User', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-03-02 08:24:13', '2020-03-02 08:24:13'),
(4, 1, 20, '{\"_csrf\":\"mGvDfjvgCwUP0-KlIfCd94wgZdEggHTJj8RprzuuzpiqCIshULdTVDqBhf1GhfWYuFdI6WTLMay6qlr2bOaR7Q==\",\"User\":{\"role_id\":\"12\",\"username\":\"marketing123456\",\"password\":\"marketing123456\",\"password_confirm\":\"marketing123456\",\"super_admin\":\"0\"}}', '{\"role_id\":null,\"username\":null,\"password\":null,\"super_admin\":null,\"status\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"authkey\":null,\"access_token\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/user/create', 'create', 'user', 'User', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-03-02 08:24:33', '2020-03-02 08:24:33'),
(5, 1, 21, '{\"_csrf\":\"yow311gDyzo7PGfpn6XvIe11KWqnAyUeTSXOJetCyt7473-IM1STaw5uALH40IdO2QIEUuNIYHt4S_18vAqVqw==\",\"User\":{\"role_id\":\"13\",\"username\":\"production123456\",\"password\":\"production123456\",\"password_confirm\":\"production123456\",\"super_admin\":\"0\"}}', '{\"role_id\":null,\"username\":null,\"password\":null,\"super_admin\":null,\"status\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"authkey\":null,\"access_token\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/user/create', 'create', 'user', 'User', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-03-02 08:24:51', '2020-03-02 08:24:51');

-- --------------------------------------------------------

--
-- Table structure for table `kp_mode_of_payment`
--

CREATE TABLE `kp_mode_of_payment` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_mode_of_payment`
--

INSERT INTO `kp_mode_of_payment` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash/Cheque On Delivery', 'Cash/Cheque On Delivery', 1, 1, 1, '2020-02-22 03:34:54', '2020-02-22 03:34:54'),
(2, 'Terms/Upon Completion of Delivery', 'Terms/Upon Completion of Delivery', 1, 1, 1, '2020-02-22 03:34:54', '2020-02-22 03:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `kp_notification`
--

CREATE TABLE `kp_notification` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `controller` varchar(64) NOT NULL,
  `action` varchar(64) NOT NULL,
  `ref_id` bigint(20) NOT NULL DEFAULT '0',
  `read_status` tinyint(2) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_official_receipt`
--

CREATE TABLE `kp_official_receipt` (
  `id` bigint(20) NOT NULL,
  `sales_invoice_id` bigint(20) NOT NULL DEFAULT '0',
  `no` varchar(128) NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `received_from` varchar(256) NOT NULL,
  `tin` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `business_style` varchar(256) NOT NULL,
  `sum_of` varchar(256) NOT NULL,
  `payment_for` varchar(256) NOT NULL,
  `cashier` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_portfolio`
--

CREATE TABLE `kp_portfolio` (
  `id` bigint(20) NOT NULL,
  `portfolio_category_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_portfolio`
--

INSERT INTO `kp_portfolio` (`id`, `portfolio_category_id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`, `image`) VALUES
(1, 1, 'Test', 'Description', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-21 12:13:14', 'uploads/portfolio/Category 1/alyana final.jpg'),
(2, 1, 'test', 'test', 1, 1, 1, '2020-02-24 07:29:39', '2020-02-24 07:29:39', 'uploads/portfolio/Web Design/aside.jpg'),
(3, 1, 'test', 'test', 1, 1, 1, '2020-02-24 07:29:59', '2020-02-24 07:29:59', 'uploads/portfolio/Web Design/pic2.jpg'),
(4, 2, 'test', 'test', 1, 1, 1, '2020-02-24 07:30:20', '2020-02-24 07:30:20', 'uploads/portfolio/Printing/post2.jpg'),
(5, 2, 'test', 'test', 1, 1, 1, '2020-02-24 07:30:34', '2020-02-24 07:30:34', 'uploads/portfolio/Printing/post1.jpg'),
(6, 3, 'test', 'test', 1, 1, 1, '2020-02-24 07:30:49', '2020-02-24 07:30:49', 'uploads/portfolio/Web Development/pic1.jpg'),
(7, 4, 'test', 'test', 1, 1, 1, '2020-02-24 07:31:04', '2020-02-24 07:31:04', 'uploads/portfolio/SEO Optimazation/image_r.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kp_portfolio_category`
--

CREATE TABLE `kp_portfolio_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_portfolio_category`
--

INSERT INTO `kp_portfolio_category` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Web Design', 'Category 1', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-24 07:28:02'),
(2, 'Printing', 'Printing', 1, 1, 1, '2020-02-24 07:28:20', '2020-02-24 07:28:20'),
(3, 'Web Development', 'Web Development', 1, 1, 1, '2020-02-24 07:28:32', '2020-02-24 07:28:32'),
(4, 'SEO Optimazation', 'SEO Optimazation', 1, 1, 1, '2020-02-24 07:28:50', '2020-02-24 07:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `kp_product`
--

CREATE TABLE `kp_product` (
  `id` bigint(20) NOT NULL,
  `service_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(256) NOT NULL,
  `tag_line` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_product`
--

INSERT INTO `kp_product` (`id`, `service_id`, `name`, `tag_line`, `description`, `created_by`, `updated_by`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Modern Design', 'Colorful design architecture', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.', 1, 1, 1, 'uploads/products/Service 1/img1.jpg', '0000-00-00 00:00:00', '2020-02-23 23:58:03'),
(2, 1, 'High Quality', 'Durable and complicated design', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.', 1, 1, 1, 'uploads/products/Service 1/img2.jpg', '0000-00-00 00:00:00', '2020-02-23 23:58:06'),
(3, 1, 'Mixed paper', 'Product with mixed design', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.', 1, 1, 1, 'uploads/products/Service 1/img3.jpg', '2020-02-24 05:05:08', '2020-02-23 23:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `kp_profile`
--

CREATE TABLE `kp_profile` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `first_name` varchar(128) NOT NULL,
  `middle_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `position` varchar(128) NOT NULL,
  `company_name` varchar(256) NOT NULL,
  `company_address` text NOT NULL,
  `tin` varchar(128) NOT NULL,
  `email` varchar(256) NOT NULL,
  `contact_number` varchar(32) NOT NULL,
  `image` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_profile`
--

INSERT INTO `kp_profile` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `position`, `company_name`, `company_address`, `tin`, `email`, `contact_number`, `image`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 11, 'roel', 'rivera', 'longcop', 'Web Developer', 'FAI', 'San Pedro', '836462182716', 'longcoproel@gmail.com', '09124435652', 'uploads/profile/Roel Longcop/DSC_8792.jpg', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-21 04:10:03'),
(2, 1, 'John', 'Hello There', 'Doe', 'CEO', 'Test Company', 'United States America', '83474383429', 'john@gmail.com', '0923842237', 'uploads/profile/John Doe/pewdiepie-a8.jpg', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-28 09:29:58'),
(3, 12, 'Jordan', 'maestro', 'logronio', 'web designer', 'Filweb asia inc', 'Maharlika Drive #23 Street Governors 34 Lot 2,  San Pedro Laguna', '738930382', 'jordan@gmail.com', '09289927482', '', 0, 1, 1, '0000-00-00 00:00:00', '2020-02-28 13:48:39'),
(4, 14, 'Annabelle', 'Baltazar', 'Gernale', 'DAta analyst', 'COA', 'Alabang', '8574563', 'abel@gmail.com', '094375739', '', 0, 0, 1, '2020-03-01 14:03:10', '2020-03-01 14:03:10'),
(5, 15, '123', '123', '3123', '23123', '312', '31', '3123', '123@e32.com', '321', '', 0, 0, 1, '2020-03-01 14:04:34', '2020-03-01 14:04:34'),
(6, 16, '12312', '123', '123', '123123', '123', '123', '3123', '312@eeqweqw.com', '312', '', 0, 0, 1, '2020-03-01 14:07:09', '2020-03-01 14:07:09'),
(7, 17, '312312', '12312', '3123', '23423', '3423', '423', '4234', '12312@efrewrew.com', '4', '', 0, 0, 1, '2020-03-01 14:10:43', '2020-03-01 14:10:43'),
(8, 18, 'John', 'Bendita', 'Doe', 'CEO', 'Filweb asia inc', 'Cavite carmona', '876543', 'johnadmin@gmail.com', '09876543', '', 1, 1, 1, '2020-03-02 08:23:41', '2020-03-02 08:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `kp_purchase_order`
--

CREATE TABLE `kp_purchase_order` (
  `id` bigint(20) NOT NULL,
  `quotation_id` bigint(20) NOT NULL DEFAULT '0',
  `po_no` varchar(64) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `served_quantity` int(11) NOT NULL DEFAULT '0',
  `pending_quantity` int(11) NOT NULL DEFAULT '0',
  `customer_note` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `process_status` tinyint(2) NOT NULL DEFAULT '0',
  `ar_status` tinyint(2) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_quotation`
--

CREATE TABLE `kp_quotation` (
  `id` bigint(20) NOT NULL,
  `quotation_no` varchar(64) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `process_by` bigint(20) NOT NULL DEFAULT '0',
  `specs` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `pending_quantity` int(11) NOT NULL,
  `mode_of_payment_id` bigint(20) NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `process_status` tinyint(2) NOT NULL DEFAULT '0',
  `price_per_piece` decimal(10,2) NOT NULL,
  `type_of_service_id` bigint(20) NOT NULL,
  `note` text NOT NULL,
  `reason` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_role`
--

CREATE TABLE `kp_role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `module_access` text NOT NULL,
  `role_access` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_role`
--

INSERT INTO `kp_role` (`id`, `name`, `module_access`, `role_access`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Central Administrator', '{\"acknowledgment-receipt\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print-one\",\"print\"],\"announcement\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"base-stock-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"base-stock\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"base-stock-issue\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\",\"get-base-stock-detail\",\"get-user-detail\"],\"base-stock-unit\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"daily-output\":[\"index\",\"view\",\"create\",\"delete\",\"get-job-order\",\"print\"],\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"add-daily-output\",\"received-scheduled\",\"cancel\",\"print\"],\"log\":[\"index\",\"view\",\"print\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"notification\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\",\"markall-as-read\"],\"official-receipt\":[\"index\",\"view\",\"print-one\",\"create\",\"update\",\"delete\",\"print\"],\"our-equipment\":[\"index\",\"view\"],\"our-portfolio\":[\"index\",\"view\"],\"our-product\":[\"index\",\"view\"],\"our-service\":[\"index\",\"view\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\",\"print\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\",\"acknowledge-receipt\",\"print\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\",\"print\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"sales-invoice\":[\"index\",\"view\",\"print-one\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"trade-reference\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\",\"print\"]}', '[\"11\",\"9\",\"10\",\"12\",\"13\",\"8\"]', 0, 1, 1, '0000-00-00 00:00:00', '2020-03-02 08:19:39'),
(9, 'Customer', '{\"acknowledgment-receipt\":[\"index\",\"view\",\"get-purchase-order\",\"print-one\",\"print\"],\"daily-output\":[\"index\",\"view\",\"get-job-order\",\"print\"],\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"cancel\",\"print\"],\"log\":[\"index\",\"view\",\"print\"],\"notification\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\",\"markall-as-read\"],\"official-receipt\":[\"index\",\"view\",\"print-one\",\"print\"],\"profile\":[\"view\",\"update\",\"print\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"quotation\":[\"index\",\"view\",\"cancel\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\",\"print\"],\"sales-invoice\":[\"index\",\"view\",\"print-one\",\"get-purchase-order\",\"print\"],\"user\":[\"my-account\",\"view\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\",\"print\"]}', '', 0, 1, 1, '0000-00-00 00:00:00', '2020-03-02 08:18:33'),
(10, 'Finance', '{\"acknowledgment-receipt\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print-one\",\"print\"],\"dashboard\":[\"index\",\"chart\"],\"log\":[\"index\",\"view\",\"print\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"notification\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\",\"markall-as-read\"],\"official-receipt\":[\"index\",\"view\",\"print-one\",\"create\",\"update\",\"print\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\",\"acknowledge-receipt\",\"print\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\",\"print\"],\"sales-invoice\":[\"index\",\"view\",\"print-one\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"user\":[\"my-account\",\"view\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\",\"print\"]}', '[\"9\",\"10\"]', 1, 1, 1, '0000-00-00 00:00:00', '2020-03-02 08:19:01'),
(11, 'Administrator', '{\"acknowledgment-receipt\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print-one\",\"print\"],\"announcement\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"base-stock-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"base-stock\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"base-stock-issue\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\",\"get-base-stock-detail\",\"get-user-detail\"],\"base-stock-unit\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"daily-output\":[\"index\",\"view\",\"create\",\"delete\",\"get-job-order\",\"print\"],\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"add-daily-output\",\"received-scheduled\",\"cancel\",\"print\"],\"log\":[\"index\",\"view\",\"print\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"notification\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\",\"markall-as-read\"],\"official-receipt\":[\"index\",\"view\",\"print-one\",\"create\",\"update\",\"delete\",\"print\"],\"our-equipment\":[\"index\",\"view\"],\"our-portfolio\":[\"index\",\"view\"],\"our-product\":[\"index\",\"view\"],\"our-service\":[\"index\",\"view\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\",\"print\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\",\"acknowledge-receipt\",\"print\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\",\"print\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"sales-invoice\":[\"index\",\"view\",\"print-one\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"trade-reference\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\",\"print\"]}', '[\"11\",\"9\",\"10\",\"12\",\"13\"]', 1, 1, 1, '0000-00-00 00:00:00', '2020-03-02 08:19:20'),
(12, 'Marketing', '{\"acknowledgment-receipt\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print-one\",\"print\"],\"announcement\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"job-order\":[\"index\",\"view\",\"print\"],\"log\":[\"index\",\"view\",\"print\"],\"notification\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\",\"markall-as-read\"],\"official-receipt\":[\"index\",\"view\",\"print-one\",\"create\",\"update\",\"print\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"purchase-order\":[\"index\",\"view\",\"acknowledge-receipt\",\"print\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"remove-image\",\"print\"],\"sales-invoice\":[\"index\",\"view\",\"print-one\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"trade-reference\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"user\":[\"my-account\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}', '[\"9\",\"12\"]', 1, 1, 1, '2020-03-01 14:28:52', '2020-03-02 08:17:56'),
(13, 'Production', '{\"base-stock-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"base-stock\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"base-stock-issue\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\",\"get-base-stock-detail\",\"get-user-detail\"],\"base-stock-unit\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"daily-output\":[\"index\",\"view\",\"create\",\"delete\",\"get-job-order\",\"print\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"add-daily-output\",\"received-scheduled\",\"cancel\",\"print\"],\"log\":[\"index\",\"view\",\"print\"],\"notification\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"print\",\"markall-as-read\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\",\"print\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\",\"print\"],\"user\":[\"my-account\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}', '[\"9\",\"13\"]', 1, 1, 1, '2020-03-01 14:29:08', '2020-03-02 08:17:26');

-- --------------------------------------------------------

--
-- Table structure for table `kp_sales_invoice`
--

CREATE TABLE `kp_sales_invoice` (
  `id` bigint(20) NOT NULL,
  `purchase_order_id` bigint(20) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no` varchar(128) NOT NULL,
  `pickup_date` date NOT NULL,
  `prepared_by` varchar(256) NOT NULL,
  `noted_by` varchar(256) NOT NULL,
  `payment_status` tinyint(2) NOT NULL,
  `company_name` varchar(256) NOT NULL,
  `company_address` text NOT NULL,
  `contact_person` varchar(256) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_service`
--

CREATE TABLE `kp_service` (
  `id` bigint(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `tag_line` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(11) NOT NULL DEFAULT '0',
  `updated_by` bigint(11) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_service`
--

INSERT INTO `kp_service` (`id`, `name`, `tag_line`, `description`, `created_by`, `updated_by`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Quotation Request', 'Request a quoation with us for your design', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.', 1, 1, 1, 'uploads/services/pic1.jpg', '0000-00-00 00:00:00', '2020-02-24 05:24:20'),
(2, '3D Printing', 'leverage your design with 3 Dimensional Pattern', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.', 1, 1, 1, 'uploads/services/pic2.jpg', '0000-00-00 00:00:00', '2020-02-24 05:24:08'),
(3, 'Test', 'Test Tag Line', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, 1, 1, 'uploads/services/post3.jpg', '2020-02-24 07:00:30', '2020-02-24 07:00:30'),
(4, 'Another test service', 'Another test service tag line', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, 1, 1, 'uploads/services/post2.jpg', '2020-02-24 07:01:52', '2020-02-24 07:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `kp_setting`
--

CREATE TABLE `kp_setting` (
  `id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `default_role` int(11) NOT NULL,
  `pagination` int(11) NOT NULL,
  `timezone` varchar(64) NOT NULL,
  `quotation_no_padding` int(11) NOT NULL,
  `quotation_no_prefix` varchar(32) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jo_no_padding` int(11) NOT NULL,
  `jo_no_prefix` varchar(32) NOT NULL,
  `company_name` varchar(256) NOT NULL,
  `company_address` text NOT NULL,
  `company_tag_line` varchar(256) NOT NULL,
  `company_description` text NOT NULL,
  `form_of_business` varchar(256) NOT NULL,
  `line_of_business` varchar(256) NOT NULL,
  `company_phone_no` varchar(32) NOT NULL,
  `company_fax_no` varchar(32) NOT NULL,
  `company_logo` text NOT NULL,
  `tin` varchar(64) NOT NULL,
  `reg_no` varchar(64) NOT NULL,
  `twitter` varchar(128) NOT NULL,
  `facebook` varchar(128) NOT NULL,
  `google` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `notification_pages` text NOT NULL,
  `si_no_padding` int(11) NOT NULL,
  `si_no_prefix` varchar(32) NOT NULL,
  `ar_no_padding` int(11) NOT NULL,
  `ar_no_prefix` varchar(32) NOT NULL,
  `menu` text NOT NULL,
  `or_no_padding` int(11) NOT NULL,
  `or_no_prefix` varchar(32) NOT NULL,
  `maximum_request_amount_restriction` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_setting`
--

INSERT INTO `kp_setting` (`id`, `created_by`, `updated_by`, `default_role`, `pagination`, `timezone`, `quotation_no_padding`, `quotation_no_prefix`, `status`, `created_at`, `updated_at`, `jo_no_padding`, `jo_no_prefix`, `company_name`, `company_address`, `company_tag_line`, `company_description`, `form_of_business`, `line_of_business`, `company_phone_no`, `company_fax_no`, `company_logo`, `tin`, `reg_no`, `twitter`, `facebook`, `google`, `email`, `notification_pages`, `si_no_padding`, `si_no_prefix`, `ar_no_padding`, `ar_no_prefix`, `menu`, `or_no_padding`, `or_no_prefix`, `maximum_request_amount_restriction`) VALUES
(1, 1, 1, 9, 10, 'America/Boise', 5, 'KPI-Q-', 1, '0000-00-00 00:00:00', '2020-03-02 03:46:14', 5, 'JO-', 'Kanity Printing INC', '123 Business Way San Francisco, CA 94108 USA', 'We strive to deliver a level of service that exceeds the expectations of our customers.', 'If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.', 'Incorporated', 'Commercial Printing', '(888) 123-4567', '(887) 123-4567', 'uploads/setting/company_logo/logo.jpg', '008-843-616', 'CS201416033', '', '', '', '', '{\"quotation\":{\"title\":\"Quotations\",\"roles\":[\"11\",\"10\",\"8\"]},\"purchase-order\":{\"title\":\"Purchase Orders\",\"roles\":[\"11\",\"10\",\"8\"]},\"job-order\":{\"title\":\"Job Orders\",\"roles\":[\"11\",\"10\",\"8\"]},\"daily-output\":{\"title\":\"Daily Output\",\"roles\":[\"11\",\"10\",\"8\"]},\"acknowledgment-receipt\":{\"title\":\"Acknowledgment Receipt\",\"roles\":[\"11\",\"10\",\"8\"]},\"sales-invoice\":{\"title\":\"Sale Invoice\",\"roles\":[\"11\",\"10\",\"8\"]},\"official-receipt\":{\"title\":\"Official Receipt\",\"roles\":[\"11\",\"10\",\"8\"]},\"user\":{\"title\":\"User Signup\",\"roles\":[\"11\",\"10\",\"8\"]}}', 5, 'SI-', 5, 'AR-', '{\"dashboard\":{\"title\":\"Dashboard\",\"icon\":\"fa fa-dashboard\"},\"quotation\":{\"title\":\"Quotations\",\"icon\":\"fa fa-edit\"},\"purchase-order\":{\"title\":\"Purchase Orders\",\"icon\":\"fa fa-shopping-cart\"},\"job-order\":{\"title\":\"Job Orders\",\"icon\":\"fa fa-book\"},\"acknowledgment-receipt\":{\"title\":\"AR\",\"icon\":\"fa fa-folder-open-o\"},\"sales-invoice\":{\"title\":\"Sales Invoice\",\"icon\":\"fa fa-money\"},\"official-receipt\":{\"title\":\"Official Receipt\",\"icon\":\"fa fa-file\"},\"daily-output\":{\"title\":\"Daily Outputs\",\"icon\":\"fa fa-calendar\"},\"user\":{\"title\":\"Users\",\"icon\":\"fa fa-group\"},\"profile\":{\"title\":\"Profiles\",\"icon\":\"fa fa-user\"},\"log\":{\"title\":\"User Logs\",\"icon\":\"fa fa-book\"},\"announcement\":{\"title\":\"announcement\",\"icon\":\"fa fa-bullhorn\"},\"#stock\":{\"title\":\"Stocks\",\"icon\":\"fa fa-cubes\",\"sub\":{\"base-stock\":{\"title\":\"Base Stock\",\"icon\":\"fa fa-cube\"},\"base-stock-issue\":{\"title\":\"Issue Stock\",\"icon\":\"fa fa-external-link\"},\"base-stock-category\":{\"title\":\"Category\",\"icon\":\"fa fa-gear\"},\"base-stock-unit\":{\"title\":\"Unit\",\"icon\":\"fa fa-gear\"}}},\"#cms\":{\"title\":\"CMS\",\"icon\":\"fa fa-gear\",\"sub\":{\"mode-of-payment\":{\"title\":\"Mode of Payment\",\"icon\":\"fa fa-gear\"},\"portfolio-category\":{\"title\":\"Portfolio Category\",\"icon\":\"fa fa-gear\"},\"portfolio\":{\"title\":\"Portfolio\",\"icon\":\"fa fa-folder\"},\"equipment\":{\"title\":\"Equipment\",\"icon\":\"fa fa-briefcase\"},\"equipment-category\":{\"title\":\"Equipment Category\",\"icon\":\"fa fa-gear\"},\"service\":{\"title\":\"Services\",\"icon\":\"fa fa-wrench\"},\"product\":{\"title\":\"Product\",\"icon\":\"fa fa-shopping-cart\"},\"specification\":{\"title\":\"specifications\",\"icon\":\"fa fa-edit\"},\"type-of-service\":{\"title\":\"Type of Service\",\"icon\":\"fa fa-gear\"},\"trade-reference\":{\"title\":\"Trade Reference\",\"icon\":\"fa fa-building\"},\"dashboard-carousel\":{\"title\":\"Dashboard Carousel\",\"icon\":\"fa fa-image\"}}},\"#settings\":{\"title\":\"Settings\",\"icon\":\"fa fa-gears\",\"sub\":{\"role\":{\"title\":\"Roles\",\"icon\":\"fa fa-user-secret\"},\"setting\":{\"title\":\"General\",\"icon\":\"fa fa-cog\"}}}}', 5, 'OR-', '10000.00');

-- --------------------------------------------------------

--
-- Table structure for table `kp_specification`
--

CREATE TABLE `kp_specification` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `paper` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `watermark` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_specification`
--

INSERT INTO `kp_specification` (`id`, `name`, `paper`, `description`, `watermark`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fully Sensitized CBS 1', 'Regular Paper 95gsm', 'Regular Paper 95gsm', 1, 1, 1, 1, '2020-02-21 12:28:56', '2020-02-21 12:28:56'),
(2, 'Fully Sensitized CBS 1', 'Regular Paper 95gsm', 'Regular Paper 95gsm', 0, 1, 1, 1, '2020-02-21 12:35:08', '2020-02-21 12:35:08'),
(3, 'Half Sensitized CBS 1', 'Regular Paper 80gsm', 'Regular Paper 80gsm', 1, 1, 1, 1, '2020-02-21 12:35:26', '2020-02-21 12:35:26'),
(4, 'Half Sensitized CBS 1', 'Regular Paper 80gsm', 'Regular Paper 80gsm', 0, 1, 1, 1, '2020-02-21 12:35:44', '2020-02-21 12:35:44'),
(5, 'Fully Sensitized CBS 1', 'Regular Paper 80gsm', 'Regular Paper 80gsm', 1, 1, 1, 1, '2020-02-21 12:36:13', '2020-02-21 12:36:13'),
(6, 'Fully Sensitized CBS 1', 'Regular Paper 80gsm', 'Regular Paper 80gsm', 0, 1, 1, 1, '2020-02-21 12:36:33', '2020-02-21 12:36:33'),
(7, 'Half Sensitized CBS 1', 'Regular Paper 95gsm', 'Regular Paper 95gsm', 1, 1, 1, 1, '2020-02-21 12:36:48', '2020-02-21 12:36:48'),
(8, 'Half Sensitized CBS 1', 'Regular Paper 95gsm', 'Regular Paper 95gsm', 0, 1, 1, 1, '2020-02-21 12:37:02', '2020-02-21 12:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `kp_trade_reference`
--

CREATE TABLE `kp_trade_reference` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_trade_reference`
--

INSERT INTO `kp_trade_reference` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'HEIDELBERG PHILPPINES, INC.', 'HEIDELBERG PHILPPINES, INC.', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-24 08:46:27'),
(2, 'NAPPCO (Nation Paper Products & Printing)', 'NAPPCO (Nation Paper Products & Printing)', 1, 1, 1, '2020-02-24 08:46:34', '2020-02-24 08:46:34'),
(3, 'IDEAL MARKETING CORPORATION', 'IDEAL MARKETING CORPORATION', 1, 1, 1, '2020-02-24 08:46:41', '2020-02-24 08:46:41');

-- --------------------------------------------------------

--
-- Table structure for table `kp_type_of_service`
--

CREATE TABLE `kp_type_of_service` (
  `id` bigint(20) NOT NULL,
  `payment_type_id` tinyint(2) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_type_of_service`
--

INSERT INTO `kp_type_of_service` (`id`, `payment_type_id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Complete Service', 'Complete Service\r\n', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-22 06:00:37'),
(2, 1, 'Partial Service', 'Partial Service', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-24 05:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `kp_user`
--

CREATE TABLE `kp_user` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `authkey` varchar(256) NOT NULL,
  `access_token` varchar(256) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `super_admin` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_user`
--

INSERT INTO `kp_user` (`id`, `role_id`, `created_by`, `updated_by`, `username`, `password`, `authkey`, `access_token`, `status`, `created_at`, `updated_at`, `super_admin`) VALUES
(1, 8, 0, 1, 'admin', '$2y$13$ER7fM7eafiq3zK49hUVRye0rbOQqkKDCg45FA6BSRIRhwUG99dAEe', 'BZEO4_YQKJ', '1CKQYUZY5P', 1, '2020-02-18 06:30:18', '2020-03-02 08:20:04', 1),
(18, 11, 1, 1, 'admin12345', '$2y$13$8abzX0X8Fb72cszyMGGUuutag1g6b6m1hBSh9tNRjyNvrJxHmSW1.', '2IWQYCPLOW', 'EQ8EVNUMRV', 1, '2020-03-02 08:22:50', '2020-03-02 08:22:50', 0),
(19, 10, 1, 1, 'finance123456', '$2y$13$421ZyRPIiXP3BdZoRoypm.nl89R4RCFWTv2njte5kXyN917k2LdAO', '1ZPXXP4TPN', 'UPHASHJBMF', 1, '2020-03-02 08:24:13', '2020-03-02 08:24:13', 0),
(20, 12, 1, 1, 'marketing123456', '$2y$13$SrB0qisd6kn6ob8igzayw.Xav1psQLBSHdxbRlRcWJlgjYkBUMCLG', 'FLVFFCLQUW', '20NXNWGPTZ', 1, '2020-03-02 08:24:33', '2020-03-02 08:24:33', 0),
(21, 13, 1, 1, 'production123456', '$2y$13$BHZymfNdJve7O9HwS8kd7.RFOxOaBmByvxwgean6gJc6Majh/X9aa', 'SKGHLCXGS_', '9DA229VVDH', 1, '2020-03-02 08:24:50', '2020-03-02 08:24:50', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kp_acknowledgment_receipt`
--
ALTER TABLE `kp_acknowledgment_receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`),
  ADD KEY `purchase_order_id` (`purchase_order_id`);

--
-- Indexes for table `kp_announcement`
--
ALTER TABLE `kp_announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`);

--
-- Indexes for table `kp_base_stock`
--
ALTER TABLE `kp_base_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_stock_category_id` (`base_stock_category_id`),
  ADD KEY `base_stock_unit_id` (`base_stock_unit_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `kp_base_stock_category`
--
ALTER TABLE `kp_base_stock_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`);

--
-- Indexes for table `kp_base_stock_issue`
--
ALTER TABLE `kp_base_stock_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`),
  ADD KEY `base_stock_id` (`base_stock_id`,`user_id`);

--
-- Indexes for table `kp_base_stock_unit`
--
ALTER TABLE `kp_base_stock_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`);

--
-- Indexes for table `kp_daily_output`
--
ALTER TABLE `kp_daily_output`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`),
  ADD KEY `job_order_id` (`job_order_id`);

--
-- Indexes for table `kp_dashboard_carousel`
--
ALTER TABLE `kp_dashboard_carousel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`);

--
-- Indexes for table `kp_equipment`
--
ALTER TABLE `kp_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `service_id` (`equipment_category_id`);

--
-- Indexes for table `kp_equipment_category`
--
ALTER TABLE `kp_equipment_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`);

--
-- Indexes for table `kp_job_order`
--
ALTER TABLE `kp_job_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_category_id` (`purchase_order_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `purchase_order_id` (`purchase_order_id`);

--
-- Indexes for table `kp_log`
--
ALTER TABLE `kp_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `kp_mode_of_payment`
--
ALTER TABLE `kp_mode_of_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`);

--
-- Indexes for table `kp_notification`
--
ALTER TABLE `kp_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `kp_official_receipt`
--
ALTER TABLE `kp_official_receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`),
  ADD KEY `sales_invoice_id` (`sales_invoice_id`);

--
-- Indexes for table `kp_portfolio`
--
ALTER TABLE `kp_portfolio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_category_id` (`portfolio_category_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `kp_portfolio_category`
--
ALTER TABLE `kp_portfolio_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`);

--
-- Indexes for table `kp_product`
--
ALTER TABLE `kp_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `kp_profile`
--
ALTER TABLE `kp_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `kp_purchase_order`
--
ALTER TABLE `kp_purchase_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_category_id` (`quotation_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `kp_quotation`
--
ALTER TABLE `kp_quotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `process_by` (`process_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `type_of_service_id` (`type_of_service_id`),
  ADD KEY `mode_of_payment_id` (`mode_of_payment_id`);

--
-- Indexes for table `kp_role`
--
ALTER TABLE `kp_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `kp_sales_invoice`
--
ALTER TABLE `kp_sales_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_id` (`purchase_order_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `kp_service`
--
ALTER TABLE `kp_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `kp_setting`
--
ALTER TABLE `kp_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `kp_specification`
--
ALTER TABLE `kp_specification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `kp_trade_reference`
--
ALTER TABLE `kp_trade_reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`);

--
-- Indexes for table `kp_type_of_service`
--
ALTER TABLE `kp_type_of_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`);

--
-- Indexes for table `kp_user`
--
ALTER TABLE `kp_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kp_acknowledgment_receipt`
--
ALTER TABLE `kp_acknowledgment_receipt`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_announcement`
--
ALTER TABLE `kp_announcement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kp_base_stock`
--
ALTER TABLE `kp_base_stock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kp_base_stock_category`
--
ALTER TABLE `kp_base_stock_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_base_stock_issue`
--
ALTER TABLE `kp_base_stock_issue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kp_base_stock_unit`
--
ALTER TABLE `kp_base_stock_unit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_daily_output`
--
ALTER TABLE `kp_daily_output`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_dashboard_carousel`
--
ALTER TABLE `kp_dashboard_carousel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_equipment`
--
ALTER TABLE `kp_equipment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_equipment_category`
--
ALTER TABLE `kp_equipment_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_job_order`
--
ALTER TABLE `kp_job_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_log`
--
ALTER TABLE `kp_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kp_mode_of_payment`
--
ALTER TABLE `kp_mode_of_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kp_notification`
--
ALTER TABLE `kp_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_official_receipt`
--
ALTER TABLE `kp_official_receipt`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_portfolio`
--
ALTER TABLE `kp_portfolio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kp_portfolio_category`
--
ALTER TABLE `kp_portfolio_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_product`
--
ALTER TABLE `kp_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_profile`
--
ALTER TABLE `kp_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kp_purchase_order`
--
ALTER TABLE `kp_purchase_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_quotation`
--
ALTER TABLE `kp_quotation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_role`
--
ALTER TABLE `kp_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kp_sales_invoice`
--
ALTER TABLE `kp_sales_invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_service`
--
ALTER TABLE `kp_service`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_setting`
--
ALTER TABLE `kp_setting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kp_specification`
--
ALTER TABLE `kp_specification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kp_trade_reference`
--
ALTER TABLE `kp_trade_reference`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_type_of_service`
--
ALTER TABLE `kp_type_of_service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kp_user`
--
ALTER TABLE `kp_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
