-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 17, 2023 at 11:55 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_appointment_booking_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(63) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `first_name`, `last_name`, `email`, `password`, `role`, `createAt`, `updateAt`, `deleteAt`) VALUES
(1, 'Kenet', 'Medez', 'kenetmedez@admin.com', '$2y$10$tgGQV4cWSkPUQyDkMlavTuK0YgX8IF/F6MFKazqEQLKEeZemtivga', 'admin-only', '2023-12-03 12:39:05', NULL, NULL),
(2, 'angelica', 'dy', 'yeye@gmail.com', '123', 'admin-only', '2023-12-16 02:00:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `queue_no` int NOT NULL,
  `patient_id` int NOT NULL,
  `category` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `day` date NOT NULL,
  `chief_complaint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stat` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` time NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL,
  `expiresAt` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  UNIQUE KEY `unique_queue_no` (`queue_no`),
  KEY `fk_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `queue_no`, `patient_id`, `category`, `day`, `chief_complaint`, `stat`, `time`, `createdAt`, `updatedAt`, `expiresAt`, `user_id`) VALUES
(3, 3, 2, 'ENT-HNS', '2023-12-20', 'suffering from pain', 'Done', '10:00:00', '2023-12-17 07:49:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(4, 4, 3, 'GASTROENTEROLOGY', '2023-12-20', 'suffering form pain', 'Done', '14:00:00', '2023-12-17 08:01:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(5, 5, 2, 'CECAP', '2023-12-18', 'aw', 'Done', '01:01:00', '2023-12-17 08:29:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(6, 6, 1, 'CECAP', '2023-12-18', 'aaa', 'approved', '04:06:00', '2023-12-17 08:28:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(8, 8, 2, 'Dental', '2023-12-18', 'Toothache', 'approved', '11:30:00', '2023-12-17 11:50:59', '2023-12-17 16:17:07', '2023-12-18 12:00:00', 2),
(9, 9, 2, 'Orthopedic', '2023-12-18', 'Back Pain', 'completed', '02:00:00', '2023-12-17 08:17:47', '2023-12-17 16:17:07', '2023-12-18 02:30:00', 3),
(10, 10, 2, 'Pediatric', '2023-12-18', 'Cough', 'pending', '03:30:00', '2023-12-17 08:17:44', '2023-12-17 16:17:07', '2023-12-18 04:00:00', 4),
(11, 11, 2, 'ENT', '2023-12-18', 'Ear Pain', 'completed', '05:00:00', '2023-12-17 08:17:42', '2023-12-17 16:17:07', '2023-12-18 05:30:00', 5),
(12, 12, 2, 'General Checkup', '2023-12-19', 'Headache', 'pending', '09:00:00', '2023-12-17 08:17:39', '2023-12-17 16:17:07', '2023-12-19 09:30:00', 6),
(13, 13, 3, 'Dental', '2023-12-19', 'Cavity', 'pending', '10:30:00', '2023-12-17 08:17:35', '2023-12-17 16:17:07', '2023-12-19 11:00:00', 7),
(14, 14, 3, 'Orthopedic', '2023-12-19', 'Joint Pain', 'completed', '01:00:00', '2023-12-17 08:17:32', '2023-12-17 16:17:07', '2023-12-19 01:30:00', 8),
(15, 15, 3, 'Pediatric', '2023-12-19', 'Fever', 'pending', '02:30:00', '2023-12-17 08:17:29', '2023-12-17 16:17:07', '2023-12-19 03:00:00', 9),
(16, 16, 3, 'ENT', '2023-12-19', 'Sore Throat', 'completed', '04:00:00', '2023-12-17 08:17:24', '2023-12-17 16:17:07', '2023-12-19 04:30:00', 10);

--
-- Triggers `appointments`
--
DROP TRIGGER IF EXISTS `before_insert_appointments`;
DELIMITER $$
CREATE TRIGGER `before_insert_appointments` BEFORE INSERT ON `appointments` FOR EACH ROW BEGIN
  SET NEW.queue_no = COALESCE((SELECT MAX(queue_no) FROM appointments), 0) + 1;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`) VALUES
(1, 'CECAP'),
(2, 'DENTAL'),
(3, 'ENT-HNS'),
(4, 'FAMILY MEDICINE'),
(5, 'GASTROENTEROLOGY'),
(6, 'GENERAL SURGERY'),
(7, 'GYNE'),
(9, 'NEUROSURGERY'),
(10, 'OB'),
(11, 'OPHTHALMOLOGY/EYE CENTER'),
(12, 'ORTHOPEDICS'),
(13, 'PEDIA (GENERAL)'),
(15, 'PRIMARY CARE'),
(17, 'UROLOGY'),
(19, 'FAMILY PLANNING'),
(29, 'ANIMAL BITES TREATMENT CENTER'),
(30, 'OTHERS');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `middle_name` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `extension_name` varchar(31) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthdate` date NOT NULL,
  `sex` varchar(7) COLLATE utf8mb4_general_ci NOT NULL,
  `civil_status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `religion` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `nationality` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `occupation` varchar(63) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(63) COLLATE utf8mb4_general_ci NOT NULL,
  `house_no` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `street` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `barangay` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `municipality` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `postal_code` int DEFAULT NULL,
  `spouse_name` varchar(63) COLLATE utf8mb4_general_ci NOT NULL,
  `spouse_address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `fathers_name` varchar(63) COLLATE utf8mb4_general_ci NOT NULL,
  `mothers_maiden_name` varchar(63) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `middle_name`, `last_name`, `extension_name`, `birthdate`, `sex`, `civil_status`, `religion`, `nationality`, `occupation`, `phone_number`, `email`, `house_no`, `street`, `barangay`, `municipality`, `province`, `postal_code`, `spouse_name`, `spouse_address`, `fathers_name`, `mothers_maiden_name`, `createdAt`, `updatedAt`, `deletedAt`, `user_id`) VALUES
(1, 'Angelica', 'Santos', 'Dy', 'N/A', '2004-01-29', 'Female', 'Single', 'Roman Catholic', 'Filipino', 'Student', '09676347916', '', 'Lot 19', 'New Era St.', 'Mabolo', 'Cebu', 'Cebu', 6000, '', '', 'Vevencio Dy', 'Vilma Santos', '2023-12-17 05:37:48', '2023-12-17 13:37:48', '0000-00-00 00:00:00', 1),
(2, 'Angelica', 'Santos', 'Dy', 'N/A', '2004-02-29', 'Female', 'Single', 'Roman Catholic', 'Filipino', 'Student', '09676347916', '', 'Lot 19', 'New Era St.', 'Mabolo', 'Cebu', 'Cebu', 6000, '', '', 'Vevencio Dy', 'Vilma Santos', '2023-12-17 07:05:28', '2023-12-17 15:05:28', '0000-00-00 00:00:00', 2),
(3, 'Alisa', '', 'Illut', 'N/A', '2002-12-29', 'Female', 'Single', 'Roman Catholic', 'Filpino', 'Software Engineer', '09676347916', '', 'Lot 19', 'New Era', 'Mabolo', 'Cebu', 'Cebu', 6000, '', '', 'Daniel Padilla', 'Kathryn Bernardo', '2023-12-17 07:13:45', '2023-12-17 15:13:45', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(31) COLLATE utf8mb4_general_ci NOT NULL,
  `birthdate` date NOT NULL,
  `sex` varchar(7) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(63) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `birthdate`, `sex`, `phone_number`, `email`, `password`, `role`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Angelica', 'Dy', '2004-01-29', 'female', '09676347926', 'dy@gmail.com', '$2y$10$Qt7KHIBGwCxgLxCc8G.A4.O/Q/BwafT2EToQYmvqUtWXXj2cqL6FO', 'user-only', '2023-12-17 05:31:13', NULL, NULL),
(2, 'Jovie', 'Jurac', '2000-07-22', 'male', '09388062262', 'joviejurac22@gmail.com', '$2y$10$iDNLNiEwX79FqtkMEkb6.eqYK34oxg2E0dWaNfZ9saTAkeycdSO9y', 'user-only', '2023-12-17 06:50:37', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
