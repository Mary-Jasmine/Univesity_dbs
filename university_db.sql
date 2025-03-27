-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2025 at 09:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `BLDG_CODE` varchar(10) NOT NULL,
  `BLDG_NAME` varchar(100) DEFAULT NULL,
  `BLDG_LOCATION` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `CLASS_CODE` varchar(10) NOT NULL,
  `CLASS_SECTION` varchar(10) DEFAULT NULL,
  `CLASS_TIME` varchar(50) DEFAULT NULL,
  `CRS_CODE` varchar(10) DEFAULT NULL,
  `PROF_NUM` int(11) DEFAULT NULL,
  `ROOM_CODE` varchar(10) DEFAULT NULL,
  `SEMESTER_CODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CRS_CODE` varchar(10) NOT NULL,
  `DEPT_CODE` varchar(10) DEFAULT NULL,
  `CRS_TITLE` varchar(100) DEFAULT NULL,
  `CRS_DESCRIPTION` text DEFAULT NULL,
  `CRS_CREDIT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DEPT_CODE` varchar(10) NOT NULL,
  `DEPT_NAME` varchar(100) NOT NULL,
  `SCHOOL_CODE` varchar(10) DEFAULT NULL,
  `PROF_NUM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `CLASS_CODE` varchar(10) NOT NULL,
  `STU_NUM` int(11) NOT NULL,
  `ENROLL_DATE` date DEFAULT NULL,
  `ENROLL_GRADE` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `PROF_NUM` int(11) NOT NULL,
  `DEPT_CODE` varchar(10) DEFAULT NULL,
  `PROF_SPECIALTY` varchar(100) DEFAULT NULL,
  `PROF_RANK` varchar(50) DEFAULT NULL,
  `PROF_LNAME` varchar(50) DEFAULT NULL,
  `PROF_FNAME` varchar(50) DEFAULT NULL,
  `PROF_INITIAL` varchar(10) DEFAULT NULL,
  `PROF_EMAIL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `ROOM_CODE` varchar(10) NOT NULL,
  `ROOM_TYPE` varchar(50) DEFAULT NULL,
  `BLDG_CODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `SCHOOL_CODE` varchar(10) NOT NULL,
  `SCHOOL_NAME` varchar(100) NOT NULL,
  `PROF_NUM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `SEMESTER_CODE` varchar(10) NOT NULL,
  `SEMESTER_YEAR` int(11) DEFAULT NULL,
  `SEMESTER_TERM` varchar(20) DEFAULT NULL,
  `SEMESTER_START_DATE` date DEFAULT NULL,
  `SEMESTER_END_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `STU_NUM` int(11) NOT NULL,
  `DEPT_CODE` varchar(10) DEFAULT NULL,
  `STU_LNAME` varchar(50) DEFAULT NULL,
  `STU_FNAME` varchar(50) DEFAULT NULL,
  `STU_INITIAL` varchar(10) DEFAULT NULL,
  `STU_EMAIL` varchar(100) DEFAULT NULL,
  `PROF_NUM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`BLDG_CODE`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`CLASS_CODE`),
  ADD KEY `CRS_CODE` (`CRS_CODE`),
  ADD KEY `PROF_NUM` (`PROF_NUM`),
  ADD KEY `ROOM_CODE` (`ROOM_CODE`),
  ADD KEY `SEMESTER_CODE` (`SEMESTER_CODE`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CRS_CODE`),
  ADD KEY `DEPT_CODE` (`DEPT_CODE`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DEPT_CODE`),
  ADD KEY `SCHOOL_CODE` (`SCHOOL_CODE`),
  ADD KEY `PROF_NUM` (`PROF_NUM`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`CLASS_CODE`,`STU_NUM`),
  ADD KEY `STU_NUM` (`STU_NUM`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`PROF_NUM`),
  ADD UNIQUE KEY `DEPT_CODE` (`DEPT_CODE`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`ROOM_CODE`),
  ADD UNIQUE KEY `BLDG_CODE` (`BLDG_CODE`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`SCHOOL_CODE`),
  ADD UNIQUE KEY `PROF_NUM` (`PROF_NUM`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`SEMESTER_CODE`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`STU_NUM`),
  ADD KEY `DEPT_CODE` (`DEPT_CODE`),
  ADD KEY `PROF_NUM` (`PROF_NUM`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`CRS_CODE`) REFERENCES `course` (`CRS_CODE`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`PROF_NUM`) REFERENCES `professor` (`PROF_NUM`),
  ADD CONSTRAINT `class_ibfk_3` FOREIGN KEY (`ROOM_CODE`) REFERENCES `room` (`ROOM_CODE`),
  ADD CONSTRAINT `class_ibfk_4` FOREIGN KEY (`SEMESTER_CODE`) REFERENCES `semester` (`SEMESTER_CODE`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`DEPT_CODE`) REFERENCES `department` (`DEPT_CODE`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`SCHOOL_CODE`) REFERENCES `school` (`SCHOOL_CODE`) ON DELETE CASCADE,
  ADD CONSTRAINT `department_ibfk_2` FOREIGN KEY (`PROF_NUM`) REFERENCES `professor` (`PROF_NUM`) ON DELETE SET NULL;

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`CLASS_CODE`) REFERENCES `class` (`CLASS_CODE`),
  ADD CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`STU_NUM`) REFERENCES `student` (`STU_NUM`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`DEPT_CODE`) REFERENCES `department` (`DEPT_CODE`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`PROF_NUM`) REFERENCES `professor` (`PROF_NUM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
