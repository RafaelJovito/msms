-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2021 at 08:36 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `msms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `salao`
--

CREATE TABLE `salao` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` text NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `nome_responsavel` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_list`
--

CREATE TABLE `appointment_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `schedule` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `total` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment_list`
--

INSERT INTO `appointment_list` (`id`, `fullname`, `contact`, `email`, `schedule`, `status`, `total`, `date_created`, `date_updated`) VALUES
(1, 'John Smith', '09123456789', 'jsmith@sample.com', '2021-12-03', 1, 830, '2021-12-01 14:42:19', NULL),
(2, 'George Wilson', '0945698865', 'gwilson@sample.com', '2021-12-04', 1, 580, '2021-12-01 14:45:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_service`
--

CREATE TABLE `appointment_service` (
  `appointment_id` int(30) NOT NULL,
  `service_id` int(30) NOT NULL,
  `cost` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment_service`
--

INSERT INTO `appointment_service` (`appointment_id`, `service_id`, `cost`) VALUES
(1, 6, 200),
(1, 1, 80),
(1, 3, 250),
(1, 5, 300),
(2, 6, 200),
(2, 1, 80),
(2, 5, 300);

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `salao_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `name`, `description`, `cost`, `status`, `date_created`, `date_updated`, `salao_id`) VALUES
(1, 'Hair Style', 'Hair Style', 80, 1, '2021-12-01 11:04:17', NULL, 1),
(2, 'Hair Color', 'Hair Color', 150, 1, '2021-12-01 11:04:31', NULL, 1),
(3, 'Hair Style with Half Body Massage', 'Hair Style with Half Body Massage', 250, 1, '2021-12-01 11:04:56', NULL, 2),
(4, 'Hair Style With Whole Body Massage', 'Morbi egestas pellentesque ultricies...', 300, 1, '2021-12-01 11:05:25', '2021-12-01 15:32:22', 2),
(5, 'Scalp Massage & Conditioning Treatment', 'Scalp Massage & Conditioning Treatment', 300, 1, '2021-12-01 11:07:25', '2021-12-01 11:07:33', 1),
(6, 'Beard Sculpting', 'Beard Sculpting', 200, 1, '2021-12-01 11:07:48', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Men&apos;s Salon Management System - PHP'),
(6, 'short_name', 'MSMS - PHP'),
(7, 'logo', 'uploads/logo-61a64a30e44c5-150x150.png'),
(8, 'website_cover', 'uploads/cover-61a64a3213c3e.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `salao_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`, `salao_id`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1635556826', NULL, 1, 1, '2021-01-20 14:02:37', '2021-11-27 13:39:11', 1),
(3, 'John', NULL, 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', 'uploads/avatar-3.png?v=1638343842', NULL, 2, 1, '2021-12-01 15:30:41', '2021-12-01 15:30:42', 2);

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment_list`
--
ALTER TABLE `appointment_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment_service`
--
ALTER TABLE `appointment_service`
  ADD KEY `service_id` (`service_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salao_id` (`salao_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salao_id` (`salao_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment_service`
--
ALTER TABLE `appointment_service`
  ADD CONSTRAINT `appointment_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_service_ibfk_3` FOREIGN KEY (`appointment_id`) REFERENCES `appointment_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_list`
--
ALTER TABLE `service_list`
  ADD CONSTRAINT `service_list_salao_fk` FOREIGN KEY (`salao_id`) REFERENCES `salao` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_salao_fk` FOREIGN KEY (`salao_id`) REFERENCES `salao` (`id`) ON DELETE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
