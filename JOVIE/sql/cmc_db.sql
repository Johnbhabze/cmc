-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2023 at 09:21 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+08:00";

--
-- Database: `cmc_db`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(31) NOT NULL,
  `last_name` varchar(31) NOT NULL,
  `email` varchar(63) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role` varchar(11) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updateAt` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL
);

INSERT INTO `admins` (`admin_id`, `first_name`, `last_name`, `email`, `password`, `role`, `createAt`, `updateAt`, `deleteAt`) VALUES
(1, 'Kenet', 'Medez', 'kenetmedez@admin.com', '$2y$10$tgGQV4cWSkPUQyDkMlavTuK0YgX8IF/F6MFKazqEQLKEeZemtivga', 'admin-only', '2023-12-03 12:39:05', NULL, NULL);

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(31) NOT NULL,
  `last_name` varchar(31) NOT NULL,
  `birthdate` date NOT NULL,
  `sex` varchar(7) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(63) NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
);

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `birthdate`, `sex`, `phone_number`, `email`, `password`, `role`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Angelica', 'Dy', '2002-05-09', 'female', '09123123123', 'angelicady@gmail.com', '$2y$10$tgGQV4cWSkPUQyDkMlavTuK0YgX8IF/F6MFKazqEQLKEeZemtivga', 'user-only', '2023-12-03 12:27:49', NULL, NULL),
(2, 'Kenet', 'Medez', '2000-05-09', 'male', '09152384067', 'kenetmedez@gmail.com', '$2y$10$rUXdjr.3gzmPHsRaVNm9geVove8XZcBAsdk3sHsklp/ZuIdGmQaNy', 'user-only', '2023-12-03 12:59:45', NULL, NULL),
(3, 'Jovie', 'Jurac', '2002-05-09', 'male', '09123123123', 'angelicady@gmail.com', '$2y$10$tgGQV4cWSkPUQyDkMlavTuK0YgX8IF/F6MFKazqEQLKEeZemtivga', 'user-only', '2023-12-03 12:27:49', NULL, NULL),
(4, 'Nica', 'Poblares', '2000-05-09', 'female', '09152384067', 'kenetmedez@gmail.com', '$2y$10$rUXdjr.3gzmPHsRaVNm9geVove8XZcBAsdk3sHsklp/ZuIdGmQaNy', 'user-only', '2023-12-03 12:59:45', NULL, NULL);

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_id` int(11) NULL,
  `first_name` varchar(31) NOT NULL,
  `middle_name` varchar(31) NOT NULL,
  `last_name` varchar(31) NOT NULL,
  `ext_name` varchar(5) NULL, -- can be NULL
  `birthdate` date NOT NULL,
  `sex` varchar(7) NOT NULL,
  `religion` varchar(31) NOT NULL,
  `nationality` varchar(31) NOT NULL,
  `occupation` varchar(31) NOT NULL,
  `civil_status` varchar(31) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(31) NULL, -- can be NULL
  `house_no` varchar(7) NULL, -- can be NULL
  `street` varchar(31) NULL, -- can be NULL
  `brgy` varchar(31) NOT NULL,
  `municipality` varchar(31) NOT NULL,
  `province` varchar(31) NOT NULL,
  `spouse_name` varchar(127) NULL, -- can be NULL
  `spouse_add` varchar(63) NULL, -- can be NULL
  `fathers_name` varchar(127) NULL, -- can be NULL
  `mothers_name` varchar(127) NULL, -- can be NULL
  `guardian` varchar(31) NULL, -- can be NULL
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NULL, -- can be NULL specially it's not yet updated
  `deletedAt` datetime NULL, -- can be NULL specially it's not yet deleted
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO `patients` (`patient_id`, `user_id`, `first_name`, `middle_name`, `last_name`, `ext_name`, `birthdate`, `sex`, `religion`, `nationality`, `occupation`, `civil_status`, `phone_number`, `email`, `house_no`, `street`, `brgy`, `municipality`, `province`, `spouse_name`, `spouse_add`, `fathers_name`, `mothers_name`, `guardian`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 1, 'John', 'Michael', 'Doe', '', '1990-05-15', 'Male', 'Christian', 'American', 'Software Engineer', 'Single', '123456789', 'john.doe@email.com', '123', 'Main St', 'Downtown', 'Cityville', 'State', 'Jane Doe', '456 Spouse St', 'Michael Doe', 'Mary Doe', 'Guardian Name', '2023-11-10 08:00:00', '2023-11-10 08:00:00', '2023-11-10 08:00:00'),
(2, 2, 'Alice', 'Marie', 'Smith', '', '1985-09-22', 'Female', 'Catholic', 'British', 'Doctor', 'Married', '987654321', 'alice.smith@email.com', '456', 'Oak St', 'Suburbia', 'Cityville', 'State', 'Bob Smith', '789 Spouse St', 'James Smith', 'Emma Smith', 'Guardian Name', '2023-11-10 08:00:00', '2023-11-10 08:00:00', '2023-11-10 08:00:00'),
(3, 3, 'David', 'William', 'Brown', '', '1982-12-10', 'Male', 'Protestant', 'Canadian', 'Engineer', 'Divorced', '654321987', 'david.brown@email.com', '789', 'Maple St', 'Village', 'Cityville', 'State', 'Jennifer Brown', '101 Spouse St', 'John Brown', 'Laura Brown', 'Guardian Name', '2023-11-11 10:00:00', '2023-11-11 10:00:00', '2023-11-11 10:00:00'),
(4, 4, 'Emma', 'Grace', 'Miller', '', '1995-06-28', 'Female', 'Jewish', 'Israeli', 'Teacher', 'Single', '987123456', 'emma.miller@email.com', '321', 'Cedar St', 'Rural', 'Cityville', 'State', 'Noah Miller', '201 Spouse St', 'Ethan Miller', 'Sophia Miller', 'Guardian Name', '2023-11-12 11:00:00', '2023-11-12 11:00:00', '2023-11-12 11:00:00');

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_id` int(11) NULL,
  `patient_id` int(11) NOT NULL,
  `queue_no` varchar(7) NULL,
  `category` varchar(31) NOT NULL,
  `date_sched` date NOT NULL,
  `cheif_complaint` varchar(255) NOT NULL,
  `app_status` varchar(15) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NULL,
  `expiresAt` datetime NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `queue_no`, `category`, `date_sched`, `cheif_complaint`, `app_status`) VALUES
(1, 1, 'A001', 'General Checkup', '2023-11-15', 'Fever', 'Pending'),
(2, 2, 'A002', 'Dental', '2023-11-18', 'Toothache', 'Pending'),
(3, 3, 'A003', 'Orthopedic', '2023-11-20', 'Back Pain', 'Pending'),
(4, 4, 'A004', 'Pediatric', '2023-11-22', 'Fever', 'Pending'),
(5, 4, 'A005', 'Pediatric', '2023-11-22', 'Fever', 'Pending'),
(6, 3, 'A005', 'Orthopedic', '2023-11-20', 'Back Pain', 'Pending');

