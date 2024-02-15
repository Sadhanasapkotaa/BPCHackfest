-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2024 at 09:17 PM
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
(1, 'sanzivmagat80@gmail.com', '69a98c032fac313a5d637441e3368803', 'yes'),
(6, 'sudup@gmail.com', '251800da8d338eb82819105d5f3c7629', 'yes'),
(20, 'anitaneupane2061@gmail.com', 'f2b53f6c4d30ed849a2e2b7f0d1b4248', 'no');

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
(1, 'sanzivmagat80@gmail.com', 'Person', 4, 8, 50, 25, '18:33:00', '06:33:00'),
(6, 'sudup@gmail.com', 'Organization', 7, 14, 50, 25, '14:31:00', '14:31:00');

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
(1, 'sanzivmagat80@gmail.com', 'sanzivmagar', '2dragon.png', 'Lalitpur', '9860357512', 'Citizenship', 'citizenship.jpg', '45353453', 0, 0),
(5, 'sudup@gmail.com', 'sudip magar', '2dragonComp.png', 'ad,makda', '9860357512', 'Citizenship', 'neil.png', '45353453', 0, 0),
(6, 'anitaneupane2061@gmail.com', 'nischal tmg', '2dragon.png', 'djfhkdhfkd', '9860357512', 'Citizenship', 'ep4_thumb.png', '45353453', 27.6974, 85.3318);

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
(1, '2024-01-02', '2024-01-02', '13:05:00', '14:05:00'),
(2, '2024-01-30', '2024-01-30', '17:00:00', '18:00:00');

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
(1, '1', 'full', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `admindetails1`
--
ALTER TABLE `admindetails1`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `admindetails2`
--
ALTER TABLE `admindetails2`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `datetime1`
--
ALTER TABLE `datetime1`
  MODIFY `dateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `espdata1`
--
ALTER TABLE `espdata1`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user1`
--
ALTER TABLE `user1`
  MODIFY `userId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
