-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 03:46 PM
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
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ads_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `ads_image`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, '1691933544.jpg', 0, '2020-10-21 07:22:57', '2021-02-27 02:36:17'),
(2, '2060903152.jpg', 0, '2020-10-21 07:23:02', '2021-02-27 02:36:25');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `area_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `area_name`, `area_code`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Cebu City', '6000', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(2, 'Alcantara City', '6033', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(3, 'Boljoon', '6024', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(4, 'Danao City', '6004', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(5, 'Moalboal', '6032', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(6, 'Santander', '6026', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(7, 'Naga City', '6037', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(8, 'Dumanjug', '6035', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(9, 'Carcar', '6019', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(10, 'Mandaue', '6014', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(11, 'Compostela', '6003', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(12, 'Talisay City', '6045', 0, '2020-06-06 12:44:12', '2020-06-06 12:45:36'),
(13, 'surigao', '8908', 0, '2021-02-24 04:56:58', '2021-02-24 04:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_areas`
--

CREATE TABLE `assigned_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assigned_areas`
--

INSERT INTO `assigned_areas` (`id`, `user_id`, `area_id`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '2021-03-05 07:20:44', '2021-03-05 07:20:44');

-- --------------------------------------------------------

--
-- Table structure for table `carousels`
--

CREATE TABLE `carousels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `carousel_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_new_arrival` tinyint(1) NOT NULL,
  `is_best_sellers` tinyint(1) NOT NULL,
  `is_carousel` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flavor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` double(8,2) NOT NULL,
  `is_checkout` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `is_placed` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '0 - no, 1 - yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `user_id`, `product_image`, `product_name`, `product_description`, `size`, `flavor`, `quantity`, `subtotal`, `is_checkout`, `is_placed`, `created_at`, `updated_at`) VALUES
(25, 2, 3, '1571710643.jpg', 'Chocolate Ice Cream', 'Chocolate Ice Cream Description', '2', 'Mango', 1, 99.00, '0', '0', '2021-03-07 01:09:28', '2021-03-07 01:09:28'),
(26, 2, 3, '1571710643.jpg', 'Chocolate Ice Cream', 'Chocolate Ice Cream Description', '2', 'Mango', 2, 99.00, '0', '0', '2021-03-07 04:02:08', '2021-03-07 04:02:08'),
(27, 2, 3, '1571710643.jpg', 'Chocolate Ice Cream', 'Chocolate Ice Cream Description', '2', 'Mango', 2, 99.00, '0', '0', '2021-03-07 04:08:46', '2021-03-07 04:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fridges`
--

CREATE TABLE `fridges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fridges`
--

INSERT INTO `fridges` (`id`, `user_id`, `model`, `description`, `location`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(2, 3, 'Panasonic', 'test', '2', 2, 0, '2021-02-26 17:23:51', '2021-03-08 06:41:17'),
(3, 3, 'Samsung', 'hehehehe', NULL, 4, 0, '2021-03-07 04:25:01', '2021-03-08 06:07:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_05_30_144612_create_ads_table', 1),
(5, '2020_05_30_144944_create_areas_table', 1),
(6, '2020_05_30_145123_create_stores_table', 1),
(7, '2020_05_30_145220_create_fridges_table', 1),
(8, '2020_05_30_145242_create_products_table', 1),
(9, '2020_05_30_145257_create_variations_table', 1),
(10, '2020_05_30_145319_create_stocks_table', 1),
(11, '2020_05_30_145331_create_promos_table', 1),
(12, '2020_05_30_145343_create_orders_table', 1),
(13, '2020_05_30_145432_create_product_file_reports_table', 1),
(14, '2020_06_28_082050_create_carts_table', 1),
(15, '2020_07_31_071139_create_sales_report_table', 1),
(16, '2020_08_02_060748_create_notifications_table', 1),
(17, '2020_08_02_060905_create_quotas_table', 1),
(18, '2020_08_24_124726_create_carousels_table', 1),
(19, '2020_08_24_125734_create_product_reports_table', 1),
(20, '2020_10_21_130102_create_product_damages_table', 1),
(21, '2020_10_21_130637_create_product_file_damages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `note_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `note_description`, `order_id`, `stock_id`, `user_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(22, 'Thank you for ordering Creamline Products. Your Order # 18 has been accepted. Total amount purchased of PHP 30. Please expect it to be delivered on February 27 2021.', 0, 0, 0, 3, '2021-02-27 03:01:26', '2021-02-27 03:01:26'),
(23, 'Thank you for ordering Creamline Products. Your Order # 19 has been accepted. Total amount purchased of PHP 10. Please expect it to be delivered on February 28 2021.', 0, 0, 0, 3, '2021-02-27 03:01:38', '2021-02-27 03:01:38'),
(24, 'Your Quota for Year 2021 has been set!', 0, 0, 1, 0, '2021-02-27 03:39:31', '2021-02-27 03:39:31'),
(25, 'Thank you for ordering Creamline Products. Your Invoice # 2102280001 has been accepted. Total amount purchased of PHP 15.00. Please expect it to be delivered on March 1 2021.', 0, 0, 0, 3, '2021-03-01 04:05:01', '2021-03-01 04:05:01'),
(26, 'Thank you for ordering Creamline Products. Your Invoice # 2102280001 has been accepted. Total amount purchased of PHP 15.00. Please expect it to be delivered on March 1 2021.', 0, 0, 0, 3, '2021-03-01 04:08:23', '2021-03-01 04:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flavor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity_ordered` int(11) DEFAULT NULL,
  `ordered_total_price` double(8,2) DEFAULT NULL,
  `quantity_received` int(11) DEFAULT NULL,
  `received_total_price` double(8,2) DEFAULT NULL,
  `is_replacement` tinyint(1) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `is_cancelled` tinyint(1) DEFAULT NULL,
  `is_rescheduled` tinyint(1) DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT NULL,
  `cancelled_by` int(11) NOT NULL,
  `attempt` int(11) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `invoice_id`, `delivery_date`, `store_id`, `product_id`, `size`, `flavor`, `quantity_ordered`, `ordered_total_price`, `quantity_received`, `received_total_price`, `is_replacement`, `is_approved`, `is_cancelled`, `is_rescheduled`, `is_completed`, `cancelled_by`, `attempt`, `reason`, `created_at`, `updated_at`) VALUES
(24, 3, 14, '2021-03-01', 1, 1, '12ml', 'Ube', 1, 10.00, 0, 0.00, 0, 1, 0, 0, 0, 0, 0, 'test', '2021-02-28 03:09:34', '2021-03-01 04:08:23'),
(25, 3, 14, '2021-03-01', 1, 2, '2ml', 'Milo', 1, 5.00, 0, 0.00, 0, 1, 0, 0, 0, 0, 0, 'test', '2021-02-28 03:09:34', '2021-03-01 04:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_invoice`
--

CREATE TABLE `order_invoice` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_invoice`
--

INSERT INTO `order_invoice` (`id`, `user_id`, `invoice_no`, `created_at`, `updated_at`) VALUES
(14, 3, '2102280001', '2021-02-28 03:09:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `product_image`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Ube Pandan', 'Ube Pandan Description', '741108362.jpg', 1, '2020-10-21 05:38:40', '2021-03-07 00:46:41'),
(2, 'Chocolate Ice Cream', 'Chocolate Ice Cream Description', '1571710643.jpg', 0, '2020-10-21 05:40:22', '2021-02-27 02:38:41'),
(3, 'Mocha Ice Cream', 'Mocha Ice Cream Description', '1230981259.jpg', 0, '2020-10-21 05:40:42', '2021-02-26 17:15:26'),
(4, 'Hall', 'test', '1552977094.jpg', 0, '2021-03-07 00:02:29', '2021-03-07 03:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `product_damages`
--

CREATE TABLE `product_damages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flavor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` int(11) NOT NULL,
  `is_replaced` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_file_damages`
--

CREATE TABLE `product_file_damages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_damage_id` int(11) NOT NULL,
  `file_damage_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_file_reports`
--

CREATE TABLE `product_file_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_report_id` int(11) NOT NULL,
  `file_report_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_file_reports`
--

INSERT INTO `product_file_reports` (`id`, `product_report_id`, `file_report_image`, `created_at`, `updated_at`) VALUES
(8, 5, '177258245.jpg', '2021-02-27 03:22:43', '2021-02-27 03:22:43'),
(9, 6, '1152308552.jpg', '2021-03-02 05:13:16', '2021-03-02 05:13:16'),
(10, 6, '1723873308.jpg', '2021-03-02 05:13:16', '2021-03-02 05:13:16'),
(11, 7, '706865954.jpg', '2021-03-02 05:16:26', '2021-03-02 05:16:26'),
(12, 7, '470452462.jpg', '2021-03-02 05:16:26', '2021-03-02 05:16:26'),
(13, 7, '2107565468.jpg', '2021-03-02 05:16:26', '2021-03-02 05:16:26');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `is_replaced` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_reports`
--

INSERT INTO `product_reports` (`id`, `product_id`, `report_type`, `size`, `flavor`, `store_id`, `client_id`, `is_replaced`, `created_at`, `updated_at`) VALUES
(5, 0, 'Damage', ' ', ' ', 1, 3, 0, '2021-02-27 03:22:43', '2021-02-27 03:22:43'),
(7, NULL, 'Replacement', NULL, NULL, 1, 2, 0, '2021-03-02 05:16:25', '2021-03-02 05:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `promos`
--

CREATE TABLE `promos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `promo_start_date` date NOT NULL,
  `promo_end_date` date NOT NULL,
  `promo_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `product_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotas`
--

CREATE TABLE `quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `jan` int(11) NOT NULL,
  `feb` int(11) NOT NULL,
  `mar` int(11) NOT NULL,
  `apr` int(11) NOT NULL,
  `may` int(11) NOT NULL,
  `jun` int(11) NOT NULL,
  `jul` int(11) NOT NULL,
  `aug` int(11) NOT NULL,
  `sep` int(11) NOT NULL,
  `oct` int(11) NOT NULL,
  `nov` int(11) NOT NULL,
  `dev` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quotas`
--

INSERT INTO `quotas` (`id`, `year`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `sep`, `oct`, `nov`, `dev`, `created_at`, `updated_at`) VALUES
(1, 2021, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, '2021-02-27 03:39:31', '2021-02-27 03:39:31');

-- --------------------------------------------------------

--
-- Table structure for table `replacement_products`
--

CREATE TABLE `replacement_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_report_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `replacement_products`
--

INSERT INTO `replacement_products` (`id`, `product_report_id`, `product_id`, `size`, `quantity`, `created_at`, `updated_at`) VALUES
(4, 5, 1, '12', 1, '2021-02-27 03:22:43', '2021-02-27 03:22:43'),
(5, 5, 2, '2', 2, '2021-02-27 03:22:43', '2021-02-27 03:22:43'),
(8, 7, 1, '12', 1, '2021-03-02 05:16:25', '2021-03-02 05:16:25'),
(9, 7, 2, '12', 2, '2021-03-02 05:16:25', '2021-03-02 05:16:25'),
(10, 7, 3, '1', 3, '2021-03-02 05:16:26', '2021-03-02 05:16:26');

-- --------------------------------------------------------

--
-- Table structure for table `sales_report`
--

CREATE TABLE `sales_report` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `threshold` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `quantity`, `threshold`, `created_at`, `updated_at`) VALUES
(18, 1, 0, 100, '2021-02-27 02:49:11', '2021-03-07 00:00:13'),
(19, 2, 499, 100, '2021-02-27 02:50:06', '2021-03-01 04:08:23'),
(20, 3, 25, 100, '2021-02-27 02:50:19', '2021-03-07 00:10:32'),
(24, 4, 0, 0, '2021-03-07 00:02:30', '2021-03-07 00:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `store_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `store_name`, `store_address`, `user_id`, `area_id`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'ClientAStore', 'Alcantara City Visayas', 3, 3, 0, '2021-02-27 02:17:22', '2021-03-06 21:01:38'),
(7, 'wwe', 'wewe', 16, 1, 1, '2021-03-06 21:53:16', '2021-03-06 21:59:35'),
(8, 'ClientBStore', 'ClientBStoreAddress', 3, 3, 0, '2021-03-08 05:35:19', '2021-03-08 05:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_role` int(11) DEFAULT NULL COMMENT '99 - admin, 1 - staff, 2 client',
  `is_active` tinyint(1) DEFAULT '0',
  `is_pending` tinyint(1) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `mname`, `lname`, `address`, `contact_num`, `email`, `email_verified_at`, `password`, `user_role`, `is_active`, `is_pending`, `img`, `remember_token`, `area_id`, `created_at`, `updated_at`) VALUES
(1, 'Admind', 'NA', 'NA', 'Pardo Cebu', '0912312321', 'act.dcatindoy@gmail.com', '2020-06-07 23:57:47', '$2y$10$EN8DMgNgmRlqVPmSOAvmJO9vM/VJHWvgsXkBg9A2wgLnwidiOpWDO', 99, 1, 0, '2048479171.jpg', 'HGDcK0gxbdNdtaUxWjFud9zBC7fbE3z6x01FtwczEoLuNjOQgxW4ByGr5uSr', 0, '2020-06-06 18:42:21', '2021-03-04 05:12:19'),
(2, 'StaffFirstnameA', 'O', 'StaffLastnameA', 'NA', '09322090821', 'staffEmailA@gmail.com', '2020-06-07 23:57:47', '$2y$10$UoOUGSERIbhyYez8iPxp7Ol348P4aXUNipACy76YqwIDP/RgBhp/u', 1, 1, 0, 'NA', 'ncJbQZ5j87rNicHgHIgfUbAynaAOmYDzWphpS2Phbk0Vgx0UevgCZgu6kk8j', 3, '2021-02-27 02:05:52', '2021-03-05 07:20:45'),
(3, 'ClientFirstNameA', 'A', 'ClientLastNameA', 'NA', '09157339459', 'clientEmailA@gmail.com', '2020-06-07 23:57:47', '$2y$10$z0jEk/.0x6XYGlGhT900AubrfgrVEGdY/4/SNKyLN2rT4drzXjYmi', 2, 1, 0, 'NA', 'fHkDJfkoRCblHd1cdKtepPAbTM25Uk9DwdoS3QLFThmtarVaRw6fT9U2NtzS', 0, '2021-02-27 02:17:22', '2021-03-06 20:46:52'),
(5, 'Panfilo', 'Ople', 'Remedio', 'Pilit Cabancalan', '09322090821', 'panfilo.glophics@gmail.com', NULL, '$2y$10$z610BuCXHv8ZaGyWOwvJbOXPu3nltO/uhhCyzZwrI.7oU4NH5Z98q', 2, 0, 0, '', NULL, 0, '2021-03-04 04:06:07', '2021-03-06 07:17:02'),
(13, 'wew', 'ewewe', 'wew', 'NA', '1212', 'test@yahoo.com', '2020-06-07 23:57:47', '$2y$10$vpl/PF5Bu4DyAeb.mZRfPeepsQiSf0Izd2T0iabdSWXCId3dol/lC', 2, 0, 1, 'NA', 'NA', 0, '2021-03-06 07:16:15', '2021-03-06 07:16:15'),
(14, 'wewe', 'wewew', 'ewew', 'NA', '1', 'test@yahoo.com', '2020-06-07 23:57:47', '$2y$10$8W82UssEYQywrEGaCfPwHepW/.ON.HkUKbyYJG2ZzMiYuAeISXTEm', 2, 0, 1, 'NA', 'NA', 0, '2021-03-06 07:24:12', '2021-03-06 07:24:12'),
(15, 'Panfilo', 'Remedio', 'Ople', 'NA', '09322090821', 'panfilo.glophics@gmail.com', '2020-06-07 23:57:47', '$2y$10$JJG4B3xZMA7pjYxB8FccCuQSfWKBy5SBqrbhkdn2x33EvTCLEseRG', 2, 0, 0, 'NA', 'NA', 0, '2021-03-06 20:54:13', '2021-03-06 20:54:13'),
(16, 'Panfilo', 'Ople', 'Remedio', 'NA', '09322090821', 'panfilo.glophics@gmail.com', '2020-06-07 23:57:47', '$2y$10$ljnUlC9tyPMuWI5RkZ2MweUJ9cUlEvuIdz5fNC4I14IVf9z2lh36m', 2, 1, 0, 'NA', 'NA', 0, '2021-03-06 20:59:18', '2021-03-06 20:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `user_fridges`
--

CREATE TABLE `user_fridges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `fridge_id` int(11) DEFAULT NULL,
  `sched_pullout` datetime DEFAULT NULL,
  `status` enum('available','unavailable') COLLATE utf8_unicode_ci DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_fridges`
--

INSERT INTO `user_fridges` (`id`, `user_id`, `store_id`, `fridge_id`, `sched_pullout`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 2, NULL, 'available', '2021-03-07 05:13:35', '2021-03-08 06:08:12'),
(3, 3, 1, 3, NULL, 'available', '2021-03-08 04:38:19', '2021-03-08 04:38:19');

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flavor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `promo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `product_id`, `size`, `flavor`, `price`, `promo`, `is_deleted`, `created_at`, `updated_at`) VALUES
(6, 1, '1,2,4,3,', '', '0,0,0,0,0,', '0,0,0,0,0,', 0, '2021-03-06 23:03:38', '2021-03-06 23:03:38'),
(7, 2, '2, 4,', 'Mango,Apple', '1,2,', '99,0,', 0, '2021-03-06 23:05:31', '2021-03-07 04:01:53'),
(8, 3, '1,', '', '0,0,', '0,0,', 0, '2021-03-06 23:06:41', '2021-03-06 23:06:41'),
(10, 4, '12,', '', '0,0,', '0,0,', 0, '2021-03-07 00:27:05', '2021-03-07 00:27:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assigned_areas`
--
ALTER TABLE `assigned_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carousels`
--
ALTER TABLE `carousels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fridges`
--
ALTER TABLE `fridges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_invoice`
--
ALTER TABLE `order_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_damages`
--
ALTER TABLE `product_damages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_file_damages`
--
ALTER TABLE `product_file_damages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_file_reports`
--
ALTER TABLE `product_file_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reports`
--
ALTER TABLE `product_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotas`
--
ALTER TABLE `quotas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replacement_products`
--
ALTER TABLE `replacement_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_report`
--
ALTER TABLE `sales_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_fridges`
--
ALTER TABLE `user_fridges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `assigned_areas`
--
ALTER TABLE `assigned_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carousels`
--
ALTER TABLE `carousels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fridges`
--
ALTER TABLE `fridges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `order_invoice`
--
ALTER TABLE `order_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_damages`
--
ALTER TABLE `product_damages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_file_damages`
--
ALTER TABLE `product_file_damages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_file_reports`
--
ALTER TABLE `product_file_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reports`
--
ALTER TABLE `product_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `promos`
--
ALTER TABLE `promos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotas`
--
ALTER TABLE `quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `replacement_products`
--
ALTER TABLE `replacement_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sales_report`
--
ALTER TABLE `sales_report`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_fridges`
--
ALTER TABLE `user_fridges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
