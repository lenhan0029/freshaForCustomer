-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 27, 2021 at 05:24 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cnpm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `salt` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`avatar`)),
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `staff_id` int(10) NOT NULL,
  `start_time` timestamp NULL DEFAULT current_timestamp(),
  `end_time` timestamp NULL DEFAULT current_timestamp(),
  `total_price` float NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `customer_id`, `store_id`, `staff_id`, `start_time`, `end_time`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '2021-12-23 09:03:45', '2021-12-23 10:03:45', 200, 1, '2021-12-23 09:05:01', '2021-12-23 09:05:01'),
(2, 1, 2, 4, '2021-12-24 09:03:45', '2021-12-24 10:03:45', 300, 1, '2021-12-23 09:05:01', '2021-12-23 09:05:01');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_detail`
--

CREATE TABLE `appointment_detail` (
  `service_id` int(10) NOT NULL,
  `appointment_id` int(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `appointment_detail`
--

INSERT INTO `appointment_detail` (`service_id`, `appointment_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-12-23 09:14:30', '2021-12-23 09:14:30'),
(2, 1, 1, '2021-12-23 09:14:30', '2021-12-23 09:14:30'),
(3, 2, 1, '2021-12-23 09:20:01', '2021-12-23 09:20:01'),
(4, 2, 1, '2021-12-23 09:20:01', '2021-12-23 09:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `business_time`
--

CREATE TABLE `business_time` (
  `id` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_week` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `business_time`
--

INSERT INTO `business_time` (`id`, `store_id`, `start_time`, `end_time`, `day_of_week`, `created_at`, `updated_at`) VALUES
(1, 1, '08:00:00', '17:00:00', 'Monday', '2021-12-23 09:32:46', '2021-12-23 09:32:46'),
(2, 1, '08:00:00', '17:00:00', 'Tuesday', '2021-12-23 09:33:03', '2021-12-23 09:33:03'),
(3, 1, '08:00:00', '17:00:00', 'Wednesday', '2021-12-23 09:33:24', '2021-12-23 09:33:24'),
(4, 1, '08:00:00', '17:00:00', 'Thursday', '2021-12-23 09:33:37', '2021-12-23 09:33:37'),
(5, 1, '08:00:00', '17:00:00', 'Friday', '2021-12-23 09:33:47', '2021-12-23 09:33:47');

-- --------------------------------------------------------

--
-- Table structure for table `closed_date`
--

CREATE TABLE `closed_date` (
  `id` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `start_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `reson` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `gender` enum('MALE','FEMALE') COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `salt` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`avatar`)),
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `gender`, `phone`, `email`, `password`, `salt`, `avatar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Huynh', 'Loc', 'FEMALE', '0123456789', 'huynhloc@gmail.com', '3d55a249c559fdd849bc80f07022d659', 'uEbHhwJMLSsxknTbvFGEqvygxtEUcqxGWUXAqeHeerxjGzPwEk', NULL, 1, '2021-12-23 09:01:39', '2021-12-23 09:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `grant_permission`
--

CREATE TABLE `grant_permission` (
  `id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  `permission_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `grant_permission`
--

INSERT INTO `grant_permission` (`id`, `role_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) NOT NULL,
  `appointment_id` int(10) NOT NULL,
  `staff_id` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `voucher_id` int(10) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `payment_method` enum('CASH','CARD') COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `discount` float DEFAULT 0,
  `cash` float DEFAULT 0,
  `total` float DEFAULT 0,
  `balance` float DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE `license` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `rules` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `percent` float NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `license_store`
--

CREATE TABLE `license_store` (
  `id` int(10) NOT NULL,
  `admin_id` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `license_id` int(10) NOT NULL,
  `expired` datetime NOT NULL,
  `percent` float NOT NULL,
  `status` int(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Create Appointment', NULL, '2021-12-23 08:33:39', '2021-12-23 08:33:39'),
(2, 'Update Appointment', NULL, '2021-12-23 08:33:39', '2021-12-23 08:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `store_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Owner', '2021-12-23 08:43:36', '2021-12-23 08:44:11'),
(2, 1, 'Staff', '2021-12-23 08:44:00', '2021-12-23 08:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `price` float NOT NULL,
  `discount` float DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `store_id`, `name`, `price`, `discount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hair Cut', 5, NULL, 1, '2021-12-23 09:11:12', '2021-12-23 09:11:12'),
(2, 1, 'Tattoo', 10, NULL, 1, '2021-12-23 09:11:53', '2021-12-23 09:11:53'),
(3, 2, 'Back, Neck and Shoulder Massage', 8, NULL, 1, '2021-12-23 09:19:03', '2021-12-23 09:19:03'),
(4, 2, 'Traditional Thai Massage', 15, NULL, 1, '2021-12-23 09:19:03', '2021-12-23 09:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `salt` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`avatar`)),
  `status` int(1) NOT NULL DEFAULT 1,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `store_id`, `role_id`, `first_name`, `last_name`, `phone`, `email`, `password`, `salt`, `avatar`, `status`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Thuan', 'Vo', '0123456789', 'admin@gmail.com', '3d55a249c559fdd849bc80f07022d659', 'uEbHhwJMLSsxknTbvFGEqvygxtEUcqxGWUXAqeHeerxjGzPwEk', NULL, 1, NULL, NULL, '2021-12-23 08:47:33', '2021-12-23 08:49:05'),
(2, 1, 2, 'Nhan', 'Le', '0987654321', 'staff@gmail.com', '04f6cbedf46e746614916262ff2eaa10', 'ZnGmaNTaCVTIgTQAYTBhoxlwhTwQiIDBtuDwrKHZUYYujNrVlm', NULL, 1, NULL, NULL, '2021-12-23 08:48:53', '2021-12-23 08:48:53'),
(3, 2, 1, 'Nhu', 'Vo', '096473821', 'nhuvo@gmail.com', '3d55a249c559fdd849bc80f07022d659', 'uEbHhwJMLSsxknTbvFGEqvygxtEUcqxGWUXAqeHeerxjGzPwEk', NULL, 1, NULL, NULL, '2021-12-23 08:51:37', '2021-12-23 08:51:37'),
(4, 2, 2, 'Trung', 'Nguyen', '0127493027', 'trungnguyen@gmail.com', '04f6cbedf46e746614916262ff2eaa10', 'ZnGmaNTaCVTIgTQAYTBhoxlwhTwQiIDBtuDwrKHZUYYujNrVlm', NULL, 1, NULL, NULL, '2021-12-23 08:51:37', '2021-12-23 08:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `staff_working`
--

CREATE TABLE `staff_working` (
  `id` int(10) NOT NULL,
  `staff_id` int(10) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `total_time` float NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `staff_working`
--

INSERT INTO `staff_working` (`id`, `staff_id`, `start_time`, `end_time`, `total_time`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-12-26 08:00:00', '2021-12-26 17:00:14', 9, '2021-12-23 09:57:22', '2021-12-23 09:57:22'),
(2, 1, '2021-12-27 08:00:00', '2021-12-27 17:00:14', 9, '2021-12-23 09:57:53', '2021-12-23 09:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(10) NOT NULL,
  `owner_id` int(10) NOT NULL,
  `type_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `cover` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cover`)),
  `address` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `owner_id`, `type_id`, `name`, `description`, `cover`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Beaty Salon', NULL, NULL, NULL, 1, '2021-12-23 08:41:46', '2021-12-23 08:52:26'),
(2, 3, 1, 'Best Salon', NULL, NULL, NULL, 1, '2021-12-23 08:42:30', '2021-12-23 08:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Salon', NULL, 1, '2021-12-23 08:29:46', '2021-12-23 08:29:46'),
(2, 'Massage', NULL, 1, '2021-12-23 08:29:46', '2021-12-23 08:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `value` float NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `code` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `expired` date NOT NULL,
  `number_of_sales` int(10) NOT NULL,
  `voucher_description` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `appointment_detail`
--
ALTER TABLE `appointment_detail`
  ADD PRIMARY KEY (`appointment_id`,`service_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `business_time`
--
ALTER TABLE `business_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `closed_date`
--
ALTER TABLE `closed_date`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `grant_permission`
--
ALTER TABLE `grant_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `voucher_id` (`voucher_id`);

--
-- Indexes for table `license`
--
ALTER TABLE `license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `license_store`
--
ALTER TABLE `license_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `license_id` (`license_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`) USING BTREE;

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `staff_working`
--
ALTER TABLE `staff_working`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`) USING BTREE,
  ADD KEY `type_id` (`type_id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_time`
--
ALTER TABLE `business_time`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `closed_date`
--
ALTER TABLE `closed_date`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `license_store`
--
ALTER TABLE `license_store`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `appointment_detail`
--
ALTER TABLE `appointment_detail`
  ADD CONSTRAINT `appointment_detail_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `appointment_detail_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

--
-- Constraints for table `business_time`
--
ALTER TABLE `business_time`
  ADD CONSTRAINT `business_time_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `closed_date`
--
ALTER TABLE `closed_date`
  ADD CONSTRAINT `closed_date_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `grant_permission`
--
ALTER TABLE `grant_permission`
  ADD CONSTRAINT `grant_permission_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `grant_permission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`),
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `invoices_ibfk_4` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`);

--
-- Constraints for table `license_store`
--
ALTER TABLE `license_store`
  ADD CONSTRAINT `license_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `license_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `license_store_ibfk_1` FOREIGN KEY (`license_id`) REFERENCES `license` (`id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `staffs_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `staff_working`
--
ALTER TABLE `staff_working`
  ADD CONSTRAINT `staff_working_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `staffs` (`id`),
  ADD CONSTRAINT `stores_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);

--
-- Constraints for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `vouchers_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
