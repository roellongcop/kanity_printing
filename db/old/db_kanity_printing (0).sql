-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2020 at 07:29 AM
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
-- Table structure for table `kp_mode_of_payment`
--

CREATE TABLE `kp_mode_of_payment` (
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
-- Dumping data for table `kp_mode_of_payment`
--

INSERT INTO `kp_mode_of_payment` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash/Cheque On Delivery', 'Cash/Cheque On Delivery', 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Terms/Upon Completion of Delivery', 'Terms/Upon Completion of Delivery', 1, 1, 1, '2020-02-20 05:50:52', '2020-02-20 05:50:52');

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
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_profile`
--

INSERT INTO `kp_profile` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `position`, `company_name`, `company_address`, `tin`, `email`, `contact_number`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'roel', 'rivera', 'longcop', 'Web Developer', 'Filweb Asia INC', 'San Pedro Laguna', '52465547846', 'longcoproel@gmail.com', '09124435652', 0, 1, 1, '2020-02-19 01:35:17', '2020-02-19 05:09:43'),
(2, 8, 'weqwe', 'qweq', 'ewqeqwe', 'qweqweqw', 'qwe', 'qwe', '231ewqe', 'dqseqw@fdsad.com', 'saddad', 0, 0, 1, '2020-02-19 03:44:01', '2020-02-19 03:44:01'),
(3, 9, '12312', '321312', '13213', '123', '123', '123', '3123', 'qweqw@dasd.com', 'asdasd', 1, 1, 1, '2020-02-20 02:01:36', '2020-02-20 02:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `kp_quotation`
--

CREATE TABLE `kp_quotation` (
  `id` int(11) NOT NULL,
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
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_quotation`
--

INSERT INTO `kp_quotation` (`id`, `user_id`, `process_by`, `specs`, `description`, `quantity`, `mode_of_payment`, `images`, `created_by`, `updated_by`, `process_status`, `status`, `created_at`, `updated_at`) VALUES
(9, 1, 0, '312', '213', 123, 1, '', 1, 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, 0, '213', '123', 123, 123, '', 1, 1, 0, 1, '2020-02-20 01:18:55', '2020-02-20 01:18:55');

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
(8, 'Super Admin', '{\"dashboard\":[\"index\"],\"mode-of-payment\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"profile\":[\"index\",\"view\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"setting\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"profile\",\"view-profile\"]}', '[\"9\",\"8\"]', 0, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Customer', '{\"dashboard\":[\"index\"],\"profile\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"quotation\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"role\":[\"index\",\"view\",\"create\",\"update\",\"delete\"],\"site\":[\"index\",\"login\",\"logout\",\"signup\",\"signup-success\",\"verification\",\"home\"],\"user\":[\"index\",\"view\",\"create\",\"update\",\"delete\",\"profile\",\"view-profile\"]}', '[]', 0, 0, 1, '2020-02-18 06:52:39', '2020-02-19 04:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `kp_setting`
--

CREATE TABLE `kp_setting` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_setting`
--

INSERT INTO `kp_setting` (`id`, `created_by`, `updated_by`, `name`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'default_role', '9', 1, '2020-02-20 01:37:10', '2020-02-20 01:37:10');

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
(2, 9, 0, 1, 'roel', '$2y$13$Lkzyv2DL.3mdB5QJ/iYj4uc3LUDjj78KBGEuTK4hvjxA.tUAHioGm', 'RTU8EKUKXV', 'VW8RJPAS9J', 1, '2020-02-18 07:39:41', '2020-02-20 01:07:52'),
(3, 9, 0, 1, 'customer', '$2y$13$.1dq9AE15W0Oqwwe5IOa9OnQNikzPz4dIGQwFMoVJIpxwkyChnP3C', 'MZTHNHWBN', 'I32HNDXYPN', 1, '2020-02-19 01:46:58', '2020-02-20 01:07:55'),
(8, 9, 0, 0, 'eqwe', '$2y$13$OlnOqojdWh7V8KNLYwvsiea1Z1UbpIlysge.VRvprXpumUlTl7SDi', 'XQJE60BZEQ', 'D89W9ZELJD', 1, '2020-02-19 03:44:01', '2020-02-19 05:28:39'),
(9, 9, 1, 1, 'asdasd', '$2y$13$KBcRQfQFN2SEAoWncRUUVO1Ik8v1SvWDy.O0SjD7xjueHcdNwPaAG', 'VFL2RTQYVR', '6IR_35PC2Z', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kp_mode_of_payment`
--
ALTER TABLE `kp_mode_of_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kp_profile`
--
ALTER TABLE `kp_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
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
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `kp_role`
--
ALTER TABLE `kp_role`
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
-- AUTO_INCREMENT for table `kp_mode_of_payment`
--
ALTER TABLE `kp_mode_of_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kp_profile`
--
ALTER TABLE `kp_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_quotation`
--
ALTER TABLE `kp_quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kp_role`
--
ALTER TABLE `kp_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kp_setting`
--
ALTER TABLE `kp_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kp_user`
--
ALTER TABLE `kp_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
