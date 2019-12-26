-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Dec 26, 2019 at 10:06 PM
-- Server version: 5.7.28
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gifts_delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `slug`, `name`, `created_at`, `updated_at`) VALUES
(1, 'rabat', 'Rabat', '2019-12-26 13:20:02', '2019-12-26 13:20:02'),
(2, 'casa', 'Casa', '2019-12-26 13:20:24', '2019-12-26 13:20:24'),
(3, 'tangier', 'Tangier', '2019-12-26 13:20:29', '2019-12-26 13:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `city_delivery_times`
--

DROP TABLE IF EXISTS `city_delivery_times`;
CREATE TABLE IF NOT EXISTS `city_delivery_times` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_time_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `city_delivery_times_delivery_time_id_foreign` (`delivery_time_id`),
  KEY `city_delivery_times_city_id_delivery_time_id_index` (`city_id`,`delivery_time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city_delivery_times`
--

INSERT INTO `city_delivery_times` (`id`, `city_id`, `delivery_time_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2019-12-26 14:23:26', '2019-12-26 14:23:26'),
(2, 3, 4, '2019-12-26 14:23:26', '2019-12-26 14:23:26'),
(3, 3, 6, '2019-12-26 14:23:26', '2019-12-26 14:23:26'),
(4, 1, 2, '2019-12-26 15:51:20', '2019-12-26 15:51:20'),
(5, 1, 4, '2019-12-26 15:51:20', '2019-12-26 15:51:20'),
(6, 2, 3, '2019-12-26 15:52:36', '2019-12-26 15:52:36'),
(7, 2, 5, '2019-12-26 15:52:36', '2019-12-26 15:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_times`
--

DROP TABLE IF EXISTS `delivery_times`;
CREATE TABLE IF NOT EXISTS `delivery_times` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `span` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_times`
--

INSERT INTO `delivery_times` (`id`, `span`, `created_at`, `updated_at`) VALUES
(1, '9AM->13PM', '2019-12-26 13:20:05', '2019-12-26 13:20:05'),
(2, '9AM->12PM', '2019-12-26 13:20:57', '2019-12-26 13:20:57'),
(3, '10AM->13PM', '2019-12-26 13:21:10', '2019-12-26 13:21:10'),
(4, '14PM->18PM', '2019-12-26 13:21:24', '2019-12-26 13:21:24'),
(5, '15PM->19PM', '2019-12-26 13:21:36', '2019-12-26 13:21:36'),
(6, '18PM->20PM', '2019-12-26 13:21:50', '2019-12-26 13:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `excluded_city_delivery_times`
--

DROP TABLE IF EXISTS `excluded_city_delivery_times`;
CREATE TABLE IF NOT EXISTS `excluded_city_delivery_times` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_delivery_time_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `excluded_city_delivery_times_city_delivery_time_id_unique` (`city_delivery_time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `excluded_city_delivery_times`
--

INSERT INTO `excluded_city_delivery_times` (`id`, `city_delivery_time_id`, `delivery_date`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-12-28', '2019-12-26 21:48:06', '2019-12-26 21:48:06'),
(2, 2, '2019-12-28', '2019-12-26 21:48:08', '2019-12-26 21:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_25_224900_create_cities_table', 1),
(2, '2019_12_25_225503_create_delivery_times', 1),
(3, '2019_12_25_225807_create_city_delivery_times', 1),
(5, '2019_12_26_141350_create_excluded_city_delivery_times_table', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city_delivery_times`
--
ALTER TABLE `city_delivery_times`
  ADD CONSTRAINT `city_delivery_times_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `city_delivery_times_delivery_time_id_foreign` FOREIGN KEY (`delivery_time_id`) REFERENCES `delivery_times` (`id`);

--
-- Constraints for table `excluded_city_delivery_times`
--
ALTER TABLE `excluded_city_delivery_times`
  ADD CONSTRAINT `excluded_city_delivery_times_city_delivery_time_id_foreign` FOREIGN KEY (`city_delivery_time_id`) REFERENCES `city_delivery_times` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
