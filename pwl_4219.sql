-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jun 2023 pada 16.22
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pwl_4219`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `harga` float DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `foto` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `nama`, `harga`, `jumlah`, `keterangan`, `foto`) VALUES
(1, 'Indomie Goreng', 2500, 50, 'Indomie Seleraku', 'indomie-mi-goreng-special_detail_094906814 (1).png'),
(2, 'Sari Roti Kismis', 5000, 100, 'Roti Single', 'roti_tawar_raisin1.jpg'),
(3, 'Susu Ultra', 5000, 100, 'Susu UHT', 'e31f03c4-8216-425d-8279-b7cee6e75cf8.jpg'),
(4, 'Dji Sam Soe Refill', 20000, 24, 'Ududnya Orang NU', 'dji-sam-soe-234-premium-12-285587.jpg'),
(8, 'Pak Danny', 999999, 3, 'Ganteng dan Keren', '1687244342_911e0adc9c50fe13f779.jpg'),
(9, 'h21b4u1', 32132, 32, 'dqwd', '1687320411_af4af3c5699271e7a1c8.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `total_harga` double NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `ongkir` double NOT NULL,
  `status` int(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `username`, `total_harga`, `alamat`, `ongkir`, `status`, `created_by`, `created_date`) VALUES
(1, 'regan', 19000, 'Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131', 9000, 0, 'regan', '2023-06-25 14:11:32'),
(2, 'regan', 62500, 'Jl. Tembalang', 35000, 0, 'regan', '2023-06-25 14:13:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `diskon` double NOT NULL,
  `subtotal_harga` double NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id`, `id_transaksi`, `id_barang`, `jumlah`, `diskon`, `subtotal_harga`, `created_by`, `created_date`) VALUES
(1, 1, 2, 1, 0, 5000, 'regan', '2023-06-25 14:11:32'),
(2, 1, 3, 1, 0, 5000, 'regan', '2023-06-25 14:11:32'),
(3, 2, 4, 1, 0, 20000, 'regan', '2023-06-25 14:13:34'),
(4, 2, 3, 1, 0, 5000, 'regan', '2023-06-25 14:13:34'),
(5, 2, 1, 1, 0, 2500, 'regan', '2023-06-25 14:13:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `role` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `role`, `password`) VALUES
(1, 'regan', 'admin', '202cb962ac59075b964b07152d234b70'),
(2, 'rcs', 'user', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
