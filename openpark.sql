-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 07:46 PM
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
-- Database: `openpark`
--

-- --------------------------------------------------------

--
-- Table structure for table `admindetails`
--

CREATE TABLE `admindetails` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `access` varchar(255) NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admindetails`
--

INSERT INTO `admindetails` (`id`, `email`, `password`, `access`) VALUES
(1, 'sanzivmagat80@gmail.com', 'dc647eb65e6711e155375218212b3964', 'yes'),
(2, 'sudip@gmail.com', 'dc647eb65e6711e155375218212b3964', 'yes'),
(3, 'sudip1@gmail.com', 'dc647eb65e6711e155375218212b3964', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `admindetails1`
--

CREATE TABLE `admindetails1` (
  `id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `regtype` varchar(255) NOT NULL,
  `carslots` int(255) NOT NULL,
  `bikeslots` int(255) NOT NULL,
  `bikecost` int(255) NOT NULL,
  `carcost` int(11) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admindetails1`
--

INSERT INTO `admindetails1` (`id`, `email`, `regtype`, `carslots`, `bikeslots`, `bikecost`, `carcost`, `starttime`, `endtime`) VALUES
(1, 'sudip1@gmail.com', 'Organization', 2, 4, 50, 25, '23:02:00', '12:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `admindetails2`
--

CREATE TABLE `admindetails2` (
  `id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `idtype` varchar(255) NOT NULL,
  `document` varchar(255) NOT NULL,
  `idnumber` varchar(255) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admindetails2`
--

INSERT INTO `admindetails2` (`id`, `email`, `fullname`, `photo`, `address`, `phone`, `idtype`, `document`, `idnumber`, `latitude`, `longitude`) VALUES
(1, 'sanzivmagat80@gmail.com', 'Sanjeev Magar', 'RamDai.JPG', 'Lagankhel', '9860357512', 'Citizenship', 'citizenship.jpg', '8768767666678', 27.1015, 84.9517),
(2, 'sudip@gmail.com', 'sdusds', 'arrow.jpg', 'd,fmsdf', '64456465', 'Citizenship', 'citizenship.jpg', '345345345', 27.0186, 84.8861),
(3, 'sudip1@gmail.com', 'ddfdfds', 'arrow.jpg', 'fsddfs', '4535434', 'Citizenship', 'citizenship.jpg', '453535345', 27.1015, 84.9517);

-- --------------------------------------------------------

--
-- Table structure for table `datetime1`
--

CREATE TABLE `datetime1` (
  `dateId` int(11) NOT NULL,
  `entryDate` date NOT NULL,
  `exitDate` date NOT NULL,
  `entryTime` time NOT NULL,
  `exitTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `datetime1`
--

INSERT INTO `datetime1` (`dateId`, `entryDate`, `exitDate`, `entryTime`, `exitTime`) VALUES
(1, '2024-02-14', '2024-02-20', '14:09:00', '15:09:00'),
(2, '2024-02-14', '2024-02-13', '15:10:00', '15:12:00'),
(3, '2024-02-14', '2024-02-13', '15:10:00', '15:12:00'),
(4, '2024-02-20', '2024-02-12', '15:13:00', '14:14:00'),
(5, '2024-02-14', '2024-02-22', '14:15:00', '14:16:00'),
(6, '2024-02-19', '2024-02-14', '15:17:00', '15:17:00'),
(7, '2024-02-04', '2024-02-21', '15:27:00', '15:27:00'),
(8, '2024-02-06', '2024-02-12', '23:28:00', '23:30:00'),
(9, '2024-02-07', '2024-02-12', '13:52:00', '23:53:00'),
(10, '2024-02-07', '2024-02-12', '13:52:00', '23:53:00'),
(11, '2024-02-07', '2024-02-14', '04:09:00', '03:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `espdata1`
--

CREATE TABLE `espdata1` (
  `id` int(255) NOT NULL,
  `slotNo` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `distance` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `espdata1`
--

INSERT INTO `espdata1` (`id`, `slotNo`, `status`, `distance`) VALUES
(1, '1', 'empty', 56),
(3, '2', 'empty', 1111),
(4, '3', 'empty', 50),
(5, '4', 'empty', 1011),
(6, '5', 'empty', 58),
(7, '6', 'empty', 100),
(8, '7', 'empty', 45),
(9, '8', 'empty', 15);

-- --------------------------------------------------------

--
-- Table structure for table `user1`
--

CREATE TABLE `user1` (
  `userId` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user1`
--

INSERT INTO `user1` (`userId`, `name`, `email`, `password`) VALUES
(1, 'sanziv', 'sanzivmagat80@gmail.com', '69a98c032fac313a5d637441e3368803');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admindetails`
--
ALTER TABLE `admindetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admindetails1`
--
ALTER TABLE `admindetails1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admindetails2`
--
ALTER TABLE `admindetails2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datetime1`
--
ALTER TABLE `datetime1`
  ADD PRIMARY KEY (`dateId`);

--
-- Indexes for table `espdata1`
--
ALTER TABLE `espdata1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user1`
--
ALTER TABLE `user1`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admindetails`
--
ALTER TABLE `admindetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admindetails1`
--
ALTER TABLE `admindetails1`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admindetails2`
--
ALTER TABLE `admindetails2`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `datetime1`
--
ALTER TABLE `datetime1`
  MODIFY `dateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `espdata1`
--
ALTER TABLE `espdata1`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user1`
--
ALTER TABLE `user1`
  MODIFY `userId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
