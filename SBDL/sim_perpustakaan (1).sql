-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2020 at 03:44 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sim perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(5) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `jenis_pengenal` tinyint(1) NOT NULL,
  `no_pengenal` tinyint(30) NOT NULL,
  `kontak` varchar(12) NOT NULL,
  `tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `alamat`, `jenis_pengenal`, `no_pengenal`, `kontak`, `tgl_daftar`) VALUES
('1', 'kaori', 'prapatan shibuya', 1, 122, '08688888', '2020-03-02'),
('2', 'cahya nur hikari', 'pertigaan isekai', 2, 43, '0899999', '2020-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` varchar(5) NOT NULL,
  `judul` varchar(20) NOT NULL,
  `pengarang` varchar(20) NOT NULL,
  `penerbit` varchar(20) NOT NULL,
  `tahun_terbit` int(4) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `jml_halaman` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `isbn`, `jml_halaman`, `status`) VALUES
('54', 'sejarah desa legok h', 'ahmad borju', 'cahaya ilahi', 2009, 'buku ini hanya kjkarangan', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `detil_transaksi`
--

CREATE TABLE `detil_transaksi` (
  `no_peminjaman` int(5) NOT NULL,
  `id_buku` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `username` varchar(20) NOT NULL,
  `pasword` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `kontak` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`username`, `pasword`, `nama`, `alamat`, `kontak`) VALUES
('kusnendi123', 'abogaboga', 'kusnendi', 'majalengka tengah', '08534444');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_pinjam` varchar(5) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_batas` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `denda` int(11) NOT NULL,
  `id_anggota` varchar(10) NOT NULL,
  `id_petugas` varchar(10) NOT NULL,
  `no_peminjaman` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judul` (`judul`);

--
-- Indexes for table `detil_transaksi`
--
ALTER TABLE `detil_transaksi`
  ADD UNIQUE KEY `no_peminjaman` (`no_peminjaman`),
  ADD UNIQUE KEY `id_buku` (`id_buku`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_peminjaman`),
  ADD UNIQUE KEY `id_anggota` (`id_anggota`),
  ADD UNIQUE KEY `id_petugas` (`id_petugas`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
