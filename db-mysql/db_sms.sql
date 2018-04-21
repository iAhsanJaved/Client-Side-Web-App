-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2018 at 06:02 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(35) NOT NULL,
  `father_name` varchar(35) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `contact_number` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `father_name`, `dob`, `email`, `contact_number`, `created_on`, `modified_on`) VALUES
(3, '20162585647464', 'Hello', '0000-00-00', '2', 45455, '2018-04-18 22:21:52', '2018-04-18 22:21:52'),
(4, 'khkk', 'huhh', '2018-04-10', 'iji', 8989, '2018-04-19 00:16:12', '2018-04-19 00:16:12'),
(17, 'Ahsan Javed', 'Javed', '2018-04-13', 'iahsanjaved@yahoo.com', 2147483647, '2018-04-19 01:39:03', '2018-04-19 01:39:03'),
(20, 'Ahsan Javedmkk', 'Javedk', '2018-04-20', 'iahsanjaved@yahoo.comk', 2147483647, '2018-04-19 01:41:18', '2018-04-19 01:41:18'),
(22, 'UYywuy`yu', 'uhuy', '2018-12-31', 'jj@hh.com', 2147483647, '2018-04-19 07:08:11', '2018-04-19 07:08:11'),
(26, '', '', '0000-00-00', '', 0, '2018-04-19 07:18:17', '2018-04-19 07:18:17'),
(27, 'jhh', 'hjj', '2017-12-31', 'iahsanjaved@hotmail.com', 2147483647, '2018-04-19 07:18:17', '2018-04-19 07:18:17'),
(29, 'iu', 'iyyi', '2018-12-31', 'ihuh@gmail.com', 5959, '2018-04-20 15:20:56', '2018-04-20 15:20:56'),
(36, 'Ahsan Javed', 'jkj', '2018-12-31', 'iahsanjavssssed@yahoo.com', 2147483647, '2018-04-21 15:59:05', '2018-04-21 15:59:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
