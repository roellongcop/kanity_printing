-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2020 at 09:44 AM
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
(131, 1, 2, '{\"_csrf\":\"zi2tBt7qTAXM6qBPuGAwhslEv0z1Mr7B7Nk_yFtkjPaLQ51SjrM8VZ-bzAXqKlW0rA_oGJlW3YaEo2ChAy29qQ==\",\"Profile\":{\"last_name\":\"Doe\",\"middle_name\":\"Hello\",\"first_name\":\"John\",\"email\":\"john@gmail.com\",\"contact_number\":\"0923842237\",\"tin\":\"83474383429\",\"company_name\":\"Test Company\",\"position\":\"CEO\",\"company_address\":\"United States America\",\"image_input\":\"\"}}', 'POST', 'http://localhost/kanity_printing/user/build-profile', 'build-profile', 'user', 'Profile', 1, 1, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '::1', 'Chrome', 'Windows', 'Computer', 1, '2020-02-22 15:56:51', '2020-02-22 15:56:51');

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
(1, 1, 'Test', 'Description', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-21 12:13:14', 'uploads/portfolio/Category 1/alyana final.jpg');

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
(1, 'Category 1', 'Category 1', 1, 1, 1, '0000-00-00 00:00:00', '2020-02-22 11:23:49');

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
(1, 1, 'test', 'testr', 'test', 1, 1, 1, 'uploads/products/Service 1/borders-png-hd-png-small-medium-large-600.png', '0000-00-00 00:00:00', '2020-02-21 12:14:15');

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
(3, 2, '3242', '42342342', 1, 1, 0, 1, '2020-02-22 15:04:33', '2020-02-22 15:04:33'),
(4, 3, 'test', 'eqeqw', 1, 1, 0, 1, '2020-02-22 15:32:18', '2020-02-22 15:32:18');

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
  `mode_of_payment` int(11) NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `process_status` int(11) NOT NULL DEFAULT '0',
  `price_per_piece` decimal(10,2) NOT NULL,
  `type_of_service_id` int(11) NOT NULL,
  `po_no` varchar(64) NOT NULL,
  `customer_note` text NOT NULL,
  `note` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_quotation`
--

INSERT INTO `kp_quotation` (`id`, `quotation_no`, `user_id`, `process_by`, `specs`, `description`, `quantity`, `mode_of_payment`, `images`, `created_by`, `updated_by`, `process_status`, `price_per_piece`, `type_of_service_id`, `po_no`, `customer_note`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KPI-00001', 11, 1, 'Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', 100, 1, '{\"0\":\"uploads\\/quotation\\/27249.jpg\",\"1\":\"uploads\\/quotation\\/58887c73bc2fc2ef3a186072.png\",\"3\":\"uploads\\/quotation\\/898438-disney-princess-backgrounds-1920x1200-for-phones.jpg\"}', 1, 1, 1, '122.00', 1, '2321', '3123', 'please this is a test', 1, '0000-00-00 00:00:00', '2020-02-22 07:34:41'),
(2, 'KPI-00002', 11, 0, 'Fully Sensitized CBS 1 - Regular Paper 80gsm (Without Watermark)', 'test', 22, 2, '[\"uploads\\/quotation\\/alyana final.jpg\",\"uploads\\/quotation\\/alyana final2.jpg\",\"uploads\\/quotation\\/borders-png-hd-png-small-medium-large-600.png\"]', 1, 1, 4, '5200.00', 2, '', '', '', 1, '0000-00-00 00:00:00', '2020-02-22 15:04:33'),
(3, 'KPI-00003', 1, 1, 'Fully Sensitized CBS 1 - Regular Paper 80gsm (Without Watermark)', '231', 233, 1, '[\"uploads\\/quotation\\/cvbnm.jpg\",\"uploads\\/quotation\\/dgth.jpg\"]', 1, 1, 4, '232.00', 2, '', '', 'test', 1, '0000-00-00 00:00:00', '2020-02-22 15:32:18'),
(4, 'KPI-00004', 1, 1, 'Half Sensitized CBS 1 - Regular Paper 80gsm (With Watermark)', '323', 2312, 2, '[\"uploads\\/quotation\\/borders-png-hd-png-small-medium-large-600.png\"]', 1, 1, 2, '0.00', 0, '', '', '', 1, '0000-00-00 00:00:00', '2020-02-22 15:33:14');

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
(8, 'Super Admin', '{\"dashboard\":[\"index\"],\"log\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio-category\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"portfolio\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"product\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"purchase-order\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"no-bid\",\"cancel\",\"set-quotation\",\"send-po\",\"create\",\"update\",\"delete\",\"remove-image\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"specification\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"type-of-service\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"user\":[\"index\",\"my-account\",\"view\",\"create\",\"update\",\"delete\",\"create-profile\",\"view-profile\",\"my-profile\",\"build-profile\",\"update-account\"]}', '[\"9\",\"10\",\"8\"]', 0, 1, 1, '0000-00-00 00:00:00', '2020-02-22 15:07:37'),
(9, 'Customer', '{\"dashboard\":[\"index\"],\"profile\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"profile\",\"view-profile\"]}', '[]', 0, 0, 1, '2020-02-18 06:52:39', '2020-02-19 04:49:40'),
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
(1, 'Service 1', 'test', 'test', 1, 1, 1, 'uploads/services/alyana final2.jpg', '0000-00-00 00:00:00', '2020-02-21 12:13:36');

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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_setting`
--

INSERT INTO `kp_setting` (`id`, `created_by`, `updated_by`, `default_role`, `pagination`, `timezone`, `quotation_no_padding`, `quotation_no_prefix`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9, 10, 'America/New_York', 5, 'KPI-', 1, '0000-00-00 00:00:00', '2020-02-22 11:56:44');

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
(11, 9, 1, 1, 'roel', '$2y$13$ucUvDbFW5fLLBr9rv3hwQunFMI0cuwF0RD0Owbr.fng5WkMZToP.6', 'EGAF0S7GGF', 'K6YQW_C2VL', 1, '0000-00-00 00:00:00', '2020-02-21 04:10:10');

--
-- Indexes for dumped tables
--

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
  ADD KEY `type_of_service_id` (`type_of_service_id`);

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
-- AUTO_INCREMENT for table `kp_log`
--
ALTER TABLE `kp_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `kp_mode_of_payment`
--
ALTER TABLE `kp_mode_of_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kp_portfolio`
--
ALTER TABLE `kp_portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kp_portfolio_category`
--
ALTER TABLE `kp_portfolio_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kp_product`
--
ALTER TABLE `kp_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kp_profile`
--
ALTER TABLE `kp_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kp_purchase_order`
--
ALTER TABLE `kp_purchase_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_quotation`
--
ALTER TABLE `kp_quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_role`
--
ALTER TABLE `kp_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kp_service`
--
ALTER TABLE `kp_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
