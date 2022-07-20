-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jul 2022 pada 13.28
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas_si17200049`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `id_pemasok` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` int(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `id_pemasok`, `nama_barang`, `jumlah`, `created_at`) VALUES
(2, 1, 'Router', 1, '2022-07-20 08:45:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasang_produk`
--

CREATE TABLE `pemasang_produk` (
  `id_pemasangan` int(11) NOT NULL,
  `id_pembayaran` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasok`
--

CREATE TABLE `pemasok` (
  `id_pemasok` int(11) NOT NULL,
  `nama_pemasok` varchar(100) NOT NULL,
  `tlp_pemasok` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemasok`
--

INSERT INTO `pemasok` (`id_pemasok`, `nama_pemasok`, `tlp_pemasok`) VALUES
(1, 'Ali', '087765432256');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `total_bayar` decimal(10,0) NOT NULL,
  `tgl_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_registrasi` int(11) NOT NULL,
  `status` enum('Sudah Bayar','Belum Bayar','','') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga`, `created_at`) VALUES
(2, 'Nisa Hostpot', '400', '2022-07-20 08:44:08'),
(3, 'Paket Usaha Voucher Wifi Mikrotik Rb941 ', '400', '2022-07-20 09:00:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `registrasi`
--

CREATE TABLE `registrasi` (
  `id_registrasi` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `jk` varchar(50) NOT NULL,
  `tlp` varchar(12) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('admin','user','','') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `registrasi`
--

INSERT INTO `registrasi` (`id_registrasi`, `nama_lengkap`, `nik`, `jk`, `tlp`, `alamat`, `username`, `password`, `status`, `created_at`) VALUES
(1, 'Uyunun Lusiana', '52020764820003', 'Perempuan', '081997654399', 'Pringgarata', 'uyun', 'a3c0e5c01bf16af3b5bb040a811e64a8', 'admin', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_pemasok` (`id_pemasok`);

--
-- Indeks untuk tabel `pemasang_produk`
--
ALTER TABLE `pemasang_produk`
  ADD PRIMARY KEY (`id_pemasangan`),
  ADD KEY `id_pembayaran` (`id_pembayaran`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id_pemasok`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pembelian` (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_registrasi` (`id_registrasi`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `registrasi`
--
ALTER TABLE `registrasi`
  ADD PRIMARY KEY (`id_registrasi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pemasang_produk`
--
ALTER TABLE `pemasang_produk`
  MODIFY `id_pemasangan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id_pemasok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `registrasi`
--
ALTER TABLE `registrasi`
  MODIFY `id_registrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_pemasok`) REFERENCES `pemasok` (`id_pemasok`);

--
-- Ketidakleluasaan untuk tabel `pemasang_produk`
--
ALTER TABLE `pemasang_produk`
  ADD CONSTRAINT `pemasang_produk_ibfk_1` FOREIGN KEY (`id_pembayaran`) REFERENCES `pembayaran` (`id_pembayaran`),
  ADD CONSTRAINT `pemasang_produk_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian_produk` (`id_pembelian`);

--
-- Ketidakleluasaan untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD CONSTRAINT `pembelian_produk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `pembelian_produk_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `pembelian_produk_ibfk_3` FOREIGN KEY (`id_registrasi`) REFERENCES `registrasi` (`id_registrasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
