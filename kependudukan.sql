-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2024 at 10:25 PM
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
-- Database: `kependudukan`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `preferred_username` varchar(100) DEFAULT NULL,
  `given_name` varchar(100) DEFAULT NULL,
  `family_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `no_kk` varchar(16) DEFAULT NULL,
  `nama` varchar(225) DEFAULT NULL,
  `alamat` varchar(225) DEFAULT NULL,
  `no_hp` bigint(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `sub`, `name`, `preferred_username`, `given_name`, `family_name`, `email`, `email_verified`, `nik`, `no_kk`, `nama`, `alamat`, `no_hp`) VALUES
(1, '5ff80f24-e7ae-4465-8573-c8eedd1f1ec7', 'jack three ', 'test1', 'jack2', 'three2', 'test1@gmail.com', 0, '1234567890192837', '4416782989109281', 'jack three', 'jalan raya', 87911628912),
(2, '7a51500a-8a9e-4db4-9c2f-c2cb5a44ffb1', 'john doe', 'test2', 'john', 'doe', 'test2@gmail.com', 0, '098765431567', '5748392018', 'john doe', 'jalan mangga', 85249704244),
(3, '3186690b-a872-4531-bc73-f23e077d8736', 'test7 test7', 'test7', 'test7', 'test7', 'test7@gmail.com', 0, '1234567890192837', '4416782989109281', 'test7', 'jalan manggis no 2', 85149704244),
(4, '747f7861-f915-4a22-8110-734eedd4ae0f', 'test6 test6', 'test6', 'test6', 'test6', 'test6@gmail.com', 0, '098765431567', '5748392018', 'dudi', 'jalan pisang', 85249704244),
(5, '0fec32fe-7134-4c4d-ade0-13b58b3cfd1e', 'jack ryan', 'jack', 'jack', 'ryan', 'jack@gmail.com', 0, '1234567890192837', '4416782989109281', 'jack three', 'jalan jeruk no 2', 85149704244);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub` (`sub`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
