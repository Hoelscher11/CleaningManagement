-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2021 at 03:14 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cleaning_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `username` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `address` varchar(90) NOT NULL,
  `contact` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `first_name`, `last_name`, `username`, `password`, `address`, `contact`) VALUES
(1, 'Hoelscher', 'Stephen', 'hoelscher11', 'sa4321', 'RH. Bantan Nanga Rassan, Machan 96700 Kanowit, Sibu, Sarawak', '011-33022536');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(3) NOT NULL,
  `customername` varchar(60) DEFAULT NULL,
  `customerhpno` varchar(13) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `buildingtype` varchar(20) DEFAULT NULL,
  `date` varchar(50) NOT NULL,
  `addnotes` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `customername`, `customerhpno`, `address`, `buildingtype`, `date`, `addnotes`) VALUES
(1, 'Muhamad Farhan Bin Yusuf', '019-4765890', 'No. 5, Jalan Teratai, Taman Bunga Indah, Gong Badak 21300 Kuala Nerus, Terengganu', 'Small House', '2021-07-10', ''),
(2, 'Amir Hilman', '019-4376548', 'No 34, Jalan Gong Badak, 21300 Kuala Nerus, Terengganu', 'Medium-size House', '2021-08-04', ''),
(3, 'Khairul Adha', '013-6536842', 'No 4, Jalan Gong Datuk, 21300 Kuala Nerus, Terengganu', 'Big Office Room', '2021-06-26', ''),
(4, 'Muhamad Hassan Bin Ahmad', '018-3250867', 'No 5, Jalan Bunga Raya, Taman Kiara, Seberang Takir 21200 Kuala Terengganu, Terengganu', 'Big House', '2021-08-05', ''),
(5, 'Muhamad Hafiz bin Jalaludin', '017-0943267', 'Lot 7, Jalan Gelong Nibong, Kampung Kubang Jela, Seberang Takir, 21200 Kuala Terengganu, Terengganu', 'Small House', '2021-06-29', '');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(60) DEFAULT NULL,
  `lastname` varchar(60) DEFAULT NULL,
  `ic_no` varchar(16) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `reg_date` varchar(60) DEFAULT NULL,
  `jobID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`user_id`, `firstname`, `lastname`, `ic_no`, `address`, `contact`, `email`, `reg_date`, `jobID`) VALUES
(1, 'Nadzmi', 'Bin Jasnin', '981110-11-5420', 'No 12, Lorong 3, Taman Seri Permai, Gong Badak, 21300 Kuala Nerus, Terengganu', '019-8543945', 'nadzmi@gmail.com', '2021-06-22', 1),
(2, 'Siti Fatimah', 'Binti Yahya', '960202-10-5401', 'No 34, Jalan Kampung Katong, Kampung Kubang Tepak, 21200 Kuala Terengganu, Terengganu', '019-3268734', 'sitifatimah@gmail.com', '2021-06-15', 1),
(3, 'Nur Fazlina', 'Binti Shamsudin', '920112-10-5023', 'Jalan Desa Jaya 2, Kawasan Perindustrian Chendering, 21080 Kuala Terengganu, Terengganu', '013-2674498', 'fazlina@gmail.com', '2021-06-19', 2),
(4, 'Ahmad Hamdan', 'Bin Hamzah', '950918-10-5021', 'LOT 1359B, JALAN KUBANG IKAN, BUKIT BATU PUTEH, CHENDERING, 21080 Kuala Terengganu, Terengganu', '019-32795403', 'ahmadhamdan@gmail.com', '2021-06-22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `id` int(11) NOT NULL,
  `tool` varchar(60) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `jobID` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`id`, `tool`, `quantity`, `jobID`) VALUES
(1, 'Vacuum', 3, 1),
(2, 'Broom', 4, 1),
(3, 'Boots', 8, 1),
(4, 'Cleaning cloth', 12, 1),
(5, 'Cleaning cloth', 10, 2),
(6, 'Broom', 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobID` (`jobID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tools`
--
ALTER TABLE `tools`
  ADD CONSTRAINT `tools_ibfk_1` FOREIGN KEY (`jobID`) REFERENCES `jobs` (`id`),
  ADD CONSTRAINT `tools_ibfk_2` FOREIGN KEY (`jobID`) REFERENCES `jobs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
