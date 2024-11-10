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
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelola`
--

CREATE TABLE `kelola` (
  `id` int(11) NOT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `no_hp` bigint(15) DEFAULT NULL,
  `rekening` varchar(20) DEFAULT NULL,
  `QRIS` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengelola`
--

CREATE TABLE `pengelola` (
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
  `no_bpjs` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengelola`
--

INSERT INTO `pengelola` (`id`, `sub`, `name`, `preferred_username`, `given_name`, `family_name`, `email`, `email_verified`, `nik`, `no_kk`, `nama`, `alamat`, `no_hp`, `kelas_bpjs`, `faskes`, `no_bpjs`) VALUES
(1, '3186690b-a872-4531-bc73-f23e077d8736', 'test7 test7', 'test7', 'test7', 'test7', 'test7@gmail.com', 0, '1234567890192837', '4416782989109281', 'test7', 'jalan manggis no 2', 85149704244, '03', '02', '1234410302');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jalan`
--

CREATE TABLE `rawat_jalan` (
  `id` int(11) NOT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `no_rekam_medis` varchar(50) DEFAULT NULL,
  `jenis_klinik` varchar(100) DEFAULT NULL,
  `dokter` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `waktu` time DEFAULT NULL,
  `keluhan` text DEFAULT NULL,
  `no_rawat_jalan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rawat_jalan`
--

INSERT INTO `rawat_jalan` (`id`, `sub`, `no_rekam_medis`, `jenis_klinik`, `dokter`, `tanggal`, `waktu`, `keluhan`, `no_rawat_jalan`) VALUES
(7, '747f7861-f915-4a22-8110-734eedd4ae0f', '09870985', 'klinik ank', 'budi', '2024-11-13', '15:03:00', 'sakit pinggang', '090985');

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
  `no_bpjs` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `sub`, `name`, `preferred_username`, `given_name`, `family_name`, `email`, `email_verified`, `nik`, `no_kk`, `nama`, `alamat`, `no_hp`, `kelas_bpjs`, `faskes`, `no_bpjs`) VALUES
(1, '747f7861-f915-4a22-8110-734eedd4ae0f', 'test6 test6', 'test6', 'test6', 'test6', 'test6@gmail.com', 0, '098765431567', '5748392018', 'dudi', 'jalan pisang', 85249704244, '02', '03', '0985740203'),
(2, '3186690b-a872-4531-bc73-f23e077d8736', 'test7 test7', 'test7', 'test7', 'test7', 'test7@gmail.com', 0, '1234567890192837', '4416782989109281', 'test7', 'jalan manggis no 2', 85149704244, '03', '02', '1234410302'),
(3, '5ff80f24-e7ae-4465-8573-c8eedd1f1ec7', 'jack three', 'test1', 'jack', 'three', 'test1@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelola`
--
ALTER TABLE `kelola`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengelola`
--
ALTER TABLE `pengelola`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rawat_jalan`
--
ALTER TABLE `rawat_jalan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sub` (`sub`),
  ADD KEY `idx_no_rekam_medis` (`no_rekam_medis`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengelola`
--
ALTER TABLE `pengelola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rawat_jalan`
--
ALTER TABLE `rawat_jalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
