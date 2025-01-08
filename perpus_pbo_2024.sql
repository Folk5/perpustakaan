-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 06:57 PM
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
-- Database: `perpus_pbo_2024`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`user_id`, `email`, `password`) VALUES
(1, 'admin123@gmail.com', 0x35626532303830613634383838643836653830643134396163346262363635653434383536306636363064353461613530643430633465353237613530363739),
(3, 'kiting@gmail.com', 0x31313034626263306635613632653437393633303435656466656133623834663665343532343234373663343561623337646665356233383136393131373965),
(4, 'adip@gmail.com', 0x34376237623737383633646236326332656232353862383730316436303437663633343337326566346163313161633366343431393532393639346666373233);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `kode_admin` varchar(6) NOT NULL,
  `account_id_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `kode_admin`, `account_id_fk`) VALUES
(1, 'ADM001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_date` datetime NOT NULL,
  `expired_date` datetime NOT NULL,
  `member_id_fk` int(11) NOT NULL,
  `bukuDetails_id_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `booking_date`, `expired_date`, `member_id_fk`, `bukuDetails_id_fk`) VALUES
(26, '2025-01-08 00:00:00', '2025-01-10 00:00:00', 2, 16),
(27, '2025-01-08 00:00:00', '2025-01-09 00:00:00', 2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `buku_id` int(11) NOT NULL,
  `nama_buku` varchar(50) NOT NULL,
  `tipe_buku` varchar(10) NOT NULL COMMENT 'buku fisik atau online',
  `jenis_buku` varchar(15) NOT NULL COMMENT 'genre buku',
  `tgl_terbit` date NOT NULL,
  `author` varchar(100) NOT NULL,
  `rakbuku_id_fk` int(11) NOT NULL,
  `status_booking` tinyint(1) NOT NULL DEFAULT 0,
  `jumlah` int(11) DEFAULT 1,
  `jml_tersedia` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`buku_id`, `nama_buku`, `tipe_buku`, `jenis_buku`, `tgl_terbit`, `author`, `rakbuku_id_fk`, `status_booking`, `jumlah`, `jml_tersedia`) VALUES
(34, 'Hujan', 'fisik', 'Novel', '2016-12-04', 'Tere Liye', 2, 0, 2, 1),
(35, 'Atomic Habits', 'fisik', 'Education', '2018-12-08', 'James Clear', 1, 1, 1, 1),
(36, 'Dune', 'fisik', 'Novel', '1965-07-02', 'Frank Herbert', 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bukudetails`
--

CREATE TABLE `bukudetails` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `keluhan` varchar(150) DEFAULT NULL,
  `buku_id_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bukudetails`
--

INSERT INTO `bukudetails` (`id`, `status`, `keluhan`, `buku_id_fk`) VALUES
(13, 1, 'Tidak ada', 34),
(14, 1, 'Tidak ada', 34),
(15, 0, 'Tidak ada', 35),
(16, 0, 'Tidak ada', 36);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `nama_depan` varchar(15) NOT NULL,
  `nama_belakang` varchar(15) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `account_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `nama_depan`, `nama_belakang`, `tanggal_lahir`, `account_id_fk`) VALUES
(2, 'kiting', 'gian', '2025-01-23', 3),
(3, 'Pradipa', 'Setiawan', '1211-12-12', 4);

-- --------------------------------------------------------

--
-- Table structure for table `rakbuku`
--

CREATE TABLE `rakbuku` (
  `rakbuku_id` int(11) NOT NULL,
  `jenis_rak` varchar(15) NOT NULL COMMENT 'pengelompokan buku pada satu rak',
  `lokasi_rak` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rakbuku`
--

INSERT INTO `rakbuku` (`rakbuku_id`, `jenis_rak`, `lokasi_rak`) VALUES
(1, 'Fiksi', 'Lantai 1'),
(2, 'Non-Fiksi', 'Lantai 2'),
(3, 'Referensi', 'Lantai 3'),
(4, 'Science', 'Lantai 2'),
(5, 'Comic', 'Lantai 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `admin_account_user_id_fk` (`account_id_fk`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `booking_member_member_id_fk` (`member_id_fk`),
  ADD KEY `Booking_BukuDetails_id_fk` (`bukuDetails_id_fk`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`buku_id`),
  ADD KEY `buku_rakbuku_rakbuku_id_fk` (`rakbuku_id_fk`);

--
-- Indexes for table `bukudetails`
--
ALTER TABLE `bukudetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BukuDetails_buku_buku_id_fk` (`buku_id_fk`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `member_account_user_id_fk` (`account_id_fk`);

--
-- Indexes for table `rakbuku`
--
ALTER TABLE `rakbuku`
  ADD PRIMARY KEY (`rakbuku_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `buku_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `bukudetails`
--
ALTER TABLE `bukudetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rakbuku`
--
ALTER TABLE `rakbuku`
  MODIFY `rakbuku_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_account_user_id_fk` FOREIGN KEY (`account_id_fk`) REFERENCES `account` (`user_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `Booking_BukuDetails_id_fk` FOREIGN KEY (`bukuDetails_id_fk`) REFERENCES `bukudetails` (`id`),
  ADD CONSTRAINT `Booking_member_member_id_fk` FOREIGN KEY (`member_id_fk`) REFERENCES `member` (`member_id`);

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_rakbuku_rakbuku_id_fk` FOREIGN KEY (`rakbuku_id_fk`) REFERENCES `rakbuku` (`rakbuku_id`);

--
-- Constraints for table `bukudetails`
--
ALTER TABLE `bukudetails`
  ADD CONSTRAINT `BukuDetails_buku_buku_id_fk` FOREIGN KEY (`buku_id_fk`) REFERENCES `buku` (`buku_id`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_account_user_id_fk` FOREIGN KEY (`account_id_fk`) REFERENCES `account` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
