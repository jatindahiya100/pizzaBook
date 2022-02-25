-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 25, 2022 at 03:32 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizzaBook`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_info`
--

CREATE TABLE `additional_info` (
  `unique_ID` varchar(20) NOT NULL,
  `item_ID` varchar(10) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `calorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `additional_info`
--

INSERT INTO `additional_info` (`unique_ID`, `item_ID`, `size`, `price`, `calorie`) VALUES
('201', 'A100', 'Regular', 90, 300),
('202', 'A100', 'Full', 120, 180),
('203', 'A101', 'Regular', 200, 300),
('204', 'A102', 'Regular', 250, 320),
('205', 'A103', 'Regular', 65, 320),
('206', 'A104', 'Regular', 99, 290),
('207', 'A105', 'Regular', 125, 220),
('208', 'A106', 'Regular', 45, 150),
('209', 'A107', 'Regular', 150, 200);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `c_ID` varchar(30) NOT NULL,
  `c_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`c_ID`, `c_Name`) VALUES
('BURG01', 'Burger'),
('COMBO05', 'Combo Pack'),
('DRINKS03', 'Cold Drinks'),
('PIZZ02', 'Pizza'),
('SHAKES04', 'Milk Shakes');

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `item_ID` varchar(10) NOT NULL,
  `c_ID` varchar(30) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `item_Name` varchar(255) DEFAULT NULL,
  `item_Info` varchar(20) DEFAULT NULL,
  `total_Stars` int(11) DEFAULT NULL,
  `total_Reviews` int(11) DEFAULT NULL,
  `time_Required` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`item_ID`, `c_ID`, `image`, `item_Name`, `item_Info`, `total_Stars`, `total_Reviews`, `time_Required`, `description`) VALUES
('A100', 'BURG01', 'https://img.etimg.com/thumb/width-640,height-480,imgsize-951452,resizemode-1,msid-66325015/industry/cons-products/food/burger-king-leaves-starbucks-behind/1.jpg', 'Aalo Tikki Burger', 'Extra Butter', 9, 2, '5 min', 'Veg aalo tikki burger with red sauce layered with extra mozorella cheese. Stuffed with onions, tomato, spinach etc.'),
('A101', 'BURG01', 'https://cdn.wallpapersafari.com/68/21/lt7Tgm.jpg', 'Multi Layered Beef', 'Extra Spicy', 9, 2, '5 min', 'Beef burger with red sauce layered with extra mozorella cheese. Stuffed with onions, tomato, spinach etc.'),
('A102', 'BURG01', 'https://static.vecteezy.com/system/resources/previews/002/610/805/large_2x/chicken-hamburger-with-nuggets-and-french-fries-on-a-wooden-plate-over-white-background-free-photo.jpg', 'Mala Burger king', 'Hot & Spicy', 9, 2, '5 min', 'Beef burger with red sauce layered with extra mozorella cheese. Stuffed with onions, tomato, spinach etc.'),
('A103', 'BURG01', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/buffalo-chicken-burger-1619189881.jpg?crop=0.838xw:0.868xh;0.0799xw,0.132xh&resize=640:*', 'Crispy Tikki Burger', 'Veggie', 9, 2, '5 min', 'Beef burger with red sauce layered with extra mozorella cheese. Stuffed with onions, tomato, spinach etc.'),
('A104', 'BURG01', 'https://4.imimg.com/data4/EW/PO/MY-10347843/chicken-burger-patty-500x500.jpg', 'Fried Burger', 'cheesy Mozorella', 9, 2, '5 min', 'Beef burger with red sauce layered with extra mozorella cheese. Stuffed with onions, tomato, spinach etc.'),
('A105', 'BURG01', 'https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/1/2016/02/Spicy-grilled-chicken-dunkin-donut-burger.jpg', 'Aalo Chap Burger', 'Crispy Chilli', 9, 4, '5 min', 'Beef burger with red sauce layered with extra mozorella cheese. Stuffed with onions, tomato, spinach etc.'),
('A106', 'BURG01', 'https://c4.wallpaperflare.com/wallpaper/757/476/907/food-burgers-burger-white-background-wallpaper-preview.jpg', 'Veggie Burger', 'Asian Chicken', 20, 4, '5 min', 'Beef burger with red sauce layered with extra mozorella cheese. Stuffed with onions, tomato, spinach etc.'),
('A107', 'PIZZ02', 'https://t3.ftcdn.net/jpg/03/01/81/94/360_F_301819444_VWRpS5E6JBYqByrH9HoAlu59w8wdwOqI.jpg', 'Veggie Pizza Sliced', 'Spinach Garlic', 12, 3, '5 min', 'Beef burger with red sauce layered with extra mozorella cheese. Stuffed with onions, tomato, spinach etc.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_info`
--
ALTER TABLE `additional_info`
  ADD PRIMARY KEY (`unique_ID`),
  ADD KEY `item_ID` (`item_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`c_ID`,`c_Name`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`item_ID`),
  ADD KEY `c_ID` (`c_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_info`
--
ALTER TABLE `additional_info`
  ADD CONSTRAINT `additional_info_ibfk_1` FOREIGN KEY (`item_ID`) REFERENCES `food_items` (`item_ID`);

--
-- Constraints for table `food_items`
--
ALTER TABLE `food_items`
  ADD CONSTRAINT `food_items_ibfk_1` FOREIGN KEY (`c_ID`) REFERENCES `category` (`c_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
