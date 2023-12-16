-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 14, 2023 at 01:10 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `first_name`, `last_name`, `email`, `password`, `role`, `createAt`, `updateAt`, `deleteAt`) VALUES
(1, 'Kenet', 'Medez', 'kenetmedez@admin.com', '$2y$10$tgGQV4cWSkPUQyDkMlavTuK0YgX8IF/F6MFKazqEQLKEeZemtivga', 'admin-only', '2023-12-03 12:39:05', NULL, NULL);

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
  `cheif_complaint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stat` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` time NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL,
  `expiresAt` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  UNIQUE KEY `unique_queue_no` (`queue_no`),
  KEY `fk_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `queue_no`, `patient_id`, `category`, `day`, `cheif_complaint`, `stat`, `time`, `createdAt`, `updatedAt`, `expiresAt`, `user_id`) VALUES
(10, 1, 79, 'CECAP', '2023-12-18', ';aa;a', 'Pending', '14:00:00', '2023-12-13 14:38:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(11, 2, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:43:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(12, 3, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:43:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(13, 4, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:45:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(14, 5, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:47:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(15, 6, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:47:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(16, 7, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:48:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(17, 8, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:50:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(18, 9, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:51:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(19, 10, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:52:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(20, 11, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:53:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(21, 12, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 14:55:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(22, 13, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 15:01:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(23, 14, 81, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 15:02:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(24, 15, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 15:03:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(25, 16, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 15:05:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(26, 17, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 15:06:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(27, 18, 80, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 15:07:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5),
(28, 19, 79, 'CECAP', '2023-12-13', '', 'Pending', '00:00:00', '2023-12-13 15:07:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5);

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
  `birhdate` date NOT NULL,
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
  `municaplity` varchar(63) COLLATE utf8mb4_general_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `middle_name`, `last_name`, `extension_name`, `birhdate`, `sex`, `civil_status`, `religion`, `nationality`, `occupation`, `phone_number`, `email`, `house_no`, `street`, `barangay`, `municaplity`, `province`, `postal_code`, `spouse_name`, `spouse_address`, `fathers_name`, `mothers_maiden_name`, `createdAt`, `updatedAt`, `deletedAt`, `user_id`) VALUES
(79, 'Angelica', 'Santos', 'Dy', 'N/A', '2004-02-01', 'Female', 'Single', 'Roman Catholic', 'Filipino', 'Student', '09676347916', '', 'Zone 1', 'Maharlika Highway', 'San Policarpo', 'Calbayog', 'Samar', 6710, '', '', 'Vevencio Dy', 'Vilma Santos', '2023-12-13 13:49:15', '2023-12-13 21:48:36', '0000-00-00 00:00:00', 5),
(80, 'A', '', 'A', 'Sr.', '9004-02-01', 'Female', 'Single', 'Z', '', 'Z', '09676347916', '', 'Z', 'Z', 'Z', 'Z', 'Z', 0, '', '', 'Z', 'Zzzz', '2023-12-13 14:24:17', '2023-12-13 22:24:17', '0000-00-00 00:00:00', 5),
(81, 'A', '', 'A', 'Sr.', '9000-02-01', 'Female', 'Single', 'A', 'A', '', '09676347916', '', 'A', 'A', 'A', 'A', 'A', 0, '', '', 'A', 'A', '2023-12-13 14:24:55', '2023-12-13 22:24:55', '0000-00-00 00:00:00', 5);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `birthdate`, `sex`, `phone_number`, `email`, `password`, `role`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Angelica', 'Dy', '2002-05-09', 'female', '09123123123', 'angelicady@gmail.com', '$2y$10$tgGQV4cWSkPUQyDkMlavTuK0YgX8IF/F6MFKazqEQLKEeZemtivga', 'user-only', '2023-12-03 12:27:49', NULL, NULL),
(2, 'Kenet', 'Medez', '2000-05-09', 'male', '09152384067', 'kenetmedez@gmail.com', '$2y$10$rUXdjr.3gzmPHsRaVNm9geVove8XZcBAsdk3sHsklp/ZuIdGmQaNy', 'user-only', '2023-12-03 12:59:45', NULL, NULL),
(3, 'Angelica', 'Dy', '2004-01-29', 'female', '09383540317', 'gelacute0@gmail.com', '$2y$10$v4vi1s5bYE.4yW2ZhgtFp.P.hKFzPDOBYeiFFesMVSN6imPMGPa/i', 'user-only', '2023-12-04 07:08:53', NULL, NULL),
(4, 'Nica', 'Poblares', '1999-11-06', 'female', '09090909090', 'nica@gmail.com', '123', 'user-only', '2023-12-07 11:00:09', NULL, NULL),
(5, 'Angelica', 'Dy', '2004-02-01', 'female', '09676347916', 'dy1@gmail.com', '$2y$10$BNlnEiXqg/NJv4wsMhQjau7HdD4m9wUBvOn/.zpPMvafYGxQNKj5.', 'user-only', '2023-12-07 08:01:27', NULL, NULL),
(6, 'Jovie', 'Jurac', '2023-12-06', 'male', '09676347916', 'jurac@gmail.com', '$2y$10$gBMkgouqCFzjAHZHJhHvp.vCkWtX0vmsD7T5LwGOf04hVKhaysHTO', 'user-only', '2023-12-09 14:08:47', NULL, NULL),
(7, 'Angelica', 'Dy', '2004-01-29', 'female', '09676347916', 'dy@gmail.com', '$2y$10$m7jt5ezy5gIuw9M.5Fv4jOgh5.Z9HDzx83xDTrfAppz1pRw6lKMRe', 'user-only', '2023-12-10 10:45:52', NULL, NULL);

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
