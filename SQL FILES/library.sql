-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2025 at 08:03 PM
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
  `BookQuantity` int(11) NOT NULL DEFAULT 1,
  `BookAvailQuantity` int(11) NOT NULL DEFAULT 1,
  `bookImage` varchar(250) NOT NULL,
  `isIssued` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `BookQuantity`, `BookAvailQuantity`, `bookImage`, `isIssued`, `RegDate`, `UpdationDate`) VALUES
(1, 'The Complete Reference', 5, 1, '222333', 20.00, 10, 10, '1efecc0ca822e40b7b673c0d79ae943f.jpg', 0, '2025-01-20 06:18:09', '2025-03-20 18:31:39'),
(3, 'physics', 6, 4, '1111', 15.00, 10, 10, 'dd8267b57e0e4feee5911cb1e1a03a79.jpg', 0, '2025-01-20 06:18:09', '2025-03-20 18:32:31'),
(5, 'Murach\'s MySQL', 5, 1, '9350237695', 455.00, 10, 10, '5939d64655b4d2ae443830d73abc35b6.jpg', 0, '2025-01-20 06:18:09', '2025-03-20 18:32:37'),
(6, 'WordPress for Beginners 2022: A Visual Step-by-Step Guide to Mastering WordPress', 5, 10, '12412241', 100.00, 20, 20, '144ab706ba1cb9f6c23fd6ae9c0502b3.jpg', 0, '2025-01-20 06:18:09', '2025-03-20 18:33:51'),
(7, 'WordPress Mastery Guide:', 5, 11, '623261', 53.00, 5, 5, '90083a56014186e88ffca10286172e64.jpg', NULL, '2025-01-20 06:18:09', '2025-03-20 18:34:28'),
(8, 'Rich Dad Poor Dad: What the Rich Teach Their Kids About Money That the Poor and Middle Class Do Not', 8, 12, '6223234', 120.00, 3, 3, '52411b2bd2a6b2e0df3eb10943a5b640.jpg', 0, '2025-01-20 06:18:09', '2025-03-20 18:34:41'),
(9, 'The Girl Who Drank the Moon', 8, 13, '1848126476', 200.00, 3, 3, 'f05cd198ac9335245e1fdffa793207a7.jpg', 0, '2025-01-20 06:18:09', '2025-03-20 18:34:54'),
(10, 'C++: The Complete Reference, 4th Edition', 5, 14, '66223', 142.00, 11, 10, '36af5de9012bf8c804e499dc3c3b33a5.jpg', 0, '2025-01-20 06:18:09', '2025-03-20 18:56:22'),
(11, 'ASP.NET Core 5 for Beginners', 9, 11, '6859468', 422.00, 2, 2, 'b1b6788016bbfab12cfd2722604badc9.jpg', 0, '2025-01-20 06:18:09', '2025-03-20 18:35:55'),
(12, 'Harry Potter and the Deathly Hallows', 10, 16, '9781338878981', 599.00, 5, 4, 'edcaba6f9ade20413ec8849f954c171e.jpg', 0, '2025-03-02 06:09:06', '2025-03-20 19:00:23'),
(13, 'Princess Freedom', 11, 13, '123005', 199.00, 3, 2, '7a86edefb1bb523aecca78576607688c.png', NULL, '2025-03-18 18:28:02', '2025-03-20 18:55:54'),
(14, 'Dune', 11, 14, '4747334', 150.00, 3, 3, 'b32f5040eeaea572ad397921f38f66f1.jpg', 0, '2025-03-19 08:39:28', '2025-03-20 18:36:44');

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
  `ReturnStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblissuedbookdetails`
--

INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `ReturnDate`, `ReturnStatus`, `fine`) VALUES
(22, 13, 'SID019', '2025-03-20 18:55:54', NULL, NULL, NULL),
(23, 10, 'SID018', '2025-03-20 18:56:22', NULL, NULL, NULL),
(24, 12, 'SID016', '2025-03-20 18:56:41', '2025-03-20 18:57:27', 1, 0),
(25, 12, 'SID017', '2025-03-20 18:56:58', '2025-03-20 19:00:23', 1, 0),
(26, 12, 'SID002', '2025-03-20 18:59:32', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ProfilePic` varchar(255) DEFAULT NULL,
  `MobileNumber` char(13) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `ProfilePic`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(1, 'SID002', 'Anuj kumar', 'anujk@gmail.com', NULL, '9865472555', 'f925916e2754e5e03f75dd58a5733251', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(4, 'SID005', 'sdfsd', 'csfsd@dfsfks.com', NULL, '8569710025', '92228410fc8b872914e023160cf4ae8f', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(8, 'SID009', 'test', 'test@gmail.com', NULL, '2359874527', 'f925916e2754e5e03f75dd58a5733251', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(9, 'SID010', 'Amit', 'amit@gmail.com', NULL, '8585856224', 'f925916e2754e5e03f75dd58a5733251', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(10, 'SID011', 'Sarita Pandey', 'sarita@gmail.com', NULL, '4672423754', 'f925916e2754e5e03f75dd58a5733251', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(11, 'SID012', 'John Doe', 'john@test.com', NULL, '1234569870', 'f925916e2754e5e03f75dd58a5733251', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(12, 'SID013', 'Jake DD', 'jake@gmal.com', NULL, '1234567890', '81dc9bdb52d04dc20036dbd8313ed055', 0, '2025-01-14 04:39:12', '2025-03-19 18:11:03'),
(13, 'SID014', 'jon doe', 'jondoe@gmail.com', NULL, '1234697894', '827ccb0eea8a706c4c34a16891f84e7b', 1, '2025-01-14 04:39:12', '2025-01-14 04:39:12'),
(14, 'SID015', 'Lakki Bavniya', 'lakki@gmail.com', 'assets/img/profilePics/Lakki.jpeg', '9174430648', '74cb1921834d4d68fc2a364aca5beb9b', 1, '2025-03-02 06:10:53', '2025-03-19 18:44:24'),
(15, 'SID016', 'Vinit Pansare', 'vinitpansare@gmail.com', 'assets/img/profilePics/Vinit.jpeg', '7974809787', '13fccfe77f5f95974d3788e9f5a9c5ac', 1, '2025-03-02 06:11:53', '2025-03-19 18:44:08'),
(16, 'SID017', 'Abhishek Jaiswal', 'abhi@yo.com', 'assets/img/profilePics/Abhi.png', '12345677889', 'd76f3d05cc9ac98f1f9160274a39fe33', 1, '2025-03-02 17:22:14', '2025-03-19 18:43:47'),
(17, 'SID018', 'Pravin Prajapati', 'pravin@gmail.com', 'assets/img/profilePics/PravinPrajapati.jpg', '1234567891231', 'c86da2729ab8f79d8f582e9abc469eb0', 1, '2025-03-16 16:56:49', '2025-03-16 18:43:55'),
(18, 'SID019', 'Rikka', 'rikka@gmail.com', 'assets/img/profilePics/5_6080104327265911020.jpeg', '1234567891', '085fa719e241e28763721b5689dcfbf6', 1, '2025-03-20 18:52:36', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
