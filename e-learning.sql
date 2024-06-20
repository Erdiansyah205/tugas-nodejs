-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2024 at 05:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `bab`
--

CREATE TABLE `bab` (
  `id_bab` int(11) NOT NULL,
  `nama_bab` varchar(255) DEFAULT NULL,
  `thumbnail_bab` varchar(255) DEFAULT NULL,
  `id_mata_pelajaran` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bab`
--

INSERT INTO `bab` (`id_bab`, `nama_bab`, `thumbnail_bab`, `id_mata_pelajaran`) VALUES
(1, 'Bilangan 0-10', 'thumbnail1.png', 1),
(2, 'Aplikasi Bilangan 0-10', 'thumbnail2.png', 1),
(3, 'Geometri dan Pola', 'thumbnail3.png', 1),
(4, 'Bilangan 11-20', 'thumbnail4.png', 1),
(5, 'Geometri dan Pola 2', 'thumbnail5.png', 1),
(6, 'Pengukuran (1)', 'thumbnail6.png', 1),
(7, 'Bilangan 21-40', 'thumbnail7.png', 1),
(8, 'Aplikasi Bilangan 21-40', 'thumbnail8.png', 1),
(9, 'Geometri dan Pola 3', 'thumbnail9.png', 1),
(10, 'Pengukuran (2)', 'thumbnail10.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`) VALUES
(1, 'Kelas 1'),
(2, 'Kelas 2'),
(3, 'Kelas 3'),
(4, 'Kelas 4'),
(5, 'Kelas 5'),
(6, 'Kelas 6'),
(7, 'Kelas 7'),
(8, 'Kelas 8'),
(9, 'Kelas 9'),
(10, 'Kelas 10'),
(11, 'Kelas 11'),
(12, 'Kelas 12'),
(13, 'Kelas 10 SMK'),
(14, 'Kelas 11 SMK'),
(15, 'Kelas 12 SMK'),
(16, 'UTBK & Ujian Mandiri'),
(17, 'Pelatihan Guru');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id_mata_pelajaran` int(11) NOT NULL,
  `nama_mata_pelajaran` varchar(255) DEFAULT NULL,
  `thumbnail_mata_pelajaran` varchar(255) DEFAULT NULL,
  `id_mode_pembelajaran` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `id_mode_membelajaran` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id_mata_pelajaran`, `nama_mata_pelajaran`, `thumbnail_mata_pelajaran`, `id_mode_pembelajaran`, `id_kelas`, `id_mode_membelajaran`) VALUES
(1, 'Matematika', 'thumbnail1.png', 1, 1, NULL),
(2, 'Bahasa Indonesia', 'thumbnail2.png', 1, NULL, NULL),
(3, 'IPA Terpadu', 'thumbnail3.png', 1, NULL, NULL),
(4, 'Pendidikan Karakter', 'thumbnail4.png', 1, NULL, NULL),
(5, 'Ruang Ngaji', 'thumbnail5.png', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id_materi` int(11) NOT NULL,
  `nama_materi` varchar(255) DEFAULT NULL,
  `thumbnail_materi` varchar(255) DEFAULT NULL,
  `tipe_materi` enum('Video','End Quiz','Single Quiz','Summary') NOT NULL,
  `XP` int(11) DEFAULT NULL,
  `Gold` int(11) DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT NULL,
  `id_sub_bab` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id_materi`, `nama_materi`, `thumbnail_materi`, `tipe_materi`, `XP`, `Gold`, `is_completed`, `id_sub_bab`) VALUES
(1, 'Bahasa indonesia', 'indonesia', 'End Quiz', 1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `mode_pembelajaran`
--

CREATE TABLE `mode_pembelajaran` (
  `id_mode_pembelajaran` int(11) NOT NULL,
  `nama_mode_pembelajaran` varchar(255) DEFAULT NULL,
  `deskripsi_mode_pembelajaran` text DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mode_pembelajaran`
--

INSERT INTO `mode_pembelajaran` (`id_mode_pembelajaran`, `nama_mode_pembelajaran`, `deskripsi_mode_pembelajaran`, `id_kelas`) VALUES
(1, 'Pembelajaran Tematik', 'Deskripsi Pembelajaran Tematik', 1),
(2, 'Pembelajaran Menurut Topik', 'Deskripsi Pembelajaran Menurut Topik', 1),
(3, 'Kurikulum Merdeka', 'Deskripsi Kurikulum Merdeka', 1);

-- --------------------------------------------------------

--
-- Table structure for table `progres`
--

CREATE TABLE `progres` (
  `id_progres` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_materi` int(11) NOT NULL,
  `status_progres` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progres`
--

INSERT INTO `progres` (`id_progres`, `id_user`, `id_materi`, `status_progres`) VALUES
(9, 1, 1, 1),
(10, 1, 1, 0),
(11, 1, 1, 1),
(12, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20240610085749-create-user.js'),
('20240610093050-create-user.js'),
('20240610141419-create-kelas.js'),
('20240610142721-create-mode-pembelajaran.js'),
('20240610150442-add-deskripsi-kelas-to-kelas.js'),
('20240610150701-create-kelas.js'),
('20240610150909-create-mode-pembelajaran.js'),
('20240610163007-create-kelas.js'),
('20240610163120-create-mode-pembelajaran.js'),
('20240610171621-create-kelas.js'),
('20240610172054-create-mode-pembelajaran.js'),
('20240610172602-create-kelas.js'),
('20240610172702-create-mode-pembelajaran.js'),
('20240610174029-create-mata-pelajaran.js'),
('20240610180411-create-mode-pembelajaran.js'),
('20240611034711-create-mata-pelajaran.js'),
('20240611053434-create-bab.js'),
('20240611060937-create-sub-bab.js'),
('20240611071004-create-material.js'),
('20240611085232-create-progres.js'),
('20240611093743-create-progres.js'),
('20240611094541-create-materi.js');

-- --------------------------------------------------------

--
-- Table structure for table `sub_bab`
--

CREATE TABLE `sub_bab` (
  `id_sub_bab` int(11) NOT NULL,
  `nama_sub_bab` varchar(255) DEFAULT NULL,
  `thumbnail_sub_bab` varchar(255) DEFAULT NULL,
  `is_free` tinyint(1) DEFAULT NULL,
  `id_bab` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_bab`
--

INSERT INTO `sub_bab` (`id_sub_bab`, `nama_sub_bab`, `thumbnail_sub_bab`, `is_free`, `id_bab`) VALUES
(1, 'Mengenal Bilangan 1-10 (1)', 'thumbnail1.png', 1, 1),
(2, 'Mengenal Bilangan 1-10 (2)', 'thumbnail2.png', 0, 1),
(3, 'Lebih Besar? Lebih Kecil? 1-10', 'thumbnail3.png', 0, 1),
(4, 'Bermain dengan Bilangan 1-10', 'thumbnail4.png', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'uhuy', 'email@gmail.com', '$2b$10$QceE9KjWgWNAs1LVlH6RZ.KckXxTeMahPbRMpSxHnWBTBoHjkpxAG', '2024-06-12 08:47:04', '2024-06-12 08:47:04'),
(2, 'uhuy', 'email1@gmail.com', '$2b$10$oND0KD10Dabq/dj24G5gYuplxYpW4py7mO6MxLzNfnfmlBXiy9gta', '2024-06-12 09:07:01', '2024-06-12 09:07:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bab`
--
ALTER TABLE `bab`
  ADD PRIMARY KEY (`id_bab`),
  ADD KEY `id_mata_pelajaran` (`id_mata_pelajaran`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id_mata_pelajaran`),
  ADD KEY `id_mode_pembelajaran` (`id_mode_pembelajaran`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mode_membelajaran` (`id_mode_membelajaran`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `id_sub_bab` (`id_sub_bab`);

--
-- Indexes for table `mode_pembelajaran`
--
ALTER TABLE `mode_pembelajaran`
  ADD PRIMARY KEY (`id_mode_pembelajaran`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `progres`
--
ALTER TABLE `progres`
  ADD PRIMARY KEY (`id_progres`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_materi` (`id_materi`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sub_bab`
--
ALTER TABLE `sub_bab`
  ADD PRIMARY KEY (`id_sub_bab`),
  ADD KEY `id_bab` (`id_bab`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bab`
--
ALTER TABLE `bab`
  MODIFY `id_bab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id_mata_pelajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mode_pembelajaran`
--
ALTER TABLE `mode_pembelajaran`
  MODIFY `id_mode_pembelajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `progres`
--
ALTER TABLE `progres`
  MODIFY `id_progres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sub_bab`
--
ALTER TABLE `sub_bab`
  MODIFY `id_sub_bab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bab`
--
ALTER TABLE `bab`
  ADD CONSTRAINT `bab_ibfk_1` FOREIGN KEY (`id_mata_pelajaran`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD CONSTRAINT `mata_pelajaran_ibfk_1` FOREIGN KEY (`id_mode_pembelajaran`) REFERENCES `mode_pembelajaran` (`id_mode_pembelajaran`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `mata_pelajaran_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mata_pelajaran_ibfk_3` FOREIGN KEY (`id_mode_membelajaran`) REFERENCES `mode_pembelajaran` (`id_mode_pembelajaran`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`id_sub_bab`) REFERENCES `sub_bab` (`id_sub_bab`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `mode_pembelajaran`
--
ALTER TABLE `mode_pembelajaran`
  ADD CONSTRAINT `mode_pembelajaran_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `progres`
--
ALTER TABLE `progres`
  ADD CONSTRAINT `progres_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `progres_ibfk_2` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id_materi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_bab`
--
ALTER TABLE `sub_bab`
  ADD CONSTRAINT `sub_bab_ibfk_1` FOREIGN KEY (`id_bab`) REFERENCES `bab` (`id_bab`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
