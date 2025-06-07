-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2025 at 05:06 PM
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
-- Database: `user`
--

-- --------------------------------------------------------

--
-- Table structure for table `booth`
--

CREATE TABLE `booth` (
  `ID` int(11) NOT NULL,
  `BoothName` varchar(255) NOT NULL,
  `OwnerName` varchar(255) NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` text NOT NULL,
  `AdharCard` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booth`
--

INSERT INTO `booth` (`ID`, `BoothName`, `OwnerName`, `Contact`, `Email`, `Address`, `AdharCard`, `Password`) VALUES
(1, 'TCL', 'Gopal bhai', '7887788778', 'gopal1121@gmail.com', 'sardar nagar bhavnagr', 'Booth-Adhar/38592id.jpg', '11');

-- --------------------------------------------------------

--
-- Table structure for table `querys`
--

CREATE TABLE `querys` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `Uid` int(11) NOT NULL,
  `VaccineName` varchar(255) NOT NULL,
  `VaccineDose` int(11) NOT NULL,
  `VaccineDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `Uid`, `VaccineName`, `VaccineDose`, `VaccineDate`) VALUES
(1, 1, 'BCG', 1, '2025-02-21'),
(2, 1, 'BCG', 2, '2025-02-24'),
(3, 1, 'OPV', 1, '2025-02-28');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `UserId` int(11) NOT NULL,
  `TmpId` int(11) NOT NULL,
  `FatherName` varchar(255) NOT NULL,
  `MotherName` varchar(255) NOT NULL,
  `ChildName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Address` text NOT NULL,
  `Height` int(11) NOT NULL,
  `Weight` int(11) NOT NULL,
  `BloodGroup` varchar(5) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `BirthDate` date NOT NULL,
  `BirthCertificate` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userregistration`
--

INSERT INTO `userregistration` (`UserId`, `TmpId`, `FatherName`, `MotherName`, `ChildName`, `Email`, `Contact`, `Address`, `Height`, `Weight`, `BloodGroup`, `Gender`, `BirthDate`, `BirthCertificate`, `Password`) VALUES
(1, 755674, ' krunalbhai', 'priyalben', 'shradhha', 'Krunal@gmail.com', '9898989898', 'near bpti', 50, 3, 'A+', 'Female', '2021-02-02', 'Birth-Certificate-Images/69152adhar.png', '11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booth`
--
ALTER TABLE `booth`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `querys`
--
ALTER TABLE `querys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Uid` (`Uid`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booth`
--
ALTER TABLE `booth`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `querys`
--
ALTER TABLE `querys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `userregistration` (`UserId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
