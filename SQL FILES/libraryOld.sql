-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2025 at 05:22 PM
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
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Purvesh Choudhary', 'admin@gmail.com', 'admin', '0e7517141fb53f21ee439b355b5a1d0a', '2025-03-02 05:37:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblauthors`
--

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(1, 'Anuj kumar', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(2, 'Chetan Bhagatt', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(3, 'Anita Desai', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(4, 'HC Verma', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(5, 'R.D. Sharma ', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(9, 'fwdfrwer', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(10, 'Dr. Andy Williams', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(11, 'Kyle Hill', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(12, 'Robert T. Kiyosak', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(13, 'Kelly Barnhill', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(14, 'Herbert Schildt', '2025-02-25 07:23:03', '2025-02-25 07:23:03'),
(16, 'J. K. Rowling', '2025-03-02 06:07:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` varchar(25) DEFAULT NULL,
  `BookPrice` decimal(10,2) DEFAULT NULL,
  `bookImage` varchar(250) NOT NULL,
  `isIssued` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `bookImage`, `isIssued`, `RegDate`, `UpdationDate`) VALUES
(1, 'PHP And MySql programming', 5, 1, '222333', 20.00, '1efecc0ca822e40b7b673c0d79ae943f.jpg', 1, '2025-01-20 06:18:09', '2025-01-20 06:18:09'),
(3, 'physics', 6, 4, '1111', 15.00, 'dd8267b57e0e4feee5911cb1e1a03a79.jpg', 0, '2025-01-20 06:18:09', '2025-01-20 06:18:09'),
(5, 'Murach\'s MySQL', 5, 1, '9350237695', 455.00, '5939d64655b4d2ae443830d73abc35b6.jpg', 1, '2025-01-20 06:18:09', '2025-01-20 06:18:09'),
(6, 'WordPress for Beginners 2022: A Visual Step-by-Step Guide to Mastering WordPress', 5, 10, 'B019MO3WCM', 100.00, '144ab706ba1cb9f6c23fd6ae9c0502b3.jpg', NULL, '2025-01-20 06:18:09', '2025-01-20 06:18:09'),
(7, 'WordPress Mastery Guide:', 5, 11, 'B09NKWH7NP', 53.00, '90083a56014186e88ffca10286172e64.jpg', NULL, '2025-01-20 06:18:09', '2025-01-20 06:18:09'),
(8, 'Rich Dad Poor Dad: What the Rich Teach Their Kids About Money That the Poor and Middle Class Do Not', 8, 12, 'B07C7M8SX9', 120.00, '52411b2bd2a6b2e0df3eb10943a5b640.jpg', 1, '2025-01-20 06:18:09', '2025-03-02 08:02:15'),
(9, 'The Girl Who Drank the Moon', 8, 13, '1848126476', 200.00, 'f05cd198ac9335245e1fdffa793207a7.jpg', 1, '2025-01-20 06:18:09', '2025-03-02 08:02:31'),
(10, 'C++: The Complete Reference, 4th Edition', 5, 14, '007053246X', 142.00, '36af5de9012bf8c804e499dc3c3b33a5.jpg', 0, '2025-01-20 06:18:09', '2025-01-20 06:18:09'),
(11, 'ASP.NET Core 5 for Beginners', 9, 11, 'GBSJ36344563', 422.00, 'b1b6788016bbfab12cfd2722604badc9.jpg', 0, '2025-01-20 06:18:09', '2025-01-20 06:18:09'),
(12, 'Harry Potter and the Deathly Hallows', 10, 16, '9781338878981', 599.00, 'edcaba6f9ade20413ec8849f954c171e.jpg', 0, '2025-03-02 06:09:06', '2025-03-02 06:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(4, 'Romantic', 1, '2025-02-24 07:23:03', '2025-02-24 07:23:03'),
(5, 'Technology', 1, '2025-02-24 07:23:03', '2025-02-24 07:23:03'),
(6, 'Science', 1, '2025-02-24 07:23:03', '2025-02-24 07:23:03'),
(7, 'Management', 1, '2025-02-24 07:23:03', '2025-02-24 07:23:03'),
(8, 'General', 1, '2025-02-24 07:23:03', '2025-02-24 07:23:03'),
(9, 'Programming', 1, '2025-02-24 07:23:03', '2025-02-24 07:23:03'),
(10, 'Fantasy', 1, '2025-03-02 06:06:57', '0000-00-00 00:00:00'),
(11, 'Fiction', 1, '2025-03-02 06:07:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblissuedbookdetails`
--

CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `RetrunStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblissuedbookdetails`
--

INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `ReturnDate`, `RetrunStatus`, `fine`) VALUES
(7, 5, 'SID011', '2024-02-01 05:45:57', NULL, NULL, NULL),
(8, 1, 'SID002', '2024-02-01 05:45:57', '2025-02-04 06:33:08', 1, 0),
(9, 10, 'SID009', '2024-02-01 05:45:57', '2025-02-04 06:33:08', 1, 0),
(10, 11, 'SID009', '2024-02-01 05:45:57', '2025-02-04 06:33:08', 1, 0),
(11, 1, 'SID012', '2024-02-01 05:45:57', NULL, NULL, NULL),
(12, 10, 'SID012', '2024-02-01 05:45:57', '2025-02-06 05:37:12', 1, 5),
(13, 12, 'SID015', '2025-03-02 06:18:05', '2025-03-02 06:20:30', 1, 10),
(14, 8, 'SID016', '2025-03-02 08:02:15', NULL, NULL, NULL),
(15, 9, 'SID016', '2025-03-02 08:02:31', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(1, 'SID002', 'Anuj kumar', 'anujk@gmail.com', '9865472555', 'f925916e2754e5e03f75dd58a5733251', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(4, 'SID005', 'sdfsd', 'csfsd@dfsfks.com', '8569710025', '92228410fc8b872914e023160cf4ae8f', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(8, 'SID009', 'test', 'test@gmail.com', '2359874527', 'f925916e2754e5e03f75dd58a5733251', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(9, 'SID010', 'Amit', 'amit@gmail.com', '8585856224', 'f925916e2754e5e03f75dd58a5733251', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(10, 'SID011', 'Sarita Pandey', 'sarita@gmail.com', '4672423754', 'f925916e2754e5e03f75dd58a5733251', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(11, 'SID012', 'John Doe', 'john@test.com', '1234569870', 'f925916e2754e5e03f75dd58a5733251', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(12, 'SID013', 'Jake DD', 'jake@gmal.com', '1234567890', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(13, 'SID014', 'jon doe', 'jondoe@gmail.com', '1234697894', '827ccb0eea8a706c4c34a16891f84e7b', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(14, 'SID015', 'Lakki Bavniya', 'lakki@gmail.com', '9174430648', '74cb1921834d4d68fc2a364aca5beb9b', 1, '2025-03-02 06:10:53', NULL),
(15, 'SID016', 'Vinit Pansare', 'vinitpansare@gmail.com', '7974809787', '13fccfe77f5f95974d3788e9f5a9c5ac', 1, '2025-03-02 06:11:53', NULL),
(16, 'SID017', 'Abhishek Jaiswal', 'abhi@yo.com', '12345677889', 'd76f3d05cc9ac98f1f9160274a39fe33', 1, '2025-03-02 17:22:14', '2025-03-16 15:26:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblauthors`
--
ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`StudentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblauthors`
--
ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
