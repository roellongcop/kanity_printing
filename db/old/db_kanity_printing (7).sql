-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2020 at 09:12 AM
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

--
-- Dumping data for table `kp_acknowledgment_receipt`
--

INSERT INTO `kp_acknowledgment_receipt` (`id`, `purchase_order_id`, `received_by`, `company_name`, `quantity`, `delivery_date`, `delivery_status`, `particular`, `created_by`, `updated_by`, `no`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '', '', 11, '2020-02-19', 0, 'test', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-26 13:13:59'),
(2, 1, '', '', 11, '2020-02-12', 0, '11', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-26 14:34:02'),
(3, 2, '', '', 22, '2020-02-12', 0, 'test', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-26 13:24:15'),
(4, 2, '', '', 22, '2020-02-19', 0, '22', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-26 13:25:49'),
(5, 2, '', '', 22, '2020-02-19', 0, 'test', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-26 14:34:11'),
(6, 2, '', '', 22, '2020-02-05', 0, 'test', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-26 14:36:28'),
(7, 2, '', '', 22, '2020-02-19', 0, 'test', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-28 14:27:12'),
(8, 1, '', '', 11, '2020-02-06', 0, 'test', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-28 14:00:36'),
(9, 1, 'Roel Longcop', '', 11, '2020-02-20', 0, 'test', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-28 14:27:16'),
(10, 1, 'John Doe', 'Test Company', 11, '2020-02-14', 0, 'test', 1, 1, '', '', 1, '2020-02-28 14:30:42', '2020-02-28 14:30:42'),
(11, 2, 'Jordan logronio', 'Filweb asia inc', 22, '2020-02-13', 0, 'test', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-28 14:44:37'),
(12, 2, 'Jordan logronio', 'Filweb asia inc', 22, '2020-02-14', 0, 'test', 1, 1, '', '', 0, '0000-00-00 00:00:00', '2020-02-28 14:55:33'),
(13, 2, 'Jordan logronio', 'Filweb asia inc', 22, '2020-02-13', 0, 'Shawarma Tes', 1, 1, 'AR-00013', 'This is testing', 1, '2020-02-28 14:56:00', '2020-02-28 14:56:00'),
(14, 3, 'Roel Longcop', 'Filweb asia inc', 10, '2020-02-19', 1, 'test', 1, 1, 'AR-00014', '', 1, '2020-02-28 15:36:28', '2020-02-28 15:36:28'),
(15, 3, 'Roel Longcop', 'Filweb asia inc', 56, '2020-02-04', 0, 'test', 1, 1, 'AR-00015', '', 1, '2020-02-28 15:39:27', '2020-02-28 15:39:27'),
(16, 3, 'Jordan logronio', 'Test Company', 34, '2020-02-03', 0, 'qeqw', 1, 1, 'AR-00016', '', 1, '2020-02-28 15:40:15', '2020-02-28 15:40:15');

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
(1, 'Our Transaction', 'There\'s no transaction on November 1, 2019 (Friday) in observance to All Saints\' Day.', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-24 14:01:23');

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

--
-- Dumping data for table `kp_daily_output`
--

INSERT INTO `kp_daily_output` (`id`, `job_order_id`, `quantity`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 22, 1, 1, 0, '0000-00-00 00:00:00', '2020-02-26 13:55:16'),
(2, 3, 22, 1, 1, 0, '0000-00-00 00:00:00', '2020-02-26 13:56:37'),
(3, 3, 22, 1, 1, 1, '2020-02-26 13:57:33', '2020-02-26 13:57:33'),
(4, 2, 11, 1, 1, 0, '0000-00-00 00:00:00', '2020-02-26 14:08:33'),
(5, 2, 11, 1, 1, 1, '2020-02-26 14:08:44', '2020-02-26 14:08:44');

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

--
-- Dumping data for table `kp_job_order`
--

INSERT INTO `kp_job_order` (`id`, `purchase_order_id`, `jo_no`, `quantity`, `served_quantity`, `pending_quantity`, `note`, `created_by`, `updated_by`, `process_status`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'KPI-JO-00001', 11, 11, 0, 'test', 1, 1, 3, 1, '0000-00-00 00:00:00', '2020-02-26 14:08:45'),
(3, 2, 'KPI-JO-00003', 22, 22, 0, 'test2', 1, 1, 3, 1, '0000-00-00 00:00:00', '2020-02-26 13:57:33');

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
(1, 1, 11, '{\"_csrf\":\"JJBiSYvC814I1qyXQxgGXqdDmMDUcnwUVkKHsKwlICdv-iUCupe2aF2C_vQha0As4Dndsq0LHnMPIMH0zRdxaQ==\"}', '{\"status\":1,\"created_at\":\"2020-02-28 06:43:29\",\"updated_at\":\"2020-02-28 06:43:29\"}', 'POST', 'http://localhost/kanity_printing/acknowledgment-receipt/delete/11', 'delete', 'acknowledgment-receipt', 'AcknowledgmentReceipt', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 14:44:37', '2020-02-28 14:44:37'),
(2, 1, 2, '{\"_csrf\":\"JJBiSYvC814I1qyXQxgGXqdDmMDUcnwUVkKHsKwlICdv-iUCupe2aF2C_vQha0As4Dndsq0LHnMPIMH0zRdxaQ==\"}', '{\"served_quantity\":22,\"pending_quantity\":0,\"ar_status\":2,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 06:43:29\"}', 'POST', 'http://localhost/kanity_printing/acknowledgment-receipt/delete/11', 'delete', 'acknowledgment-receipt', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 14:44:37', '2020-02-28 14:44:37'),
(3, 1, 12, '{\"_csrf\":\"vic-r4qMMR_VnVWOt_8e1qN3XwhfyzlCnT9fH94xSKz1TXnku9l0KYDJB-3VjFik5A0aeiayWyXEXRlbvwMZ4g==\",\"AcknowledgmentReceipt\":{\"purchase_order_id\":\"2\",\"quantity\":\"22\",\"company_name\":\"Filweb asia inc\",\"received_by\":\"Jordan logronio\",\"delivery_date\":\"2020-02-14\",\"delivery_status\":\"0\",\"particular\":\"test\"}}', '{\"purchase_order_id\":null,\"quantity\":null,\"company_name\":null,\"received_by\":null,\"delivery_date\":null,\"delivery_status\":null,\"particular\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/acknowledgment-receipt/create', 'create', 'acknowledgment-receipt', 'AcknowledgmentReceipt', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 14:44:51', '2020-02-28 14:44:51'),
(4, 1, 2, '{\"_csrf\":\"vic-r4qMMR_VnVWOt_8e1qN3XwhfyzlCnT9fH94xSKz1TXnku9l0KYDJB-3VjFik5A0aeiayWyXEXRlbvwMZ4g==\",\"AcknowledgmentReceipt\":{\"purchase_order_id\":\"2\",\"quantity\":\"22\",\"company_name\":\"Filweb asia inc\",\"received_by\":\"Jordan logronio\",\"delivery_date\":\"2020-02-14\",\"delivery_status\":\"0\",\"particular\":\"test\"}}', '{\"served_quantity\":0,\"pending_quantity\":22,\"ar_status\":0,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 06:44:37\"}', 'POST', 'http://localhost/kanity_printing/acknowledgment-receipt/create', 'create', 'acknowledgment-receipt', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 14:44:51', '2020-02-28 14:44:51'),
(5, 1, 1, '{\"_csrf\":\"nYUXuYglbue7bjzBECZE1guWI1_Gq4TSys-ULxcC3A7W71DyuXAr0e46bqJyVQKkTOxmLb_S5rWTrdJrdjCNQA==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/Boise\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"JO-\",\"si_no_padding\":\"5\",\"si_no_prefix\":\"SI-\",\"ar_no_padding\":\"5\",\"ar_no_prefix\":\"AR-\",\"company_name\":\"Kanity Printing INC\",\"company_tag_line\":\"We strive to deliver a level of service that exceeds the expectations of our customers.\",\"form_of_business\":\"Incorporated\",\"line_of_business\":\"Commercial Printing\",\"tin\":\"008-843-616\",\"reg_no\":\"CS201416033\",\"company_phone_no\":\"(888) 123-4567\",\"company_fax_no\":\"(887) 123-4567\",\"company_address\":\"123 Business Way San Francisco, CA 94108 USA\",\"company_description\":\"If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.\",\"twitter\":\"\",\"facebook\":\"\",\"google\":\"\",\"email\":\"\",\"notification_pages\":[[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"]]}}', '{\"default_role\":9,\"pagination\":10,\"quotation_no_padding\":5,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 02:30:13\",\"jo_no_padding\":5,\"jo_no_prefix\":\"KPI-JO-\",\"si_no_padding\":5,\"si_no_prefix\":\"\",\"ar_no_padding\":0,\"ar_no_prefix\":\"\"}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 14:53:56', '2020-02-28 14:53:56'),
(6, 1, 12, '{\"_csrf\":\"RFYgCAQTPGwjuAXprGkoCIUAF8NN8KhLeBYQV13zwBwPPGdDNUZ5WnbsV4rOGm56wnpSsTSJyiwhdFYTPMGRUg==\"}', '{\"status\":1,\"created_at\":\"2020-02-28 06:44:51\",\"updated_at\":\"2020-02-28 06:44:51\"}', 'POST', 'http://localhost/kanity_printing/acknowledgment-receipt/delete/12', 'delete', 'acknowledgment-receipt', 'AcknowledgmentReceipt', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 14:55:33', '2020-02-28 14:55:33'),
(7, 1, 2, '{\"_csrf\":\"RFYgCAQTPGwjuAXprGkoCIUAF8NN8KhLeBYQV13zwBwPPGdDNUZ5WnbsV4rOGm56wnpSsTSJyiwhdFYTPMGRUg==\"}', '{\"served_quantity\":22,\"pending_quantity\":0,\"ar_status\":2,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 06:44:51\"}', 'POST', 'http://localhost/kanity_printing/acknowledgment-receipt/delete/12', 'delete', 'acknowledgment-receipt', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 14:55:34', '2020-02-28 14:55:34'),
(8, 1, 13, '{\"_csrf\":\"E9cKkA82kE_6ogsBdcGb4pNzwVUSMtWhfSJ3zFUQkcFYvU3bPmPVea_2WWIXst2Q1AmEJ2tLt8YkQDGINCLAjw==\",\"AcknowledgmentReceipt\":{\"purchase_order_id\":\"2\",\"quantity\":\"22\",\"company_name\":\"Filweb asia inc\",\"received_by\":\"Jordan logronio\",\"delivery_date\":\"2020-02-13\",\"delivery_status\":\"0\",\"particular\":\"Shawarma Tes\",\"note\":\"This is testing\"}}', '{\"purchase_order_id\":null,\"quantity\":null,\"company_name\":null,\"received_by\":null,\"delivery_date\":null,\"delivery_status\":null,\"particular\":null,\"note\":null,\"no\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/acknowledgment-receipt/create', 'create', 'acknowledgment-receipt', 'AcknowledgmentReceipt', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 14:56:00', '2020-02-28 14:56:00'),
(9, 1, 2, '{\"_csrf\":\"E9cKkA82kE_6ogsBdcGb4pNzwVUSMtWhfSJ3zFUQkcFYvU3bPmPVea_2WWIXst2Q1AmEJ2tLt8YkQDGINCLAjw==\",\"AcknowledgmentReceipt\":{\"purchase_order_id\":\"2\",\"quantity\":\"22\",\"company_name\":\"Filweb asia inc\",\"received_by\":\"Jordan logronio\",\"delivery_date\":\"2020-02-13\",\"delivery_status\":\"0\",\"particular\":\"Shawarma Tes\",\"note\":\"This is testing\"}}', '{\"served_quantity\":0,\"pending_quantity\":22,\"ar_status\":0,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 06:55:34\"}', 'POST', 'http://localhost/kanity_printing/acknowledgment-receipt/create', 'create', 'acknowledgment-receipt', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 14:56:01', '2020-02-28 14:56:01'),
(10, 1, 8, '{\"_csrf\":\"VFo9zUuT2QJx7OGWMEk5EorVjX9isxdDng1P0SZzZ1YfMHqGesacNCS4s_VSOn9gza_IDRvKdSTHbwmVR0E2GA==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"11\",\"9\",\"10\",\"8\"],\"module_access\":{\"acknowledgment-receipt\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print\"],\"announcement\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"daily-output\":[\"index\",\"view\",\"create\",\"delete\",\"get-job-order\"],\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"add-daily-output\",\"received-scheduled\",\"cancel\",\"update-job-order\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"our-equipment\":[\"index\",\"view\"],\"our-portfolio\":[\"index\",\"view\"],\"our-product\":[\"index\",\"view\"],\"our-service\":[\"index\",\"view\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\",\"acknowledge-receipt\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"sales-invoice\":[\"index\",\"view\",\"print\",\"create\",\"update\",\"delete\",\"get-purchase-order\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"trade-reference\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', '{\"module_access\":\"{\\\"acknowledgment-receipt\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"get-purchase-order\\\"],\\\"announcement\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"daily-output\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"delete\\\",\\\"get-job-order\\\"],\\\"dashboard-carousel\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"dashboard\\\":[\\\"index\\\",\\\"chart\\\"],\\\"equipment-category\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"equipment\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"job-order\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"add-daily-output\\\",\\\"received-scheduled\\\",\\\"cancel\\\",\\\"update-job-order\\\"],\\\"log\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"mode-of-payment\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"our-equipment\\\":[\\\"index\\\",\\\"view\\\"],\\\"our-portfolio\\\":[\\\"index\\\",\\\"view\\\"],\\\"our-product\\\":[\\\"index\\\",\\\"view\\\"],\\\"our-service\\\":[\\\"index\\\",\\\"view\\\"],\\\"portfolio-category\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"portfolio\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"product\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"profile\\\":[\\\"index\\\",\\\"view\\\",\\\"update\\\",\\\"delete\\\"],\\\"purchase-order\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"create-job-order\\\",\\\"acknowledge-receipt\\\"],\\\"quotation\\\":[\\\"index\\\",\\\"view\\\",\\\"no-bid\\\",\\\"cancel\\\",\\\"set-quotation\\\",\\\"send-po\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"remove-image\\\"],\\\"role\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"sales-invoice\\\":[\\\"index\\\",\\\"view\\\",\\\"print\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"get-purchase-order\\\"],\\\"service\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"setting\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"site\\\":[\\\"index\\\",\\\"login\\\",\\\"logout\\\",\\\"signup\\\",\\\"signup-success\\\",\\\"verification\\\",\\\"home\\\"],\\\"specification\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"trade-reference\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"type-of-service\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"user\\\":[\\\"index\\\",\\\"my-account\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"create-profile\\\",\\\"view-profile\\\",\\\"my-profile\\\",\\\"build-profile\\\",\\\"update-account\\\"]}\",\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 05:31:22\"}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:02:42', '2020-02-28 15:02:42'),
(11, 1, 1, '{\"_csrf\":\"-ehorRn7W4PmSb9VH6jHqnMG_gMQkSZHNwKyyksM32aygi_mKK4etbMd7TZ924HYNHy7cWnoRCBuYPSOKj6OKA==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/Boise\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"JO-\",\"si_no_padding\":\"5\",\"si_no_prefix\":\"SI-\",\"ar_no_padding\":\"5\",\"ar_no_prefix\":\"AR-\",\"company_name\":\"Kanity Printing INC\",\"company_tag_line\":\"We strive to deliver a level of service that exceeds the expectations of our customers.\",\"form_of_business\":\"Incorporated\",\"line_of_business\":\"Commercial Printing\",\"tin\":\"008-843-616\",\"reg_no\":\"CS201416033\",\"company_phone_no\":\"(888) 123-4567\",\"company_fax_no\":\"(887) 123-4567\",\"company_address\":\"123 Business Way San Francisco, CA 94108 USA\",\"company_description\":\"If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.\",\"company_logo\":\"\",\"twitter\":\"\",\"facebook\":\"\",\"google\":\"\",\"email\":\"\",\"notification_pages\":[[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"]]}}', '{\"default_role\":9,\"pagination\":10,\"quotation_no_padding\":5,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 06:53:56\",\"jo_no_padding\":5,\"si_no_padding\":5,\"ar_no_padding\":5}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:14:11', '2020-02-28 15:14:11'),
(12, 1, 1, '{\"_csrf\":\"YQLDF5R1ibUWxslAAll5G4Cwu8O3D6rjH4Kj4sv8SgYqaIRcpSDMg0OSmyNgKj9px8r-sc52yIRG4OWmqs4bSA==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/Boise\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"JO-\",\"si_no_padding\":\"5\",\"si_no_prefix\":\"SI-\",\"ar_no_padding\":\"5\",\"ar_no_prefix\":\"AR-\",\"company_name\":\"Kanity Printing INC\",\"company_tag_line\":\"We strive to deliver a level of service that exceeds the expectations of our customers.\",\"form_of_business\":\"Incorporated\",\"line_of_business\":\"Commercial Printing\",\"tin\":\"008-843-616\",\"reg_no\":\"CS201416033\",\"company_phone_no\":\"(888) 123-4567\",\"company_fax_no\":\"(887) 123-4567\",\"company_address\":\"123 Business Way San Francisco, CA 94108 USA\",\"company_description\":\"If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.\",\"company_logo\":\"\",\"twitter\":\"\",\"facebook\":\"\",\"google\":\"\",\"email\":\"\",\"notification_pages\":[[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"]]}}', '{\"default_role\":9,\"pagination\":10,\"quotation_no_padding\":5,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 07:14:10\",\"jo_no_padding\":5,\"si_no_padding\":5,\"ar_no_padding\":5}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:17:57', '2020-02-28 15:17:57'),
(13, 1, 1, '{\"_csrf\":\"UklN_gikCPAz-YSa275prNi-5tevYkITrmfRjloVrysZIwq1OfFNxmat1vm5zS_en8SjpdYbIHT3BZfKOyf-ZQ==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/Boise\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"JO-\",\"si_no_padding\":\"5\",\"si_no_prefix\":\"SI-\",\"ar_no_padding\":\"5\",\"ar_no_prefix\":\"AR-\",\"company_name\":\"Kanity Printing INC\",\"company_tag_line\":\"We strive to deliver a level of service that exceeds the expectations of our customers.\",\"form_of_business\":\"Incorporated\",\"line_of_business\":\"Commercial Printing\",\"tin\":\"008-843-616\",\"reg_no\":\"CS201416033\",\"company_phone_no\":\"(888) 123-4567\",\"company_fax_no\":\"(887) 123-4567\",\"company_address\":\"123 Business Way San Francisco, CA 94108 USA\",\"company_description\":\"If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.\",\"image_input\":\"\",\"twitter\":\"\",\"facebook\":\"\",\"google\":\"\",\"email\":\"\",\"notification_pages\":[[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"]]}}', '{\"default_role\":9,\"pagination\":10,\"quotation_no_padding\":5,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 07:17:57\",\"jo_no_padding\":5,\"company_logo\":\"\",\"si_no_padding\":5,\"ar_no_padding\":5}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:19:00', '2020-02-28 15:19:00'),
(14, 1, 1, '{\"_csrf\":\"JRg4LH8Fjkmi6GB46RJQEkNMs1HdOZ8z27LNfaDjaGNucn9nTlDLf_e8MhuLYRZgBDb2I6RA_VSC0Is5wdE5LQ==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/Boise\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"JO-\",\"si_no_padding\":\"5\",\"si_no_prefix\":\"SI-\",\"ar_no_padding\":\"5\",\"ar_no_prefix\":\"AR-\",\"company_name\":\"Kanity Printing INC\",\"company_tag_line\":\"We strive to deliver a level of service that exceeds the expectations of our customers.\",\"form_of_business\":\"Incorporated\",\"line_of_business\":\"Commercial Printing\",\"tin\":\"008-843-616\",\"reg_no\":\"CS201416033\",\"company_phone_no\":\"(888) 123-4567\",\"company_fax_no\":\"(887) 123-4567\",\"company_address\":\"123 Business Way San Francisco, CA 94108 USA\",\"company_description\":\"If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.\",\"image_input\":\"\",\"twitter\":\"\",\"facebook\":\"\",\"google\":\"\",\"email\":\"\",\"notification_pages\":[[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"]]}}', '{\"default_role\":9,\"pagination\":10,\"quotation_no_padding\":5,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 07:19:00\",\"jo_no_padding\":5,\"company_logo\":\"uploads\\/setting\\/company_logo\\/bg.jpg\",\"si_no_padding\":5,\"ar_no_padding\":5}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:20:23', '2020-02-28 15:20:23'),
(15, 1, 8, '{\"_csrf\":\"FOqi0G7cR55A0k2_V4X_BSdcG9Z7SvWWEJKj9wpZ-4RfgOWbX4kCqBWGH9w19rl3YCZepAIzl_FJ8OWza2uqyg==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"11\",\"9\",\"10\",\"8\"],\"module_access\":{\"acknowledgment-receipt\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print\"],\"announcement\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"daily-output\":[\"index\",\"view\",\"create\",\"delete\",\"get-job-order\"],\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"add-daily-output\",\"received-scheduled\",\"cancel\",\"update-job-order\"],\"log\":[\"index\",\"view\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"our-equipment\":[\"index\",\"view\"],\"our-portfolio\":[\"index\",\"view\"],\"our-product\":[\"index\",\"view\"],\"our-service\":[\"index\",\"view\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\",\"acknowledge-receipt\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"sales-invoice\":[\"index\",\"view\",\"print\",\"create\",\"update\",\"delete\",\"get-purchase-order\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"trade-reference\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', '{\"module_access\":\"{\\\"acknowledgment-receipt\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"get-purchase-order\\\",\\\"print\\\"],\\\"announcement\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"daily-output\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"delete\\\",\\\"get-job-order\\\"],\\\"dashboard-carousel\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"dashboard\\\":[\\\"index\\\",\\\"chart\\\"],\\\"equipment-category\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"equipment\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"job-order\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"add-daily-output\\\",\\\"received-scheduled\\\",\\\"cancel\\\",\\\"update-job-order\\\"],\\\"log\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"mode-of-payment\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"our-equipment\\\":[\\\"index\\\",\\\"view\\\"],\\\"our-portfolio\\\":[\\\"index\\\",\\\"view\\\"],\\\"our-product\\\":[\\\"index\\\",\\\"view\\\"],\\\"our-service\\\":[\\\"index\\\",\\\"view\\\"],\\\"portfolio-category\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"portfolio\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"product\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"profile\\\":[\\\"index\\\",\\\"view\\\",\\\"update\\\",\\\"delete\\\"],\\\"purchase-order\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"create-job-order\\\",\\\"acknowledge-receipt\\\"],\\\"quotation\\\":[\\\"index\\\",\\\"view\\\",\\\"no-bid\\\",\\\"cancel\\\",\\\"set-quotation\\\",\\\"send-po\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"remove-image\\\"],\\\"role\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"sales-invoice\\\":[\\\"index\\\",\\\"view\\\",\\\"print\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"get-purchase-order\\\"],\\\"service\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"setting\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"site\\\":[\\\"index\\\",\\\"login\\\",\\\"logout\\\",\\\"signup\\\",\\\"signup-success\\\",\\\"verification\\\",\\\"home\\\"],\\\"specification\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"trade-reference\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"type-of-service\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"user\\\":[\\\"index\\\",\\\"my-account\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"create-profile\\\",\\\"view-profile\\\",\\\"my-profile\\\",\\\"build-profile\\\",\\\"update-account\\\"]}\",\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 07:02:42\"}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:27:13', '2020-02-28 15:27:13'),
(16, 1, 3, '{\"_csrf\":\"Kno34oMfpL-phxMKqgR7z0koqDjm3RSgfkKK8iu_KdxhEHCpskrhifzTQWnIdz29DlLtSp-kdscnIMy2So14kg==\",\"Quotation\":{\"user_id\":\"13\",\"quantity\":\"100\",\"mode_of_payment_id\":\"1\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)\",\"description\":\"test\",\"imageFiles\":[\"\"]}}', '{\"user_id\":null,\"quantity\":null,\"mode_of_payment_id\":null,\"specs\":null,\"description\":null,\"status\":null,\"images\":null,\"created_at\":null,\"quotation_no\":null,\"pending_quantity\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:33:33', '2020-02-28 15:33:33'),
(17, 1, 3, '{\"_csrf\":\"torRc6ybMud_Gitz7s0NIlUW1b0TDp0fmN9pBqfbPrT94JY4nc530SpOeRCMvktQEmyQz2p3_3jBvS9Cxulv-g==\",\"Quotation\":{\"price_per_piece\":\"2.20\",\"type_of_service_id\":\"2\",\"note\":\"test\"}}', '{\"process_by\":\"0\",\"process_status\":0,\"price_per_piece\":\"0.00\",\"type_of_service_id\":\"0\",\"note\":\"\",\"created_at\":\"2020-02-28 07:33:32\",\"updated_at\":\"2020-02-28 07:33:32\"}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/3', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:33:55', '2020-02-28 15:33:55'),
(18, 1, 3, '{\"_csrf\":\"2ghJM0j96s1OqPyZEicFyXAPiYVpE9-ziVa6XLcVyDSRYg54eaiv-xv8rvpwVEO7N3XM9xBqvdTQNPwY1ieZeg==\",\"PurchaseOrder\":{\"po_no\":\"4535345\",\"customer_note\":\"test\"}}', '{\"quotation_id\":null,\"po_no\":null,\"customer_note\":null,\"quantity\":null,\"served_quantity\":null,\"pending_quantity\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"ar_status\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/3', 'send-po', 'quotation', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:34:03', '2020-02-28 15:34:03'),
(19, 1, 3, '{\"_csrf\":\"2ghJM0j96s1OqPyZEicFyXAPiYVpE9-ziVa6XLcVyDSRYg54eaiv-xv8rvpwVEO7N3XM9xBqvdTQNPwY1ieZeg==\",\"PurchaseOrder\":{\"po_no\":\"4535345\",\"customer_note\":\"test\"}}', '{\"process_status\":1,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 07:33:55\"}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/3', 'send-po', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:34:03', '2020-02-28 15:34:03'),
(20, 1, 14, '{\"_csrf\":\"-M1YdjbpHhzbeABajkEJ4kA5yzOtJJbQyEY0UHSbeCazpx89B7xbKo4sUjnsMk-QB0OOQdRd9LeRJHIUFakpaA==\",\"AcknowledgmentReceipt\":{\"quantity\":\"10\",\"particular\":\"test\",\"delivery_date\":\"2020-02-19\",\"delivery_status\":\"1\",\"company_name\":\"Filweb asia inc\",\"received_by\":\"Roel Longcop\"}}', '{\"purchase_order_id\":null,\"quantity\":null,\"particular\":null,\"delivery_date\":null,\"delivery_status\":null,\"company_name\":null,\"received_by\":null,\"no\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/purchase-order/acknowledge-receipt/3', 'acknowledge-receipt', 'purchase-order', 'AcknowledgmentReceipt', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:36:28', '2020-02-28 15:36:28'),
(21, 1, 3, '{\"_csrf\":\"-M1YdjbpHhzbeABajkEJ4kA5yzOtJJbQyEY0UHSbeCazpx89B7xbKo4sUjnsMk-QB0OOQdRd9LeRJHIUFakpaA==\",\"AcknowledgmentReceipt\":{\"quantity\":\"10\",\"particular\":\"test\",\"delivery_date\":\"2020-02-19\",\"delivery_status\":\"1\",\"company_name\":\"Filweb asia inc\",\"received_by\":\"Roel Longcop\"}}', '{\"served_quantity\":0,\"pending_quantity\":100,\"ar_status\":0,\"created_at\":\"2020-02-28 07:34:03\",\"updated_at\":\"2020-02-28 07:34:03\"}', 'POST', 'http://localhost/kanity_printing/purchase-order/acknowledge-receipt/3', 'acknowledge-receipt', 'purchase-order', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:36:28', '2020-02-28 15:36:28'),
(22, 1, 15, '{\"_csrf\":\"mYY1eBDj0RQTzlZhkwmf8ktfGOYE8FKDI3Bad6tc3KDS7HIzIbaUIkaaBALxetmADCVdlH2JMOR6Ehwzym6N7g==\",\"AcknowledgmentReceipt\":{\"quantity\":\"56\",\"particular\":\"test\",\"delivery_date\":\"2020-02-04\",\"delivery_status\":\"0\",\"company_name\":\"Filweb asia inc\",\"received_by\":\"Roel Longcop\"}}', '{\"purchase_order_id\":null,\"quantity\":null,\"particular\":null,\"delivery_date\":null,\"delivery_status\":null,\"company_name\":null,\"received_by\":null,\"no\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/purchase-order/acknowledge-receipt/3', 'acknowledge-receipt', 'purchase-order', 'AcknowledgmentReceipt', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:39:27', '2020-02-28 15:39:27'),
(23, 1, 3, '{\"_csrf\":\"mYY1eBDj0RQTzlZhkwmf8ktfGOYE8FKDI3Bad6tc3KDS7HIzIbaUIkaaBALxetmADCVdlH2JMOR6Ehwzym6N7g==\",\"AcknowledgmentReceipt\":{\"quantity\":\"56\",\"particular\":\"test\",\"delivery_date\":\"2020-02-04\",\"delivery_status\":\"0\",\"company_name\":\"Filweb asia inc\",\"received_by\":\"Roel Longcop\"}}', '{\"served_quantity\":10,\"pending_quantity\":90,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 07:36:28\"}', 'POST', 'http://localhost/kanity_printing/purchase-order/acknowledge-receipt/3', 'acknowledge-receipt', 'purchase-order', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:39:27', '2020-02-28 15:39:27'),
(24, 1, 16, '{\"_csrf\":\"bjoK4U_45oioNdiVYQGAZqaPckdaEpmzruoBOxSgM_klUE2qfq2jvv1hivYDcsYU4fU3NSNr-9T3iEd_dZJitw==\",\"AcknowledgmentReceipt\":{\"quantity\":\"34\",\"particular\":\"qeqw\",\"delivery_date\":\"2020-02-03\",\"delivery_status\":\"0\",\"company_name\":\"Test Company\",\"received_by\":\"Jordan logronio\"}}', '{\"purchase_order_id\":null,\"quantity\":null,\"particular\":null,\"delivery_date\":null,\"delivery_status\":null,\"company_name\":null,\"received_by\":null,\"no\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/purchase-order/acknowledge-receipt/3', 'acknowledge-receipt', 'purchase-order', 'AcknowledgmentReceipt', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:40:15', '2020-02-28 15:40:15'),
(25, 1, 3, '{\"_csrf\":\"bjoK4U_45oioNdiVYQGAZqaPckdaEpmzruoBOxSgM_klUE2qfq2jvv1hivYDcsYU4fU3NSNr-9T3iEd_dZJitw==\",\"AcknowledgmentReceipt\":{\"quantity\":\"34\",\"particular\":\"qeqw\",\"delivery_date\":\"2020-02-03\",\"delivery_status\":\"0\",\"company_name\":\"Test Company\",\"received_by\":\"Jordan logronio\"}}', '{\"served_quantity\":66,\"pending_quantity\":34,\"ar_status\":1,\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 07:39:27\"}', 'POST', 'http://localhost/kanity_printing/purchase-order/acknowledge-receipt/3', 'acknowledge-receipt', 'purchase-order', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:40:15', '2020-02-28 15:40:15'),
(26, 1, 4, '{\"_csrf\":\"TPfBQXptIAU9vonTDUrjWj25Ou2JMTE3HF2cCnOqCA8HnYYKSzhlM2jq27BvOaUoesN_n_BIU1BFP9pOEphZQQ==\",\"SalesInvoice\":{\"purchase_order_id\":\"3\",\"company_name\":\"Filweb asia inc\",\"company_address\":\"232\",\"contact_person\":\"test\",\"pickup_date\":\"2020-02-12\",\"prepared_by\":\"Roel Longcop\",\"noted_by\":\"Joshua Cruz\",\"payment_status\":\"0\"}}', '{\"purchase_order_id\":null,\"company_name\":null,\"company_address\":null,\"contact_person\":null,\"pickup_date\":null,\"prepared_by\":null,\"noted_by\":null,\"payment_status\":null,\"no\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/sales-invoice/create', 'create', 'sales-invoice', 'SalesInvoice', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:43:38', '2020-02-28 15:43:38'),
(27, 1, 5, '{\"_csrf\":\"z-HXF1u8GBi8gKFt0P7s4DN-kqlnDd_uw2sU7WSrhSCEi5BcauldLunU8w6yjaqSdATX2x50vYmaCVKpBZnUbg==\",\"SalesInvoice\":{\"purchase_order_id\":\"3\",\"company_name\":\"Filweb asia inc\",\"company_address\":\"test\",\"contact_person\":\"Jordan logronio\",\"prepared_by\":\"Roel Longcop\",\"noted_by\":\"Joshua Cruz\",\"payment_status\":\"0\"}}', '{\"purchase_order_id\":null,\"company_name\":null,\"company_address\":null,\"contact_person\":null,\"prepared_by\":null,\"noted_by\":null,\"payment_status\":null,\"no\":null,\"created_at\":null,\"updated_at\":null,\"created_by\":null,\"updated_by\":null,\"id\":null}', 'POST', 'http://localhost/kanity_printing/sales-invoice/create', 'create', 'sales-invoice', 'SalesInvoice', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:48:30', '2020-02-28 15:48:30'),
(28, 1, 8, '{\"_csrf\":\"Fmmz47F1s0oTt_zkvNBbwy824BCdiFJf8sVOX1QJbrhdA_SogCD2fEbjrofeox2xaEylYuTxMDirpwgbNTs_9g==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"11\",\"9\",\"10\",\"8\"],\"module_access\":{\"acknowledgment-receipt\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print\"],\"announcement\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"daily-output\":[\"index\",\"view\",\"create\",\"delete\",\"get-job-order\"],\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"add-daily-output\",\"received-scheduled\",\"cancel\",\"update-job-order\"],\"log\":[\"index\",\"view\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"our-equipment\":[\"index\",\"view\"],\"our-portfolio\":[\"index\",\"view\"],\"our-product\":[\"index\",\"view\"],\"our-service\":[\"index\",\"view\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\",\"acknowledge-receipt\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\",\"print\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"sales-invoice\":[\"index\",\"view\",\"print\",\"create\",\"update\",\"delete\",\"get-purchase-order\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"trade-reference\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', '{\"module_access\":\"{\\\"acknowledgment-receipt\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"get-purchase-order\\\",\\\"print\\\"],\\\"announcement\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"daily-output\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"delete\\\",\\\"get-job-order\\\"],\\\"dashboard-carousel\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"dashboard\\\":[\\\"index\\\",\\\"chart\\\"],\\\"equipment-category\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"equipment\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"job-order\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"add-daily-output\\\",\\\"received-scheduled\\\",\\\"cancel\\\",\\\"update-job-order\\\"],\\\"log\\\":[\\\"index\\\",\\\"view\\\"],\\\"mode-of-payment\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"our-equipment\\\":[\\\"index\\\",\\\"view\\\"],\\\"our-portfolio\\\":[\\\"index\\\",\\\"view\\\"],\\\"our-product\\\":[\\\"index\\\",\\\"view\\\"],\\\"our-service\\\":[\\\"index\\\",\\\"view\\\"],\\\"portfolio-category\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"portfolio\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"product\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"profile\\\":[\\\"index\\\",\\\"view\\\",\\\"update\\\",\\\"delete\\\"],\\\"purchase-order\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"create-job-order\\\",\\\"acknowledge-receipt\\\"],\\\"quotation\\\":[\\\"index\\\",\\\"view\\\",\\\"no-bid\\\",\\\"cancel\\\",\\\"set-quotation\\\",\\\"send-po\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"remove-image\\\"],\\\"role\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"sales-invoice\\\":[\\\"index\\\",\\\"view\\\",\\\"print\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"get-purchase-order\\\"],\\\"service\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"setting\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"site\\\":[\\\"index\\\",\\\"login\\\",\\\"logout\\\",\\\"signup\\\",\\\"signup-success\\\",\\\"verification\\\",\\\"home\\\"],\\\"specification\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"trade-reference\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"type-of-service\\\":[\\\"index\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\"],\\\"user\\\":[\\\"index\\\",\\\"my-account\\\",\\\"view\\\",\\\"create\\\",\\\"update\\\",\\\"delete\\\",\\\"create-profile\\\",\\\"view-profile\\\",\\\"my-profile\\\",\\\"build-profile\\\",\\\"update-account\\\"]}\",\"created_at\":\"0000-00-00 00:00:00\",\"updated_at\":\"2020-02-28 07:27:12\"}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-28 15:54:47', '2020-02-28 15:54:47');

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
(3, 12, 'Jordan', 'maestro', 'logronio', 'web designer', 'Filweb asia inc', 'Maharlika Drive #23 Street Governors 34 Lot 2,  San Pedro Laguna', '738930382', 'jordan@gmail.com', '09289927482', '', 0, 1, 1, '0000-00-00 00:00:00', '2020-02-28 13:48:39');

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

--
-- Dumping data for table `kp_purchase_order`
--

INSERT INTO `kp_purchase_order` (`id`, `quotation_id`, `po_no`, `quantity`, `served_quantity`, `pending_quantity`, `customer_note`, `created_by`, `updated_by`, `process_status`, `ar_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '1231231', 11, 11, 0, 'test', 1, 1, 1, 2, 1, '0000-00-00 00:00:00', '2020-02-28 14:30:43'),
(2, 2, '2323', 22, 22, 0, 'test', 1, 1, 1, 2, 1, '0000-00-00 00:00:00', '2020-02-28 14:56:00'),
(3, 3, '4535345', 100, 100, 0, 'test', 1, 1, 0, 2, 1, '0000-00-00 00:00:00', '2020-02-28 15:40:15');

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

--
-- Dumping data for table `kp_quotation`
--

INSERT INTO `kp_quotation` (`id`, `quotation_no`, `user_id`, `process_by`, `specs`, `description`, `quantity`, `pending_quantity`, `mode_of_payment_id`, `images`, `created_by`, `updated_by`, `process_status`, `price_per_piece`, `type_of_service_id`, `note`, `reason`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KPI-Q-00001', 1, 1, 'Fully Sensitized CBS 1 - Regular Paper 95gsm (With Watermark)', '111', 11, 11, 1, '[]', 1, 1, 4, '0.23', 1, 'test', '', 1, '0000-00-00 00:00:00', '2020-02-26 12:39:27'),
(2, 'KPI-Q-00002', 12, 1, 'Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)', 'waeas', 22, 22, 1, '[]', 1, 1, 4, '0.20', 1, 'test', '', 1, '0000-00-00 00:00:00', '2020-02-26 13:20:29'),
(3, 'KPI-Q-00003', 13, 1, 'Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)', 'test', 100, 100, 1, '[\"uploads\\/quotation\\/alyana final.jpg\",\"uploads\\/quotation\\/alyana final2.jpg\"]', 1, 1, 4, '2.20', 2, 'test', '', 1, '0000-00-00 00:00:00', '2020-02-28 15:34:03');

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
(8, 'Super Admin', '{\"acknowledgment-receipt\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"get-purchase-order\",\"print\"],\"announcement\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"daily-output\":[\"index\",\"view\",\"create\",\"delete\",\"get-job-order\"],\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"add-daily-output\",\"received-scheduled\",\"cancel\",\"update-job-order\"],\"log\":[\"index\",\"view\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"our-equipment\":[\"index\",\"view\"],\"our-portfolio\":[\"index\",\"view\"],\"our-product\":[\"index\",\"view\"],\"our-service\":[\"index\",\"view\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\",\"acknowledge-receipt\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\",\"print\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"sales-invoice\":[\"index\",\"view\",\"print\",\"create\",\"update\",\"delete\",\"get-purchase-order\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"trade-reference\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}', '[\"11\",\"9\",\"10\",\"8\"]', 0, 1, 1, '0000-00-00 00:00:00', '2020-02-28 15:54:47'),
(9, 'Customer', '{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"cancel\",\"send-po\",\"create\",\"update\",\"remove-image\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}', '[]', 0, 1, 1, '0000-00-00 00:00:00', '2020-02-24 03:45:28'),
(10, 'Finance', '{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}', '[]', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-21 12:10:49'),
(11, 'Administrator', '{\"acknowledgment-receipt\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"get-purchase-order\"],\"announcement\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"daily-output\":[\"index\",\"view\",\"create\",\"delete\",\"get-job-order\"],\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"add-daily-output\",\"received-scheduled\",\"cancel\",\"update-job-order\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"our-equipment\":[\"index\",\"view\"],\"our-portfolio\":[\"index\",\"view\"],\"our-product\":[\"index\",\"view\"],\"our-service\":[\"index\",\"view\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\",\"acknowledge-receipt\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"sales-invoice\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"trade-reference\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}', '[\"9\",\"10\"]', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-28 10:39:52');

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
  `contact_person` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_sales_invoice`
--

INSERT INTO `kp_sales_invoice` (`id`, `purchase_order_id`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`, `no`, `pickup_date`, `prepared_by`, `noted_by`, `payment_status`, `company_name`, `company_address`, `contact_person`) VALUES
(1, 2, 1, 1, 0, '0000-00-00 00:00:00', '2020-02-28 13:46:40', '00001', '2020-02-20', 'test', 'test', 0, 'FAI', 'San Pedro', 'Jordan logronio'),
(2, 2, 1, 1, 0, '0000-00-00 00:00:00', '2020-02-28 13:47:47', '00002', '2020-02-14', 'Roel Longcop', 'Joshua Cruz', 0, 'FAI', 'San Pedro', 'Jordan logronio'),
(3, 2, 1, 1, 1, '2020-02-28 13:49:01', '2020-02-28 13:49:01', '00003', '2020-02-20', 'Roel Longcop', 'Joshua Cruz', 0, 'Filweb asia inc', 'Maharlika Drive #23 Street Governors 34 Lot 2,  San Pedro Laguna', 'Jordan logronio'),
(4, 3, 1, 1, 1, '2020-02-28 15:43:38', '2020-02-28 15:43:38', 'SI-00004', '2020-02-12', 'Roel Longcop', 'Joshua Cruz', 0, 'Filweb asia inc', '232', 'test'),
(5, 3, 1, 1, 1, '2020-02-28 15:48:30', '2020-02-28 15:48:30', 'SI-00005', '0000-00-00', 'Roel Longcop', 'Joshua Cruz', 0, 'Filweb asia inc', 'test', 'Jordan logronio');

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
  `ar_no_prefix` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_setting`
--

INSERT INTO `kp_setting` (`id`, `created_by`, `updated_by`, `default_role`, `pagination`, `timezone`, `quotation_no_padding`, `quotation_no_prefix`, `status`, `created_at`, `updated_at`, `jo_no_padding`, `jo_no_prefix`, `company_name`, `company_address`, `company_tag_line`, `company_description`, `form_of_business`, `line_of_business`, `company_phone_no`, `company_fax_no`, `company_logo`, `tin`, `reg_no`, `twitter`, `facebook`, `google`, `email`, `notification_pages`, `si_no_padding`, `si_no_prefix`, `ar_no_padding`, `ar_no_prefix`) VALUES
(1, 1, 1, 9, 10, 'America/Boise', 5, 'KPI-Q-', 1, '0000-00-00 00:00:00', '2020-02-28 15:20:23', 5, 'JO-', 'Kanity Printing INC', '123 Business Way San Francisco, CA 94108 USA', 'We strive to deliver a level of service that exceeds the expectations of our customers.', 'If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.', 'Incorporated', 'Commercial Printing', '(888) 123-4567', '(887) 123-4567', 'uploads/setting/company_logo/logo.jpg', '008-843-616', 'CS201416033', '', '', '', '', '[[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"],[\"11\",\"9\",\"10\",\"8\"],[\"11\",\"9\",\"8\"]]', 5, 'SI-', 5, 'AR-');

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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_user`
--

INSERT INTO `kp_user` (`id`, `role_id`, `created_by`, `updated_by`, `username`, `password`, `authkey`, `access_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 0, 1, 'admin', '$2y$13$hLRViCjkwFHilPqBIAZR7uRAdQMSb2Mysz9eHD2elAqk5oX.y/u/K', '4EWMCIOKOY', 'LNSCOTEFYO', 1, '2020-02-18 06:30:18', '2020-02-20 01:01:01'),
(11, 9, 1, 1, 'roel', '$2y$13$deU9JpFqywD.ZDu1FUHm9.TiTnNR5zihaus0xOD1KmQesk7aZLLC.', 'GJLQX2AQOI', 'RRPVG3INCZ', 1, '0000-00-00 00:00:00', '2020-02-24 02:23:04'),
(12, 9, 0, 0, 'jordan', '$2y$13$7eYX0yoB8GxKUhiEiSyuROvOvDFY/Q5bXjAoFprX2b7EN84jcGV9i', 'E3HMALUZQA', 'KELSWLMM2R', 1, '0000-00-00 00:00:00', '2020-02-24 13:07:32'),
(13, 11, 1, 1, 'aaaaa', '$2y$13$QE98SxHZEYtoNjj7SasMRO8U6eFo3BmjwdtD5SASB21Rp160.fdxC', 'SNZQX8TQWA', 'SIQMNOR_BM', 1, '2020-02-26 14:50:55', '2020-02-26 14:50:55');

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
  ADD KEY `updated_by` (`updated_by`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kp_announcement`
--
ALTER TABLE `kp_announcement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kp_daily_output`
--
ALTER TABLE `kp_daily_output`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_log`
--
ALTER TABLE `kp_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `kp_mode_of_payment`
--
ALTER TABLE `kp_mode_of_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_purchase_order`
--
ALTER TABLE `kp_purchase_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_quotation`
--
ALTER TABLE `kp_quotation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_role`
--
ALTER TABLE `kp_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kp_sales_invoice`
--
ALTER TABLE `kp_sales_invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
