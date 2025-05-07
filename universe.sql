-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2025 at 04:06 PM
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
-- Database: `universe`
--

-- --------------------------------------------------------

--
-- Table structure for table `black_hole`
--

CREATE TABLE `black_hole` (
  `black_hole_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `mass` decimal(15,4) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `black_hole`
--

INSERT INTO `black_hole` (`black_hole_id`, `name`, `mass`, `is_active`, `description`) VALUES
(1, 'Sagittarius A*', 4300000.0000, 1, 'At the center of the Milky Way'),
(2, 'TON 618', 66000000000.0000, 1, 'One of the most massive known'),
(3, 'M87*', 6500000000.0000, 1, 'Imaged by EHT in 2019');

-- --------------------------------------------------------

--
-- Table structure for table `galaxy`
--

CREATE TABLE `galaxy` (
  `galaxy_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `size` int(11) NOT NULL,
  `age` decimal(10,2) DEFAULT NULL,
  `is_spiral` tinyint(1) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `galaxy`
--

INSERT INTO `galaxy` (`galaxy_id`, `name`, `size`, `age`, `is_spiral`, `description`) VALUES
(1, 'Milky Way', 100000, 13.51, 1, 'Our home galaxy'),
(2, 'Andromeda', 220000, 10.01, 1, 'Nearest major galaxy'),
(3, 'Sombrero', 50000, 12.50, 1, 'Unusual shape'),
(4, 'Whirlpool', 60000, 11.20, 1, 'Spiral galaxy with companion'),
(5, 'Messier 87', 120000, 14.00, 0, 'Giant elliptical galaxy'),
(6, 'Triangulum', 60000, 13.00, 1, 'Third-largest in Local Group');

-- --------------------------------------------------------

--
-- Table structure for table `moon`
--

CREATE TABLE `moon` (
  `moon_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `radius` int(11) NOT NULL,
  `has_water` tinyint(1) NOT NULL,
  `composition` text DEFAULT NULL,
  `planet_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moon`
--

INSERT INTO `moon` (`moon_id`, `name`, `radius`, `has_water`, `composition`, `planet_id`) VALUES
(1, 'Moon', 1737, 0, 'Rock', 1),
(2, 'Phobos', 11, 0, 'Rock', 2),
(3, 'Deimos', 6, 0, 'Rock', 2),
(4, 'Europa', 1560, 1, 'Ice', 3),
(5, 'Ganymede', 2634, 1, 'Ice', 3),
(6, 'Callisto', 2410, 1, 'Ice', 3),
(7, 'Io', 1821, 0, 'Volcanic', 3),
(8, 'Titan', 2575, 1, 'Ice', 10),
(9, 'Rhea', 763, 0, 'Ice', 10),
(10, 'Iapetus', 734, 0, 'Ice', 10),
(11, 'Enceladus', 252, 1, 'Ice', 10),
(12, 'Mimas', 198, 0, 'Rock', 10),
(13, 'Triton', 1353, 1, 'Ice', 7),
(14, 'Oberon', 761, 0, 'Ice', 8),
(15, 'Miranda', 235, 0, 'Ice', 8),
(16, 'Ariel', 578, 0, 'Ice', 8),
(17, 'Umbriel', 584, 0, 'Ice', 8),
(18, 'Charon', 606, 0, 'Ice', 6),
(19, 'Kepler-Moon-1', 1200, 0, 'Unknown', 4),
(20, 'TRAPPIST-Moon-1', 1000, 0, 'Rock', 12);

-- --------------------------------------------------------

--
-- Table structure for table `planet`
--

CREATE TABLE `planet` (
  `planet_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `diameter` int(11) NOT NULL,
  `has_life` tinyint(1) NOT NULL,
  `climate` text DEFAULT NULL,
  `star_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `planet`
--

INSERT INTO `planet` (`planet_id`, `name`, `diameter`, `has_life`, `climate`, `star_id`) VALUES
(1, 'Earth', 12742, 1, 'Temperate', 1),
(2, 'Mars', 6779, 0, 'Dry', 1),
(3, 'Jupiter', 139820, 0, 'Gas giant', 1),
(4, 'Kepler-22b', 24000, 0, 'Unknown', 2),
(5, 'Proxima b', 11400, 0, 'Unknown', 5),
(6, 'Venus', 12104, 0, 'Hot', 1),
(7, 'Neptune', 49244, 0, 'Cold', 1),
(8, 'Uranus', 50724, 0, 'Icy', 1),
(9, 'Mercury', 4879, 0, 'Hot', 1),
(10, 'Saturn', 116460, 0, 'Ringed gas giant', 1),
(11, 'Kepler-452b', 25000, 0, 'Unknown', 2),
(12, 'TRAPPIST-1e', 11700, 1, 'Mild', 5);

-- --------------------------------------------------------

--
-- Table structure for table `star`
--

CREATE TABLE `star` (
  `star_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `temperature` int(11) NOT NULL,
  `mass` decimal(12,3) DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `galaxy_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `star`
--

INSERT INTO `star` (`star_id`, `name`, `temperature`, `mass`, `is_visible`, `galaxy_id`) VALUES
(1, 'Sun', 5778, 1.989, 1, 1),
(2, 'Sirius', 9940, 2.063, 1, 1),
(3, 'Betelgeuse', 3500, 18.000, 1, 1),
(4, 'Vega', 9602, 2.100, 1, 1),
(5, 'Proxima Centauri', 3042, 0.122, 1, 1),
(6, 'Rigel', 12100, 21.000, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `black_hole`
--
ALTER TABLE `black_hole`
  ADD PRIMARY KEY (`black_hole_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `galaxy`
--
ALTER TABLE `galaxy`
  ADD PRIMARY KEY (`galaxy_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `moon`
--
ALTER TABLE `moon`
  ADD PRIMARY KEY (`moon_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `planet_id` (`planet_id`);

--
-- Indexes for table `planet`
--
ALTER TABLE `planet`
  ADD PRIMARY KEY (`planet_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `star_id` (`star_id`);

--
-- Indexes for table `star`
--
ALTER TABLE `star`
  ADD PRIMARY KEY (`star_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `galaxy_id` (`galaxy_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `black_hole`
--
ALTER TABLE `black_hole`
  MODIFY `black_hole_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `galaxy`
--
ALTER TABLE `galaxy`
  MODIFY `galaxy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `moon`
--
ALTER TABLE `moon`
  MODIFY `moon_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `planet`
--
ALTER TABLE `planet`
  MODIFY `planet_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `star`
--
ALTER TABLE `star`
  MODIFY `star_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `moon`
--
ALTER TABLE `moon`
  ADD CONSTRAINT `moon_ibfk_1` FOREIGN KEY (`planet_id`) REFERENCES `planet` (`planet_id`);

--
-- Constraints for table `planet`
--
ALTER TABLE `planet`
  ADD CONSTRAINT `planet_ibfk_1` FOREIGN KEY (`star_id`) REFERENCES `star` (`star_id`);

--
-- Constraints for table `star`
--
ALTER TABLE `star`
  ADD CONSTRAINT `star_ibfk_1` FOREIGN KEY (`galaxy_id`) REFERENCES `galaxy` (`galaxy_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
