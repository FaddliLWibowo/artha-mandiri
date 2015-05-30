-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 30 Mei 2015 pada 15.47
-- Versi Server: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `artha_mandiri1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `angsur`
--

CREATE TABLE IF NOT EXISTS `angsur` (
  `no_angsur` char(12) NOT NULL,
  `no_pnjm` char(12) NOT NULL,
  `tanggal_angsur` date NOT NULL,
  `angsuran_ke` int(11) NOT NULL,
  `besar_angsuran` int(11) NOT NULL,
  `sisa_angsuran` int(11) NOT NULL,
  `denda` int(11) NOT NULL,
  `petugas` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `angsur`
--

INSERT INTO `angsur` (`no_angsur`, `no_pnjm`, `tanggal_angsur`, `angsuran_ke`, `besar_angsuran`, `sisa_angsuran`, `denda`, `petugas`) VALUES
('A-001-003', 'L-001-002', '2015-03-17', 1, 780000, 11, 0, '15001'),
('A-001-007', 'L-001-003', '2015-04-07', 1, 2147483647, 9, 7700, '15001'),
('A-001-008', 'L-001-002', '2015-04-07', 2, 780000, 10, 7800, '15001'),
('A-001-009', 'L-001-002', '2015-04-07', 3, 780000, 9, 7800, '15001'),
('A-001-010', 'L-001-002', '2015-04-07', 4, 780000, 8, 7800, '15001'),
('A-001-011', 'L-001-002', '2015-04-07', 5, 780000, 7, 7800, '15001'),
('A-001-012', 'L-001-002', '2015-04-08', 6, 780000, 6, 7800, '15001'),
('A-001-013', 'L-002-004', '2015-04-10', 2, 306000, 8, 3060, '15001'),
('A-001-014', 'L-002-004', '2015-04-10', 2, 306000, 8, 0, '15001'),
('A-001-015', 'L-002-004', '2015-04-10', 2, 306000, 8, 0, '15001'),
('A-001-016', 'L-002-005', '2015-04-10', 2, 396175, 10, 3825, '15001'),
('A-001-017', 'L-002-005', '2015-04-10', 2, 450000, 10, 0, '15001'),
('A-001-018', 'L-001-002', '2015-04-10', 7, 780000, 5, 7800, '15001'),
('A-001-019', 'L-001-006', '2015-04-10', 1, 2147483647, 5, 0, '15001'),
('A-001-020', 'L-001-003', '2015-04-10', 2, 2147483647, 8, 0, '15001'),
('A-001-021', 'L-002-005', '2015-04-10', 2, 500000, 10, 0, '15001'),
('A-001-022', 'L-001-006', '2015-05-12', 2, 2147483647, 4, 3400, '15001'),
('A-001-023', 'L-001-002', '2015-05-24', 8, 780000, 4, 15600, '15001'),
('A-001-024', 'L-001-002', '2015-05-24', 9, 780000, 3, 15600, '15001'),
('A-001-025', 'L-001-003', '2015-05-24', 3, 770000, 7, 7700, '15001'),
('A-001-028', 'L-001-002', '2015-05-25', 10, 780000, 2, 15600, '15001'),
('A-002-004', 'L-002-004', '2015-03-17', 1, 306000, 9, 0, '15003'),
('A-002-005', 'L-002-005', '2015-03-17', 1, 382500, 11, 0, '15003'),
('A-002-026', 'L-002-005', '2015-05-24', 2, 382500, 10, 3825, '15002'),
('A-002-027', 'L-002-004', '2015-05-24', 2, 306000, 8, 3060, '15002');

--
-- Trigger `angsur`
--
DELIMITER //
CREATE TRIGGER `tg_angsur` BEFORE INSERT ON `angsur`
 FOR EACH ROW BEGIN
 UPDATE pinjam
 SET sisa = sisa - NEW.besar_angsuran
 WHERE
 no_pinjam = NEW.no_pnjm;
 END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabang`
--

CREATE TABLE IF NOT EXISTS `cabang` (
  `no_cab` char(5) NOT NULL,
  `nama_cab` varchar(50) NOT NULL,
  `alamat_cab` varchar(50) NOT NULL,
  `tlp_cab` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cabang`
--

INSERT INTO `cabang` (`no_cab`, `nama_cab`, `alamat_cab`, `tlp_cab`) VALUES
('001', 'Dukun', 'Jl. talun dukun', '0121212'),
('002', 'Salam', 'Jl Magelang-Jogja', '0912812'),
('003', 'seyegan', 'jalan blaburan  yogyakarta', '078234832');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_umum`
--

CREATE TABLE IF NOT EXISTS `jurnal_umum` (
  `nomor_jurnal` int(15) NOT NULL,
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_selesai` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jurnal_umum`
--

INSERT INTO `jurnal_umum` (`nomor_jurnal`, `kode_transaksi`, `tanggal_selesai`) VALUES
(1, 'BU/1', '09/03/2015'),
(2, 'BU/2', '09/03/2015'),
(3, 'BU/3', '09/03/2015');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nasabah`
--

CREATE TABLE IF NOT EXISTS `nasabah` (
  `no_rekening` char(12) NOT NULL,
  `cabang` char(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `pekerjaan` varchar(20) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_identitas` char(30) NOT NULL,
  `hp` char(20) NOT NULL,
  `tgldibuat` date NOT NULL,
  `petugas` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nasabah`
--

INSERT INTO `nasabah` (`no_rekening`, `cabang`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `pekerjaan`, `alamat`, `no_identitas`, `hp`, `tgldibuat`, `petugas`) VALUES
('001-13-001', '001', 'Andi Mandala', 'pria', '1992-08-13', 'Dosen', 'jogja', '9090009088', '09128192121', '2013-11-14', '15001'),
('001-15-002', '001', 'angga pramudianto', 'pria', '1993-03-08', 'bussines man', 'karang gayam, nologaten, yogyakarta', '8975746546546', '0987979388', '2015-03-12', '15001'),
('001-15-003', '001', 'randi raharjo', 'pria', '1990-01-09', 'bussines man', 'jln manggis raya, purworejo', '7898798789798', '098980202', '2015-03-12', '15001'),
('001-15-004', '001', 'rani nurdiani', 'wanita', '1987-09-22', 'pns guru smp ', 'samisari- samigaluh, salam', '900989008909890', '0192109912', '2015-03-14', '15001'),
('001-15-009', '001', 'roni siba', 'pria', '1993-03-19', 'pns', 'sawitan mungkid', '0989899878989', '098989767676', '2015-03-16', '15001'),
('001-15-010', '001', 'rani nurdiani', 'wanita', '1996-03-06', 'swasta', 'sawitan,mungkid', '989090909898', '0898986665', '2015-03-16', '15001'),
('001-15-011', '001', 'soni kunardi', 'pria', '2015-03-10', 'polri', 'sawangan.magelang', '90898989778787', '0989897969', '2015-03-16', '15001'),
('001-15-014', '001', 'vanesia amarawari', 'wanita', '1996-04-04', 'mahasiswi', 'gondangan kadiluwih magelang', '0938948931321', '09872837823', '2015-04-08', '15001'),
('001-15-015', '001', 'dina ramadahn', 'wanita', '1993-05-13', 'mhs', 'jombang', '01293123', '071238123', '2015-05-12', '15001'),
('001-15-016', '001', 'juara', 'pria', '2015-05-20', 'mhs', 'juanda', '0729384', '023704273', '2015-05-12', '15001'),
('001-15-017', '001', 'jay muhtadi', 'pria', '1996-05-06', 'mhs', 'junan', '019230', '0192830912', '2015-05-13', '15001'),
('001-15-018', '001', 'ronal', 'pria', '1997-05-13', 'mhs', 'kontrak', '0980900080808', '9797970', '2015-05-13', '15001'),
('001-15-019', '001', 'yuyun', 'wanita', '1997-05-07', 'mhs', 'mkhkh', '07070', '09898798', '2015-05-13', '15001'),
('001-15-020', '001', 'itasri', 'wanita', '1996-05-15', 'mhs', 'mkojk', '090801242', '0363', '2015-05-13', '15001'),
('001-15-021', '001', 'andri hermawan', 'pria', '1988-05-11', 'wirausaha', 'jakarta', '012391283', '0876237123', '2015-05-21', '15001'),
('001-15-022', '001', 'harjuna', 'pria', '2015-05-06', 'guru', 'patosan', '021397012', '07872313', '2015-05-21', '15001'),
('001-15-023', '001', 'sallys', 'wanita', '2015-05-03', 'mss', 'sa', '12', '122321321', '2015-05-24', '15001'),
('001-15-024', '001', 'wageman', 'pria', '2015-05-19', 'mas', 'nasd', '09821348789', '0970997097', '2015-05-24', '15001'),
('001-15-026', '001', 'wahid sarifudin', 'pria', '2015-05-12', 'juragan', 'kjasdj', '09340', '029384', '2015-05-25', '15001'),
('002-15-005', '002', 'rudianto subekti', 'pria', '2015-05-13', 'guru sd', 'margoyoso, sleman', '9099876769900', '0989999800009', '2015-03-16', '15002'),
('002-15-006', '002', 'gerry danurta', 'pria', '1989-03-07', 'orkes music', 'yogyakarta', '9098900986666', '09876586868', '2015-03-16', '15002'),
('002-15-007', '002', 'santi wijayati', 'wanita', '1990-08-09', 'pedagang', 'ngemplak, salaman, mgl', '909987676111', '0987676765', '2015-03-16', '15001'),
('002-15-012', '002', 'muhammad suradi', 'pria', '1993-03-04', 'pelajar', 'ganodang anom', '0912819288', '098782882', '2015-03-17', '15002'),
('002-15-013', '002', 'wahyudi', 'pria', '1993-03-03', 'petani', 'ngawen', '092873487384783', '0292381232', '2015-03-17', '15003'),
('002-15-025', '002', 'rangga prasetiyo', 'pria', '1997-05-01', 'TNI', 'Lampung', '02374093274', '0293740327407', '2015-05-25', '15002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE IF NOT EXISTS `petugas` (
  `nip` char(12) NOT NULL,
  `cab` char(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jabatan` enum('sa','a') NOT NULL DEFAULT 'a',
  `alamat` varchar(100) NOT NULL,
  `tlp` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `blokir` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`nip`, `cab`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `jabatan`, `alamat`, `tlp`, `email`, `password`, `foto`, `blokir`) VALUES
('15001', '001', 'Prasetyo Eko K', 'pria', '1992-08-13', 'sa', 'muntilan', '085729000916', 'kondang@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '3211.01.2923.jpg', 'N'),
('15002', '002', 'jamilah haidar', 'wanita', '1992-08-13', 'a', 'salaman magelang', '085729000916', 'jamhaid@gmail.com', '60114d8e31dc21e34aa55bcfefa8c4b6', 'jamilah.jpg', 'N'),
('15003', '002', 'wardani pamilih', 'pria', '1996-03-07', 'a', 'jumoyo muntilan', '08767364546', 'wardani@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '40koala.jpg', 'N'),
('15004', '002', 'ananda estha zuu', 'wanita', '1996-05-08', 'a', 'margorejo, tempel', '0983492349', 'ananda@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '1IMG-20150219-00390.jpg', 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjam`
--

CREATE TABLE IF NOT EXISTS `pinjam` (
  `no_pinjam` char(12) NOT NULL,
  `no_rek` char(12) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT '0',
  `lama` int(11) NOT NULL DEFAULT '0',
  `bunga` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `sisa` int(11) NOT NULL DEFAULT '0',
  `status` enum('S','Y','B','T') NOT NULL DEFAULT 'B',
  `keterangan` varchar(100) NOT NULL,
  `nama_jaminan` varchar(50) NOT NULL,
  `jenis` enum('Surat','Barang') NOT NULL,
  `nama_pemilik` varchar(50) NOT NULL,
  `alamat_pemilik` varchar(100) NOT NULL,
  `status_jaminan` enum('B','T','A') NOT NULL DEFAULT 'B',
  `petugas` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pinjam`
--

INSERT INTO `pinjam` (`no_pinjam`, `no_rek`, `tanggal`, `jumlah`, `lama`, `bunga`, `total`, `sisa`, `status`, `keterangan`, `nama_jaminan`, `jenis`, `nama_pemilik`, `alamat_pemilik`, `status_jaminan`, `petugas`) VALUES
('L-001-002', '001-15-003', '2015-03-16', 9000000, 12, 4, 9360000, 1560000, 'Y', 'Memiliki Hutang', 'revo ronger', 'Barang', 'saiful b', 'juanda no tiga satu yogya karta', 'T', '15001'),
('L-001-003', '001-15-004', '2015-03-16', 7000000, 10, 10, 7700000, 5390000, 'Y', 'Memiliki Hutang', 'surat bpkp motor', 'Barang', 'suratman', 'gondang anom sawangan magelang', 'T', '15001'),
('L-001-006', '001-15-010', '2015-04-10', 2000000, 6, 2, 2040000, 1360000, 'Y', 'Memiliki Hutang', 'Motor Supra ', 'Barang', 'muhamami', 'kolongan', 'A', '15001'),
('L-001-007', '001-15-002', '2015-05-22', 80000, 2, 8, 86400, 86400, 'Y', 'Memiliki Hutang', 'koko', 'Surat', 'jiok', 'kommm', 'T', '15001'),
('L-001-008', '001-15-015', '2015-05-22', 7000000, 2, 10, 7700000, 7700000, 'Y', 'Memiliki Hutang', 'jonan', 'Barang', 'kondag', 'kondanhu', 'T', '15001'),
('L-002-004', '002-15-006', '2015-03-17', 3000000, 10, 2, 3060000, 1530000, 'Y', 'Memiliki Hutang', ' motor', 'Barang', 'sugono', 'rambeanak', 'T', '15003'),
('L-002-005', '002-15-013', '2015-03-17', 4500000, 12, 2, 4590000, 2478825, 'Y', 'Memiliki Hutang', 'bpkb motor', 'Surat', 'jono', 'margayasan srumbung anom', 'T', '15003');

--
-- Trigger `pinjam`
--
DELIMITER //
CREATE TRIGGER `set_nol` BEFORE UPDATE ON `pinjam`
 FOR EACH ROW begin
if NEW.sisa <10 then
set NEW.sisa = 0;
else 
set New.sisa= New.sisa;
END IF; 
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `simpanan`
--

CREATE TABLE IF NOT EXISTS `simpanan` (
  `no_simpanan` char(12) NOT NULL,
  `no_rek` char(12) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenis` enum('S','P') NOT NULL,
  `kode` enum('D','K') NOT NULL,
  `nominal` int(11) NOT NULL,
  `petugas` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `simpanan`
--

INSERT INTO `simpanan` (`no_simpanan`, `no_rek`, `tanggal`, `jenis`, `kode`, `nominal`, `petugas`) VALUES
('', '001-15-021', '2015-05-21 00:27:21', 'S', 'D', 0, '15001'),
('T-001-001', '001-15-002', '2015-03-12 09:21:25', 'S', 'D', 200000, '15001'),
('T-001-002', '001-15-002', '2015-03-12 09:21:25', 'P', 'D', 5000, '15001'),
('T-001-003', '001-15-002', '2015-03-12 09:47:54', 'S', 'D', 909000, '15001'),
('T-001-004', '001-15-003', '2015-03-12 10:10:01', 'S', 'D', 1000, '15001'),
('T-001-005', '001-15-003', '2015-03-12 10:10:01', 'P', 'D', 5000, '15001'),
('T-001-006', '001-15-002', '2015-03-14 09:28:16', 'S', 'D', 2000000, '15001'),
('T-001-007', '001-13-001', '2015-03-14 09:44:02', 'P', 'D', 100000, '15001'),
('T-001-008', '001-13-001', '2015-03-14 09:44:35', 'S', 'D', 120000, '15001'),
('T-001-009', '001-15-004', '2015-03-14 10:22:50', 'S', 'D', 10000, '15001'),
('T-001-010', '001-15-004', '2015-03-14 10:22:50', 'P', 'D', 5000, '15001'),
('T-001-011', '001-15-003', '2015-03-16 16:14:17', 'S', 'D', 300000, '15001'),
('T-001-020', '001-15-009', '2015-03-16 20:08:19', 'S', 'D', 100000, '15001'),
('T-001-021', '001-15-009', '2015-03-16 20:08:19', 'P', 'D', 5000, '15001'),
('T-001-022', '001-15-010', '2015-03-16 20:13:17', 'S', 'D', 100000, '15001'),
('T-001-023', '001-15-010', '2015-03-16 20:13:17', 'P', 'D', 5000, '15001'),
('T-001-024', '001-15-011', '2015-03-16 20:18:28', 'S', 'D', 100000, '15001'),
('T-001-025', '001-15-011', '2015-03-16 20:18:28', 'P', 'D', 5000, '15001'),
('T-001-026', '002-15-005', '2015-03-16 20:43:36', 'S', 'D', 90000000, '15001'),
('T-001-027', '002-15-005', '2015-03-16 20:45:38', 'S', 'K', 8000000, '15001'),
('T-001-031', '002-15-012', '2015-03-17 14:09:28', 'S', 'D', 40000000, '15001'),
('T-001-034', '001-15-002', '2015-04-07 04:26:41', 'P', 'D', 5000, '15001'),
('T-001-035', '002-15-005', '2015-04-07 06:03:50', 'P', 'D', 5000, '15001'),
('T-001-036', '002-15-005', '2015-04-07 06:06:33', 'S', 'K', 2500000, '15001'),
('T-001-037', '001-15-014', '2015-04-08 08:24:25', 'S', 'D', 10000, '15001'),
('T-001-038', '001-15-014', '2015-04-08 08:24:25', 'P', 'D', 5000, '15001'),
('T-001-039', '002-15-005', '2015-04-09 19:49:14', 'S', 'K', 1200000, '15001'),
('T-001-040', '001-15-003', '2015-04-10 13:44:32', 'P', 'D', 5000, '15001'),
('T-001-041', '001-15-003', '2015-04-10 13:45:13', 'S', 'K', 331000, '15001'),
('T-001-042', '001-15-004', '2015-04-10 13:46:36', 'P', 'D', 5000, '15001'),
('T-001-043', '001-15-010', '2015-04-10 13:47:33', 'P', 'D', 10000, '15001'),
('T-001-045', '001-15-021', '2015-05-21 00:27:21', 'P', 'D', 0, '15001'),
('T-001-046', '001-15-002', '2015-05-25 11:12:52', 'P', 'D', 10000, '15001'),
('T-001-047', '001-13-001', '2015-05-25 11:13:30', 'P', 'D', 10000, '15001'),
('T-001-048', '001-13-001', '2015-05-25 11:13:50', 'S', 'D', 123000, '15001'),
('T-001-049', '002-15-005', '2015-05-25 11:19:09', 'P', 'D', 10000, '15001'),
('T-001-050', '001-15-004', '2015-05-25 11:22:44', 'P', 'D', 10000, '15001'),
('T-001-052', '002-15-025', '2015-05-25 13:49:18', 'P', 'D', 100000, '15001'),
('T-001-053', '001-15-015', '2015-05-25 15:52:58', 'P', 'D', 100000, '15001'),
('T-001-054', '001-15-023', '2015-05-25 16:14:12', 'P', 'D', 5000, '15001'),
('T-001-055', '001-15-017', '2015-05-25 16:31:43', 'P', 'D', 5000, '15001'),
('T-002-012', '002-15-005', '2015-03-16 19:21:31', 'S', 'D', 10000, '15002'),
('T-002-013', '002-15-005', '2015-03-16 19:21:31', 'P', 'D', 5000, '15002'),
('T-002-014', '002-15-006', '2015-03-16 19:37:35', 'S', 'D', 100000, '15002'),
('T-002-015', '002-15-006', '2015-03-16 19:37:35', 'P', 'D', 5000, '15002'),
('T-002-016', '002-15-007', '2015-03-16 19:53:24', 'S', 'D', 100000, '15002'),
('T-002-017', '002-15-007', '2015-03-16 19:53:24', 'P', 'D', 5000, '15002'),
('T-002-028', '001-15-003', '2015-03-17 11:01:48', 'S', 'D', 30000, '15002'),
('T-002-029', '002-15-012', '2015-03-17 14:08:22', 'S', 'D', 100000, '15002'),
('T-002-030', '002-15-012', '2015-03-17 14:08:22', 'P', 'D', 5000, '15002'),
('T-002-032', '002-15-013', '2015-03-17 14:32:21', 'S', 'D', 100000, '15003'),
('T-002-033', '002-15-013', '2015-03-17 14:32:21', 'P', 'D', 5000, '15003'),
('T-002-051', '001-15-021', '2015-05-25 11:30:44', 'S', 'D', 100000, '15002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_master`
--

CREATE TABLE IF NOT EXISTS `tabel_master` (
  `kode_rekening` varchar(10) NOT NULL DEFAULT '',
  `nama_rekening` varchar(100) NOT NULL,
  `tanggal_awal` varchar(12) NOT NULL,
  `awal_debet` int(15) NOT NULL,
  `awal_kredit` int(15) NOT NULL,
  `mut_debet` int(15) NOT NULL,
  `mut_kredit` int(15) NOT NULL,
  `sisa_debet` int(15) NOT NULL,
  `sisa_kredit` int(15) NOT NULL,
  `rl_debet` int(15) NOT NULL,
  `rl_kredit` int(15) NOT NULL,
  `nrc_debet` int(15) NOT NULL,
  `nrc_kredit` int(15) NOT NULL,
  `posisi` varchar(15) NOT NULL,
  `normal` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tabel_master`
--

INSERT INTO `tabel_master` (`kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal`) VALUES
('111.01', 'Kas Unit Umum', '02/12/2014', 20000000, 0, 0, 2000000, 18000000, 0, 0, 0, 18000000, 0, 'neraca', 'debet'),
('112.01', 'Giro pada Bank', '02/12/2014', 20000000, 0, 0, 0, 20000000, 0, 0, 0, 20000000, 0, 'neraca', 'debet'),
('113.01', 'Tabungan pada Bank', '02/12/2014', 3000000, 0, 0, 0, 3000000, 0, 0, 0, 3000000, 0, 'neraca', 'debet'),
('114.01', 'Deposito pada Bank', '02/12/2014', 4000000, 0, 0, 0, 4000000, 0, 0, 0, 4000000, 0, 'neraca', 'debet'),
('115.01', 'Tabungan pada Koperasi', '02/12/2014', 100000, 0, 0, 0, 100000, 0, 0, 0, 100000, 0, 'neraca', 'debet'),
('116.01', 'Simpanan Berjangka pada Koperasi', '02/12/2014', 30000000, 0, 0, 0, 30000000, 0, 0, 0, 30000000, 0, 'neraca', 'debet'),
('132.01', 'Piutang Pinjaman', '02/12/2014', 12500000, 0, 0, 0, 12500000, 0, 0, 0, 12500000, 0, 'neraca', 'debet'),
('133.01', 'Piutang Lain-lain', '02/12/2014', 3000000, 0, 0, 0, 3000000, 0, 0, 0, 3000000, 0, 'neraca', 'debet'),
('134.01', 'Penyisihan Piutang tak Tertagih', '02/12/2014', 75000000, 0, 0, 0, 75000000, 0, 0, 0, 75000000, 0, 'neraca', 'debet'),
('135.01', 'Aktiva Tetap dan Inventaris', '02/12/2014', 5000000, 0, 0, 0, 5000000, 0, 0, 0, 5000000, 0, 'neraca', 'debet'),
('136.01', 'Akumulasi Penyusutan ATI -/-', '02/12/2014', 5000000, 0, 0, 0, 5000000, 0, 0, 0, 5000000, 0, 'neraca', 'debet'),
('137.01', 'Investasi', '02/12/2014', 2000000, 0, 0, 0, 2000000, 0, 0, 0, 2000000, 0, 'neraca', 'debet'),
('138.01', 'Biaya Dibayar Dimuka', '02/12/2014', 3020000, 0, 0, 0, 3020000, 0, 0, 0, 3020000, 0, 'neraca', 'debet'),
('139.01', 'Aktiva Lain-lain', '02/12/2014', 3000000, 0, 0, 0, 3000000, 0, 0, 0, 3000000, 0, 'neraca', 'debet'),
('113.02', 'Tabungan Bank BRI', '05/02/2015', 12000000, 0, 0, 0, 12000000, 0, 0, 0, 12000000, 0, 'neraca', 'debet'),
('113.03', 'Tabungan Pada Bank BNI', '05/02/2015', 120000, 0, 0, 0, 120000, 0, 0, 0, 120000, 0, 'neraca', 'debet'),
('113.04', 'Tabungan Bank CIMB', '05/02/2015', 2300000, 0, 0, 0, 2300000, 0, 0, 0, 2300000, 0, 'neraca', 'debet'),
('114.02', 'Deposito Pada Bank BNI', '05/02/2015', 3000000, 0, 0, 0, 3000000, 0, 0, 0, 3000000, 0, 'neraca', 'debet'),
('114.03', 'Deposito Pada Bank BRI', '07/02/2015', 1200000, 0, 0, 0, 1200000, 0, 0, 0, 1200000, 0, 'neraca', 'debet'),
('114.04', 'Deposito Pada Bank Artha Sambara', '07/02/2015', 1200000, 0, 0, 0, 1200000, 0, 0, 0, 1200000, 0, 'neraca', 'debet'),
('114.05', 'Deposito Pada Bank Artha Buana', '07/02/2015', 12002000, 0, 0, 0, 12002000, 0, 0, 0, 12002000, 0, 'neraca', 'debet'),
('115.02', 'Tabungan Mana Suka', '07/02/2015', 1500000, 0, 0, 0, 1500000, 0, 0, 0, 1500000, 0, 'neraca', 'debet'),
('116.02', 'Simpanan Berjangka', '11/02/2015', 120000, 0, 0, 0, 120000, 0, 0, 0, 120000, 0, 'neraca', 'debet'),
('115.03', 'Artha Manunggal', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet'),
('135.02', 'Tanah', '12/02/2015', 1000000, 0, 0, 0, 1000000, 0, 0, 0, 1000000, 0, 'neraca', 'debet'),
('135.03', 'Bangunan', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet'),
('136.02', 'Ak Penyusutan Bangunan', '12/02/2015', 90000, 0, 0, 0, 90000, 0, 0, 0, 90000, 0, 'neraca', 'debet'),
('136.03', 'Ak Penyusutan Inventaris', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet'),
('137.02', 'Kios', '12/02/2015', 300000, 0, 0, 0, 300000, 0, 0, 0, 300000, 0, 'neraca', 'debet'),
('137.03', 'Olah Raga', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet'),
('137.04', 'Pulsa', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet'),
('137.05', 'Pakaian', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet'),
('139.02', 'Vario', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet'),
('139.03', 'Pajak', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet'),
('139.04', 'Materai', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'debet'),
('139.05', 'Listrik', '12/02/2015', 90000, 0, 0, 0, 90000, 0, 0, 0, 90000, 0, 'neraca', 'debet'),
('139.06', 'Angsuran', '12/02/2015', 120000, 0, 0, 0, 120000, 0, 0, 0, 120000, 0, 'neraca', 'debet'),
('139.07', 'Administrasi Pinjaman', '12/02/2015', 0, 0, 2000000, 0, 2000000, 0, 0, 0, 2000000, 0, 'neraca', 'debet'),
('211.01', 'Kewajiban Segera', '02/12/2014', 0, 1032000, 0, 0, 0, 1032000, 0, 0, 0, 1032000, 'neraca', 'kredit'),
('212.01', 'Simpanan', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'kredit'),
('213.01', 'Biaya Yang Masih Harus Dibayar', '02/12/2014', 0, 10000000, 0, 0, 0, 10000000, 0, 0, 0, 10000000, 'neraca', 'kredit'),
('214.01', 'Pasiva Lain-lain', '02/12/2014', 0, 10000000, 0, 0, 0, 10000000, 0, 0, 0, 10000000, 'neraca', 'kredit'),
('215.01', 'Pinjaman yang Diterima', '02/12/2014', 0, 50000000, 0, 0, 0, 50000000, 0, 0, 0, 50000000, 'neraca', 'kredit'),
('216.01', 'Kekayaan Bersih', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'kredit'),
('212.02', 'Simpanan Manasuka', '11/02/2015', 0, 19820000, 0, 0, 0, 19820000, 0, 0, 0, 19820000, 'neraca', 'kredit'),
('212.03', 'Simpanan Berjangka', '11/02/2015', 0, 30000000, 0, 0, 0, 30000000, 0, 0, 0, 30000000, 'neraca', 'kredit'),
('216.02', 'Simpanan Pokok', '11/02/2015', 0, 20000000, 0, 0, 0, 20000000, 0, 0, 0, 20000000, 'neraca', 'kredit'),
('216.03', 'Simpanan Wajib', '11/02/2015', 0, 30000000, 0, 0, 0, 30000000, 0, 0, 0, 30000000, 'neraca', 'kredit'),
('216.04', 'Donasi', '11/02/2015', 0, 30350000, 0, 0, 0, 30350000, 0, 0, 0, 30350000, 'neraca', 'kredit'),
('216.05', 'Modal Penyertaan', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'kredit'),
('216.06', 'Cadangan Umum', '11/02/2015', 0, 9000000, 0, 0, 0, 9000000, 0, 0, 0, 9000000, 'neraca', 'kredit'),
('216.07', 'Cadangan Tujuan', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'kredit'),
('216.08', 'Cadang Resiko Kredit', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'kredit'),
('216.09', 'SHU Belum Dibagi', '11/02/2015', 0, 8100000, 0, 0, 0, 8100000, 0, 0, 0, 8100000, 'neraca', 'kredit'),
('216.10', 'SHU Tahun Lalu', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'kredit'),
('214.02', 'THR', '12/02/2015', 0, 0, 1200000, 0, 1200000, 0, 0, 0, 1200000, 0, 'neraca', 'kredit'),
('214.03', 'Seragam', '12/02/2015', 0, 90000, 0, 0, 0, 90000, 0, 0, 0, 90000, 'neraca', 'kredit'),
('214.04', 'Asuransi', '12/02/2015', 0, 900000, 0, 0, 0, 900000, 0, 0, 0, 900000, 'neraca', 'kredit'),
('214.05', 'Rekreasi', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'neraca', 'kredit'),
('214.06', 'Bonus Prestasi', '12/02/2015', 0, 200000, 0, 0, 0, 200000, 0, 0, 0, 200000, 'neraca', 'kredit'),
('214.07', 'Dana Kesejahteraan', '12/02/2015', 0, 10000, 0, 0, 0, 10000, 0, 0, 0, 10000, 'neraca', 'kredit'),
('214.08', 'Dana Pendidikan', '12/02/2015', 0, 90000, 0, 0, 0, 90000, 0, 0, 0, 90000, 'neraca', 'kredit'),
('214.09', 'Dana RAT', '12/02/2015', 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 30000, 'neraca', 'kredit'),
('214.10', 'Dana Sosial', '12/02/2015', 0, 10000, 0, 0, 0, 10000, 0, 0, 0, 10000, 'neraca', 'kredit'),
('214.11', 'RRP Lainnya', '12/02/2015', 0, 10000, 0, 0, 0, 10000, 0, 0, 0, 10000, 'neraca', 'kredit'),
('215.02', 'BNI 46', '12/02/2015', 0, 900000, 0, 0, 0, 900000, 0, 0, 0, 900000, 'neraca', 'kredit'),
('215.03', 'Dana Rakyat Sentosa 1', '12/02/2015', 0, 120000, 0, 0, 0, 120000, 0, 0, 0, 120000, 'neraca', 'kredit'),
('311.01', 'Pendapatan Pinjaman', '02/12/2014', 0, 0, 0, 12005000, 0, 12005000, 0, 12005000, 0, 0, 'rugi-laba', 'kredit'),
('312.01', 'Pendapatan dari Bank', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('313.02', 'Pendapatan dari Koperasi', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('314.01', 'Pendapatan Lain-lain', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('311.02', 'Pendapatan Jasa Pinjaman', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('311.03', 'Pendapatan Provisi', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('311.04', 'Pendapatan Administrasi', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('312.02', 'Pendapatan Bunga Tabungan', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('312.03', 'Pendapatan Bunga Deposito', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('312.04', 'Pendapatan Giro', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('313.03', 'Pendapatan Bunga Simpanan', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('313.04', 'Pendapatan Bunga Simpanan Berjangka', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('314.02', 'Pendapatan Investasi', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('314.03', 'Pendapatan Operasional Lainnya', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('314.04', 'Pendapatan Lelang Barang', '12/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('411.01', 'Beban Bunga Simpanan', '02/12/2014', 0, 0, 125000, 0, 125000, 0, 125000, 0, 0, 0, 'rugi-laba', 'kredit'),
('412.01', 'Beban Bunga Pinjaman', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('413.01', 'Beban Provisi Pinjaman', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('414.01', 'Beban Administrasi Pinjaman', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('415.01', 'Beban Tenaga Kerja', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('416.01', 'Beban Asuransi', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('417.01', 'Beban Sewa', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('418.01', 'Pemeliharaan & Perbaikan', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('419.01', 'Beban Penghapusan Pinjaman', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('420.01', 'Beban Penyusutan ATI', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('421.01', 'Beban Barang & Jasa', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('422.01', 'Beban Organisasi', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('423.01', 'Beban Operasional Lainnya', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('511.01', 'Pendapatan Sewa', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('512.01', 'Pend Non Operasional ', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('611.01', 'Beban Atas Penyertaan', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('612.01', 'Rugi Penjualan Aktiva Tetap', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('613.01', 'Beban Non Operasional Lainnya', '02/12/2014', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('418.02', 'Perbaikan Fasilitas', '07/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('418.03', 'Ganti Inventaris', '07/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('418.04', 'Inventaris ', '07/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('418.05', 'Biaya Perbaikan', '07/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'kredit'),
('411.02', 'Beban Bunga Simpanan Berjangka', '11/02/2015', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'rugi-laba', 'debet'),
('', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_transaksi`
--

CREATE TABLE IF NOT EXISTS `tabel_transaksi` (
`id_transaksi` int(15) NOT NULL,
  `kode_transaksi` varchar(15) NOT NULL,
  `kode_rekening` varchar(10) NOT NULL,
  `tanggal_transaksi` varchar(12) NOT NULL,
  `jenis_transaksi` varchar(15) NOT NULL,
  `keterangan_transaksi` text NOT NULL,
  `debet` int(15) NOT NULL,
  `kredit` int(15) NOT NULL,
  `tanggal_posting` varchar(12) NOT NULL,
  `keterangan_posting` varchar(10) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=168 ;

--
-- Dumping data untuk tabel `tabel_transaksi`
--

INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `id_user`) VALUES
(161, 'BU/2', '311.01', '09/03/2015', 'Bukti Umum', 'Bunga Bank', 0, 12005000, '09/03/2015', 'Post', 0),
(160, 'KK/3', '111.01', '09/03/2015', 'Kas Keluar', 'Administrasi Pinjaman', 0, 2000000, '09/03/2015', 'Post', 0),
(159, 'KK/3', '139.07', '09/03/2015', 'Kas Keluar', 'Admistransi Pinjaman Nasabah', 2000000, 0, '09/03/2015', 'Post', 0),
(163, 'BU/3', '411.01', '09/03/2015', 'Bukti Umum', 'Beban Administrasi', 125000, 0, '09/03/2015', 'Post', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(400) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `username`, `password`, `status`) VALUES
(1, 'administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(15, 'prasetyo eko kuntarto', 'eko', 'e5ea9b6d71086dfef3a15f726abcc5bf', 1),
(16, 'sanijo', 'sanijo', '26197cf4a67c1c0fecb0de58b9cca083', 0),
(17, 'rekian fajar dewandaru', 'ian', 'a71a448d3d8474653e831749b8e71fcc', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angsur`
--
ALTER TABLE `angsur`
 ADD PRIMARY KEY (`no_angsur`), ADD KEY `no_pnjm` (`no_pnjm`), ADD KEY `petugas` (`petugas`);

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
 ADD PRIMARY KEY (`no_cab`);

--
-- Indexes for table `jurnal_umum`
--
ALTER TABLE `jurnal_umum`
 ADD PRIMARY KEY (`nomor_jurnal`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
 ADD PRIMARY KEY (`no_rekening`), ADD KEY `cabang` (`cabang`), ADD KEY `petugas` (`petugas`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
 ADD PRIMARY KEY (`nip`), ADD KEY `cab` (`cab`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
 ADD PRIMARY KEY (`no_pinjam`), ADD KEY `no_rek` (`no_rek`), ADD KEY `petugas` (`petugas`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
 ADD PRIMARY KEY (`no_simpanan`), ADD KEY `no_rek` (`no_rek`,`petugas`), ADD KEY `petugas` (`petugas`);

--
-- Indexes for table `tabel_master`
--
ALTER TABLE `tabel_master`
 ADD PRIMARY KEY (`kode_rekening`);

--
-- Indexes for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
 ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
MODIFY `id_transaksi` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=168;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `angsur`
--
ALTER TABLE `angsur`
ADD CONSTRAINT `angsur_ibfk_1` FOREIGN KEY (`no_pnjm`) REFERENCES `pinjam` (`no_pinjam`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `angsur_ibfk_3` FOREIGN KEY (`petugas`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nasabah`
--
ALTER TABLE `nasabah`
ADD CONSTRAINT `nasabah_ibfk_1` FOREIGN KEY (`cabang`) REFERENCES `cabang` (`no_cab`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `nasabah_ibfk_3` FOREIGN KEY (`petugas`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `petugas`
--
ALTER TABLE `petugas`
ADD CONSTRAINT `petugas_ibfk_1` FOREIGN KEY (`cab`) REFERENCES `cabang` (`no_cab`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`no_rek`) REFERENCES `nasabah` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `pinjam_ibfk_2` FOREIGN KEY (`petugas`) REFERENCES `petugas` (`nip`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `simpanan`
--
ALTER TABLE `simpanan`
ADD CONSTRAINT `simpanan_ibfk_1` FOREIGN KEY (`no_rek`) REFERENCES `nasabah` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `simpanan_ibfk_2` FOREIGN KEY (`petugas`) REFERENCES `petugas` (`nip`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
