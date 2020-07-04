-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2020 at 01:48 AM
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
-- Table structure for table `kp_announcement`
--

CREATE TABLE `kp_announcement` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_announcement`
--

INSERT INTO `kp_announcement` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', 1, 1, 1, '2020-02-24 08:42:18', '2020-02-24 08:42:18');

-- --------------------------------------------------------

--
-- Table structure for table `kp_dashboard_carousel`
--

CREATE TABLE `kp_dashboard_carousel` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `image` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
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
  `id` int(11) NOT NULL,
  `equipment_category_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(256) NOT NULL,
  `tag_line` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
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
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
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
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL DEFAULT '0',
  `jo_no` varchar(64) NOT NULL,
  `note` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `process_status` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_job_order`
--

INSERT INTO `kp_job_order` (`id`, `purchase_order_id`, `jo_no`, `note`, `created_by`, `updated_by`, `process_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'KPI-JO-00001', 'test', 1, 1, 0, 1, '2020-02-23 09:29:29', '2020-02-23 09:29:29'),
(4, 2, 'KPI-JO-00002', 'test', 1, 1, 0, 1, '2020-02-24 02:15:44', '2020-02-24 02:15:44'),
(5, 3, 'KPI-JO-00005', 'test', 1, 1, 0, 1, '2020-02-24 03:06:19', '2020-02-24 03:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `kp_log`
--

CREATE TABLE `kp_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `request_data` text NOT NULL,
  `method` varchar(32) NOT NULL,
  `url` text NOT NULL,
  `action` varchar(64) NOT NULL,
  `controller` varchar(64) NOT NULL,
  `model` varchar(64) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `user_agent` text NOT NULL,
  `ip` varchar(32) NOT NULL,
  `browser` varchar(64) NOT NULL,
  `os` varchar(64) NOT NULL,
  `device` varchar(64) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_log`
--

INSERT INTO `kp_log` (`id`, `user_id`, `ref_id`, `request_data`, `method`, `url`, `action`, `controller`, `model`, `created_by`, `updated_by`, `user_agent`, `ip`, `browser`, `os`, `device`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 11, '', '', '', 'create', 'user', 'User', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:05:33', '2020-02-21 12:05:33'),
(2, 1, 1, '', '', '', 'create-profile', 'user', 'Profile', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:07:03', '2020-02-21 12:07:03'),
(3, 1, 1, '', '', '', 'delete', 'profile', 'Profile', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:07:45', '2020-02-21 12:07:45'),
(4, 1, 1, '', '', '', 'delete', 'profile', 'Profile', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:08:46', '2020-02-21 12:08:46'),
(5, 1, 11, '', '', '', 'delete', 'user', 'User', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:09:51', '2020-02-21 12:09:51'),
(6, 1, 10, '', '', '', 'create', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:10:42', '2020-02-21 12:10:42'),
(7, 1, 10, '', '', '', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:10:49', '2020-02-21 12:10:49'),
(8, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:10:57', '2020-02-21 12:10:57'),
(9, 1, 1, '', '', '', 'create', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:12:21', '2020-02-21 12:12:21'),
(10, 1, 2, '', '', '', 'create', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:12:30', '2020-02-21 12:12:30'),
(11, 1, 1, '', '', '', 'create', 'portfolio-category', 'PortfolioCategory', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:12:44', '2020-02-21 12:12:44'),
(12, 1, 1, '', '', '', 'create', 'portfolio', 'Portfolio', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:13:09', '2020-02-21 12:13:09'),
(13, 1, 1, '', '', '', 'update', 'portfolio', 'Portfolio', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:13:14', '2020-02-21 12:13:14'),
(14, 1, 1, '', '', '', 'create', 'service', 'Service', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:13:31', '2020-02-21 12:13:31'),
(15, 1, 1, '', '', '', 'update', 'service', 'Service', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:13:36', '2020-02-21 12:13:36'),
(16, 1, 1, '', '', '', 'create', 'product', 'Product', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:14:09', '2020-02-21 12:14:09'),
(17, 1, 1, '', '', '', 'update', 'product', 'Product', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:14:15', '2020-02-21 12:14:15'),
(18, 1, 1, '', '', '', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:15:08', '2020-02-21 12:15:08'),
(19, 1, 1, '', '', '', 'remove-image', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:15:15', '2020-02-21 12:15:15'),
(20, 1, 1, '', '', '', 'remove-image', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:15:21', '2020-02-21 12:15:21'),
(21, 1, 1, '', '', '', 'remove-image', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:16:26', '2020-02-21 12:16:26'),
(22, 1, 1, '', '', '', 'update', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:16:28', '2020-02-21 12:16:28'),
(23, 1, 8, '', '', '', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:27:50', '2020-02-21 12:27:50'),
(24, 1, 1, '', '', '', 'create', 'specification', 'Specification', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:28:56', '2020-02-21 12:28:56'),
(25, 1, 2, '', '', '', 'create', 'specification', 'Specification', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:35:09', '2020-02-21 12:35:09'),
(26, 1, 3, '', '', '', 'create', 'specification', 'Specification', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:35:26', '2020-02-21 12:35:26'),
(27, 1, 4, '', '', '', 'create', 'specification', 'Specification', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:35:44', '2020-02-21 12:35:44'),
(28, 1, 5, '', '', '', 'create', 'specification', 'Specification', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:36:14', '2020-02-21 12:36:14'),
(29, 1, 6, '', '', '', 'create', 'specification', 'Specification', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:36:33', '2020-02-21 12:36:33'),
(30, 1, 7, '', '', '', 'create', 'specification', 'Specification', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:36:49', '2020-02-21 12:36:49'),
(31, 1, 8, '', '', '', 'create', 'specification', 'Specification', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-21 12:37:03', '2020-02-21 12:37:03'),
(32, 1, 2, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:30:04', '2020-02-22 10:30:04'),
(33, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:30:31', '2020-02-22 10:30:31'),
(34, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:32:05', '2020-02-22 10:32:05'),
(35, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:32:24', '2020-02-22 10:32:24'),
(36, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:32:41', '2020-02-22 10:32:41'),
(37, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:33:07', '2020-02-22 10:33:07'),
(38, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:33:12', '2020-02-22 10:33:12'),
(39, 1, 2, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:34:01', '2020-02-22 10:34:01'),
(40, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:35:39', '2020-02-22 10:35:39'),
(41, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:38:07', '2020-02-22 10:38:07'),
(42, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:40:25', '2020-02-22 10:40:25'),
(43, 1, 2, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:40:42', '2020-02-22 10:40:42'),
(44, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:41:08', '2020-02-22 10:41:08'),
(45, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:41:29', '2020-02-22 10:41:29'),
(46, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:41:42', '2020-02-22 10:41:42'),
(47, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:41:59', '2020-02-22 10:41:59'),
(48, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:42:05', '2020-02-22 10:42:05'),
(49, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:42:26', '2020-02-22 10:42:26'),
(50, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:42:32', '2020-02-22 10:42:32'),
(51, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:43:46', '2020-02-22 10:43:46'),
(52, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:44:10', '2020-02-22 10:44:10'),
(53, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:44:29', '2020-02-22 10:44:29'),
(54, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:45:16', '2020-02-22 10:45:16'),
(55, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:46:40', '2020-02-22 10:46:40'),
(56, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:47:40', '2020-02-22 10:47:40'),
(57, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:48:13', '2020-02-22 10:48:13'),
(58, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:48:39', '2020-02-22 10:48:39'),
(59, 1, 3, '', '', '', 'create', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:51:11', '2020-02-22 10:51:11'),
(60, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:54:34', '2020-02-22 10:54:34'),
(61, 1, 2, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:54:40', '2020-02-22 10:54:40'),
(62, 1, 3, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:58:23', '2020-02-22 10:58:23'),
(63, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 10:59:49', '2020-02-22 10:59:49'),
(64, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:03:15', '2020-02-22 11:03:15'),
(65, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:03:45', '2020-02-22 11:03:45'),
(66, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:04:00', '2020-02-22 11:04:00'),
(67, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:04:14', '2020-02-22 11:04:14'),
(68, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:05:26', '2020-02-22 11:05:26'),
(69, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:06:57', '2020-02-22 11:06:57'),
(70, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:09:14', '2020-02-22 11:09:14'),
(71, 1, 2, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:09:23', '2020-02-22 11:09:23'),
(72, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:15:06', '2020-02-22 11:15:06'),
(73, 1, 1, '', '', '', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:16:31', '2020-02-22 11:16:31'),
(74, 1, 1, '', '', '', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:16:39', '2020-02-22 11:16:39'),
(75, 1, 1, '', '', '', 'delete', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:18:32', '2020-02-22 11:18:32'),
(76, 1, 2, '', '', '', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:18:51', '2020-02-22 11:18:51'),
(77, 1, 1, '{\"_csrf\":\"oEnTPtdy3JCzLDDmZxN98cHZDPT-f-_HvBcn2q6LblnHPaBLjQKx2tdHZKcMIxGwoqw_rKgbqpXwQVG1n_I6Ng==\",\"PortfolioCategory\":{\"name\":\"Category 1\",\"description\":\"Category 1\"}}', 'POST', 'http://localhost/kanity_printing/portfolio-category/update/1', 'update', 'portfolio-category', 'PortfolioCategory', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:23:49', '2020-02-22 11:23:49'),
(78, 1, 1, '{\"_csrf\":\"uZFc0JIhsALGCae7y4O0fBdnrhvHSkFliG0B22F4lkve5S-lyFHdSKJi8_qgs9g9dBKdQ5EuBDfEO3e0UAHCJA==\",\"ModeOfPayment\":{\"name\":\"Cash\\/Cheque On Delivery\",\"description\":\"Cash\\/Cheque On Delivery\"}}', 'POST', 'http://localhost/kanity_printing/mode-of-payment/update/1', 'update', 'mode-of-payment', 'ModeOfPayment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:34:54', '2020-02-22 11:34:54'),
(79, 1, 1, '{\"_csrf\":\"eXj58w2woEaGs9dEoBB7DqnJwQdU7GfAfsxhYOF4y-MeDIqGV8DNDOLYgwXLIBdPyrzyXwKIIpIymhcP0AGfjA==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/New_York\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-[no]\"}}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:42:58', '2020-02-22 11:42:58'),
(80, 1, 2, '{\"_csrf\":\"whgkld996zLUWmdEYFVdM56iMbKRQJZ822fCi6WaCTilbFfghQ2GeLAxMwULZTFy_dcC6sck0y6XMbTklONdVw==\",\"Quotation\":{\"user_id\":\"11\",\"quantity\":\"2323\",\"mode_of_payment\":\"1\",\"specs\":\"Fully Sensitized CBS 1 - Regular Paper 95gsm (With Watermark)\",\"description\":\"23123\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/update/2', 'update', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:47:52', '2020-02-22 11:47:52'),
(81, 1, 2, '{\"_csrf\":\"18jKCr4GwMpxExs3BYTcq0IznIuqj1h_Kuos_-lIZyiwvLl_5HatgBV4T3ZutLDqIUav0_zrHS1mvFqQ2DEzRw==\",\"Quotation\":{\"user_id\":\"11\",\"quantity\":\"2323\",\"mode_of_payment\":\"1\",\"specs\":\"Fully Sensitized CBS 1 - Regular Paper 95gsm (With Watermark)\",\"description\":\"23123\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/update/2', 'update', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:49:48', '2020-02-22 11:49:48'),
(82, 1, 1, '{\"_csrf\":\"1K1PJ4ydduxkfFOArbLYVAlHYkad_0bUhis2iCS8CWOz2TxS1u0bpgAXB8HGgrQVajJRHsubA4bKfUDnFcVdDA==\",\"Quotation\":{\"user_id\":\"11\",\"quantity\":\"12\",\"mode_of_payment\":\"1\",\"specs\":\"test\",\"description\":\"test\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/update/1', 'update', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:50:37', '2020-02-22 11:50:37'),
(83, 1, 3, '{\"_csrf\":\"_P3sIQvsJFV_NP6M11gfJzOOa7UZxBMQE7Mj04dR0A6biZ9UUZxJHxtfqs28aHNmUPtY7U-gVkJf5VW8tiiEYQ==\",\"Quotation\":{\"user_id\":\"1\",\"quantity\":\"22\",\"mode_of_payment\":\"2\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)\",\"description\":\"test\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:53:55', '2020-02-22 11:53:55'),
(84, 1, 4, '{\"_csrf\":\"_b9wut_EcpXudSrdvWPVadoXlBj9MqR0ggoicIpVdnuaywPPhbQf34oefpzWU7kouWKnQKtW4SbOXFQfuywiFA==\",\"Quotation\":{\"user_id\":\"11\",\"quantity\":\"22\",\"mode_of_payment\":\"1\",\"specs\":\"Fully Sensitized CBS 1 - Regular Paper 95gsm (Without Watermark)\",\"description\":\"422\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:54:13', '2020-02-22 11:54:13'),
(85, 1, 5, '{\"_csrf\":\"dllpPqIJUMh4s2k0nKOF9guu0zTYk5bOC7pzAtzveXMRLRpL-Hk9ghzYPXX3k-m3aNvgbI7305xH7AVt7ZYtHA==\",\"Quotation\":{\"user_id\":\"1\",\"quantity\":\"132\",\"mode_of_payment\":\"1\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 95gsm (With Watermark)\",\"description\":\"123\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:56:19', '2020-02-22 11:56:19'),
(86, 1, 1, '{\"_csrf\":\"2rmb46gtcVPYDPNvfgS-5JZpnMtWAFIsdAZM19zPPWW9zeiW8l0cGbxnpy4VNNKl9RyvkwBkF344UDq47bZpCg==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/New_York\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-\"}}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:56:44', '2020-02-22 11:56:44'),
(87, 1, 1, '{\"_csrf\":\"Bk5eNZEYHihhP0XJynnHeRzN_Q7N11RSx30Z4sRy47hhOi1Ay2hzYgVUEYihSas4f7jOVpuzEQCLK2-N9Qu31w==\",\"Quotation\":{\"user_id\":\"1\",\"quantity\":\"100\",\"mode_of_payment\":\"1\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\\r\\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\\r\\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\\r\\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\\r\\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 11:57:27', '2020-02-22 11:57:27'),
(88, 1, 2, '{\"_csrf\":\"XaU9J1ewt6ZRu8RvIBMHzfvSIj27Vo7WJAVWmhFcLa060U5SDcDa7DXQkC5LI2uMmKcRZe0yy4RoUyD1ICV5wg==\",\"Profile\":{\"last_name\":\"Doe\",\"middle_name\":\"Hello\",\"first_name\":\"John\",\"email\":\"john@gmail.com\",\"contact_number\":\"0923842237\",\"tin\":\"83474383429\",\"company_name\":\"Test Company\",\"position\":\"CEO\",\"company_address\":\"United States America\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/user/create-profile/1', 'create-profile', 'user', 'Profile', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 12:08:31', '2020-02-22 12:08:31'),
(89, 1, 1, '{\"_csrf\":\"umzfHyqJQqQtmq-gcSHMEWaoHeLTr-D78HjmHQmrrgDdGKxqcPkv7knx--EaEaBQBd0uuoXLpam8LpByONL6bw==\",\"Quotation\":{\"user_id\":\"1\",\"quantity\":\"100\",\"mode_of_payment\":\"1\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/update/1', 'update', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 12:16:34', '2020-02-22 12:16:34'),
(90, 1, 1, '{\"_csrf\":\"Y9WiOVw1-bkoviX2CW2KruaisUU17tuQEQj-iid7mFUEodFMBkWU80zVcbdiXebvhdeCHWOKnsJdXojlFgLMOg==\",\"Quotation\":{\"user_id\":\"1\",\"quantity\":\"100\",\"mode_of_payment\":\"1\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/update/1', 'update', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 12:26:35', '2020-02-22 12:26:35'),
(91, 1, 1, '{\"_csrf\":\"s3c85-ZtOergDyPQwfmYUiXKuoouxfR9Ihyx1IKGc7b2GQyztjRJurN-T5qTs_1gQIHt3kKhlzpKZu692s9C6Q==\",\"Quotation\":{\"price_per_piece\":\"0.00\",\"type_of_service_id\":\"0\"}}', 'POST', 'http://localhost/kanity_printing/quotation/view/1', 'view', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:33:34', '2020-02-22 13:33:34'),
(92, 1, 8, '{\"_csrf\":\"wZszy3CMm5JXVc741HyBHZjlg7BTc6WHrHFTe1_e5kCE9QOfINXrwgQkorKGNuQv_a7U5D8XxsDECwwSB5fXHw==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"set-quotation\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:35:38', '2020-02-22 13:35:38'),
(93, 1, 1, '{\"_csrf\":\"oag1s__K5P4hIU5Q6Qa31Qq6uRhda_bRye9LqVXA4HvkxgXnr5OUrnJQIhq7TNLnb_HuTDEPlZahlRTADYnRJA==\",\"Quotation\":{\"price_per_piece\":\"0.00\",\"type_of_service_id\":\"0\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/1', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:35:44', '2020-02-22 13:35:44'),
(94, 1, 1, '{\"_csrf\":\"hwcetRdGA9O-SdUYOuH2_k99k3LaH64KC1-XvAkjI-HCaS7hRx9zg-04uVJoq5PMKjbEJrZ7zU1jJcjVUWoSvg==\",\"Quotation\":{\"price_per_piece\":\"0.00\",\"type_of_service_id\":\"0\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/1', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:36:55', '2020-02-22 13:36:55'),
(95, 1, 8, '{\"_csrf\":\"BcPVWoQA41zb5DW-YXmmTSN2elrmkcU6R7iF5QDr8PhAreUO1FmTDIiVWfQzM8N_Rj0tDor1pn0vwtqMWKLBpw==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"set-quotation\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:38:59', '2020-02-22 13:38:59'),
(96, 1, 8, '{\"_csrf\":\"zXBAg01i_FIo-h9jrwPFxxkX9AMWi2KMBAvnN08YHBqIHnDXHTuMAnuLcyn9SaD1fFyjV3rvActscbheF1EtRQ==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"set-quotation\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:40:33', '2020-02-22 13:40:33'),
(97, 1, 1, '[]', 'GET', 'http://localhost/kanity_printing/quotation/no-bid/1', 'no-bid', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:41:02', '2020-02-22 13:41:02'),
(98, 1, 1, '{\"_csrf\":\"N-QFUek7yOyGP9gSQXdGb0Mb_OBQ7nXAxht5VCoOo3RyijUFuWK4vNVOtFgTPSNdJlCrtDyKFoeuYSY9ckeSKw==\",\"Quotation\":{\"price_per_piece\":\"122\",\"type_of_service_id\":\"32\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/1', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:43:32', '2020-02-22 13:43:32'),
(99, 1, 8, '{\"_csrf\":\"ZbGUtsvVl0_SDyGWrIOIqru5WW75ES2B89wUTUTiPDwg36Tim4znH4F-Tdz-ye2Y3vIOOpV1TsabpkskHKsNYw==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:46:29', '2020-02-22 13:46:29'),
(100, 1, 8, '{\"_csrf\":\"skV6fo4MZz4E_P2FVSZmWMlaXGhXKzmu41iol_xC6hD3K0oq3lUXbleNkc8HbANqrBELPDtPWumLIvf-pAvbTw==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"create\",\"update\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:46:54', '2020-02-22 13:46:54'),
(101, 1, 1, '[]', 'GET', 'http://localhost/kanity_printing/quotation/cancel/1', 'cancel', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:46:59', '2020-02-22 13:46:59'),
(102, 1, 1, '{\"_csrf\":\"2r96NLkxvslcjkdO3VagfSvHhnYEfNTsVvqDlIF3cIef0Upg6WjOmQ__KwSPHMVPTozRImgYt6s-gNz92T5B2A==\",\"Quotation\":{\"user_id\":\"11\",\"quantity\":\"100\",\"mode_of_payment\":\"1\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/update/1', 'update', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:47:22', '2020-02-22 13:47:22'),
(103, 1, 1, '[]', 'GET', 'http://localhost/kanity_printing/quotation/no-bid/1', 'no-bid', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:47:33', '2020-02-22 13:47:33'),
(104, 1, 8, '{\"_csrf\":\"Eg8MInpiuEuQlU87nFzGC9wYmqyNRBzYOrgwufwbpQ5XYTx2KjvIG8PkI3HOFqM5uVPN-OEgf59Swm_QpFKUUQ==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"create\",\"update\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:53:12', '2020-02-22 13:53:12'),
(105, 1, 1, '{\"_csrf\":\"CUc9fX9P-Lm64s37SHQfqAQ9dRxI4G1BjczHG-JlBphMKQ0pLxaI6emTobEaPnqaYXYiSCSEDgbltphyuiw3xw==\",\"TypeOfService\":{\"name\":\"test\",\"description\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/type-of-service/create', 'create', 'type-of-service', 'TypeOfService', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:53:39', '2020-02-22 13:53:39'),
(106, 1, 1, '{\"_csrf\":\"C8RlE12X9WoRtCj-3iXuI8vFeDTVaJUDaEFkJK0nR45OqlVHDc6FOkLFRLSMb4sRro4vYLkM9kQAOztN9W520Q==\",\"Quotation\":{\"price_per_piece\":\"122.00\",\"type_of_service_id\":\"1\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/1', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 13:58:11', '2020-02-22 13:58:11'),
(107, 1, 1, '{\"_csrf\":\"45G57wgr27ZdPcEF5u1k9UannPzCusGu9_R0UmUZt6ym_4m7WHKr5g5MrU-0pwHHI-zLqK7eoumfjis7PVCG8w==\",\"TypeOfService\":{\"name\":\"Complete Service\",\"description\":\"Complete Service\\r\\n\"}}', 'POST', 'http://localhost/kanity_printing/type-of-service/update/1', 'update', 'type-of-service', 'TypeOfService', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:00:37', '2020-02-22 14:00:37'),
(108, 1, 2, '{\"_csrf\":\"VZ_qgXg7YaJuLxE3-mJDGWSxwCl2DAnsz_tJy2ypr_4Q8drVKGIR8j1efX2oKCYrAfqXfRpoaqungRaiNOCeoQ==\",\"TypeOfService\":{\"name\":\"Partial Service\",\"description\":\"Partial Service\"}}', 'POST', 'http://localhost/kanity_printing/type-of-service/create', 'create', 'type-of-service', 'TypeOfService', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:00:46', '2020-02-22 14:00:46'),
(109, 1, 2, '{\"_csrf\":\"N8RPexY-24gSOUD83VWz9X3mH0E1HEHnHrUltDGueOxyqn8vRmer2EFILLaPH9bHGK1IFVl4IqB2z3rdaedJsw==\",\"Quotation\":{\"user_id\":\"11\",\"quantity\":\"22\",\"mode_of_payment\":\"2\",\"specs\":\"Fully Sensitized CBS 1 - Regular Paper 80gsm (Without Watermark)\",\"description\":\"test\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:01:05', '2020-02-22 14:01:05'),
(110, 1, 2, '{\"_csrf\":\"oUhuG_82V74n5YG0bMNFI5-Hk33nItUEnzUVYL1ao0PkJl5Pr28n7nSU7f4-iSAR-szEKYtGtkP3T0oJ5ROSHA==\",\"Quotation\":{\"price_per_piece\":\"5200\",\"type_of_service_id\":\"2\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/2', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:07:10', '2020-02-22 14:07:10'),
(111, 1, 1, '[]', 'GET', 'http://localhost/kanity_printing/quotation/no-bid/1', 'no-bid', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:08:27', '2020-02-22 14:08:27'),
(112, 1, 1, '{\"_csrf\":\"2G1N-b1bp6L-NB8V0c6QKVTbn7mh5irYeejOQlbFhWedA32t7QLX8q1Fc1-DhPUbMZDI7c2CSZ8RkpErDoy0OA==\",\"Quotation\":{\"price_per_piece\":\"122.00\",\"type_of_service_id\":\"1\",\"note\":\"please this is a test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/1', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:26:33', '2020-02-22 14:26:33'),
(113, 1, 8, '{\"_csrf\":\"PAf02eYK_vNqxexGAa82j1h6mA12MYVarNLcR_Yk6Q95acSNtlOOozm0gAxT5VO9PTHPWRpV5h3EqIMurm3YUA==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:34:43', '2020-02-22 14:34:43');
INSERT INTO `kp_log` (`id`, `user_id`, `ref_id`, `request_data`, `method`, `url`, `action`, `controller`, `model`, `created_by`, `updated_by`, `user_agent`, `ip`, `browser`, `os`, `device`, `status`, `created_at`, `updated_at`) VALUES
(114, 1, 8, '{\"_csrf\":\"p0YeTRvcjcWmPE0GzXfa__yq5PO3okrpkCuNt5PhyLviKC4ZS4X9lfVNIUyfPb_NmeGzp9vGKa74UdLey6j55A==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:35:50', '2020-02-22 14:35:50'),
(115, 1, 1, '{\"_csrf\":\"R3Bj8q7cC-OVKFSYoekIXXu-ZTiEOh6xYvfHfm8zSjcCHlOm_oV7s8ZZONLzo21vHvUybOheffYKjZgXN3p7aA==\",\"Quotation\":{\"po_no\":\"2321\",\"customer_note\":\"3123\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/1', 'send-po', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:43:02', '2020-02-22 14:43:02'),
(116, 1, 1, '{\"id\":\"1\",\"path\":\"uploads\\/quotation\\/58887d11bc2fc2ef3a186076.png\",\"key\":\"2\"}', 'POST', 'http://localhost/kanity_printing/quotation/remove-image', 'remove-image', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:44:44', '2020-02-22 14:44:44'),
(117, 1, 1, '{\"_csrf\":\"cnMzkPHurck6MRTSx4jQcG9jeCRVDDMIkf1asoDvI6k3HQPEobfdmWlAeJiVwrVCCigvcDloUE_5hwXb2KYS9g==\",\"Quotation\":{\"user_id\":\"11\",\"quantity\":\"100\",\"mode_of_payment\":\"1\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/update/1', 'update', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:44:46', '2020-02-22 14:44:46'),
(118, 1, 2, '{\"_csrf\":\"xNCD_0xC8CdwgF3M2JHbwq0PLAllvV5n10XHZ9Nz7FmBvrOrHBuAdyPxMYaK277wyER7XQnZPSC_P5gOizrdBg==\",\"PurchaseOrder\":{\"po_no\":\"343243\",\"customer_note\":\"taest\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/2', 'send-po', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:58:25', '2020-02-22 14:58:25'),
(119, 1, 2, '{\"_csrf\":\"xNCD_0xC8CdwgF3M2JHbwq0PLAllvV5n10XHZ9Nz7FmBvrOrHBuAdyPxMYaK277wyER7XQnZPSC_P5gOizrdBg==\",\"PurchaseOrder\":{\"po_no\":\"343243\",\"customer_note\":\"taest\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/2', 'send-po', 'quotation', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 14:58:25', '2020-02-22 14:58:25'),
(120, 1, 2, '{\"_csrf\":\"myhboslJ3qpWbyct1t2kA2DmJG0mz_g0SWCzC1amprDeRmv2mRCu-gUeS2eEl8ExBa1zOUqrm3MhGuxiDu-X7w==\",\"PurchaseOrder\":{\"po_no\":\"123\",\"customer_note\":\"123123\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/2', 'send-po', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:00:16', '2020-02-22 15:00:16'),
(121, 1, 2, '{\"_csrf\":\"-XwFqYJho6hLS3JdpmCZ7O-hIkqtfI0BTLUflfVFzHi8EjX90jjT-Bg6Hhf0Kvzeiup1HsEY7kYkz0D8rQz9Jw==\",\"PurchaseOrder\":{\"po_no\":\"12321\",\"customer_note\":\"saddasd\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/2', 'send-po', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:01:26', '2020-02-22 15:01:26'),
(122, 1, 3, '{\"_csrf\":\"VFKLu-BP7IkMlv-TmUVCLqeuZOQ7V0dKKj2BF8duNT4RPLvvsBac2V_nk9nLDyccwuUzsFczJA1CR95-nycEYQ==\",\"PurchaseOrder\":{\"po_no\":\"3242\",\"customer_note\":\"42342342\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/2', 'send-po', 'quotation', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:04:33', '2020-02-22 15:04:33'),
(123, 1, 2, '{\"_csrf\":\"VFKLu-BP7IkMlv-TmUVCLqeuZOQ7V0dKKj2BF8duNT4RPLvvsBac2V_nk9nLDyccwuUzsFczJA1CR95-nycEYQ==\",\"PurchaseOrder\":{\"po_no\":\"3242\",\"customer_note\":\"42342342\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/2', 'send-po', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:04:33', '2020-02-22 15:04:33'),
(124, 1, 8, '{\"_csrf\":\"bUnJok-cH-dwmu4ETYblYfEx1MNUT5AYh5MPxWI7z4MoJ_n2H8VvtyPrgk4fzIBTlHqDlzgr81_v6VCsOnL-3A==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:07:37', '2020-02-22 15:07:37'),
(125, 1, 3, '{\"_csrf\":\"0bBtdBDGC-eTbEzgTbg7orcOnhbUsi8B9Z3g7ylzVxaU3l0gQJ97t8AdIKof8l6Q0kXJQrjWTEad57-GcTpmSQ==\",\"Quotation\":{\"user_id\":\"1\",\"quantity\":\"233\",\"mode_of_payment\":\"1\",\"specs\":\"Fully Sensitized CBS 1 - Regular Paper 80gsm (Without Watermark)\",\"description\":\"231\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:31:34', '2020-02-22 15:31:34'),
(126, 1, 3, '{\"_csrf\":\"t8CeEDrnaBluiAoRzXXa-fflchAYSpe3-qNFTrpVdpvyrq5Ear4YST35ZlufP7_Lkq4lRHQu9PCS2Ron4hxHxA==\",\"Quotation\":{\"price_per_piece\":\"232\",\"type_of_service_id\":\"2\",\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/3', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:32:08', '2020-02-22 15:32:08'),
(127, 1, 4, '{\"_csrf\":\"17BvTViqcuyvKSXKFJiVoDIfJABTQ-TOMM8aOsCp5_aS3l8ZCPMCvPxYSYBG0vCSV1RzVD8nh4lYtUVTmODWqQ==\",\"PurchaseOrder\":{\"po_no\":\"test\",\"customer_note\":\"eqeqw\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/3', 'send-po', 'quotation', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:32:18', '2020-02-22 15:32:18'),
(128, 1, 3, '{\"_csrf\":\"17BvTViqcuyvKSXKFJiVoDIfJABTQ-TOMM8aOsCp5_aS3l8ZCPMCvPxYSYBG0vCSV1RzVD8nh4lYtUVTmODWqQ==\",\"PurchaseOrder\":{\"po_no\":\"test\",\"customer_note\":\"eqeqw\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/3', 'send-po', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:32:18', '2020-02-22 15:32:18'),
(129, 1, 4, '{\"_csrf\":\"OrHr-J4ucdlS9xo_YGoL3o5F35eDuwB8Fdmcnu9CHWF_39uszncBiQGGdnUyIG7s6w6Iw-_fYzt9o8P3twssPg==\",\"Quotation\":{\"user_id\":\"1\",\"quantity\":\"2312\",\"mode_of_payment\":\"2\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)\",\"description\":\"323\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:32:41', '2020-02-22 15:32:41'),
(130, 1, 4, '[]', 'GET', 'http://localhost/kanity_printing/quotation/no-bid/4', 'no-bid', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:33:14', '2020-02-22 15:33:14'),
(131, 1, 2, '{\"_csrf\":\"zi2tBt7qTAXM6qBPuGAwhslEv0z1Mr7B7Nk_yFtkjPaLQ51SjrM8VZ-bzAXqKlW0rA_oGJlW3YaEo2ChAy29qQ==\",\"Profile\":{\"last_name\":\"Doe\",\"middle_name\":\"Hello\",\"first_name\":\"John\",\"email\":\"john@gmail.com\",\"contact_number\":\"0923842237\",\"tin\":\"83474383429\",\"company_name\":\"Test Company\",\"position\":\"CEO\",\"company_address\":\"United States America\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/user/build-profile', 'build-profile', 'user', 'Profile', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:56:51', '2020-02-22 15:56:51'),
(132, 1, 8, '{\"_csrf\":\"L-Rw6-huniMw_lXoUOS-3_M3QGaqIa8zI07FdwN0NFRFiweEgCjkG0GOY4Niu4-Vw00FPsFi4EtrHqMoVQQHZQ==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 06:48:16', '2020-02-23 06:48:16'),
(133, 1, 8, '{\"_csrf\":\"H55591SqP3HHTWzIKKR-NM7BtfZ5SCjh60EnCw2nsDR18Q6YPOxFSbY9WqMa-09-_rvwrhILZ5mjEUFUW9eDBQ==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 06:49:09', '2020-02-23 06:49:09'),
(134, 1, 1, '{\"_csrf\":\"U_ipUsMnPhgtQxwp-WxSJFBXv3iJvEehxkycHw_LInk5l949q2FEIFwzKkLLM2NuYC36IOL_CNmOHPpAWbsRSA==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/New_York\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"KPI-JO-\"}}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 06:58:08', '2020-02-23 06:58:08'),
(135, 1, 1, '{\"_csrf\":\"c4fU6Ech-MieSufpbTo6L8vnTrREXRVhoiOIGtU_RCQZ6KOHL2eC8O860YJfZQtl-50L7C8eWhnqc-5Fg093FQ==\",\"JobOrder\":{\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create-job-order/4', 'create-job-order', 'purchase-order', 'JobOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 07:15:53', '2020-02-23 07:15:53'),
(136, 1, 4, '{\"_csrf\":\"c4fU6Ech-MieSufpbTo6L8vnTrREXRVhoiOIGtU_RCQZ6KOHL2eC8O860YJfZQtl-50L7C8eWhnqc-5Fg093FQ==\",\"JobOrder\":{\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create-job-order/4', 'create-job-order', 'purchase-order', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 07:15:53', '2020-02-23 07:15:53'),
(137, 1, 8, '{\"_csrf\":\"DJl3ERW0LBfUFEaEdDMolc70UGs7ZpmMQLVu-e4oRExm9gB-ffJWL6VkcO9GbBnf_o4VM1Al1vQI5QimuFh3fQ==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 07:19:12', '2020-02-23 07:19:12'),
(138, 1, 2, '{\"_csrf\":\"f8wq6PVo1mMvc-VS3F3uc_J3iYrLyIn0fX4hSokmXnoVo12HnS6sW14D0znuAt85wg3M0qCLxow1LkcV31ZtSw==\",\"JobOrder\":{\"note\":\"another\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create-job-order/3', 'create-job-order', 'purchase-order', 'JobOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 07:33:48', '2020-02-23 07:33:48'),
(139, 1, 3, '{\"_csrf\":\"f8wq6PVo1mMvc-VS3F3uc_J3iYrLyIn0fX4hSokmXnoVo12HnS6sW14D0znuAt85wg3M0qCLxow1LkcV31ZtSw==\",\"JobOrder\":{\"note\":\"another\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create-job-order/3', 'create-job-order', 'purchase-order', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 07:33:48', '2020-02-23 07:33:48'),
(140, 1, 5, '{\"_csrf\":\"7UK-fBxgqIdketUoURWTwwqNEvKsMARo5uAWy7rZAQKHLckTdCbSvxUK40NjSqKJOvdXqsdzSxCusHCU7KkyMw==\",\"PurchaseOrder\":{\"po_no\":\"432432\",\"customer_note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/1', 'send-po', 'quotation', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 07:40:38', '2020-02-23 07:40:38'),
(141, 1, 1, '{\"_csrf\":\"7UK-fBxgqIdketUoURWTwwqNEvKsMARo5uAWy7rZAQKHLckTdCbSvxUK40NjSqKJOvdXqsdzSxCusHCU7KkyMw==\",\"PurchaseOrder\":{\"po_no\":\"432432\",\"customer_note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/1', 'send-po', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 07:40:38', '2020-02-23 07:40:38'),
(142, 1, 5, '{\"_csrf\":\"TJnd-D4nq-A2KF9ueDBTN756d4PEFSVEXkGvDe4a6JUm9qqXVmHR2EdYaQVKb2J9jgAy269WajwWEclSuGrbpA==\",\"Quotation\":{\"user_id\":\"1\",\"quantity\":\"23\",\"mode_of_payment_id\":\"1\",\"specs\":\"Fully Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)\",\"description\":\"test\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 07:48:02', '2020-02-23 07:48:02'),
(143, 1, 5, '{\"_csrf\":\"tEuOW4iUz1WqC7W95131UqgkrBphAwyitMldY1tMmCXeJPk04NK1bdt7g9bVAsQYmF7pQgpAQ9r8mTs8DTyrFA==\",\"Quotation\":{\"price_per_piece\":\"1230.00\",\"type_of_service_id\":\"1\",\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/5', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 07:48:45', '2020-02-23 07:48:45'),
(144, 1, 6, '{\"_csrf\":\"nG1wy2IyOwgF9gEZp9X6GEIG6n3opfYiInu001u1c2j2AgekCnRBMHSGN3KVistScnyvJYPmuVpqK9KMDcVAWQ==\",\"PurchaseOrder\":{\"quotation_id\":\"5\",\"po_no\":\"tesr\",\"customer_note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create', 'create', 'purchase-order', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 07:54:30', '2020-02-23 07:54:30'),
(145, 1, 5, '{\"_csrf\":\"m8ADiyt9HiLkcgjEsxjvogWDI0cS0-pPutRUkDGYAF_xr3TkQztkGpUCPq-BR97oNflmH3mQpTfyhDLPZ-gzbg==\",\"Quotation\":{\"reason\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/no-bid/5', 'no-bid', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 09:01:56', '2020-02-23 09:01:56'),
(146, 1, 3, '{\"_csrf\":\"Zw2Yjje3buwWKysYZn-mb87s748qRiVV9VgPFe7N8cQNYu_hX_EU1GdbHXNUIJcl_paq10EFai29CGlKuL3C9Q==\",\"JobOrder\":{\"note\":\"rush\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create-job-order/6', 'create-job-order', 'purchase-order', 'JobOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 09:05:12', '2020-02-23 09:05:12'),
(147, 1, 6, '{\"_csrf\":\"Zw2Yjje3buwWKysYZn-mb87s748qRiVV9VgPFe7N8cQNYu_hX_EU1GdbHXNUIJcl_paq10EFai29CGlKuL3C9Q==\",\"JobOrder\":{\"note\":\"rush\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create-job-order/6', 'create-job-order', 'purchase-order', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 09:05:12', '2020-02-23 09:05:12'),
(148, 1, 1, '{\"_csrf\":\"W2NHM_WfxmqaD7OBTDEjIgrgCbIL6v9NxmgIFRYxSHAxDDBcndm8Uut_hep-bhJoOppM6mCpsDWOOG5KQEF7QQ==\",\"Quotation\":{\"user_id\":\"1\",\"quantity\":\"100\",\"mode_of_payment_id\":\"1\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 80gsm (Without Watermark)\",\"description\":\"test\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 09:28:25', '2020-02-23 09:28:25'),
(149, 1, 1, '{\"_csrf\":\"PA8-Qem-oOmQyMDxMGkcJ1aKhdOq4p73DDAHSqN5WnpWYEkugfja0eG49poCNi1tZvDAi8Gh0Y9EYGEV9QlpSw==\",\"Quotation\":{\"price_per_piece\":\"1334\",\"type_of_service_id\":\"1\",\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/1', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 09:28:43', '2020-02-23 09:28:43'),
(150, 1, 1, '{\"_csrf\":\"7Wf93NlliyfWhET1tm_gwmiln3qMixJzxsGshL_Y8MeHCIqzsSPxH6f0cp6EMNGIWN_aIufIXQuOkcrb6ajD9g==\",\"PurchaseOrder\":{\"po_no\":\"44234\",\"customer_note\":\"234\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/1', 'send-po', 'quotation', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 09:28:55', '2020-02-23 09:28:55'),
(151, 1, 1, '{\"_csrf\":\"7Wf93NlliyfWhET1tm_gwmiln3qMixJzxsGshL_Y8MeHCIqzsSPxH6f0cp6EMNGIWN_aIufIXQuOkcrb6ajD9g==\",\"PurchaseOrder\":{\"po_no\":\"44234\",\"customer_note\":\"234\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/1', 'send-po', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 09:28:55', '2020-02-23 09:28:55'),
(152, 1, 1, '{\"_csrf\":\"ISLtNLPeqkVbuMoJliwnCj2ubJKr0hHzk4nnaX7LHmVLTZpb25jQfSrI_GKkcxZADdQpysCRXovb2YE2KLstVA==\",\"JobOrder\":{\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create-job-order/1', 'create-job-order', 'purchase-order', 'JobOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 09:29:30', '2020-02-23 09:29:30'),
(153, 1, 1, '{\"_csrf\":\"ISLtNLPeqkVbuMoJliwnCj2ubJKr0hHzk4nnaX7LHmVLTZpb25jQfSrI_GKkcxZADdQpysCRXovb2YE2KLstVA==\",\"JobOrder\":{\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create-job-order/1', 'create-job-order', 'purchase-order', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-23 09:29:30', '2020-02-23 09:29:30'),
(154, 1, 8, '{\"_csrf\":\"pXNrbJhPJ3spVlOOaUIVVXkFtLlDrK0H3dfe21YdfrfjFDgZ3ShzP2gmZtQDA0YKSEvk0Qno2GiOhumQLl8h3A==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 01:52:14', '2020-02-24 01:52:14'),
(155, 1, 2, '{\"_csrf\":\"SJhA5Gwc5h1jv8lstR_Xasyy57aOaZPHHpyCAQLqCREO_xORKXuyWSLP_DbfXoQ1_fy33sQt5qhNzbVKeqhWeg==\",\"Quotation\":{\"user_id\":\"1\",\"quantity\":\"222\",\"mode_of_payment_id\":\"2\",\"specs\":\"Half Sensitized CBS 1 - Regular Paper 80gsm (Without Watermark)\",\"description\":\"test\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:12:09', '2020-02-24 02:12:09'),
(156, 1, 2, '{\"_csrf\":\"wh-4R5ZGDUCGWaWIypWf3Ag_6S1bd4vDc-TR2OTIkbiEeOsy0yFZBMcpkNKg1MyDOXG5RREz_qwgteaTnIrO0w==\",\"Quotation\":{\"price_per_piece\":\"12\",\"type_of_service_id\":\"1\",\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/2', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:12:21', '2020-02-24 02:12:21'),
(157, 1, 2, '{\"_csrf\":\"vMyKc9gyuvDVb16j2xPqRcQzyqyvfr3Bw_CGWzZ4l8_6q9kGnVXutJQfa_mxUrka9X2axOU6yK6QobEQTjrIpA==\",\"PurchaseOrder\":{\"po_no\":\"232132\",\"customer_note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/2', 'send-po', 'quotation', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:12:29', '2020-02-24 02:12:29'),
(158, 1, 2, '{\"_csrf\":\"vMyKc9gyuvDVb16j2xPqRcQzyqyvfr3Bw_CGWzZ4l8_6q9kGnVXutJQfa_mxUrka9X2axOU6yK6QobEQTjrIpA==\",\"PurchaseOrder\":{\"po_no\":\"232132\",\"customer_note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/2', 'send-po', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:12:29', '2020-02-24 02:12:29'),
(159, 1, 2, '{\"_csrf\":\"jCYI4d_XCy9VJsnLBS8XsG1PashYH0OE0LrlLnCM81_KQVuUmrBfaxRW_JFvbkTvXAE6oBJbNuuD69JlCM6sNA==\",\"JobOrder\":{\"purchase_order_id\":\"2\",\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/job-order/create', 'create', 'job-order', 'JobOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:12:52', '2020-02-24 02:12:52'),
(160, 1, 3, '{\"_csrf\":\"9juwrleoMlKHGYlhNDsDW6ajW9EEnxYcmH5CYLy3YvCwXOPbEs9mFsZpvDteelAEl-0LuU7bY3PLL3UrxPU9mw==\",\"JobOrder\":{\"purchase_order_id\":\"2\",\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/job-order/create', 'create', 'job-order', 'JobOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:15:26', '2020-02-24 02:15:26'),
(161, 1, 4, '{\"_csrf\":\"9juwrleoMlKHGYlhNDsDW6ajW9EEnxYcmH5CYLy3YvCwXOPbEs9mFsZpvDteelAEl-0LuU7bY3PLL3UrxPU9mw==\",\"JobOrder\":{\"purchase_order_id\":\"2\",\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/job-order/create', 'create', 'job-order', 'JobOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:15:44', '2020-02-24 02:15:44'),
(162, 1, 2, '{\"_csrf\":\"9juwrleoMlKHGYlhNDsDW6ajW9EEnxYcmH5CYLy3YvCwXOPbEs9mFsZpvDteelAEl-0LuU7bY3PLL3UrxPU9mw==\",\"JobOrder\":{\"purchase_order_id\":\"2\",\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/job-order/create', 'create', 'job-order', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:15:44', '2020-02-24 02:15:44'),
(163, 1, 11, '{\"_csrf\":\"j_qhho3Aj0CMofKNZAAiZHydRW8-spYkWjt1UpBNzA_JnfLzyKfbBM3Rx9cOQXE7TdMVB3T240sJakIZ6A-TZA==\",\"User\":{\"role_id\":\"9\",\"username\":\"roel\",\"password\":\"roel\",\"password_confirm\":\"roel\"}}', 'POST', 'http://localhost/kanity_printing/user/update/11', 'update', 'user', 'User', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:23:05', '2020-02-24 02:23:05'),
(164, 11, 9, '{\"_csrf\":\"_TBTc7opYrinmEsh3Y5pzQYIPUgeAacfCMEL5WWiPUGuRmNezEYFjMPOOGS6uQucU0JnAEtm7Hw7rnqDUscOGA==\",\"Role\":{\"name\":\"Customer\",\"module_access\":{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/9', 'update', 'role', 'Role', 11, 11, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:23:47', '2020-02-24 02:23:47'),
(165, 11, 3, '{\"_csrf\":\"ZikqIMIkm_q1pqZBc-xIm5iiYZij3VLWp9MsrT0pxVc0am50smn0iuLAwyAwhi712e0Iq9G_AoLOo1uZWmqVOg==\",\"Quotation\":{\"user_id\":\"11\",\"quantity\":\"23\",\"mode_of_payment_id\":\"1\",\"specs\":\"Fully Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)\",\"description\":\"t\",\"imageFiles\":[\"\"]}}', 'POST', 'http://localhost/kanity_printing/quotation/create', 'create', 'quotation', 'Quotation', 11, 11, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:44:04', '2020-02-24 02:44:04'),
(166, 1, 9, '{\"_csrf\":\"FneoAIqAsR67-9LBM7J7QS20ev5E42ZevM1imp4B56lyJ50wvM7baJayp6ke9RgjevkCqTWkHBf3nzT3r3WU5Q==\",\"Role\":{\"name\":\"Customer\",\"module_access\":{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\"],\"quotation\":[\"index\",\"view\",\"cancel\",\"send-po\",\"create\",\"update\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/9', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:45:18', '2020-02-24 02:45:18'),
(167, 1, 3, '{\"_csrf\":\"YDycMQPdix6lUEPnOHkDjG-N1tREZ7Zv2Dhgt8gp5o8pScZVZOq7ackado9dP2W1A8mQliBQ4j3qWRKAn3i3ug==\",\"Quotation\":{\"price_per_piece\":\"20.00\",\"type_of_service_id\":\"1\",\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/quotation/set-quotation/3', 'set-quotation', 'quotation', 'Quotation', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 02:59:45', '2020-02-24 02:59:45'),
(168, 11, 3, '{\"_csrf\":\"viWOEqIA6kuzG9eGl_0zLwfkXhZMSoOgTAkLihx_2YfNQ8hV0zKkHoJss-3Wqlh3Zrw8TD8gx9Q2ZV_QSBuA9w==\",\"PurchaseOrder\":{\"po_no\":\"3432425432\",\"customer_note\":\"easdas\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/3', 'send-po', 'quotation', 'PurchaseOrder', 11, 11, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 03:03:17', '2020-02-24 03:03:17'),
(169, 11, 3, '{\"_csrf\":\"viWOEqIA6kuzG9eGl_0zLwfkXhZMSoOgTAkLihx_2YfNQ8hV0zKkHoJss-3Wqlh3Zrw8TD8gx9Q2ZV_QSBuA9w==\",\"PurchaseOrder\":{\"po_no\":\"3432425432\",\"customer_note\":\"easdas\"}}', 'POST', 'http://localhost/kanity_printing/quotation/send-po/3', 'send-po', 'quotation', 'Quotation', 11, 11, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 03:03:17', '2020-02-24 03:03:17'),
(170, 1, 9, '{\"_csrf\":\"v-yWKN0X7SevvXuoSBTtIk-wKruPSkLjeDybrzp28YP2mcxMuiDdUMP3TsAtUosbI_Rs-et9FrFKXemYbSegtg==\",\"Role\":{\"name\":\"Customer\",\"module_access\":{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"cancel\",\"send-po\",\"create\",\"update\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/9', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 03:05:12', '2020-02-24 03:05:12'),
(171, 1, 5, '{\"_csrf\":\"TBNwhm67Mi8zB_bG6SpspN1m2Zx1OLoHOLDQ4KfK2b8FZiriCYwCWF9Nw66MbAqdsSKf3hEP7lUK0aLX8JuIig==\",\"JobOrder\":{\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create-job-order/3', 'create-job-order', 'purchase-order', 'JobOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 03:06:19', '2020-02-24 03:06:19'),
(172, 1, 3, '{\"_csrf\":\"TBNwhm67Mi8zB_bG6SpspN1m2Zx1OLoHOLDQ4KfK2b8FZiriCYwCWF9Nw66MbAqdsSKf3hEP7lUK0aLX8JuIig==\",\"JobOrder\":{\"note\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/purchase-order/create-job-order/3', 'create-job-order', 'purchase-order', 'PurchaseOrder', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 03:06:19', '2020-02-24 03:06:19'),
(173, 1, 9, '{\"_csrf\":\"rpMN3SP-hGPf66sRW1iap6EvduVyId2cd_gvMZcd2W_n5le5RMm0FLOhnnk-HvyezWswpxYWic5FmV0GwEyIWg==\",\"Role\":{\"name\":\"Customer\",\"module_access\":{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"cancel\",\"send-po\",\"create\",\"update\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/9', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 03:20:12', '2020-02-24 03:20:12'),
(174, 1, 9, '{\"_csrf\":\"MGS3DqQ-VSq9q1dA-ZDoRmn_ODEYxtwBiiCEdfhSXVh5Ee1qwwllXdHhYiic1o5_Bbt-c3zxiFO4QfZCrwMMbQ==\",\"Role\":{\"name\":\"Customer\",\"module_access\":{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"cancel\",\"send-po\",\"create\",\"update\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/9', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 03:39:36', '2020-02-24 03:39:36'),
(175, 1, 9, '{\"_csrf\":\"jxj7M7uRYQk6CEIJNJ0coY6zRhCPGvY-p3T9wgGQvPXGbaFX3KZRflZCd2FR23qY4vcAUustomyVFY_1VsHtwA==\",\"Role\":{\"name\":\"Customer\",\"module_access\":{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"cancel\",\"send-po\",\"create\",\"update\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/9', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 03:43:42', '2020-02-24 03:43:42'),
(176, 1, 9, '{\"_csrf\":\"fqZY2iy-U9Q4hA3GVUw1CHhptZR9nYah7RFQGYrICzw30wK-S4ljo1TOOK4wClMxFC3z1hmq0vPfcCIu3ZlaCQ==\",\"Role\":{\"name\":\"Customer\",\"module_access\":{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"cancel\",\"send-po\",\"create\",\"update\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/9', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 03:43:55', '2020-02-24 03:43:55'),
(177, 1, 9, '{\"_csrf\":\"ioqSDiaDS4Vmpqz_0WdSwC2l8j3DcDQ5SQmgWPHGKSjD_8hqQbR78grsmZe0ITT5QeG0f6dHYGt7aNJvppd4HQ==\",\"Role\":{\"name\":\"Customer\",\"module_access\":{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"cancel\",\"send-po\",\"create\",\"update\",\"remove-image\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/9', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 03:45:28', '2020-02-24 03:45:28');
INSERT INTO `kp_log` (`id`, `user_id`, `ref_id`, `request_data`, `method`, `url`, `action`, `controller`, `model`, `created_by`, `updated_by`, `user_agent`, `ip`, `browser`, `os`, `device`, `status`, `created_at`, `updated_at`) VALUES
(178, 1, 8, '{\"_csrf\":\"12G7zf0KBxwyGy4JxmQfr_YSy1AZHDG1jRnQ-xxPXrCeFOGpmj03a15RG2GjInmWmlaNEn0rZee_eKLMSx4PhQ==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:00:36', '2020-02-24 04:00:36'),
(179, 1, 3, '{\"_csrf\":\"fD_xpLIUS4DYcRtavExZLkI5yxkrOoemQGCoIRovhEE1SqvA1SN797Q7LjLZCj8XLn2NW08N0_RyAdoWTX7VdA==\",\"DashboardCarousel\":{\"name\":\"test\",\"description\":\"test\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/create', 'create', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:09:58', '2020-02-24 04:09:58'),
(180, 1, 1, '[]', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/delete/1', 'delete', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:10:12', '2020-02-24 04:10:12'),
(181, 1, 2, '[]', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/delete/2', 'delete', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:10:16', '2020-02-24 04:10:16'),
(182, 1, 1, '{\"_csrf\":\"vTh0qOJoMV2VBBmD1TUCW7GURDk8uhLe8CivW6cHZ5f0TS7MhV8BKvlOLOuwc2Ri3dACe1iNRozCSd1s8FY2og==\",\"DashboardCarousel\":{\"name\":\"Curabitur sollicitudin tellus nulla, non rhoncus\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\\r\\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\\r\\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\\r\\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\\r\\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/create', 'create', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:11:39', '2020-02-24 04:11:39'),
(183, 1, 2, '{\"_csrf\":\"yesxuZCEwI1SyuHNWkatmV3qz3IY25Qahhic0h24WNyAnmvd97Pw-j6A1KU_AMugMa6JMHzswEi0ee7lSukJ6Q==\",\"DashboardCarousel\":{\"name\":\"Metus et placerat venenatis, mauris diam ornare neque\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\\r\\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\\r\\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\\r\\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\\r\\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/create', 'create', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:12:05', '2020-02-24 04:12:05'),
(184, 1, 2, '{\"_csrf\":\"CS2xl4Ax41jHZFllQKugzRn0FAqH1BNrAgRWIEON_69AWOvz5wbTL6subA0l7cb0dbBSSOPjRzkwZSQXFNyumg==\",\"DashboardCarousel\":{\"name\":\"Extra Ordinary Printing Experience\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\\r\\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\\r\\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\\r\\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\\r\\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/update/2', 'update', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:36:14', '2020-02-24 04:36:14'),
(185, 1, 1, '{\"_csrf\":\"fyyBfDswYasTaEKSRugZOz7RsC0pZrdNEah9BOadvmk2WdsYXAdR3H8id_ojrn8CUpX2b01R4x8jyQ8zsczvXA==\",\"DashboardCarousel\":{\"name\":\"Reasonable Pricing\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\\r\\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\\r\\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\\r\\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\\r\\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/update/1', 'update', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:36:31', '2020-02-24 04:36:31'),
(186, 1, 3, '{\"_csrf\":\"C4EtfxXC_0IQHewSB3xiYqFdn6w6WzTSwX6iMD02_klC9HcbcvXPNXxX2XpiOgRbzRnZ7l5sYIDzH9AHamevfA==\",\"DashboardCarousel\":{\"name\":\"Leverage Output\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\\r\\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\\r\\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\\r\\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\\r\\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/create', 'create', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:37:11', '2020-02-24 04:37:11'),
(187, 1, 3, '{\"_csrf\":\"xu_AtVMiG79gyXH5tw00fKMXB3ntuaVox3hZYnhPOj6PmprRNBUryAyDRJHSS1JFz1NBO4mO8Tr1GStVLx5rCw==\",\"DashboardCarousel\":{\"name\":\"Leverage Output\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/update/3', 'update', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:38:00', '2020-02-24 04:38:00'),
(188, 1, 1, '{\"_csrf\":\"UWTutmveKhxrFKKYe8HMMpRCdUh3itkPpKQiqBD5fO0YEbTSDOkaawdel_Aeh6oL-AYzChO9jV2WxVCfR6gt2A==\",\"DashboardCarousel\":{\"name\":\"Reasonable Pricing\",\"description\":\"Ut enim ad minim veniam,\\r\\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\\r\\nconsequat. \",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/update/1', 'update', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:38:13', '2020-02-24 04:38:13'),
(189, 1, 2, '{\"_csrf\":\"eFaWRvNgk1yVd9xfmqyPMAu3woGVNJWzT-iJj-Y-pvYxI8wilFejK_k96Tf_6ukJZ_OEw_EDweF9ifu4sW_3ww==\",\"DashboardCarousel\":{\"name\":\"Extra Ordinary Printing Experience\",\"description\":\"Excepteur sint occaecat cupidatat non\\r\\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/update/2', 'update', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:38:28', '2020-02-24 04:38:28'),
(190, 1, 3, '{\"_csrf\":\"1-YwOy55jM6eK5wcD_tHjX2yGBwDj4RLp0gHtdUTkguek2pfSU68ufJhqXRqvSG0EfZeXme40BmVKXWCgkLDPg==\",\"DashboardCarousel\":{\"name\":\"Leverage Output\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/update/3', 'update', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:56:20', '2020-02-24 04:56:20'),
(191, 1, 3, '{\"_csrf\":\"RxJjRktU9zWSxheqiWKhXuU9MaO2JnXKB3ftV_3Wo00OZzkiLGPHQv6MIsLsJMdniXl34dIRIZg1Fp9gqofyeA==\"}', 'POST', 'http://localhost/kanity_printing/dashboard-carousel/delete/3', 'delete', 'dashboard-carousel', 'DashboardCarousel', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 04:56:34', '2020-02-24 04:56:34'),
(192, 1, 1, '{\"_csrf\":\"IY7aDh7nOMiJIB5Qx89fC18vRkJjRkdqVQHixIZeE59o-4BqedAIv-VqKziiiTkyM2sAAAdxEzhnYJDz0Q9Cqg==\",\"Product\":{\"service_id\":\"1\",\"name\":\"Modern Design\",\"tag_line\":\"Colorful design architecture\",\"description\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/product/update/1', 'update', 'product', 'Product', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:02:41', '2020-02-24 05:02:41'),
(193, 1, 2, '{\"_csrf\":\"jivTqgGB9jviv6Rqw4dxavXf0O5eQCICjGHbEY6U6OnHXonOZrbGTI71kQKmwRdTmZuWrDp3dlC-AKkm2cW53A==\",\"Product\":{\"service_id\":\"1\",\"name\":\"High Quality\",\"tag_line\":\"Durable and complicated design\",\"description\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/product/create', 'create', 'product', 'Product', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:03:16', '2020-02-24 05:03:16'),
(194, 1, 2, '{\"_csrf\":\"Dtk-64tL56bCTszRQjgiNbWZsE8pTSQSbf6PqV1290lHrGSP7HzX0a4E-bknfkQM2d32DU16cEBfn_2eCiemfA==\",\"Product\":{\"service_id\":\"1\",\"name\":\"High Quality\",\"tag_line\":\"Durable and complicated design\",\"description\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/product/update/2', 'update', 'product', 'Product', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:03:25', '2020-02-24 05:03:25'),
(195, 1, 3, '{\"_csrf\":\"PY7YvDxnvgYHuA1H9Eu6nLSxMhJ723A2vMqLdo-pGHZ0-4LYW1COcWvyOC-RDdyl2PV0UB_sJGSOq_lB2PhJQw==\",\"Product\":{\"service_id\":\"1\",\"name\":\"Mixed paper\",\"tag_line\":\"Product with mixed design\",\"description\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/product/create', 'create', 'product', 'Product', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:05:09', '2020-02-24 05:05:09'),
(196, 1, 1, '{\"_csrf\":\"aUM-hlOMJbYlocN6c90GRd_UACyPL1jMSavILsfFpi0gNmTiNLsVwUnr9hIWm2B8s5BGbusYDJ57yroZkJT3GA==\",\"Service\":{\"name\":\"Quotation Request\",\"tag_line\":\"Request a quoation with us for your design\",\"description\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/service/update/1', 'update', 'service', 'Service', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:22:09', '2020-02-24 05:22:09'),
(197, 1, 2, '{\"_csrf\":\"jzOUBCjyxOm6Fy5BJUv_LjzjIKMt8X6W3wxbvdUXKRrGRs5gT8X0ntZdGylADZkXUKdm4UnGKsTtbSmKgkZ4Lw==\",\"Service\":{\"name\":\"3D Printing\",\"tag_line\":\"leverage your design with 3 Dimensional Pattern\",\"description\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/service/create', 'create', 'service', 'Service', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:23:40', '2020-02-24 05:23:40'),
(198, 1, 2, '{\"_csrf\":\"nsSXh5ikjEVxlMf8_p-Xw7ltIc2r5_dE4An0PR0x1I3Xsc3j_5O8Mh3e8pSb2fH61Slnj8_QoxbSaIYKSmCFuA==\",\"Service\":{\"name\":\"3D Printing\",\"tag_line\":\"leverage your design with 3 Dimensional Pattern\",\"description\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/service/update/2', 'update', 'service', 'Service', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:24:08', '2020-02-24 05:24:08'),
(199, 1, 1, '{\"_csrf\":\"SLrLjGv2QFm61johVYJTpBKvgefK7xIUZ6Dt6qOW3ZgBz5HoDMFwLtacD0kwxDWdfuvHpa7YRkZVwZ_d9MeMrQ==\",\"Service\":{\"name\":\"Quotation Request\",\"tag_line\":\"Request a quoation with us for your design\",\"description\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/service/update/1', 'update', 'service', 'Service', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:24:21', '2020-02-24 05:24:21'),
(200, 1, 1, '{\"_csrf\":\"OPknq8pcj4Ikj7TDLdSQ_ao8urd6zOxZTf4_QpqrnO1xjH3PrWu_9UjFgatIkvbExnj89R77uAt_n011zfrN2A==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/New_York\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"KPI-JO-\",\"company_tag_line\":\"We strive to deliver a level of service that exceeds the expectations of our customers.\",\"company_description\":\"If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.\"}}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:33:58', '2020-02-24 05:33:58'),
(201, 1, 1, '{\"_csrf\":\"fJRf3feWz_QhvGvP7KxqLGCTWPcdDIIrXU9NC3cHVFg14QW5kKH_g032XqeJ6gwVDNcetXk71nlvLj88IFYFbQ==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/New_York\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"KPI-JO-\",\"form_of_business\":\"Incorporated\",\"line_of_business\":\"Commercial Printing\",\"tin\":\"008-843-616\",\"reg_no\":\"CS201416033\",\"company_tag_line\":\"We strive to deliver a level of service that exceeds the expectations of our customers.\",\"company_description\":\"If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.\"}}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:50:25', '2020-02-24 05:50:25'),
(202, 1, 1, '{\"_csrf\":\"re3cITHm--w_F2Ad5ailOWlGJ8UmN_e1wKGzIsCDK8jkmIZFVtHLm1NdVXWA7sMABQJhh0IAo-fywMEVl9J6_Q==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/New_York\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"KPI-JO-\",\"company_name\":\"Kanity Printing INC\",\"company_tag_line\":\"We strive to deliver a level of service that exceeds the expectations of our customers.\",\"form_of_business\":\"Incorporated\",\"line_of_business\":\"Commercial Printing\",\"tin\":\"008-843-616\",\"reg_no\":\"CS201416033\",\"company_description\":\"If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.\"}}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 05:57:02', '2020-02-24 05:57:02'),
(203, 1, 1, '{\"_csrf\":\"M-S25l4OQjVWOgiNFQ_QIbBjHV6pjcdbkgzls4jsx-J6keyCOTlyQjpwPeVwSbYY3CdbHM26kwmgbZeE372W1w==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/New_York\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"KPI-JO-\",\"company_name\":\"Kanity Printing INC\",\"company_tag_line\":\"We strive to deliver a level of service that exceeds the expectations of our customers.\",\"form_of_business\":\"Incorporated\",\"line_of_business\":\"Commercial Printing\",\"tin\":\"008-843-616\",\"reg_no\":\"CS201416033\",\"company_address\":\"123 Business Way San Francisco, CA 94108 USA\",\"company_description\":\"If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.\"}}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 06:09:31', '2020-02-24 06:09:31'),
(204, 1, 1, '{\"_csrf\":\"5tIYEcFG_xFiywJPxQSGH1bsfM7u9Xa4UuuTVKSk8oevp0J1pnHPZg6BNyegQuAmOqg6jIrCIupgiuFj8_Wjsg==\",\"Setting\":{\"default_role\":\"9\",\"pagination\":\"10\",\"timezone\":\"America\\/New_York\",\"quotation_no_padding\":\"5\",\"quotation_no_prefix\":\"KPI-Q-\",\"jo_no_padding\":\"5\",\"jo_no_prefix\":\"KPI-JO-\",\"company_name\":\"Kanity Printing INC\",\"company_tag_line\":\"We strive to deliver a level of service that exceeds the expectations of our customers.\",\"form_of_business\":\"Incorporated\",\"line_of_business\":\"Commercial Printing\",\"tin\":\"008-843-616\",\"reg_no\":\"CS201416033\",\"company_phone_no\":\"(888) 123-4567\",\"company_fax_no\":\"(887) 123-4567\",\"company_address\":\"123 Business Way San Francisco, CA 94108 USA\",\"company_description\":\"If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.\"}}', 'POST', 'http://localhost/kanity_printing/setting/update/1', 'update', 'setting', 'Setting', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 06:15:36', '2020-02-24 06:15:36'),
(205, 1, 3, '{\"_csrf\":\"NqoK5oVCSgeh4XcezfIdazZItYfKr-JXHA_o0vq0R1R_31CC4nV6cM2rQnaotHtSWgzzxa6YtgUubprlreUWYQ==\",\"Service\":{\"name\":\"Test\",\"tag_line\":\"Test Tag Line\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\\r\\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\\r\\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\\r\\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\\r\\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/service/create', 'create', 'service', 'Service', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:00:31', '2020-02-24 07:00:31'),
(206, 1, 4, '{\"_csrf\":\"mIlhrOlWBfFkOldA932L-rwubUlXCkcQftM9JDSFlPTR_DvIjmE1hghwYiiSO-3D0GorCzM9E0JMsk8TY9TFwQ==\",\"Service\":{\"name\":\"Another test service\",\"tag_line\":\"Another test service tag line\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\\r\\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\\r\\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\\r\\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\\r\\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/service/create', 'create', 'service', 'Service', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:01:53', '2020-02-24 07:01:53'),
(207, 1, 1, '{\"_csrf\":\"b7ncD0lBnhBFB-9WXct5KgjSLurVkmWBbCQRPdAv7SomzIZrLnauZylN2j44jR8TZJZoqLGlMdNeRWMKh368Hw==\",\"PortfolioCategory\":{\"name\":\"Web Design\",\"description\":\"Category 1\"}}', 'POST', 'http://localhost/kanity_printing/portfolio-category/update/1', 'update', 'portfolio-category', 'PortfolioCategory', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:28:02', '2020-02-24 07:28:02'),
(208, 1, 2, '{\"_csrf\":\"SUuRbbcaKhYc4v6C-KdECJ9RB0Mp0rmpL23ZyS6XZ7IAPssJ0C0aYXCoy-qd4SIx8xVBAU3l7fsdDKv-ecY2hw==\",\"PortfolioCategory\":{\"name\":\"Printing\",\"description\":\"Printing\"}}', 'POST', 'http://localhost/kanity_printing/portfolio-category/create', 'create', 'portfolio-category', 'PortfolioCategory', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:28:21', '2020-02-24 07:28:21'),
(209, 1, 3, '{\"_csrf\":\"g0Jd7ge8YKk08ubFHYG-t3LyOW65E0dFJOlWhTNgQkzKNweKYItQ3li40614x9iOHrZ_LN0kExcWiCSyZDETeQ==\",\"PortfolioCategory\":{\"name\":\"Web Development\",\"description\":\"Web Development\"}}', 'POST', 'http://localhost/kanity_printing/portfolio-category/create', 'create', 'portfolio-category', 'PortfolioCategory', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:28:32', '2020-02-24 07:28:32'),
(210, 1, 4, '{\"_csrf\":\"4qmhNLWkiAIyApDtjs2aNFfY2-WdMhx8XNXq9WOqZyyr3PtQ0pO4dV5IpYXri_wNO5ydp_kFSC5utJjCNPs2GQ==\",\"PortfolioCategory\":{\"name\":\"SEO Optimazation\",\"description\":\"SEO Optimazation\"}}', 'POST', 'http://localhost/kanity_printing/portfolio-category/create', 'create', 'portfolio-category', 'PortfolioCategory', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:28:50', '2020-02-24 07:28:50'),
(211, 1, 2, '{\"_csrf\":\"ubR6GgysPw6dTpoG_fOW_Z6CQ0DtTzfpxlgg6NuxKqvwwSB-a5sPefEEr26YtfDE8sYFAol4Y7v0OVLfjOB7ng==\",\"Portfolio\":{\"portfolio_category_id\":\"1\",\"name\":\"test\",\"description\":\"test\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/portfolio/create', 'create', 'portfolio', 'Portfolio', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:29:39', '2020-02-24 07:29:39'),
(212, 1, 3, '{\"_csrf\":\"7UUMqxCO_or5DGDBxt_n4PDGXiztZmlBif69hF3ykdKkMFbPd7nO_ZVGVamjmYHZnIIYbolRPRO7n8-zCqPA5w==\",\"Portfolio\":{\"portfolio_category_id\":\"1\",\"name\":\"test\",\"description\":\"test\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/portfolio/create', 'create', 'portfolio', 'Portfolio', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:29:59', '2020-02-24 07:29:59'),
(213, 1, 4, '{\"_csrf\":\"p5dmisNA3gOjbljWzeUt4SSmKN9UVTYwhGg4Qmxl30Du4jzupHfudM8kbb6oo0vYSOJunTBiYmK2CUp1OzSOdQ==\",\"Portfolio\":{\"portfolio_category_id\":\"2\",\"name\":\"test\",\"description\":\"test\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/portfolio/create', 'create', 'portfolio', 'Portfolio', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:30:20', '2020-02-24 07:30:20'),
(214, 1, 5, '{\"_csrf\":\"wkZsvDE8ZwZCfNO6Gav2Wx879Y6OKirv_AybilE5qZOLMzbYVgtXcS425tJ87ZBic3-zzOodfr3Obem9Bmj4pg==\",\"Portfolio\":{\"portfolio_category_id\":\"2\",\"name\":\"test\",\"description\":\"test\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/portfolio/create', 'create', 'portfolio', 'Portfolio', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:30:34', '2020-02-24 07:30:34'),
(215, 1, 6, '{\"_csrf\":\"V4AZt5A9HARrRzobIcHC62LbKTKrqQkujRuaelZQFNAe9UPT9woscwcND3NEh6TSDp9vcM-eXXy_euhNAQFF5Q==\",\"Portfolio\":{\"portfolio_category_id\":\"3\",\"name\":\"test\",\"description\":\"test\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/portfolio/create', 'create', 'portfolio', 'Portfolio', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:30:49', '2020-02-24 07:30:49'),
(216, 1, 7, '{\"_csrf\":\"5qfVjfFFNy7COdVlrkUeruGpRydM0wp_0oGF3HWq8tGv0o_plnIHWa5z4A3LA3iXje0BZSjkXi3g4PfrIvuj5A==\",\"Portfolio\":{\"portfolio_category_id\":\"4\",\"name\":\"test\",\"description\":\"test\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/portfolio/create', 'create', 'portfolio', 'Portfolio', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 07:31:04', '2020-02-24 07:31:04'),
(217, 1, 8, '{\"_csrf\":\"tk5MHmBSc3BYxmg7qz2p28JAKO-ZcEEizFGbH5gLhU7_OxZ6B2VDBzSMXVPOe8_irgRurf1HFXD-MOkoz1rUew==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"our-portfolio\":[\"index\",\"view\"],\"our-product\":[\"index\",\"view\"],\"our-service\":[\"index\",\"view\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:03:58', '2020-02-24 08:03:58'),
(218, 1, 4, '{\"_csrf\":\"IRSu4KcjlN_94eCH9-WOHI0vxIeSFxqKrIwS4tZDCUpoYfSEwBSkqJGr1e-So-gl4WuCxfYgTtie7WDVgRJYfw==\",\"Equipment\":{\"equipment_category_id\":\"2\",\"name\":\"test\",\"tag_line\":\"test\",\"description\":\"test\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/equipment/create', 'create', 'equipment', 'Equipment', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:13:53', '2020-02-24 08:13:53'),
(219, 1, 4, '{\"_csrf\":\"OhNjIVZfd-0Bw2irWEFiVhE5MeuDMdPqVAcEzDq57H1zZjlFMWhHmm2JXcM9BwRvfX13qecGh7hmZnb7bei9SA==\",\"EquipmentCategory\":{\"name\":\"Printing Machine\",\"description\":\"Printing Machine\"}}', 'POST', 'http://localhost/kanity_printing/equipment-category/update/4', 'update', 'equipment-category', 'EquipmentCategory', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:28:03', '2020-02-24 08:28:03'),
(220, 1, 3, '{\"_csrf\":\"Rb61-gLZjs8-UE-XvuarNxDZJg4UskQm6xjH4RScvTgMy--eZe6-uFIaev_boM0OfJ1gTHCFEHTZebXWQ83sDQ==\",\"EquipmentCategory\":{\"name\":\"CUT Machine\",\"description\":\"CUT Machine\"}}', 'POST', 'http://localhost/kanity_printing/equipment-category/update/3', 'update', 'equipment-category', 'EquipmentCategory', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:28:20', '2020-02-24 08:28:20'),
(221, 1, 1, '{\"_csrf\":\"lrhu0wXMF82Z1--Wr0BNwM0dgqmDaULwHOqP-wp-qrjfzTS3YvsnuvWd2v7KBiv5oVnE6-deFqIui_3MXS_7jQ==\",\"EquipmentCategory\":{\"name\":\"PLATE MAKING MACHINE\",\"description\":\"PLATE MAKING MACHINE\"}}', 'POST', 'http://localhost/kanity_printing/equipment-category/update/1', 'update', 'equipment-category', 'EquipmentCategory', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:28:41', '2020-02-24 08:28:41'),
(222, 1, 2, '{\"_csrf\":\"6ejFDBd0rNov_0yk9suP0Q6f4UsVM5j0I6z4lrDXNhqgnZ9ocEOcrUO1ecyTjenoYtunCXEEzKYRzYqh54ZnLw==\",\"EquipmentCategory\":{\"name\":\"OFFSET PRESS\",\"description\":\"OFFSET PRESS\"}}', 'POST', 'http://localhost/kanity_printing/equipment-category/update/2', 'update', 'equipment-category', 'EquipmentCategory', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:28:59', '2020-02-24 08:28:59'),
(223, 1, 8, '{\"_csrf\":\"ijVG2j3dzg_pW0FfUSxzHdw3vqToAFz3KALkO_OAbXDDQBy-Wur-eIURdDc0ahUksHP45ow3CKUaY5YMpNE8RQ==\",\"Role\":{\"name\":\"Super Admin\",\"role_access\":[\"9\",\"10\",\"8\"],\"module_access\":{\"announcement\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"our-equipment\":[\"index\",\"view\"],\"our-portfolio\":[\"index\",\"view\"],\"our-product\":[\"index\",\"view\"],\"our-service\":[\"index\",\"view\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"trade-reference\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}}}', 'POST', 'http://localhost/kanity_printing/role/update/8', 'update', 'role', 'Role', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:41:50', '2020-02-24 08:41:50'),
(224, 1, 1, '{\"_csrf\":\"RDMAW_KS8sbXQf-rQaB8i7tVs2xAHYNdklSg9-KmdykNRlo_laXCsbsLysMk5hqy1xH1LiQq1w-gNdLAtfcmHA==\",\"Announcement\":{\"name\":\"test\",\"description\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/announcement/create', 'create', 'announcement', 'Announcement', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:42:18', '2020-02-24 08:42:18'),
(225, 1, 1, '{\"_csrf\":\"VrGcleJ3LhXqgykCnriJik6IpphyeJeooGjNgDHfHs0fxMbxhUAeYobJHGr7_u-zIszg2hZPw_qSCb-3Zo5P-A==\",\"TradeReference\":{\"name\":\"test\",\"description\":\"test\"}}', 'POST', 'http://localhost/kanity_printing/trade-reference/create', 'create', 'trade-reference', 'TradeReference', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:42:47', '2020-02-24 08:42:47'),
(226, 1, 1, '{\"_csrf\":\"rM94-BIgx8zh83uJAYnPmepf8xV--fEc-W_AH1RN3PjluiKcdRf3u425TuFkz6mghhu1VxrOpU7LDrIoAxyNzQ==\",\"TradeReference\":{\"name\":\"HEIDELBERG PHILPPINES, INC.\",\"description\":\"HEIDELBERG PHILPPINES, INC.\"}}', 'POST', 'http://localhost/kanity_printing/trade-reference/update/1', 'update', 'trade-reference', 'TradeReference', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:46:27', '2020-02-24 08:46:27'),
(227, 1, 2, '{\"_csrf\":\"aADOTHIvOk8m4p9q3mS4NLSCPyncpjIB7uc3II0EtV8hdZQoFRgKOEqoqgK7It4N2MZ5a7iRZlPchkUX2lXkag==\",\"TradeReference\":{\"name\":\"NAPPCO (Nation Paper Products & Printing)\",\"description\":\"NAPPCO (Nation Paper Products & Printing)\"}}', 'POST', 'http://localhost/kanity_printing/trade-reference/create', 'create', 'trade-reference', 'TradeReference', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:46:34', '2020-02-24 08:46:34'),
(228, 1, 3, '{\"_csrf\":\"4Sktj1pMW44Nen2OhPN0yNmNOen1bDPLb4miu8hYn3qoXHfrPXtr-WEwSObhtRLxtcl_q5FbZ5ld6NCMnwnOTw==\",\"TradeReference\":{\"name\":\"IDEAL MARKETING CORPORATION\",\"description\":\"IDEAL MARKETING CORPORATION\"}}', 'POST', 'http://localhost/kanity_printing/trade-reference/create', 'create', 'trade-reference', 'TradeReference', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-24 08:46:41', '2020-02-24 08:46:41');

-- --------------------------------------------------------

--
-- Table structure for table `kp_mode_of_payment`
--

CREATE TABLE `kp_mode_of_payment` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
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
  `id` int(11) NOT NULL,
  `portfolio_category_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
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
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
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
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(256) NOT NULL,
  `tag_line` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
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
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
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
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_profile`
--

INSERT INTO `kp_profile` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `position`, `company_name`, `company_address`, `tin`, `email`, `contact_number`, `image`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 11, 'roel', 'rivera', 'longcop', 'Web Developer', 'FAI', 'San Pedro', '836462182716', 'longcoproel@gmail.com', '09124435652', 'uploads/profile/Roel Longcop/DSC_8792.jpg', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-21 04:10:03'),
(2, 1, 'John', 'Hello', 'Doe', 'CEO', 'Test Company', 'United States America', '83474383429', 'john@gmail.com', '0923842237', 'uploads/profile/John Doe/pewdiepie-a8.jpg', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-22 15:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `kp_purchase_order`
--

CREATE TABLE `kp_purchase_order` (
  `id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL DEFAULT '0',
  `po_no` varchar(64) NOT NULL,
  `customer_note` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `process_status` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_purchase_order`
--

INSERT INTO `kp_purchase_order` (`id`, `quotation_id`, `po_no`, `customer_note`, `created_by`, `updated_by`, `process_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '44234', '234', 1, 1, 1, 1, '0000-00-00 00:00:00', '2020-02-23 09:29:30'),
(2, 2, '232132', 'test', 1, 1, 1, 1, '0000-00-00 00:00:00', '2020-02-24 02:15:44'),
(3, 3, '3432425432', 'easdas', 11, 1, 1, 1, '0000-00-00 00:00:00', '2020-02-24 03:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `kp_quotation`
--

CREATE TABLE `kp_quotation` (
  `id` int(11) NOT NULL,
  `quotation_no` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `process_by` int(11) NOT NULL DEFAULT '0',
  `specs` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `mode_of_payment_id` int(11) NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `process_status` int(11) NOT NULL DEFAULT '0',
  `price_per_piece` decimal(10,2) NOT NULL,
  `type_of_service_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `reason` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_quotation`
--

INSERT INTO `kp_quotation` (`id`, `quotation_no`, `user_id`, `process_by`, `specs`, `description`, `quantity`, `mode_of_payment_id`, `images`, `created_by`, `updated_by`, `process_status`, `price_per_piece`, `type_of_service_id`, `note`, `reason`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KPI-Q-00001', 1, 1, 'Half Sensitized CBS 1 - Regular Paper 80gsm (Without Watermark)', 'test', 100, 1, '[\"uploads\\/quotation\\/Afg1ns.jpg\",\"uploads\\/quotation\\/alyana final.jpg\",\"uploads\\/quotation\\/alyana final2.jpg\"]', 1, 1, 4, '1334.00', 1, 'test', '', 1, '0000-00-00 00:00:00', '2020-02-23 09:28:55'),
(2, 'KPI-Q-00002', 1, 1, 'Half Sensitized CBS 1 - Regular Paper 80gsm (Without Watermark)', 'test', 222, 2, '[\"uploads\\/quotation\\/27249.jpg\",\"uploads\\/quotation\\/58887c73bc2fc2ef3a186072.png\",\"uploads\\/quotation\\/58887d11bc2fc2ef3a186076.png\",\"uploads\\/quotation\\/898438-disney-princess-backgrounds-1920x1200-for-phones.jpg\"]', 1, 1, 4, '12.00', 1, 'test', '', 1, '0000-00-00 00:00:00', '2020-02-24 02:12:29'),
(3, 'KPI-Q-00003', 11, 1, 'Fully Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)', 't', 23, 1, '[\"uploads\\/quotation\\/Disney-Birthday-Invitation-Template.jpg\"]', 11, 11, 4, '20.00', 1, 'test', '', 1, '0000-00-00 00:00:00', '2020-02-24 03:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `kp_role`
--

CREATE TABLE `kp_role` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `module_access` text NOT NULL,
  `role_access` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_role`
--

INSERT INTO `kp_role` (`id`, `name`, `module_access`, `role_access`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Super Admin', '{\"announcement\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard-carousel\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"dashboard\":[\"index\",\"chart\"],\"equipment-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"equipment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"our-equipment\":[\"index\",\"view\"],\"our-portfolio\":[\"index\",\"view\"],\"our-product\":[\"index\",\"view\"],\"our-service\":[\"index\",\"view\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"create-job-order\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"trade-reference\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}', '[\"9\",\"10\",\"8\"]', 0, 1, 1, '0000-00-00 00:00:00', '2020-02-24 08:41:50'),
(9, 'Customer', '{\"dashboard\":[\"index\",\"chart\"],\"job-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"log\":[\"index\",\"view\",\"create\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"cancel\",\"send-po\",\"create\",\"update\",\"remove-image\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}', '[]', 0, 1, 1, '0000-00-00 00:00:00', '2020-02-24 03:45:28'),
(10, 'Finance', '{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}', '[]', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-21 12:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `kp_service`
--

CREATE TABLE `kp_service` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `tag_line` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
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
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `default_role` int(11) NOT NULL,
  `pagination` int(11) NOT NULL,
  `timezone` varchar(64) NOT NULL,
  `quotation_no_padding` int(11) NOT NULL,
  `quotation_no_prefix` varchar(32) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
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
  `tin` varchar(64) NOT NULL,
  `reg_no` varchar(64) NOT NULL,
  `twitter` varchar(128) NOT NULL,
  `facebook` varchar(128) NOT NULL,
  `google` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_setting`
--

INSERT INTO `kp_setting` (`id`, `created_by`, `updated_by`, `default_role`, `pagination`, `timezone`, `quotation_no_padding`, `quotation_no_prefix`, `status`, `created_at`, `updated_at`, `jo_no_padding`, `jo_no_prefix`, `company_name`, `company_address`, `company_tag_line`, `company_description`, `form_of_business`, `line_of_business`, `company_phone_no`, `company_fax_no`, `tin`, `reg_no`, `twitter`, `facebook`, `google`, `email`) VALUES
(1, 1, 1, 9, 10, 'America/New_York', 5, 'KPI-Q-', 1, '0000-00-00 00:00:00', '2020-02-24 06:15:36', 5, 'KPI-JO-', 'Kanity Printing INC', '123 Business Way San Francisco, CA 94108 USA', 'We strive to deliver a level of service that exceeds the expectations of our customers.', 'If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.', 'Incorporated', 'Commercial Printing', '(888) 123-4567', '(887) 123-4567', '008-843-616', 'CS201416033', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kp_specification`
--

CREATE TABLE `kp_specification` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `paper` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `watermark` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
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
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
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
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_type_of_service`
--

INSERT INTO `kp_type_of_service` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Complete Service', 'Complete Service\r\n', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-22 06:00:37'),
(2, 'Partial Service', 'Partial Service', 1, 1, 1, '2020-02-22 06:00:46', '2020-02-22 06:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `kp_user`
--

CREATE TABLE `kp_user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `authkey` varchar(256) NOT NULL,
  `access_token` varchar(256) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_user`
--

INSERT INTO `kp_user` (`id`, `role_id`, `created_by`, `updated_by`, `username`, `password`, `authkey`, `access_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 0, 1, 'admin', '$2y$13$hLRViCjkwFHilPqBIAZR7uRAdQMSb2Mysz9eHD2elAqk5oX.y/u/K', '4EWMCIOKOY', 'LNSCOTEFYO', 1, '2020-02-18 06:30:18', '2020-02-20 01:01:01'),
(11, 9, 1, 1, 'roel', '$2y$13$deU9JpFqywD.ZDu1FUHm9.TiTnNR5zihaus0xOD1KmQesk7aZLLC.', 'GJLQX2AQOI', 'RRPVG3INCZ', 1, '0000-00-00 00:00:00', '2020-02-24 02:23:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kp_announcement`
--
ALTER TABLE `kp_announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`,`updated_by`);

--
-- Indexes for table `kp_dashboard_carousel`
--
ALTER TABLE `kp_dashboard_carousel`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `kp_announcement`
--
ALTER TABLE `kp_announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kp_dashboard_carousel`
--
ALTER TABLE `kp_dashboard_carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_equipment`
--
ALTER TABLE `kp_equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_equipment_category`
--
ALTER TABLE `kp_equipment_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_job_order`
--
ALTER TABLE `kp_job_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kp_log`
--
ALTER TABLE `kp_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `kp_mode_of_payment`
--
ALTER TABLE `kp_mode_of_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kp_portfolio`
--
ALTER TABLE `kp_portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kp_portfolio_category`
--
ALTER TABLE `kp_portfolio_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_product`
--
ALTER TABLE `kp_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_profile`
--
ALTER TABLE `kp_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kp_purchase_order`
--
ALTER TABLE `kp_purchase_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_quotation`
--
ALTER TABLE `kp_quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_role`
--
ALTER TABLE `kp_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kp_service`
--
ALTER TABLE `kp_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_setting`
--
ALTER TABLE `kp_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kp_specification`
--
ALTER TABLE `kp_specification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kp_trade_reference`
--
ALTER TABLE `kp_trade_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_type_of_service`
--
ALTER TABLE `kp_type_of_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kp_user`
--
ALTER TABLE `kp_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
