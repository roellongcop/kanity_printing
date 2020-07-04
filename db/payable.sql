-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2020 at 01:48 AM
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
-- Table structure for table `kp_payable`
--

CREATE TABLE `kp_payable` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(256) DEFAULT NULL,
  `transaction` text,
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `date_paid` date DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_payable`
--

INSERT INTO `kp_payable` (`id`, `company_name`, `transaction`, `amount`, `date_paid`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Maron Builders Company', 'Materials Delivery', '25000.00', '2020-03-19', 0, '2020-03-22 03:33:39', '2020-03-22 06:48:33', 1, 1),
(2, 'Maron Builders Company', 'Materials Delivery', '20.00', '2020-03-19', 1, '2020-03-22 03:33:39', '2020-03-22 06:54:54', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kp_payable`
--
ALTER TABLE `kp_payable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kp_payable`
--
ALTER TABLE `kp_payable`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
