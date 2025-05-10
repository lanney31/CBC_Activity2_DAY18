-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2025 at 08:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `course_description` text DEFAULT NULL,
  `course_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_description`, `course_code`) VALUES
(1, 'Introduction to Programming', 'Learn the basics of programming in Python.', 'CS101'),
(2, 'Data Structures', 'Introduction to fundamental data structures.', 'CS102'),
(3, 'Introduction to Programming', 'Learn the basics of programming in Python.', 'CS101'),
(4, 'CS Major Elective 1', 'Learn the basics of programming in java.', 'CS102'),
(5, 'Calculus', 'Learn how to Calculate.', 'CS104'),
(6, 'Science', 'Ambot.', 'CS105'),
(7, 'English', 'Learn.', 'CS106'),
(8, 'P.E', 'Learn learn.', 'CS107');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`) VALUES
(1, 1, 1, '2025-04-26'),
(2, 1, 2, '2025-04-26'),
(3, 2, 1, '2025-04-26'),
(12, 1, 1, '2025-04-26'),
(13, 1, 2, '2025-04-26'),
(14, 2, 3, '2025-04-26'),
(15, 4, 4, '2025-04-26'),
(16, 5, 5, '2025-04-26'),
(17, 6, 6, '2025-04-26'),
(18, 7, 7, '2025-04-26'),
(19, 8, 8, '2025-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `email`, `phone_number`) VALUES
(1, 'John', 'Doe', '2000-05-15', 'new.email@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', '1999-08-22', 'jane.smith@example.com', '987-654-3210'),
(4, 'John', 'Doe', '2000-05-15', 'john.doe@gmail.com', '123-456-7890'),
(5, 'Mitch', 'Baiwas', '2000-05-05', 'mitch.baiwas@gmail.com', '193-406-2290'),
(6, 'Jane', 'Smith', '1999-08-22', 'jane.smith@gmail.com', '907-645-8510'),
(7, 'Kimberly', 'Sa-ang', '1999-08-22', 'kimberly@gmail.com', '987-654-3210'),
(8, 'Lanney', 'Bucio', '2003-03-03', 'lanney@gmail.com', '951-249-6608');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
