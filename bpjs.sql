-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2024 at 10:24 PM
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
-- Database: `bpjs`
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
  `no_hp` bigint(15) DEFAULT NULL,
  `kelas_bpjs` varchar(2) DEFAULT NULL,
  `faskes` varchar(2) DEFAULT NULL,
  `No_bpjs` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `sub`, `name`, `preferred_username`, `given_name`, `family_name`, `email`, `email_verified`, `nik`, `no_kk`, `nama`, `alamat`, `no_hp`, `kelas_bpjs`, `faskes`, `No_bpjs`) VALUES
(0, '5ff80f24-e7ae-4465-8573-c8eedd1f1ec7', 'jack three ', 'test1', 'jack2', 'three2', 'test1@gmail.com', 0, '1234567890192837', '4416782989109281', 'jack three', 'jalan raya', 87911628912, '01', '01', '1234410101'),
(0, '3186690b-a872-4531-bc73-f23e077d8736', 'test7 test7', 'test7', 'test7', 'test7', 'test7@gmail.com', 0, '1234567890192837', '4416782989109281', 'test7', 'jalan manggis no 2', 85149704244, '03', '02', '1234410302'),
(0, '7a51500a-8a9e-4db4-9c2f-c2cb5a44ffb1', 'john doe', 'test2', 'john', 'doe', 'test2@gmail.com', 0, '98765431567', '5748392018', 'john doe', 'jalan mangga', 85249704244, '03', '02', '9875740302'),
(0, '747f7861-f915-4a22-8110-734eedd4ae0f', 'test6 test6', 'test6', 'test6', 'test6', 'test6@gmail.com', 0, '098765431567', '5748392018', 'dudi', 'jalan pisang', 85249704244, '02', '03', '0985740203');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
