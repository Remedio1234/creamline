-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2021 at 03:03 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `creamline_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_reports`
--

CREATE TABLE `product_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `report_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flavor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `issued_by` int(11) DEFAULT NULL,
  `is_replaced` int(11) DEFAULT NULL,
  `delivery_date` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_reports`
--

INSERT INTO `product_reports` (`id`, `product_id`, `report_type`, `size`, `flavor`, `store_id`, `client_id`, `issued_by`, `is_replaced`, `delivery_date`, `reason`, `created_at`, `updated_at`) VALUES
(13, NULL, 'Replacement', NULL, NULL, 1, 3, 2, 0, NULL, 'this is staff issue', '2021-03-09 04:56:14', '2021-03-10 05:57:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_reports`
--
ALTER TABLE `product_reports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_reports`
--
ALTER TABLE `product_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
