-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2021 at 11:49 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flora`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(50) NOT NULL,
  `catImg` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catId`, `catName`, `catImg`) VALUES
(1, 'Bag', 'assets/img/b.jpg'),
(2, 'Shirt', 'assets/img/s.jpg'),
(3, 'Jacket', 'assets/img/j.jpg'),
(4, 'Blazer', 'assets/img/bl1.jpg'),
(5, 'Wallet', 'assets/img/w1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Id`, `name`, `email`, `subject`, `message`) VALUES
(1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Id` int(11) NOT NULL,
  `orderId_fk` int(11) NOT NULL,
  `prodId_fk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`Id`, `orderId_fk`, `prodId_fk`, `qty`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `userId_fk` int(11) NOT NULL,
  `grandTotal` int(15) NOT NULL,
  `orderDate` datetime NOT NULL,
  `orderStatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id`, `userId_fk`, `grandTotal`, `orderDate`, `orderStatus`) VALUES
(1, 3, 1500, '2021-09-20 20:00:26', 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `prodstatus`
--

CREATE TABLE `prodstatus` (
  `sId` int(11) NOT NULL,
  `sName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodstatus`
--

INSERT INTO `prodstatus` (`sId`, `sName`) VALUES
(1, 'In Stock'),
(2, 'Out Of Stock');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prodId` int(11) NOT NULL,
  `prodName` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `prodImg` varchar(100) NOT NULL,
  `price` int(25) NOT NULL,
  `catId_fk` int(11) NOT NULL,
  `statusId_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prodId`, `prodName`, `color`, `prodImg`, `price`, `catId_fk`, `statusId_fk`) VALUES
(1, 'Hand Painted Shirt', 'Black', 'assets/img/s2.jpg', 3550, 2, 1),
(2, 'Hand Bag', 'Blue', 'assets/img/b.jpg', 4980, 1, 1),
(3, 'Wallet', 'Light Brown', 'assets/img/w1.jpg', 2650, 5, 1),
(4, 'Bag', 'Black', 'assets/img/b2.jpg', 4250, 1, 1),
(5, 'Bag', 'White', 'assets/img/b1.jpg', 4570, 1, 1),
(6, 'Bag', 'Purple', 'assets/img/b3.jpg', 4980, 1, 1),
(8, 'Hand Painted Shirt', 'Green', 'assets/img/s.jpg', 4250, 2, 1),
(9, 'Shirt', 'Pink', 'assets/img/s3.jpg', 3550, 2, 1),
(10, 'Shirt', 'Gray', 'assets/img/s1.jpg', 3550, 2, 1),
(11, 'Crop Top', 'Black', 'assets/img/s4.jpg', 3750, 2, 2),
(12, 'Blazer', 'Black', 'assets/img/bl1.jpg', 5990, 4, 1),
(13, 'Blazer', 'Black', 'assets/img/bl2.jpg', 5860, 4, 1),
(14, 'Jacket', 'Blue', 'assets/img/j.jpg', 4850, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL,
  `roleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleId`, `roleName`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contact` bigint(15) NOT NULL,
  `roleId_fk` int(11) NOT NULL,
  `userImage` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `postalCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userName`, `email`, `password`, `contact`, `roleId_fk`, `userImage`, `address`, `city`, `country`, `postalCode`) VALUES
(1, 'Ruba', 'ruba@gmail.com', '$2y$10$yKOgEAzutzt187N33MAK0ugULjNA2NM1U6WAjCARsCi', 1234567, 1, '../assets/img/emilyz.jpg', 'Gulshan', 'Karachi', 'Pakistan', 75600),
(2, 'asna', 'asnaarshadshamsi@gmail.com', '$2y$10$6/ZaYfbOKVWpaeYkFawr7OECHL6aK9UcN9S1I/5YCun', 123456, 1, '../assets/img/anime6.png', 'Nazimabad', 'Karachi', 'Pakistan', 75600),
(3, 'maha', 'maha@gmail.com', '123', 1234567, 2, '', 'Defence', 'Karachi', 'Pakistan', 75600);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `orderId_fk` (`orderId_fk`),
  ADD KEY `prodId_fk` (`prodId_fk`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `userId_fk` (`userId_fk`);

--
-- Indexes for table `prodstatus`
--
ALTER TABLE `prodstatus`
  ADD PRIMARY KEY (`sId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodId`),
  ADD KEY `catId_fk` (`catId_fk`),
  ADD KEY `statusId_fk` (`statusId_fk`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD KEY `roleId_fk` (`roleId_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prodstatus`
--
ALTER TABLE `prodstatus`
  MODIFY `sId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `orderId_fk` FOREIGN KEY (`orderId_fk`) REFERENCES `orders` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prodId_fk` FOREIGN KEY (`prodId_fk`) REFERENCES `product` (`prodId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `userId_fk` FOREIGN KEY (`userId_fk`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `catId_fk` FOREIGN KEY (`catId_fk`) REFERENCES `category` (`catId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `roleId_fk` FOREIGN KEY (`roleId_fk`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
