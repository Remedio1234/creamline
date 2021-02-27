-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2021 at 12:54 PM
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
(13, 1, 3, '741108362.jpg', 'Ube Pandan', 'Ube Pandan Description', '12ml', 'Ube', 3, 30.00, '1', '1', '2021-02-27 02:51:48', '2021-02-27 02:55:11'),
(14, 2, 3, '1571710643.jpg', 'Chocolate Ice Cream', 'Chocolate Ice Cream Description', '2ml', 'Milo', 2, 10.00, '1', '1', '2021-02-27 02:54:27', '2021-02-27 02:55:11');

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
(2, NULL, 'Panasonic1', 'test1', '2', 3, 0, '2021-02-26 17:23:51', '2021-02-26 17:39:34');

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
(24, 'Your Quota for Year 2021 has been set!', 0, 0, 1, 0, '2021-02-27 03:39:31', '2021-02-27 03:39:31');

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
(18, 3, 1, '2021-02-27', 1, 1, '12ml', 'Ube', 3, 30.00, 0, 0.00, 0, 1, 0, 0, 1, 0, 0, '', '2021-02-27 02:55:11', '2021-02-27 03:01:26'),
(19, 3, 1, '2021-02-28', 1, 2, '2ml', 'Milo', 2, 10.00, 0, 0.00, 0, 1, 1, 0, 0, 2, 0, 'busy', '2021-02-27 02:55:11', '2021-02-27 03:01:38');

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
(10, 3, '2102270001', '2021-02-27 02:55:11', NULL);

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
(1, 'Ube Pandan', 'Ube Pandan Description', '741108362.jpg', 0, '2020-10-21 05:38:40', '2021-02-26 17:14:52'),
(2, 'Chocolate Ice Cream', 'Chocolate Ice Cream Description', '1571710643.jpg', 0, '2020-10-21 05:40:22', '2021-02-27 02:38:41'),
(3, 'Mocha Ice Cream', 'Mocha Ice Cream Description', '1230981259.jpg', 0, '2020-10-21 05:40:42', '2021-02-26 17:15:26');

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
(8, 5, '177258245.jpg', '2021-02-27 03:22:43', '2021-02-27 03:22:43');

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
  `product_id` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flavor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `store_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `is_replaced` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_reports`
--

INSERT INTO `product_reports` (`id`, `product_id`, `size`, `flavor`, `store_id`, `client_id`, `is_replaced`, `created_at`, `updated_at`) VALUES
(5, 0, ' ', ' ', 1, 3, 0, '2021-02-27 03:22:43', '2021-02-27 03:22:43');

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
(5, 5, 2, '2', 2, '2021-02-27 03:22:43', '2021-02-27 03:22:43');

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
(18, 1, 1000, 100, '2021-02-27 02:49:11', '2021-02-27 02:49:59'),
(19, 2, 500, 100, '2021-02-27 02:50:06', '2021-02-27 02:50:06'),
(20, 3, 250, 100, '2021-02-27 02:50:19', '2021-02-27 02:50:19');

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
(1, 'ClientAStore', 'Alcantara City Visayas', 3, 2, 0, '2021-02-27 02:17:22', '2021-02-27 02:19:06');

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
(1, 'Admin', 'NA', 'NA', 'Pardo Cebu', '0912312321', 'act.dcatindoy@gmail.com', '2020-06-07 23:57:47', '$2y$10$EN8DMgNgmRlqVPmSOAvmJO9vM/VJHWvgsXkBg9A2wgLnwidiOpWDO', 99, 1, 0, 'NA', '1vfBuEBKsV2LBdwswCYAud5OGRukkG3q5IUpYOnUGsNZJGFozliMABb0XzdB', 0, '2020-06-06 18:42:21', '2020-06-07 23:57:47'),
(2, 'StaffFirstnameA', 'O', 'StaffLastnameA', 'NA', '09322090821', 'staffEmailA@gmail.com', '2020-06-07 23:57:47', '$2y$10$UoOUGSERIbhyYez8iPxp7Ol348P4aXUNipACy76YqwIDP/RgBhp/u', 1, 1, 0, 'NA', '9wbRoGV677VV2M1usdVCFAqCp06D0EWV4ed2j9hqqqv9Z30kokwqMx8YY5n4', 2, '2021-02-27 02:05:52', '2021-02-27 02:13:10'),
(3, 'ClientFirstNameA', 'A', 'ClientLastNameA', 'Alcants', '09157339459', 'clientEmailA@gmail.com', NULL, '$2y$10$z0jEk/.0x6XYGlGhT900AubrfgrVEGdY/4/SNKyLN2rT4drzXjYmi', 2, 1, 0, '1136335256.jpg', NULL, 0, '2021-02-27 02:17:22', '2021-02-27 03:15:40');

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
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `product_id`, `size`, `flavor`, `price`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, '12ml, 13ml,', 'Ube,Mango,Juice', '10,20,', 0, '2020-10-21 05:38:40', '2021-02-26 18:12:36'),
(2, 2, '2ml, 3ml,', 'Milo,Green', '5,25,', 0, '2020-10-21 05:40:22', '2021-02-27 02:40:15'),
(3, 3, '1ml, 2ml', 'Choco, Gatas', '100,200,', 0, '2020-10-21 05:40:43', '2021-02-26 18:52:40');

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
-- AUTO_INCREMENT for table `carousels`
--
ALTER TABLE `carousels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fridges`
--
ALTER TABLE `fridges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_invoice`
--
ALTER TABLE `order_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reports`
--
ALTER TABLE `product_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales_report`
--
ALTER TABLE `sales_report`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
