-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2021 at 04:22 PM
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
-- Table structure for table `system_notifications`
--

CREATE TABLE `system_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `message` text,
  `email_to` enum('admin','staff','client') DEFAULT NULL,
  `status` enum('unread','read') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_notifications`
--

INSERT INTO `system_notifications` (`id`, `user_id`, `type`, `area_id`, `message`, `email_to`, `status`, `created_at`, `updated_at`) VALUES
(2, 6, 'approved_client', 1, '(6) Panfilo Remedio is now added to your client’s list. Click <a href=\"/client_list\">here</a> for details.', 'staff', 'unread', '2021-03-24 05:16:58', '2021-03-24 05:16:58'),
(3, 6, 'approved_client', 1, 'Hi,Panfilo Remedio. Welcome to creamline. You can now order <a href=\"/shop\">here.</a>', 'client', 'unread', '2021-03-24 05:16:58', '2021-03-24 05:16:58'),
(4, 6, 'approved_client_store', 1, 'Your new store named Zhavia Store located in Aloran Osamiz City has been approved. Click <a href=\"/store\">here</a> to see assigned sales agent. ', 'client', 'unread', '2021-03-27 05:49:39', '2021-03-27 05:49:39'),
(5, 10, 'approved_client', 1, '(10) 1Ping Remz is now added to your client’s list. Click <a href=\"/client_list\">here</a> for details.', 'staff', 'unread', '2021-03-27 06:59:59', '2021-03-27 06:59:59'),
(6, 10, 'approved_client', 1, 'Hi,1Ping Remz. Welcome to creamline. You can now order <a href=\"/shop\">here</a>.', 'client', 'unread', '2021-03-27 06:59:59', '2021-03-27 06:59:59'),
(7, 13, 'approved_client', 11, '(13) Ping Remz is now added to your client’s list. Click <a href=\"/client_list\">here</a> for details.', 'staff', 'unread', '2021-03-27 07:05:58', '2021-03-27 07:05:58'),
(8, 13, 'approved_client', 11, 'Hi,Ping Remz. Welcome to creamline. You can now order <a href=\"/shop\">here</a>.', 'client', 'unread', '2021-03-27 07:05:58', '2021-03-27 07:05:58'),
(9, 6, 'approved_client_store', 1, 'Your new store named Zynia Store located in Aloran Cebu has been approved. Click <a href=\"/store\">here</a> to see assigned sales agent. ', 'client', 'unread', '2021-03-27 07:18:28', '2021-03-27 07:18:28'),
(10, 6, 'disapproved_client_store', 1, 'Your new store named Zynia located\r\n                in Pilit has been declined. Click <a href=\"/store\">here</a> to see\r\n                assigned sales agent. Please contact us or your\r\n                sales agent to discuss the problem.', 'client', 'unread', '2021-03-27 07:19:33', '2021-03-27 07:19:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `system_notifications`
--
ALTER TABLE `system_notifications`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `system_notifications`
--
ALTER TABLE `system_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
