-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jul 2023 pada 04.56
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u0453371_surat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_berkas`
--

CREATE TABLE `sip_berkas` (
  `kodeBerkas` int(11) NOT NULL,
  `kodeSie` int(11) NOT NULL,
  `namaBerkas` varchar(50) NOT NULL,
  `noBerkas` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_berkas`
--

INSERT INTO `sip_berkas` (`kodeBerkas`, `kodeSie`, `namaBerkas`, `noBerkas`) VALUES
(10, 9, 'Pajak Daerah', '973.1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_bidang`
--

CREATE TABLE `sip_bidang` (
  `kodeBidang` int(11) NOT NULL,
  `namaBidang` varchar(50) NOT NULL,
  `kodesurat` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_bidang`
--

INSERT INTO `sip_bidang` (`kodeBidang`, `namaBidang`, `kodesurat`) VALUES
(1, 'Ketua', '0.10'),
(2, 'Kesekretariatan', '0.11'),
(3, 'Sekertaris', '0.12'),
(16, 'Program Studi Sistem Informasi', '0101'),
(18, 'Program Studi Sistem Informasi Akuntansi', '0103'),
(23, 'Program Studi Teknik Informatika', '0102'),
(19, 'BAAK', '0104'),
(21, 'SDM & RT', '0202'),
(22, 'Waka II Bidang Keuangan & Sumber Daya', '02'),
(24, 'PPTI', '0105'),
(25, 'Perpustakaan', '0106'),
(26, 'Waka I Bidang Akademik', '01'),
(27, 'Keuangan,Akunting & Pengadaan', '0201'),
(28, 'Unit Pelaksanaan Teknis (UPT)', '0203'),
(29, 'Waka III Bidang Kemahasiswaan, Pusat Karir ', '03'),
(30, 'Kemahasiswaan', '0301'),
(31, 'Pusat Karir & Alumni', '0302'),
(32, 'KUIK', '0303'),
(33, 'Ka.Pusat Inovasi', '04'),
(34, 'LPPM', '0401'),
(35, 'Inkubator Bisnis', '0402'),
(36, 'Sentra HKI & Komersialisasi', '0403'),
(37, 'Pusat Penjaminan Mutu', '05'),
(38, 'Ka.Marketing & Humas', '06'),
(39, 'Marketing', '0601'),
(40, 'Humas', '0602');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_box`
--

CREATE TABLE `sip_box` (
  `kodeBox` int(11) NOT NULL,
  `namaBox` varchar(50) NOT NULL,
  `jmlMaksimal` int(11) NOT NULL,
  `sisa` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_box`
--

INSERT INTO `sip_box` (`kodeBox`, `namaBox`, `jmlMaksimal`, `sisa`) VALUES
(4, 'Box 2', 3, 3),
(3, 'Box 1', 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_dataarsip`
--

CREATE TABLE `sip_dataarsip` (
  `kodeArsip` int(11) NOT NULL,
  `no` int(11) DEFAULT NULL,
  `instansi` int(11) NOT NULL,
  `kode` varchar(11) DEFAULT NULL,
  `jenisBerkas` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `klasifikasi` varchar(50) NOT NULL,
  `uraian` varchar(150) NOT NULL,
  `indexes` varchar(50) NOT NULL,
  `kodeRak` int(11) NOT NULL,
  `kodeBox` int(11) NOT NULL,
  `sampul` varchar(50) NOT NULL,
  `userInput` char(18) NOT NULL,
  `tglInput` date NOT NULL,
  `subberkas` int(11) DEFAULT NULL,
  `kodejenisarsip` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_disposisisurat`
--

CREATE TABLE `sip_disposisisurat` (
  `kodeDisposisi` int(11) NOT NULL,
  `noSurat` varchar(50) NOT NULL,
  `kodeBidang` int(11) NOT NULL,
  `kodeBidang_2` int(11) NOT NULL,
  `kodeBidang_3` int(11) NOT NULL,
  `pengirim` int(11) NOT NULL,
  `tglInput` date NOT NULL,
  `userPengirim` char(18) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tglStatus` date NOT NULL,
  `fileDisposisi` longtext NOT NULL,
  `tglInputFile` date NOT NULL,
  `userInputFile` char(18) NOT NULL,
  `isiInstruksi` longtext NOT NULL,
  `abaikanSurat` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_disposisisurat`
--

INSERT INTO `sip_disposisisurat` (`kodeDisposisi`, `noSurat`, `kodeBidang`, `kodeBidang_2`, `kodeBidang_3`, `pengirim`, `tglInput`, `userPengirim`, `status`, `tglStatus`, `fileDisposisi`, `tglInputFile`, `userInputFile`, `isiInstruksi`, `abaikanSurat`) VALUES
(124, 'BI.31.420/76560/DIKPORA', 16, 18, 23, 1, '2021-09-21', '1', '1', '2021-09-21', '', '2021-09-21', '', 'Rekan2 Kaprodi tolong koordinas untuk merekomendasikan tindaklanjut terhadap surat ini. Juga terkait dengan SKB 3 menteri.', 0),
(121, 'tes', 21, 0, 0, 1, '2021-09-21', '1', '0', '2021-09-21', '', '2021-09-21', '', 'TES', 0),
(122, 'tes', 22, 21, 24, 1, '2021-09-21', '1', '0', '2021-09-21', '', '2021-09-21', '', 'TES 2', 0),
(123, '029/MK.01/GP-331/IX/2021', 29, 0, 0, 1, '2021-09-21', '1', '1', '2021-09-21', '', '2021-09-21', '', 'Mohon difollowup dan dicarikan mahasiswa yang tertarik magang di Telkomsel', 0),
(119, '3936/E3/OT.00.00/2021', 2, 0, 0, 1, '2021-09-15', '1', '1', '2021-09-15', '', '2021-09-15', '', 'Ditindak lanjuti dan di koordinasikan dengan pak Helmy', 0),
(120, '2375/LL8/KL/2021', 37, 0, 0, 1, '2021-09-15', '1', '1', '2021-09-15', '', '2021-09-15', '', 'Mohon diikuti.', 0),
(125, '0', 16, 18, 23, 1, '2021-09-21', '1', '1', '2021-09-21', '', '2021-09-21', '', 'Pelangkap dari Surat Edaran Gubernur', 0),
(126, '5437/E2/DM.00.01/2021', 26, 0, 0, 1, '2021-09-21', '1', '1', '2021-09-21', '', '2021-09-21', '', 'Dikoordinasikan agar diikuti oleh pengampu MKWU', 0),
(127, '002', 33, 0, 0, 1, '2021-09-23', '1', '1', '2021-09-23', '', '2021-09-23', '', 'Hadiri dan sertakan Ka Inbis', 0),
(128, '003', 22, 0, 0, 1, '2021-09-23', '1', '1', '2021-09-23', '', '2021-09-23', '', 'Pelajari dan berikan rekomendasi apakah kerjasama ini diterima, dinegosiasi, atau ditolak.', 0),
(129, '001', 29, 0, 0, 1, '2021-09-23', '1', '1', '2021-09-23', '', '2021-09-23', '', 'Kesempatan magang, dikomunikasikan ke mahasiswa yang membutuhkan. Terima kasih', 0),
(130, '1634/UN48.16/LT/2021', 33, 0, 0, 1, '2021-09-27', '1', '1', '2021-09-27', '', '2021-09-27', '', 'Dikoordinasikan dengan LPPM untuk diikuti', 0),
(131, '2406/LL8/PR/2021', 37, 0, 0, 1, '2021-09-27', '1', '1', '2021-09-27', '', '2021-09-27', '', 'Mohon dipelajari dan dikoordinasikan untuk dapat diisi.', 0),
(132, '011/UKM.PROGRESS/BEM.ITBSTIKOM/IX/2021', 29, 0, 0, 1, '2021-09-27', '1', '1', '2021-09-27', '', '2021-09-27', '', 'Mohon dapat dikoordinasikan dengan pembina masing-masing agar Mahasiswa dapat ikut lomba pada bidang programming (hackathon, web design) dan capture the flag. Bila diperlukan bisa dibuat tahap persiapannya.', 0),
(133, '005/634/KS', 29, 0, 0, 1, '2021-10-04', '1', '1', '2021-10-04', '', '2021-10-04', '', 'Mohon dikoordinasikan agar ada setidaknya 10 mahasiswa (UKM Multimedia) yang bisa mengikuti acara ini. Tks', 0),
(134, '405/APTISI WILL. VII/09/2021', 29, 33, 0, 1, '2021-10-04', '1', '1', '2021-10-04', '', '2021-10-04', '', 'Mohon didorong keikutsertaan mahasiswa dalam lomba nasinal ini:\r\n- Pusinov : Lomba Ide Bisnis dan Aplikasi Mobile/Web\r\n- Waka III : Lomba selain Ide Bisnis.', 0),
(135, '005', 29, 0, 0, 1, '2021-10-04', '1', '1', '2021-10-04', '', '2021-10-04', '', 'Diinformasikan kepada alumni.', 0),
(136, '2627/L8/KL/2021', 26, 0, 0, 1, '2021-10-11', '1', '1', '2021-10-11', '', '2021-10-11', '', 'Pak Helmy dan Saya nanti mewakili untuk hadir. Tolong siapkan berbagai hal yang harus kita tanyakan/konfirmasi.', 0),
(137, '2632/LL8/KM/2021', 37, 0, 0, 1, '2021-10-11', '1', '1', '2021-10-11', '', '2021-10-11', '', 'Bu Cahya, tolong diikuti saja, untuk memperdalam dan bertanya hal2 yang bagi kita masih ambigu. Coba koordinasikan dengan Bu Queena apa memungkinkan dia bisa ikut. ', 0),
(138, '2653/L8/KP/2021', 22, 0, 0, 1, '2021-10-11', '1', '1', '2021-10-11', '', '2021-10-11', '', 'Buatkan program untuk dosen2 senior yang sudah harus kuliah S3. Kumpulkan dan beri persiapan.', 0),
(139, '547/E/Pan.Intergalatic/BEM FMIPA//UNESA/IX/2021', 29, 0, 0, 1, '2021-10-11', '1', '1', '2021-10-11', '', '2021-10-11', '', 'Diinformasikan kepada mahasiswa.', 0),
(140, '004', 2, 0, 0, 1, '2021-10-14', '1', '1', '2021-10-14', '', '2021-10-14', '', 'Diabaikan', 0),
(141, '006', 2, 0, 0, 1, '2021-10-14', '1', '1', '2021-10-14', '', '2021-10-14', '', 'Diabaikan', 0),
(142, '10/UNWAR/LPM/Pan.SemNas/PD-11/2021', 2, 0, 0, 1, '2021-10-14', '1', '1', '2021-10-14', '', '2021-10-14', '', 'Diabaikan', 0),
(143, '3041/PD.04/D3/2021', 2, 0, 0, 1, '2021-10-14', '1', '1', '2021-10-14', '', '2021-10-14', '', 'Diabaikan', 0),
(144, '5220/E2/PB.04.04/2021', 2, 0, 0, 1, '2021-10-14', '1', '1', '2021-10-14', '', '2021-10-14', '', 'Diabaikan', 0),
(145, '632/II.10/TVRI/2021', 33, 0, 0, 1, '2021-10-15', '1', '1', '2021-10-15', '', '2021-10-15', '', 'Mohon untuk di ikuti ', 0),
(146, '02/PPR/2021', 29, 0, 0, 1, '2021-10-19', '1', '1', '2021-10-19', '', '2021-10-19', '', 'Mohon untuk diwakili dalam acara persembahyangan di LLDIKTI 8', 0),
(147, 'B/6593/UN14/HK.07.00/2021', 26, 0, 0, 1, '2021-10-19', '1', '1', '2021-10-19', '', '2021-10-19', '', 'Mohon untuk diikuti', 0),
(148, '559/421.3/SMK-ITB/X/2021', 38, 0, 0, 1, '2021-10-25', '1', '1', '2021-10-25', '', '2021-10-25', '', 'Dikomunikasikan dan diterima.', 0),
(149, 'B.25.518/1254/PK/Diskop UKM', 33, 0, 0, 1, '2021-10-26', '1', '1', '2021-10-26', '', '2021-10-26', '', 'Ditindaklanjuti.', 0),
(150, '6233/E2/DM.00.01/2021', 26, 0, 0, 1, '2021-10-26', '1', '1', '2021-10-26', '', '2021-10-26', '', 'Koordinasikan dan komunikasikan dengan dosen pengampu yang diperluas.', 0),
(151, '009/HL.369/DI/X/2021', 0, 0, 0, 1, '2021-10-26', '1', '0', '2021-10-26', '', '2021-10-26', '', '', 1),
(152, '4039/E4/KK.01.01/2021', 21, 0, 0, 1, '2021-10-28', '1', '0', '2021-10-28', '', '2021-10-28', '', 'Mohon untuk diikuti ', 0),
(153, '005/701/Tapem', 29, 0, 0, 1, '2021-10-28', '1', '1', '2021-10-28', '', '2021-10-28', '', 'Mohon untuk diikuti ', 0),
(154, '007', 0, 0, 0, 1, '2021-11-05', '1', '0', '2021-11-05', '', '2021-11-05', '', '', 1),
(155, '074/UKM KEWIRAUSAHAAN/II-SPP/X/2021', 33, 0, 0, 1, '2021-11-05', '1', '1', '2021-11-05', '', '2021-11-05', '', 'Diikuti.', 0),
(156, '10452/E1/HM.01.00/2021', 0, 0, 0, 1, '2021-11-05', '1', '0', '2021-11-05', '', '2021-11-05', '', '', 1),
(157, 'S-771/WJP.17/2021', 26, 0, 0, 1, '2021-11-05', '1', '1', '2021-11-05', '', '2021-11-05', '', 'Koordinasikan dengan Bu Aris yang mengikuti acara sebelumnya apakah perlu di tindaklanjut apa tidak.', 0),
(158, '70/APM/X/2021', 28, 0, 0, 1, '2021-11-05', '1', '0', '2021-11-05', '', '2021-11-05', '', 'Pelajari dan kemudian direkomendasikan ke Ketua apakah kita bisa bantu event ini', 0),
(159, '001/SPN/BAAK/XI/2021', 26, 0, 0, 1, '2021-11-05', '1', '1', '2021-11-05', '', '2021-11-05', '', 'Diijinkan', 0),
(160, '017/SPN/BAAK/X/2021', 26, 0, 0, 1, '2021-11-05', '1', '1', '2021-11-05', '', '2021-11-05', '', 'Diijinkan', 0),
(161, '9206/Dirut.GG/KPT-EDU/P2K/X/2021', 38, 39, 0, 1, '2021-11-16', '1', '1', '2021-11-16', '', '2021-11-16', '', 'Mohon untuk dapat tindaklanjuti dan segera daftar di edunitas', 0),
(162, 'SP/132/BAGI-KUTA/XI/2021', 0, 0, 0, 1, '2021-11-18', '1', '0', '2021-11-18', '', '2021-11-18', '', '', 1),
(163, '6694/E2/BS.01.01/2021', 26, 0, 0, 1, '2021-11-18', '1', '1', '2021-11-18', '', '2021-11-18', '', 'Mohon untuk ditindak lanjuti ', 0),
(164, '005/1539/KS', 29, 0, 0, 1, '2021-11-25', '1', '1', '2021-11-25', '', '2021-11-25', '', 'Mohon diinfokan kepada mahasiswa untuk dapat diikuti.', 0),
(165, '3214/LL8/KM/2021', 26, 0, 0, 1, '2021-11-25', '1', '1', '2021-11-25', '', '2021-11-25', '', 'Diinfokan kepada mahasiswa belajar, progaram Merdeka Belajar : Program Bangkit : Goto Gojek Traveloka', 0),
(166, '13427/E1/DI.00.01/2021', 26, 0, 0, 1, '2021-12-06', '1', '1', '2021-12-06', '', '2021-12-06', '', 'Mohon untuk diikuti', 0),
(167, '6952/E2/BS.01.01/2021', 26, 0, 0, 1, '2021-12-06', '1', '1', '2021-12-06', '', '2021-12-06', '', 'Mohon untuk diikuti', 0),
(168, 'S-84/WPJ.17/2021', 26, 0, 0, 1, '2021-12-06', '1', '1', '2021-12-06', '', '2021-12-06', '', 'Mohon untuk dapat diikuti ', 0),
(169, '006/SPM/SMKFuqron/2021', 0, 0, 0, 1, '2021-12-06', '1', '0', '2021-12-06', '', '2021-12-06', '', '', 1),
(170, '01/S.II/BID.IX/SMAK-SY/XI/2021', 38, 0, 0, 1, '2021-12-06', '1', '1', '2021-12-06', '', '2021-12-06', '', 'Mohon untuk dikoordinasikan dan ditindak lanjuti', 0),
(171, '010/K.I/SMK.AF/XII/2021', 38, 0, 0, 1, '2021-12-08', '1', '1', '2021-12-08', '', '2021-12-08', '', 'Diterima dan ditindaklanjuti', 0),
(172, '001/XI/LPM/2021', 0, 0, 0, 1, '2021-12-09', '1', '0', '2021-12-09', '', '2021-12-09', '', '', 1),
(173, '007/ST/2021', 26, 0, 0, 1, '2021-12-09', '1', '1', '2021-12-09', '', '2021-12-09', '', 'Dosen-dosen dengan background networking diikutsertakan dalam pelatihan tersebut', 0),
(174, '008/SM/XII/2021', 22, 0, 0, 1, '2021-12-09', '1', '1', '2021-12-09', '', '2021-12-09', '', 'Diijinkan dan disiapkan. Koordinasikan dengan UPT untuk menyiapkan ruangan, TV/Proyektor, sound system yang siap dipakai dan komunikasikan ke satpam agar dapat diterima dengan baik', 0),
(175, '053/HMPS-PE/X/2021', 0, 0, 0, 1, '2021-12-10', '1', '0', '2021-12-10', '', '2021-12-10', '', '', 1),
(176, '1051/FEBP/UNHI/XII/2021', 26, 0, 0, 1, '2021-12-10', '1', '1', '2021-12-10', '', '2021-12-10', '', 'Mohon dikaji dengan baik, jika tidak merugikan, diijinkan.', 0),
(177, '228/BP/DE/XII/2021', 37, 0, 0, 1, '2021-12-16', '1', '1', '2021-12-16', '', '2021-12-16', '', 'Mohon dikoordinasikan dan ikuti ', 0),
(178, '1269.H/KOMINFO/DJAI/HM.01.01/12/2021', 29, 0, 0, 1, '2021-12-17', '1', '1', '2021-12-17', '', '2021-12-17', '', 'mohon informasikan kepada mahasiswa dan fasilitasi untuk pendaftaran. Setelahnya koordinasikan ke panitia', 0),
(179, '13676/E1/DI.04.02/2021', 26, 0, 0, 1, '2021-12-17', '1', '1', '2021-12-17', '', '2021-12-17', '', 'Mohon Ditindak lanjuti', 0),
(180, '0080/SP/AP-DPS/AKD/II/XII/2021', 2, 0, 0, 1, '2021-12-17', '1', '1', '2022-01-25', '', '2021-12-17', '', 'Di ijinkan dan ditindak lanjuti', 0),
(181, '420/6549/SMKN1/2021', 38, 34, 26, 1, '2021-12-20', '1', '1', '2021-12-20', '', '2021-12-20', '', 'Diterima. Waka 1 menjelaskan sistem perkuliahan Primakara, LPPM Pengabdian Masyarakat, Marketing agar bisa kerjasama', 0),
(182, '14726/E1/DI.04.02/2021', 26, 0, 0, 1, '2021-12-21', '1', '1', '2021-12-21', '', '2021-12-21', '', 'Mohon untu ditindak lanjuti', 0),
(183, '13751/E1/DI.04.02/2021', 26, 0, 0, 1, '2021-12-28', '1', '1', '2021-12-28', '', '2021-12-28', '', 'Mohon untuk dapat di tindak lanjuti', 0),
(184, '3654/LLB/TU/2021', 0, 0, 0, 1, '2021-12-28', '1', '0', '2021-12-28', '', '2021-12-28', '', '', 1),
(185, '3603/LL8/KP/2021', 22, 0, 0, 1, '2021-12-28', '1', '1', '2021-12-28', '', '2021-12-28', '', 'Mohon untuk dapat di tindak lanjuti', 0),
(186, '3716/LL8/PR/2021', 37, 0, 0, 1, '2021-12-29', '1', '1', '2021-12-29', '', '2021-12-29', '', 'Mohon untuk dapat ditindaklanjuti ', 0),
(187, '002/PemilihanTTD2022/SemetonTTD/XI/2021', 29, 0, 0, 1, '2021-12-29', '1', '1', '2021-12-29', '', '2021-12-29', '', 'Mohon untuk dapat ditindak lanjuti. Diinfokan kepada mahasiswa dan siapkan yang berminat untuk mengikuti', 0),
(188, '009/SM/XII/2021', 22, 0, 0, 1, '2021-12-29', '1', '1', '2021-12-29', '', '2021-12-29', '', 'Diijinkan. Komunikasikan ruang mana yang akan digunakan. Boleh tawarkan lantai 3 agar muat sampai 30 orang. Siapkan dan komunikasikan dengan para petugas, karena hari libur', 0),
(189, '185/UW-FE/PD-10/AKU/XII/2021', 0, 0, 0, 1, '2021-12-29', '1', '0', '2021-12-29', '', '2021-12-29', '', '', 1),
(190, '010/SM/XII/2021', 29, 0, 0, 1, '2021-12-29', '1', '1', '2021-12-29', '', '2021-12-29', '', 'Informasikan dan dorong keikutsertaan mahasiswa melalui UKM (fotografi/multimedia, dance, musik)', 0),
(191, 'B.1037.e-BIS/DPS/12/2021', 29, 0, 0, 1, '2021-12-29', '1', '1', '2021-12-29', '', '2021-12-29', '', 'Jajagi dan komunikasi dengan PT. PKSS untuk penyaluran lulusan', 0),
(192, '1457/SPP/SVM/XII/2021', 26, 0, 0, 1, '2022-01-05', '1', '1', '2022-01-05', '', '2022-01-05', '', 'Mohon untuk dapat diikuti', 0),
(193, '001/SM/I/2022', 22, 0, 0, 1, '2022-01-05', '1', '1', '2022-01-05', '', '2022-01-05', '', 'Diijinkan, disiapkan dan komunikasikan ke petugas mengingat hari minggu. Siapkan sound system dan proyektor.', 0),
(194, '0042/LL8/KB.01.01/2022', 26, 0, 0, 1, '2022-01-11', '1', '1', '2022-01-11', '', '2022-01-11', '', 'Mohon untuk ditelaah dan direkomendasikan', 0),
(195, '114/BEM-AS/AP-DPS/CEO/I/2022', 22, 0, 0, 1, '2022-01-11', '1', '1', '2022-01-11', '', '2022-01-11', '', 'Mohon untuk dapat di komunikasikan dan dukung sesuai dengan peralatan yang kita punya. ', 0),
(196, '2021-AG-01-003', 38, 0, 0, 1, '2022-01-17', '1', '1', '2022-01-17', '', '2022-01-17', '', 'Di ikuti', 0),
(197, '002/SMKHI/I/2022', 22, 38, 0, 1, '2022-01-18', '1', '1', '2022-01-18', '', '2022-01-18', '', 'Waka II : Diijinka dan disiapkan alat-alat yang dibutuhkan\r\nKa. Marekting : Komunikasikan dan koordinasikan dengan SMKN 2. Komunikasikan apa yang bisa di bantu lebih lanjut ', 0),
(198, '125/BEM-AS/AP-DPS/CEO/I/2022', 0, 0, 0, 1, '2022-01-18', '1', '0', '2022-01-18', '', '2022-01-18', '', '', 1),
(199, 'DES/0031/2022', 22, 0, 0, 1, '2022-01-18', '1', '1', '2022-01-18', '', '2022-01-18', '', 'Diijinkan ', 0),
(200, '04/E/PANPEL LIP/III.2/XI/2021', 0, 0, 0, 1, '2022-01-20', '1', '0', '2022-01-20', '', '2022-01-20', '', '', 1),
(201, '0106/LL8/KB.01.01/2022', 26, 0, 0, 1, '2022-01-20', '1', '1', '2022-01-20', '', '2022-01-20', '', 'Mohon untuk ditelaah dan ditindaklanjuti', 0),
(202, '003/SM/I/2022', 0, 0, 0, 1, '2022-01-27', '1', '0', '2022-01-27', '', '2022-01-27', '', '', 1),
(203, '009/03/PARAS-ICT-VII-STIKI/I/2022', 29, 0, 0, 1, '2022-01-27', '1', '1', '2022-01-27', '', '2022-01-27', '', 'Diikuti dan maksimalkan prestasi mahasiswa', 0),
(204, '421.7/30/418.27/SMK.Br.Kp/I/2022', 38, 0, 0, 1, '2022-01-27', '1', '1', '2022-01-27', '', '2022-01-27', '', 'Diterima dan disiapkan', 0),
(205, '0275/E2/BS.01.01/2022', 26, 0, 0, 1, '2022-01-27', '1', '1', '2022-01-27', '', '2022-01-27', '', 'Ditindaklanjuti', 0),
(206, '1157/PANPEL/DEBAT/FEBP-UNHI/XII/2021', 33, 35, 0, 1, '2022-01-27', '1', '1', '2022-01-27', '', '2022-01-27', '', 'Koordinasikan dengan Invbis Diikuti dan maksimalkan prestasi mahasiswa dibidang startup', 0),
(207, '1686/UND/SVM/I/2022', 26, 0, 0, 1, '2022-01-27', '1', '1', '2022-01-27', '', '2022-01-27', '', 'Diikuti', 0),
(208, 'DES/0031/2021', 22, 0, 0, 1, '2022-02-02', '1', '1', '2022-02-02', '', '2022-02-02', '', 'Mohon di koordinasikan dan putuskan apakah bisa diijinkan atau tidak', 0),
(209, '005/053/KS', 29, 32, 0, 1, '2022-02-02', '1', '1', '2022-02-02', '', '2022-02-02', '', 'Siapkan sesuai dengan agenda kalau kita diminta bicara, bisa konsultasikan dengan saya jika dirasa perlu', 0),
(210, '0167/LL8/HK.01.04/2021', 22, 0, 0, 1, '2022-02-02', '1', '1', '2022-02-02', '', '2022-02-02', '', 'Mohon diikuti', 0),
(211, 'BNIS/3.9/936', 0, 0, 0, 1, '2022-02-03', '1', '0', '2022-02-03', '', '2022-02-03', '', '', 1),
(212, '0161/LL8/AK.02.01/2022', 26, 0, 0, 1, '2022-02-03', '1', '1', '2022-02-03', '', '2022-02-03', '', 'Ditindaklanjuti ', 0),
(213, 'B/328.4/UN34/KM/2022', 33, 0, 0, 1, '2022-02-03', '1', '1', '2022-02-03', '', '2022-02-03', '', 'Dorong keikutsertaan mahasiswa ', 0),
(214, '114/SGN-OUT/LYRA/06/22', 26, 23, 0, 1, '2022-02-03', '1', '1', '2022-02-03', '', '2022-02-03', '', 'Waka I bersama Kaporid Informatika tolong Jajagi lebih lanjut perihal penawaran kerjasama ini ', 0),
(215, '007/SM/II/2022', 29, 0, 0, 1, '2022-02-07', '1', '1', '2022-02-07', '', '2022-02-07', '', 'Ditindaklanjuti', 0),
(216, '10/SM/II/2022', 29, 0, 0, 1, '2022-02-10', '1', '1', '2022-02-10', '', '2022-02-10', '', 'Pelajari dan follow up lebih jauh, kemudian tindaklanjuti jika program cocok untuk mahasiswa kita', 0),
(217, '0158/E/DI.00.01/2022', 26, 0, 0, 1, '2022-02-10', '1', '1', '2022-02-10', '', '2022-02-10', '', 'Ditindaklanjuti ', 0),
(218, '005/242/Bappeda', 33, 0, 0, 1, '2022-02-14', '1', '1', '2022-02-14', '', '2022-02-14', '', 'Tolong diwakilkan', 0),
(219, '003/SM/II/2022', 0, 0, 0, 1, '2022-02-15', '1', '0', '2022-02-15', '', '2022-02-15', '', '', 1),
(220, '010/WJC-HRD/RC/II/2022', 0, 0, 0, 1, '2022-02-15', '1', '0', '2022-02-15', '', '2022-02-15', '', '', 1),
(221, '090/PPTJ16/I/2022', 0, 0, 0, 1, '2022-02-15', '1', '0', '2022-02-15', '', '2022-02-15', '', '', 1),
(222, '0725//E1/PP.01.11/2022', 33, 0, 0, 1, '2022-02-16', '1', '1', '2022-02-16', '', '2022-02-16', '', 'Ikuti dan umumkan ke dosen', 0),
(223, '.../Pan-Pel/STW/TF/02/2022', 0, 0, 0, 1, '2022-02-25', '1', '0', '2022-02-25', '', '2022-02-25', '', '', 1),
(224, '009/BUB-LPPFI/II/2022', 0, 0, 0, 1, '2022-02-25', '1', '0', '2022-02-25', '', '2022-02-25', '', '', 1),
(225, '04/BW-KTH/II/2022', 2, 0, 0, 1, '2022-02-25', '1', '1', '2022-03-07', '', '2022-02-25', '', 'Audiensi di terima dan di sesuaikan dengan waktu lowong', 0),
(226, '009/SPN/BAAK/III/2022', 26, 0, 0, 1, '2022-03-10', '1', '1', '2022-03-10', '', '2022-03-10', '', 'Diijinkan', 0),
(227, '004/IFest/HIMAFORKA/II/2022', 29, 0, 0, 1, '2022-03-10', '1', '1', '2022-03-10', '', '2022-03-10', '', 'Mohon koordinasikan ke mahasiswa untuk dapat mengikuti event lomba ini.', 0),
(228, 'B-759/Un.10.8/D/DA.04.09/03/2022', 26, 0, 0, 1, '2022-03-14', '1', '1', '2022-03-14', '', '2022-03-14', '', 'Diterima dan disiapkan ', 0),
(229, 'SK029/III/BEDO-2022', 29, 0, 0, 1, '2022-03-17', '1', '1', '2022-03-17', '', '2022-03-17', '', 'Dikomunikasikan ke UKM IMClub mengingat kegiatannya terkait dengan digital marketing untuk produk-produk tenun.', 0),
(230, '0427/LL8/PR.00.01/2022', 37, 0, 0, 1, '2022-03-17', '1', '1', '2022-03-17', '', '2022-03-17', '', 'Mohon untuk Diikuti ', 0),
(231, '1355/E3.1/PM.00.03/2022', 26, 0, 0, 1, '2022-03-17', '1', '1', '2022-03-17', '', '2022-03-17', '', 'Diikuti ', 0),
(232, '1168/E2/KM.09.00/2022', 29, 0, 0, 1, '2022-03-22', '1', '1', '2022-03-22', '', '2022-03-22', '', 'Mohon untuk diikuti ', 0),
(233, 'AOI/10/VEN/2022', 38, 22, 0, 1, '2022-03-28', '1', '1', '2022-03-28', '', '2022-03-28', '', 'Diijinkan, dengan marketing bisa melakukan sosialisasi pada kegiatan tersebut', 0),
(234, '004/SM/2022', 29, 0, 0, 1, '2022-04-01', '1', '1', '2022-04-01', '', '2022-04-01', '', 'Diikuti ', 0),
(235, 'B.24.005/4788/IKP/D.KOMINFOS', 29, 0, 0, 1, '2022-04-01', '1', '1', '2022-04-01', '', '2022-04-01', '', 'Tugaskan perwakilan BEM untuk dapat mengikuti.', 0),
(236, '2022.AG-02-023', 29, 0, 0, 1, '2022-04-01', '1', '1', '2022-04-01', '', '2022-04-01', '', 'Tugaskan UKM Mapala, minta 2 orang mahasiswa mapala mengikuti.', 0),
(237, '038/BEM-FEB/II-SKj/III/2022', 29, 33, 0, 1, '2022-04-04', '1', '1', '2022-04-04', '', '2022-04-04', '', 'Mohon diikuti, Untuk pusinov mengikuti lomba Business Model Canvas dan Waka III lomba Digital Poster, Speech Contest dan Short Movie dan koordinasi dengan masing-masing UKM', 0),
(238, 'B.24.005/5028/SEKRET/D.KOMINFOS', 29, 0, 0, 1, '2022-04-06', '1', '1', '2022-04-06', '', '2022-04-06', '', 'Koordinasi dengan UKM untuk dapat menghadiri kegiatan Bali Digifest', 0),
(239, '005 KFB/IV/2022', 29, 0, 0, 1, '2022-04-06', '1', '1', '2022-04-06', '', '2022-04-06', '', 'Komunikasikan ke UKM Multimedia, dorong keikutsertaan mahasiswa UKM Multimedia dalam event ini.', 0),
(240, '09/UN48.22/UPT-PKKM/2022', 29, 0, 0, 1, '2022-04-11', '1', '1', '2022-04-11', '', '2022-04-11', '', 'Mohon dikaji, apa perlu diikuti atau tidak ', 0),
(241, '1775/E2/KM.12/2022', 29, 0, 0, 1, '2022-04-18', '1', '1', '2022-04-18', '', '2022-04-18', '', 'Mohon diikuti', 0),
(242, '001/SPM/I/2022', 0, 0, 0, 1, '2022-04-18', '1', '0', '2022-04-18', '', '2022-04-18', '', '', 1),
(243, '2415/SPP/SVM/III/2022', 0, 0, 0, 1, '2022-04-18', '1', '0', '2022-04-18', '', '2022-04-18', '', '', 1),
(244, '343/DJAI.5/AI.03.02/04/2022', 0, 0, 0, 1, '2022-04-18', '1', '0', '2022-04-18', '', '2022-04-18', '', '', 1),
(245, 'B.19.340/834/SDK/DISBUD', 0, 0, 0, 1, '2022-04-18', '1', '0', '2022-04-18', '', '2022-04-18', '', '', 1),
(246, '001/SPM/IV/2022', 29, 0, 0, 1, '2022-04-18', '1', '1', '2022-04-18', '', '2022-04-18', '', 'Komunikasikan dan tugaskan UKM IM Club untuk mengikuti program ini.', 0),
(247, '007/B/PPKAB-XI/III/2022', 29, 0, 0, 1, '2022-04-18', '1', '1', '2022-04-18', '', '2022-04-18', '', 'Informasikan dan siapkan mahaiswa yg berminat untuk mengikuti kompetisi ini.', 0),
(248, '011/SPN/BAAK/IV/2022', 26, 0, 0, 1, '2022-04-18', '1', '1', '2022-04-18', '', '2022-04-18', '', 'Diijinkan', 0),
(249, '015/SPN/BAAK/IV/2022', 26, 0, 0, 1, '2022-04-18', '1', '1', '2022-04-18', '', '2022-04-18', '', 'Diijinkan', 0),
(250, 'B/497/BPSDMI/BDI-Denpasar/IV/2022', 33, 0, 0, 1, '2022-04-21', '1', '1', '2022-04-21', '', '2022-04-21', '', 'Mohon untuk diikuti oleh Inbis', 0),
(251, '0697/LL8/KM.12/2022', 33, 0, 0, 1, '2022-04-26', '1', '1', '2022-04-26', '', '2022-04-26', '', 'Diikuti ', 0),
(252, '022/SPN/BAAK/IV/2022', 26, 0, 0, 1, '2022-05-09', '1', '1', '2022-05-09', '', '2022-05-09', '', 'Diijinkan', 0),
(253, '086/NTSC2022/IV/IPBI', 33, 29, 0, 1, '2022-05-09', '1', '1', '2022-05-09', '', '2022-05-09', '', 'Ka. Pusat Inovasi : Ikuti lomba Business Plan\r\nWaka III : Ikuti lomba Video Competition', 0),
(254, '035/MK.01/GP-331/IV/2022', 0, 0, 0, 1, '2022-05-09', '1', '0', '2022-05-09', '', '2022-05-09', '', '', 1),
(255, '014/IAI-JTM/KRAIX/IV/2022', 26, 0, 0, 1, '2022-05-09', '1', '1', '2022-05-09', '', '2022-05-09', '', 'Diskusikan dengan prodia SIA apa perlu diikuti atau tidak', 0),
(256, '0742/LL8/WA.01.04/2022', 29, 0, 0, 1, '2022-05-10', '1', '1', '2022-05-10', '', '2022-05-10', '', 'Ditindaklanjuti', 0),
(257, '001/SM/MEI/2022', 29, 0, 0, 1, '2022-05-10', '1', '1', '2022-05-10', '', '2022-05-10', '', 'Dijajaki dan dikomunikasikan. Kalau cocok, tindaklanjuti', 0),
(258, '017/SM/2022', 38, 0, 0, 1, '2022-05-17', '1', '1', '2022-05-17', '', '2022-05-17', '', 'Dikaji dan ditindaklanjuti', 0),
(259, '2119/E2/BS.01.01/2022', 26, 0, 0, 1, '2022-05-17', '1', '1', '2022-05-17', '', '2022-05-17', '', 'Diikuti', 0),
(260, '016/SPP/JCI-BD/OUT/V/2022', 33, 0, 0, 1, '2022-05-18', '1', '1', '2022-05-18', '', '2022-05-18', '', 'Komunikasikan ke penyelenggara, berapa kira2 mahasiswa yang berminat untuk hadir di acara tsb.', 0),
(261, '03/KKT/V.11/2022', 29, 0, 0, 1, '2022-05-18', '1', '1', '2022-05-18', '', '2022-05-18', '', 'Dikomunikasikan ke IKIP Saraswati dan ditindaklanjuti', 0),
(262, '18/SM/V/2022', 29, 0, 0, 1, '2022-05-18', '1', '1', '2022-05-18', '', '2022-05-18', '', 'Ditindaklanjuti ', 0),
(264, '03/KKT/V.11/2022', 33, 0, 0, 1, '2022-05-20', '1', '0', '2022-05-20', '', '2022-05-20', '', 'Dikomunikasikan ke IKIP Saraswati dan ditindaklanjuti ', 0),
(265, 'BAL/ADM/551/10/2019', 29, 0, 0, 1, '2022-05-20', '1', '1', '2022-05-20', '', '2022-05-20', '', 'Dikomunikasikan lebih lanjut, apakah online/offline. Apakah harus ditanggal tersebut atau bagaimana ?. Kemudian dikomunikasikan dengan Waka 1, apakah tanggal tersebut memungkinkan apa tidak ', 0),
(266, '021/B/ADS/UNAIR/IV/2022', 29, 0, 0, 1, '2022-05-20', '1', '1', '2022-05-20', '', '2022-05-20', '', 'Pembina english club mengkomunikasikan ke mahasiswa untuk mengikuti event ini', 0),
(267, '81.B/03/DPR/UKIM_Unesa/V/2022', 0, 0, 0, 1, '2022-05-20', '1', '0', '2022-05-20', '', '2022-05-20', '', '', 1),
(268, '024/SM/V/2022', 29, 0, 0, 1, '2022-05-25', '1', '1', '2022-05-25', '', '2022-05-25', '', 'Waka III - PCC Tolong dikasi apakah program ini dibutuhkan dan pelajari vendornya sebelum melakukan follow up ', 0),
(269, 'B-1097/DIR/UMS/2022', 22, 0, 0, 1, '2022-05-25', '1', '1', '2022-05-25', '', '2022-05-25', '', 'Komunikasikan, kita support yang paling kecil. Ambil budgetnya dari pembayaran proyek BPD', 0),
(270, '124/SM/V/2022', 33, 0, 0, 1, '2022-05-25', '1', '1', '2022-05-25', '', '2022-05-25', '', 'Pusinov-Inbis : Mohon diikuti ', 0),
(271, '0704/LL8/TU.00.01/2022', 26, 0, 0, 1, '2022-05-25', '1', '1', '2022-05-25', '', '2022-05-25', '', 'Ditindaklanjuti dan ambil dokumen dari kesekretariatan', 0),
(272, 'B-PM.01.02.17A.17A4.04.22.474', 0, 0, 0, 1, '2022-05-30', '1', '0', '2022-05-30', '', '2022-05-30', '', '', 1),
(273, '10/V/DG-AP/DPS/2022', 29, 0, 0, 1, '2022-05-30', '1', '1', '2022-05-30', '', '2022-05-30', '', 'Infokan ke mahasiswa, jika ada yang berminat mengikuti lomba ini', 0),
(274, '005/319/Kec.Denut', 29, 0, 0, 1, '2022-05-30', '1', '1', '2022-05-30', '', '2022-05-30', '', 'Infokan ke mahasiswa, jika ada yang berminat mengikuti lomba ini', 0),
(275, '005/413/KS', 29, 0, 0, 1, '2022-05-30', '1', '1', '2022-05-30', '', '2022-05-30', '', 'KUIK - Mengkomunikasikan lebih lanjut ke Pemkot Denpasar dan menindaklanjuti kerjasama dengan pemerintah kota denpasar', 0),
(276, '0876/LL8/KM.12/2022', 33, 0, 0, 1, '2022-05-30', '1', '1', '2022-05-30', '', '2022-05-30', '', 'Ikuti dan persiapkan mahasiswa dengan maksimal karena berwarna kewirausahaan digital', 0),
(277, '2422/E2.1/DI.00.01/2022', 26, 0, 0, 1, '2022-05-30', '1', '1', '2022-05-30', '', '2022-05-30', '', 'Koordinasikan dengan Koordinator Magang untuk mengikuti', 0),
(278, 'E.069/HB/SP/05/2022', 0, 0, 0, 1, '2022-05-30', '1', '0', '2022-05-30', '', '2022-05-30', '', '', 1),
(279, '002/PMS/DPS/V/2022', 22, 0, 0, 1, '2022-05-30', '1', '1', '2022-05-30', '', '2022-05-30', '', 'Dididkusikan apakah akan diperlukan. Jika diperlukan follow up', 0),
(280, '2500/E2/PB.04.01/2022', 29, 0, 0, 1, '2022-05-30', '1', '1', '2022-05-30', '', '2022-05-30', '', 'Koordinasikan dengan KUIK dan tindaklanjuti untuk dapat memanfaatkan program ini.', 0),
(281, '026/Panpel-JBUNMASDPS/V/2022', 0, 0, 0, 1, '2022-05-31', '1', '0', '2022-05-31', '', '2022-05-31', '', '', 1),
(282, '001/SM/VI/2022', 29, 0, 0, 1, '2022-06-06', '1', '1', '2022-06-06', '', '2022-06-06', '', 'Koordinasi Kemahasiswaan dan KUIK untuk menginformasikan dan mendorong mahasiswa mengikuti event ini untuk menjaga hubungan baik dengan Konsulat Australia', 0),
(283, '2541/E2/PB.03.00/2022 ', 26, 0, 0, 1, '2022-06-06', '1', '1', '2022-06-06', '', '2022-06-06', '', 'Mohon untuk diikuti ', 0),
(284, '011/HIMAPRODI.SK/BEM.ITBSTIKOM/V/2022', 29, 0, 0, 1, '2022-06-06', '1', '1', '2022-06-06', '', '2022-06-06', '', 'Infokan ke mahasiswa dan fasilitasi yang berminat untuk mengikuti lomba', 0),
(285, '037/BEN/V/2022', 29, 0, 0, 1, '2022-06-06', '1', '1', '2022-06-06', '', '2022-06-06', '', 'Mohon dikomunikasikan lebih lanjut', 0),
(286, '517.1 / 916 / DISKOPUKMP', 33, 0, 0, 1, '2022-06-13', '1', '1', '2022-06-13', '', '2022-06-13', '', 'Ditindaklanjuti', 0),
(287, '013/SM/VI/2022', 33, 0, 0, 1, '2022-06-13', '1', '1', '2022-06-13', '', '2022-06-13', '', 'Ditindaklanjuti dan sedapat mungkin ada yg bisa berpartisipasi', 0),
(288, 'No. BAL/SVCC/322/5/22', 29, 0, 0, 1, '2022-06-13', '1', '1', '2022-06-13', '', '2022-06-13', '', 'KUIK  mengkomunikasikan dan mendorong keikutsertaan dosen dan mahasiswa', 0),
(289, '002/Panitia-AnalgesiaSports/VI/2022', 29, 0, 0, 1, '2022-06-20', '1', '1', '2022-06-20', '', '2022-06-20', '', 'Dikomunikasikan dengan UKM futsal apakah bisa/tidak untuk mengikuti ', 0),
(290, '002/UKM.Futsal/BEM.ITBSTIKOM/V/2022', 29, 0, 0, 1, '2022-06-20', '1', '1', '2022-06-20', '', '2022-06-20', '', 'Dikomunikasikan dengan UKM futsal apakah bisa/tidak untuk mengikuti ', 0),
(291, '10/UW/BEM-FH/PanPel-DekanCupX/VI/2022', 29, 0, 0, 1, '2022-06-20', '1', '1', '2022-06-20', '', '2022-06-20', '', 'Dikomunikasikan dengan UKM futsal apakah bisa/tidak untuk mengikuti ', 0),
(292, 'B.24.046/8890/SANDI/D.KOMINFOS', 2, 0, 0, 1, '2022-06-20', '1', '1', '2022-07-12', '', '2022-06-20', '', 'Dikomunikasikan dengan pak Krisna apakah bisa mewakili\r\n', 0),
(293, '2022-AG-04-057', 29, 0, 0, 1, '2022-06-28', '1', '1', '2022-06-28', '', '2022-06-28', '', 'Koordinasikan dengan UKM Multimedia untuk menindaklanjuti dan koordinasi juga ke UPT untuk peminjaman tempat ', 0),
(294, '002/SM/VI/2022', 29, 0, 0, 1, '2022-06-28', '1', '1', '2022-06-28', '', '2022-06-28', '', 'KUIK - Dicheck terlebih dahulu apakah sudah ada kerjasama yang serupa dengan ini ? kalo tidak salah ada kerjasama antara Primakara dan Sinar Mas perihal Kerjasama pasar modal. Apa bedanya ?  Jika sudah bisa disampaikan ke Ketua dan jika ada yang ingin di diskusikan', 0),
(295, 'B/1275/IV/LIT.6.1./2022/Polresta Denpasar', 0, 0, 0, 1, '2022-07-06', '1', '0', '2022-07-06', '', '2022-07-06', '', '', 1),
(296, '4/SM/2022', 22, 29, 0, 1, '2022-07-06', '1', '1', '2022-07-06', '', '2022-07-06', '', 'Komunikasikan ke Dosen Wanita dan Mahasiswa yang bisa mengikuti kegiatan ini', 0),
(297, '001/LH/SPK/VI/2022', 29, 0, 0, 1, '2022-07-06', '1', '1', '2022-07-06', '', '2022-07-06', '', 'dipelajari dan difollow up peluang magang untuk mahasiswa', 0),
(298, '882/PGRI2Bdg/B.15/2022', 38, 0, 0, 1, '2022-07-06', '1', '1', '2022-07-06', '', '2022-07-06', '', 'Pelajari dan tentukan support yang bisa diberikan ke SMK PGRI 2 Badung', 0),
(299, '24/667/Dpr/Srt/B', 29, 33, 0, 1, '2022-07-06', '1', '1', '2022-07-06', '', '2022-07-06', '', 'Waka III : agar menyiapkan 25 mahasiswa, dan menunjuk PIC\r\n\r\nPusinov : menyiapkan 25 mahasiswa binaan dan menunjuk PIC', 0),
(300, '002/GR/VII-Alibaba Cloud/2022', 26, 0, 0, 1, '2022-07-14', '1', '1', '2022-07-14', '', '2022-07-14', '', 'Koordinasikan dengan Kaprodi untuk ditindaklanjuti, permohonana  diterima dan siapkan kerjasama dengan Alibaba Cloud', 0),
(301, '2446/UND/SVM/V/2022', 26, 37, 0, 1, '2022-07-14', '1', '1', '2022-07-14', '', '2022-07-14', '', 'Waka I - Mohon untuk diikuti bersama dengan Kaprodi \r\nPPM - Mohon untuk diikuti ', 0),
(302, 'B/178/UN14.4.B/DL.01/2022', 22, 0, 0, 1, '2022-07-14', '1', '1', '2022-07-14', '', '2022-07-14', '', 'Melalui HRD - Mohon untuk diinformasikan kepada dosen, apakah akan ada yang mengikuti pelatihan PEKERTI. Untuk support pembiayaan sama dengan kebijakan pelatihan PEKERTI sebelumnya yang sudah dilaksanakan di Undiksa', 0),
(303, '086 /K.I/SMK.AF/VII/2022', 38, 0, 0, 1, '2022-07-19', '1', '1', '2022-07-19', '', '2022-07-19', '', 'Tentukan mau diterima atau tidak. Jika diterima, segera di followup dan dipersiapkan.\r\nUntuk setiap acara yg seperti ini, team marketing meminta peserta untuk posting di social media dan dikasih souvenir.', 0),
(304, '002/SPPG/VII/22', 22, 0, 0, 1, '2022-07-27', '1', '1', '2022-07-27', '', '2022-07-27', '', 'Diijinkan', 0),
(305, '001/SM/VII/2022', 0, 0, 0, 1, '2022-07-27', '1', '0', '2022-07-27', '', '2022-07-27', '', '', 1),
(306, '003/SK/07/2022', 0, 0, 0, 1, '2022-07-27', '1', '0', '2022-07-27', '', '2022-07-27', '', '', 1),
(307, '891/PGRI2BDG/U.6/2022', 38, 0, 0, 1, '2022-07-28', '1', '1', '2022-07-28', '', '2022-07-28', '', 'Hadiri dan kirimi karangan bunga', 0),
(308, '003/SM/VII/2022', 22, 0, 0, 1, '2022-07-28', '1', '1', '2022-07-28', '', '2022-07-28', '', 'Apakah dibutuhkan?', 0),
(309, '031/BUB-LP2SDM/VII/2022', 37, 0, 0, 1, '2022-07-28', '1', '1', '2022-07-28', '', '2022-07-28', '', 'apakah dibutuhkan? Kl iya ajukan.', 0),
(310, '003/SPPG/VII/22', 22, 33, 0, 1, '2022-08-02', '1', '1', '2022-08-02', '', '2022-08-02', '', 'Ijinkan dan beri support. BIT House adalah binaan.', 0),
(311, 'T.44.003/22355/RT/B.UMPRO', 22, 0, 0, 1, '2022-08-02', '1', '1', '2022-08-02', '', '2022-08-02', '', 'Ikuti hal2 yang bisa kita ikuti.', 0),
(312, '002/SM/VII/2022', 0, 0, 0, 1, '2022-08-04', '1', '0', '2022-08-04', '', '2022-08-04', '', '', 1),
(313, '02/KRT.KP/Non-Ops/VII.2022', 0, 0, 0, 1, '2022-08-04', '1', '0', '2022-08-04', '', '2022-08-04', '', '', 1),
(314, '05.03/SAS/VI/2022', 0, 0, 0, 1, '2022-08-04', '1', '0', '2022-08-04', '', '2022-08-04', '', '', 1),
(315, '1307/LL8/KL.02.00/2022', 0, 0, 0, 1, '2022-08-04', '1', '0', '2022-08-04', '', '2022-08-04', '', '', 1),
(316, '24/698/Dpr/Srt/B', 0, 0, 0, 1, '2022-08-04', '1', '0', '2022-08-04', '', '2022-08-04', '', '', 1),
(317, ' 0347/J7.1/PN.00/2022', 0, 0, 0, 1, '2022-08-05', '1', '0', '2022-08-05', '', '2022-08-05', '', '', 1),
(318, '127/BEM.STISPOL-WB/VIII/2022', 0, 0, 0, 1, '2022-08-05', '1', '0', '2022-08-05', '', '2022-08-05', '', '', 1),
(319, '375/II.3.AU/J/FIKOM/UMM/2022', 26, 0, 0, 1, '2022-08-09', '1', '1', '2022-08-09', '', '2022-08-09', '', 'Minta Admin prodi untuk menyiapkan dan mengkomunikasikan ke divisi-divisi terkait. MoU ditayakan ke KUIK apa diperlukan apa tidak.', 0),
(320, 'EDUFAIR/003/XII/2022', 38, 0, 0, 1, '2022-08-09', '1', '1', '2022-08-09', '', '2022-08-09', '', 'Segera daftarkan dan siapkan perangkat expo yg kompetitif/unggul seperti hasil meeting kemarin.', 0),
(321, '1690/LL8/DT.00.05/2022', 26, 0, 0, 1, '2022-08-09', '1', '1', '2022-08-09', '', '2022-08-09', '', 'Diikuti untuk dapat mengimplementasikan RPL.', 0),
(322, '4733/E2/DT.00.05/2022', 26, 0, 0, 1, '2022-08-09', '1', '1', '2022-08-09', '', '2022-08-09', '', 'Diikuti untuk dapat mengimplementasikan RPL.', 0),
(323, ' 008/PANPEL-INVENTION/HIMAKOM/V/2022', 29, 0, 0, 1, '2022-08-10', '1', '1', '2022-08-10', '', '2022-08-10', '', 'Diikuti dan daftarkan mahasiswa', 0),
(324, '004/SPPG/VIII/22', 22, 0, 0, 1, '2022-08-10', '1', '1', '2022-08-10', '', '2022-08-10', '', 'Dikaji dan dikomunikasikan ', 0),
(325, '421.3/13.094/SMAN2/VIII/2022', 38, 0, 0, 1, '2022-08-10', '1', '1', '2022-08-10', '', '2022-08-10', '', 'Segera daftarkan dan siapkan expo yang kompetitif/unggul seperti hasil meeting kemarin', 0),
(326, '1808/LL8/HM.00.08/2022', 22, 0, 0, 1, '2022-08-13', '1', '1', '2022-08-13', '', '2022-08-13', '', 'Untuk diteruskan dan diumumkan ke dosen PNS', 0),
(327, '1804/LL8/TU.02.03/2022', 29, 0, 0, 1, '2022-08-13', '1', '1', '2022-08-13', '', '2022-08-13', '', 'mahasiswa ikut dalam Upacara 17 Agustus.. Terutama BeM dan Hima', 0),
(328, '13/SM/VIII/2022', 29, 0, 0, 1, '2022-08-13', '1', '1', '2022-08-13', '', '2022-08-13', '', 'Komunikasikan ke UKM English Club untuk dapat mengirim beberapa mhs perempuan', 0),
(329, '1795/LL8/DT.00.00/2022', 26, 0, 0, 1, '2022-08-13', '1', '1', '2022-08-13', '', '2022-08-13', '', ' diikuti pengisian survey', 0),
(330, 'B.24.045/11778/IKP/D.KOMINFOS', 2, 0, 0, 1, '2022-08-13', '1', '1', '2022-08-13', '', '2022-08-13', '', 'Komunikasikan ke kominfo, apa materi lebih spesifiknya, siapa audiencenya? Daring apa luring dll.', 0),
(331, 'S-115/KR.08/2022', 0, 0, 0, 1, '2022-08-18', '1', '0', '2022-08-18', '', '2022-08-18', '', '', 1),
(332, '08.017/PL8.HMJ/PAN-PNBITC/2022', 29, 0, 0, 1, '2022-08-18', '1', '1', '2022-08-18', '', '2022-08-18', '', 'Diikuti', 0),
(333, '1819/LL8/KM.01.02/2022', 29, 0, 0, 1, '2022-08-18', '1', '1', '2022-08-18', '', '2022-08-18', '', 'Diikuti dan dipersiapkan', 0),
(334, '1842/LL8/WS.01.07/2022', 26, 0, 0, 1, '2022-08-18', '1', '1', '2022-08-18', '', '2022-08-18', '', 'Tugaskan 2 orang untuk mewakili', 0),
(335, ' 0789/E5.5/AL.04/2022', 33, 0, 0, 1, '2022-08-23', '1', '1', '2022-08-23', '', '2022-08-23', '', 'ditindaklanjuti', 0),
(336, '1744/UN48.16/PM/2022', 33, 0, 0, 1, '2022-08-23', '1', '1', '2022-08-23', '', '2022-08-23', '', 'Dipelajari dan disosialisasikan kepada dosen', 0),
(337, '1480/UN1/KM.UGM/Set.KM/PK.01.05/2022', 26, 0, 0, 1, '2022-08-23', '1', '1', '2022-08-23', '', '2022-08-23', '', 'Diikuti', 0),
(338, '1207/Wil-XI/0822', 33, 0, 0, 1, '2022-08-24', '1', '0', '2022-08-24', '', '2022-08-24', '', 'Daftarkan tenan yg relevan dg tema seperti Jiwan dll', 0),
(339, '001/SM/VIII/2022', 22, 0, 0, 1, '2022-08-25', '1', '1', '2022-08-25', '', '2022-08-25', '', 'Mohon diikuti', 0),
(340, '10843.75/K.STIKESWIKA/LL/VIII/2022', 0, 0, 0, 1, '2022-08-29', '1', '0', '2022-08-29', '', '2022-08-29', '', '', 1),
(341, 'B 958/IKMA.2/IND/VIII/2022', 33, 0, 0, 1, '2022-08-29', '1', '1', '2022-08-29', '', '2022-08-29', '', 'Diikuti', 0),
(342, '001/SU/VIII/22', 0, 0, 0, 1, '2022-08-31', '1', '0', '2022-08-31', '', '2022-08-31', '', '', 1),
(343, '1772/LL8/DT.00.00/2022', 0, 0, 0, 1, '2022-08-31', '1', '0', '2022-08-31', '', '2022-08-31', '', '', 1),
(344, ' 5391/E2/DT.01.01/2022 ', 29, 0, 0, 1, '2022-08-31', '1', '1', '2022-08-31', '', '2022-08-31', '', 'Diikuti', 0),
(345, '017/E/ICCN/VIII/2022', 29, 0, 0, 1, '2022-08-31', '1', '1', '2022-08-31', '', '2022-08-31', '', 'Agendakan PCC untuk dapat mengikuti.', 0),
(346, '1985/LL8/LP.00.01/2022', 29, 0, 0, 1, '2022-08-31', '1', '1', '2022-08-31', '', '2022-08-31', '', 'Diikuti', 0),
(347, '003/SM/VIII/2022', 38, 0, 0, 1, '2022-08-31', '1', '1', '2022-08-31', '', '2022-08-31', '', 'Diikuti, ambil saja yang presentasi dan open table', 0),
(348, '2070/LL8/KM.00/2022', 22, 0, 0, 1, '2022-09-01', '1', '1', '2022-09-01', '', '2022-09-01', '', 'Untuk diikuti dan dipelajari.', 0),
(349, '2123/LL8/HM.00.03/2022', 22, 38, 0, 1, '2022-09-02', '1', '1', '2022-09-02', '', '2022-09-02', '', 'Diikuti, Multimedia koordinasi bersama Konten Kreator ', 0),
(350, '422.1/0895/SMAN.1-DPS/Disdik Prov.Bali', 38, 0, 0, 1, '2022-09-05', '1', '1', '2022-09-05', '', '2022-09-05', '', 'Diikuti \r\n', 0),
(351, '08.018/PL8.UKM/PAN-INTECHFEST/2022', 29, 0, 0, 1, '2022-09-05', '1', '1', '2022-09-05', '', '2022-09-05', '', 'Diikuti dan dipersiapkan ', 0),
(352, '3143/JBM/IX/2022', 33, 0, 0, 1, '2022-09-07', '1', '1', '2022-09-07', '', '2022-09-07', '', 'Dikomunikasikan dan ajukan penawaran ', 0),
(353, 'B.24.005/13133/SANDI/D.KOMINFOS', 29, 0, 0, 1, '2022-09-09', '1', '1', '2022-09-09', '', '2022-09-09', '', 'Diikuti ', 0),
(354, 'B.420.003.3/1518/SMAN2.NGR/Disdikpora', 38, 0, 0, 1, '2022-09-13', '1', '1', '2022-09-13', '', '2022-09-13', '', 'Diikuti ', 0),
(355, '2406/LL8/HM.01.00/2022 ', 26, 0, 0, 1, '2022-09-13', '1', '1', '2022-09-13', '', '2022-09-13', '', 'Diikuti, dan dikirimkan tentang pertukaran pelajar dengan universitas malaysia pahang atau cerita lain yang menarik. Bisa koordinasikan dengan MBKM yang bersangkutan', 0),
(356, '064/N00100/2022-S9', 33, 0, 0, 1, '2022-09-14', '1', '0', '2022-09-14', '', '2022-09-14', '', 'Diikuti dan dipersiapkan', 0),
(357, 'YCPW/2022/09/12/ARW/01', 22, 38, 0, 1, '2022-09-14', '1', '1', '2022-09-14', '', '2022-09-14', '', 'Waka 2 : Diijinkan dan dibantu\r\nMarketing : Manfaatkan untuk sosialisasi', 0),
(358, '05/KTDB/TTR/VIII/2022', 33, 0, 0, 1, '2022-09-20', '1', '0', '2022-09-20', '', '2022-09-20', '', 'Difollow up ', 0),
(359, 'B.24.046/13326/SANDI/D.KOMINFOS', 29, 0, 0, 1, '2022-09-20', '1', '1', '2022-09-20', '', '2022-09-20', '', 'Diikuti ', 0),
(360, 'B.31.880/5625/SMKN1 DPS/Dikpora', 38, 0, 0, 1, '2022-09-20', '1', '1', '2022-09-20', '', '2022-09-20', '', 'Komunikasikan dan koordinasikan bantuan apa yg kira2 yang dapat kita support untum SMKN 1 Dps', 0),
(361, '3500/E4/DT.04.03/2022', 22, 0, 0, 1, '2022-09-21', '1', '1', '2022-09-21', '', '2022-09-21', '', 'untuk dipelajari dan ditindaklanjuti dengan membuat usulan/rekomendasi dosen yang akan diajukan.', 0),
(362, 'EDUFAIR/004/VIII/2022', 38, 0, 0, 1, '2022-09-21', '1', '1', '2022-09-21', '', '2022-09-21', '', 'Dipelajari dan diusulkan paket mana yang akan dipilih\r\n', 0),
(363, 'EDUFAIR/005/XII/2022', 38, 0, 0, 1, '2022-09-21', '1', '1', '2022-09-21', '', '2022-09-21', '', 'Dipelajari dan diusulkan paket mana yang akan dipilih', 0),
(364, 'UM.008/2416/PTP-II/KEMPAR/2022', 22, 0, 0, 1, '2022-09-22', '1', '1', '2022-09-22', '', '2022-09-22', '', 'Diijinkan, dikaji dan dikomunikasikan apakah ada indikasi merugikan nama primakara atau tidak ', 0),
(365, ' I-029/DPW-Bali/IX/2022', 33, 0, 0, 1, '2022-09-23', '1', '0', '2022-09-23', '', '2022-09-23', '', 'Mohon untuk dihadiri', 0),
(366, '06/KEM/09/2022', 29, 0, 0, 1, '2022-09-23', '1', '1', '2022-09-23', '', '2022-09-23', '', 'Koordinasikan UKM Hipmi PT untuk dapat mengirimkan 30 orang untuk menghadiri event tersebut', 0),
(367, '24/B/TON/IX/2022', 0, 0, 0, 1, '2022-09-23', '1', '0', '2022-09-23', '', '2022-09-23', '', '', 1),
(368, 'B.21.660/4324/SEKRET/DKLH', 22, 0, 0, 1, '2022-09-23', '1', '1', '2022-09-23', '', '2022-09-23', '', 'Disiapkan dan dilaksanakan', 0),
(369, '4221/E1/Hk.01.01/2022', 26, 0, 0, 1, '2022-09-26', '1', '1', '2022-09-26', '', '2022-09-26', '', 'Dipelajari dan disosialisasikan', 0),
(370, '2684/LL8/KM/2022', 26, 0, 0, 1, '2022-09-27', '1', '1', '2022-09-27', '', '2022-09-27', '', 'Diikuti ', 0),
(371, 'UM.04.01/1411/PTP.IV/KEMENPAREKRAF/2022', 33, 0, 0, 1, '2022-09-27', '1', '0', '2022-09-27', '', '2022-09-27', '', 'Difollow up dan diterima ', 0),
(372, '042-09/PC-AS/BC/PKS/IX/2022', 29, 0, 0, 1, '2022-09-27', '1', '1', '2022-09-27', '', '2022-09-27', '', 'Di follow up dan dikoordinasikan', 0),
(373, '0876/E5/KB.09.00/2022', 33, 0, 0, 1, '2022-09-28', '1', '0', '2022-09-28', '', '2022-09-28', '', 'Dipelajari, jika dibutuhkan dapat diikuti', 0),
(374, '2683/LL8/KM/2022', 0, 0, 0, 1, '2022-09-28', '1', '0', '2022-09-28', '', '2022-09-28', '', '', 1),
(375, 'B/164/UN14.7.K/DL.17./2022', 0, 0, 0, 1, '2022-09-28', '1', '0', '2022-09-28', '', '2022-09-28', '', '', 1),
(376, '001/SM/IX/2022', 29, 0, 0, 1, '2022-09-28', '1', '1', '2022-09-28', '', '2022-09-28', '', 'Dipelajari dan diikuti ', 0),
(377, '024/HIMAPRODI-M/II-SPP/IX/2022', 29, 0, 0, 1, '2022-10-03', '1', '1', '2022-10-03', '', '2022-10-03', '', 'Diikuti ', 0),
(378, '075/IX/CST/EDU/2022', 22, 0, 0, 1, '2022-10-03', '1', '1', '2022-10-03', '', '2022-10-03', '', 'Dikomunikasikan dan di cek penawarannya ', 0),
(379, 'B.20.556.00/4883/DEKON/DISPAR', 33, 0, 0, 1, '2022-10-03', '1', '0', '2022-10-03', '', '2022-10-03', '', 'Difollowup dan disiapkan ', 0),
(380, '613/APTISI Wil. VII/09/2022', 29, 33, 0, 1, '2022-10-07', '1', '1', '2022-10-07', '', '2022-10-07', '', 'Dipelajari, jika dimungkinkan dapat diikuti mahasiswa', 0),
(381, ' EDUFAIR/064/XII/2022', 38, 0, 0, 1, '2022-10-11', '1', '1', '2022-10-11', '', '2022-10-11', '', 'Difollow up ', 0),
(382, '018/UKM.PROGRESS/BEM.ITBSTIKOM/IX/2022', 29, 0, 0, 1, '2022-10-11', '1', '1', '2022-10-11', '', '2022-10-11', '', 'Dikomunikasikan ke mahasiswa dan diikuti ', 0),
(383, '217/II-4/FEB/X/2022', 26, 0, 0, 1, '2022-10-11', '1', '1', '2022-10-11', '', '2022-10-11', '', 'Dipelajari dan diberikan rekomendasi apakah diijinkan atau tidak', 0),
(384, '027/02/SMAN 1 PETANG', 38, 0, 0, 1, '2022-10-12', '1', '1', '2022-10-12', '', '2022-10-12', '', 'Disetujui, dikomunikasikan dan minta slot sosialisasi/stand. Mengingat banyak menyumbang mahasiswa', 0),
(385, '201/SMASK/DP.19/2022', 26, 0, 0, 1, '2022-10-12', '1', '1', '2022-10-12', '', '2022-10-12', '', 'Dikoordinasikan untuk dipenuhi', 0),
(386, '2977/LL8/HM.03.01/2022', 37, 0, 0, 1, '2022-10-12', '1', '1', '2022-10-12', '', '2022-10-12', '', 'Dikoordinasikan pengisiannya dengan pihak2 terkait ', 0),
(387, '598/LA/23730/2022', 26, 0, 0, 1, '2022-10-14', '1', '1', '2022-10-14', '', '2022-10-14', '', 'Koordinasikan dgn Prodi IF agar dosen jaringan bisa menghadiri sekaligus ke PPTI karena terkait keamanan server dan jaringan\r\n', 0),
(388, '01/SM/X/2022', 26, 0, 0, 1, '2022-10-14', '1', '1', '2022-10-14', '', '2022-10-14', '', 'Mengirimkan mahasiswa yang tertarik topik data scientist', 0),
(389, 'B-2048/DJAI.5/AI.03.04/10/2022', 33, 0, 0, 1, '2022-10-14', '1', '1', '2022-10-14', '', '2022-10-14', '', 'Diikuti ', 0),
(390, '025/HIMAPRODI-M/II-SPP/IX/', 33, 0, 0, 1, '2022-10-18', '1', '1', '2022-10-18', '', '2022-10-18', '', 'Diikuti ', 0),
(391, '028/SPN/BAAK/IX/2022', 26, 0, 0, 1, '2022-10-18', '1', '1', '2022-10-18', '', '2022-10-18', '', 'Diijinkan ', 0),
(392, '063/SU/02/CAST/X/2022', 26, 33, 0, 1, '2022-10-18', '1', '0', '2022-10-18', '', '2022-10-18', '', 'Makerverse sangat bagus dihadiri agar wawasan mahasiswa bisa lebih terbuka untuk ide2 inovasi dan startup. Mohon dikoordinasikan, bisa jadi MK Technopreneurship bisa diarahkan kesana. Demikian juga dengan tenan Inbis.\r\n\r\nAkan ada demo, produk2 inovasi yang dilahirkan selama Bali Fab Fest.', 0),
(393, '3163/LL8/KM/2022', 26, 0, 0, 1, '2022-10-18', '1', '1', '2022-10-18', '', '2022-10-18', '', 'Diikuti ', 0),
(394, '019/UKM.PROGRESS/BEM.ITBSTIKOM/IX?2022', 29, 0, 0, 1, '2022-10-21', '1', '1', '2022-10-21', '', '2022-10-21', '', 'Dikomunikasikan dengan PrimeDev untuk dapat diikuti ', 0),
(395, '02/1045-3/18041', 22, 0, 0, 1, '2022-10-21', '1', '1', '2022-10-21', '', '2022-10-21', '', 'Diterima, sekalian penjajagan kredit', 0),
(396, '02/SM/V/2022', 33, 0, 0, 1, '2022-10-25', '1', '0', '2022-10-25', '', '2022-10-25', '', 'Difollow up ', 0),
(397, '03.142/KBS/X/2022', 33, 0, 0, 1, '2022-10-25', '1', '0', '2022-10-25', '', '2022-10-25', '', 'Dikomunikasikan dengan tenant dan mahasiswa yang berminat ', 0),
(398, '451/PERMOHONAN/BM-HOKI/DPS/IX/2022', 22, 0, 0, 1, '2022-10-25', '1', '1', '2022-10-25', '', '2022-10-25', '', 'Diterima dan didengarkan penawarannya, jika menarik bisa dishare ke dosen', 0),
(399, '160/IDBBALI/KMH/X/2022', 22, 0, 0, 1, '2022-11-02', '1', '1', '2022-11-02', '', '2022-11-02', '', 'Diijinkan', 0),
(400, '01/SM/XI/2022', 29, 0, 0, 1, '2022-11-02', '1', '1', '2022-11-02', '', '2022-11-02', '', 'Followup pengajuan kerjasama, pelajari dan kalau ada keuntungan yang untuk kita bisa dilanjutkan', 0),
(401, '010/HIPMI-PT-UNMAS/UNMAS-DPS/X/2022', 29, 0, 0, 1, '2022-11-02', '1', '1', '2022-11-02', '', '2022-11-02', '', 'Dikoordinasikan dengan Hipmi PT Primakara', 0),
(402, '2311-2337/UN.8.11/PP/2022', 22, 0, 0, 1, '2022-11-02', '1', '1', '2022-11-02', '', '2022-11-02', '', 'HRD berkoordinasi dengan waka I apakah sertifikasi ini dibutuhkan oleh dosen. Jika iya bisa diikuti\r\n', 0),
(404, '002/SM/XII/2022', 0, 0, 0, 1, '2022-11-02', '1', '0', '2022-11-02', '', '2022-11-02', '', '', 1),
(405, '069/SPKS-ZB/HRD/2022', 29, 0, 0, 1, '2022-11-02', '1', '1', '2022-11-02', '', '2022-11-02', '', 'Tugaskan KUIK untuk melakukan pembicaraan awal, kemudian dilanjutkan dengan rekomendasi apakah rencana kerjasama perlu dilanjutkan atau tidak ke tahap berikutnya.', 0),
(406, '421.3/0788/SMAN 5 Dps/Disdikpora Prov.Bali/2022', 38, 0, 0, 1, '2022-11-02', '1', '1', '2022-11-02', '', '2022-11-02', '', 'difollow up', 0),
(407, '003/SM/XI/2022', 38, 0, 0, 1, '2022-11-02', '1', '1', '2022-11-02', '', '2022-11-02', '', 'Pelajari proposalnya, lihat apa sudah pernah bikin event sebelumnya atau bagaimana. Rekomendasikan dan siapkan kalau akan diikuti. Persiapkan apa gimik yang akan menarik pengunjung.', 0),
(408, '001/SM/XI/2022', 33, 0, 0, 1, '2022-11-07', '1', '0', '2022-11-07', '', '2022-11-07', '', 'Diskusikan di Inbis apa ada Startup sesuai kreiteria yg dicari', 0),
(409, '002/SM/XI/2022', 26, 0, 0, 1, '2022-11-09', '1', '1', '2022-11-09', '', '2022-11-09', '', 'Tugaskan BAAK dan PPTI untuk mengikuti \r\n', 0),
(410, '3533/LL8/TU.02.03/2022', 22, 0, 0, 1, '2022-11-09', '1', '1', '2022-11-09', '', '2022-11-09', '', 'Diinformasikan ke dosen PNS', 0),
(411, 'B-1033 /BPSDMP.34/LT.02.02/11/2022', 29, 0, 0, 1, '2022-11-09', '1', '1', '2022-11-09', '', '2022-11-09', '', 'Menyiapkan 5 orang perwakilan mahasiswa ', 0),
(412, '0038/SP/AP-DPS/KC/II/XI/2022', 22, 0, 0, 1, '2022-11-10', '1', '1', '2022-11-10', '', '2022-11-10', '', 'Disurat edaran kita mentiadakan berbagai event karena berada di Densel', 0),
(413, '7060/E2/DT.00.00/2022', 26, 0, 0, 1, '2022-11-10', '1', '1', '2022-11-10', '', '2022-11-10', '', 'Diikuti bersama kaprodi', 0),
(414, 'S-746/WPJ.17/2022', 26, 0, 0, 1, '2022-11-10', '1', '1', '2022-11-10', '', '2022-11-10', '', 'Dikoordinasikan dengan bu Aris ', 0),
(415, 'B/KWU.6/S.95/D.IV.M.EKON.1/11/2022', 33, 0, 0, 1, '2022-11-11', '1', '1', '2022-11-11', '', '2022-11-11', '', 'Disiapkan ', 0),
(416, '005/SM/XI/2022', 33, 0, 0, 1, '2022-11-11', '1', '0', '2022-11-11', '', '2022-11-11', '', 'Difollow up ', 0),
(417, '254/A.4/2022', 33, 0, 0, 1, '2022-11-11', '1', '1', '2022-11-11', '', '2022-11-11', '', 'Diikuti ', 0),
(418, 'B.31.421.3/5248/SMA N 1 KUTA UTARA/DIKPORA', 38, 0, 0, 1, '2022-11-11', '1', '1', '2022-11-11', '', '2022-11-11', '', 'Difollowup dan ditindaklanjuti ', 0),
(419, '004/SM/XI/2022', 38, 0, 0, 1, '2022-11-11', '1', '1', '2022-11-11', '', '2022-11-11', '', 'Difollowup dan diikuti ', 0),
(420, '3600/LL8/KM/2022 ', 26, 0, 0, 1, '2022-11-15', '1', '1', '2022-11-15', '', '2022-11-15', '', 'Ajak team prodi untuk melihat expo ini untuk mengetahui implementasi merdeka belajar di Undiksa', 0),
(421, 'B.17.005/10070/Bid.I/BRIDA', 33, 0, 0, 1, '2022-11-15', '1', '0', '2022-11-15', '', '2022-11-15', '', 'Koordinasi ke LPPM untuk diikuti', 0),
(422, 'B/1263/BPSDMI/BDI-Denpasar/HM/XI/2022', 33, 0, 0, 1, '2022-11-15', '1', '1', '2022-11-15', '', '2022-11-15', '', 'Dipelajari dan tentukan tindaklanjut apakah diikuti atau tidak', 0),
(423, 'B/1272/BPSDMI/BDI-Denpasar/DL/XI/2022', 33, 0, 0, 1, '2022-11-15', '1', '0', '2022-11-15', '', '2022-11-15', '', 'Dipelajari dan tentukan tindaklanjut apakah diikuti atau tidak', 0),
(424, '006/SM/XI/2022', 29, 0, 0, 1, '2022-11-15', '1', '1', '2022-11-15', '', '2022-11-15', '', 'Koordinasikan dengan KUIK untuk mengkomunikasikan dan mempertimbangkan lebih lanjut, apakah kerjasamanya worthed atau tidak untuk ditindaklanjuti.', 0),
(425, 'B.031.005/2890/SMAN 1 PETANG/DIKPORA', 38, 0, 0, 1, '2022-11-28', '1', '1', '2022-11-28', '', '2022-11-28', '', 'Diikuti\r\n', 0),
(426, '001/SM/XII/2022', 33, 0, 0, 1, '2022-12-05', '1', '1', '2022-12-05', '', '2022-12-05', '', 'koordinasikan saja ke Startup yg ngurusi sampah untuk bisa diikuti dan menggunakan peluang beasiswa', 0),
(427, '4402/LL8/KM/2022 ', 33, 0, 0, 1, '2022-12-05', '1', '1', '2022-12-05', '', '2022-12-05', '', 'Koordinasikan untuk dapat diikuti', 0),
(428, '0081/SD-Santosa/XI/2022', 38, 0, 0, 1, '2022-12-05', '1', '1', '2022-12-05', '', '2022-12-05', '', 'Dikoordinasikan dan mewakili', 0),
(429, ' 4439/LL8/KM.00/2022', 26, 0, 0, 1, '2022-12-06', '1', '1', '2022-12-06', '', '2022-12-06', '', 'Mengikuti dan follow up program tersebut\r\n', 0),
(430, '003/SM/XII/2022', 33, 0, 0, 1, '2022-12-08', '1', '1', '2022-12-08', '', '2022-12-08', '', 'Diikuti ', 0),
(431, '03.152/KBS/XII/2022', 33, 0, 0, 1, '2022-12-08', '1', '1', '2022-12-08', '', '2022-12-08', '', 'untuk ada yg hadir', 0),
(432, '4118/LL8/KS.01.00/2022 ', 26, 0, 0, 1, '2022-12-08', '1', '1', '2022-12-08', '', '2022-12-08', '', 'Agar BAAK di follow up', 0),
(433, '5094/KIII.4/C.5/XII/2022', 38, 0, 0, 1, '2022-12-14', '1', '1', '2022-12-14', '', '2022-12-14', '', 'Pelajari dan putuskan apakah diikuti atau tidak', 0),
(434, 'B.31.003.3/58.40/SMKN 1 BGL/DIKPORA', 38, 0, 0, 1, '2022-12-14', '1', '0', '2022-12-14', '', '2022-12-14', '', 'Pelajari dan putuskan\r\n', 0),
(435, '016 / SRB / SK / XII / 2022', 37, 29, 0, 1, '2022-12-16', '1', '0', '2022-12-16', '', '2022-12-16', '', 'PPM untuk ditindaklanjuti dan dibantu.\r\n\r\nWaka 3 agar KUIK menyiapkan MoU dan PKS untuk kegiatan ini', 0),
(436, '004/SM/XII/2022', 38, 0, 0, 1, '2022-12-16', '1', '0', '2022-12-16', '', '2022-12-16', '', 'dipelajari dan diputuskan', 0);
INSERT INTO `sip_disposisisurat` (`kodeDisposisi`, `noSurat`, `kodeBidang`, `kodeBidang_2`, `kodeBidang_3`, `pengirim`, `tglInput`, `userPengirim`, `status`, `tglStatus`, `fileDisposisi`, `tglInputFile`, `userInputFile`, `isiInstruksi`, `abaikanSurat`) VALUES
(437, '457/EX-SALES/OFA/XI/2022', 26, 0, 0, 1, '2022-12-20', '1', '1', '2022-12-20', '', '2022-12-20', '', 'Diikuti', 0),
(438, '83/XII/FORKOM-OSIS/Dps/2022', 38, 0, 0, 1, '2022-12-20', '1', '1', '2022-12-20', '', '2022-12-20', '', 'Pelajari dan putuskan', 0),
(439, '002/INSTIKI.HIMA-TI/SPm.03/12/2022', 29, 0, 0, 1, '2023-01-06', '1', '1', '2023-01-06', '', '2023-01-06', '', 'Diikuti ', 0),
(440, '065/SU/AP-D/UKMKWU/XIs/2022', 29, 0, 0, 1, '2023-01-12', '1', '1', '2023-01-12', '', '2023-01-12', '', 'Ditindaklanjuti', 0),
(441, '0358/LL8/KM/2023', 26, 0, 0, 1, '2023-01-26', '1', '1', '2023-01-26', '', '2023-01-26', '', 'Diikuti ', 0),
(442, '0408/LL8/KS.01.00/2023 ', 26, 0, 0, 1, '2023-01-31', '1', '1', '2023-01-31', '', '2023-01-31', '', 'Diikuti dan kirimkan 5 orang perwakilan', 0),
(443, '001/SM/II/2023', 29, 0, 0, 1, '2023-02-06', '1', '1', '2023-02-06', '', '2023-02-06', '', 'Di Follow up ', 0),
(444, '03/BbH/II/2023', 33, 0, 0, 1, '2023-02-06', '1', '1', '2023-02-06', '', '2023-02-06', '', 'Pelajari, ajukan jika dibutuhkan', 0),
(445, 'B.20.556 /680/PKSDM/DISPAR', 33, 0, 0, 1, '2023-02-06', '1', '1', '2023-02-06', '', '2023-02-06', '', 'Komersialisasi - Ditindaklanjuti', 0),
(446, 'B/489/UN34/KM.05.03/2023', 33, 0, 0, 1, '2023-02-08', '1', '1', '2023-02-08', '', '2023-02-08', '', 'Dipelajari dan ditindaklanjuti', 0),
(447, '034/Panpel-SEF/BEMFEB-UNMAS/I/2023', 29, 33, 0, 1, '2023-02-08', '1', '1', '2023-02-08', '', '2023-02-08', '', 'Waka III - Diikuti \r\nPusinov - Ikuti lomba business plan', 0),
(448, '3022/UND/SVM/II/2023', 26, 0, 0, 1, '2023-02-08', '1', '1', '2023-02-08', '', '2023-02-08', '', 'Diikuti\r\n', 0),
(449, 'B.17.074/927/Bid.I/BRIDA', 33, 0, 0, 1, '2023-02-14', '1', '1', '2023-02-14', '', '2023-02-14', '', 'Dipelajari dan diikuti ', 0),
(450, '002/SM/II/2023', 29, 0, 0, 1, '2023-02-14', '1', '1', '2023-02-14', '', '2023-02-14', '', 'KUIK lakuan komunikasi lebih jauh. Bagaimana bentuk kerjasama? Apa manfaat bagi Primakara atas event tersebut? Apakah manfaatnya kita butuhkan? Kemudian putuskan untuk dilanjutkan apa tidak.', 0),
(451, 'B.32.027/429/UPTD. RUMAH KREATIF/DISPERINDAG', 29, 0, 0, 1, '2023-02-14', '1', '1', '2023-02-14', '', '2023-02-14', '', 'Segera diumumkan ke alumni dan mahasiswa, lowongan design grafis Pemprov Bali.', 0),
(452, '108/A/Panpel-ELCCO/HME/FT-UNUD/I/2023', 29, 0, 0, 1, '2023-02-17', '1', '1', '2023-02-17', '', '2023-02-17', '', 'Pelajari dan dorong keikutsertaan mahasiswa', 0),
(453, '01.003/PL8.HMJ/PAN-NAC/2023', 29, 0, 0, 1, '2023-02-17', '1', '1', '2023-02-17', '', '2023-02-17', '', 'Ikuti dan koordinasikan dengan Kaprodi SIA agar lomba ini disiapkan dengan serius', 0),
(454, '003/SM/II/2023', 29, 0, 0, 1, '2023-02-23', '1', '1', '2023-02-23', '', '2023-02-23', '', 'Difollow up ', 0),
(455, '0639/LL8/HK.12.01/2023', 33, 0, 0, 1, '2023-02-23', '1', '1', '2023-02-23', '', '2023-02-23', '', 'Diikuti', 0),
(456, '0629/LL8/KM/2023', 26, 0, 0, 1, '2023-02-23', '1', '1', '2023-02-23', '', '2023-02-23', '', 'Ditindaklanjuti, surveynya diisi', 0),
(457, '0630/LL8/KM/2023', 26, 0, 0, 1, '2023-02-23', '1', '1', '2023-02-23', '', '2023-02-23', '', 'Ditindaklanjuti, surveynya diisi', 0),
(458, '004/SM/II/2023', 33, 0, 0, 1, '2023-02-23', '1', '1', '2023-02-23', '', '2023-02-23', '', 'Diikuti', 0),
(459, '001/COMVET-TCL/SLO/II/2023', 29, 0, 0, 1, '2023-02-24', '1', '1', '2023-02-24', '', '2023-02-24', '', 'Komunikasikan ke UKM untuk diikuti ', 0),
(460, '005/SM/II/2023', 29, 0, 0, 1, '2023-02-24', '1', '1', '2023-02-24', '', '2023-02-24', '', 'PCC dapat menginformasikan ke alumni dan mahasiswa tingkat akhir ', 0),
(461, '006/SM/II/2023', 29, 0, 0, 1, '2023-02-24', '1', '1', '2023-02-24', '', '2023-02-24', '', 'Ditindak lanjuti ', 0),
(462, '001/SM/III/2023', 29, 0, 0, 1, '2023-03-01', '1', '1', '2023-03-01', '', '2023-03-01', '', 'Difollow up ', 0),
(463, '005/IRDH/II/2023', 33, 0, 0, 1, '2023-03-06', '1', '1', '2023-03-06', '', '2023-03-06', '', 'Dipelajari dan direkomendasikan', 0),
(464, '0727/LL8/KP.08.00/2023', 22, 0, 0, 1, '2023-03-06', '1', '1', '2023-03-06', '', '2023-03-06', '', 'Ditindaklanjuti ', 0),
(465, '003/SM/III/2023', 29, 0, 0, 1, '2023-03-07', '1', '0', '2023-03-07', '', '2023-03-07', '', 'KUIK - Mohon diwakilkan', 0),
(466, '002/SM/III/2023', 33, 0, 0, 1, '2023-03-07', '1', '1', '2023-03-07', '', '2023-03-07', '', 'Difollowup dan diikuti', 0),
(467, '895.3/2356/SETDA/BALITBANG', 33, 0, 0, 1, '2023-03-08', '1', '1', '2023-03-08', '', '2023-03-08', '', 'Diikuti', 0),
(468, 'B.17.880/1812/Bid.I/BRIDA', 33, 0, 0, 1, '2023-03-08', '1', '1', '2023-03-08', '', '2023-03-08', '', 'Ditindaklanjuti', 0),
(469, '0682/SDM/PBK/2023', 33, 0, 0, 1, '2023-03-09', '1', '1', '2023-03-09', '', '2023-03-09', '', 'Koordinasikan untuk dapat memenuhi permintaan BPD', 0),
(471, 'B/UND/492/UM.00.01/D.3.3/2023', 33, 0, 0, 1, '2023-03-09', '1', '1', '2023-03-09', '', '2023-03-09', '', 'Salah seorang mewakili', 0),
(472, 'W.20.UM.01.01-1906', 33, 0, 0, 1, '2023-03-09', '1', '1', '2023-03-09', '', '2023-03-09', '', 'Sentra HKI dapat mengikuti event ini', 0),
(473, '004/SM/III/2023', 26, 0, 0, 1, '2023-03-13', '1', '1', '2023-03-13', '', '2023-03-13', '', 'Pak Helmy bisa lanjutkan diskudi dengan pihak UID. KUIK bisa diajak ', 0),
(474, '005 / 296 /DKIS', 26, 0, 0, 1, '2023-03-13', '1', '1', '2023-03-13', '', '2023-03-13', '', 'Minta kaprodi IF untuk menugaskan 5 orang mahasiswa yang sedang mengambil MK yang berkaitan untuk dapat menghadiri', 0),
(475, 'BAL/453/4/2023', 29, 0, 0, 1, '2023-03-13', '1', '1', '2023-03-13', '', '2023-03-13', '', 'Tugaskan KUIK memfollow up komunikasi ke Konsulat India', 0),
(476, 'B/347/UN14.2.5/DL.17/2023', 33, 0, 0, 1, '2023-03-15', '1', '1', '2023-03-15', '', '2023-03-15', '', 'Pelajari apakah butuh diikuti apa tidak, jika butuh maka hadiri', 0),
(477, '0988/LL8/KM/2023', 26, 0, 0, 1, '2023-03-15', '1', '1', '2023-03-15', '', '2023-03-15', '', 'Diikuti ', 0),
(478, '0921/LL8/KS.07.00/2023', 29, 0, 0, 1, '2023-03-15', '1', '1', '2023-03-15', '', '2023-03-15', '', 'Diskusikan dengan KUIK untuk mengisi data, walaupun sejauh ini masih nihil mahasiswa asing', 0),
(479, '005/SM/III/2023', 29, 0, 0, 1, '2023-03-15', '1', '1', '2023-03-15', '', '2023-03-15', '', 'Koordinasi kemahasiswaan untuk diikuti', 0),
(480, '0495/J7.1/PN.00/2023', 29, 33, 0, 1, '2023-03-20', '1', '1', '2023-03-20', '', '2023-03-20', '', 'Waka III - Konsenin dan tindaklanjuti lomba lainnya \r\nPusinov - Konsenin lomba terkait dengan technopreneurship dan inovasi', 0),
(481, '005 /361/DKIS', 29, 0, 0, 1, '2023-03-20', '1', '1', '2023-03-20', '', '2023-03-20', '', 'Tolong KUIK mewakilkan ', 0),
(482, '006/SM/III/2023', 29, 0, 0, 1, '2023-03-20', '1', '0', '2023-03-20', '', '2023-03-20', '', 'PCC dapat menlanjutkan komunikasi dengan AGATE, saya pribadi sudah banyak diskusi dengan Arif Widiyasa (founder) nya, Kita kedepan bisa kerjasama', 0),
(483, '1128/E2/DT.01.02/2023', 29, 0, 0, 1, '2023-03-28', '1', '1', '2023-03-28', '', '2023-03-28', '', 'Mengikuti ', 0),
(484, 'S-93/KR.0801/2023', 33, 0, 0, 1, '2023-03-28', '1', '1', '2023-03-28', '', '2023-03-28', '', 'LPPM dapat mengkomunikasikan dengan Prodi SIA untuk mendorong keikutsertaan mahasiswa ', 0),
(485, '0105/HIMA-SK/SU.02/03/2023', 29, 0, 0, 1, '2023-04-03', '1', '1', '2023-04-03', '', '2023-04-03', '', 'Koordinasikan dan persiapkan dengan baik untuk bisa diikuti ', 0),
(486, '1175/LL8/KS.03.00/2023', 33, 0, 0, 1, '2023-04-03', '1', '1', '2023-04-03', '', '2023-04-03', '', 'Ditindaklanjuti ', 0),
(487, 'B/UND/605/PK.01.06/PTP.2/PTP.2.B/2023', 33, 0, 0, 1, '2023-04-03', '1', '1', '2023-04-03', '', '2023-04-03', '', 'Pelajari dan dorong keikutsertaan dosen/mahasiswa', 0),
(488, '1193/LL8/KM/2023', 26, 0, 0, 1, '2023-04-04', '1', '1', '2023-04-04', '', '2023-04-04', '', 'Tugaskan 2 orang untuk mewakili. Yang ditugaskan minta share informasi penting ke dosen lain', 0),
(489, 'B-039/05300/VS.330/01/2023', 22, 0, 0, 1, '2023-04-04', '1', '1', '2023-04-04', '', '2023-04-04', '', 'Pelajari dan tindaklanjuti', 0),
(490, 'B.31.891.3/1419/SMKN 1 MANGGIS/DIKPORA', 38, 0, 0, 1, '2023-04-04', '1', '0', '2023-04-04', '', '2023-04-04', '', 'Pelajari dan tindaklanjuti', 0),
(491, 'B.31.880/3214/SMKN1DPS/DIKPORA', 38, 0, 0, 1, '2023-04-10', '1', '1', '2023-04-10', '', '2023-04-10', '', 'Koordinasikan, komunikasikan ke SMK materi apa yang diharapkan. Manfaarkan secara optimal untuk mempromosikan kampus ', 0),
(492, '001/SM/IV/2023', 33, 0, 0, 1, '2023-04-10', '1', '1', '2023-04-10', '', '2023-04-10', '', 'Dipelajari dan tentukan tindaklanjutnya', 0),
(493, '002/SM/IV/2023', 26, 0, 0, 1, '2023-04-10', '1', '1', '2023-04-10', '', '2023-04-10', '', 'Tolong pelajari dan diskusikan. Rekomendasikan tindaklanjutnya ', 0),
(494, '1294/LL8/KM.01.02/2023', 29, 0, 0, 1, '2023-04-10', '1', '1', '2023-04-10', '', '2023-04-10', '', 'Pelajari dan umumkan e mahasiswa. Waka 3 juga dapat memilih dan mendaftarkan mahasiswa kita yang memenuhi syarat', 0),
(495, 'B.17.005/2772/BID.I/BRIDA', 33, 0, 0, 1, '2023-04-10', '1', '1', '2023-04-10', '', '2023-04-10', '', 'Tugaskan LPPM untuk menghadiri', 0),
(496, '682/IT1.B07.2/TA.02/2023', 33, 0, 0, 1, '2023-04-12', '1', '1', '2023-04-12', '', '2023-04-12', '', 'Pelajari dan tindaklanjuti jika diperlukan', 0),
(497, '787/XI-01/0423', 22, 0, 0, 1, '2023-04-12', '1', '1', '2023-04-12', '', '2023-04-12', '', 'Pelajari dan jika dirasa perlu, tindaklanjuti', 0),
(498, '0117/HRGS Corp/Doc/PTBCE/III/2023', 29, 0, 0, 1, '2023-04-12', '1', '1', '2023-04-12', '', '2023-04-12', '', 'KUIK dan PCC lakukan komunikasi lebih lanjut', 0),
(499, '003/SM/IV/2023', 29, 33, 0, 1, '2023-04-12', '1', '1', '2023-04-12', '', '2023-04-12', '', 'Pusinov : Ikuti lomba Business Plan \r\nWaka 3 : Ikuti lomba video, koordinasi UMKM Multimedia ', 0),
(500, '036/BEM-FEB/II-SPP/IV/2023', 33, 29, 0, 1, '2023-04-17', '1', '1', '2023-04-17', '', '2023-04-17', '', 'Pusinov - Mendorong keikutsertaan mahasiswa di lomba UMBCC\r\nWaka III - Mendorong mahasiswa/UMKM Multimedia mengikuti branding Competition. Terkait branding bisa belajar di tim marketing', 0),
(501, '1542/LL8/DT.02.04/2023', 37, 0, 0, 1, '2023-04-18', '1', '1', '2023-04-18', '', '2023-04-18', '', 'Tindaklanjuti ', 0),
(502, '0117/HRGS Corp/Doc/PTBCE/III/2023', 33, 0, 0, 1, '2023-04-27', '1', '1', '2023-04-27', '', '2023-04-27', '', 'Ditindaklanjuti ', 0),
(503, '027/266/KPID', 29, 0, 0, 1, '2023-05-04', '1', '1', '2023-05-04', '', '2023-05-04', '', 'Ditindaklanjuti', 0),
(504, '001/SM/V/2023', 29, 0, 0, 1, '2023-05-04', '1', '1', '2023-05-04', '', '2023-05-04', '', 'Pelajari dan tindaklanjuti, diskusikan dengan Ketua jika programnya menarik untuk diseriusi ', 0),
(505, '1754/LL8/HM.00.03/2023', 26, 0, 0, 1, '2023-05-10', '1', '1', '2023-05-10', '', '2023-05-10', '', 'Tolong tugaskan 1 orang', 0),
(506, 'HKI.5-HH.04.02-623', 33, 0, 0, 1, '2023-05-10', '1', '1', '2023-05-10', '', '2023-05-10', '', 'Sentra HKI Mengikuti ', 0),
(507, '002/SM/V/2023', 29, 0, 0, 1, '2023-05-10', '1', '1', '2023-05-10', '', '2023-05-10', '', 'Pelajari dan follow up', 0),
(508, '800/506/101.6.10.15/2023', 38, 0, 0, 1, '2023-05-15', '1', '0', '2023-05-15', '', '2023-05-15', '', 'Disiapkan', 0),
(510, '003/SM/V/2023', 33, 0, 0, 1, '2023-05-15', '1', '1', '2023-05-15', '', '2023-05-15', '', 'Diterima dan disiapkan', 0),
(511, '25/554/Dpr/Srt/B', 22, 0, 0, 1, '2023-05-16', '1', '1', '2023-05-16', '', '2023-05-16', '', 'HRD Bisa menunjuk satu orang yang loadnya sedang rendah untuk mewakili ', 0),
(512, 'B.24.005/9537/IKP/D.KOMINFOS', 29, 0, 0, 1, '2023-05-16', '1', '1', '2023-05-16', '', '2023-05-16', '', 'Dikomunikasikan ke mahasiswa khususnya UKM Multimedia ', 0),
(513, '070/28/Balitbang', 33, 0, 0, 1, '2023-05-16', '1', '1', '2023-05-16', '', '2023-05-16', '', 'Dorong keikutsertaan mahasiswa', 0),
(514, '005/414/Pem-Kec.Denut ', 29, 0, 0, 1, '2023-05-16', '1', '1', '2023-05-16', '', '2023-05-16', '', 'Informasikan ke mahasiswa ', 0),
(515, '038/BAPOMI-BALI/V/2023', 29, 0, 0, 1, '2023-05-16', '1', '1', '2023-05-16', '', '2023-05-16', '', 'Pelajari dan follow up karena berkaitan dengan pemeringkatan PT', 0),
(516, 'B.24.005/9608/IAI/D.KOMINFOS', 29, 0, 0, 1, '2023-05-19', '1', '1', '2023-05-19', '', '2023-05-19', '', 'Dorong keikutsertaan mahasiswa dalam 2 lomba ini ', 0),
(517, '2000/LL8/KS.03.00/2023', 29, 0, 0, 1, '2023-05-19', '1', '1', '2023-05-19', '', '2023-05-19', '', 'Tugaskan PCC dan KUIK untuk mengikuti', 0),
(518, '0038/NEX-IDN/MAY/2023', 33, 0, 0, 1, '2023-05-19', '1', '0', '2023-05-19', '', '2023-05-19', '', 'Tugaskan Inbis untuk mengikuti ', 0),
(519, '024/E/ICCN/V/2023', 29, 0, 0, 1, '2023-05-23', '1', '0', '2023-05-23', '', '2023-05-23', '', 'Dipelajari dan diputuskan apakah diperlukan ikut atau tidak ', 0),
(520, '068/UBR.FTK/PP/2023', 29, 0, 0, 1, '2023-05-23', '1', '0', '2023-05-23', '', '2023-05-23', '', 'KUIK kerjasama dengan admnin prodi untuk mengkomunikasikan dan menerima kunjungan ini ', 0),
(521, '241/U.7/SMKPCN/V/2023', 38, 0, 0, 1, '2023-05-23', '1', '0', '2023-05-23', '', '2023-05-23', '', 'Dipelajari dan putuskan untuk ikut atau tidak ', 0),
(522, 'B.31.422/645/SMAN 1 Baturiti/Dikpora', 38, 0, 0, 1, '2023-05-23', '1', '0', '2023-05-23', '', '2023-05-23', '', 'Komunikasikan dan support agar bisa promosi optimal di sekolah tersebut', 0),
(523, '25/637/Dpr/Srt/B', 26, 0, 0, 1, '2023-05-31', '1', '1', '2023-05-31', '', '2023-05-31', '', 'Kaprodi SIA dan D3 Akuntansi mohon mewakili untuk menghadiri', 0),
(524, 'S-453/UIGM/PPM/2023', 26, 0, 0, 1, '2023-05-31', '1', '0', '2023-05-31', '', '2023-05-31', '', 'Dipelajari dan rekomendasikan tindaklanjut', 0),
(525, '007/BEB/V/2023', 29, 0, 0, 1, '2023-05-31', '1', '0', '2023-05-31', '', '2023-05-31', '', 'Dimaksimalkan partisipasi semua Ormawa dan UKM', 0),
(526, '2687/LL8/KS.01.00/2023', 26, 0, 0, 1, '2023-06-13', '1', '0', '2023-06-13', '', '2023-06-13', '', 'Diikuti, bisa diwakili ber 2', 0),
(527, '2458/LL8/KS.01.00/2023', 26, 0, 0, 1, '2023-06-13', '1', '0', '2023-06-13', '', '2023-06-13', '', 'Tugaskan admin feeder untuk mengikuti', 0),
(528, '2126/LL8/KL.01.00/2023', 37, 0, 0, 1, '2023-06-13', '1', '1', '2023-06-13', '', '2023-06-13', '', 'Tindaklanjuti', 0),
(529, 'BAL/455/4/2023 ', 29, 0, 0, 1, '2023-06-13', '1', '0', '2023-06-13', '', '2023-06-13', '', 'KUIK Menginformasikan kepada dosen/staff dan mahasiswa yang berminat untuk ikut yoga. Mengkomunikasikan ke konsulat', 0),
(530, '14/UW/BEM-FH/PanPel-DekanCupXI/V/2023', 29, 0, 0, 1, '2023-06-13', '1', '1', '2023-06-13', '', '2023-06-13', '', 'Komunikasikan ke UKM Futsal ', 0),
(531, '15/UW/BEM-FH/PanPel-DekanCupXI/V/2023', 29, 0, 0, 1, '2023-06-13', '1', '1', '2023-06-13', '', '2023-06-13', '', 'Komunikasikan ke UKM Esprime', 0),
(532, '2583/LL8/HK.08/2023 ', 26, 0, 0, 1, '2023-06-13', '1', '0', '2023-06-13', '', '2023-06-13', '', 'Disosialisasikan ke team Akademik untuk kemudian dipatuhi', 0),
(533, 'B.17.005/4346/Bid.I/BRIDA', 33, 0, 0, 1, '2023-06-13', '1', '0', '2023-06-13', '', '2023-06-13', '', 'Ditindaklanjuti.', 0),
(534, '87', 1, 26, 0, 1, '2023-06-22', '1', '0', '2023-06-22', '', '2023-06-22', '', '', 0),
(535, '87', 16, 0, 0, 1, '2023-06-22', '1', '1', '2023-06-22', '', '2023-06-22', '', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_filearsip`
--

CREATE TABLE `sip_filearsip` (
  `kodeFile` int(11) NOT NULL,
  `kodeArsip` int(11) NOT NULL,
  `namaFile` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_komentar`
--

CREATE TABLE `sip_komentar` (
  `kodeKomentar` int(11) NOT NULL,
  `noSurat` varchar(50) NOT NULL,
  `isiKomentar` longtext NOT NULL,
  `userInput` char(18) NOT NULL,
  `tglInput` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_komentar`
--

INSERT INTO `sip_komentar` (`kodeKomentar`, `noSurat`, `isiKomentar`, `userInput`, `tglInput`) VALUES
(1, '1/2/gas', '', '1', '2021-08-05'),
(2, '2021/08/22', 'Yes', '2', '2021-08-23'),
(3, '1/2/3', 'yes', '202104', '2021-08-23'),
(4, '1/2/3', '', '1', '2021-08-23'),
(5, '1/2/3', '', '1', '2021-08-23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_nosuratkeluar`
--

CREATE TABLE `sip_nosuratkeluar` (
  `id` int(11) NOT NULL,
  `noSurat` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `atributSurat` varchar(50) NOT NULL,
  `perihal` varchar(50) NOT NULL,
  `tujuan` varchar(100) DEFAULT NULL,
  `kodeBidang` int(11) NOT NULL,
  `userInput` char(18) NOT NULL,
  `tglInput` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_nosuratkeluar`
--

INSERT INTO `sip_nosuratkeluar` (`id`, `noSurat`, `tahun`, `atributSurat`, `perihal`, `tujuan`, `kodeBidang`, `userInput`, `tglInput`) VALUES
(1, 12, 0, '973.1/0012/Bapenda', '', NULL, 7, '', '2021-08-03'),
(2, 13, 0, '973.1/0013/Bapenda', '', NULL, 7, '', '2021-08-03'),
(3, 14, 0, '973.1/0014/Bapenda', '', NULL, 7, '', '2021-08-03'),
(4, 15, 0, '973.1/0015/Bapenda', '', NULL, 7, '', '2021-08-03'),
(5, 16, 0, '973.1/0016/Bapenda', '', NULL, 7, '', '2021-08-03'),
(6, 17, 0, '973.1/0017/Bapenda', '', NULL, 7, '', '2021-08-03'),
(7, 18, 0, '973.1/0018/Bapenda', '', NULL, 7, '', '2021-08-03'),
(8, 19, 0, '973.1/0019/Bapenda', '', NULL, 7, '', '2021-08-03'),
(9, 20, 0, '973.1/0020/Bapenda', '', NULL, 7, '', '2021-08-03'),
(10, 21, 0, '973.1/0021/Bapenda', '', NULL, 7, '', '2021-08-03'),
(11, 22, 0, '973.1/0022/Bapenda', '', NULL, 7, '', '2021-08-03'),
(12, 23, 0, '973.1/0023/Bapenda', '', NULL, 7, '', '2021-08-03'),
(13, 24, 0, '973.1/0024/Bapenda', '', NULL, 7, '', '2021-08-03'),
(14, 25, 0, '973.1/0025/Bapenda', '', NULL, 7, '', '2021-08-03'),
(15, 26, 0, '973.1/0026/Bapenda', '', NULL, 7, '', '2021-08-03'),
(16, 27, 0, '973.1/0027/Bapenda', '', NULL, 7, '', '2021-08-03'),
(17, 28, 0, '973.1/0028/Bapenda', '', NULL, 7, '', '2021-08-03'),
(18, 29, 0, '973.1/0029/Bapenda', '', NULL, 7, '', '2021-08-03'),
(19, 30, 0, '973.1/0030/Bapenda', '', NULL, 7, '', '2021-08-03'),
(20, 31, 0, '973.1/0031/Bapenda', '', NULL, 7, '', '2021-08-03'),
(21, 32, 0, '973.1/0032/Bapenda', '', NULL, 7, '', '2021-08-03'),
(22, 33, 0, '973.1/0033/Bapenda', '', NULL, 7, '', '2021-08-03'),
(23, 34, 0, '973.1/0034/Bapenda', '', NULL, 7, '', '2021-08-03'),
(24, 973, 0, '973.1/0035/Bapenda', '', NULL, 8, '', '2021-08-04'),
(25, 1, 0, '973.1/0001/Bapenda', '', NULL, 6, '', '2021-08-04'),
(26, 2, 0, '973.1/0002/Bapenda', '', NULL, 6, '', '2021-08-04'),
(27, 3, 0, '973.1/0003/Bapenda', '', NULL, 6, '', '2021-08-04'),
(28, 4, 0, '973.1/0004/Bapenda', '', NULL, 6, '', '2021-08-04'),
(29, 5, 0, '973.1/0005/Bapenda', '', NULL, 6, '', '2021-08-04'),
(30, 6, 0, '973.1/0006/Bapenda', '', NULL, 6, '', '2021-08-04'),
(31, 7, 0, '973.1/0007/Bapenda', '', NULL, 6, '', '2021-08-04'),
(32, 8, 0, '973.1/0008/Bapenda', '', NULL, 6, '', '2021-08-04'),
(33, 9, 0, '973.1/0009/Bapenda', '', NULL, 6, '', '2021-08-04'),
(34, 10, 0, '973.1/0010/Bapenda', '', NULL, 6, '', '2021-08-04'),
(35, 11, 0, '973.1/0011/Bapenda', '', NULL, 6, '', '2021-08-04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_rak`
--

CREATE TABLE `sip_rak` (
  `kodeRak` int(11) NOT NULL,
  `namaRak` varchar(50) NOT NULL,
  `jmlMaksimal` int(11) NOT NULL,
  `sisa` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_rak`
--

INSERT INTO `sip_rak` (`kodeRak`, `namaRak`, `jmlMaksimal`, `sisa`) VALUES
(5, 'Rak 2', 5, 5),
(4, 'Rak 1', 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_report`
--

CREATE TABLE `sip_report` (
  `kodeReport` int(11) NOT NULL,
  `noSurat` varchar(50) NOT NULL,
  `userInput` char(18) NOT NULL,
  `tglInput` date NOT NULL,
  `keterangan` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sip_report`
--

INSERT INTO `sip_report` (`kodeReport`, `noSurat`, `userInput`, `tglInput`, `keterangan`) VALUES
(1, '1/2/surat1', '1999', '2021-09-03', 'ternyata setelah dilakukan tindak lanjut didapatkan sebuah keberhasilan dalam melaksanakan lomba dimana kita mendapatkan juara satu'),
(6, '1/2/4 surat masuk', '20210810', '2021-09-08', 'sudah selesai di komunikasikan'),
(7, '2172/LL8/TU/2021', '2019091111', '2021-09-08', 'Sudah diikuti pada tgl 8 September 2021'),
(10, 'BI.31.420/76560/DIKPORA', 'Prodi SI', '2021-09-24', 'Telah dilaksanakan rapat koordinasi dengan Kaprodi IF, SIA, BAAK, PPTI dan SDM. Catatan rapat dapat diakses pada tautan berikut ini: https://docs.google.com/document/d/1qthgBvOdgyvxaikHGH1N6KxYj3uRpnVXjkWgXiYJ8LY/edit \r\nTindak lanjutnya: \r\nPembuatan surat pengumuman untuk pelaksanaan perkuliahan luring ke mahasiswa, satgas setempat dan lldikti (sedang diajukan ke bag. sekretariat).'),
(11, '2375/LL8/KL/2021', 'PPM', '2021-09-28', 'Perlu adanya revisi ISK sesuai hasil sosialisasi, seperti pada tabel 2 mengenai perhitungan jam sks mata kuliah.'),
(12, '5437/E2/DM.00.01/2021', 'Waka I', '2021-09-28', 'Sudah diikuti oleh dosen yang ditunjuk dan akan ada ToT dari Kemdikbud yang akan ke kampus pada 4-5 Oktober 2021'),
(13, '002', 'Pusat Inovasi', '2021-09-29', 'Memperkenalkan inkuri sebagai inkubator baru untuk dapat berkolaborasi dalam hal pengembangan satratup yang ada di Bali'),
(14, '029/MK.01/GP-331/IX/2021', 'Waka III', '2021-10-05', 'Tidak ada mahasiswa yang mendaftar hingga tenggat waktu yang diberikan pihak Telkom, 26 September 2021.'),
(15, '2406/LL8/PR/2021', 'PPM', '2021-10-05', 'sudah dikirim sesuai link yang diberikan'),
(17, '5220/E2/PB.04.04/2021', '2', '2021-10-14', 'diabaikan'),
(18, '3041/PD.04/D3/2021', '2', '2021-10-14', 'Diabaikan'),
(20, '10/UNWAR/LPM/Pan.SemNas/PD-11/2021', '2', '2021-10-14', 'Diabaikan'),
(22, '2632/LL8/KM/2021', 'PPM', '2021-10-19', 'dari hasil diskusi bahwa:\r\n1. Standar MBKM tidak harus menjadi standar tersendiri. Bisa include dengan standar lainnya. Misal, standar kerjasama MBKM, maka dalam kerjasama tridharma apabila terdapat laporan kegiatan tentang program MBKM maka sudah dapat dikatakan menjalankan. Hal-hal ini sudah juga dilakukan saat audit ISO, dimana Pak Najib selalu bertanya terkait pemenuhannya yang dikaitkan dengan merdeka belajar.\r\n2. Audit yang dilaksanakan Primakara sudah sesuai dengan ciri audit 9 kriteria yaitu audit based risk. Perbaikan yang dilakukan dari saran Pak Najib bahwa setiap divisi/bagian/unit wajib di audit mengenai klausul 6.1. Hal ini sudah dilakukan, namun belum dituliskan saja di semua form audit. PR nya adalah memahami bagaimana audit based risk yang benar, masih terdapat beberapa kebingungan terkait cara mengaudit risk register. Dalam RKA sudah dituliskan juga mengenai pelatihan risk manajemen.\r\n3. Sarpras untuk mahasiswa berkebutuhan khusus agar segera dicicil sedikit demi sedikit, misal lerengan, braille, toilet disabilitas, dsb. Harus sudah ada perencanaannya, tidak bisa selalu bertumpu pada kebijakan penerimaan buta warna parsial. Demikian yang disampaikan oleh LLDIKTI dan Pak Najib pun mengatakan hal yang sama. Dalam penyusunan renstra sudah harus masuk sasaran mutu terkait penerimaan mahasiswa berkebutuhan khusus.'),
(23, '5437/E2/DM.00.01/2021', 'Waka I', '2021-10-21', 'Akan dilanjutkan dengan ToT oleh tim Unpad di Primakara pada tanggal 28 - 29 Oktober 2021.'),
(24, '2627/L8/KL/2021', 'Waka I', '2021-10-21', 'Koordinasi dengan PPM terkait standard MBKM'),
(25, '4039/E4/KK.01.01/2021', '2', '2021-10-31', 'Telah diikuti, terdapat penyesuaian fitur terkait dengan layanan serdos. Hal-hal yang diinformasikan terkait dengan teknis telah ditindaklanjuti pada hari yg sama.'),
(26, '6233/E2/DM.00.01/2021', 'Waka I', '2021-11-05', 'Pemahaman yang lebih baik dalam mengintegrasikan matkul MKWK'),
(27, 'B/6593/UN14/HK.07.00/2021', 'Waka I', '2021-11-05', 'Dihadiri oleh Bapak Krisna (Waka III)'),
(28, '005/1539/KS', 'Waka III', '2021-11-30', 'Mahasiswa skripsi telah diinfokan untuk mengikuti kegiatan webinar tersebut.'),
(29, '3603/LL8/KP/2021', 'Waka II', '2021-12-29', 'Data kelengkapan Serdos atas nama Pak Yudi sudah terkirim ke LLDIKTI Wilayah 8 pada tanggal 28 Desember 2021'),
(30, '228/BP/DE/XII/2021', 'PPM', '2021-12-30', 'Tidak dapat mengikuti karena keterbatasan tempat'),
(31, '009/SM/XII/2021', 'Waka II', '2022-01-05', 'Terjadi perubahan pelaksanaan menjadi tgl 30 Januari 2022'),
(32, '3716/LL8/PR/2021', 'PPM', '2022-01-05', 'Form Data Indikator Kinerja Perguruan Tinggi sudah dikirim melalui link yang disampaikan di surat.'),
(33, '420/6549/SMKN1/2021', 'Marketing', '2022-01-11', 'Guru sekolah akan mengadakan meeting guna membahas kerjasama dengan Primakara terkait program Guru Tamu dan selanjutnya akan dibahas kedua belah pihak'),
(34, '01/S.II/BID.IX/SMAK-SY/XI/2021', 'Marketing', '2022-01-11', 'Kegiatan pelatihan diterima, dibantu oleh Bayu dari marketing dan Esa dari Multimedia sebagai pembicara'),
(35, '9206/Dirut.GG/KPT-EDU/P2K/X/2021', 'Marketing', '2022-01-11', 'Diskusi telah dilaksanakan pada 21 Desember dan kerjasama dilanjutkan dalam MoU'),
(36, '114/BEM-AS/AP-DPS/CEO/I/2022', 'Waka II', '2022-01-11', 'Akan Mengkomunikasikan ke Pihak Alfa Prima mengenai detail pemakaian alatnya karena berbarengan dengan BSC di Primakara'),
(37, 'DES/0031/2021', 'Waka II', '2022-02-02', 'Pak Dewa Angga mengkomunikasikan ke Doremi School bahwa di STMIK Primakara ada kegiatan dan tidak bisa dipinjamkan'),
(38, '0167/LL8/HK.01.04/2021', 'Waka II', '2022-02-02', 'Sudah diikutinya Sosialisasi BPJS Ketenagakerjaan oleh Waka II dan HRD di Aula Bima LLDIKTI'),
(39, 'DES/0031/2022', 'Waka II', '2022-02-02', 'Telah dilaksanakan peminjaman parkir oleh Doremi School '),
(40, '2653/L8/KP/2021', 'Waka II', '2022-02-02', 'Sosialisasi sdh diikuti oleh para dosen '),
(41, '008/SM/XII/2021', 'Waka II', '2022-02-02', 'Ruangan telah disiapkan oleh Team UPT'),
(42, '003', 'Waka II', '2022-02-02', 'Sudah dilakukan diskusi dengan pihak Timedoor , dan belum ada tanggapan lagi dari Timedoor.'),
(43, '005/242/Bappeda', 'Pusat Inovasi', '2022-02-17', 'Telah mengikuti kegiatan bersama dengan para penerima manfaat PIP'),
(44, 'B/328.4/UN34/KM/2022', 'Pusat Inovasi', '2022-02-17', '1 tenant inbis yaitu Piecework telah lolos seleksi tahap II '),
(45, 'SK029/III/BEDO-2022', 'waka III', '2022-03-18', 'Sudah disampaikan ke UKM Internet Marketing, dan akan mengirimkan mahasiswa untuk berpartisipasi sejumlah 23 orang.'),
(46, '004/SM/2022', 'waka III', '2022-04-01', 'Kegiatan Sudah Diikuti'),
(47, 'B.24.005/5028/SEKRET/D.KOMINFOS', 'Waka III', '2022-04-11', 'Kegiatan sudah dihadiri.'),
(48, '005 KFB/IV/2022', 'waka III', '2022-04-11', 'Mahasiswa sudah menghadiri kegiatan Bali DIGI Fest. Total Peserta 84 orang (absensi terlampir) di hari sabtu dan 31 orang di hari kedua. Hambatan di hari kedua, mahaiswa persiapan UTS'),
(49, '1168/E2/KM.09.00/2022', 'waka III', '2022-04-11', 'Sudah mengikuti (Ni Made Estiyanti)'),
(50, 'SK029/III/BEDO-2022', 'waka III', '2022-04-18', 'Kegiatan sudah diikuti oleh UKM IM Club. Peserta sejumlah 23 orang'),
(51, '1775/E2/KM.12/2022', 'waka III', '2022-04-18', 'Rakor sudah diikuti oleh Pak Krisna, Ni Made Estiyanti, Eka Grana Aristyana Dewi .'),
(52, '0697/LL8/KM.12/2022', 'Pusat Inovasi', '2022-04-27', 'tidak bisa mengikuti kegiatan karena kapasitas Zoom dari LLDIKTI sudah penuh (100 peserta)'),
(53, '0697/LL8/KM.12/2022', 'Pusat Inovasi', '2022-04-27', 'sudah bisa masuk di pertengahan acara'),
(54, '038/BEM-FEB/II-SKj/III/2022', 'waka III', '2022-05-13', 'lomba diikuti oleh ukm multimedia. 1 untuk lomb short film dan 1 lomba poster'),
(55, '001/SPM/IV/2022', 'waka III', '2022-05-13', 'kegiatan diikuti oleh ukm internet marketing a.n Ni Luh Putu nopelia dan Ni Nyoman Pudak Sari'),
(56, '0876/LL8/KM.12/2022', 'Pusat Inovasi', '2022-05-30', 'Akan menyiapkan tenant yang akan dikirim mengikuti kegiatan'),
(57, '002/PMS/DPS/V/2022', 'Waka II', '2022-05-31', ''),
(58, 'AOI/10/VEN/2022', 'Waka II', '2022-05-31', 'Setelah dihubungi pemohon sampaikan acara dibatalkan di Primakara'),
(59, 'B-1097/DIR/UMS/2022', 'Waka II', '2022-05-31', 'Surat pesanan iklan sudah dikirimkan ke BPD Bali melalui Bu Agung Indri tanggal 27 Mei 2022'),
(60, '2022-AG-04-057', 'waka III', '2022-06-29', 'Sudah dikoordinasikan dengan UKM Multimedia dan Bagian Multimedia (Esa) dan sudah siap berjalan pelaksanaannya hariJumat tgl 1 Juli'),
(61, 'B.24.046/8890/SANDI/D.KOMINFOS', '2', '2022-07-12', 'Pak Krisna dan pak Tiawan bersedia menjadi narasumber pada kegiatan tersebut'),
(62, '010/K.I/SMK.AF/XII/2021', 'Marketing', '2022-07-19', 'sudah berjalan kegiatan kunjungan '),
(63, '4/SM/2022', 'Waka II', '2022-08-01', 'Ada 2 dosen LB yang ikut daftar A.A Sandatya Widhiyanti dan Ni Putu Erviani Astari'),
(64, 'B/178/UN14.4.B/DL.01/2022', 'Waka II', '2022-08-01', 'Tidak ada yang respon dari para Dosen'),
(65, '003/SPPG/VII/22', 'Waka II', '2022-08-03', 'Sudah dikomunikasikan sebelumnya dengan Pihak Penyelenggara kegiatan dan sdh dijadwalkan oleh UPT'),
(66, '0080/SP/AP-DPS/AKD/II/XII/2021', '2', '2022-08-04', 'Sudah ditindaklanjuti'),
(67, '04/BW-KTH/II/2022', '2', '2022-08-04', 'Sudah terlaksana audiensi'),
(68, '001/SM/I/2022', 'waka II', '2022-08-04', 'Terlaksana'),
(69, '002/SMKHI/I/2022', 'waka II', '2022-08-04', 'Terlaksana'),
(70, '001/SM/MEI/2022', 'Waka III', '2022-08-04', 'Tidak ada mahasiswa yang mendaftar'),
(71, '001/SM/VI/2022', 'Waka III', '2022-08-04', 'Terlaksana, mahasiswa mengikuti'),
(72, '004/IFest/HIMAFORKA/II/2022', 'Waka III', '2022-08-04', 'Tidak terlaksana, Mahasiswa belum siap mengikuti dan sudah kooridnasi dengan pembina'),
(73, '005/053/KS', 'Waka III', '2022-08-04', 'Terlaksana'),
(74, '005/413/KS', 'Waka III', '2022-08-04', 'Terlaksana'),
(75, '02/PPR/2021', 'Waka III', '2022-08-04', 'Tidak dapat mengikuti'),
(76, '005/701/Tapem', 'Waka III', '2022-08-04', 'Terlaksana'),
(77, '09/UN48.22/UPT-PKKM/2022', 'Waka III', '2022-08-04', 'Terlaksana dan mengikuti'),
(78, '086/NTSC2022/IV/IPBI', 'Waka III', '2022-08-04', 'Tidak terlaksana, mahasiswa belum ada yang bisa mengikuti'),
(79, '0742/LL8/WA.01.04/2022', 'Waka III', '2022-08-04', 'Terlaksana, proses pengisian tracer study'),
(80, '001', 'Waka III', '2022-08-04', 'Terlaksana, sudah ada yang apply'),
(81, '002/Panitia-AnalgesiaSports/VI/2022', 'Waka III', '2022-08-04', 'Tidak mengikuti, UKM fokus mengikuti futsal di institusi lain'),
(82, '002/PemilihanTTD2022/SemetonTTD/XI/2021', 'Waka III', '2022-08-04', 'Tidak ada yang mengikuti'),
(83, '002/UKM.Futsal/BEM.ITBSTIKOM/V/2022', 'Waka III', '2022-08-04', 'Terlaksana'),
(84, '005', 'Waka III', '2022-08-04', 'Terlaksana'),
(85, '005/319/Kec.Denut', 'Waka III', '2022-08-04', 'Terlaksana'),
(86, '005/634/KS', 'Waka III', '2022-08-04', 'Terlaksana'),
(87, '007/B/PPKAB-XI/III/2022', 'Waka III', '2022-08-04', 'Tidak terlaksana\r\n'),
(88, '007/SM/II/2022', 'Waka III', '2022-08-04', 'Terlaksana'),
(89, '009/03/PARAS-ICT-VII-STIKI/I/2022', 'Waka III', '2022-08-04', 'Tidak terlaksana'),
(90, '010/SM/XII/2021', 'Waka III', '2022-08-04', 'Terlaksana'),
(91, '011/HIMAPRODI.SK/BEM.ITBSTIKOM/V/2022', 'Waka III', '2022-08-04', 'Lomba dibatalkan'),
(92, '011/UKM.PROGRESS/BEM.ITBSTIKOM/IX/2021', 'Waka III', '2022-08-04', 'Tidak terlaksana'),
(93, '021/B/ADS/UNAIR/IV/2022', 'Waka III', '2022-08-04', 'Kegiatan dibatalkan'),
(94, '024/SM/V/2022', 'Waka III', '2022-08-04', 'Terlaksana'),
(95, '03/KKT/V.11/2022', 'Waka III', '2022-08-04', 'Kerjasama diserahkan ke pusinov'),
(96, '037/BEN/V/2022', 'Waka III', '2022-08-04', 'Tidak sesuai dengan skema magang Primakara'),
(97, '10/SM/II/2022', 'Waka III', '2022-08-04', 'Terlaksana\r\n'),
(98, '10/UW/BEM-FH/PanPel-DekanCupX/VI/2022', 'Waka III', '2022-08-04', 'Tidak terlaksana'),
(99, '10/V/DG-AP/DPS/2022', 'Waka III', '2022-08-04', 'Tidak terlaksanan karena waktu mepet'),
(100, '1269.H/KOMINFO/DJAI/HM.01.01/12/2021', 'Waka III', '2022-08-04', 'Terlaksana'),
(101, '18/SM/V/2022', 'Waka III', '2022-08-04', 'Terlaksana'),
(102, '2022.AG-02-023', 'Waka III', '2022-08-04', 'Terlaksana'),
(103, '24/667/Dpr/Srt/B', 'Waka III', '2022-08-04', 'Terlaksana'),
(104, '405/APTISI WILL. VII/09/2021', 'Waka III', '2022-08-04', 'Terlaksana'),
(105, '547/E/Pan.Intergalatic/BEM FMIPA//UNESA/IX/2021', 'Waka III', '2022-08-04', 'Tidak terlaksana'),
(106, 'B.1037.e-BIS/DPS/12/2021', 'Waka III', '2022-08-04', 'Terlaksana'),
(107, 'B.24.005/4788/IKP/D.KOMINFOS', 'Waka III', '2022-08-04', 'Terlaksana'),
(108, 'BAL/ADM/551/10/2019', 'Waka III', '2022-08-04', 'Terlaksana'),
(109, 'No. BAL/SVCC/322/5/22', 'Waka III', '2022-08-04', 'Terlaksana'),
(110, '074/UKM KEWIRAUSAHAAN/II-SPP/X/2021', 'Pusat Inovasi', '2022-08-04', 'Tidak terlaksana, tenant tidak ada yang bisa mengikuti'),
(111, 'B/497/BPSDMI/BDI-Denpasar/IV/2022', 'Pusat Inovasi', '2022-08-04', 'Terlaksana, tenant timbangin mengikuti'),
(112, '016/SPP/JCI-BD/OUT/V/2022', 'Pusat Inovasi', '2022-08-04', 'Terlaksana'),
(113, '124/SM/V/2022', 'Pusat Inovasi', '2022-08-04', 'Terlaksana'),
(114, '517.1 / 916 / DISKOPUKMP', 'Pusat Inovasi', '2022-08-04', 'Terlaksana'),
(115, '013/SM/VI/2022', 'Pusat Inovasi', '2022-08-04', 'Terlaksana'),
(116, '0725//E1/PP.01.11/2022', 'Pusat Inovasi', '2022-08-04', 'Terlaksana'),
(117, '1157/PANPEL/DEBAT/FEBP-UNHI/XII/2021', 'Pusat Inovasi', '2022-08-04', 'Terlaksana'),
(118, '1634/UN48.16/LT/2021', 'Pusat Inovasi', '2022-08-04', 'Terlaksana'),
(119, '632/II.10/TVRI/2021', 'Pusat Inovasi', '2022-08-04', 'Terlaksana'),
(120, 'B.25.518/1254/PK/Diskop UKM', 'Pusat Inovasi', '2022-08-04', 'Terlaksana'),
(121, '031/BUB-LP2SDM/VII/2022', 'PPM', '2022-08-04', 'Tidak terlaksana'),
(122, '0427/LL8/PR.00.01/2022', 'PPM', '2022-08-04', 'Terlaksana'),
(123, '017/SM/2022', 'Marketing', '2022-08-04', 'Terlaksana'),
(124, '882/PGRI2Bdg/B.15/2022', 'Marketing', '2022-08-04', 'Terlaksana'),
(125, '086 /K.I/SMK.AF/VII/2022', 'Marketing', '2022-08-04', 'Tidak terlaksana'),
(126, '891/PGRI2BDG/U.6/2022', 'Marketing', '2022-08-04', 'Terlaksana'),
(127, '2021-AG-01-003', 'Marketing', '2022-08-04', 'Terlaksana'),
(128, '421.7/30/418.27/SMK.Br.Kp/I/2022', 'Marketing', '2022-08-04', 'Terlaksana'),
(129, '559/421.3/SMK-ITB/X/2021', 'Marketing', '2022-08-04', 'Terlaksana'),
(130, '001/SPN/BAAK/XI/2021', 'Waka I', '2022-08-04', 'terlaksana'),
(131, '0042/LL8/KB.01.01/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(132, '007/ST/2021', 'Waka I', '2022-08-04', 'terlaksana'),
(133, '009/SPN/BAAK/III/2022', 'Waka I', '2022-08-04', 'terlaksana\r\n'),
(134, '0106/LL8/KB.01.01/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(135, '011/SPN/BAAK/IV/2022', 'Waka I', '2022-08-04', 'terlaksana'),
(136, '014/IAI-JTM/KRAIX/IV/2022', 'Waka I', '2022-08-04', 'terlaksana'),
(137, '015/SPN/BAAK/IV/2022', 'Waka I', '2022-08-04', 'terlaksana'),
(138, '0158/E/DI.00.01/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(139, '0161/LL8/AK.02.01/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(140, '017/SPN/BAAK/X/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(141, '022/SPN/BAAK/IV/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(142, '0275/E2/BS.01.01/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(143, '0704/LL8/TU.00.01/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(144, '1051/FEBP/UNHI/XII/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(145, '114/SGN-OUT/LYRA/06/22', 'Waka I', '2022-08-04', 'Terlaksana'),
(146, '13427/E1/DI.00.01/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(147, '1355/E3.1/PM.00.03/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(148, '13676/E1/DI.04.02/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(149, '13751/E1/DI.04.02/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(150, '1457/SPP/SVM/XII/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(151, '14726/E1/DI.04.02/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(152, '1686/UND/SVM/I/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(153, '2119/E2/BS.01.01/2022', 'Waka I', '2022-08-04', 'terlaksana'),
(154, '2422/E2.1/DI.00.01/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(155, '2446/UND/SVM/V/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(156, '2541/E2/PB.03.00/2022 ', 'Waka I', '2022-08-04', 'Terlaksana'),
(157, '3214/LL8/KM/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(158, '6694/E2/BS.01.01/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(159, '6952/E2/BS.01.01/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(160, 'B-759/Un.10.8/D/DA.04.09/03/2022', 'Waka I', '2022-08-04', 'Terlaksana'),
(161, 'S-771/WJP.17/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(162, 'S-84/WPJ.17/2021', 'Waka I', '2022-08-04', 'Terlaksana'),
(163, '002/SPPG/VII/22', 'Waka II', '2022-08-15', 'Pelaksanaannya sudah berjalan dengan baik'),
(164, 'T.44.003/22355/RT/B.UMPRO', 'Waka II', '2022-08-15', 'Sudah dilakukan Pemasangan Hiasan Bendera Merah Putih dan spanduk ucapan di Kampus'),
(165, '1808/LL8/HM.00.08/2022', 'Waka II', '2022-08-16', 'Sudah dikomunikasikan ke Pak Gung Redi untuk mengikuti Upacara Bendera di LLDIKTI'),
(166, ' 0789/E5.5/AL.04/2022', 'Pusat Inovasi', '2022-08-23', 'data sinta sudah dimutahirkan oleh LPPM,,'),
(167, 'EDUFAIR/003/XII/2022', 'Marketing', '2022-08-29', 'Sudah terselenggara Edufair di SMAN 8 Denpasar dengan target sosialisasi di SMAN 8 Denpasar '),
(168, '2070/LL8/KM.00/2022', 'Waka II', '2022-09-02', 'Tidak dapat mengikuti Workshop Beasiswa PMDSU karena  PT tdk menyelenggarakan S2 \r\n atau S3 '),
(169, '1985/LL8/LP.00.01/2022', 'waka III', '2022-09-04', 'sudah di hadiri oleh waka III'),
(170, '1804/LL8/TU.02.03/2022', 'waka III', '2022-09-04', 'terlaksana'),
(171, ' 5391/E2/DT.01.01/2022 ', 'waka III', '2022-09-04', 'sudah diikuti oleh kemahasiswaan'),
(172, '2123/LL8/HM.00.03/2022', 'Waka II', '2022-09-14', 'Sudah dikomunikasikan ke Marketing dan Multimedia ..dan sedang persiapan pembuatan oleh Esa dan Pak Bayu'),
(173, '004/SPPG/VIII/22', 'Waka II', '2022-09-14', 'Penawaran Harga sewa ruangan sudah dikirimkan ke Bit House melalui Mbak Vina  Septiari , namun belum ada jawaban dari Bit House'),
(174, '003/SM/VII/2022', 'Waka II', '2022-09-14', 'Sudah dilakukan komunikasi namun belum ada jadwal yang Pas antara Primakara dan yang bersangkutan...masih mencari jadwal yang pas.'),
(175, '001/SM/VIII/2022', 'Waka II', '2022-09-14', 'Sudah diikuti oleh HRD ( Bu Ana)'),
(176, '3500/E4/DT.04.03/2022', 'Waka II', '2022-09-21', 'Belum ada Dosen yang memenuhi persyaratan diajukan sebagai dosen sebagai Academic Leader yaitu Dosen S3 dengan Jabatan akademik  Lektor Kepala.'),
(177, 'YCPW/2022/09/12/ARW/01', 'Waka II', '2022-09-21', 'Sudah dikomunikasikan dengan Koordinator YKIP bahwa siap membantu dan Sosialisasi dari Marketing Primakara dimasukkan ke acara nya'),
(178, 'B.21.660/4324/SEKRET/DKLH', 'Waka II', '2022-10-06', 'Sudah dilaksanakan kegiatan bersih-bersih di lingkungan kampus tgl 30 September pukul 07.00 oleh staf dan dosen . dan sdh upload laporan dan Foto dokumentasi  kegiatan ke link dimaksud'),
(179, '075/IX/CST/EDU/2022', 'Waka II', '2022-10-06', 'Melakukan diskusi dan sharing dari CBN Jakarta mengenai Education program CBN Indonesia, (sharing Knowledge, Internship Program, career, Research and bussiness Development), mengenai clouds, dan ISP pada tgl 6 Okt 2022 jam 10.00 wita'),
(180, '2977/LL8/HM.03.01/2022', 'PPM', '2022-10-21', 'Sudah diisi oleh dosen dan mahasiswa. Serta, untuk perwakilan perguruan tinggi diisi oleh Bu Cahya dan Pak Bayu sebagai perwakilan terkait pengelolaan web/media sosial.'),
(181, '3533/LL8/TU.02.03/2022', 'Waka II', '2022-11-10', 'Dosen DPK sudah diinfokan untuk mengikuti Upacara Hari Pahlawan di LLDIKTI oleh HRD'),
(182, '160/IDBBALI/KMH/X/2022', 'Waka II', '2022-11-10', 'Sudah dikomunikasikan ke Komunitas Lycan Basketball IDB dan sudah memanfaatkan lapangan pada hari Sabtu jam 17.00 sd jam 19.00'),
(183, 'UM.008/2416/PTP-II/KEMPAR/2022', 'Waka II', '2022-11-10', 'Telah dikomunikasikan oleh HRD dan memintakan soft copy agar memudahkan mengirimkan kepada para Dosen...,namun belum ada respon dari yang bersangkutan.'),
(184, '0038/SP/AP-DPS/KC/II/XI/2022', 'Waka II', '2022-11-22', 'Kegiatan berjalan dengan baik dan disiplin'),
(185, '2311-2337/UN.8.11/PP/2022', 'Waka II', '2022-11-22', 'Tidak ada info pendaftaran dari Team Waka I untuk mengikuti pelatihan tersebut'),
(186, '451/PERMOHONAN/BM-HOKI/DPS/IX/2022', 'Waka II', '2022-11-22', 'Kita akan menerima dari Bank HOKI pada Rabu 23 Nopember 2022'),
(187, '02/1045-3/18041', 'Waka II', '2023-01-27', 'Sudah dilakukan Pertemuan dengan BSI dan Kabag. Keuangan ,dan Waka II pada tanggal 27 Januari 2023 dan akan diajukan proposal pendanaan ke Primakara '),
(188, '108/A/Panpel-ELCCO/HME/FT-UNUD/I/2023', 'waka III', '2023-02-21', 'Mendaftar 1 Tim untuk lomba Video'),
(189, '002/INSTIKI.HIMA-TI/SPm.03/12/2022', 'waka III', '2023-02-24', 'Dikirim 1 mahasiswa untuk mengikuti lomba Web Design atas nama Wahyu Purnama'),
(190, '001/COMVET-TCL/SLO/II/2023', 'waka III', '2023-03-09', 'UKM telah mengikuti kegiatan, namun belum memperoleh Juara'),
(191, '002/INSTIKI.HIMA-TI/SPm.03/12/2022', 'waka III', '2023-03-09', 'Mahasiswa atas nama Wahyu Purnama meraih Juara 1 Web Design kategori Mahasiswa'),
(192, 'B-039/05300/VS.330/01/2023', 'Waka II', '2023-04-17', 'Form sudah diisi dan dikirim ke BPS tgl 10 April 2023'),
(193, '0727/LL8/KP.08.00/2023', 'Waka II', '2023-04-17', 'Masing masing dosen sdh melakukan update data dosen pada aplikasi sister dan sudah divalidasi HRD'),
(194, '0117/HRGS Corp/Doc/PTBCE/III/2023', 'waka III', '2023-05-02', 'Sudah berdiskusi dan melaporkan hasil diskusi ke Mega (sekretariatan), dari KUIK sudah ada MoU dan sudah pernah melakukan kegiatan bersama dg PCC & Inbis yaitu seminar online'),
(195, '25/554/Dpr/Srt/B', 'Waka II', '2023-05-16', 'Waka II ditunjuk untuk mewakili undangan ke BI '),
(196, '03/BbH/II/2023', '2', '2023-06-07', 'Tidak mengikuti'),
(197, 'B.20.556 /680/PKSDM/DISPAR', '2', '2023-06-07', 'Terlaksana'),
(198, '3022/UND/SVM/II/2023', '2', '2023-06-07', 'Diikuti'),
(199, 'B.32.027/429/UPTD. RUMAH KREATIF/DISPERINDAG', '2', '2023-06-07', 'Berita sudah diinformasikan ke mahasiswa dan alumni'),
(200, '0630/LL8/KM/2023', '2', '2023-06-07', 'Survey telah diisi'),
(201, '0629/LL8/KM/2023', '2', '2023-06-07', 'Survey sudah diisi'),
(202, '005/IRDH/II/2023', '2', '2023-06-07', 'Tidak mengikuti'),
(203, '895.3/2356/SETDA/BALITBANG', '2', '2023-06-07', 'Mengikuti Forum Kelitbangan'),
(204, '0682/SDM/PBK/2023', '2', '2023-06-07', 'Terlaksana'),
(205, 'W.20.UM.01.01-1906', '2', '2023-06-07', 'HKI mengikuti kegiatan'),
(206, '005 / 296 /DKIS', '2', '2023-06-07', 'Terlaksana'),
(207, '004/SM/III/2023', '2', '2023-06-07', 'Waka I menghadiri gathering'),
(208, 'BAL/453/4/2023', '2', '2023-06-07', 'KUIK, UKM english club  dan dance mengikuti kegiatan'),
(209, '0988/LL8/KM/2023', '2', '2023-06-07', 'Waka I mengikuti kegiatan'),
(210, '005 /361/DKIS', '2', '2023-06-07', 'KUIK dapat mengikuti'),
(211, '1193/LL8/KM/2023', '2', '2023-06-07', 'Terlaksana, Kaprodi SIA dan IF mengikuti kegiatan'),
(212, 'B.17.005/2772/BID.I/BRIDA', '2', '2023-06-07', 'Kegiatan diikuti oleh LPPM'),
(213, '800/506/101.6.10.15/2023', '2', '2023-06-07', 'Sudah terlaksananya kunjungan industri'),
(214, '0038/NEX-IDN/MAY/2023', '2', '2023-06-07', 'Inbis telah mengikuti kegiatan'),
(215, '2000/LL8/KS.03.00/2023', '2', '2023-06-07', 'Kegiatan telah diikuti PCC dan KUIK'),
(216, '1542/LL8/DT.02.04/2023', 'PPM', '2023-06-13', 'Belum ada pengumuman hingga kini'),
(217, '15/UW/BEM-FH/PanPel-DekanCupXI/V/2023', 'waka III', '2023-06-16', 'Diikuti oleh 2 tim'),
(218, 'B.24.045/11778/IKP/D.KOMINFOS', '2', '2023-07-03', 'Selesai terfollow up dengan baik'),
(219, '3936/E3/OT.00.00/2021', '2', '2023-07-04', 'test'),
(221, '004', '2', '2023-07-04', 'tst'),
(222, '87', 'sdm2', '2023-07-04', 'tset');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_sie`
--

CREATE TABLE `sip_sie` (
  `kodeSie` int(11) NOT NULL,
  `kodeBidang` int(11) NOT NULL,
  `namaSie` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_sie`
--

INSERT INTO `sip_sie` (`kodeSie`, `kodeBidang`, `namaSie`) VALUES
(10, 2, 'Sie B'),
(9, 3, 'Sie A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_sub_berkas`
--

CREATE TABLE `sip_sub_berkas` (
  `idsub` int(11) NOT NULL,
  `namasub` varchar(100) DEFAULT NULL,
  `kodeberkas` int(11) DEFAULT NULL,
  `kodesie` int(11) DEFAULT NULL,
  `nosub` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sip_sub_berkas`
--

INSERT INTO `sip_sub_berkas` (`idsub`, `namasub`, `kodeberkas`, `kodesie`, `nosub`) VALUES
(7, 'Pajak Hotel', 10, 9, '01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_suratkeluar`
--

CREATE TABLE `sip_suratkeluar` (
  `idSurat` int(11) NOT NULL,
  `noSuratKeluar` varchar(50) NOT NULL,
  `jenisSurat` varchar(50) NOT NULL,
  `perihal` varchar(50) NOT NULL,
  `userInput` char(18) NOT NULL,
  `kodeBidang` int(11) NOT NULL,
  `fileSurat` longtext NOT NULL,
  `tglInput` date NOT NULL,
  `tujuan` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_suratkeluar`
--

INSERT INTO `sip_suratkeluar` (`idSurat`, `noSuratKeluar`, `jenisSurat`, `perihal`, `userInput`, `kodeBidang`, `fileSurat`, `tglInput`, `tujuan`) VALUES
(25, '003/SPN/IF/V/2021', 'Surat Pengantar', 'Surat Rekomendasi Pertukaran Pelajar', 'Prodi TI', 23, '3864-img011.pdf', '2021-11-04', '-'),
(24, '002/SPN/IF/V/2021', 'Surat Pengantar', 'Surat Rekomendasi Pertukaran Pelajar', 'Prodi TI', 23, '6711-img010.pdf', '2021-11-04', '-'),
(23, '001/SPN/IF/V/2021', 'Surat Pengantar', 'Surat Rekomendasi Pertukaran Pelajar', 'Prodi TI', 23, '3263-img009.pdf', '2021-11-04', '-'),
(21, '001/SPN/KTUA/IX/2021', 'Surat Pengantar', 'Presensi Dosen PNS Dpk Bulan Agustus 2021', '2', 2, '1389-SURAT BPJS.pdf', '2021-09-08', 'LLDIKTI Wilayah VIII'),
(26, '/001/SPN/SIA/V/2021 //', 'Surat Pengantar', 'Surat Rekomendasi Pertukaran Pelajar', 'Prodi SIA', 18, '8585-Surat Rekomendasi Farikha.pdf', '2021-11-04', '-'),
(27, '/002/SPN/SIA/V/2021/', 'Surat Pengantar', 'Surat Rekomendasi Pertukaran Pelajar', 'Prodi SIA', 18, '2080-Surat Rekomendasi Jasmine.pdf', '2021-11-04', '-'),
(28, '/003/SPN/SIA/V/2021 /', 'Surat Pengantar', 'Surat Rekomendasi Pertukaran Pelajar', 'Prodi SIA', 18, '5769-Surat Rekomendasi Reynaldo.pdf', '2021-11-04', '-'),
(29, '00123', 'Surat Pengumuman', 'sdm', 'maha', 90, '9253-uas_visualisasi.pdf', '2023-06-19', 'sdm'),
(30, '90000', 'Surat Pengantar', 'test', 'maha', 2, '8346-yudix.pdf', '2023-06-20', 'Prodi TI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_suratmasuk`
--

CREATE TABLE `sip_suratmasuk` (
  `idSurat` int(11) NOT NULL,
  `noSurat` varchar(50) NOT NULL,
  `tglSurat` date NOT NULL,
  `jenisSurat` varchar(50) NOT NULL,
  `perihal` varchar(50) NOT NULL,
  `asalSurat` varchar(50) NOT NULL,
  `sifatInstruksi` varchar(50) NOT NULL,
  `fileSurat` varchar(255) NOT NULL,
  `userInput` char(18) NOT NULL,
  `tglInput` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_suratmasuk`
--

INSERT INTO `sip_suratmasuk` (`idSurat`, `noSurat`, `tglSurat`, `jenisSurat`, `perihal`, `asalSurat`, `sifatInstruksi`, `fileSurat`, `userInput`, `tglInput`) VALUES
(44, '001', '2021-09-23', 'Surat Permohonan', 'Permohonan Kerjasama Program Magang Mandhava', 'PT.Madhava Kreasi Indonesia (Madhava Enterprises)', '', '583-z.pdf', '2', '2021-09-23'),
(42, '029/MK.01/GP-331/IX/2021', '2021-09-21', 'Surat Permohonan', 'Permohonan Kerjasama Program Magang Telkomsel', 'Telkomsel', 'Penting', '3790-SURAT PERMOHONAN MAHASISWA MAGANG untuk STMIK PRIMAKARA.pdf', '2', '2021-09-21'),
(43, '5437/E2/DM.00.01/2021', '2021-09-21', 'Surat Undangan', 'Workshop Pedoman Pelaksanaan Mata Kuliah Wajib pad', 'Kemendikbud-ristek', 'Penting', '1828-SU MKWK 25-26 Sept 2021.pdf', '2', '2021-09-21'),
(40, 'BI.31.420/76560/DIKPORA', '2021-09-21', 'Pemberitahuan', 'Pelaksanaan Pembelajaran Pada Masa Pandemi Covid-1', 'Gubernur Bali ', 'Penting', '2339-SE Pelaksanaan Pembelajaran Pada Masa Pandemi Covid-19 Di Prov Bali.pdf', '2', '2021-09-21'),
(39, '5220/E2/PB.04.04/2021', '2021-09-17', 'Surat Undangan', ' Sosialisasi Penggunaan Aplikasi PIN dan SIVIL Reg', 'Kemendikbud-ristek', 'Penting', '956-Surat Undangan Eksternal Sosialisasi Reg III.pdf', '2', '2021-09-17'),
(38, '0', '2021-09-16', 'Surat Edaran', 'Penyelenggaraan Pembelajaran Tatap Muka Tahun Akad', 'Kemendikbud-ristek', 'Penting', '2652-Surat Edaran Pembelajaran Tatap Muka Tahun Akademik 2021_2022 .pdf', '2', '2021-09-16'),
(37, '2375/LL8/KL/2021', '2021-09-14', 'Pemberitahuan Sosialisasi', 'Sosialisasi ISK Peringkat Akreditasi dan IPEPA', 'LLDIKTI 8', 'Penting', '4996-2375.KL.14.9.2021. Pelaksananan Sosialisasi ISK dan Pemantauan Tahun 2021--LLDIKTI Wilayah VIII.pdf', '2', '2021-09-15'),
(36, '3936/E3/OT.00.00/2021', '2021-08-31', 'Pemberitahuan', 'Penerimaan Tahap II Usul Akselerasi Program Pengga', 'Kemendikbudristek', 'Penting', '6948-135345_1630420671 Penerimaan Tahap II usul Akselerasi Program Penggabungan dan Penyatuan PTS (1).pdf', '2', '2021-09-15'),
(45, '3041/PD.04/D3/2021', '2021-09-20', 'Surat Undangan', 'Undangan Menghadiri Peluncuran Program Mahasiswa P', 'BKKBN', 'Penting', '7159-Undangan PTMahasiswa Penting.pdf', '2', '2021-09-23'),
(46, '002', '2021-09-21', 'Surat Undangan', 'Undangan Peluncuran Program INKURI Bali (Pak Jep)', 'Pratisara Bumi Foundation', 'Penting', '7100-Primakara - Grand Launch Invitation (IND) (1).pdf', '2', '2021-09-23'),
(47, '003', '2021-09-23', 'Penawaran Kerja Sama ', 'Kerjasama dalam penyediaan fasilitas', 'PT Timedoor Indonesia (Timedoor Coding Academy)', 'Penting', '7186-Timedoor Coding Academy - Primakara Proposal.pdf', '2', '2021-09-23'),
(48, '2406/LL8/PR/2021', '2021-09-27', 'Surat Pemberitahuan', 'Pemetaan Indikator Kinerja di Perguruan Tinggi Swa', 'LLDIKTI 8', 'Penting', '6093-Surat permohonan data PK ke PTS (TW III) 2.pdf', '2', '2021-09-27'),
(49, '1634/UN48.16/LT/2021', '2021-09-27', 'Surat Undangan', 'The 4th International Conference on Innovatif Rese', 'Universitas Pendidikan Ganesha ', 'Penting', '2152-SURAT-STMIK Primakara.pdf', '2', '2021-09-27'),
(50, '011/UKM.PROGRESS/BEM.ITBSTIKOM/IX/2021', '2021-09-27', 'Surat Undangan', 'Undangan Mengikuti Lomba Infinity 2021 ', 'ITB Stikom Bali', 'Penting', '5551-Lomba Stikom.pdf', '2', '2021-09-27'),
(51, '004', '2021-09-29', 'Surat Undangan', 'Sosialisasi dan Anugerah Humas Social Media Diktir', 'LLDIKTI 8', 'Penting', '3717-Rev4-BUKU-PANDUAN-AHD-2021-2.pdf', '2', '2021-09-29'),
(52, '005/634/KS', '2021-09-27', 'Surat Undangan', 'Online Zoom Masterclass Animation Skill Building ', 'Pemerintah Kota Denpasar', 'Penting', '814-Denpasar Perth.pdf', '2', '2021-10-02'),
(53, '005', '2021-10-04', 'Poster Lowongan Kerja dan Magang', 'Lowongan Kerja dan Magang PT Pragma Informatika Ba', 'PT Pragma Informatika', 'Penting', '2889-Loker PT Pragma.pdf', '2', '2021-10-04'),
(54, '547/E/Pan.Intergalatic/BEM FMIPA//UNESA/IX/2021', '2021-09-14', 'Surat Permohonan', 'Permohonan Delegasi dan Publikasi dalam Kompetisi ', 'Universitas Negeri Surabaya', 'Penting', '6132-Surat Permohonan Pengiriman Delegasi dan Publikasi (1).pdf', '2', '2021-10-04'),
(55, '405/APTISI WILL. VII/09/2021', '2021-09-09', 'Surat Undangan', 'Lomba Kreatifitas Mahasiswa (LO Kreatif) 2021', 'Aptisi Wilayah VII Jawa Timur', 'Penting', '4359-415_Srt Pengantar Und PTS_Lokreatif 2021.pdf', '2', '2021-10-04'),
(56, '2632/LL8/KM/2021', '2021-10-07', 'Surat Undangan', 'Undangan Workshop Sistem Penjaminan Mutu Internal ', 'LLDIKTI 8', 'Penting', '583-undangan workshop spmi(1).pdf', '2', '2021-10-08'),
(57, '2627/L8/KL/2021', '2021-10-05', 'Surat Undangan', 'Undangan Workshop Pendirian Perguruan Tinggi, Peru', 'LLDIKTI 8', 'Penting', '1221-Undangan Workshop Pendirian.pdf', '2', '2021-10-08'),
(58, '2653/L8/KP/2021', '2021-10-08', 'Surat Undangan', 'Sosialisasi Tugas Belajar Bagi Tenaga Pendidik', 'LLDIKTI 8', 'Penting', '4866-Scan surat undangan sosialisasi tubel Bali 2021.pdf', '2', '2021-10-09'),
(59, '10/UNWAR/LPM/Pan.SemNas/PD-11/2021', '2021-10-04', 'Surat Undangan', 'Seminar Nasional dengan tema PKM Berbasis Ekowisat', 'Universitas Warmadewa', 'Penting', '448-Undangan SemNas STMIK Primakara.pdf', '2', '2021-10-09'),
(60, '006', '2021-09-14', 'Surat Undangan', 'Undangan Mengikuti Pelatihan Berbayar P3i. Terdapa', 'Pusat Pengembangan Kajian Profesi Indonesia', 'Penting', '196-Pelatihan P3i.pdf', '2', '2021-10-09'),
(61, '632/II.10/TVRI/2021', '2021-10-11', 'Surat Undangan', 'Marketing Gathering TVRI Stasiun Bali', 'TVRI Bali', 'Penting', '1692-Undangan TVRI.pdf', '2', '2021-10-14'),
(62, 'B/6593/UN14/HK.07.00/2021', '2021-10-15', 'Surat Undangan', 'Pertemuan Forum Pimpinan Perguruan Tinggi Bali', 'Universitas Udayana', 'Penting', '8527-Surat Undangan Forum Pimpinan PT.pdf', '2', '2021-10-16'),
(63, '10452/E1/HM.01.00/2021', '2021-10-14', 'Permohonan Dukungan ', 'Dukungan untuk Like, komentar  pada video pendek D', 'Kemendikbud-ristek', 'Penting', '1645-Permohonan Dukungan.pdf', '2', '2021-10-16'),
(64, '02/PPR/2021', '2021-10-15', 'Surat Undangan', 'Persembahyangan Di Pura LLDIKTI Wil VIII', 'LLDIKTI 8', 'Penting', '2780-piodalan LLDIKTI wilayah VIII.pdf', '2', '2021-10-19'),
(65, '559/421.3/SMK-ITB/X/2021', '2021-10-21', 'Surat Permohonan', 'Permohonan Kunjungan Kerja Industri', 'SMK TI Benindo Kedungjati ', 'Penting', '3345-SMK TI Benindo.pdf', '2', '2021-10-25'),
(66, '6233/E2/DM.00.01/2021', '2021-10-21', 'Surat Pengantar', 'Memfasilitasi tempat kegiatan workshop/bimbingan t', 'Kemendikbud-ristek', 'Penting', '3877-surat pengantar STMIK Primakara bali.pdf', '2', '2021-10-26'),
(67, '009/HL.369/DI/X/2021', '2021-10-20', 'Surat Permohonan Partisipasi Perserta dan Presente', 'Webinar Forum Perspektif Kesehatan Masyarakat 2021', 'Denpasar Institute Lembaga Riset & Pengembangan SD', 'Penting', '9600-Surat Undangan PTN-PTS Seminar Nasional.pdf', '2', '2021-10-26'),
(68, 'B.25.518/1254/PK/Diskop UKM', '2021-10-14', 'Surat Pengantar', 'Pembukaan Program Inkubator Wirausaha Tahun 2021', 'Pemrov Bali Dinas Koperasi, Usaha Kecil dan Meneng', 'Penting', '627-Inkubator Wirausaha 2022 perguruan tinggi TTE.pdf', '2', '2021-10-26'),
(69, '005/701/Tapem', '2021-10-27', 'Surat Undangan', 'Penilaian Prestasi dan Wawancara Kandidat Wira San', 'Pemrov Denpasar Sekretariat Daerah ', 'Penting', '6320-Scanned Documents.pdf', '2', '2021-10-28'),
(70, '4039/E4/KK.01.01/2021', '2021-10-25', 'Surat Undangan', 'Sosialisasi Panitia Sertifikasi Dosen Perguruan Ti', 'Kemendikbud-ristek', 'Penting', '8014-R1 [UND] Sos PSD PTU 169351_1635171131.pdf', '2', '2021-10-28'),
(71, '007', '2021-11-04', 'Surat Undangan', 'Seminar Nasional Energi, Telekomunikasi, dan Otoma', 'ITENAS Bandung', 'Penting', '5709-Sneto Makalah.pdf', '2', '2021-11-04'),
(72, '074/UKM KEWIRAUSAHAAN/II-SPP/X/2021', '2021-10-27', 'Surat Permohonan', 'Partisipasi dalam Lomba ', 'Universitas Pendidikan Nasional (Undiknas)', 'Penting', '8724-Perserta Lomba Undiknas069.pdf', '2', '2021-11-04'),
(73, '70/APM/X/2021', '2021-10-01', 'Surat Permohonan Dukungan dan Sponsor', 'Permohonan Dukungan dan Sponsor acara Pemilihan Du', 'Yayasan Abhiya Parama Mavendra', 'Penting', '1654-Acara Pemilihan Duta066-merged.pdf', '2', '2021-11-04'),
(74, 'S-771/WJP.17/2021', '2021-10-29', 'Surat Pemberitahuan', 'Pengumpulan Rencana Pembelajaran Semester (RPS) da', 'Kantor Wilayah Direktorat Jenderal Pajak ', 'Penting', '4599-S-771 STMIK Primakara (1).pdf', '2', '2021-11-04'),
(75, '017/SPN/BAAK/X/2021', '2021-10-26', 'Izin Survei', 'Izin Survei Proposal Skripsi', 'BAAK Primakara', 'Penting', '2843-Izin Survey Made Aryadi.pdf', '2', '2021-11-04'),
(76, '001/SPN/BAAK/XI/2021', '2021-11-02', 'Surat Pengantar', 'Izin Survei Proposal Skripsi atas nama Ni Luh Putu', 'BAAK Primakara', 'Penting', '4004-Izin Survey Purnama Dewi.pdf', '2', '2021-11-04'),
(77, 'SP/132/BAGI-KUTA/XI/2021', '2021-11-16', 'Surat Penawaran Kerjasama', 'Surat penawaran kerjasama dalam layanan Digitalisa', 'PT. Bank Artha Graha Internasional, Tbk.', 'Penting', '1821-Penawaran Kerjasama Digitalisasi073.pdf', '2', '2021-11-16'),
(78, '9206/Dirut.GG/KPT-EDU/P2K/X/2021', '2021-10-28', 'Surat Penawaran Kerjasama', 'Surat kerjasama dalam memarketingkan Kampus dan me', 'eduNitas.com', 'Penting', '7528-Penawaran eduNitascom072.pdf', '2', '2021-11-16'),
(79, '6694/E2/BS.01.01/2021', '2021-11-17', 'Survey Pembelajaran Daring', 'Pelaksanaan Survey Pembelajaran Daring . Mencakup ', 'Kemendikbud-ristek', 'Penting', '7888-Survey Pembelajaran Daring 2021.pdf', '2', '2021-11-18'),
(80, '053/HMPS-PE/X/2021', '2021-09-27', 'Surat Permohonan', 'Lomba Essay & Poster serta Webinar', 'FKIP Universitas PGRI Mahadewa Indonesia', 'Penting', '8774-Permohonan Lomba PGRI Mahadewa.pdf', '2', '2021-11-23'),
(81, '3214/LL8/KM/2021', '2021-11-22', 'Surat Pengantar', 'Pendaftaran Program Bangkit dari Kemendikbud-Riste', 'LLDIKTI 8', 'Penting', '1971-Surat Program Bangkit.pdf', '2', '2021-11-23'),
(82, '005/1539/KS', '2021-11-25', 'Surat Undangan', 'Mengikuti webinar Reimagining Creative Digital Ind', 'Pemerintah Kota Denpasar', 'Penting', '4253-UND WEBINAR REIMAGINING CREATIVE DIGITAL INDUSTRIES.pdf', '2', '2021-11-25'),
(83, 'S-84/WPJ.17/2021', '2021-12-02', 'Surat Undangan', 'Lomba Kreativitas Bahan Ajar Bermuatan Kesadaran P', 'Kantor Wilayah Direktorat Jenderal Pajak Bali', 'Penting', '324-S-847 UNDANGAN LOMBA KREATIVITAS  BAHAN AJAR INKLUSI PAJAK.pdf', '2', '2021-12-06'),
(84, '13427/E1/DI.00.01/2021', '2021-12-02', 'Surat Undangan', 'Sosialisasi Program Kampus Mengajar Angkatan', 'Kemendikbud-ristek', 'Penting', '6392-Undangan Rangkaian Sosialisasi program Kampus Mengajar Angkatan 3 Tahun 2022_6-8 Desember 2021.pdf', '2', '2021-12-06'),
(85, '6952/E2/BS.01.01/2021', '2021-12-02', 'Surat Undangan', 'Sosialisasi Program Bangkit ', 'Kemendikbud-ristek', 'Penting', '4907-061221 Surat Pengumuman Sosialisasi BANGKIT 2022.pdf', '2', '2021-12-06'),
(86, '006/SPM/SMKFuqron/2021', '2021-11-01', 'Surat Permohonan', ' Permohonan Kunjungan Industri dari SMK Al-Furqon ', 'SMK Al-Furqon', 'Penting', '7161-SMK Furqon.pdf', '2', '2021-12-06'),
(87, '01/S.II/BID.IX/SMAK-SY/XI/2021', '2021-11-21', 'Surat Permohonan', 'Surat permohonan Narasumber pada Kegiatan Pelatiha', 'SMAK Santo Yoseph Denpasar', 'Penting', '2100-SURAT PERMOHONAN NARASUMBER.pdf', '2', '2021-12-06'),
(88, '010/K.I/SMK.AF/XII/2021', '2021-12-07', 'Surat Permohonan', 'Kunjungan Idustri SMK AL-Fuqron untuk program keah', 'SMK Al-Furqon', 'Penting', '6449-surat kunjungan ke STMIK Primakara.pdf', '2', '2021-12-07'),
(89, '001/XI/LPM/2021', '2021-11-23', 'Surat Permohonan', 'Permohonan Bantuan Dana untuk kegiatan Pelatihan S', 'Kelurahan Renon', 'Penting', '5980-Proposal Kelurahan Renon.pdf', '2', '2021-12-09'),
(90, '007/ST/2021', '2021-12-09', 'Surat Undangan', 'Kelas Pelatihan VI  Kedaireka Academy x Universita', 'Kedaireka Academy', 'Penting', '6831-Pelatihan 6G Kedaireka.pdf', '2', '2021-12-09'),
(91, '008/SM/XII/2021', '2021-12-09', 'Surat Permohonan', 'Permohonan Peminjaman Tempat (Ruang Kreatif)', 'Komunitas GameDev Bali ', 'Penting', '2850-Surat Permohonan Peminjaman Ruangan.pdf', '2', '2021-12-09'),
(92, '1051/FEBP/UNHI/XII/2021', '2021-12-09', 'Surat Permohonan', 'Permohonan ijin untuk melakukan penilitian & pengu', 'Universitas Hindu Indonesia', 'Penting', '4404-Permohonan Ijin penelitian.pdf', '2', '2021-12-10'),
(93, '228/BP/DE/XII/2021', '2021-12-08', 'Surat Undangan', 'Sosialisasi LAM INFOKOM di Provinsi Bali ', 'LAM INFOKOM', 'Penting', '8079-Undangan Sosialisasi LAM INFOKOM Provinsi Bali.pdf', '2', '2021-12-16'),
(94, '13676/E1/DI.04.02/2021', '2021-12-07', 'Surat Pemberitahuan', 'Pemuktahiran Data Nomor Induk Siswa Nasional (NISN', 'Kemendikbud-ristek', 'Penting', '5472-SE - Pemutakhiran Data NISN Pendidikan Tinggi.pdf', '2', '2021-12-16'),
(95, '1269.H/KOMINFO/DJAI/HM.01.01/12/2021', '2021-12-14', 'Surat Undangan & Dukungan ', 'Surat Undangan & Dukungan audience pada acara Lite', 'Kominfo', 'Penting', '2405-Surat Dukungan Peserta LDNF Bali_STMIK Primakara (2).pdf', '2', '2021-12-16'),
(96, '04/E/PANPEL LIP/III.2/XI/2021', '2021-12-05', 'Surat Undangan', 'Surat Undangan untuk mengikuti lomba. terdapat 2 k', 'Universitas Pendidikan Ganesha ', 'Penting', '2698-UNIVERSITAS_SURAT UNDANGAN_LMSD&LKTI.pdf', '2', '2021-12-16'),
(97, '0080/SP/AP-DPS/AKD/II/XII/2021', '2021-12-09', 'Surat Permohonan', 'Permohonan Izin Pengambilan Data & Informasi ', 'Alfa Prima', 'Penting', '6439-Surat Pengantar Alfa Prima.pdf', '2', '2021-12-16'),
(98, '420/6549/SMKN1/2021', '2021-12-18', 'Surat Permohonan', 'Permohonan melakukan studi banding perihal sharing', 'SMK Negeri 1 Mas Ubud', 'Penting', '6941-surat kunjungan industri ke STMIK Primakara (1).pdf', '2', '2021-12-20'),
(99, '14726/E1/DI.04.02/2021', '2021-12-20', 'Surat Edaran', 'Pemuktahiran Data Profil Perguruan Tinggi', 'Kemendikbud-ristek', 'Penting', '7999-Pemutakhiran Data Profil Perguruan Tinggi dan Lampiran.pdf', '2', '2021-12-21'),
(100, '13751/E1/DI.04.02/2021', '2021-12-08', 'Surat Pengantar', 'Pengisian Kuesioner Pendataan Vaksinasi PTK dan Ke', 'Kemendikbud-ristek', 'Penting', '6988-Survey Vaksinasi PTK dan Kesiapan Pelaksanaan PTM.pdf', '2', '2021-12-22'),
(101, '3603/LL8/KP/2021', '2021-12-17', 'Surat Pengantar', 'Kelengkapan Usulan Inpassing dan Pembayaran Tunjan', 'LLDIKTI 8', 'Penting', '7179-surat edaran pemberkasan inpassing serdos 2021.pdf', '2', '2021-12-22'),
(102, '3654/LLB/TU/2021', '2021-12-21', 'Surat Undangan', 'Undangan Penyerahan Apresiasi (Award) 2021 di Ling', 'LLDIKTI 8', 'Penting', '7492-Undangan Apresiasi Award Se-Provinsi Bali.pdf', '2', '2021-12-22'),
(103, '002/PemilihanTTD2022/SemetonTTD/XI/2021', '2021-11-17', 'Surat Permohonan', 'Mengirimkan mahasiswa/i untuk dapat mengikuti pemi', 'Semeton Teruna Teruni Denpasar', 'Penting', '9761-Teruna Teruni151.pdf', '2', '2021-12-28'),
(104, '009/SM/XII/2021', '2021-12-28', 'Surat Permohonan', 'Peminjaman ruangan Creatif untuk acara MELALI (Mep', 'Komunitas GameDev Bali ', 'Penting', '6225-Surat Permohonan Peminjaman Ruangan - 09 Januari 2022.pdf', '2', '2021-12-28'),
(105, '185/UW-FE/PD-10/AKU/XII/2021', '2021-12-22', 'Surat Undangan', 'Lomba Warmadewa Tax Competition dengan topik Harmo', 'Universitas Warmadewa', 'Penting', '7022-Surat Undangan WTC.pdf', '2', '2021-12-28'),
(106, '010/SM/XII/2021', '2021-12-28', 'Surat Permohonan', ' Perbantuan publikasi ke mahasiswa untuk Kompetisi', 'Universitas Surabaya', 'Penting', '7952-Canfas 2022.pdf', '2', '2021-12-28'),
(107, 'B.1037.e-BIS/DPS/12/2021', '2021-12-28', 'Surat Permohonan', 'Kerjasama dalam penyaluran penyaluran tenaga kerja', 'PT. Prima Karya Sarana Sejahtera (PKSS)', 'Penting', '1691-Teruna Teruni152.pdf', '2', '2021-12-29'),
(108, '3716/LL8/PR/2021', '2021-12-28', 'Surat Pengantar', 'Pemetaan Indikator Kinerja di Perguruan Tinggi Swa', 'LLDIKTI 8', 'Penting', '8657-Surat Permintaan Data Triwulan IV.pdf', '2', '2021-12-29'),
(109, '1457/SPP/SVM/XII/2021', '2022-01-03', 'Surat Undangan', 'Webinar Online Strategi Menyusun Kurikulum & RPS d', 'SEVIMA', 'Penting', '8474-Undangan Webinar SEVIMA - Kurikulum & RPS.pdf', '2', '2022-01-04'),
(110, '001/SM/I/2022', '2022-01-04', 'Surat Permohonan', 'Peminjaman ruangan Creatif untuk acara MELALI (Mep', 'Komunitas GameDev Bali ', 'Penting', '2744-Surat Permohonan Peminjaman Ruangan - 06 Februari 2022.pdf', '2', '2022-01-05'),
(111, '114/BEM-AS/AP-DPS/CEO/I/2022', '2022-01-06', 'Surat Permohonan Dukungan dan Sponsor', 'Surat Permohonan Dukungan Sponsorship untuk kegiat', 'Alfa Prima', 'Penting', '1079-Surat permohonan Sponsor ke STIMIK Primakara.pdf', '2', '2022-01-07'),
(112, '0042/LL8/KB.01.01/2022', '2022-01-10', 'Surat Pemberitahuan', 'Penyesuaian Nama Program Studi Pada Perguruan Ting', 'LLDIKTI 8', 'Penting', '1457-0042_Penyesuaian_Nomenklatur_Prodi.pdf', '2', '2022-01-11'),
(113, '2021-AG-01-003', '2022-01-17', 'Surat Undangan', 'Ijin melakukan wawancara Instagram Live dari tim A', 'ACT Global', 'Penting', '7173-TOR  Instagram Live -  21 Januari 2022 STMIK Primakara -Humas.pdf', '2', '2022-01-17'),
(114, '002/SMKHI/I/2022', '2022-01-15', 'Surat Permohonan', 'Permohonan Peminjaman Aula', 'SMK Negeri 2 Denpasar ', 'Penting', '4478-Surat Peminjaman Tempat153.pdf', '2', '2022-01-17'),
(115, '125/BEM-AS/AP-DPS/CEO/I/2022', '2022-01-11', 'Surat Undangan', 'Menghadiri acara penutupan kegiatan CEO Alfa Prima', 'BEM Alfa Prima Denpasar', 'Penting', '7042-07, BEM STIMIK.pdf', '2', '2022-01-17'),
(116, 'DES/0031/2022', '2022-01-18', 'Surat Permohonan', 'Surat Ijin Peminjaman Tempat Parkir', 'Doremi Excellent School', 'Penting', '8348-Doremi School.pdf', '2', '2022-01-18'),
(117, '0106/LL8/KB.01.01/2022', '2022-01-17', 'Surat Pemberitahuan', 'Pemberitahuan analisis terhadap nama program studi', 'LLDIKTI 8', 'Penting', '9204-pindai_001105321.pdf', '2', '2022-01-20'),
(118, '003/SM/I/2022', '2022-01-21', 'Surat Undangan', 'Webinar Throug The Keyhole Inspiring Communication', 'Pinnacle Alfa', 'Penting', '9424-Pinna CLE Alfa.pdf', '2', '2022-01-24'),
(119, '009/03/PARAS-ICT-VII-STIKI/I/2022', '2022-01-10', 'Surat Undangan', 'Lomba PARAT ICT VII. Creative For a Healthy Enviro', 'STIKI Indonesia', 'Penting', '9268-Lomba Paras ICT.pdf', '2', '2022-01-24'),
(120, '1686/UND/SVM/I/2022', '2022-01-13', 'Surat Undangan', 'Webinar Online Strategi Kuliah Online dan Digitali', 'SEVIMA', 'Penting', '8931-Undangan SEVIMA - Webinar Bersama Menristekdikti (2014-19) Prof Mohamad Nasir (PDF).pdf', '2', '2022-01-24'),
(121, '421.7/30/418.27/SMK.Br.Kp/I/2022', '2022-01-24', 'Surat Permohonan', 'Permohonan Kunjungan Industri dari SMK Brawijaya K', 'SMK Brawijaya Kepung ', 'Penting', '4789-Kunjungan Industri SMK Brawijaya.pdf', '2', '2022-01-27'),
(122, '1157/PANPEL/DEBAT/FEBP-UNHI/XII/2021', '2021-12-15', 'Surat Undangan', 'Undangan peserta UNHI Economy Management Competiti', 'Universitas Hindu Indonesia', 'Penting', '8564-Lomba UEMC159.pdf', '2', '2022-01-27'),
(123, '0275/E2/BS.01.01/2022', '2022-01-20', 'Surat Pengantar', 'Survey Penyelenggaraan Pendidikan Khusus/Inklusi d', 'Kemendikbud-ristek', 'Penting', '8591-Surat-Survey-penyelenggaraan-pendidikan-khusus_inklusi-halaman.pdf', '2', '2022-01-27'),
(124, 'DES/0031/2021', '2022-01-28', 'Surat Permohonan', 'Permohonan ijin peminjaman tempat parkir untuk keg', 'Doremi Excellent School', 'Penting', '952-Doremischool162.pdf', '2', '2022-01-31'),
(125, 'B.19.340/834/SDK/DISBUD', '2022-01-24', 'Surat Permohonan', 'Partisipasi peserta lomba Bulan Bahasa Bali 2022', 'Dinas Kebudayaan Provinsi Bali', 'Penting', '1069-BulanBahasaBali2022.pdf', '2', '2022-01-31'),
(126, '001/SPM/I/2022', '2022-01-31', 'Surat Penawaran Kerjasama', 'Surat penawaran kerjasama dalam biaya pendidikan d', 'Edufund ', 'Penting', '2941-Company Profile Edufund Indonesia - Jan 2022.pdf', '2', '2022-01-31'),
(127, '005/053/KS', '2022-01-24', 'Surat Undangan', 'Pembahasan Action Plan Implementasi MoU Denpasar-P', 'Sekretariat Daerah', 'Penting', '6963-UND PEMBAHASAN ACTION PLAN IMPLEMENTASI MOU DPS PERTH 2022.pdf', '2', '2022-02-02'),
(128, '0167/LL8/HK.01.04/2021', '2022-01-28', 'Surat Undangan', 'Sosialisasi BPJS Ketenagakerjaan', 'LLDIKTI 8', 'Penting', '386-220128_Undangan Sosialisai BPJS Ketenagakerjaan.pdf', '2', '2022-02-02'),
(129, '0161/LL8/AK.02.01/2022', '2022-01-28', 'Surat Pengantar', 'Pelaksanaan Kurikulum Merdeka Belajar - Kampus Mer', 'LLDIKTI 8', 'Penting', '695-pindai_001145917.pdf', '2', '2022-02-03'),
(130, 'B/328.4/UN34/KM/2022', '2022-01-27', 'Surat Undangan', 'Lomba Inovasi Kewirausahaan Mahasiswa Indonesia (L', 'Universitas Negeri Yogyakarta ', 'Penting', '1197-Undangan Invitasi LIKMI UNY 2022 STMIK Primakara.pdf', '2', '2022-02-03'),
(131, 'BNIS/3.9/936', '2022-01-27', 'Surat Penawaran Kerjasama', 'Penawaran produk investasi di Pasar Modal ', 'PT. BNI Sekuritas', 'Penting', '4610-BNI Sekuritas163.pdf', '2', '2022-02-03'),
(132, '114/SGN-OUT/LYRA/06/22', '2022-01-28', 'Surat Penawaran Kerjasama', 'Kerjasama Bidang STEM (Sians, Technology, Engineer', 'Indonesia Youth Robot Association', 'Penting', '8834-Surat IYRA .pdf', '2', '2022-02-03'),
(133, '007/SM/II/2022', '2022-02-04', 'Surat Penawaran Kerjasama', 'Penyelenggaraan Masterclass Film Dalam Rangka Fest', 'Konsulat Jenderal Australia Bali ', 'Penting', '3042-FSAI 2022 - STIMIK Primakara Bali(2).pdf', '2', '2022-02-07'),
(134, '0158/E/DI.00.01/2022', '2022-02-08', 'Surat Pemberitahuan', 'Penunjukan koordinator PT MSIB Batch Kedua dan Pem', 'Kemendikbud-ristek', 'Penting', '2394-Penunjukan Koordinator PT dan Pembukaan Pendaftaran Dosen Pembimbing Lapangan (DPL) MSIB Batch 2.pdf', '2', '2022-02-10'),
(135, '10/SM/II/2022', '2022-02-08', 'Surat Penawaran Kerjasama', 'Sosialisasi Program Kuliah & Bekerja di Luar Neger', 'One Step Solution By Parama', 'Penting', '4116-Proposal Sosialisasi OSS Bali by Parama - Prima Kara Denpasar.pdf', '2', '2022-02-10'),
(136, '005/242/Bappeda', '2022-02-11', 'Surat Undangan', 'Penilaian Tahap II Penghargaan Pembangunan Daerah ', 'Badan Perencanaan Pembangunan Daerah ', 'Penting', '6702-tte-001418-SRT-0220221_conv Surat Undangan Penilaian PPD Tahap II OK.pdf', '2', '2022-02-14'),
(137, '010/WJC-HRD/RC/II/2022', '2022-02-10', 'Surat Permohonan', 'Publikasi Lowongan Kerja ', 'Wonokoyo Group', 'Penting', '8709-Permohonan Publikasi Lowongan di STMIK Primakara.pdf', '2', '2022-02-14'),
(138, '090/PPTJ16/I/2022', '2022-01-05', 'Surat Pengantar', 'Penyelengaraan Pekan Pendidikan Tinggi Jakarta ke ', 'PT Mata Aer Makmurindo ', 'Penting', '3308-Undangan Peserta PPTJ 16.pdf', '2', '2022-02-14'),
(139, '003/SM/II/2022', '2022-02-14', 'Surat Pengantar', 'Kerjasama Sertifikasi', 'MyEduSolve', 'Penting', '4346-MyEduSolve_Certification_2022 (1).pdf', '2', '2022-02-14'),
(140, '0725//E1/PP.01.11/2022', '2022-02-14', 'Surat Undangan', 'Sosialisasi Program Matching Fund 2022', 'Kemendikbud-ristek', 'Penting', '8238-Undangan Sosialisasi Matching Fund 2022.pdf', '2', '2022-02-16'),
(141, '.../Pan-Pel/STW/TF/02/2022', '2022-01-28', 'Surat Undangan', 'Partisipasi dalam Turnamen Futsal STT. Wirajatayu ', 'STT Wirajatayu ', 'Penting', '389-STT Wirajatayu.pdf', '2', '2022-02-25'),
(142, '04/BW-KTH/II/2022', '2022-02-10', 'Surat Permohonan', 'Kerjasama dalam Pelaksanaan Kegiatan Pendidikan Br', 'Brahma Widya Kursus Teologi Hindu ', 'Penting', '1452-Brahma Widya Teologi Hindu166.pdf', '2', '2022-02-25'),
(143, '009/BUB-LPPFI/II/2022', '2022-02-14', 'Surat Undangan', 'Pelatihan Auditor Mutu Internal Berbasis Risiko ', 'Sekolah Tinggi Ilmu Kesehatan Bina Usada Bali ', 'Penting', '3267-Undangan Pelatihan Auditor Mutu Internal.pdf', '2', '2022-02-25'),
(144, '004/IFest/HIMAFORKA/II/2022', '2022-02-15', 'Surat Undangan', 'Lomba WEB Design Competition ', 'Universitas Atma Jaya Yogyakarta ', 'Penting', '406-Undangan WDC 2022_STMIK Primakara.pdf', '2', '2022-03-08'),
(145, '009/SPN/BAAK/III/2022', '2022-03-07', 'Surat Permohonan', 'Izin Survei Skripsi', 'BAAK Primakara', 'Penting', '3712-Izin Survey167.pdf', '2', '2022-03-10'),
(146, 'B-759/Un.10.8/D/DA.04.09/03/2022', '2022-03-14', 'Surat Permohonan', 'Permohonan Izin Kunjungan KKL', 'Universitas Islam Negeri Walisongo Semarang ', 'Penting', '5243-Surat Kunjungan KKL Ke STMIK PRIMAKARA Denpasar Bali.pdf', '2', '2022-03-14'),
(147, 'SK029/III/BEDO-2022', '2022-03-15', 'Surat Undangan', 'Sosialisasi Program Tenun Kebaya bagi 30 Mahasiswa', 'BEDO', 'Penting', '2397-SK029- Surat Undangan Sosialisasi Mahasiswa STMIK Primakara .pdf', '2', '2022-03-17'),
(148, '0427/LL8/PR.00.01/2022', '2022-03-16', 'Surat Undangan', 'Sosialisasi Pengisian Indikator Kinerja Perguruan ', 'LLDIKTI 8', 'Penting', '2836-Surat Undangan Sosialisasi IKU Bali 25 Maret 2022.pdf', '2', '2022-03-17'),
(149, '1355/E3.1/PM.00.03/2022', '2022-03-17', 'Surat Undangan', 'Sosialisasi Program Kompetisi Kampus Merdeka (PK-K', 'LLDIKTI 8', 'Penting', '9879-Und Sosialisasi PK-KM 2022 Batch IV (LLDIKTI VIII dan XV).pdf', '2', '2022-03-17'),
(150, '1168/E2/KM.09.00/2022', '2022-03-17', 'Surat Undangan', 'Sosialisasi Program Peningkatan Kapasitas Organisa', 'Kemendikbud-ristek', 'Penting', '1829-2527 UND Sosialisasi.pdf', '2', '2022-03-22'),
(151, 'AOI/10/VEN/2022', '2022-03-16', 'Surat Permohonan', 'Peminjaman ruang kelas ', 'Alumni Osis Indonesia ', 'Penting', '8504-Surat Peminjaman_STMIK Primakara Denpasar.pdf', '2', '2022-03-25'),
(152, '038/BEM-FEB/II-SKj/III/2022', '2022-03-23', 'Surat Permohonan', 'Permohonan Branding kegiatan dan partisipasi peser', 'Universitas Pendidikan Nasional (Undiknas)', 'Penting', '8715-combinepdf.pdf', '2', '2022-04-01'),
(153, 'B.24.005/4788/IKP/D.KOMINFOS', '2022-03-28', 'Surat Undangan', 'Webinar Implementasi Perki Nomor 1 tahun 2021 sert', 'Diskominfos', 'Penting', '6890-Surat-Undangan-Webinar-Keterbukaan-Informasi-Publi.pdf', '2', '2022-04-01'),
(154, '2022.AG-02-023', '2022-03-24', 'Surat Undangan', 'Pelatihan â€œCommunity Seniors Involved Internatio', 'ACT Global', 'Penting', '4973-Surat Permohonan Peserta CSII Training Course - STMIK Primakara  .docx.pdf', '2', '2022-04-01'),
(155, '004/SM/2022', '2022-04-01', 'Surat Undangan', 'Sosialisasi Pendaftaran PMM2 untuk Perguruan Tingg', 'LLDIKTI 8', 'Penting', '5320-combinepdf.pdf', '2', '2022-04-01'),
(156, 'B.24.005/5028/SEKRET/D.KOMINFOS', '2022-04-01', 'Surat Undangan', 'Menghadiri kegiatan Bali Digital Festival 2022', 'Diskominfos', 'Penting', '5979-Digifest 170.pdf', '2', '2022-04-06'),
(157, '005 KFB/IV/2022', '2022-04-06', 'Surat Undangan', 'Mengikuti serangkaian kegiatan di Bali Digital Fes', 'Komisi Film Bali ', 'Penting', '8014-Komisi Film Bali Digifest.pdf', '2', '2022-04-06'),
(158, '001/Panpel-Lomba Karaoke/UKM Padus/UHN IGBS Dps/04', '2022-04-01', 'Surat Permohonan', 'Permohonan partisipasi dalam lomba Karaoke se-Bali', 'Universitas Hindu Negeri I Gusti Bagus Sugriwa Den', 'Penting', '4100-Lomba Karaoke UHN.pdf', '2', '2022-04-07'),
(159, '2415/SPP/SVM/III/2022', '2022-04-04', 'Surat Undangan', 'Mengikuti Webinar engan tema Strategi Sukses Penge', 'SEVIMA', 'Penting', '3396-Undangan Webinar SEVIMA tentang Sistem.pdf', '2', '2022-04-07'),
(160, '09/UN48.22/UPT-PKKM/2022', '2022-04-08', 'Surat Undangan', 'FGD Persiapan Job Fair Bali 2022', 'Universitas Pendidikan Ganesha ', 'Penting', '7236-surat undangan peserta ttd.pdf', '2', '2022-04-11'),
(161, '343/DJAI.5/AI.03.02/04/2022', '2022-04-06', 'Surat Undangan', 'Sosialisasi Kolaborasi dan Sinergi Kegiatan Litera', 'Kominfo', 'Penting', '9107-Surat Undangan Kampus .pdf.pdf', '2', '2022-04-11'),
(162, '1775/E2/KM.12/2022', '2022-04-13', 'Surat Undangan', 'Rapat Koordinasi Bidang Kemahasiswaan ', 'Kemendikbud-ristek', 'Penting', '1568-Rakormawa_Ditjen Diktiristek.pdf', '2', '2022-04-18'),
(163, '011/SPN/BAAK/IV/2022', '2022-04-11', 'Surat Permohonan', 'Izin survei Skripsi mahasiswa a/n Clara Alverencia', 'BAAK Primakara', 'Penting', '8570-Izin Surevi Clara175.pdf', '2', '2022-04-18'),
(164, '015/SPN/BAAK/IV/2022', '2022-04-13', 'Surat Permohonan', 'Izin Survei Skripsi', 'BAAK Primakara', 'Penting', '1086-Ariesta Agung176.pdf', '2', '2022-04-18'),
(165, '001/SPM/IV/2022', '2022-04-18', 'Surat Undangan', 'pelatihan online dengan tema \"Digital Marketing as', 'BEDO', 'Penting', '4091-Digital Marketing Tenun Kebaya.pdf', '2', '2022-04-18'),
(166, '007/B/PPKAB-XI/III/2022', '2022-04-14', 'Surat Permohonan', 'Sosialisasi Pemilihan Putra Putri Kampus Ajeg bali', 'Jnana-Yajnah Paramtapa (IV-33)', 'Penting', '7483-Putra Putri Kampus Ajeg177.pdf', '2', '2022-04-18'),
(167, 'B/497/BPSDMI/BDI-Denpasar/IV/2022', '2022-04-12', 'Surat Permohonan Peserta', 'Mengikuti acara Business Bootcamp', 'Balai Diklat Industri Denpasar', 'Penting', '2033-Bootcamp.pdf', '2', '2022-04-21'),
(168, 'B/1275/IV/LIT.6.1./2022/Polresta Denpasar', '2022-04-21', 'Surat Permohonan', 'Permintaan Data Mahasiswa/i berasal dari Papua', 'Polresta Denpasar', 'Penting', '5334-Kapolres.pdf', '2', '2022-04-21'),
(169, '0697/LL8/KM.12/2022', '2022-04-21', 'Surat Undangan', 'Sosialisasi Program Pembinaan Mahasiswa Wirausaha ', 'LLDIKTI 8', 'Penting', '7733-Undangan P2MW Akademik 2022 27 April_2.pdf', '2', '2022-04-26'),
(170, '014/IAI-JTM/KRAIX/IV/2022', '2022-04-21', 'Surat Permohonan', 'Permohonan Penyebaran Informasi', 'Ikatan Akuntan Indonesia', 'Penting', '5788-IAI Konferensi Paper182.pdf', '2', '2022-05-09'),
(171, '086/NTSC2022/IV/IPBI', '2022-04-20', 'Surat Pengantar', 'The 5th National Tourism Student Championship 2022', 'IPB Internasional', 'Penting', '5077-IPB Internasional.pdf', '2', '2022-05-09'),
(172, '022/SPN/BAAK/IV/2022', '2022-04-27', 'Surat Permohonan', 'Izin Surevy Skripsi mahasiswa a/n I Putu Adi Putra', 'BAAK Primakara', 'Penting', '405-Izin Survey mahasiswa186.pdf', '2', '2022-05-09'),
(173, '035/MK.01/GP-331/IV/2022', '2022-04-27', 'Surat Permohonan', 'Ijin sosialisasi orbit dan pembagian perdana inter', 'Telkomsel', 'Penting', '3894-Telkomsel183.pdf', '2', '2022-05-09'),
(174, '001/SM/MEI/2022', '2022-05-10', 'Surat Undangan ', 'Magang online bagi mahasiswa STMIK Primakara', 'DEVanoda', 'Penting', '1425-Magang Online DEVanoda.pdf', '2', '2022-05-10'),
(175, '0742/LL8/WA.01.04/2022', '2022-05-09', 'Surat Pengantar', 'Pelaporan Tracer Study Tahun 2022 dan Pengisian Ku', 'LLDIKTI 8', 'Penting', '4115-Surat Pemberitahuan Pelaporan Tracer Study.pdf', '2', '2022-05-10'),
(176, '2119/E2/BS.01.01/2022', '2022-05-10', 'Surat Undangan', 'Webinar Launching Modul Tular Nalar dalam SPADA In', 'Kemendikbud-ristek', 'Penting', '8363-Surat Pengumuman Webinar Launching Modul Tular Nalar (1).pdf', '2', '2022-05-17'),
(177, '017/SM/2022', '2022-05-06', 'Surat Permohonan', 'Sponsor kegiatan Perayaan Kelulusan dan Pelepasan ', 'SMAN 1 Payangan', 'Penting', '1983-SMAN 1 Payangan187.pdf', '2', '2022-05-17'),
(178, '03/KKT/V.11/2022', '2022-05-11', 'Surat Permohonan', 'Kuliah Kompetensi TIK ', 'IKIP Saraswati ', 'Penting', '9457-Peserta Kuliah Kompetensi TIK.pdf', '2', '2022-05-18'),
(179, '016/SPP/JCI-BD/OUT/V/2022', '2022-05-17', 'Surat Permohonan', 'Permohonan Peserta dalam Kegiatan Investo HQ Summi', 'JCI Bali ', 'Penting', '6631-Surat Permohonan Peserta - STMIK Primakara.pdf', '2', '2022-05-18'),
(180, '18/SM/V/2022', '2022-05-18', 'Surat Permohonan', 'Permohonan Trainees posisi Information & Technolog', 'Padma Hotel Legian', 'Penting', '1869-job vacancy (TRAINEE) - 04 May 2022.pdf', '2', '2022-05-18'),
(181, 'BAL/ADM/551/10/2019', '2022-05-18', 'Surat Permohonan', 'Rencana pemberian kuliah umum berjudul Filosofi In', 'Duta Besar India ', 'Penting', '2523-Pemberian Kuliah Umum - Filosofi India di STMIK Primakara.pdf', '2', '2022-05-20'),
(182, '021/B/ADS/UNAIR/IV/2022', '2022-04-04', 'Surat Undangan', 'ndangan Kompetisi Debat Airlangga Debating Society', 'Universitas Airlangga', 'Penting', '2870-Surat Undangan AU x ADS AuAntarMahasiswa 2022.pdf', '2', '2022-05-20'),
(183, '81.B/03/DPR/UKIM_Unesa/V/2022', '2022-05-17', 'Surat Undangan', 'a GALAKSI 2022 (Gebyar Lomba Karya Tulis Ilmiah)  ', 'Kemendikbud-Ristek dan Teknologi Universitas Neger', 'Penting', '531-81.B-DPR-Surat Undangan PTN se Indonesia GALAKSI 2022.pdf', '2', '2022-05-20'),
(184, '024/SM/V/2022', '2022-05-21', 'Surat Permohonan ', 'Sosialisasi kepada Mahasiswa/I STMIK Primakara ten', 'One Step Solution By Parama', 'Penting', '5224-Proposal Sosialisasi OSS Bali - STIMIK PRIMAKARA.pdf', '2', '2022-05-24'),
(185, '124/SM/V/2022', '2022-05-24', 'Surat Undangan', 'Mengikuti kegiatan Meet the Bali Startup Ecosystem', 'Founder Institute', 'Penting', '6762-Undangan kepada StartUp Expert Primakara.pdf', '2', '2022-05-24'),
(186, 'B-1097/DIR/UMS/2022', '2022-05-09', 'Surat Undangan', 'Iklan Kemitraan HUT ke-60th PT. Bank Pembangunan D', 'PT. Bank Pembangunan Daerah Bali ', 'Penting', '9967-STMIK PRIMAKARA.pdf', '2', '2022-05-24'),
(187, '0704/LL8/TU.00.01/2022', '2022-04-25', 'Surat Pemberitahuan', 'Unggah Satuta Perguruan Tinggi Swasta pada Pangkal', 'LLDIKTI 8', 'Penting', '5339-25042022140941.pdf', '2', '2022-05-25'),
(188, '005/413/KS', '2022-05-18', 'Surat Undangan', 'Undangan pertemuan delegasi', 'Pemerintah Kota Denpasar', 'Penting', '1803-Smartcity.pdf', '2', '2022-05-27'),
(189, '005/319/Kec.Denut', '2022-05-24', 'Surat Undangan', 'Partisipasi dalam Lomba Poster Digital', 'Pemkot Denpasar Kecamatan Denpasar Utara', 'Penting', '3561-Pemkot Denpasar189.pdf', '2', '2022-05-27'),
(190, '10/V/DG-AP/DPS/2022', '2022-05-19', 'Surat Undangan', 'Mengikuti Lomba Poster Digital', 'Alfa Prima', 'Penting', '4675-Alfaprima188.pdf', '2', '2022-05-27'),
(191, 'B-PM.01.02.17A.17A4.04.22.474', '2022-04-29', 'Surat Undangan', 'Mengikuti Program BPOM Goes to Campus', 'Badan BPOM', 'Penting', '9695-5_6066368141385008701 (1).pdf', '2', '2022-05-27'),
(192, '0876/LL8/KM.12/2022', '2022-05-27', 'Surat Undangan', 'Sosialisasi Program Inovasi Wirausaha Digital Maha', 'LLDIKTI 8', 'Penting', '6272-scan surat IWDM 2022.pdf', '2', '2022-05-30'),
(193, '2422/E2.1/DI.00.01/2022', '2022-05-24', 'Surat Permohonan', 'Sosialisasi Program Magang dan Studi Independen Be', 'Kemendikbud-ristek', 'Penting', '7309-Undangan Sosialisasi MSIB Angkatan 3 Kepada Pimpinan Perguruan Tinggi.pdf', '2', '2022-05-30'),
(194, 'E.069/HB/SP/05/2022', '2022-05-25', 'Surat Permohonan', 'Sosialisasi dompet digital PT. Halo Belanja Dotcom', 'PT. Halo Belanja Dotcom', 'Penting', '8250-PT Halo Belanja192.pdf', '2', '2022-05-30'),
(195, '002/PMS/DPS/V/2022', '2022-05-30', 'Surat Penawaran Kerjasama', 'Kerjasama dalam bidang kesehatan ', 'Prodia Laboratorium Klinik', 'Penting', '9581-Prodia193.pdf', '2', '2022-05-30'),
(196, '2500/E2/PB.04.01/2022', '2022-05-27', 'Surat Edaran', 'Tawaran Asia University Virtual Exchange  Program ', 'Kemendikbud-ristek', 'Penting', '140-Surat Pengantar Asia University Virtual Exchange Program Fall Semester 2022.pdf', '2', '2022-05-30'),
(197, '026/Panpel-JBUNMASDPS/V/2022', '2022-05-27', 'Surat Permohonan', 'Permohonan Delegasi Peserta dalam Festival Budaya ', 'Universitas Mahasaraswati ', 'Penting', '4945-Univ Mahasaraswati194.pdf', '2', '2022-05-31'),
(198, '037/BEN/V/2022', '2022-05-20', 'Surat Penawaran Kerjasama', 'Penawaran Magang / PKL', 'PT. Benlaris Sahabat Dewata ', 'Penting', '9974-Benlaris196.pdf', '2', '2022-06-06'),
(199, '011/HIMAPRODI.SK/BEM.ITBSTIKOM/V/2022', '2022-05-30', 'Surat Undangan', 'Undangan Partisipasi Lomba Gelar Kreasi Sistem Kom', 'ITB Stikom Bali', 'Penting', '2585-ITB Stikom Bali195.pdf', '2', '2022-06-06'),
(200, '2541/E2/PB.03.00/2022 ', '2022-05-31', 'Surat Undangan', 'Sosialisasi Bantuan Program Pembelajaran Daring Ko', 'LLDIKTI 8', 'Penting', '8475-Sosialisasi Pembelajaran Daring 2022.pdf', '2', '2022-06-06'),
(201, '001/SM/VI/2022', '2022-06-06', 'Surat Undangan', 'Menghadiri kegiatan Ngobrol Bareng Nick', 'Australian Consulate-General ', 'Penting', '8379-Nick @DNA event Poster.pdf', '2', '2022-06-06'),
(202, '517.1 / 916 / DISKOPUKMP', '2022-06-03', 'Surat Permohonan', 'Mohon Narasumber dan Materi Dalam rangka pelaksana', 'Dinas Koperasi, UKM dan Perdagangan Kabupaten Badu', 'Penting', '5312-517.1_916_DISKOPUKMP.pdf', '2', '2022-06-13'),
(203, '013/SM/VI/2022', '2022-06-13', 'Surat Undangan', 'Mengikuti Kegiatan seminar nasional tahunan \"The 1', 'Universitas Gadjah Mada', 'Penting', '9249-Pemakalah Cite June 2022.pdf', '2', '2022-06-13'),
(204, 'No. BAL/SVCC/322/5/22', '2022-06-06', 'Surat Undangan', 'Celebration of 8th International Day of Yoga (IDY)', 'Kedubes India', 'Penting', '8104-Undangan IDY Flayer 2022.pdf', '2', '2022-06-13'),
(205, '002/Panitia-AnalgesiaSports/VI/2022', '2022-06-02', 'Surat Undangan', 'Undangan Peserta Turnamen Analgesia Sports 2022', 'Analgesia Pain Clinic', 'Penting', '2892-Analgesia Sports 2022.pdf', '2', '2022-06-20'),
(206, '002/UKM.Futsal/BEM.ITBSTIKOM/V/2022', '2022-05-25', 'Surat Permohonan', 'Partisipasi dalam Kegiatan Rektor Cup 2022', 'UKM Futsal ITB Stikom Bali ', 'Penting', '6109-Kompetisi Futsal ITB Stikom.pdf', '2', '2022-06-20'),
(207, '10/UW/BEM-FH/PanPel-DekanCupX/VI/2022', '2022-06-13', 'Surat Permohonan', 'Partisipasi dalam Turnamen Futsal ', 'Universitas Warmadewa', 'Penting', '6941-Turnamen Futsal Warmadewa.pdf', '2', '2022-06-20'),
(208, 'B.24.046/8890/SANDI/D.KOMINFOS', '2022-06-15', 'Surat Permohonan', 'Permohonana Narasumber Bmendeteksi hoax di media s', 'Diskominfos', 'Penting', '5309-Surat Permohonan Narsum _29 Juni Primakara (1).pdf', '2', '2022-06-20'),
(209, '002/SM/VI/2022', '2022-06-14', 'Surat Penawaran Kerjasama', 'Permohonan Kerjasama Galeri Investasi Pasar Modal', 'NH Korindo Sekuritas Indonesia', 'Penting', '7759-Proposal Kerja Sama Galeri Investasi Saham STMIK Primakara.pdf', '2', '2022-06-27'),
(210, '2022-AG-04-057', '2022-06-21', 'Surat Penawaran Kerjasama', 'Permohonan Kerjasama UKM Multimedia dan Peminjaman', 'ACT Global', 'Penting', '5127-Permohonan kerjasama tim Produksi Video - UKM Multimedia STMIK Primakara.docx (1).pdf', '2', '2022-06-27'),
(211, '4/SM/2022', '2022-06-04', 'Surat Undangan', 'Femtech Bali Networking of Female - Tech Enterpren', 'Konjen Inggris', 'Penting', '6613-Femtech.pdf', '2', '2022-07-06'),
(212, '001/LH/SPK/VI/2022', '2022-05-04', 'Surat Penawaran Kerjasama', 'Pemberian Fasilitas Mahasiswa PKL ', 'Lumbung Group', 'Penting', '6080-Lumbung Group.pdf', '2', '2022-07-06'),
(213, '882/PGRI2Bdg/B.15/2022', '2022-05-29', 'Permohonan Sponsorship', 'Sponsorship dari SMK PGRI 2 Badung dalam rangka pe', 'SMK PGRI 2 Badung', 'Penting', '2785-Sponsorship SMK PGRI 2 Badung.pdf', '2', '2022-07-06'),
(214, '24/667/Dpr/Srt/B', '2022-07-04', 'Surat Permohonan', 'Menghadirkan Mahasiswa dalam Rangka Festival Ekono', 'Bank Indonesia', 'Penting', '7745-STMIK Primakara.pdf', '2', '2022-07-06'),
(215, '24/698/Dpr/Srt/B', '2022-07-08', 'Surat Undangan', 'Undangan Seminar on Scaling Up Green Finance in In', 'Bank Indonesia', 'Penting', '2130-Surat Undangan Bank Indonesia.pdf', '2', '2022-07-12'),
(216, '2446/UND/SVM/V/2022', '2022-06-13', 'Surat Undangan', 'Webinar â€œStrategi Meningkatkan Mutu PT & Prodi  ', 'SEVIMA', 'Penting', '4812-Undangan Webinar SEVIMA - Mutu & Akreditasi (PDF).pdf', '2', '2022-07-12'),
(217, '002/GR/VII-Alibaba Cloud/2022', '2022-07-07', 'Surat Permohonan', '002/GR/VII-Alibaba Cloud/2022', 'Alibaba Cloud ', 'Penting', '7779-Surat STIMIK PRIMAKARA - Rektor Pak I Made Artana, S.Kom., M.M..pdf', '2', '2022-07-14'),
(218, 'B/178/UN14.4.B/DL.01/2022', '2022-07-01', 'Surat Undangan', 'Pelatihan Pengembangan Keterampilan Dasar Teknik I', 'Universitas Udayana', 'Penting', '6033-Surat Undangan PEKERTI UNUD.pdf', '2', '2022-07-14'),
(219, '086 /K.I/SMK.AF/VII/2022', '2022-07-14', 'Surat Permohonan', 'Permohonan Kunjungan Industri Bagi Siswa  Dan Guru', 'SMK AL Furqon Mranggen Demak', 'Penting', '5497-stimik primakara.pdf', '2', '2022-07-18'),
(220, '05.03/SAS/VI/2022', '2022-07-18', 'Surat Penawaran Kerjasama', 'Kerjasama Rekruitasi Tenaga Kerja, Program Intersh', 'PT. Solusi Anak Sakti (Djoin)', 'Penting', '4970-DJoin.pdf', '2', '2022-07-22'),
(221, '02/KRT.KP/Non-Ops/VII.2022', '2022-07-18', 'Surat Permohonan', 'Izin pemasangan Pamflet Lomba Poster Digital denga', 'Bank Kertiawan', 'Penting', '2829-Lomba Bank Kertiawan.pdf', '2', '2022-07-22'),
(222, '1307/LL8/KL.02.00/2022', '2022-07-21', 'Surat Undangan', 'Kegiatan Canvassing Activities Batch III', 'LLDIKTI 8', 'Penting', '5040-Undangan canvassing activities.pdf', '2', '2022-07-22'),
(223, '001/SM/VII/2022', '2022-07-22', 'Surat Undangan', 'kompetisi The Hackathon Overview \"Hacking\" Competi', 'Sinar Mas', 'Penting', '9669-Techconnect Hackathon - The Introduction.pdf', '2', '2022-07-22'),
(224, '002/SM/VII/2022', '2022-07-22', 'Surat Permohonan', 'Permohonan Magang dari Balimoon untuk posisi IT Te', 'Balimoon', 'Penting', '5166-Magang IT.pdf', '2', '2022-07-22'),
(225, '003/SK/07/2022', '2022-07-26', 'Surat Undangan', 'Peluncuran Buku Seri Literasi Digital', 'SIBER KREASI', 'Penting', '5377-003 Undangan Peluncuran Seri Buku Literasi Digital.pdf', '2', '2022-07-27'),
(226, '002/SPPG/VII/22', '2022-07-25', 'Surat Permohonan', 'Peminjaman Ruangan untuk pelatihan free trial ofli', 'PT. Bangun Inovasi Teknologi ', 'Penting', '3275-002 Surat Permohonan Peminjaman Ruangan.pdf', '2', '2022-07-27'),
(227, '891/PGRI2BDG/U.6/2022', '2022-07-22', 'Surat Undangan', 'perayaan HUT SMK PGRI 2 Badung', 'SMK PGRI 2 Badung', 'Penting', '4835-Undangan HUT PGRI 2 Badung.pdf', '2', '2022-07-28'),
(228, '003/SM/VII/2022', '2022-07-28', 'Surat Penawaran Kerjasama', 'Pemeriksaan Mata dengan Komputer', 'Nuansa Nirwana Optik', 'Penting', '2657-Pemeriksaan Mata Nirwana Optik.pdf', '2', '2022-07-28'),
(229, '031/BUB-LP2SDM/VII/2022', '2022-07-20', 'Surat Undangan', 'pelatihan menyusun dokumen SPMI menuju pendidikan ', 'Future Insight', 'Penting', '6063-Undangan Special Clinic Penyusunan Dokumen.pdf', '2', '2022-07-28'),
(230, 'T.44.003/22355/RT/B.UMPRO', '2022-08-02', 'Surat Edaran', 'PARTISIPASI MENYEMARAKKAN PERINGATAN HARI JADI KE-', 'Sekretariat Daerah', 'Penting', '8827-SURAT EDARAN TENTANG PARTISIPASI MENYEMARAKKAN PERINGATAN HARI JADI KE- 64 PROVINSI BALI TAHUN 2022.pdf', '2', '2022-08-02'),
(231, '003/SPPG/VII/22', '2022-07-27', 'Surat Permohonan', 'Permohonan Peminjaman Ruangan', ' PT. Bangun Inovasi Teknologi (BIT  House)', 'Penting', '2539-003 Surat Permohonan Peminjaman Ruangan tgl 12-13 agustus.pdf', '2', '2022-08-02'),
(232, '127/BEM.STISPOL-WB/VIII/2022', '2022-08-01', 'Surat Permohonan', 'Permohonan Partisipasi dalam Jalan Sehat dalam Ran', 'BEM STISPOL Wira Bhakti', 'Penting', '5010-Bem Stispol.pdf', '2', '2022-08-05'),
(233, ' 0347/J7.1/PN.00/2022', '2022-08-04', 'Surat Undangan', 'Undangan pelaksanaan sosialisasi Pekan Seni  Mahas', 'Kemendikbudristek', 'Penting', '6028-Pekan Seni Mahasiswa Nasional.pdf', '2', '2022-08-05'),
(234, '375/II.3.AU/J/FIKOM/UMM/2022', '2022-08-08', 'Surat Permohonan', 'Kunjungan Studi Lapangan ', 'Universitas Muhammadiyah Metro Fakultas Ilmu Kompu', 'Penting', '6550-Surat Kunjungan Studi STMIK Primakara.pdf', '2', '2022-08-09'),
(235, '1690/LL8/DT.00.05/2022', '2022-08-08', 'Surat Pemberitahuan', 'Pengumuman Pendaftaran Program Banpem RPL Tipe A T', 'LLDIKTI 8', 'Penting', '2468-Pengumuman Pendaftaran Program Banpem RPL Tipe A Tahun 2022.pdf', '2', '2022-08-09'),
(236, '4733/E2/DT.00.05/2022', '2022-08-08', 'Surat Undangan', 'Sosialisasi Program Banpem RPL Tipe A tahun 2022 b', 'Kemendikbud-ristek', 'Penting', '1984-Undangan PT dan LLDIKTI - Sosialisasi Banpem RPL 2022.pdf', '2', '2022-08-09'),
(237, 'EDUFAIR/003/XII/2022', '2022-08-09', 'Surat Undangan', 'Edu Fair SMAN 8 Denpasar 2022', 'SMAN 8 Denpasar 2022', 'Penting', '9308-Edufair SMAN 8 Denpasar.pdf', '2', '2022-08-09'),
(238, '421.3/13.094/SMAN2/VIII/2022', '2022-08-08', 'Surat Undangan', ' Resma Education Expo tahun 2022', 'SMAN 2 Denpasar', 'Penting', '7376-Surat Undangan dan Proposal Resman Education Expo 2022.pdf', '2', '2022-08-10'),
(239, ' 008/PANPEL-INVENTION/HIMAKOM/V/2022', '2022-05-26', 'Surat Permohonan', 'Informatic Festival and Competition (INVENTION) 20', 'Universitas Udayana', 'Penting', '1334-Invitation Unud.pdf', '2', '2022-08-10'),
(240, '004/SPPG/VIII/22', '2022-09-09', 'Surat Permohonan', 'Pengajuan Kerjasama Untuk Peminjaman Ruangan Kelas', 'PT. Bangun Inovasi Teknologi ', 'Penting', '313-004_Pengajuan_Kerjasama_Untuk_Penyelenggaraan_Kelas_Berbayar_Alfa_Prima.pdf', '2', '2022-08-10'),
(241, '001/SU/VIII/22', '2022-08-11', 'Surat Undangan', 'Menghadiri workshop Digital Marketing dengan topik', 'BIT House', 'Penting', '5206-Undangan STMIK Primakara.pdf', '2', '2022-08-11'),
(242, '1772/LL8/DT.00.00/2022', '2022-08-10', 'Surat Undangan', 'Workshop Pembelajaran Mata Kuliah Wajib pada  Kuri', 'LLDIKTI 8', 'Penting', '5304-Dokumen_56480_1660141620.pdf', '2', '2022-08-11'),
(243, 'B.24.045/11778/IKP/D.KOMINFOS', '2022-08-11', 'Surat Permohonan', 'Narasumber Talk Show  Pameran Pembangunan Tahun 20', 'Diskominfos', 'Penting', '2173-Surat Mohon Narsum Talkshow.pdf', '2', '2022-08-13'),
(244, '13/SM/VIII/2022', '2022-08-11', 'Surat Undangan', 'Undangan Kegiatan FEMTECH Networking Event untuk M', 'British Embassy Jakarta ', 'Penting', '7896-Letter to STMIK Primakara FINAL.pdf', '2', '2022-08-13'),
(245, '1795/LL8/DT.00.00/2022', '2022-08-11', 'Surat Pengantar', 'Survei Kemandirian MBKM', 'LLDIKTI 8', 'Penting', '3154-Surat Pemberitahuan Survey MBKM-KMM LLDIKTI VIII.pdf', '2', '2022-08-13'),
(246, '1804/LL8/TU.02.03/2022', '2022-08-12', 'Surat Pemberitahuan', 'Instruksi untuk melaksanakan Upacara Bendera HUT R', 'LLDIKTI 8', 'Penting', '3187-Instruksi  (1).pdf', '2', '2022-08-13'),
(247, '1808/LL8/HM.00.08/2022', '2022-08-12', 'Surat Undangan', 'Undangan mengikuti Upacara Bendera', 'LLDIKTI 8', 'Penting', '5106-Undangan Upacara ke Pimpinan PTS.pdf', '2', '2022-08-13'),
(248, 'S-115/KR.08/2022', '2022-08-03', 'Surat Undangan', 'Pelaksanaan Kompetisi Inklusi Keuangan (KOINKU)', 'Otoritas Jasa Keuangan', 'Penting', '6190-OJK.pdf', '2', '2022-08-18'),
(249, '08.017/PL8.HMJ/PAN-PNBITC/2022', '2022-08-04', 'Surat Undangan', 'Partisipasi Peserta dalam Kegiatan PNB IT Competit', 'Politeknik Negeri Bali', 'Penting', '5630-PNB IT Competition.pdf', '2', '2022-08-18'),
(250, '1842/LL8/WS.01.07/2022', '2022-08-15', 'Surat Undangan', 'Undangan Training of Trainers (ToT) Pendidikan Ant', 'LLDIKTI 8', 'Penting', '7710-Undangan ToT Pendidikan Antikorupsi.pdf', '2', '2022-08-18'),
(251, '1819/LL8/KM.01.02/2022', '2022-08-12', 'Surat Undangan', 'Lomba Debat Mahasiswa Jawa Post Radar Bali ', 'LLDIKTI 8', 'Penting', '396-Debat Mahasiswa Jawa Post.pdf', '2', '2022-08-18'),
(252, ' 0789/E5.5/AL.04/2022', '2022-08-22', 'Surat Edaran', 'Perpanjangan Batas Waktu Pemutakhiran Data pada SI', 'Kemendikbud-ristek', 'Penting', '377-DOC-20220822-WA0019..pdf', '2', '2022-08-23'),
(253, '1744/UN48.16/PM/2022', '2022-08-15', 'Surat Undangan', 'Undangan Call for Paper dan Seminar Nasional', 'LPPM Universitas Pendidikan Ganesha ', 'Penting', '5732-SURAT SENADIMAS 7.pdf', '2', '2022-08-23'),
(254, '1480/UN1/KM.UGM/Set.KM/PK.01.05/2022', '2022-08-18', 'Surat Undangan', 'Undangan Creative Hub Series#2 Area 3', 'Universitas Gadjah Mada', 'Penting', '3776-1480_Undangan Creative Hub Series#2 Area 3 signed.pdf', '2', '2022-08-23'),
(255, '1207/Wil-XI/0822', '2022-08-22', 'Surat Undangan', 'Pendaftaran Civitas Akademika pada kegiatan BPJS K', 'BPJS Kesehatan', 'Penting', '5338-Rektor STMIK Primakara.pdf', '2', '2022-08-24'),
(256, '001/SM/VIII/2022', '2022-08-25', 'Surat Undangan', 'Menghadiri Undangan In Coach Asia : Development Me', 'ICA', 'Penting', '4565-Invitation ICA.pdf', '2', '2022-08-25'),
(257, '10843.75/K.STIKESWIKA/LL/VIII/2022', '2022-08-15', 'Surat Undangan', 'Sosialisasi Visi, Misi, Tujuan, dan Strategi Insti', 'STIKES Wira Medika', 'Penting', '2071-Undangan_Stimik Primakara.pdf', '2', '2022-08-29'),
(258, 'B 958/IKMA.2/IND/VIII/2022', '2022-08-23', 'Surat Undangan', ' Sosialisasi II Indonesia Food Innovation (IFI)', 'Direktorat Jenderal Industri Kecil dan Menengah da', 'Penting', '7829-Surat Undangan Sosialisasi II IFI 2022.pdf', '2', '2022-08-29'),
(259, '1985/LL8/LP.00.01/2022', '2022-08-24', 'Surat Undangan', 'Seremonial penandatanganan MoU & Kerjasama BIMTEK ', 'LLDIKTI 8', 'Penting', '7153-Undangan Seremoni Penandatanganan MoU & BIMTEK Kerjasama (1).pdf', '2', '2022-08-31'),
(260, ' 5391/E2/DT.01.01/2022 ', '2022-08-25', 'Surat Undangan', 'Sosialisasi Abdidaya Ormawa 2022', 'Kemendikbud-ristek', 'Penting', '4665-310801092022 UND Sosialisasi Abdidaya 2022_Peserta.pdf', '2', '2022-08-31'),
(261, '017/E/ICCN/VIII/2022', '2022-08-29', 'Surat Undangan', 'Kegiatan ICCN Summit 2022', 'Indonesia Career Center Network ', 'Penting', '2052-ICCN Summit 2022 (Surat).pdf', '2', '2022-08-31'),
(262, '003/SM/VIII/2022', '2022-08-30', 'Surat Undangan', 'Sanjose Education Fair 2022', 'SMAS K Santo Yoseph Denpasar', 'Penting', '6887-Edufair Sanjose.pdf', '2', '2022-08-31'),
(263, '2070/LL8/KM.00/2022', '2022-08-30', 'Surat Undangan', 'Workshop Penyelenggaraan Beasiswa PMDSU Batch VII', 'LLDIKTI 8', 'Penting', '7415-Dokumen_64862_1661835524 (1).pdf', '2', '2022-09-01'),
(264, '2123/LL8/HM.00.03/2022', '2022-09-01', 'Surat Edaran', 'Sosialisasi Anugerah Humas Diktiristek 2022 Bagi P', 'LLDIKTI 8', 'Penting', '8267-20220901 - AHD 2022 PTS LL8.pdf', '2', '2022-09-02'),
(265, '08.018/PL8.UKM/PAN-INTECHFEST/2022', '2022-08-29', 'Surat Undangan', 'Undangan Lomba Information and Technology Festival', 'Politeknik Negeri Bali', 'Penting', '3264-Undangan Lomba Intechfest PNB.pdf', '2', '2022-09-05'),
(266, '422.1/0895/SMAN.1-DPS/Disdik Prov.Bali', '2022-08-02', 'Surat Undangan', 'Tawaran Kerjasama Education Fair Perguruan Tinggi ', 'SMA Negeri 1 Denpasar', 'Penting', '5324-Proposal Education Fair 2022.pdf', '2', '2022-09-05'),
(267, '3143/JBM/IX/2022', '2022-09-05', 'Surat Penawaran Kerjasama', 'Permohonan Penawaran Konsultan Perencanaan dan Pen', 'PT. Jamkrida Bali Mandara', 'Penting', '5282-Penawaran Proyek PT. Jamkrida Denpasar.pdf', '2', '2022-09-07'),
(268, 'B.24.005/13133/SANDI/D.KOMINFOS', '2022-09-09', 'Surat Undangan', 'Sosialisasi  Voluntary Vulnerability Identificatio', 'Diskominfos', 'Penting', '6016-Surat Keluar-090922123511.pdf', '2', '2022-09-09'),
(269, 'B.420.003.3/1518/SMAN2.NGR/Disdikpora', '2022-09-05', 'Surat Penawaran Kerjasama', 'Partisipasi Stand  SMANDAN EXPO Tahun 2022', 'SMA Negeri 2 Negara ', 'Penting', '1616-Surat Penawaran Partisipasi Stand SMANDAN EXPO 2022.pdf', '2', '2022-09-13'),
(270, '2406/LL8/HM.01.00/2022 ', '2022-09-12', 'Surat Edaran', 'Rubrik Cerita Kita', 'LLDIKTI 8', 'Penting', '6967-Dokumen_71106_1662955286.pdf', '2', '2022-09-13');
INSERT INTO `sip_suratmasuk` (`idSurat`, `noSurat`, `tglSurat`, `jenisSurat`, `perihal`, `asalSurat`, `sifatInstruksi`, `fileSurat`, `userInput`, `tglInput`) VALUES
(271, '064/N00100/2022-S9', '2022-09-05', 'Surat Undangan', 'Undangan Mengikuti Pertamuda Seed & Scale 2022', 'PT. Pertamina Persero', 'Penting', '1662-Undangan Kompetisi Pertamuda Seed & Scale 2022.pdf', '2', '2022-09-14'),
(272, 'YCPW/2022/09/12/ARW/01', '2022-09-14', 'Surat Permohonan', ' Lokakarya Perencanaan Karir Kaum  Muda YKIP â€“ 2', 'Yayasan Kemanusiaan Ibu Pertiwi ', 'Penting', '4955-YCPW 220912 ARW 01.pdf', '2', '2022-09-14'),
(273, '05/KTDB/TTR/VIII/2022', '2022-08-31', 'Surat Permohonan', 'Surat Permohonana Narasumber pada Pelatihan atau m', 'Panitia Teruna Teruni Renon', 'Penting', '9225-Surat Permohonan Karang Taruna Dharma Bhakti.pdf', '2', '2022-09-19'),
(274, 'B.24.046/13326/SANDI/D.KOMINFOS', '2022-09-13', 'Surat Undangan', 'Kickoff Meeting Kegiatan VVIP-Program', 'Diskominfos', 'Penting', '806-Surat-130922141602.pdf', '2', '2022-09-19'),
(275, 'B.31.880/5625/SMKN1 DPS/Dikpora', '2022-08-30', 'Surat Permohonan', 'Permohonan Sponsorship pada Kegiatan HUT SMK Neger', 'SMK Negeri 1 Denpasar ', 'Penting', '4251-4. Primakara.pdf', '2', '2022-09-19'),
(276, '3500/E4/DT.04.03/2022', '2022-08-28', 'Surat Edaran', 'Pengumuman Penawaran Program Anugerah Dosen sebaga', 'Kemendikbud-ristek', 'Penting', '5330-Pengumuman-Penawaran-Program-Anugerah-Do&hellip;-sebagai-Academic-Leaders-Tahun-2022.pdf', '2', '2022-09-21'),
(277, 'EDUFAIR/004/VIII/2022', '2022-09-12', 'Surat Undangan', 'Edufair SMAN 1 Kediri 2022', 'SMAN1 Kediri', 'Penting', '3936-Edufair SMAN 1 Kediri.pdf', '2', '2022-09-21'),
(278, 'EDUFAIR/005/XII/2022', '2022-09-12', 'Surat Undangan', 'Edufair SMKN 2 Denpasar 2022', 'SMKN 2 Denpasar', 'Penting', '9242-Edufair SMKN 2 Denpasar.pdf', '2', '2022-09-21'),
(279, 'UM.008/2416/PTP-II/KEMPAR/2022', '2022-09-09', 'Surat Permohonan', 'Permohonan Data Penelitian', 'Politeknik Pariwisata Bali ', 'Penting', '6914-Permohonan Data Penelitian.pdf', '2', '2022-09-22'),
(280, ' I-029/DPW-Bali/IX/2022', '2022-09-23', 'Surat Undangan', 'Undangan Menghadiri Pelantikan DPW Bali', 'Gekrafs DPW Bali ', 'Penting', '4273-Undangan_Institusi Pendidikan.docx.pdf', '2', '2022-09-23'),
(281, '06/KEM/09/2022', '2022-09-19', 'Surat Undangan', 'Undangan Kegiatan Peluncuran Smesco Hub Timur (SHT', 'Smesco Hub Timur ', 'Penting', '1994-Event Pasar Nusa Dua.pdf', '2', '2022-09-23'),
(282, 'B.21.660/4324/SEKRET/DKLH', '2022-09-20', 'Surat Edaran', 'Pelaksanaan Pergub 97 Tahun 2018 dan  Pergub 47 Ta', 'Sekretariat Daerah', 'Penting', '6623-Pelaksanaan Pergub 97 Tahun 2018 perguruan Tinggi.pdf', '2', '2022-09-23'),
(283, '24/B/TON/IX/2022', '2022-09-18', 'Surat Edaran', 'Undangan Mengikuti Lomba Monolog Dan Baca Puisi', 'Teater Orok Noceng Univ. Udayana', 'Penting', '9431-STIKI Primakara.pdf', '2', '2022-09-23'),
(284, '4221/E1/Hk.01.01/2022', '2022-09-26', 'Surat Edaran', 'Pembelajaran Lampau pada Perguruan Tinggi yang Men', 'Kemendikbud-ristek', 'Penting', '9271-Salinan_Kepdirjen_Diktiristek_No_162_E_KPT_2022_ Juknis_RPL_Pendidikan_Tinggi_Akademik.pdf', '2', '2022-09-26'),
(285, '2683/LL8/KM/2022', '2022-09-24', 'Surat Undangan', 'Undangan Seminar Nasional Penguatan dan Perluasan ', 'LLDIKTI 8', 'Penting', '7454-APznzabONUiBAP5sHo-6vU157A9DZ_NF4x7wSdRmUG4VBZu5E18WcrKMvyyTZ8tagc6aqrssuUh_KJbXQcbvsTQl_N78NSTYfyRfiW1XCoMBrLxrdIOVVN-u0y0L8jH32XJ0WmpdLPc8ekH8EHm10qK42zisYNXmzJeuA6QV_OgnhwEgPaaeqLBzwUclsJ2IfOJQcMe9QqwTFBqXu4fC8Nw.pdf', '2', '2022-09-26'),
(286, '2684/LL8/KM/2022', '2022-09-25', 'Surat Undangan', 'Undangan Sosialisasi Implementasi 3 Dosa PT dan An', 'LLDIKTI 8', 'Penting', '8671-Dokumen_77715_1664107232.pdf', '2', '2022-09-27'),
(287, 'UM.04.01/1411/PTP.IV/KEMENPAREKRAF/2022', '2022-09-26', 'Surat Permohonan', 'Permohonan Studi Banding', 'Politeknik Pariwisata Lombok', 'Penting', '1187-( SEPTEMBER 1411 ) Surat Studi Banding STMIK.pdf', '2', '2022-09-27'),
(288, '042-09/PC-AS/BC/PKS/IX/2022', '2022-09-23', 'Surat Permohonan', 'Permohonan Delegasi Peserta Techconnect Career Hac', 'Sinar Mas Mining Technoconnect', 'Penting', '6388-Surat Permohonan Kepada Rektor STMIK PRIMAKARA BALI.pdf', '2', '2022-09-27'),
(289, '0876/E5/KB.09.00/2022', '2022-09-08', 'Surat Undangan', 'Peserta Workshop Sentra Kekayaan  Intelektual Tahu', 'Kemendikbudristek', 'Penting', '4919-Undangan Peserta Workshop Sentra Kekayaan Intelektual Tahun 2022 Lokasi Bali__2f109d4b (4).pdf', '2', '2022-09-28'),
(290, 'B/164/UN14.7.K/DL.17./2022', '2022-09-27', 'Surat Undangan', 'Seminar World Rabies Day 2022', 'Pusat Kajian One Health Universitas Udayana', 'Penting', '5198-B-164-DL17-2022_Undangan Seminar Rabies.pdf', '2', '2022-09-28'),
(291, '001/SM/IX/2022', '2022-09-28', 'Surat Edaran', 'Pendaftaran Anugerah Kerjasama Diktiristek 2022', 'LLDIKTI 8', 'Penting', '5486-Pendaftaran Anugrah Kerjasama.pdf', '2', '2022-09-28'),
(292, '024/HIMAPRODI-M/II-SPP/IX/2022', '2022-09-23', 'Surat Undangan', 'Permohonan Partisipasi Sebagai Perserta Lomba Vide', 'HIMA Prodi Manajemen Undiknas', 'Penting', '1269-Lomba Undiknas.pdf', '2', '2022-10-03'),
(293, 'B.20.556.00/4883/DEKON/DISPAR', '2022-09-28', 'Surat Permohonan', 'Permohonan Narasumber pada Kegiatan Pelatihan Pema', 'Dinas Pariwisata Pemprov Bali ', 'Penting', '9393-Surat Keluar-290922141952.pdf', '2', '2022-10-03'),
(294, '075/IX/CST/EDU/2022', '2022-09-28', 'Surat Permohonan', 'Permohonan dan Jadwal Audiensi Program Kerjasama C', 'CBN', 'Penting', '110-Audiensi CBN.pdf', '2', '2022-10-03'),
(295, '613/APTISI Wil. VII/09/2022', '2022-09-06', 'Surat Undangan', 'Undangan Partisipasi Peserta Lomba Nasional Kreati', 'Aptisi Wilayah VII Jawa Timur', 'Penting', '8050-Surat undangan partisipasi lomba LO Kreatif 2022 - FIX.pdf', '2', '2022-10-07'),
(296, '018/UKM.PROGRESS/BEM.ITBSTIKOM/IX/2022', '2022-09-23', 'Surat Permohonan', 'Lomba Infinity 2022', 'STIKOM Bali ', 'Penting', '2196-infinity Stikom.pdf', '2', '2022-10-11'),
(297, '217/II-4/FEB/X/2022', '2022-10-04', 'Surat Permohonan ', 'Surat Permohonan Data dan Ijin Penelitian', 'Universitas Pendidikan Nasional', 'Penting', '9995-permohonan data dan ijin penelitian.pdf', '2', '2022-10-11'),
(298, ' EDUFAIR/064/XII/2022', '2022-09-25', 'Surat Undangan', 'Edufair SMAN 1 Bangli 2022', 'SMAN 1 Bangli ', 'Penting', '4657-Edufair SMAN 1 Bangli.pdf', '2', '2022-10-11'),
(299, '2977/LL8/HM.03.01/2022', '2022-10-10', 'Surat Edaran', 'Survei Kehumasan', 'LLDIKTI 8', 'Penting', '4404-Dokumen_85193_1665378068.pdf', '2', '2022-10-12'),
(300, '027/02/SMAN 1 PETANG', '2022-09-28', 'Surat Permohonan', 'Permohoan Bantuan Dana dalam Bulan Bahasa ', 'SMAN 1 Petang', 'Penting', '9062-Primakara.pdf', '2', '2022-10-12'),
(301, '201/SMASK/DP.19/2022', '2022-10-06', 'Surat Permohonan', 'Permohonan Narasumber dalam Projek Penguatan Profi', 'SMASK Santo Yoseph Denpasar', 'Penting', '6366-Surat STIMIK Primakara.pdf', '2', '2022-10-12'),
(302, '598/LA/23730/2022', '2022-10-12', 'Surat Undangan', 'Undangan Acara User Forum Squra', 'Lintasarta', 'Penting', '6638-Undangan User Forum Squra - STMIK PRIMAKARA DENPASAR.pdf', '2', '2022-10-14'),
(303, '01/SM/X/2022', '2022-10-14', 'Surat Undangan', 'Sosialisasi Pelatihan Associate Data Scientist', 'Kominfo', 'Penting', '2175-VCSA Kominfo.pdf', '2', '2022-10-14'),
(304, 'B-2048/DJAI.5/AI.03.04/10/2022', '2022-10-13', 'Surat Undangan', 'Undangan Hacksprint Gerakan Nasional 1000 Startup ', 'Kominfo', 'Penting', '1106-1000 Startup Digital - Surat Undangan Hacksprint.docx.pdf', '2', '2022-10-14'),
(305, '025/HIMAPRODI-M/II-SPP/IX/', '2022-10-13', 'Surat Undangan', 'Lomba Business Plan Youth Management Competition (', 'HIMA Prodi Manajemen Undiknas', 'Penting', '5063-Lomba Undiknas 29.10.pdf', '2', '2022-10-18'),
(306, '028/SPN/BAAK/IX/2022', '2022-10-17', 'Surat Permohonan', 'Izin Survey Proposal Skripsi', 'BAAK Primakara', 'Penting', '5011-Izin Survei Proposal Skripsi.pdf', '2', '2022-10-18'),
(307, '3163/LL8/KM/2022', '2022-10-17', 'Surat Undangan', 'Sharing Session Pengalaman dan Pengetahuan Perubah', 'LLDIKTI 8', 'Penting', '4381-Dokumen_89668_1666004029.pdf', '2', '2022-10-18'),
(308, '063/SU/02/CAST/X/2022', '2022-10-18', 'Surat Permohonan', 'Permohonan Undangan Mahasiswa dalam Makervese: Ope', 'Bali Fab Fest', 'Penting', '6439-Surat Primakara - Makerverse Day.pdf', '2', '2022-10-18'),
(309, '019/UKM.PROGRESS/BEM.ITBSTIKOM/IX?2022', '2022-10-09', 'Surat Permohonan', 'Permohonan Partisipasi Seminar INFINITY 2022', 'ITB Stikom Bali', 'Penting', '5799-Permohonan Partisipasi STIKOM.pdf', '2', '2022-10-21'),
(310, '02/1045-3/18041', '2022-10-31', 'Surat Permohonan', 'Permohonan Audiensi Guna Pengenalan Produk BSI ', 'Bank Syariah Indonesia', 'Penting', '503-BSI Syariah.pdf', '2', '2022-10-21'),
(311, '02/SM/V/2022', '2022-10-25', 'Surat Permohonan', 'Kerjasama Road To Campus Event Bali Digital Fashio', 'Maja Labs', 'Penting', '991-Surat Undangan Stimik.pdf', '2', '2022-10-25'),
(312, '03.142/KBS/X/2022', '2022-10-19', 'Surat Undangan', 'Undangan Denpasar Investment Class (Bkraf Academy)', 'Fin-E', 'Penting', '7084-Surat Undangan Bkraf Academy_STIMIK PRIMAKARA.pdf', '2', '2022-10-25'),
(313, '451/PERMOHONAN/BM-HOKI/DPS/IX/2022', '2022-09-27', 'Surat Permohonan', 'Permohonan Audiensi dan Perkenalan Produk Kredit \"', 'HOKI Bank ', 'Penting', '5338-Surat Permohonan.pdf', '2', '2022-10-25'),
(314, '01/SM/XI/2022', '2022-10-31', 'Surat Permohonan', 'Permohonan Kerjasama Media Partner e-WMS 2022', 'Markplus.Inc', 'Penting', '7356-Markplus .pdf', '2', '2022-11-02'),
(315, '2311-2337/UN.8.11/PP/2022', '2022-10-11', 'Surat Permohonan', 'Penawaran Pelatihan dan Sertifikasi ', 'Universitas Pendidikan Ganesha ', 'Penting', '5883-Undiknas.pdf', '2', '2022-11-02'),
(316, '010/HIPMI-PT-UNMAS/UNMAS-DPS/X/2022', '2022-10-08', 'Surat Undangan', 'Peserta dan Pemakalah Seminar Nasional', 'HIPMI PT Univ. Mahasaraswati', 'Penting', '169-Hima PT Univ. Saraswati.pdf', '2', '2022-11-02'),
(317, '160/IDBBALI/KMH/X/2022', '2022-10-27', 'Surat Permohonan', 'Peminjaman Lapangan Basket', 'IDB Bali', 'Penting', '2530-IDB Bali.pdf', '2', '2022-11-02'),
(318, '421.3/0788/SMAN 5 Dps/Disdikpora Prov.Bali/2022', '2022-10-13', 'Surat Undangan', 'Undangan Smanela Expo 2022', 'SMA Negeri 5 Denpasar', 'Penting', '3931-Undangan SMANELA Expo.pdf', '2', '2022-11-02'),
(319, '002/SM/XII/2022', '2022-11-02', 'Surat Undangan', 'Education Expo Pertama di Bali', 'Garasi Event', 'Penting', '4775-ZettaByte.pdf', '2', '2022-11-02'),
(320, '069/SPKS-ZB/HRD/2022', '2022-10-26', 'Surat Permohonan', 'Permohonan Kerjasama', 'ZettaByte', 'Penting', '2682-ZettaByte.pdf', '2', '2022-11-02'),
(321, '003/SM/XI/2022', '2022-11-02', 'Surat Undangan', 'Education Expo Pertama di Bali', 'Garasi Event', 'Penting', '36-EDUCATION EXPO PROPOSAL INDONESIAN.pdf', '2', '2022-11-02'),
(322, '001/SM/XI/2022', '2022-11-07', 'Surat Undangan', 'Undangan Startup Pitch Program', 'Eco Tourism Bali', 'Penting', '8611-Surat Undangan Mahasiswa Direktur STMIK Primakara.pdf', '2', '2022-11-07'),
(323, '3533/LL8/TU.02.03/2022', '2022-11-08', 'Surat Undangan', 'Upacara Peringatan Hari Pahlawan Tahun 2022', 'LLDIKTI 8', 'Penting', '1284-LL8 - Surat Undangan Upacara Hari Pahlawan 2022 - Dosen.pdf', '2', '2022-11-09'),
(324, '002/SM/XI/2022', '2022-11-07', 'Surat Undangan', 'Undangan Zoom Meeting ', 'PT. Inovasi Solusi Nusantara', 'Penting', '4657-STMIK Primakara (1).pdf', '2', '2022-11-09'),
(325, 'B-1033 /BPSDMP.34/LT.02.02/11/2022', '2022-11-07', 'Surat Undangan', 'Undangan Sosialisasi DTS', 'Kominfo', 'Penting', '4391-1033 Undangan Sosialisasi DTS untukUndangan Sosialisasi DTS untuk Mitra Kampus Provinsi Bali tte.pdf (1).pdf', '2', '2022-11-09'),
(326, 'S-746/WPJ.17/2022', '2022-09-29', 'Surat Pemberitahuan', 'Pengumpulan Rencana Pembelajaran Semester (RPS) da', 'Direktorat Jenderal Pajak ', 'Penting', '5220-Kementerian Keuangan.pdf', '2', '2022-11-10'),
(327, '0038/SP/AP-DPS/KC/II/XI/2022', '2022-11-10', 'Surat Permohonan', 'Permohonan Peminjaman Lab RPL', 'Alfa Prima', 'Penting', '8297-SURAT PERMOHONAN PEMINJAMAN LAB RPL STMIK PRIMAKARA.pdf', '2', '2022-11-10'),
(328, '7060/E2/DT.00.00/2022', '2022-10-06', 'Surat Undangan', 'Seminar Internasional IDCP dengan tema Value-Based', 'Kemendikbud-ristek', 'Penting', '2602-Sign-Undangan Peserta Daring Seminar Internasional IDCP.pdf', '2', '2022-11-10'),
(329, 'B/KWU.6/S.95/D.IV.M.EKON.1/11/2022', '2022-11-10', 'Surat Pemberitahuan', 'Rencana Kunjungan Dalam Rangka Koordinasi Pengumpu', 'KEMENTERIAN KOORDINATOR BIDANG PEREKONOMIAN', 'Penting', '9826-S 95 Surat ke STMIK Primakara.pdf', '2', '2022-11-11'),
(330, '254/A.4/2022', '2022-11-08', 'Surat Undangan', 'Undangan Menghadiri Kegiatan Peluncuran Panduan In', 'Kementerian Investasi/BPKM ', 'Penting', '9319-Undangan Launching Panduan SIG.pdf', '2', '2022-11-11'),
(331, 'B.31.421.3/5248/SMA N 1 KUTA UTARA/DIKPORA', '2022-10-20', 'Surat Permohonan', 'Permohonan Sponsorship Kegiatan Pentas Budaya SMAN', 'SMA Negeri 1 Kuta Utara ', 'Penting', '9860-PROPOSAL SPONSORSHIP PENTAS BUDAYA SAKURA 2022-2a.pdf', '2', '2022-11-11'),
(332, '004/SM/XI/2022', '2022-11-11', 'Surat Permohonan', 'Penggalian Dana HUT ke-47 SMA Kuta Pura', 'SMA Kuta Pura', 'Penting', '6124-PROPOSAL PENGGALIAN DANA HUT KE-47 SMA KUTA PURA .pdf', '2', '2022-11-11'),
(333, '005/SM/XI/2022', '2022-11-11', 'Surat Permohonan', 'Permohonan Wawancara Startup Ecosystem Report', 'Daily Social ', 'Penting', '1343-Surat Permohonan - [Startup Ecosystem] - Startup.docx (1).pdf', '2', '2022-11-11'),
(334, '3600/LL8/KM/2022 ', '2022-11-14', 'Surat Undangan', 'Pelaksanaan Kampus Merdeka Fair di Universitas Pen', 'LLDIKTI 8', 'Penting', '7689-LLDIKTI.pdf', '2', '2022-11-15'),
(335, 'B.17.005/10070/Bid.I/BRIDA', '2022-11-09', 'Surat Undangan', 'Seminar Nasional Pengelolaan Jurnal Terakreditasi ', 'Sekretariat Daerah', 'Penting', '1991-Litbang Sekretariat Daerah.pdf', '2', '2022-11-15'),
(336, 'B/1272/BPSDMI/BDI-Denpasar/DL/XI/2022', '2022-11-10', 'Surat Undangan', 'Undangan Pameran', 'Balai Diklat Industri Denpasar', 'Penting', '7580-Balai Diklat Denpasar (Pameran).pdf', '2', '2022-11-15'),
(337, 'B/1263/BPSDMI/BDI-Denpasar/HM/XI/2022', '2022-11-08', 'Surat Undangan', 'Undangan Peserta Talkshow, Seminar, Workshop dan K', 'Balai Diklat Industri Denpasar', 'Penting', '609-Balai Diklat Denpara (Undangan) .pdf', '2', '2022-11-15'),
(338, '006/SM/XI/2022', '2022-11-15', 'Surat Permohonan', 'Permohonan Kerjasama Campus Partner Galang UKM Ind', 'Markplus.Inc', 'Penting', '9191-Markplusinc. Galang UKM.pdf', '2', '2022-11-15'),
(339, 'B.031.005/2890/SMAN 1 PETANG/DIKPORA', '2022-11-28', 'Surat Undangan', 'Education Expo SMAN 1 Petang', 'SMAN 1 Petang', 'Penting', '5978-STMIK PRIMAKARA (1).pdf', '2', '2022-11-28'),
(340, '0081/SD-Santosa/XI/2022', '2022-11-29', 'Surat Undangan', 'Undangan Acara Art & Musci Exshibition', 'Santosa School', 'Penting', '60-Undangan Santosa.pdf', '2', '2022-12-05'),
(341, '001/SM/XII/2022', '2022-12-05', 'Surat Undangan', 'Undangan seminar Waste Management and Renewable En', 'Consulat General Australia ', 'Penting', '6018-Konsulat Australia.pdf', '2', '2022-12-05'),
(342, '4402/LL8/KM/2022 ', '2022-12-05', 'Surat Undangan', 'Undangan RekaTalks Kedaireka', 'LLDIKTI 8', 'Penting', '8544-Dokumen_118220_1670197224.pdf', '2', '2022-12-05'),
(343, ' 4439/LL8/KM.00/2022', '2022-12-06', 'Surat Undangan', 'Informasi Program Bangkit', 'LLDIKTI 8', 'Penting', '2430-Informasi Program Bangkit.pdf', '2', '2022-12-06'),
(344, '003/SM/XII/2022', '2022-12-08', 'Surat Undangan', 'Surat Undangan mahasiswa untuk berpartisipasi dala', 'Maja Labs', 'Penting', '3939-Surat Undangan BDFW u_ STIMIK.pdf', '2', '2022-12-08'),
(345, '03.152/KBS/XII/2022', '2022-11-02', 'Surat Undangan', 'Undangan FINE FESTIVAL â€œCatch Great Opportunity ', 'Fin-E', 'Penting', '9469-152_SURAT UNDANGAN FINE FESTIVAL_STIMIK PRIMAKARA.pdf', '2', '2022-12-08'),
(346, '4118/LL8/KS.01.00/2022 ', '2022-11-25', 'Surat Edaran', 'Akun Aplikasi Layanan Pendidikan Tinggi Berbasis D', 'LLDIKTI 8', 'Penting', '8648-4118_Surat Akun Layanan LLDikti8.pdf', '2', '2022-12-08'),
(347, '5094/KIII.4/C.5/XII/2022', '2022-12-06', 'Surat Undangan', 'Pameran Pendidikan ke-12 Tahun 2023', 'SMK PGRI 4 Denpasar', 'Penting', '6121-SMK PGRI 4 Denpasar.pdf', '2', '2022-12-14'),
(348, 'B.31.003.3/58.40/SMKN 1 BGL/DIKPORA', '2022-12-07', 'Surat Permohonan Partisipasi', 'Sponsorship dlm Rangka HUT SMK Negeri 1 Bangli', 'SMKN 1 Bangli', 'Penting', '5292-SMKN 1 BANGLI.pdf', '2', '2022-12-14'),
(349, '016 / SRB / SK / XII / 2022', '2022-12-16', 'Surat Permohonan', 'Permohonan Sebagai Narasumber', 'Samsara Living Museum', 'Penting', '2476-Surat Permohonan Narasumber Primakara.pdf', '2', '2022-12-16'),
(350, '004/SM/XII/2022', '2022-12-16', 'Surat Undangan', 'Edufair MGBK SMA-SMK-MA Kab. Banyuwangi 2023', 'MGBK Kab.Banyuwangi', 'Penting', '9774-PROPOSAL EDUFAIR 2023.pdf', '2', '2022-12-16'),
(351, '83/XII/FORKOM-OSIS/Dps/2022', '2022-12-17', 'Surat Undangan', 'Expo Pendidikan', 'Forum Komunikasi Osis SMA/MA/SMK Kota Denpasar', 'Penting', '148-expo. pendidikan FORKOM.pdf', '2', '2022-12-20'),
(352, '457/EX-SALES/OFA/XI/2022', '2022-12-13', 'Surat Undangan', 'Diskusi Program Study Independent Kampus Merdeka M', 'LLDIKTI 8', 'Penting', '7864-Undangan Partisiapasi Orbit - MBKM Mandiri.pdf', '2', '2022-12-20'),
(353, '002/INSTIKI.HIMA-TI/SPm.03/12/2022', '2022-12-27', 'Surat Permohonan', 'Permohonan Peserta Lomba PARAS ICT', 'Instiki', 'Penting', '2414-Paras ICT.pdf', '2', '2023-01-06'),
(354, '065/SU/AP-D/UKMKWU/XIs/2022', '2022-01-12', 'Surat Undangan', 'Peserta Kegiatan Enterpreneur Week ', 'Alfa Prima', 'Penting', '3470-Alfa Prima Undangan.pdf', '2', '2023-01-12'),
(355, '0358/LL8/KM/2023', '2023-01-26', 'Surat Undangan', 'Sosialisasi Pendataan Penyelenggaraan RPL melalui ', 'LLDIKTI 8', 'Penting', '4972-Dokumen_144725_1674705895_Sosialisasi-Pendataa.pdf', '2', '2023-01-26'),
(356, '0408/LL8/KS.01.00/2023 ', '2023-01-31', 'Surat Undangan', 'Pendampingan PDDIKTI Neo Feeder', 'LLDIKTI 8', 'Penting', '6110-Pendampingan PDDikti Neo Feeder LLDikti Wilayah 8.pdf', '2', '2023-01-31'),
(357, 'B.20.556 /680/PKSDM/DISPAR', '2023-02-02', 'Surat Permohonan', 'Permohonan Narasumber  Pelatihan Pemasaran Digital', 'Dinas Pariwisata Pemprov Bali ', 'Penting', '3801-Dispar Bali (Narsum).pdf', '2', '2023-02-06'),
(358, '001/SM/II/2023', '2023-02-06', 'Surat Permohonan', 'Permohonan Share Informasi Lowongan Kerja kepada M', 'Focus Production', 'Penting', '6719-Focus Production.pdf', '2', '2023-02-06'),
(359, '03/BbH/II/2023', '2023-02-01', 'Surat Penawaran', 'Penawaran Program Pelatihan Jurnal Manager', 'BABALI HEALTH', 'Penting', '3339-Jurnal Manager Dasar.pdf', '2', '2023-02-06'),
(360, 'B/489/UN34/KM.05.03/2023', '2023-02-06', 'Surat Undangan', 'Undangan Mengikuti Inovasi Kewirausahaan Mahasiswa', 'Universitas Negeri Yogyakarta ', 'Penting', '7977-Undangan Invitasi LIKMI UNY 2023 STMIK Primakara.pdf', '2', '2023-02-08'),
(361, '3022/UND/SVM/II/2023', '2023-02-06', 'Surat Undangan', 'Webinar ONLINE via ZOOM Bersama Pejabat Kemdikbudr', 'SEVIMA', 'Penting', '8475-Undangan Webinar SEVIMA - Sukses RPL.docx.pdf', '2', '2023-02-08'),
(362, '034/Panpel-SEF/BEMFEB-UNMAS/I/2023', '2023-02-07', 'Surat Undangan', 'Undangan Lomba Entrepreneur Festival Vol.5', 'BEM Fakultas Ekonomi dan Bisnis Universitas Mahasa', 'Penting', '9107-Saraswati Entrepreneur Festival.pdf', '2', '2023-02-08'),
(363, 'B.17.074/927/Bid.I/BRIDA', '2023-02-03', 'Surat Undangan', 'Partisipasi untuk Mengirimkan Proposal Penelitian ', 'Badan Riset dan Inovasi Daerah ', 'Penting', '7367-Penelitian Kajian Pada BRIDA dengan Perguruan Tinggi.pdf', '2', '2023-02-14'),
(364, 'B.32.027/429/UPTD. RUMAH KREATIF/DISPERINDAG', '2023-02-09', 'Surat Permohonan', 'Mohon Publikasi Pengumuman Seleksi Tenaga Ahli/Pro', 'Dinas Perindustrian dan Perdagangan', 'Penting', '7873-Tenaga Ahli Design Grafis.pdf', '2', '2023-02-14'),
(365, '002/SM/II/2023', '2023-02-14', 'Surat Permohonan', 'Permohonan Menyelenggarakan Acara di Kampus STMIK ', 'Natasha Skin Clinic Center ', 'Penting', '3375-Teknis Event Generasi Glowing.pdf', '2', '2023-02-14'),
(366, '108/A/Panpel-ELCCO/HME/FT-UNUD/I/2023', '2023-01-10', 'Surat Undangan', 'Lomba ELCCO (Electrical and Computer Competition) ', 'Himpunan Mahasiswa Elektro Unud', 'Penting', '7739-Univ Udayana, ELCCO.pdf', '2', '2023-02-17'),
(367, '01.003/PL8.HMJ/PAN-NAC/2023', '2023-01-22', 'Surat Undangan', 'National Accounting Competition ', 'Himpunan Mahasiswa Jurusan Akuntansi Politeknik Ne', 'Penting', '8513-Akuntansi PNB.pdf', '2', '2023-02-17'),
(368, '003/SM/II/2023', '2023-01-16', 'Surat Permohonan', 'Permohonan Penyebarluasan Informasi Lowongan Progr', 'PT. Arfadia', 'Penting', '9140-PT. Arfadia.pdf', '2', '2023-02-23'),
(369, '0639/LL8/HK.12.01/2023', '2023-02-22', 'Surat Undangan', 'Pelatihan Penulisan Deskripsi Permohonan Paten Bat', 'LLDIKTI 8', 'Penting', '3178-Pelatihan Penulisan Deskripsi Permohonan Paten Batch-1 Tahun 2023.pdf', '2', '2023-02-23'),
(370, '0630/LL8/KM/2023', '2023-02-21', 'Surat Pemberitahuan', 'Survey penyelenggaraan pendidikan khusus/inklusi d', 'LLDIKTI 8', 'Penting', '4881-Survey penyelenggaraan pendidikan khususinklusi di perguruan tinggi.pdf', '2', '2023-02-23'),
(371, '0629/LL8/KM/2023', '2023-02-21', 'Surat Pemberitahuan', 'Implementasi Pembelajaran Modul PPKS', 'LLDIKTI 8', 'Penting', '3346-Implementasi Pembelajaran Modul PPKS.pdf', '2', '2023-02-23'),
(372, '004/SM/II/2023', '2023-02-22', 'Surat Undangan', 'Online Event FI \"Startup Funding in Bali: How to R', 'Founder Institute', 'Penting', '5566-Startup Founder Online.pdf', '2', '2023-02-23'),
(373, '001/COMVET-TCL/SLO/II/2023', '2023-02-18', 'Surat Undangan', 'Permohonan Peserta pada Turnamen Offline Mobile Le', 'Steel Language Official', 'Penting', '9371-Steel Language Official.pdf', '2', '2023-02-24'),
(374, '005/SM/II/2023', '2023-02-13', 'Surat Undangan', 'Seminar dengan tajuk â€œJadi Engineer di Jepang Yu', 'PT EXEO INDONESIA', 'Penting', '3785-Invitation Letter menjadi Engineering di Jepang.pdf', '2', '2023-02-24'),
(375, '006/SM/II/2023', '2023-02-23', 'Surat Permohonan', 'Menyebarluasan informasi Campus Hiring di STMIK Pr', 'PT. Indomarco Prismatama (Indomaret)', 'Penting', '4328-Indomaret Campus Hiring.pdf', '2', '2023-02-24'),
(376, '001/SM/III/2023', '2023-03-01', 'Surat Permohonan', 'Permohonan Kerjasama Praktik Kerja Lapangan (PKL) ', 'PT. Automasi Digital Aset ', 'Penting', '864-PROPOSAL PERMOHONAN PROGRAM PKL STMIK PRIMAKARA BALI.pdf', '2', '2023-03-01'),
(377, '0727/LL8/KP.08.00/2023', '2023-02-28', 'Surat Edaran', 'Update Data Dosen pada Aplikasi SISTER', 'LLDIKTI 8', 'Penting', '273-2023_K_PM_6-LL8--2023_3634_1.pdf', '2', '2023-03-06'),
(378, '005/IRDH/II/2023', '2023-03-02', 'Surat Permohonan', 'Penawaran Workshop Online Penulisan Buku Ajar, Ref', 'PENERBIT IRDH', 'Penting', '8010-Tawaran Penyelenggaraan Workshop Bagi Dosen 2023.pdf', '2', '2023-03-06'),
(379, '002/SM/III/2023', '2023-03-07', 'Surat Undangan', 'Partisipasi dan Keikutsertaan pada Kegiatan Kick O', 'LLDIKTI 8', 'Penting', '4831-BaliGivation.pdf', '2', '2023-03-07'),
(380, '003/SM/III/2023', '2023-03-07', 'Surat Undangan', 'Menghadiri KegiatanHari Perempuan Internasional 20', 'Konsulat Jenderal Australia Bali ', 'Penting', '2706-International Women Day.pdf', '2', '2023-03-07'),
(381, 'B.17.880/1812/Bid.I/BRIDA', '2023-03-04', 'Surat Permohonan', 'Permohonan Data untuk program dan pelaksanaan  Pen', 'Badan Riset dan Inovasi Daerah Pemprov Bali', 'Penting', '5178-rgvZEFVqeFBB9rVtcESy9xCMmIZR3gGnrgmwXZdI_signed.pdf', '2', '2023-03-08'),
(382, '895.3/2356/SETDA/BALITBANG', '2023-02-27', 'Surat Undangan', 'Forum Kelitbangan untuk membahas  berbagai isu str', 'Sekretariat Daerah Pemkab Badung', 'Penting', '9671-5. Surat Undangan- Forum - PERGURUAN TINGGI.pdf', '2', '2023-03-08'),
(383, 'B/UND/492/UM.00.01/D.3.3/2023', '2023-03-07', 'Surat Undangan', 'Undangan FGD Pemetaan dalam Rangka Persiapan Penge', 'Kementerian Pariwisata Ekonomi Kreatif Deputi Bida', 'Penting', '6533-Surat Undangan Peserta FGD Klaster Kreatif Bali.pdf', '2', '2023-03-09'),
(384, '0682/SDM/PBK/2023', '2023-03-08', 'Surat Permohonan', 'Permohonan sebagai Juri ', 'PT. Bank Pembangunan Daerah Bali ', 'Penting', '4762-Permohonan Juri STIMIK.pdf', '2', '2023-03-09'),
(385, 'W.20.UM.01.01-1906', '2023-03-03', 'Surat Undangan', 'Undangan Peserta Diseminasi dan Promosi Kekayaan I', 'Kementerian Hukum dan Hak Asasi Manusia RI Kantor ', 'Penting', '4161-Und. Diseminasi dan Promosi Kekayaan Intelektual.pdf', '2', '2023-03-09'),
(386, '005 / 296 /DKIS', '2023-03-06', 'Surat Undangan', 'Undangan Sosialisasi Darurat Perlindungan Data  Pr', 'Sekretariat Daerah', 'Penting', '547-Surat Undangan Kampus TTE.pdf', '2', '2023-03-13'),
(387, '004/SM/III/2023', '2023-03-09', 'Surat Undangan', ' UID Bali Campus Gathering with Private Sector', 'UID Bali', 'Penting', '9400-Signed-14 Mar - Undangan Gathering CSO NGO - STMIK.pdf', '2', '2023-03-13'),
(388, 'BAL/453/4/2023', '2023-03-10', 'Surat Permohonan', 'Kolaborasi dalam Event  9 th International Day of ', 'Konsulat Jenderal India ', 'Penting', '3165-IDY 2023 - STMIK PRIMAKARA.pdf', '2', '2023-03-13'),
(389, 'B/347/UN14.2.5/DL.17/2023', '2023-03-14', 'Surat Undangan', 'Rapat Kerja Konsorsium Riset Automatic Identificat', 'Fakultas Teknik, Universitas Udayana', 'Penting', '3228-347 Undangan Ke Ketua STMIK Primakara - 1.pdf', '2', '2023-03-15'),
(390, '0988/LL8/KM/2023', '2023-03-14', 'Surat Undangan', 'Sosialisasi Program Bantuan Akselerasi Pengembanga', 'LLDIKTI 8', 'Penting', '4633-0988-LL8-KM-2023_1_8451.pdf', '2', '2023-03-15'),
(391, '0921/LL8/KS.07.00/2023', '2023-03-10', 'Surat Permohonan', 'Permohonan Informasi Beasiswa bagi Mahasiswa Asing', 'LLDIKTI 8', 'Penting', '8295-0921-LL8-KS.07.00-2023_1_4329.pdf', '2', '2023-03-15'),
(392, '005/SM/III/2023', '2023-03-11', 'Surat Penawaran Kerjasama', 'Invitation to Partner for ASEAN Data Science Explo', 'ASEAN Youth Organization', 'Penting', '3647-STMIK Primakara - Invitation to Partner for ASEAN Data Science Explorers Enablement Session 2023.pdf', '2', '2023-03-15'),
(393, '0495/J7.1/PN.00/2023', '2023-03-18', 'Surat Undangan', 'Undangan pelaksanaan Sosialisasi LIDM 2023', 'Balai Pengembangan Talenta Indonesia ', 'Penting', '1227-Undangan Sosialisasi  LIDM 2023 ex.pdf', '2', '2023-03-20'),
(394, '006/SM/III/2023', '2023-03-20', 'Surat Permohonan', 'Kerjasama  Program Pengembangan Talenta bagi Penge', 'PT. Agate Internasional ', 'Penting', '2711-Surat Pengantar Bali Startup Camp x Agate.pdf', '2', '2023-03-20'),
(395, '005 /361/DKIS', '2023-03-15', 'Surat Undangan', 'Evaluasi Pelaksanaan DTIK Festival 2023', 'Dinas Komunikasi, Informatika dan Statistik Pemeri', 'Penting', '9498-undangan rapat evaluasi dtik.pdf', '2', '2023-03-20'),
(396, '1128/E2/DT.01.02/2023', '2023-03-06', 'Surat Undangan', 'Sosialisasi Pelaksanaan SIMKATMAWA 2023', 'Kemendikbud-ristek', 'Penting', '5570-SU Sosialisasi SIMKATMAWA 2023.pdf', '2', '2023-03-28'),
(397, 'S-93/KR.0801/2023', '2023-03-15', 'Surat Undangan', 'Call for Papers Kajian Riset Ilmiah (Karisma) Tahu', 'Otoritas Jasa Keuangan', 'Penting', '1206-Call for Paper OJK.pdf', '2', '2023-03-28'),
(398, '1175/LL8/KS.03.00/2023', '2023-03-30', 'Surat Permohonan', 'Permohonan Dukungan Pelaksanaan Lomba BALIGIVATION', 'LLDIKTI 8', 'Penting', '8661-Permohonan Dukungan Lomba Ide Kreatif dan E-Sport.pdf', '2', '2023-04-03'),
(399, 'B/UND/605/PK.01.06/PTP.2/PTP.2.B/2023', '2023-03-17', 'Surat Undangan', 'Call For Paper dalam the 3rd InHEIC 2023', 'Politeknik Pariwisata Bali ', 'Penting', '1958-InHEIC Poltekpar Bali.pdf', '2', '2023-04-03'),
(400, '0105/HIMA-SK/SU.02/03/2023', '2023-03-27', 'Surat Undangan', 'Undangan Partisipasi dalam Lomba Robot and Network', 'Instiki', 'Penting', '9695-ROBONEC INSTIKI.pdf', '2', '2023-04-03'),
(401, '1193/LL8/KM/2023', '2023-03-31', 'Surat Undangan', 'Undangan Sosialisasi Implementasi MBKM  Perguruan ', 'LLDIKTI 8', 'Penting', '817-Dokumen_187626_1680253350_Undangan-sosialisasi.pdf', '2', '2023-04-04'),
(402, 'B-039/05300/VS.330/01/2023', '2023-01-24', 'Surat Permohonan', 'Survei Captive Power Tahun 2023', 'Badan Pusat Statistik ', 'Penting', '3277-Survei Captive 2023.pdf', '2', '2023-04-04'),
(403, 'B.31.891.3/1419/SMKN 1 MANGGIS/DIKPORA', '2023-03-25', 'Surat Permohonan', 'Pengajuan Advertorial HUT SMKN 1 Manggis ', 'SMKN 1 Manggis', 'Penting', '5076-HUT SMKN 1 Manggis.pdf', '2', '2023-04-04'),
(404, 'B.31.880/3214/SMKN1DPS/DIKPORA', '2023-04-03', 'Surat Permohonan', 'Permohonan Narasumber Career Day Tahun 2022/2023', 'Dinas Pendidikan Kepemudaan dan Olahraga Prov.Bali', 'Penting', '3609-STIMIK PRIMAKARA.pdf', '2', '2023-04-10'),
(405, '001/SM/IV/2023', '2023-04-10', 'Surat Undangan', 'CALL FOR PAPERS: 2023 2nd International Conference', 'Fakultas Ilmu Komputer Universitas Brawijaya', 'Penting', '1985-Call For Paper 2023.pdf', '2', '2023-04-10'),
(406, '002/SM/IV/2023', '2023-04-10', 'Surat Penawaran Kerjasama', 'Kerjasama Platform Out Class', 'PT. Selaksa Abdi Karya Terpadu Indonesia ', 'Penting', '4663-Outclass.pdf', '2', '2023-04-10'),
(407, '1294/LL8/KM.01.02/2023', '2023-04-06', 'Surat Edaran', 'Pengumuman pelaksanaan Pemilihan Mahasiswa Berpres', 'LLDIKTI 8', 'Penting', '3950-Dokumen_190826_1680734023_PELAKSANAAN-PILMAPRE.pdf', '2', '2023-04-10'),
(408, 'B.17.005/2772/BID.I/BRIDA', '2023-04-06', 'Surat Undangan', 'Rapat Koordinasi BRIDA', 'Badan Riset dan Inovasi Daerah Pemprov Bali', 'Penting', '7872-Rapat Koordinasi BRIDA.pdf', '2', '2023-04-10'),
(409, '682/IT1.B07.2/TA.02/2023', '2023-03-20', 'Surat Permohonan', 'Permohonan Bantuan Pengisian Survey Online WIPO ', 'Intitut Teknologi Bandung (ITB)', 'Penting', '1556-682_Permohonan Bantuan Pengisian Survey Online WIPO.pdf', '2', '2023-04-12'),
(410, '787/XI-01/0423', '2023-04-04', 'Surat Permohonan', 'Permohonan Sosialisasi dan Pelaksanaan Skrining Ri', 'BPJS Kesehatan', 'Penting', '8729-Surap permohonan Sosialisasi Skrining ke Universitas.pdf', '2', '2023-04-12'),
(411, '0117/HRGS Corp/Doc/PTBCE/III/2023', '2023-04-06', 'Surat Permohonan', 'Permohonan Audiensi Pertemuan Kerja sama SANDBOX', 'Techconnect', 'Penting', '7557-Techconnet Sandbox.pdf', '2', '2023-04-12'),
(412, '003/SM/IV/2023', '2023-04-12', 'Surat Permohonan', 'Permohonan Partisipasi the International Summer Pr', 'Politeknik Negeri Bali', 'Penting', '344-PNB Summer Program 2023 Book.pdf', '2', '2023-04-12'),
(413, '036/BEM-FEB/II-SPP/IV/2023', '2023-04-04', 'Surat Permohonan', 'Partisipasi dalam Kegiatan EFW Glorious Decade', 'Universitas Pendidikan Nasional (Undiknas)', 'Penting', '7540-UNDIKNAS.pdf', '2', '2023-04-17'),
(414, '1542/LL8/DT.02.04/2023', '2023-04-18', 'Surat Edaran', 'Pendaftaran Calon Fasilitator Wilayah  SPMI LLDIKT', 'LLDIKTI 8', 'Penting', '8325-Pendaftaran-Calon-Fasilitator wilayah SPMI.pdf', '2', '2023-04-18'),
(415, '027/266/KPID', '2023-04-27', 'Surat Penawaran Kerjasama', 'Permohonan Kerjasama Seminar Literasi  Media', 'Komisi Penyiaran Indonesia Daerah Bali ', 'Penting', '627-266_Permohonan Kerjasama-STIMIK Primakara.pdf', '2', '2023-05-04'),
(416, '001/SM/V/2023', '2023-05-04', 'Surat Penawaran Kerjasama', 'Permohonan Kerjasama Program Nusa Karier', 'PT. Nusa Talenta Indonesia ', 'Penting', '6868-Permohonan Kerjasama Nusa Talent.pdf', '2', '2023-05-04'),
(417, '1754/LL8/HM.00.03/2023', '2023-04-03', 'Surat Edaran', 'Grup Kehumasan dan Keprotokolan Perguruan Tinggi L', 'LLDIKTI 8', 'Penting', '6622-1754-LL8-HM.00.03-2023_1_5936.pdf', '2', '2023-05-10'),
(418, 'HKI.5-HH.04.02-623', '2023-05-05', 'Surat Undangan', 'Undangan PATLIB 2023 Conference: Day open to the p', 'Direktorat Jenderal Kekayaan Intelektual ', 'Penting', '7355-Undangan Patlib-eksternal.pdf', '2', '2023-05-10'),
(419, '002/SM/V/2023', '2023-05-10', 'Surat Undangan', 'Student Exchange Programme Autumn Semester 2023', 'Universitas Malaysia Pahang ', 'Penting', '6116-CIR_STUDENT EXCHANGE FACT SHEET 20232024_v2.pdf', '2', '2023-05-10'),
(420, '800/506/101.6.10.15/2023', '2023-05-10', 'Surat Permohonan', 'Permohonan Kunjungan Industri ', 'SMK Negeri 5 Kota Malang ', 'Penting', '4355-Permohonan-KI-STIMIK-PRIMAKARA.pdf', '2', '2023-05-15'),
(421, '070/28/Balitbang', '2023-05-08', 'Surat Permohonan', 'Badung Festival Inovasi Tahun 2023 ', 'Badan Riset dan Inovasi Daerah Kabupaten Badung ', 'Penting', '1815-BFI 2023.pdf', '2', '2023-05-15'),
(422, '003/SM/V/2023', '2023-05-10', 'Surat Permohonan', 'Audiensi Program Bkraf Academy', 'Badan Kreatif Denpasar', 'Penting', '4154-Badan Kreatif Denpasar.pdf', '2', '2023-05-15'),
(423, '25/554/Dpr/Srt/B', '2023-05-15', 'Surat Undangan', 'Talkshow â€œCBDC: Peluang Bagi Industri Pariwisata', 'Bank Indonesia', 'Penting', '402-Surat Undangan Umum_STIMIK Primakara.pdf', '2', '2023-05-16'),
(424, 'B.24.005/9537/IKP/D.KOMINFOS', '2023-05-16', 'Surat Permohonan', 'Sosialisasi Lomba Video Pendek  Literasi Digital T', 'Diskominfos', 'Penting', '9729-TTE SURAT KE PERGURUAN TINGGI.pdf', '2', '2023-05-16'),
(425, '005/414/Pem-Kec.Denut ', '2023-05-09', 'Surat Undangan', 'Partisipasi Lomba Poster Digital dan Lomba Fotogra', 'Pemkot Denpasar Kecamatan Denpasar Utara', 'Penting', '5343-Pemkot Denpasar. Lomba Poster dan Fotografi.pdf', '2', '2023-05-16'),
(426, '038/BAPOMI-BALI/V/2023', '2023-05-08', 'Surat Permohonan', 'Roadshow Sosialisasi Program Kerja BAPOMI Bali ', 'BAPOMI ', 'Penting', '7466-Roadshow BAPOMI Bali.pdf', '2', '2023-05-16'),
(427, 'B.24.005/9608/IAI/D.KOMINFOS', '2023-05-16', 'Surat Permohonan', 'Permohonan Kepesertaan Siswa/ Mahasiswa dalam Komp', 'Sekretariat Daerah', 'Penting', '7857-Bug Bounti dan Nyomia Bhutakala.pdf', '2', '2023-05-19'),
(428, '0038/NEX-IDN/MAY/2023', '2023-05-16', 'Surat Permohonan', '[RE]Charge: Ideation Workshop', 'New Energy Nexus Indonesia ', 'Penting', '5907-Surat Undangan Peserta [RE]Charge -STMIK Primakara.docx.pdf', '2', '2023-05-19'),
(429, '2000/LL8/KS.03.00/2023', '2023-05-16', 'Surat Undangan', 'Diseminasi Kebijakan dan Peningkatan Kerja Sama  P', 'LLDIKTI 8', 'Penting', '6879-DOC-20230517-WA0001..pdf', '2', '2023-05-19'),
(430, '024/E/ICCN/V/2023', '2023-05-15', 'Surat Undangan', 'Keikutsertaan dalam Kegiatan CCOP (Career Center  ', 'Indonesia Career Center Network ', 'Penting', '2575-No. 024  A 2023.pdf', '2', '2023-05-23'),
(431, '068/UBR.FTK/PP/2023', '2023-03-28', 'Surat Permohonan', 'Kunjungan Lapangan', 'Universitas Baturaja ', 'Penting', '5189-Surat Permohonan Kunjungan STMIK Primakara.pdf', '2', '2023-05-23'),
(432, '241/U.7/SMKPCN/V/2023', '2023-05-19', 'Surat Undangan', 'Undangan Peserta Expo Wisuda VI ', 'SMK Penerbangan Cakra Nusantara ', 'Penting', '9872-SMK Penerbangan Cakra Nusantara.pdf', '2', '2023-05-23'),
(433, 'B.31.422/645/SMAN 1 Baturiti/Dikpora', '2023-05-19', 'Surat Permohonan', 'Permohonan Sponsorship kegiatan HUT SMA Negeri 1 B', 'SMA Negeri 1 Baturiti', 'Penting', '4536-SMA Negeri 1 Baturiti.pdf', '2', '2023-05-23'),
(434, '25/637/Dpr/Srt/B', '2023-05-30', 'Surat Undangan', 'Undangan Casual Talk Bali Digital Festival (BDF) 2', 'Bank Indonesia', 'Penting', '3279-S_Undangan Casual Talk BDF 2023_AKADEMISI.pdf', '2', '2023-05-31'),
(435, 'S-453/UIGM/PPM/2023', '2023-05-15', 'Surat Undangan', '2023 UI GreenMetric World University Rangkings on ', 'Universitas Indonesia GreenMetric', 'Penting', '1667-primakara_ac_id_invitation_2023.pdf', '2', '2023-05-31'),
(436, '007/BEB/V/2023', '2023-05-23', 'Surat Undangan', 'Partisipasi Lomba Konten Kreatif Bali Era Baru ', 'Panitia Lomba Konten Kreatif Bali Era Baru ', 'Penting', '9920-STMIK Primakara (2).pdf', '2', '2023-05-31'),
(437, '2687/LL8/KS.01.00/2023', '2023-05-10', 'Surat Undangan', 'Pelaksanaan Diseminasi Aplikasi Layanan Pendidikan', 'LLDIKTI 8', 'Penting', '1429-Dokumen_235083_1686380081_Undangan.pdf', '2', '2023-06-13'),
(438, '2458/LL8/KS.01.00/2023', '2023-06-05', 'Surat Pengumuman', 'Pengumuman Perubahan Jadwal Pendampingan Pelaporan', 'LLDIKTI 8', 'Penting', '3841-2458-LL8-KS.01.00-2023_1_7062.pdf', '2', '2023-06-13'),
(439, '2126/LL8/KL.01.00/2023', '2023-05-22', 'Surat Permohonan', 'Permohonan Update Data Akreditasi Program Studi da', 'LLDIKTI 8', 'Penting', '5162-2126-LL8-KL.01.00-2023_1_5470.pdf', '2', '2023-06-13'),
(440, '15/UW/BEM-FH/PanPel-DekanCupXI/V/2023', '2023-05-22', 'Surat Permohonan', 'Partisipasi Peserta Mobile Legend Competition', 'Universitas Warmadewa', 'Penting', '8908-ML Warmadewa.pdf', '2', '2023-06-13'),
(441, '14/UW/BEM-FH/PanPel-DekanCupXI/V/2023', '2023-05-22', 'Surat Permohonan', 'Permohonan Partisipasi Peserta Futsal Competition', 'Universitas Warmadewa', 'Penting', '5476-Futsal Competition WarmaDewa.pdf', '2', '2023-06-13'),
(442, 'BAL/455/4/2023 ', '2023-06-02', 'Surat Undangan', 'The 9th International Day of Yoga (DIY)', 'Consulat General of India ', 'Penting', '8592-Invitation of IDY 2023 - Head of STMIK Primakara.pdf', '2', '2023-06-13'),
(443, 'B.17.005/4346/Bid.I/BRIDA', '2023-06-12', 'Surat Undangan', 'Undangan Menulis  di JBMB (SINTA 5)', 'Badan Riset dan Inovasi Daerah ', 'Penting', '6636-Surat Keluar-120623144149.pdf', '2', '2023-06-13'),
(444, '2583/LL8/HK.08/2023 ', '2023-06-08', 'Surat Pemberitahuan', 'Pelaporan Data Calon Wisudawan/wisudawati', 'LLDIKTI 8', 'Penting', '3686-Surat Si Delapan.pdf', '2', '2023-06-13'),
(445, '09212', '2022-12-31', 'test', 'test', 'test', 'Rahasia', '9229-yudi 2.pdf', 'maha', '2023-06-20'),
(446, '87', '2023-12-31', 'abc', 'abc', 'abc', 'Rutin', '3729-yudi 2.pdf', 'maha', '2023-06-20'),
(447, '88', '2023-12-31', 'abc', 'abc', 'abc', '', '3330-yudi.pdf', '2', '2023-06-22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_tindaklanjut`
--

CREATE TABLE `sip_tindaklanjut` (
  `kodeTindaklanjut` int(11) NOT NULL,
  `noSurat` varchar(50) NOT NULL,
  `isiTindaklanjut` longtext NOT NULL,
  `isiTarget` varchar(255) NOT NULL,
  `tglSelesai` date NOT NULL,
  `userInput` char(18) NOT NULL,
  `tglInput` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sip_tindaklanjut`
--

INSERT INTO `sip_tindaklanjut` (`kodeTindaklanjut`, `noSurat`, `isiTindaklanjut`, `isiTarget`, `tglSelesai`, `userInput`, `tglInput`) VALUES
(34, '1/2/surat1', 'rencana yang akan dilakukan adalah menugaskan beberapa mahasiswa dan mengkordinasikan dengan ketua dan dengan melakukan bebrapa hal yang dapat menghasilkan prestasi', 'juara 1', '2021-09-09', '1999', '2021-09-02'),
(36, '1/2/gas', 'rencana 1', 'selesa', '2021-09-03', '1999', '2021-09-02'),
(37, '1/2/IF', 'menindaklanjut dengan wawancara siswa', '30 orang', '2021-09-07', '1999', '2021-09-03'),
(39, '1/2/4 surat masuk', 'segera ditindak lanjut', 'segera komunikasi', '2021-09-09', '20210810', '2021-09-08'),
(40, '2172/LL8/TU/2021', 'Akan diikuti untuk mencari tau apakah akan ada manfaat tambahan', '08 September 2021', '2021-09-08', '2019091111', '2021-09-08'),
(42, '2375/LL8/KL/2021', 'Mengikuti Sosialiasasi ISK dan IPEPA sesuai surat', '17 September 2021', '2021-09-17', 'PPM', '2021-09-15'),
(44, 'BI.31.420/76560/DIKPORA', 'Rapat koordinasi prodi, baak dan sdmrt untuk persiapan pbm tatap muka (luring) terbatas', 'Adanya keputusan terkait waktu, mekanisme/prosedur untuk pembelajaran tatap muka', '2021-09-26', 'Prodi SI', '2021-09-22'),
(45, '5437/E2/DM.00.01/2021', 'Diikuti oleh Pak Helmy, Pak Gung De, Bu Aris', '25-26 September 2021', '2021-09-26', 'Waka I', '2021-09-22'),
(46, '001', 'diumumkan ke kanal mahasiswa, bagi yang ingin melaksanakan magang bisa dijadikan referensi sesuai syarat yg cantumkan', 'Yandi blast ke kanal kemahasiswaa', '2021-09-30', 'waka III', '2021-09-23'),
(47, '002', 'Hadir bersama kepala INBIS', '29 September 2021', '0000-00-00', 'Pusat Inovasi', '2021-09-23'),
(49, '011/UKM.PROGRESS/BEM.ITBSTIKOM/IX/2021', 'yandi komunikasikan dgn ukm terkait dan ikuti kegiatan', 'mendaftarkan peserta', '2021-10-22', 'waka III', '2021-09-27'),
(50, '1634/UN48.16/LT/2021', 'mengkoordinasikan untuk LPPM mengikuti kegitan tersebut dan mengupayakan submit dari penelitian dosen', '3 november 2021', '0000-00-00', 'Pusat Inovasi', '2021-09-27'),
(51, '2406/LL8/PR/2021', 'Melakukan pengisian indikator kinerja triwulan ke-III pada laman yang sudah disediakan.', '29 September 2021', '2021-09-29', 'PPM', '2021-09-28'),
(52, '003', 'Bertemu dengan Miss Tyo hari Rabu jam 13.00 di Stmik Primakara untuk berdiskusi ', 'Mengetahui lebih dalam mengenai kerjasama yang dimaksud agar bisa ditindaklanjuti diterima atau ditolak ', '2021-09-29', 'Waka II', '2021-09-29'),
(53, '405/APTISI WILL. VII/09/2021', 'mengajak tenant untuk ikut lomba', '24 spetember 2021', '0000-00-00', 'Pusat Inovasi', '2021-10-04'),
(54, '005/634/KS', 'Bu  Esti dan SIva Minta 10 anggota UKM Multimedia mengikuti kegiatan ini. terima kasih', 'mahasiswa UKM Multimedia mengikuti kegiatan ini', '2021-10-11', 'waka III', '2021-10-05'),
(55, '005', 'Aris dan Siva umumkan ke alumni dan channel pcc untuk ditawarkan ke mahasiswa, lalu masukkan data perusahaan ini untuk nanti bisa lakukan kerjasama atau wawancara kebutuhan lulusan (Via online)', 'diumumkan ke alumni dan calon lulusan', '2021-10-12', 'waka III', '2021-10-05'),
(56, '405/APTISI WILL. VII/09/2021', 'Bu Esti dan Sifa minta ikuti ukm prime dev dan mahasiswa beasiswa untuk kegiatan Mobile/Web (wajib) yg lainnya silahkan optional misal ukm dance ikut lomba tiktok.', 'mahasiswa mengikuti lomba', '2021-10-24', 'waka III', '2021-10-05'),
(57, '029/MK.01/GP-331/IX/2021', 'Menyampaikan informasi Magang ke mahasiswa ', '8 Oktober 2021', '2021-10-08', 'Waka III', '2021-10-05'),
(58, '001', 'Melanjutkan informasi ke mahasiswa.', '15 Oktober 2021-sudah ada yg apply.', '2021-10-15', 'Waka III', '2021-10-05'),
(59, '005', 'Dibagikan pada grup WA Alumni dan sosial media PCC.', '8 Oktober 2021-sudah disebarkan kepada alumni.', '2021-10-08', 'Waka III', '2021-10-05'),
(60, '005/634/KS', 'Menugaskan UKM Multi Media untuk menjadi peserta sebanyak 10 orang peserta. Berkoordinasi dnegan ketua UKM Multi Media dan Pembina UKM', 'Mahasiswa mengikuti kegiatan tersebut sebanyak 10 orang. Berikut ini nama-nama peserta :\r\n\r\n1. Rahelina Ilse Oktaviola R. \r\n2. Arisiki Pang Raharja\r\n3. Supriyanto mudji prakoso\r\n4. Anak Agung Gede Andika Pramana Putera\r\n5. Angga Karma Nugraha\r\n6. I Made A', '2021-10-07', 'waka III', '2021-10-09'),
(61, '2627/L8/KL/2021', 'Membuat daftar pertanyaan', '12 Oktober 2021', '2021-10-12', 'Waka I', '2021-10-11'),
(62, '2653/L8/KP/2021', 'Sudah diinformasikan ke group dosen untuk mengikuti Sosialisasi dan Kepala Bagian HRD akan mengikuti juga, dan akan kita buatkan program-program untuk Dosen senior lanjut S3 bersama HRD', 'Sosialisasi 14 Oktober 2021, Untuk Program Dosen  31 Oktober 2021', '2021-10-31', 'Waka II', '2021-10-11'),
(63, '547/E/Pan.Intergalatic/BEM FMIPA//UNESA/IX/2021', 'Bu Esti dipublish ke mahasiswa', 'mahasiswa mengenai informasi tsb, dan jika ada berminat agar bisa mendaftar', '2021-10-17', 'waka III', '2021-10-12'),
(64, '2653/L8/KP/2021', 'Mengikuti Sosialisasi sesuai waktu yang ditentukan. Meneruskan informasi ke dosen terkait dan grup dosen. ', 'Membuat rancangan rencana studi lanjut dosen senior sebelum akhir bulan oktober 2021', '0000-00-00', 'sdm', '2021-10-14'),
(65, '5220/E2/PB.04.04/2021', 'Diabaikan', 'Diabaikan', '2021-10-14', '2', '2021-10-14'),
(66, '3041/PD.04/D3/2021', 'Diabaikan', 'Diabaikan', '2021-10-14', '2', '2021-10-14'),
(68, '10/UNWAR/LPM/Pan.SemNas/PD-11/2021', 'Diabaikan', 'Diabaikan', '2021-10-14', '2', '2021-10-14'),
(70, '2632/LL8/KM/2021', 'Mengikuti workshop sesuai jadwal dan lokasi bersama bu queena', '18 Oktober 2021', '2021-10-18', 'PPM', '2021-10-15'),
(71, '632/II.10/TVRI/2021', 'menghadiri acara kegiatan tersebut', '18 oktober 2021', '0000-00-00', 'Pusat Inovasi', '2021-10-15'),
(72, 'B/6593/UN14/HK.07.00/2021', 'Surat undangan didisposisikan kembali (diteruskan) ke Pak Krisna (Waka III), karena penerima disposisi pertama (Waka I), sedang mengikuti pelatihan yang dibiayai oleh Primakara sehingga tidak bisa menghadiri undangan tersebut.', 'Waka III bisa menghadiri undangan Forum Rektor mewakili STMIK Primakara.', '2021-10-21', 'Waka I', '2021-10-21'),
(73, '559/421.3/SMK-ITB/X/2021', 'Rencana pelaksanakan seminar salah satu sistem kampus yang diterapkan di STMIK Primkara, promosi tentang penerimaan mahasiswa baru, touring kampus ', 'Melaksanakan seminar salah satu sistem kampus yang diterapkan di STMIK Primkara, promosi tentang penerimaan mahasiswa baru, touring kampus ', '2021-12-16', 'Marketing', '2021-10-25'),
(74, '6233/E2/DM.00.01/2021', 'Sudah mengedarkan surat undangan kepada 10 orang dosen untuk mengikuti kegiatan ini.', '26 Oktober 2012', '2021-10-25', 'Waka I', '2021-10-26'),
(75, 'B.25.518/1254/PK/Diskop UKM', 'ikut pendaftar kegiatan tersebut', '1 november 2021', '0000-00-00', 'Pusat Inovasi', '2021-10-26'),
(76, '4039/E4/KK.01.01/2021', 'Mengikuti kegiatan sesuai waktu yang ditentukan dan mengkomunikasikan kepada dosen-dosen apabila terdapat terdapat informasi baru', '30 Okt 2021', '2021-10-30', '2', '2021-10-31'),
(77, 'S-771/WJP.17/2021', 'Koordinasi dengan dosen-dosen MKWK', '8 Nopember 2021', '2021-11-05', 'Waka I', '2021-11-05'),
(78, '017/SPN/BAAK/X/2021', 'memberitahu mahasiswa bahwa survey sudah bisa dilaksanakan', '8 Nopember 2021', '2021-11-05', 'Waka I', '2021-11-05'),
(79, '001/SPN/BAAK/XI/2021', 'Memberitahu mahasiswa bahwa survey sudah bisa dilaksanakan', '8 Nopember 2021', '2021-11-05', 'Waka I', '2021-11-05'),
(80, '6694/E2/BS.01.01/2021', 'Pembuatan surat pengantar dan pengumuman kepada civitas akademika STMIK Primakara untuk mengisi survey yang dimaksud.', '15 Nopember 2021', '2021-11-30', 'Waka I', '2021-11-18'),
(81, '9206/Dirut.GG/KPT-EDU/P2K/X/2021', 'menghubungi PIC edunitas untuk selanjutnya dilakukan kerjasama ', 'memperoleh teknis untuk kerjasama', '2021-12-01', 'Marketing', '2021-11-18'),
(82, '3214/LL8/KM/2021', 'Didiskusikan dengan para Kaprodi', 'Sosialisasi yang intens  ke mahasiswa agar ada yg mengikuti program tersebut.', '2021-12-06', 'Waka I', '2021-11-29'),
(83, '005/1539/KS', 'minta mahasiswa yang sudah mengambil skripsi untuk mengikuti', 'mahasiswa yang mengambil skripsi mengikuti webinar', '2021-12-03', 'waka III', '2021-11-29'),
(84, '01/S.II/BID.IX/SMAK-SY/XI/2021', 'Koordinasi dengan WAKA I untuk pemenuhan narasumber ', 'ada perwakilan dari STMIK Primkara untuk menadi narasumber pelatihan  ', '2021-12-15', 'Marketing', '2021-12-07'),
(85, '9206/Dirut.GG/KPT-EDU/P2K/X/2021', 'Dilakukan pendaftaran dan persiapan materi promosi kampus STMIK Primkara untuk kemudian dapat menjadi bagian dari Edunitas KPT ', 'STMIK Primkara terdaftar dalam Edunitas KPT ', '2021-12-14', 'Marketing', '2021-12-07'),
(86, '008/SM/XII/2021', 'Koordinasi dengan UPT untuk menyiapkan ruangan, TV / projector dan sound sistem di ruang kreatif', 'Sabtu 18 Desember 2021', '2021-12-18', 'Waka II', '2021-12-09'),
(87, 'S-84/WPJ.17/2021', 'Diikuti oleh Bu Aris', 'Menjadi salah satu pemenang.', '2021-12-07', 'Waka I', '2021-12-09'),
(88, '6952/E2/BS.01.01/2021', 'Sosialisasi diikuti oleh Ka. BAAK agar pembuatan surat pengumuman disesuaikan dengan materi sosialisasi,', 'Pembuatan dan pengedaran surat pengumuman bagi mahasiswa', '2021-12-09', 'Waka I', '2021-12-09'),
(89, '007/ST/2021', 'Pembuatan surat kepada dosen untuk mengikuti kelas pelatihan kedaireka', 'Dosen mengikuti kelas pelatihan kedaireka', '2021-12-09', 'Waka I', '2021-12-09'),
(90, '13427/E1/DI.00.01/2021', 'Sosialisasi diikuti oleh Ka. BAAK agar pembuatan surat pengumuman kepada mahasiswa sesuai dengan materi sosialisasi', 'Pembuatan dan pengedaran surat pengumuman kepada mahasiswa', '2021-12-08', 'Waka I', '2021-12-09'),
(91, '1051/FEBP/UNHI/XII/2021', 'Memanggil yang bersangkutan untuk menjelaskan lebih lanjut tentang penelitiannya, terutama jaminan kerahasiaan data, surat konsen.', 'Jika bisa memberikan kejelasan penelitan dan konsen kerahasiaan data, maka bisa diberikan ijin.', '2021-12-13', 'Waka I', '2021-12-10'),
(92, '228/BP/DE/XII/2021', 'Sudah menghubungi pihak LAM Infokom, namun dari pihak LAM menyebutkan karena keterbatasan tempat maka Primakara tidak bisa turut serta dalam kegiatan tersebut.', '-', '0000-00-00', 'PPM', '2021-12-16'),
(93, '1269.H/KOMINFO/DJAI/HM.01.01/12/2021', 'PCC dan KUIK koordinasi untuk mahasiswa serta sampaikan ke security bahwa akan ada proses penjemputan di kampus di hari minggu', 'tercapai mahasiswa yang ikut sebanyak 45 orang', '2021-12-19', 'waka III', '2021-12-17'),
(94, '420/6549/SMKN1/2021', 'Koordinasi dengan Waka 1 untuk menjelaskan sistem perkuliahan Primakara, dan berkoordinasi dengan LPPM Pengabdian Masyarakat', 'Adanya kerjasama terkait penerimaan mahasiswa baru dan branding berupa referal, kerjasama osis dan kegiatan sekolah', '2021-12-22', 'Marketing', '2021-12-20'),
(95, '420/6549/SMKN1/2021', 'Mendelegasikan Kaprodi IF untuk mewakili Divisi Wk I untuk  menjelaskan sistem perkuliahan Primakara.', 'Sistem perkuliahan di Primakara dapat berkonstribusi terhadap pengembangan sistem pengajaran di SMKN 1 Mas Ubud.', '2021-12-22', 'Waka I', '2021-12-20'),
(96, '13676/E1/DI.04.02/2021', 'Memasukkan NISN sebagai data yang wajib diberikan oleh mahasiswa baru thn akademik 2022-2023 dan melakukan pendataan NISN untuk mhs 2021-2022', 'Terdapat NISN seluruh mahasiswa angkatan 2021', '2022-02-25', 'Waka I', '2021-12-20'),
(97, '14726/E1/DI.04.02/2021', 'Primakara akan melakukan pemutakhiran data profil perguruan tinggi', 'Data profil STMIK Primakara telah telah mutakhir.', '2021-12-31', 'Waka I', '2021-12-21'),
(98, '13751/E1/DI.04.02/2021', 'Penyebaran informasi dan himbauan ke dosen, tendik dan mahasiswa oleh BAAK, untuk mengisi angket/ survey vaksinasi dan kesiapan PTM.', 'Dosen, tendik dan mahasiswa Primakara mengisi survey vaksinasi dan kesiapan PTM', '2021-12-30', 'Waka I', '2021-12-28'),
(99, '3603/LL8/KP/2021', 'Mengumpulkan data kelengkapan dan persyaratan ke LLDIKTI Wilayah VIII atas nama Pak Yudi', 'Tanggal 28 Desember 2021 sudah dikirim ke LLDIKTI wilayah 8 oleh Kepala Bagian HRD & RT', '2021-12-28', 'Waka II', '2021-12-29'),
(100, 'B.1037.e-BIS/DPS/12/2021', 'KUIK coba tolong jajaki. hanya saja sepertinya itu kontak pastinya belum jelas. coba dipastikan', 'terhubungi, dan ada kesepakatan kerjasama', '2022-01-31', 'waka III', '2021-12-29'),
(101, '010/SM/XII/2021', 'Bu Esti kontak pembimbing,dan ketua ukm musik dan multimedia. diinformasikan dan jk bisa ada yg mengikuti', 'informasi tersampaikan ke umk musik dan mulmed', '2021-12-20', 'waka III', '2021-12-29'),
(102, '002/PemilihanTTD2022/SemetonTTD/XI/2021', 'Bu Esti, cek kapan pendaftaran terakhir, lalu mnkn informasikan ke ukm dance semoga ada yg berminat', 'informasi tersampaikan ke ukm dance', '2022-01-20', 'waka III', '2021-12-29'),
(103, '3716/LL8/PR/2021', 'Mengisi tabel indikator kinerja dan mengirimkan ke dikti', 'Sesuai deadline', '2022-01-04', 'PPM', '2021-12-30'),
(104, '001/SM/I/2022', 'Mengkoordinasikan ke Bagian UPT untuk ditindaklanjuti mengisikan form peminjaman ruangan dan menjadwalkan pada tanggal tersebut.', '6 Januari 2022', '2022-01-06', 'Waka II', '2022-01-05'),
(105, '009/SM/XII/2021', 'Dikoordinasikan ke UPT untuk ditindaklanjuti', 'Tgl 29 Desember 2021', '2021-12-29', 'Waka II', '2022-01-05'),
(106, '3716/LL8/PR/2021', 'Mengisi tabel indikator kinerja dan mengirimkan ke dikti', 'Sesuai deadline', '2022-01-05', 'PPM', '2022-01-05'),
(107, '114/BEM-AS/AP-DPS/CEO/I/2022', 'Mengkoordinasikan kepada UPT untuk membantu sponsorship peralatan Sound system, stan Mic  ', '11 Januari 2021', '2021-01-11', 'Waka II', '2022-01-11'),
(108, '1457/SPP/SVM/XII/2021', 'akan mengikuti webinar', 'adanya input yg dapat memperbaiki kualitas RPS Primakara', '2022-01-13', 'Waka I', '2022-01-11'),
(109, '0042/LL8/KB.01.01/2022', 'akan koordinasi dengan LLDIKTI 8', 'memastikan prodi Primakara perlu penyesuaian atau tidak', '2022-01-12', 'Waka I', '2022-01-11'),
(110, 'DES/0031/2022', 'Melakukan koordinasi ke bagian UPT , dan HRD terkait Security', '18 januari 2022', '2022-01-18', 'Waka II', '2022-01-18'),
(111, '002/SMKHI/I/2022', 'Menggkoordinasikan ke UPT untuk jadwal dan pemakaian Ruangan dan CS untuk kebersihan dan Security untuk parkir dan keamanan termasuk ', '22 Januari 2022 untuk koordinasi dengan Pihak SMK N 2 Denpasar', '2022-01-22', 'Waka II', '2022-01-18'),
(112, '2021-AG-01-003', 'Berkoordinasi dengan tim Act Global terkait teknis dan berkoordinasi dengan divisi Multimedia untuk setting live instagram. ', 'Mengikuti live instagram yang telah dijadwalkan', '2022-01-21', 'Marketing', '2022-01-19'),
(113, '002/SMKHI/I/2022', 'Berkoordinasi dengan Waka II terkait ketersediaan ruangan dan kebersihan, berkoordinasi dengan panitia penyelenggara tentang teknis dan kerjasama kegiatan', 'Kegiatan disetujui, Ada branding primakara di dalam kegiatan', '2022-01-20', 'Marketing', '2022-01-19'),
(114, '0106/LL8/KB.01.01/2022', 'Menyesuaikan nama prodi dengan nomenklatur', 'Program studi sesuai dengan nomenklatur', '2022-01-21', 'Waka I', '2022-01-20'),
(115, '0275/E2/BS.01.01/2022', 'Mengisi survey pendidikan inklusi', 'Survey pendidikan inklusi terisi', '2022-02-04', 'Waka I', '2022-01-27'),
(116, '1686/UND/SVM/I/2022', 'Mendaftar dan mengikuti Webinar \"Startegi Kuliah Online dan Digitalisasi Kampus Pasca Pandemi Covid-19\"', 'Mengikuti Webinar \"Startegi Kuliah Online dan Digitalisasi Kampus Pasca Pandemi Covid-19\"', '2022-02-15', 'Waka I', '2022-01-27'),
(117, '421.7/30/418.27/SMK.Br.Kp/I/2022', 'Berkoordinasi dengan UPT untuk menyiapkan tempat dan menghubungi pihak panitia untuk konfirmasi kunjungan', 'Melaksanakan seminar salah satu sistem kampus yang diterapkan di STMIK Primkara, promosi tentang penerimaan mahasiswa baru, touring kampus', '2022-01-30', 'Marketing', '2022-01-28'),
(118, 'DES/0031/2021', 'Untuk mengkomunikasikan ke Doremi bahwa kita ada kegiatan di tanggal tersebut', 'Tanggal 2 Pebruari 2022', '2022-02-02', 'Waka II', '2022-02-02'),
(119, '0167/LL8/HK.01.04/2021', 'Sosialisasi akan diikuti oleh Waka II dan HRD', 'Tgl 2 Pebruari 2022', '2022-02-02', 'Waka II', '2022-02-02'),
(120, '0161/LL8/AK.02.01/2022', 'Angket akan diisi oleh Kaprodi IF atau SI', 'Angket telah terisi', '2022-02-10', 'Waka I', '2022-02-04'),
(121, '114/SGN-OUT/LYRA/06/22', 'Didiskusikan dengan Kaprodi. ', 'Keputusan tentang tawaran kerjasama.', '2022-02-07', 'Waka I', '2022-02-04'),
(122, '007/SM/II/2022', 'KUIK segera komunikasikan dan koordinasi dgn akademik dan ukm multimedia untuk mengikuti kegiatan ini', 'ada peserta mahasiswa mengikuti', '2022-02-21', 'waka III', '2022-02-07'),
(123, '009/03/PARAS-ICT-VII-STIKI/I/2022', 'Bu Esti kemahasiswaan minta UKM yg terkait utuk ada tim yg mengikuti', 'diumumkan ke ukm ', '2022-02-15', 'waka III', '2022-02-07'),
(124, '10/SM/II/2022', 'KUIK tlng follow Up penawarannya', 'komunikasi untuk audensi antara KUIK dan PCC', '2022-02-15', 'waka III', '2022-02-10'),
(125, '0158/E/DI.00.01/2022', 'Merekomendasikan Kaprodi IF sebagai koordinator', 'Kaprodi IF menjadi koordinator', '2022-02-14', 'Waka I', '2022-02-14'),
(126, '0725//E1/PP.01.11/2022', 'mendaftar 2 orang untuk ikut dan share informasi ke grup dosen', '16 Februari 2021', '0000-00-00', 'Pusat Inovasi', '2022-02-17'),
(127, '005/242/Bappeda', 'Menghadiri pelaksanaan kegiatan,', '14 Februari', '0000-00-00', 'Pusat Inovasi', '2022-02-17'),
(128, 'B/328.4/UN34/KM/2022', 'share informasi ke tenant untuk emngikuti lomba', '4 februari', '0000-00-00', 'Pusat Inovasi', '2022-02-17'),
(129, '1157/PANPEL/DEBAT/FEBP-UNHI/XII/2021', 'mgeirim 1 tenant untuk mengikuti lomba', '17 februari', '0000-00-00', 'Pusat Inovasi', '2022-02-17'),
(130, '009/SPN/BAAK/III/2022', 'Menginformasikan kepada mhs ybs bahwa permintaan ijin telah disetujui', 'Pemberian Ijin akses data akademik', '2022-03-14', 'Waka I', '2022-03-14'),
(131, 'SK029/III/BEDO-2022', 'Bu Esti kontak IM club untuk mengikuti kegiatan ini, jk bisa penuhi kuota 30 mhs', 'mahasiswa mengikuti sosialisasi', '2022-03-21', 'waka III', '2022-03-17'),
(132, 'B-759/Un.10.8/D/DA.04.09/03/2022', 'Menyiapkan acara untuk menyambut kunjungan KKL UIN Walisongo, Semarang yang dikoordinir oleh Tegar', 'Acara sambutan berjalan dengan baik.', '2022-03-23', 'Waka I', '2022-03-17'),
(133, '1355/E3.1/PM.00.03/2022', 'Mengikuti sosialisasi PKKM 2022.', 'Sosialisasi PKKM 2022 dapat diikuti.', '2022-03-18', 'Waka I', '2022-03-17'),
(134, '0427/LL8/PR.00.01/2022', 'Akan diikuti oleh PPM (2 orang)', '25 Maret 2022', '2022-03-25', 'PPM', '2022-03-18'),
(135, '1168/E2/KM.09.00/2022', 'diikuti oleh waka III dan Kemahasiswaan dan staf kemahasiswaan', 'diikuti ', '2022-03-25', 'waka III', '2022-03-22'),
(136, 'B.24.005/4788/IKP/D.KOMINFOS', 'BU Aris dan Mahasiswa(BEM) mengikuti kegiatan ini ', 'mengikuti kegiatan', '2022-04-06', 'waka III', '2022-04-01'),
(137, '2022.AG-02-023', 'Aris dan TUning diatur untuk ada mahsiswa EC yg ikut', 'mengikuti kegiatan', '2022-04-07', 'waka III', '2022-04-01'),
(138, '004/SM/2022', 'diikuti oleh kemahasiswaan', 'diikuti oleh kemahasiswaan', '2022-04-01', 'waka III', '2022-04-01'),
(139, 'B.24.005/5028/SEKRET/D.KOMINFOS', 'Pcc tlng menghadiri, krna saya sendiri incharge dsna ', 'menghadiri', '2022-04-08', 'waka III', '2022-04-06'),
(140, '038/BEM-FEB/II-SKj/III/2022', 'kemahasiswaan siapkan UKM/Mahasiswa lomba Digital Poster, Speech Contest dan Short Movie dan koordinasi dengan masing-masing UKM', 'diikuti', '2022-05-09', 'waka III', '2022-04-06'),
(142, '005 KFB/IV/2022', 'kemahasiswaan maksimalkan ukm MUlmed untuk ikut, dan mahasiswa yg tidak ada perkuiahan, koordinasi dengan akademik', 'kegiatan diikuti menggunakan almamater', '2022-04-08', 'waka III', '2022-04-06'),
(143, '1775/E2/KM.12/2022', 'diikuti oleh waka III dan kemahasiswaan', 'mengikuti kegiatan', '2022-04-18', 'waka III', '2022-04-18'),
(144, '011/SPN/BAAK/IV/2022', 'Mengijinkan mahasiswa untuk melakukan observasi dan wawancara', 'Mahasiswa dapat melakukan observasi dan wawancara ', '2022-04-19', 'Waka I', '2022-04-18'),
(145, '015/SPN/BAAK/IV/2022', 'Mengijinkan mahasiswa untuk melakukan observasi dan wawancara', 'Mahasiswa dapat melakukan observasi dan wawancara', '2022-04-19', 'Waka I', '2022-04-18'),
(146, '007/B/PPKAB-XI/III/2022', 'Kemahasiswaan info ke UKM dance dan umumkan di papan pengumuman jika ada yg berminat agar bs mendaftar', 'diumumkan ke mahasiswa', '2022-05-14', 'waka III', '2022-04-18'),
(147, '0697/LL8/KM.12/2022', 'mengikuti kegiatan', '27 april 2022', '0000-00-00', 'Pusat Inovasi', '2022-04-26'),
(148, '014/IAI-JTM/KRAIX/IV/2022', 'Berdiskusi dengan kaprodi SIA tentang konferensi regional akuntansi', 'Keputusan untuk mengikuti atau tidak mengikuti konferensi regional akuntansi', '2022-05-11', 'Waka I', '2022-05-11'),
(149, '022/SPN/BAAK/IV/2022', 'Koordinasi dg BAAK untuk pemberian ijin survey', 'Ijin survey diberikan dan diinformasikan kepada mahasiswa yang bersangkutan', '2022-05-11', 'Waka I', '2022-05-11'),
(150, '2119/E2/BS.01.01/2022', 'Akan diikuti oleh Novita (BAAK) dan Sutresna (PPTI).', 'Webinar diikuti secara tuntas dan hasilnya dilaporkan ke Ka.BAAK dan Waka I', '2022-05-18', 'Waka I', '2022-05-17'),
(151, '03/KKT/V.11/2022', 'Pcc tolong dikomunikasikan apakebutuhan jika perlu  bentuk panitia, dan narsumnya', 'dikomunikasikan dan menyesuaikan tindak lanjutnya berdasarkan hasil komunikasi', '2022-05-27', 'waka III', '2022-05-18'),
(152, 'BAL/ADM/551/10/2019', 'Kuik Mengkomunikasikan terkait kesiapan tgl 24', 'dikomunikasikan', '2022-05-24', 'waka III', '2022-05-23'),
(153, '021/B/ADS/UNAIR/IV/2022', 'Pembina (EC) minta untuk bisa dikomuniksikan agar mahasiswa bs mengikuti', 'informasi tersampaikan', '2022-06-11', 'waka III', '2022-05-23'),
(154, 'BAL/ADM/551/10/2019', 'Akan dilaksanakan sesuai dengan waktu detail dan tempat yang diajukan pada surat', '24 Mei 2022', '2022-05-24', 'waka iii', '2022-05-23'),
(155, '021/B/ADS/UNAIR/IV/2022', 'Surat sudah diteruskan ke mahasiswa dan akan disiapkan pesertanya', 'Ada 1 team mahasiswa Primakara (UKM EC) yang mengikuti kompetisi', '2022-06-13', 'waka iii', '2022-05-23'),
(156, '024/SM/V/2022', 'pcc tolong di observasi, dan nanti kita diskusikan apa akan kita lanjutkan penjajakan atau tidak', 'di observasi oleh pcc', '2022-06-10', 'waka III', '2022-05-25'),
(157, '0704/LL8/TU.00.01/2022', 'Tidak ada tindak lanjut karena STMIK Primakara tidak termasuk perguruan tinggi yang belum mengunggah statuta', 'Statuta STMIK Primakara telah terunggah di PDPT', '2022-05-25', 'Waka I', '2022-05-25'),
(158, 'B-1097/DIR/UMS/2022', 'Komunikasi dengan Ibu AgungIndri BPD Bali', 'Surat pesanan iklan HUT BPD dan logo STMIK Primakara pada Harian Nasional Bisnis Indonesia dikirim via WA ke Bu Agung Indri BPD Bali', '2022-05-27', 'Waka II', '2022-05-27'),
(159, '0876/LL8/KM.12/2022', 'mengikuti kegiatan sosialiasi', '29 Mei 2022', '0000-00-00', 'Pusat Inovasi', '2022-05-30'),
(160, '10/V/DG-AP/DPS/2022', 'kemahasiswaan tlng diinfokan ke mahasiswa, siapa tau ada yg berminat', 'informasi di umumkan krna memang itu sudah mepet sekali dan ada bbrp jadwal terlewatkan', '2022-05-31', 'waka III', '2022-05-30'),
(161, '005/634/KS', 'kemahasiswaan dan pembina UMKM mulmed, minta anak2 ikut 10 orang', '10 mahasiswa ukm mulmed mengikuti kegiatan ini', '2022-10-10', 'waka III', '2022-05-30'),
(162, '005/319/Kec.Denut', 'kemahasiswaan mohon sampaikan ke mahasiswa jika ada yg ingin mengikuti', 'pengumuman disebarkan', '2022-05-31', 'waka III', '2022-05-30'),
(163, '2422/E2.1/DI.00.01/2022', 'Mengikuti sosialisasi MBKM Magang dan studi independen', 'Sosialisasi MBKM Magang dan studi independen diikuti', '2022-05-31', 'Waka I', '2022-05-30'),
(164, '002/PMS/DPS/V/2022', 'Komunikasi dengan Putu Ari Anggreni untuk melakukan kerjasama untuk dapat keringanan biaya  staf, dosen, dan mahasiswa bila berobat', 'Ditandatanganinya MOU ', '2022-06-30', 'Waka II', '2022-05-31'),
(165, '2500/E2/PB.04.01/2022', 'pcc tlng komunikasikan ketua panitia merdeka belajar apa ini bisa dilanjutkan, dan komunikasi bagaimanan teknis kegiatan ini', 'dikomunikasikan dengan ketua MBKM dan jajaki kerjasama ini', '2022-06-30', 'waka III', '2022-05-31'),
(166, '18/SM/V/2022', 'Sudah di Publish ke Alumni dan Mahasiswa', 'Informasi tersampaikan', '2022-05-30', 'waka III', '2022-06-06'),
(167, 'No. BAL/SVCC/322/5/22', 'KUIK dan Kemahasiswaan, koordinasikan dgn akademik untuk mahasiswa yg ambil skripsi saja untuk wajib ikut dikarenakan mahasiswa umum sedang UAS, jk ada dosen juga diikutsertakan', 'mahasiswa ada yg menhadiri', '2022-06-17', 'waka III', '2022-06-13'),
(168, '2541/E2/PB.03.00/2022 ', 'Mengikuti sosialisasi', 'Sosialisasi diikuti', '2022-06-07', 'Waka I', '2022-06-13'),
(169, '011/HIMAPRODI.SK/BEM.ITBSTIKOM/V/2022', 'Sudah diteruskan ke grup Ormawa dan UKM Esprime', 'Ada peserta untuk mengikuti kegiatan', '2022-06-13', 'waka III', '2022-06-14'),
(170, '002/UKM.Futsal/BEM.ITBSTIKOM/V/2022', 'Kemahasiswaan untuk di informasikan ke UKM Futsal apakah bisa ikut atau tidak', 'ukm futsal di informasikan, mengenai ikut atau tidak tergantung keputusan mereka.', '2022-06-28', 'waka III', '2022-06-21'),
(171, '037/BEN/V/2022', 'PCC mohon di observasi dan jika bisa ditindakanjuti', 'dikomunikasikan', '2022-06-28', 'waka III', '2022-06-21'),
(172, '10/UW/BEM-FH/PanPel-DekanCupX/VI/2022', 'kemahasiswaan, coba komunikasikan dengan UKM futsal. sepertinya ini berbarengan juga dengan STIKOM, agar mereka bs memutuskan mana yg diikuti', 'dikomunikasikan dgn ukm futsal', '2022-06-28', 'waka III', '2022-06-21'),
(173, '002/Panitia-AnalgesiaSports/VI/2022', 'kemahasiswaan, coba dikomunikasikan ke UKM terkait', 'informasi dikomunikasikan', '2022-06-28', 'waka III', '2022-06-21'),
(174, '2022-AG-04-057', 'Kemahasiswaan, segera koordinasikan dengan UKM Mulmed (Esa) dan UPT untuk mensukseskan kegiatan ini', 'kegiatan terlaksana', '2022-06-30', 'waka III', '2022-06-29'),
(175, '002/SM/VI/2022', 'Kuik tolong tindak lanjuti, observasi dgn yang sinarmas dulu dan dilaporkan ke ketua', 'dikomunikasikan', '2022-07-14', 'waka III', '2022-06-29'),
(176, 'B.24.046/8890/SANDI/D.KOMINFOS', 'Mengkomunikasikan dengan pak Krisna dan pak Tiawan untuk dapat menjadi narasumber dalam kegiatan tersebut', 'Adanya narasumber pada kegiatan tersebut', '2022-06-29', '2', '2022-07-12'),
(177, '001/LH/SPK/VI/2022', 'PCC tlng observasi, dan komunikasakan apakah inline dgn program kita', 'diobservasi dan dikomunikasikan oeh PCC', '2022-07-18', 'waka III', '2022-07-12'),
(178, '24/667/Dpr/Srt/B', 'Kemahasiswaan, ormawa dan mahasiswa beasiswa tlng dikerahkan ', 'mahasiswa mengikuti kegiatan tersebut minimal 25 orang', '2022-07-12', 'waka III', '2022-07-12'),
(179, '2446/UND/SVM/V/2022', 'PPM akan mengikuti webinar tersebut', 'Mengikuti webinar dan mendapat insight sebagai acuan menyusun indikator kinerja', '2022-07-21', 'PPM', '2022-07-14'),
(180, 'B/178/UN14.4.B/DL.01/2022', 'Mengkoordinasikan ke HRD untuk dikomunikasikan ke para Dosen  bahwa ada pelatihan Pekerti ', 'Informasi sampai ke semua dosen Primakara dan memperoleh tanggapan', '2022-07-16', 'Waka II', '2022-07-14'),
(181, '002/GR/VII-Alibaba Cloud/2022', 'Koordinasi dengan kaprodi utk penyelenggaraan Seminar tentang Industri Cloud oleh Alibaba', 'Seminar tentang Industri Cloud oleh Alibaba terselenggara.', '2022-08-30', 'Waka I', '2022-07-18'),
(182, '010/K.I/SMK.AF/XII/2021', 'Diterima dan difasilitasi untuk kunjungan industri ', 'terlaksana kunjungan dengan baik ', '2021-12-14', 'Marketing', '2022-07-19'),
(183, '002/SPPG/VII/22', 'Koordinasi ke UPT untuk follow up lebih lanjut daftar peserta karena di hari minggu', 'UPT mengirimkan form peminjaman ruangan dan memperoleh form yang sudah diisi pemesan', '2022-07-28', 'Waka II', '2022-07-27'),
(184, '031/BUB-LP2SDM/VII/2022', 'tidak ditindaklanjuti karena belum dibutuhkan.', '28 Juli 2022', '0000-00-00', 'PPM', '2022-07-28'),
(185, 'AOI/10/VEN/2022', 'Tidak jadi peminjaman dan tidak ada komunikasi lagi dari ybs.', 'Kejelasan peminjaman ruangan', '2022-03-24', 'Waka II', '2022-07-28'),
(186, '003/SM/VII/2022', 'Mengkoordinasikan ke HRD untuk menindaklanjuti kerjasama', 'Kesepakatan waktu pemeriksaan mata para karyawan yang membutuhkan pemeriksaan', '2022-07-29', 'Waka II', '2022-07-28'),
(187, '4/SM/2022', 'Koordinasikan ke HRD untuk dikomunikasikan ke Dosen Wanita', 'Informasi dapat tersampaikan ke Dosen Wanita', '2022-07-05', 'Waka II', '2022-08-01'),
(188, '003/SPPG/VII/22', 'Koordinasikan ke UPT untuk komunikasi lebih lanjut ', 'Kegiatan dapat dilaksanakan dengan baik', '2022-08-03', 'Waka II', '2022-08-03'),
(189, 'T.44.003/22355/RT/B.UMPRO', 'Koordinasi dengan UPT dan bagian Design Multimedia untuk memasang hiasan bendera merah Putih dan Spanduk Hari Jadi ke 64 Provinsi Bali dan sekaligus Kemerdekaan17 Agustus  1945', 'Bendera hiasan dan spanduk ucapan terpasang', '2022-08-05', 'Waka II', '2022-08-03'),
(190, '0080/SP/AP-DPS/AKD/II/XII/2021', 'Menindaklanjuti izin pengambilan data ', 'Memberikan izin dan pengambilan data', '2021-12-18', '2', '2022-08-04'),
(191, '04/BW-KTH/II/2022', 'Koordinasi dengan pihak terkait dengan audiensi', 'Terlaksananya audiensi', '2022-02-26', '2', '2022-08-04'),
(192, '001/SM/MEI/2022', 'Share Pengumuman', 'Ada yang mengikuti', '2022-05-31', 'Waka III', '2022-08-04'),
(193, '001/SM/VI/2022', 'Menginformasikan ke mahasiswa ', 'Mahasiswa mengikuti pelatihan', '2022-06-20', 'Waka III', '2022-08-04'),
(194, '001/SPM/IV/2022', 'Menginformasikan ke UKM IM Club', 'UKM IM Club mengikuti kegiatan', '2022-04-17', 'Waka III', '2022-08-04'),
(195, '004/IFest/HIMAFORKA/II/2022', 'Menginformasikan kepada mahasiswa', 'Mahasiswa mengikuti event', '2022-03-10', 'Waka III', '2022-08-04'),
(196, '005/053/KS', 'Mengikuti kegiatan', 'Mengikuti kegiatan', '2022-02-03', 'Waka III', '2022-08-04'),
(197, '005/413/KS', 'Kuik berkomunikasi dengan Pemkot', 'Terlaksananya pertemuan delegai', '2022-06-13', 'Waka III', '2022-08-04'),
(198, '02/PPR/2021', 'Mengikuti acara persembahyangan', 'Mengikuti kegiatan tersebut', '2021-10-20', 'Waka III', '2022-08-04'),
(199, '005/701/Tapem', 'Mengikuti kegiatan', 'Mengikuti kegiatan', '2022-10-28', 'Waka III', '2022-08-04'),
(200, '09/UN48.22/UPT-PKKM/2022', 'Mengkaji dan memutuskan mengikuti kegiatan atau tidak', 'Keputusan dalam mengikuti kegiatan', '2022-04-14', 'Waka III', '2022-08-04'),
(201, '086/NTSC2022/IV/IPBI', 'Mengumumkan kepada mahasiswa', 'Ada mahasiswa yang mengikuti kegiatan', '2022-07-05', 'Waka III', '2022-08-04'),
(202, '0742/LL8/WA.01.04/2022', 'Menyebarkan form tracer study', 'Terisinya form tracer study', '2022-05-17', 'Waka III', '2022-08-04'),
(203, '074/UKM KEWIRAUSAHAAN/II-SPP/X/2021', 'Menginformasikan kepada para tenant', 'ada yang mengikuti kegiatan', '2022-11-26', 'Pusat Inovasi', '2022-08-04'),
(204, 'B/497/BPSDMI/BDI-Denpasar/IV/2022', 'Menginformasikan kepada para tenant', 'Terdapat tenant yang mengikuti', '2022-04-22', 'Pusat Inovasi', '2022-08-04'),
(205, '016/SPP/JCI-BD/OUT/V/2022', 'Mengkomunikasikan kepada para tenant', 'Adananya tenant yang mengikuti', '2022-05-31', 'Pusat Inovasi', '2022-08-04'),
(206, '124/SM/V/2022', 'Mengikuti kegiatan', 'Mengikuti kegiatan', '2022-05-31', 'Pusat Inovasi', '2022-08-04'),
(207, '517.1 / 916 / DISKOPUKMP', 'Koordinasi dan mempersiapkan narasumber', 'Adanya narasumber dalam pelatihan Diskop', '2022-06-15', 'Pusat Inovasi', '2022-08-04'),
(208, '013/SM/VI/2022', 'Adannya tenant yang mengikuti kegiatan', 'Adannya tenant yang mengikuti kegiatan', '2022-07-04', 'Pusat Inovasi', '2022-08-04'),
(209, '017/SM/2022', 'Melakukan Sponsorship pada acara', 'Mensupport acara', '2022-05-18', 'Marketing', '2022-08-04'),
(210, '882/PGRI2Bdg/B.15/2022', 'Menentukan jenis support yang akan dilakukan', 'Supporting acara', '2022-07-25', 'Marketing', '2022-08-04'),
(211, '086 /K.I/SMK.AF/VII/2022', 'Waktu kegiatan terlalu mepet', 'Tidak bisa ditindaklanjuti', '2022-07-18', 'Marketing', '2022-08-04'),
(212, '891/PGRI2BDG/U.6/2022', 'Menghadiri kegiatan', 'Menghadiri kegiatan', '2022-08-01', 'Marketing', '2022-08-04'),
(213, '375/II.3.AU/J/FIKOM/UMM/2022', 'Admin prodi akan melaksanakan sesuai dengan disposisi', 'Kegiatan terlaksana sesuai dengan instruksi', '0000-00-00', 'Waka I', '2022-08-09'),
(214, '1690/LL8/DT.00.05/2022', 'Mengikuti proposal bantuan RPL A', 'Proposal bantuan RPL A diikuti', '0000-00-00', 'Waka I', '2022-08-09'),
(215, ' 008/PANPEL-INVENTION/HIMAKOM/V/2022', 'Siva, coba cek lebih dalam ada ndak skema untuk PT. jika ada, mnta ukm terkait ikut ya makasi', 'jika ada skema untuk mahasiswa untuk dapat diikuti', '2022-08-25', 'waka III', '2022-08-12'),
(216, '1808/LL8/HM.00.08/2022', 'Mengkomunikasikan ke Dosen PNS melalui HRD untuk mengikuti Upacara di LLDIKTI', 'Informasi upacara di LLDIKTI bagi Dosen PNS diterima oleh yang bersangkutan', '2022-08-15', 'Waka II', '2022-08-15'),
(217, '004/SPPG/VIII/22', 'Melakukan Komunikasi dan negosiasi dengan PT. BIT mengenai Kompensasi peminjaman Kelas  ', 'Terdapat kesepakatan bila menggunakan kelas untuk yang berbayar', '2022-08-18', 'Waka II', '2022-08-15'),
(218, '1842/LL8/WS.01.07/2022', '2 dosen akan mengikuti ToT anti-korupsi', 'ToT anti-korupsi diikuti sampai selesai oleh 2 orang dosen', '2022-08-22', 'Waka I', '2022-08-18'),
(219, '4733/E2/DT.00.05/2022', 'Mengikuti sosialisasi RPL ', 'Sosialisasi RPL telah diikuti', '2022-08-10', 'Waka I', '2022-08-18'),
(220, '1795/LL8/DT.00.00/2022', 'Survey MBKM akan diisi', 'Survey MBKM diisi', '2022-08-20', 'Waka I', '2022-08-18'),
(221, '08.017/PL8.HMJ/PAN-PNBITC/2022', 'Share ke grup mahasiswa dan mengarahkan mahasiswa utk mengikuti kegiatan', 'Terdapat mahasiswa yg berpartisipasi dalam perlombaan', '2022-08-30', 'waka III', '2022-08-19'),
(222, '1819/LL8/KM.01.02/2022', 'Mempersiapkan peserta dan mendaftar lomba', 'Terdapat tim utk dikirimkan sebagai partisipan', '2022-09-10', 'waka III', '2022-08-19'),
(223, '1480/UN1/KM.UGM/Set.KM/PK.01.05/2022', 'Mengikuti sosialisasi Creative Hub Series MBKM', 'Sosialisasi Creative Hub Series MBKM diikuti', '2022-08-24', 'Waka I', '2022-08-23'),
(224, '1744/UN48.16/PM/2022', 'akan disampaikan ke dosen  melalui LPPM', '29', '0000-00-00', 'Pusat Inovasi', '2022-08-23'),
(225, 'EDUFAIR/003/XII/2022', 'Pelaksanaan Exop di SMAN 8 Denpasar ', 'Terlaksananya kegiatan Expo di SMAN 8 Denpasar ', '2022-08-25', 'Marketing', '2022-08-29'),
(226, '421.3/13.094/SMAN2/VIII/2022', 'Ikut berpartisipasi dalam Resman Education expo ', 'Terlaksananya kegiatan Resman Education expo ', '2022-09-01', 'Marketing', '2022-08-29'),
(227, '2070/LL8/KM.00/2022', 'Hal ini diperuntukkan bagi PT yang memiliki prodi S2 dan S3 yang berniat sebagai penyelenggara beasiswa  PMDSU dan mengunggah dokumen', 'Tidak dapat mengikuti karena kita belum menyelenggarakan S2 dan S3', '2022-09-02', 'Waka II', '2022-09-02'),
(228, '2123/LL8/HM.00.03/2022', 'Mengkoordinasikan ke Multimedia agar membantu team Humas dalam membuat laporan Kehumasan Media Sosial', 'Multimedia melakukan komunikasi dengan team Humas dalam membuat laporan Kehumasan Media Sosial', '2022-09-04', 'Waka II', '2022-09-02'),
(229, '017/E/ICCN/VIII/2022', 'pcc menyusun RAB dan diikuti', 'pcc mengikuti kegiatan', '2022-10-01', 'waka III', '2022-09-04'),
(230, '13/SM/VIII/2022', 'kemahasiwaan minta anak EC yang female mengikuti', 'mhs ec mengikuti', '2022-08-25', 'waka III', '2022-09-04'),
(231, '1985/LL8/LP.00.01/2022', 'waka III menghadiri', 'menghadiri', '2022-09-03', 'waka III', '2022-09-04'),
(232, '1804/LL8/TU.02.03/2022', 'melaksanakan upacara bendera', 'kegiatan upacara dilaksanakan', '2022-08-17', 'waka III', '2022-09-04'),
(233, ' 5391/E2/DT.01.01/2022 ', 'kemahasiswaa mengikuti', 'diikuti oleh kemahasiswaan dan peserta ppk ormawa', '2022-09-01', 'waka III', '2022-09-04'),
(234, '003/SM/VIII/2022', 'Melaksanakan presentasi dan open table di Edufair Sanjose 2022', 'Partisipasi kegiatan Edufair Sanjose 2022', '2022-09-29', 'Marketing', '2022-09-05'),
(235, '422.1/0895/SMAN.1-DPS/Disdik Prov.Bali', 'Mengikuti EDUFAIR SMANSA', 'Telah berpartisipasi dalam EDUFAIR  SMANSA', '2022-09-28', 'Marketing', '2022-09-06'),
(236, '08.017/PL8.HMJ/PAN-PNBITC/2022', 'kemahasiwaan dan ukm yg terkait untuk mengikuti dan mempersiapkan segala kebutuhannya', 'primakara mengikuti lomba', '2022-10-07', 'waka III', '2022-09-06'),
(237, '3143/JBM/IX/2022', 'di tindaklanjutin ke komersialisasi', '18 september', '0000-00-00', 'Pusat Inovasi', '2022-09-09'),
(238, 'B.24.005/13133/SANDI/D.KOMINFOS', 'waka III menghadiri kegiatan', 'kegiatan diikuti ', '2022-09-13', 'waka III', '2022-09-10'),
(239, '001/SM/VIII/2022', 'Belum bisa mengikuti karena  Baru datang dari Jogja langsung rapat Key Resullt Renstra dengan PPM', 'Belum bisa mengikuti', '2022-08-26', 'Waka II', '2022-09-12'),
(240, '2406/LL8/HM.01.00/2022 ', 'Mengirimkan kisah/cerita MBKM yang telah dijalankan oleh Primakara bersama mitra-mitra.', 'Kisah/cerita MBKM yang telah dijalankan oleh Primakara bersama mitra-mitra terkirimkan.', '2022-09-16', 'Waka I', '2022-09-13'),
(241, 'YCPW/2022/09/12/ARW/01', 'Melakukan komunikasi dengan UPT dan team Marketing terkait acara dan mengkomunikasikan ke YKIP atas permohonan tersebut', 'Ruangan dapat diblok untuk acara dan Marketing dapat sosialisasi dalam acara tersebut', '2022-09-20', 'Waka II', '2022-09-15'),
(242, 'B.420.003.3/1518/SMAN2.NGR/Disdikpora', 'Mengikuti EXPO SMAN 2 Negara', 'Sosialisasi dan membuka expo di SMAN 2 Negara', '2022-09-27', 'Marketing', '2022-09-19'),
(243, '3500/E4/DT.04.03/2022', 'Mengkoordinasikan ke Bagian HRD untuk sama sama kita pelajari  dan mengusulkan bila ada yang memenuhi persyaratan', 'Memahami syarat-syarat pengajuan dosen sebagai academic leader', '2022-09-22', 'Waka II', '2022-09-21'),
(244, 'UM.008/2416/PTP-II/KEMPAR/2022', 'Mempelajari, mengkaji maksud penelitian dan mengkomunikasikan dengan peneliti.', 'Mengkomunikasikan dengan peneliti untuk angket yang online mengingat beberapa dosen lanjut studi di luar .', '2022-09-26', 'Waka II', '2022-09-23'),
(245, 'B.24.046/13326/SANDI/D.KOMINFOS', 'kemahasiswan mengikuti', 'diikuti', '2022-09-27', 'waka III', '2022-09-23'),
(246, '08.018/PL8.UKM/PAN-INTECHFEST/2022', 'kemahasiswaa coba ditelaah, koordinasi dengan UKM untuk diikuti', 'koordinasi dengan UKM untuk lomba diikuti', '2022-09-30', 'waka III', '2022-09-23'),
(247, '06/KEM/09/2022', 'kemahasiswaan untuk menginstrusikan pembina dan ukm HIPMI PT untuk mengikuti dengan 30 anggotanya', 'kegiatan diikuti', '2022-09-27', 'waka III', '2022-09-23'),
(248, 'B.21.660/4324/SEKRET/DKLH', 'Koordinasi dengan HRD untuk mengadakan kegiatan bersih -bersih di kampus utamanya samah plastik dan mencatat sampah plastik untuk dilaporkan Ke Gubernur Bali', 'Pelaksanaan bersih bersih sampauh Plastik dan pelaporan dapat terlaksana dengan baik', '2022-09-30', 'Waka II', '2022-09-23'),
(249, '4221/E1/Hk.01.01/2022', 'Mempelajari dan melakukan sosialisasi tentang RPL', 'RPL tersosialisasikan', '2022-10-07', 'Waka I', '2022-09-26'),
(250, '042-09/PC-AS/BC/PKS/IX/2022', 'pcc berkoordinasi dgn stakeholder yg lain untuk menyaring peserta dan mengikuti kegiatan ini', 'diikuti', '2022-10-14', 'waka III', '2022-09-28'),
(251, '001/SM/IX/2022', 'KUIK dibantu PCC untuk pantau dan ikuti kegiatan ini', 'KUIK Mendaftar', '2022-10-07', 'waka III', '2022-10-03'),
(252, '024/HIMAPRODI-M/II-SPP/IX/2022', 'kemahasiswaa, kontak EC dan pembinanya untuk dapat mengukuti kegiatan ini, didiskusikan dan dipersiapkan dengan baik', 'mengikuti kegiatan', '2022-10-24', 'waka III', '2022-10-03'),
(253, '075/IX/CST/EDU/2022', 'Mengadakan pertemuan dengan CBN mengenai  proposal yang diajukan', 'Mengetahui maksud proposalnya dan penawarannya', '2022-10-06', 'Waka II', '2022-10-04'),
(254, '613/APTISI Wil. VII/09/2022', 'Kemahasiswaa, coba dipetakan untuk bisa diikuti di setiap UKM', 'ada lomba yang diikuti', '2022-10-17', 'waka III', '2022-10-09'),
(255, '2684/LL8/KM/2022', 'Menugaskan Bapak Gung De untuk mengikuti sosialisasi', 'sosialisasi diikuti ', '2022-09-28', 'Waka I', '2022-10-11'),
(256, '217/II-4/FEB/X/2022', 'Akan dipelajari oleh PPTI dan mengundang mhs tsb untuk memperoleh informasi lebih jelas, setelah itu bisa diputuskan.', 'Membuat keputusan diijinkan atau tidak mhs tsb untuk melakukan penelitian di Primakara', '2022-10-28', 'Waka I', '2022-10-11'),
(257, ' EDUFAIR/064/XII/2022', 'Mengikuti acara', 'Terlaksana sosialisasi dan partisipasi dalam expo Sman 1 Bangli', '2022-10-17', 'Marketing', '2022-10-11'),
(258, 'EDUFAIR/004/VIII/2022', 'Mengikuti edu fair dan sosialisasi SMan 1 Kediri', 'Terlaksana kegiatan edu fair dan sosialisasi SMan 1 Kediri', '2022-10-13', 'Marketing', '2022-10-11'),
(259, 'EDUFAIR/005/XII/2022', 'Melaksanakan Kegiatan', 'telah berPartisipasi dalam expo SMKN 2 Denpasar', '2022-10-07', 'Marketing', '2022-10-11'),
(260, 'B.31.880/5625/SMKN1 DPS/Dikpora', 'Membantu support SMKN 1 Denpasar', 'melakukan support kegiatan dalam bentuk goodie bag untuk hadiah dan fresh money', '2022-10-23', 'Marketing', '2022-10-11'),
(261, '018/UKM.PROGRESS/BEM.ITBSTIKOM/IX/2022', 'kemahasiswaan cek lomba apa aja yg ada, dan matchkan ukm yg ada untuk diikuti', 'diikuti', '2022-10-28', 'waka III', '2022-10-12'),
(262, '613/APTISI Wil. VII/09/2022', 'mengirim mahasiswa beasiswa technopreneurship', '27 oktober 2022', '0000-00-00', 'Pusat Inovasi', '2022-10-12'),
(263, '201/SMASK/DP.19/2022', 'Menugaskan Bapak Helmy dan Bapak Gung De sbg narasumber', 'Bapak Helmy dan Bapak Gung De menjalankan tugas sebagai narasumber dengan baik', '2022-10-28', 'Waka I', '2022-10-12'),
(264, '2977/LL8/HM.03.01/2022', 'Mengisi survey dan meminta pihak terkait seperti dosen dan mahasiswa untuk mengisi link survey kehumasan', '14 Oktober 2022', '2022-10-14', 'PPM', '2022-10-13'),
(265, 'B-2048/DJAI.5/AI.03.04/10/2022', 'menginformasikan ke tenant untuk berpastisipasi', '31 oktober 2022', '0000-00-00', 'Pusat Inovasi', '2022-10-14'),
(266, '063/SU/02/CAST/X/2022', 'mengirim mahasiswa beasiswa teknopreneur untuk datang', '20 oktober', '0000-00-00', 'Pusat Inovasi', '2022-10-19'),
(267, '025/HIMAPRODI-M/II-SPP/IX/', 'mengirim peserta dari tanant dan mahasiswa beasiswa', '29 oktober 2022', '0000-00-00', 'Pusat Inovasi', '2022-10-19'),
(268, '02/1045-3/18041', 'Koordinasi dengan Sekretariat untuk mohon waktu pak ketua untuk menerima audiensi dari BSI', 'Audiensi dapat berlangsung ke bapak Ketua', '2022-10-27', 'Waka II', '2022-10-24'),
(269, '019/UKM.PROGRESS/BEM.ITBSTIKOM/IX?2022', 'kemahasiswaan minta anak primedev mengikuti ', 'primedev mengikuti', '2022-10-29', 'waka III', '2022-10-24'),
(270, '451/PERMOHONAN/BM-HOKI/DPS/IX/2022', 'Mengkomunikasikan ke pihak HOKI Bank untuk menentukan waktu pertemuan', 'Terlaksananya audiensi program HOKI Bank di Primakara', '2022-11-07', 'Waka II', '2022-10-25'),
(271, '160/IDBBALI/KMH/X/2022', 'Komunikasi lebih lanjut dengan perwakilan komunitas Lycan Basketball IDB Bali untuk jadwal pelaksanaan peminjaman Lap Basket', 'Pelaksanaan peminjaman diperbolehkan dengan jadwal Sabtu dan Minggu', '2022-11-05', 'Waka II', '2022-11-02'),
(272, '010/HIPMI-PT-UNMAS/UNMAS-DPS/X/2022', 'kemahasiswaan, dikomunikasikan ke HIPMI PT untuk menghadiri', 'diikuti Hipmi PT', '2022-11-19', 'waka III', '2022-11-02'),
(273, '01/SM/XI/2022', 'KUIK coba dipelajari dan dikomunikasikan dgn pihak terkait, jk menguntungkan untuk ditindaklanjuti', 'dijajaki oleh KUIK', '2022-11-05', 'waka III', '2022-11-02'),
(274, '2311-2337/UN.8.11/PP/2022', 'Mengkoordinasikan HRD untuk berkoordinasi dengan Waka I untuk mengetahui apakah sertifikasi ini dibutuhkan oleh Dosen', 'Memperoleh keputusan apakah akan diikuti atau tidak', '2022-11-11', 'Waka II', '2022-11-02'),
(275, '027/02/SMAN 1 PETANG', 'Memberikan support dan membuka stand di SMAN 1 Petang', 'Memberikan support dan membuka stand di SMAN 1 Petang', '2022-10-28', 'Marketing', '2022-11-03'),
(276, '069/SPKS-ZB/HRD/2022', 'KUIK tlng eksekusi dan kounikasikan plus minusnya, lalu komunikasikan ya', 'dikomunikasikan dengan waka III', '2022-11-11', 'waka III', '2022-11-03'),
(277, '3533/LL8/TU.02.03/2022', 'Melakukan koordinasi ke HRD untuk menginformasikan ke seluruh Dosen PNS DPK untuk mengikuti Upacara Peringatan hari pahlawan 10 No 2022 di LLDIKTI', 'Dosen PNS DPK mendapatkan informasi untuk melaksanakan Upacara peringatan hari Pahlawan di LLDIKTI pukul 7.30 WIta', '2022-11-09', 'Waka II', '2022-11-09'),
(278, 'B-1033 /BPSDMP.34/LT.02.02/11/2022', 'mengirimkan 5 orang mahasiswa utk menghadiri', 'mahasiswa menghadiri kegiatan sosialisasi', '2022-11-12', 'waka III', '2022-11-15'),
(279, '006/SM/XI/2022', 'sebelumnya sudah ada yg sejenis ini masuk, KUIK coba dalami\r\nhasilnya kita coba diskusikan', 'KUIK menghubungi Mark', '2022-11-21', 'waka III', '2022-11-15'),
(280, '0038/SP/AP-DPS/KC/II/XI/2022', 'Mengomunikasikan ke Alfa Prima , PPTI,  UPT dan bagian BAAK untuk Jadwal penggunaan Laboratorium  dan terkait adanya surat edaran', 'Memperoleh solusi agar kegiatan terlaksana namun dengan tetap menjaga ketertiban.', '2022-11-12', 'Waka II', '2022-11-22'),
(281, 'B.031.005/2890/SMAN 1 PETANG/DIKPORA', 'Mengikuti expo pendidikan', 'Mengikuti expo pendidikan dan sosialisasi di SMAN 1 Petang', '2022-12-07', 'Marketing', '2022-11-29'),
(282, '421.3/0788/SMAN 5 Dps/Disdikpora Prov.Bali/2022', 'Mengikuti expo dan sosialisasi di SMAN 5 Dps', 'Selesai Mengikuti expo dan sosialisasi di SMAN 5 Dps', '2022-11-29', 'Marketing', '2022-11-29'),
(283, '4118/LL8/KS.01.00/2022 ', 'Mendaftarkan staf BAAK (Siska dan Ocha) menjadi operator untuk STMIK Primakara dan Akademi Akuntansi', 'Staf BAAK terdaftar sbg operator PDPT', '2022-12-14', 'Waka I', '2022-12-12'),
(284, ' 4439/LL8/KM.00/2022', 'Melihat informasi di situs bangkit academy dan menyampaikan ke mahasiswa', 'Informasi tentang bangkit academy disampaikan kepada mahasiswa', '2022-12-30', 'Waka I', '2022-12-12'),
(285, '3600/LL8/KM/2022 ', 'Akan diikuti oleh Kaprodi SI dan Admin Prodi', 'Kaprodi SI dan Admin Prodi mengikuti dan mendiskusikan hasilnya ke kaprodi lainnya dan Waka I', '2022-11-16', 'Waka I', '2022-12-12'),
(286, '7060/E2/DT.00.00/2022', 'Mengikuti Seminar IDCP (inti Dasar Capaian Pendidikan)', 'Seminar IDCP dapat diikuti dengan baik', '2022-11-23', 'Waka I', '2022-12-12'),
(287, 'S-746/WPJ.17/2022', 'Menggunggah RPS MKWK dan koordinasi jadwal sit-in dengan Kanwil Pajak', 'RPS terunggah dan jadwal sit-in disepakati', '2022-11-11', 'Waka I', '2022-12-12'),
(288, '002/SM/XI/2022', 'Menugaskan PPTI dan BAAK untuk mengikuti sosialisasi sistem akademik oleh PT ISN', 'PPTI dan BAAK mengikuti dan mempertimbangkan sistem dari PT ISN', '2022-11-11', 'Waka I', '2022-12-12'),
(289, '3163/LL8/KM/2022', 'Pak Helmy dan Bu Tri mengikuti  Sharing Session Perubahan Perilaku Pasca Covid-19 di L2Dikti 8', 'Kegiatan diikuti dengan baik', '2022-10-19', 'Waka I', '2022-12-12'),
(290, '028/SPN/BAAK/IX/2022', 'Memeberika ijin survey skripsi', 'Ijin survey telah diberikan', '2022-10-19', 'Waka I', '2022-12-12'),
(291, '01/SM/X/2022', 'Menugaskan BAAK dan Kaprodi untuk menyebarluaskan informasi kepada mahasiswa', 'Informasi tersebarluaskan ke mahasiswa', '2022-10-17', 'Waka I', '2022-12-12'),
(292, '598/LA/23730/2022', 'Menugaskan Kaprodi IF dan Ka. PPTI untuk mengikuti kegiatan di Hotel Pullman', 'Kaprodi IF dan Ka. PPTI mengikuti seminar dengan baik', '2022-10-19', 'Waka I', '2022-12-12'),
(293, '016 / SRB / SK / XII / 2022', 'KUIK susun PKS/MOU untuk program ini', 'PKS dilaksanakan dnegan baik', '2022-12-17', 'waka III', '2022-12-16'),
(294, '5094/KIII.4/C.5/XII/2022', 'diputuskan akan diikuti', 'Marketing mengikuti expo dan sosialisasi', '2022-12-23', 'Marketing', '2022-12-19'),
(295, '457/EX-SALES/OFA/XI/2022', 'akan mengikuti diskusi online tentang program studi independen kampus merdeka mandiri', 'diskusi online tentang program studi independen kampus merdeka mandiri diikuti dengan baik dan hasilnya disampaikan kepada koordinator MBKM terkait', '2022-12-22', 'Waka I', '2022-12-20'),
(298, '002/INSTIKI.HIMA-TI/SPm.03/12/2022', 'Meneruskan ke UKM Prime Dev dan UKM Multimedia', 'Terdapat mahasiswa yang mengikuti kegiatan', '2023-02-17', 'waka III', '2023-01-16'),
(299, '065/SU/AP-D/UKMKWU/XIs/2022', 'Meneruskan informasi ke UKM HIPMI', 'UKM dapat menghadiri kegiatan', '2023-01-16', 'waka III', '2023-01-16'),
(300, '0358/LL8/KM/2023', 'Mengikuti melalui youtube', 'Sosialisasi diikuti', '2023-01-30', 'Waka I', '2023-02-08'),
(301, '0408/LL8/KS.01.00/2023 ', 'sudah mendaftar untuk mengikuti', 'Mengikuti pendampingan PDDikti sehingga tidak ada masalah ketika penggabungan data', '2023-04-24', 'Waka I', '2023-02-08'),
(302, '3022/UND/SVM/II/2023', 'Mengikuti webinar', 'Webinar tentang RPL diikuti dengan baik', '2023-02-23', 'Waka I', '2023-02-08'),
(303, 'B.20.556 /680/PKSDM/DISPAR', 'Mengirim Pak Dwi dan Pak Tiawan untuk menjadi narasumber', 'Data sudah dikirim', '2023-02-10', 'Pusat Inovasi', '2023-02-09'),
(304, 'B/489/UN34/KM.05.03/2023', 'Di infokan ke tenant dan mahasiswa beasiswa', 'Memastikan tenant dan mahasiswa beasiswa mengikuti kegiatan tersebut', '2023-02-10', 'Pusat Inovasi', '2023-02-09'),
(305, '034/Panpel-SEF/BEMFEB-UNMAS/I/2023', 'Diinfokan untuk tenant dan mahasiswa beasiswa', 'tenant dan mahasiswa beasiswa dapat mengikuti kegiatan lomba tersebut', '2023-02-10', 'Pusat Inovasi', '2023-02-09'),
(306, '03/BbH/II/2023', 'Tidak mengikuti dikarenakan pelatihan yang diberikan basic pengelola jurnal', 'tidak mengikuti ', '2023-02-09', 'Pusat Inovasi', '2023-02-09'),
(307, '001/SM/II/2023', 'PCC dicari dan dipublikasikan', 'dihsare dan dicari ', '2023-02-28', 'waka III', '2023-02-09'),
(308, 'B.32.027/429/UPTD. RUMAH KREATIF/DISPERINDAG', 'pcc share ke alumni atau mahasiswa yg berminat', 'berita di informasikan ke mahasiswa dan alumni', '2023-02-28', 'waka III', '2023-02-14'),
(309, '002/SM/II/2023', 'KUIK di FU ', 'KUIK FU kegiatan', '2023-02-28', 'waka III', '2023-02-14'),
(310, 'B.17.074/927/Bid.I/BRIDA', 'Mendiskusikan keikutsertaan', 'Mempertimbangkan pengiriman proposal', '2023-02-20', 'Pusat Inovasi', '2023-02-16'),
(311, '108/A/Panpel-ELCCO/HME/FT-UNUD/I/2023', 'Kemahasiswaan cek lomba yang mungkin bisa diikuti, dan jika ada yg terkait untuk dikoordinasikan dgn ukm atau ormawa terkait untuk bisa diikuti', 'disosialisasikan dan jk memungkinkan diikuti', '2023-03-17', 'waka III', '2023-02-17'),
(312, '01.003/PL8.HMJ/PAN-NAC/2023', 'Kemahasiswaan berkoordinasi bersama hima SIA dan pembinanya untuk mengikuti dengan baik', 'diikuti dan persiapkan dengan baik', '2023-03-17', 'waka III', '2023-02-17'),
(313, '004/SM/II/2023', 'Sudah dikoordinasikan dengan inbis dan sudah registrasi untuk mengikuti kegiatan', 'sudah melakukan registrasi', '2023-02-23', 'Pusat Inovasi', '2023-02-23');
INSERT INTO `sip_tindaklanjut` (`kodeTindaklanjut`, `noSurat`, `isiTindaklanjut`, `isiTarget`, `tglSelesai`, `userInput`, `tglInput`) VALUES
(314, '0639/LL8/HK.12.01/2023', 'Dikoordinasikan dan Diikuti oleh Kepala Pusat Inovasi ', 'Mengikuti Kegiatan pelatihan penulisan deskripsi paten', '2023-02-23', 'Pusat Inovasi', '2023-02-23'),
(315, '003/SM/II/2023', 'KUIK dan PCC tlng segera jajaki', 'dikomunikasikan dan di jajaki', '0000-00-00', 'waka III', '2023-03-01'),
(316, '0727/LL8/KP.08.00/2023', 'Mengkoordinasikan ke HRD untuk dishare ke para dosen untuk menginput dan mengupdate data pribadi masing-masing kemudian baru di Validasi oleh HRD', 'Semua dosen PNS DPK dan Dosen tetap Yayasan yang memiliki Jafung dan serdos data pribadinya terupload pada Aplikasi SISTER  ', '2023-03-07', 'Waka II', '2023-03-06'),
(317, '005/IRDH/II/2023', 'tidak mengikuti dikarenakan wajib membawa peserta dengan minimal peserta 20 orang yang biaya perorang 200.000 ', 'tidak mengikuti', '2023-03-06', 'Pusat Inovasi', '2023-03-06'),
(318, '001/COMVET-TCL/SLO/II/2023', 'Mengintruksikan UKM Esprime untuk mengikuti kegiatan', 'UKM Mengikuti kegiatan', '2022-02-24', 'waka III', '2023-03-09'),
(319, 'W.20.UM.01.01-1906', 'Menungaskan Pak Dwi untuk menghadiri kegiatan Diseminasi dan Promosi Kekayaan Intelektual', 'Menghadiri kegiatan  Diseminasi dan Promosi Kekayaan Intelektual', '2023-03-10', 'Pusat Inovasi', '2023-03-09'),
(320, 'B/UND/492/UM.00.01/D.3.3/2023', 'Menugaskan Pak Tiawan untuk menghadiri kegiatanFGD Pemetaan dalam Rangka Persiapan Pengembangan Klaster Kreatif Bali', 'Mengahdiri kegiatan FGD', '2023-03-10', 'Pusat Inovasi', '2023-03-09'),
(321, '895.3/2356/SETDA/BALITBANG', 'Menugakan bu Satvika untuk mengikuti kegiatan Forum Kelitbangan', 'Menghadiri kegiatan Forum Kelitbangan', '2023-03-10', 'Pusat Inovasi', '2023-03-09'),
(322, '0682/SDM/PBK/2023', 'Mengkoordinasikan dengan pak dwi untuk mencari juri untuk kegiatan BPD', 'Mendapatkan juri untuk kegiatan BPD', '2023-03-10', 'Pusat Inovasi', '2023-03-09'),
(323, 'B.17.880/1812/Bid.I/BRIDA', 'Membuat list terkait kegiatan mahasiswa melakukan MBKM (digitalisasi UMKM) dan Mengirimkan data ke BRIDA Provinsi Bali', 'Mengirimkan data yang sudah dibuat ke BRIDA Provinsi Bali', '2023-03-10', 'Pusat Inovasi', '2023-03-09'),
(324, '0988/LL8/KM/2023', 'akan menghadiri sosialisasi Program Bantuan Kurikulum Merdeka', 'Sosialisasi program bantuan kurikulum merdeka diikuti dengan tuntas', '2023-03-24', 'Waka I', '2023-03-20'),
(325, '004/SM/III/2023', 'Menghadiri gathering Campus UID Bali', 'Gathering Campus UID Bali diikuti', '2023-03-15', 'Waka I', '2023-03-20'),
(326, '005 / 296 /DKIS', 'Mengirimkan mahasiswa IF untuk mengikuti Sosialisasi Perlindungan Data', 'Sosialisasi Perlindungan Data diikuti oleh mahasiswa IF', '2023-03-14', 'Waka I', '2023-03-20'),
(327, '0629/LL8/KM/2023', 'Mengisi Survey Tindakan Kekeresan dan Pelecehan Seksual', 'Survey sudah diisi', '2023-03-06', 'Waka I', '2023-03-20'),
(328, '0630/LL8/KM/2023', 'Mengisi survey mahasiswa disabilitas', 'Survey telah diisi', '2023-03-21', 'Waka I', '2023-03-20'),
(329, 'B/UND/605/PK.01.06/PTP.2/PTP.2.B/2023', 'Menginformasikan kepada dosen STMIK Primakara', 'Mengirimkan informasi kepada dosen STMIK Primakara untuk mengikuti kegiatan ini', '2023-04-05', 'Pusat Inovasi', '2023-04-03'),
(330, '1175/LL8/KS.03.00/2023', '1. Menyiapkan tim pelaksana \r\n2. Untuk persiapan peserta lomba dari Mahasiswa beasiswa technopreneur dan Tenant Inkubator bisnis', 'Dapat mengikuti kegiatan dengan menyiapkan tim pelaksana dan peserta lomba', '2023-04-07', 'Pusat Inovasi', '2023-04-03'),
(331, 'S-93/KR.0801/2023', 'LPPM akan berkoordinasi dengan Kaprodi SIA terkait keikutsertaan dalam kegiatan ', 'Dapat mengikuti kegiatan Riset ilmiah', '2023-04-07', 'Pusat Inovasi', '2023-04-03'),
(332, 'B-039/05300/VS.330/01/2023', 'Mengisi form Survey Captive Power Tahun 2023  dari BPS', 'Pengiriman kembali ke BPS setelah form survei diisi ', '2023-04-10', 'Waka II', '2023-04-04'),
(333, '1193/LL8/KM/2023', 'Kaprodi SIA dan Kprodi IF akan mengikuti sosialisasi implementasi MBKM', 'Kegiatan diikuti dengan baik oleh Kaprodi SIA dan Kaprodi IF dan menyampaikan hasilnya kepada tim MBKM', '2023-04-10', 'Waka I', '2023-04-04'),
(334, 'B.17.005/2772/BID.I/BRIDA', 'Menugaskan LPPM untuk mengikuti kegiatan di BRIDA', 'Mengikuti kegiatan BRIDA oleh LPPM', '2023-04-11', 'Pusat Inovasi', '2023-04-10'),
(335, '001/SM/IV/2023', 'Menginformasikan kepada dosen STMIK Primakara', 'Mengirimkan informasi kepada dosen STMIK Primakara untuk mengikuti kegiatan ini', '2023-04-10', 'Pusat Inovasi', '2023-04-10'),
(336, '1294/LL8/KM.01.02/2023', 'Kemahasiswaan lakukan penyaringan untuk mahasiswa berprestasi untuk bisa diikuti kegiatan ini', 'ada mahasiswa yang bisa mengukuti', '2023-04-15', 'waka III', '2023-04-10'),
(337, '002/SM/IV/2023', 'akan didiskusikan dengan para kaprodi ', 'rekomendasi terhadap tawaran Out Class', '2023-04-17', 'Waka I', '2023-04-10'),
(338, '787/XI-01/0423', 'Berkoordinasi dengan HRD untuk menentukan jadwal sosialisasi oleh BPJS mengenai pengisian form  Skining Kesehatan karyawan dari BPJS', 'Seluruh pegawai mengisi form skrining kesehatan dari BPJS', '2023-05-05', 'Waka II', '2023-04-13'),
(339, '0117/HRGS Corp/Doc/PTBCE/III/2023', 'KUIK PCC coba jajaki dan analisa unit mana yg terlibat lalu buatkan struktur kepanitiaan (jika diperlukan)', 'didalami', '2023-04-29', 'waka III', '2023-04-14'),
(340, '003/SM/IV/2023', 'Berkoordinasi dengan inbis agar tenant dapat mengikuti kegiatan ini', 'Dapat mengirim team untuk mengikuti lomba International Summer Program 2023', '2023-06-06', 'Pusat Inovasi', '2023-04-27'),
(341, '0117/HRGS Corp/Doc/PTBCE/III/2023', 'Berkoordinasi terkait Waka III terkait pelaksanaan kegiatan', 'Dapat mengiktui kegiatan', '2023-04-29', 'Pusat Inovasi', '2023-04-27'),
(342, '036/BEM-FEB/II-SPP/IV/2023', 'Berkoordinasi dengan Inbis untuk mendorong tenant mengikuti kegiatan lomba UMBCC', 'Mengikuti kegiatan lomba UMBCC', '2023-04-29', 'Pusat Inovasi', '2023-04-27'),
(343, '027/266/KPID', 'Kuik langsung jadikan PKS, lalu jajaki mengenai pelaksanaannya ', 'dikomunikasikan dan disepekati kapan pelaksanaan literasinya serta plot narsum dan MC', '2023-05-11', 'waka III', '2023-05-04'),
(344, '001/SM/V/2023', 'PCC coba tlng jajaki dan dikomunikasian apa benefit buat kita', 'dikomunikasikan oleh PCC', '2023-05-12', 'waka III', '2023-05-04'),
(345, '1754/LL8/HM.00.03/2023', 'Mendaftarkan Tegar dan Bu Tri sbg perwakilan Primakara dalam berkomunikasi dengan LLDikti 8', 'Telah mendaftarkan Tegar dan Bu Tri sbg perwakilan Primakara dalam berkomunikasi dengan LLDikti 8', '2023-05-10', 'Waka I', '2023-05-10'),
(346, '25/554/Dpr/Srt/B', 'Mengkoordinasikan ke HRD untuk menunjuk pewakilan ke BI untuk mengikuti acara Talkshow CBDC Peluang  bagi industri pariwisata & ekonomi kreatif.', 'Ada perwakilan dari STMIK Primakara untuk mewakili undangan tersebut ', '2023-05-16', 'Waka II', '2023-05-16'),
(347, '2000/LL8/KS.03.00/2023', 'PCC dan KUIK untuk mengikuti', 'diikuti oleh PCC dan KUIK', '2023-05-23', 'waka III', '2023-05-22'),
(348, 'B.24.005/9608/IAI/D.KOMINFOS', 'kemahasiswaan cari mahasiswa untuk dapat mengikuti kegiatan lomba tsb', 'mengikuti lomba', '2023-05-26', 'waka III', '2023-05-22'),
(349, 'B.24.005/9537/IKP/D.KOMINFOS', 'kemahasiswaan agar mahasiswa multimedia mengikuti kegiatan ini', 'diikuti oleh UKM Lutimedia', '2023-05-23', 'waka III', '2023-05-22'),
(350, 'BAL/453/4/2023', 'KUIK akan mengkomunikasikan dengan pihak Konsulat terkait kegiatan', 'Berkolaborasi dalam kegiatan tersebut', '2023-04-21', '2', '2023-06-07'),
(351, '005 /361/DKIS', 'Menginformasikan kepada KUIK untuk dapat menghadiri kegiatan ', 'KUIK mengikuti kegiatan', '2023-03-24', '2', '2023-06-07'),
(352, '800/506/101.6.10.15/2023', 'Mempersiapkan kunjungan', 'Berjalannya kunjungan industri SMK 5 Kota Malang', '2023-05-17', '2', '2023-06-07'),
(353, '0038/NEX-IDN/MAY/2023', 'Menugaskan inbis untuk mengikuti kegiatan', 'Inbis mengikuti', '2023-05-27', '2', '2023-06-07'),
(354, '1542/LL8/DT.02.04/2023', 'sudah dilakukan pendaftara', 'lolos sebagai fasilitator', '2023-04-17', 'PPM', '2023-06-13'),
(355, '2126/LL8/KL.01.00/2023', 'Akan dilakukan diskusi terlebih dahulu dengan BAAK terkait akreditasi PT sebagai universitas.', 'Upload data', '2023-06-23', 'PPM', '2023-06-13'),
(356, '15/UW/BEM-FH/PanPel-DekanCupXI/V/2023', 'Menginformasikan lomba ke UKM Esprime', 'terdapat tim yg mengikuti kegiatan', '2023-06-14', 'waka III', '2023-06-13'),
(357, '14/UW/BEM-FH/PanPel-DekanCupXI/V/2023', 'Menginformasikan info lomba ke UKM Futsal', 'Terdapat tim yg mengikuti kegiatan', '2023-06-14', 'waka III', '2023-06-13'),
(358, 'B.24.045/11778/IKP/D.KOMINFOS', 'Follow up (surat dummy)', 'Sudah terkonfimasi', '2023-07-04', '2', '2023-07-03'),
(359, 'B.24.045/11778/IKP/D.KOMINFOS', 'test', 'test', '0000-00-00', '2', '2023-07-03'),
(360, '3936/E3/OT.00.00/2021', 'test', 'test', '2023-12-31', '2', '2023-07-03'),
(361, '004', 'test', 'test', '2023-12-31', '2', '2023-07-04'),
(362, '87', 'test', 'test', '2023-12-31', 'sdm2', '2023-07-04'),
(363, '006', 'test', 'test', '2023-12-31', '2', '2023-07-05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_tujuan`
--

CREATE TABLE `sip_tujuan` (
  `idtujuan` int(11) NOT NULL,
  `nosurat` varchar(100) DEFAULT NULL,
  `pengirimdivisi` varchar(10) DEFAULT NULL,
  `tujuandivisi` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `tglinput` date DEFAULT NULL,
  `userinput` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sip_tujuan`
--

INSERT INTO `sip_tujuan` (`idtujuan`, `nosurat`, `pengirimdivisi`, `tujuandivisi`, `status`, `tglinput`, `userinput`) VALUES
(2, '973.1/0034/Bapenda', '2', '1', '0', '2021-08-04', '2'),
(3, '973.1/0035/Bapenda', '2', '1', '0', '2021-08-04', '2'),
(4, '973.1/0035/Bapenda', '2', '1', '0', '2021-08-04', '2'),
(5, '973.1/0035/Bapenda', '2', '1', '0', '2021-08-04', '2'),
(6, '973.1/0035/Bapenda', '2', '1', '0', '2021-08-04', '1'),
(7, '1/2/coba', '2', '1', '0', '2021-08-05', '2'),
(8, '123/1/sda', '2', '1', '0', '2021-08-05', '2'),
(9, '1/2/gas', '2', '1', '0', '2021-08-05', '2'),
(10, '1/2/surat1', '2', '1', '0', '2021-08-06', '2'),
(11, '2021/08/22', '2', '1', '0', '2021-08-23', '2'),
(12, '2021/08/23', '2', '1', '0', '2021-08-23', '2'),
(13, '2021/08/22', '2', '1', '0', '2021-08-23', '2'),
(14, '2021/08/24', '2', '1', '0', '2021-08-23', '2'),
(15, '1/2/3', '2', '1', '0', '2021-08-23', '2'),
(16, '1/2/4', '2', '1', '0', '2021-08-23', '2'),
(17, '1/2/6', '2', '1', '0', '2021-08-23', '2'),
(18, '1/2/4 surat masuk', '2', '1', '0', '2021-09-08', '2'),
(19, '1/2/5suratmasuk', '2', '1', '0', '2021-09-08', '2'),
(20, '2172/LL8/TU/2021', '2', '1', '0', '2021-09-08', '2'),
(21, '3936/E3/OT.00.00/2021 ', '2', '1', '0', '2021-09-13', '2'),
(22, '0', '2', '1', '0', '2021-09-14', '2'),
(23, '017/panpel/2021', '2', '1', '0', '2021-09-14', '2'),
(24, '3936/E3/OT.00.00/2021', '2', '1', '0', '2021-09-15', '2'),
(25, '2375/LL8/KL/2021', '2', '1', '0', '2021-09-15', '2'),
(26, '0', '2', '1', '0', '2021-09-16', '2'),
(27, '5220/E2/PB.04.04/2021', '2', '1', '0', '2021-09-17', '2'),
(28, 'BI.31.420/76560/DIKPORA', '2', '1', '0', '2021-09-21', '2'),
(29, 'tes', '2', '1', '0', '2021-09-21', '2'),
(30, '029/MK.01/GP-331/IX/2021', '2', '1', '0', '2021-09-21', '2'),
(31, '5437/E2/DM.00.01/2021', '2', '1', '0', '2021-09-21', '2'),
(32, '001', '2', '1', '0', '2021-09-23', '2'),
(33, '3041/PD.04/D3/2021', '2', '1', '0', '2021-09-23', '2'),
(34, '002', '2', '1', '0', '2021-09-23', '2'),
(35, '003', '2', '1', '0', '2021-09-23', '2'),
(36, '2406/LL8/PR/2021', '2', '1', '0', '2021-09-27', '2'),
(37, '1634/UN48.16/LT/2021', '2', '1', '0', '2021-09-27', '2'),
(38, '011/UKM.PROGRESS/BEM.ITBSTIKOM/IX/2021', '2', '1', '0', '2021-09-27', '2'),
(39, '004', '2', '1', '0', '2021-09-29', '2'),
(40, '005/634/KS', '2', '1', '0', '2021-10-02', '2'),
(41, '005', '2', '1', '0', '2021-10-04', '2'),
(42, '547/E/Pan.Intergalatic/BEM FMIPA//UNESA/IX/2021', '2', '1', '0', '2021-10-04', '2'),
(43, '405/APTISI WILL. VII/09/2021', '2', '1', '0', '2021-10-04', '2'),
(44, '2632/LL8/KM/2021', '2', '1', '0', '2021-10-08', '2'),
(45, '2627/L8/KL/2021', '2', '1', '0', '2021-10-08', '2'),
(46, '2653/L8/KP/2021', '2', '1', '0', '2021-10-09', '2'),
(47, '10/UNWAR/LPM/Pan.SemNas/PD-11/2021', '2', '1', '0', '2021-10-09', '2'),
(48, '006', '2', '1', '0', '2021-10-09', '2'),
(49, '632/II.10/TVRI/2021', '2', '1', '0', '2021-10-14', '2'),
(50, 'B/6593/UN14/HK.07.00/2021', '2', '1', '0', '2021-10-16', '2'),
(51, '10452/E1/HM.01.00/2021', '2', '1', '0', '2021-10-16', '2'),
(52, '02/PPR/2021', '2', '1', '0', '2021-10-19', '2'),
(53, '559/421.3/SMK-ITB/X/2021', '2', '1', '0', '2021-10-25', '2'),
(54, '6233/E2/DM.00.01/2021', '2', '1', '0', '2021-10-26', '2'),
(55, '009/HL.369/DI/X/2021', '2', '1', '0', '2021-10-26', '2'),
(56, 'B.25.518/1254/PK/Diskop UKM', '2', '1', '0', '2021-10-26', '2'),
(57, '005/701/Tapem', '2', '1', '0', '2021-10-28', '2'),
(58, '4039/E4/KK.01.01/2021', '2', '1', '0', '2021-10-28', '2'),
(59, '007', '2', '1', '0', '2021-11-04', '2'),
(60, '074/UKM KEWIRAUSAHAAN/II-SPP/X/2021', '2', '1', '0', '2021-11-04', '2'),
(61, '70/APM/X/2021', '2', '1', '0', '2021-11-04', '2'),
(62, 'S-771/WJP.17/2021', '2', '1', '0', '2021-11-04', '2'),
(63, '017/SPN/BAAK/X/2021', '2', '1', '0', '2021-11-04', '2'),
(64, '001/SPN/BAAK/XI/2021', '2', '1', '0', '2021-11-04', '2'),
(65, 'SP/132/BAGI-KUTA/XI/2021', '2', '1', '0', '2021-11-16', '2'),
(66, '9206/Dirut.GG/KPT-EDU/P2K/X/2021', '2', '1', '0', '2021-11-16', '2'),
(67, '27/D/SMK.DM/XI/2021', '2', '1', '0', '2021-11-16', '2'),
(68, '27/D/SMK.DM/XI/2021', '2', '1', '0', '2021-11-16', '2'),
(69, '27/D/SMK.DM/XI/2021', '2', '1', '0', '2021-11-16', '2'),
(70, '6694/E2/BS.01.01/2021', '2', '1', '0', '2021-11-18', '2'),
(71, '053/HMPS-PE/X/2021', '2', '1', '0', '2021-11-23', '2'),
(72, '3214/LL8/KM/2021', '2', '1', '0', '2021-11-23', '2'),
(73, '005/1539/KS', '2', '1', '0', '2021-11-25', '2'),
(74, 'S-84/WPJ.17/2021', '2', '1', '0', '2021-12-06', '2'),
(75, '13427/E1/DI.00.01/2021', '2', '1', '0', '2021-12-06', '2'),
(76, '6952/E2/BS.01.01/2021', '2', '1', '0', '2021-12-06', '2'),
(77, '006/SPM/SMKFuqron/2021', '2', '1', '0', '2021-12-06', '2'),
(78, '01/S.II/BID.IX/SMAK-SY/XI/2021', '2', '1', '0', '2021-12-06', '2'),
(79, '010/K.I/SMK.AF/XII/2021', '2', '1', '0', '2021-12-07', '2'),
(80, '001/XI/LPM/2021', '2', '1', '0', '2021-12-09', '2'),
(81, '007/ST/2021', '2', '1', '0', '2021-12-09', '2'),
(82, '008/SM/XII/2021', '2', '1', '0', '2021-12-09', '2'),
(83, '1051/FEBP/UNHI/XII/2021', '2', '1', '0', '2021-12-10', '2'),
(84, '228/BP/DE/XII/2021', '2', '1', '0', '2021-12-16', '2'),
(85, '13676/E1/DI.04.02/2021', '2', '1', '0', '2021-12-16', '2'),
(86, '1269.H/KOMINFO/DJAI/HM.01.01/12/2021', '2', '1', '0', '2021-12-16', '2'),
(87, '04/E/PANPEL LIP/III.2/XI/2021', '2', '1', '0', '2021-12-16', '2'),
(88, '0080/SP/AP-DPS/AKD/II/XII/2021', '2', '1', '0', '2021-12-16', '2'),
(89, '420/6549/SMKN1/2021', '2', '1', '0', '2021-12-20', '2'),
(90, '14726/E1/DI.04.02/2021', '2', '1', '0', '2021-12-21', '2'),
(91, '13751/E1/DI.04.02/2021', '2', '1', '0', '2021-12-22', '2'),
(92, '3603/LL8/KP/2021', '2', '1', '0', '2021-12-22', '2'),
(93, '3654/LLB/TU/2021', '2', '1', '0', '2021-12-22', '2'),
(94, '002/PemilihanTTD2022/SemetonTTD/XI/2021', '2', '1', '0', '2021-12-28', '2'),
(95, '009/SM/XII/2021', '2', '1', '0', '2021-12-28', '2'),
(96, '185/UW-FE/PD-10/AKU/XII/2021', '2', '1', '0', '2021-12-28', '2'),
(97, '010/SM/XII/2021', '2', '1', '0', '2021-12-28', '2'),
(98, 'B.1037.e-BIS/DPS/12/2021', '2', '1', '0', '2021-12-29', '2'),
(99, '3716/LL8/PR/2021', '2', '1', '0', '2021-12-29', '2'),
(100, '1457/SPP/SVM/XII/2021', '2', '1', '0', '2022-01-04', '2'),
(101, '001/SM/I/2022', '2', '1', '0', '2022-01-05', '2'),
(102, '114/BEM-AS/AP-DPS/CEO/I/2022', '2', '1', '0', '2022-01-07', '2'),
(103, '0042/LL8/KB.01.01/2022', '2', '1', '0', '2022-01-11', '2'),
(104, '2021-AG-01-003', '2', '1', '0', '2022-01-17', '2'),
(105, '002/SMKHI/I/2022', '2', '1', '0', '2022-01-17', '2'),
(106, '125/BEM-AS/AP-DPS/CEO/I/2022', '2', '1', '0', '2022-01-17', '2'),
(107, 'DES/0031/2022', '2', '1', '0', '2022-01-18', '2'),
(108, '0106/LL8/KB.01.01/2022', '2', '1', '0', '2022-01-20', '2'),
(109, '003/SM/I/2022', '2', '1', '0', '2022-01-24', '2'),
(110, '009/03/PARAS-ICT-VII-STIKI/I/2022', '2', '1', '0', '2022-01-24', '2'),
(111, '1686/UND/SVM/I/2022', '2', '1', '0', '2022-01-24', '2'),
(112, '421.7/30/418.27/SMK.Br.Kp/I/2022', '2', '1', '0', '2022-01-27', '2'),
(113, '1157/PANPEL/DEBAT/FEBP-UNHI/XII/2021', '2', '1', '0', '2022-01-27', '2'),
(114, '0275/E2/BS.01.01/2022', '2', '1', '0', '2022-01-27', '2'),
(115, 'DES/0031/2021', '2', '1', '0', '2022-01-31', '2'),
(116, 'B.19.340/834/SDK/DISBUD', '2', '1', '0', '2022-01-31', '2'),
(117, '001/SPM/I/2022', '2', '1', '0', '2022-01-31', '2'),
(118, '005/053/KS', '2', '1', '0', '2022-02-02', '2'),
(119, '0167/LL8/HK.01.04/2021', '2', '1', '0', '2022-02-02', '2'),
(120, '0161/LL8/AK.02.01/2022', '2', '1', '0', '2022-02-03', '2'),
(121, 'B/328.4/UN34/KM/2022', '2', '1', '0', '2022-02-03', '2'),
(122, 'BNIS/3.9/936', '2', '1', '0', '2022-02-03', '2'),
(123, '114/SGN-OUT/LYRA/06/22', '2', '1', '0', '2022-02-03', '2'),
(124, '007/SM/II/2022', '2', '1', '0', '2022-02-07', '2'),
(125, '0158/E/DI.00.01/2022', '2', '1', '0', '2022-02-10', '2'),
(126, '10/SM/II/2022', '2', '1', '0', '2022-02-10', '2'),
(127, '005/242/Bappeda', '2', '1', '0', '2022-02-14', '2'),
(128, '010/WJC-HRD/RC/II/2022', '2', '1', '0', '2022-02-14', '2'),
(129, '090/PPTJ16/I/2022', '2', '1', '0', '2022-02-14', '2'),
(130, '003/SM/II/2022', '2', '1', '0', '2022-02-14', '2'),
(131, '0725//E1/PP.01.11/2022', '2', '1', '0', '2022-02-16', '2'),
(132, '.../Pan-Pel/STW/TF/02/2022', '2', '1', '0', '2022-02-25', '2'),
(133, '04/BW-KTH/II/2022', '2', '1', '0', '2022-02-25', '2'),
(134, '009/BUB-LPPFI/II/2022', '2', '1', '0', '2022-02-25', '2'),
(135, '004/IFest/HIMAFORKA/II/2022', '2', '1', '0', '2022-03-08', '2'),
(136, '009/SPN/BAAK/III/2022', '2', '1', '0', '2022-03-10', '2'),
(137, 'B-759/Un.10.8/D/DA.04.09/03/2022', '2', '1', '0', '2022-03-14', '2'),
(138, 'SK029/III/BEDO-2022', '2', '1', '0', '2022-03-17', '2'),
(139, '0427/LL8/PR.00.01/2022', '2', '1', '0', '2022-03-17', '2'),
(140, '1355/E3.1/PM.00.03/2022', '2', '1', '0', '2022-03-17', '2'),
(141, '1168/E2/KM.09.00/2022', '2', '1', '0', '2022-03-22', '2'),
(142, 'AOI/10/VEN/2022', '2', '1', '0', '2022-03-25', '2'),
(143, '038/BEM-FEB/II-SKj/III/2022', '2', '1', '0', '2022-04-01', '2'),
(144, 'B.24.005/4788/IKP/D.KOMINFOS', '2', '1', '0', '2022-04-01', '2'),
(145, '2022.AG-02-023', '2', '1', '0', '2022-04-01', '2'),
(146, '004/SM/2022', '2', '1', '0', '2022-04-01', '2'),
(147, 'B.24.005/5028/SEKRET/D.KOMINFOS', '2', '1', '0', '2022-04-06', '2'),
(148, '005 KFB/IV/2022', '2', '1', '0', '2022-04-06', '2'),
(149, '001/Panpel-Lomba Karaoke/UKM Padus/UHN IGBS Dps/04/2022', '2', '1', '0', '2022-04-07', '2'),
(150, '2415/SPP/SVM/III/2022', '2', '1', '0', '2022-04-07', '2'),
(151, '09/UN48.22/UPT-PKKM/2022', '2', '1', '0', '2022-04-11', '2'),
(152, '343/DJAI.5/AI.03.02/04/2022', '2', '1', '0', '2022-04-11', '2'),
(153, '1775/E2/KM.12/2022', '2', '1', '0', '2022-04-18', '2'),
(154, '011/SPN/BAAK/IV/2022', '2', '1', '0', '2022-04-18', '2'),
(155, '015/SPN/BAAK/IV/2022', '2', '1', '0', '2022-04-18', '2'),
(156, '001/SPM/IV/2022', '2', '1', '0', '2022-04-18', '2'),
(157, '007/B/PPKAB-XI/III/2022', '2', '1', '0', '2022-04-18', '2'),
(158, 'B/497/BPSDMI/BDI-Denpasar/IV/2022', '2', '1', '0', '2022-04-21', '2'),
(159, 'B/1275/IV/LIT.6.1./2022/Polresta Denpasar', '2', '1', '0', '2022-04-21', '2'),
(160, '0697/LL8/KM.12/2022', '2', '1', '0', '2022-04-26', '2'),
(161, '014/IAI-JTM/KRAIX/IV/2022', '2', '1', '0', '2022-05-09', '2'),
(162, '086/NTSC2022/IV/IPBI', '2', '1', '0', '2022-05-09', '2'),
(163, '022/SPN/BAAK/IV/2022', '2', '1', '0', '2022-05-09', '2'),
(164, '035/MK.01/GP-331/IV/2022', '2', '1', '0', '2022-05-09', '2'),
(165, '001/SM/MEI/2022', '2', '1', '0', '2022-05-10', '2'),
(166, '0742/LL8/WA.01.04/2022', '2', '1', '0', '2022-05-10', '2'),
(167, '2119/E2/BS.01.01/2022', '2', '1', '0', '2022-05-17', '2'),
(168, '017/SM/2022', '2', '1', '0', '2022-05-17', '2'),
(169, '03/KKT/V.11/2022', '2', '1', '0', '2022-05-18', '2'),
(170, '016/SPP/JCI-BD/OUT/V/2022', '2', '1', '0', '2022-05-18', '2'),
(171, '18/SM/V/2022', '2', '1', '0', '2022-05-18', '2'),
(172, 'BAL/ADM/551/10/2019', '2', '1', '0', '2022-05-20', '2'),
(173, '021/B/ADS/UNAIR/IV/2022', '2', '1', '0', '2022-05-20', '2'),
(174, '81.B/03/DPR/UKIM_Unesa/V/2022', '2', '1', '0', '2022-05-20', '2'),
(175, '024/SM/V/2022', '2', '1', '0', '2022-05-24', '2'),
(176, '124/SM/V/2022', '2', '1', '0', '2022-05-24', '2'),
(177, 'B-1097/DIR/UMS/2022', '2', '1', '0', '2022-05-24', '2'),
(178, '0704/LL8/TU.00.01/2022', '2', '1', '0', '2022-05-25', '2'),
(179, '005/413/KS', '2', '1', '0', '2022-05-27', '2'),
(180, '005/319/Kec.Denut', '2', '1', '0', '2022-05-27', '2'),
(181, '10/V/DG-AP/DPS/2022', '2', '1', '0', '2022-05-27', '2'),
(182, 'B-PM.01.02.17A.17A4.04.22.474', '2', '1', '0', '2022-05-27', '2'),
(183, '0876/LL8/KM.12/2022', '2', '1', '0', '2022-05-30', '2'),
(184, '2422/E2.1/DI.00.01/2022', '2', '1', '0', '2022-05-30', '2'),
(185, 'E.069/HB/SP/05/2022', '2', '1', '0', '2022-05-30', '2'),
(186, '002/PMS/DPS/V/2022', '2', '1', '0', '2022-05-30', '2'),
(187, '2500/E2/PB.04.01/2022', '2', '1', '0', '2022-05-30', '2'),
(188, '026/Panpel-JBUNMASDPS/V/2022', '2', '1', '0', '2022-05-31', '2'),
(189, '037/BEN/V/2022', '2', '1', '0', '2022-06-06', '2'),
(190, '011/HIMAPRODI.SK/BEM.ITBSTIKOM/V/2022', '2', '1', '0', '2022-06-06', '2'),
(191, '2541/E2/PB.03.00/2022 ', '2', '1', '0', '2022-06-06', '2'),
(192, '001/SM/VI/2022', '2', '1', '0', '2022-06-06', '2'),
(193, '517.1 / 916 / DISKOPUKMP', '2', '1', '0', '2022-06-13', '2'),
(194, '013/SM/VI/2022', '2', '1', '0', '2022-06-13', '2'),
(195, 'No. BAL/SVCC/322/5/22', '2', '1', '0', '2022-06-13', '2'),
(196, '002/Panitia-AnalgesiaSports/VI/2022', '2', '1', '0', '2022-06-20', '2'),
(197, '002/UKM.Futsal/BEM.ITBSTIKOM/V/2022', '2', '1', '0', '2022-06-20', '2'),
(198, '10/UW/BEM-FH/PanPel-DekanCupX/VI/2022', '2', '1', '0', '2022-06-20', '2'),
(199, 'B.24.046/8890/SANDI/D.KOMINFOS', '2', '1', '0', '2022-06-20', '2'),
(200, '002/SM/VI/2022', '2', '1', '0', '2022-06-27', '2'),
(201, '2022-AG-04-057', '2', '1', '0', '2022-06-27', '2'),
(202, '4/SM/2022', '2', '1', '0', '2022-07-06', '2'),
(203, '001/LH/SPK/VI/2022', '2', '1', '0', '2022-07-06', '2'),
(204, '882/PGRI2Bdg/B.15/2022', '2', '1', '0', '2022-07-06', '2'),
(205, '24/667/Dpr/Srt/B', '2', '1', '0', '2022-07-06', '2'),
(206, '24/698/Dpr/Srt/B', '2', '1', '0', '2022-07-12', '2'),
(207, '2446/UND/SVM/V/2022', '2', '1', '0', '2022-07-12', '2'),
(208, '002/GR/VII-Alibaba Cloud/2022', '2', '1', '0', '2022-07-14', '2'),
(209, 'B/178/UN14.4.B/DL.01/2022', '2', '1', '0', '2022-07-14', '2'),
(210, '086 /K.I/SMK.AF/VII/2022', '2', '1', '0', '2022-07-18', '2'),
(211, '05.03/SAS/VI/2022', '2', '1', '0', '2022-07-22', '2'),
(212, '02/KRT.KP/Non-Ops/VII.2022', '2', '1', '0', '2022-07-22', '2'),
(213, '1307/LL8/KL.02.00/2022', '2', '1', '0', '2022-07-22', '2'),
(214, '001/SM/VII/2022', '2', '1', '0', '2022-07-22', '2'),
(215, '002/SM/VII/2022', '2', '1', '0', '2022-07-22', '2'),
(216, '003/SK/07/2022', '2', '1', '0', '2022-07-27', '2'),
(217, '002/SPPG/VII/22', '2', '1', '0', '2022-07-27', '2'),
(218, '891/PGRI2BDG/U.6/2022', '2', '1', '0', '2022-07-28', '2'),
(219, '003/SM/VII/2022', '2', '1', '0', '2022-07-28', '2'),
(220, '031/BUB-LP2SDM/VII/2022', '2', '1', '0', '2022-07-28', '2'),
(221, 'T.44.003/22355/RT/B.UMPRO', '2', '1', '0', '2022-08-02', '2'),
(222, '003/SPPG/VII/22', '2', '1', '0', '2022-08-02', '2'),
(223, '127/BEM.STISPOL-WB/VIII/2022', '2', '1', '0', '2022-08-05', '2'),
(224, ' 0347/J7.1/PN.00/2022', '2', '1', '0', '2022-08-05', '2'),
(225, '375/II.3.AU/J/FIKOM/UMM/2022', '2', '1', '0', '2022-08-09', '2'),
(226, '1690/LL8/DT.00.05/2022', '2', '1', '0', '2022-08-09', '2'),
(227, '4733/E2/DT.00.05/2022', '2', '1', '0', '2022-08-09', '2'),
(228, 'EDUFAIR/003/XII/2022', '2', '1', '0', '2022-08-09', '2'),
(229, '421.3/13.094/SMAN2/VIII/2022', '2', '1', '0', '2022-08-10', '2'),
(230, ' 008/PANPEL-INVENTION/HIMAKOM/V/2022', '2', '1', '0', '2022-08-10', '2'),
(231, '004/SPPG/VIII/22', '2', '1', '0', '2022-08-10', '2'),
(232, '001/SU/VIII/22', '2', '1', '0', '2022-08-11', '2'),
(233, '1772/LL8/DT.00.00/2022', '2', '1', '0', '2022-08-11', '2'),
(234, 'B.24.045/11778/IKP/D.KOMINFOS', '2', '1', '0', '2022-08-13', '2'),
(235, '13/SM/VIII/2022', '2', '1', '0', '2022-08-13', '2'),
(236, '1795/LL8/DT.00.00/2022', '2', '1', '0', '2022-08-13', '2'),
(237, '1804/LL8/TU.02.03/2022', '2', '1', '0', '2022-08-13', '2'),
(238, '1808/LL8/HM.00.08/2022', '2', '1', '0', '2022-08-13', '2'),
(239, 'S-115/KR.08/2022', '2', '1', '0', '2022-08-18', '2'),
(240, '08.017/PL8.HMJ/PAN-PNBITC/2022', '2', '1', '0', '2022-08-18', '2'),
(241, '1842/LL8/WS.01.07/2022', '2', '1', '0', '2022-08-18', '2'),
(242, '1819/LL8/KM.01.02/2022', '2', '1', '0', '2022-08-18', '2'),
(243, ' 0789/E5.5/AL.04/2022', '2', '1', '0', '2022-08-23', '2'),
(244, '1744/UN48.16/PM/2022', '2', '1', '0', '2022-08-23', '2'),
(245, '1480/UN1/KM.UGM/Set.KM/PK.01.05/2022', '2', '1', '0', '2022-08-23', '2'),
(246, '1207/Wil-XI/0822', '2', '1', '0', '2022-08-24', '2'),
(247, '001/SM/VIII/2022', '2', '1', '0', '2022-08-25', '2'),
(248, '10843.75/K.STIKESWIKA/LL/VIII/2022', '2', '1', '0', '2022-08-29', '2'),
(249, 'B 958/IKMA.2/IND/VIII/2022', '2', '1', '0', '2022-08-29', '2'),
(250, '1985/LL8/LP.00.01/2022', '2', '1', '0', '2022-08-31', '2'),
(251, ' 5391/E2/DT.01.01/2022 ', '2', '1', '0', '2022-08-31', '2'),
(252, '017/E/ICCN/VIII/2022', '2', '1', '0', '2022-08-31', '2'),
(253, '003/SM/VIII/2022', '2', '1', '0', '2022-08-31', '2'),
(254, '2070/LL8/KM.00/2022', '2', '1', '0', '2022-09-01', '2'),
(255, '2123/LL8/HM.00.03/2022', '2', '1', '0', '2022-09-02', '2'),
(256, '08.018/PL8.UKM/PAN-INTECHFEST/2022', '2', '1', '0', '2022-09-05', '2'),
(257, '422.1/0895/SMAN.1-DPS/Disdik Prov.Bali', '2', '1', '0', '2022-09-05', '2'),
(258, '3143/JBM/IX/2022', '2', '1', '0', '2022-09-07', '2'),
(259, 'B.24.005/13133/SANDI/D.KOMINFOS', '2', '1', '0', '2022-09-09', '2'),
(260, 'B.420.003.3/1518/SMAN2.NGR/Disdikpora', '2', '1', '0', '2022-09-13', '2'),
(261, '2406/LL8/HM.01.00/2022 ', '2', '1', '0', '2022-09-13', '2'),
(262, '064/N00100/2022-S9', '2', '1', '0', '2022-09-14', '2'),
(263, 'YCPW/2022/09/12/ARW/01', '2', '1', '0', '2022-09-14', '2'),
(264, '05/KTDB/TTR/VIII/2022', '2', '1', '0', '2022-09-19', '2'),
(265, 'B.24.046/13326/SANDI/D.KOMINFOS', '2', '1', '0', '2022-09-19', '2'),
(266, 'B.31.880/5625/SMKN1 DPS/Dikpora', '2', '1', '0', '2022-09-19', '2'),
(267, '3500/E4/DT.04.03/2022', '2', '1', '0', '2022-09-21', '2'),
(268, 'EDUFAIR/004/VIII/2022', '2', '1', '0', '2022-09-21', '2'),
(269, 'EDUFAIR/005/XII/2022', '2', '1', '0', '2022-09-21', '2'),
(270, 'UM.008/2416/PTP-II/KEMPAR/2022', '2', '1', '0', '2022-09-22', '2'),
(271, ' I-029/DPW-Bali/IX/2022', '2', '1', '0', '2022-09-23', '2'),
(272, '06/KEM/09/2022', '2', '1', '0', '2022-09-23', '2'),
(273, 'B.21.660/4324/SEKRET/DKLH', '2', '1', '0', '2022-09-23', '2'),
(274, '24/B/TON/IX/2022', '2', '1', '0', '2022-09-23', '2'),
(275, '4221/E1/Hk.01.01/2022', '2', '1', '0', '2022-09-26', '2'),
(276, '2683/LL8/KM/2022', '2', '1', '0', '2022-09-26', '2'),
(277, '2684/LL8/KM/2022', '2', '1', '0', '2022-09-27', '2'),
(278, 'UM.04.01/1411/PTP.IV/KEMENPAREKRAF/2022', '2', '1', '0', '2022-09-27', '2'),
(279, '042-09/PC-AS/BC/PKS/IX/2022', '2', '1', '0', '2022-09-27', '2'),
(280, '0876/E5/KB.09.00/2022', '2', '1', '0', '2022-09-28', '2'),
(281, 'B/164/UN14.7.K/DL.17./2022', '2', '1', '0', '2022-09-28', '2'),
(282, '001/SM/IX/2022', '2', '1', '0', '2022-09-28', '2'),
(283, '024/HIMAPRODI-M/II-SPP/IX/2022', '2', '1', '0', '2022-10-03', '2'),
(284, 'B.20.556.00/4883/DEKON/DISPAR', '2', '1', '0', '2022-10-03', '2'),
(285, '075/IX/CST/EDU/2022', '2', '1', '0', '2022-10-03', '2'),
(286, '613/APTISI Wil. VII/09/2022', '2', '1', '0', '2022-10-07', '2'),
(287, '018/UKM.PROGRESS/BEM.ITBSTIKOM/IX/2022', '2', '1', '0', '2022-10-11', '2'),
(288, '217/II-4/FEB/X/2022', '2', '1', '0', '2022-10-11', '2'),
(289, ' EDUFAIR/064/XII/2022', '2', '1', '0', '2022-10-11', '2'),
(290, '2977/LL8/HM.03.01/2022', '2', '1', '0', '2022-10-12', '2'),
(291, '027/02/SMAN 1 PETANG', '2', '1', '0', '2022-10-12', '2'),
(292, 'BAL/122/09/2022', '2', '1', '0', '2022-10-12', '2'),
(293, '12/BAL/122/09/2022', '2', '1', '0', '2022-10-12', '2'),
(294, '201/SMASK/DP.19/2022', '2', '1', '0', '2022-10-12', '2'),
(295, 'BAL/122/09/2022', '2', '1', '0', '2022-10-12', '2'),
(296, '598/LA/23730/2022', '2', '1', '0', '2022-10-14', '2'),
(297, '01/SM/X/2022', '2', '1', '0', '2022-10-14', '2'),
(298, 'B-2048/DJAI.5/AI.03.04/10/2022', '2', '1', '0', '2022-10-14', '2'),
(299, '025/HIMAPRODI-M/II-SPP/IX/', '2', '1', '0', '2022-10-18', '2'),
(300, '028/SPN/BAAK/IX/2022', '2', '1', '0', '2022-10-18', '2'),
(301, '3163/LL8/KM/2022', '2', '1', '0', '2022-10-18', '2'),
(302, '063/SU/02/CAST/X/2022', '2', '1', '0', '2022-10-18', '2'),
(303, '019/UKM.PROGRESS/BEM.ITBSTIKOM/IX?2022', '2', '1', '0', '2022-10-21', '2'),
(304, '02/1045-3/18041', '2', '1', '0', '2022-10-21', '2'),
(305, '02/SM/V/2022', '2', '1', '0', '2022-10-25', '2'),
(306, '03.142/KBS/X/2022', '2', '1', '0', '2022-10-25', '2'),
(307, '451/PERMOHONAN/BM-HOKI/DPS/IX/2022', '2', '1', '0', '2022-10-25', '2'),
(308, '01/SM/XI/2022', '2', '1', '0', '2022-11-02', '2'),
(309, '2311-2337/UN.8.11/PP/2022', '2', '1', '0', '2022-11-02', '2'),
(310, '010/HIPMI-PT-UNMAS/UNMAS-DPS/X/2022', '2', '1', '0', '2022-11-02', '2'),
(311, '160/IDBBALI/KMH/X/2022', '2', '1', '0', '2022-11-02', '2'),
(312, '421.3/0788/SMAN 5 Dps/Disdikpora Prov.Bali/2022', '2', '1', '0', '2022-11-02', '2'),
(313, '002/SM/XII/2022', '2', '1', '0', '2022-11-02', '2'),
(314, '069/SPKS-ZB/HRD/2022', '2', '1', '0', '2022-11-02', '2'),
(315, '003/SM/XI/2022', '2', '1', '0', '2022-11-02', '2'),
(316, '001/SM/XI/2022', '2', '1', '0', '2022-11-07', '2'),
(317, '3533/LL8/TU.02.03/2022', '2', '1', '0', '2022-11-09', '2'),
(318, '002/SM/XI/2022', '2', '1', '0', '2022-11-09', '2'),
(319, 'B-1033 /BPSDMP.34/LT.02.02/11/2022', '2', '1', '0', '2022-11-09', '2'),
(320, 'S-746/WPJ.17/2022', '2', '1', '0', '2022-11-10', '2'),
(321, '0038/SP/AP-DPS/KC/II/XI/2022', '2', '1', '0', '2022-11-10', '2'),
(322, '7060/E2/DT.00.00/2022', '2', '1', '0', '2022-11-10', '2'),
(323, 'B/KWU.6/S.95/D.IV.M.EKON.1/11/2022', '2', '1', '0', '2022-11-11', '2'),
(324, '254/A.4/2022', '2', '1', '0', '2022-11-11', '2'),
(325, 'B.31.421.3/5248/SMA N 1 KUTA UTARA/DIKPORA', '2', '1', '0', '2022-11-11', '2'),
(326, '004/SM/XI/2022', '2', '1', '0', '2022-11-11', '2'),
(327, '005/SM/XI/2022', '2', '1', '0', '2022-11-11', '2'),
(328, '3600/LL8/KM/2022 ', '2', '1', '0', '2022-11-15', '2'),
(329, 'B.17.005/10070/Bid.I/BRIDA', '2', '1', '0', '2022-11-15', '2'),
(330, 'B/1272/BPSDMI/BDI-Denpasar/DL/XI/2022', '2', '1', '0', '2022-11-15', '2'),
(331, 'B/1263/BPSDMI/BDI-Denpasar/HM/XI/2022', '2', '1', '0', '2022-11-15', '2'),
(332, '006/SM/XI/2022', '2', '1', '0', '2022-11-15', '2'),
(333, 'B.031.005/2890/SMAN 1 PETANG/DIKPORA', '2', '1', '0', '2022-11-28', '2'),
(334, '0081/SD-Santosa/XI/2022', '2', '1', '0', '2022-12-05', '2'),
(335, '001/SM/XII/2022', '2', '1', '0', '2022-12-05', '2'),
(336, '4402/LL8/KM/2022 ', '2', '1', '0', '2022-12-05', '2'),
(337, ' 4439/LL8/KM.00/2022', '2', '1', '0', '2022-12-06', '2'),
(338, '003/SM/XII/2022', '2', '1', '0', '2022-12-08', '2'),
(339, '03.152/KBS/XII/2022', '2', '1', '0', '2022-12-08', '2'),
(340, '4118/LL8/KS.01.00/2022 ', '2', '1', '0', '2022-12-08', '2'),
(341, '5094/KIII.4/C.5/XII/2022', '2', '1', '0', '2022-12-14', '2'),
(342, 'B.31.003.3/58.40/SMKN 1 BGL/DIKPORA', '2', '1', '0', '2022-12-14', '2'),
(343, '016 / SRB / SK / XII / 2022', '2', '1', '0', '2022-12-16', '2'),
(344, '004/SM/XII/2022', '2', '1', '0', '2022-12-16', '2'),
(345, '83/XII/FORKOM-OSIS/Dps/2022', '2', '1', '0', '2022-12-20', '2'),
(346, '457/EX-SALES/OFA/XI/2022', '2', '1', '0', '2022-12-20', '2'),
(347, '002/INSTIKI.HIMA-TI/SPm.03/12/2022', '2', '1', '0', '2023-01-06', '2'),
(348, '065/SU/AP-D/UKMKWU/XIs/2022', '2', '1', '0', '2023-01-12', '2'),
(349, '0358/LL8/KM/2023', '2', '1', '0', '2023-01-26', '2'),
(350, '0408/LL8/KS.01.00/2023 ', '2', '1', '0', '2023-01-31', '2'),
(351, 'B.20.556 /680/PKSDM/DISPAR', '2', '1', '0', '2023-02-06', '2'),
(352, '001/SM/II/2023', '2', '1', '0', '2023-02-06', '2'),
(353, '03/BbH/II/2023', '2', '1', '0', '2023-02-06', '2'),
(354, 'B/489/UN34/KM.05.03/2023', '2', '1', '0', '2023-02-08', '2'),
(355, '3022/UND/SVM/II/2023', '2', '1', '0', '2023-02-08', '2'),
(356, '034/Panpel-SEF/BEMFEB-UNMAS/I/2023', '2', '1', '0', '2023-02-08', '2'),
(357, 'B.17.074/927/Bid.I/BRIDA', '2', '1', '0', '2023-02-14', '2'),
(358, 'B.32.027/429/UPTD. RUMAH KREATIF/DISPERINDAG', '2', '1', '0', '2023-02-14', '2'),
(359, '002/SM/II/2023', '2', '1', '0', '2023-02-14', '2'),
(360, '108/A/Panpel-ELCCO/HME/FT-UNUD/I/2023', '2', '1', '0', '2023-02-17', '2'),
(361, '01.003/PL8.HMJ/PAN-NAC/2023', '2', '1', '0', '2023-02-17', '2'),
(362, '003/SM/II/2023', '2', '1', '0', '2023-02-23', '2'),
(363, '0639/LL8/HK.12.01/2023', '2', '1', '0', '2023-02-23', '2'),
(364, '0630/LL8/KM/2023', '2', '1', '0', '2023-02-23', '2'),
(365, '0629/LL8/KM/2023', '2', '1', '0', '2023-02-23', '2'),
(366, '004/SM/II/2023', '2', '1', '0', '2023-02-23', '2'),
(367, '001/COMVET-TCL/SLO/II/2023', '2', '1', '0', '2023-02-24', '2'),
(368, '005/SM/II/2023', '2', '1', '0', '2023-02-24', '2'),
(369, '006/SM/II/2023', '2', '1', '0', '2023-02-24', '2'),
(370, '001/SM/III/2023', '2', '1', '0', '2023-03-01', '2'),
(371, '0727/LL8/KP.08.00/2023', '2', '1', '0', '2023-03-06', '2'),
(372, '005/IRDH/II/2023', '2', '1', '0', '2023-03-06', '2'),
(373, '002/SM/III/2023', '2', '1', '0', '2023-03-07', '2'),
(374, '003/SM/III/2023', '2', '1', '0', '2023-03-07', '2'),
(375, 'B.17.880/1812/Bid.I/BRIDA', '2', '1', '0', '2023-03-08', '2'),
(376, '895.3/2356/SETDA/BALITBANG', '2', '1', '0', '2023-03-08', '2'),
(377, 'B/UND/492/UM.00.01/D.3.3/2023', '2', '1', '0', '2023-03-09', '2'),
(378, '0682/SDM/PBK/2023', '2', '1', '0', '2023-03-09', '2'),
(379, 'W.20.UM.01.01-1906', '2', '1', '0', '2023-03-09', '2'),
(380, '005 / 296 /DKIS', '2', '1', '0', '2023-03-13', '2'),
(381, '004/SM/III/2023', '2', '1', '0', '2023-03-13', '2'),
(382, 'BAL/453/4/2023', '2', '1', '0', '2023-03-13', '2'),
(383, 'B/347/UN14.2.5/DL.17/2023', '2', '1', '0', '2023-03-15', '2'),
(384, '0988/LL8/KM/2023', '2', '1', '0', '2023-03-15', '2'),
(385, '0921/LL8/KS.07.00/2023', '2', '1', '0', '2023-03-15', '2'),
(386, '005/SM/III/2023', '2', '1', '0', '2023-03-15', '2'),
(387, '0495/J7.1/PN.00/2023', '2', '1', '0', '2023-03-20', '2'),
(388, '006/SM/III/2023', '2', '1', '0', '2023-03-20', '2'),
(389, '005 /361/DKIS', '2', '1', '0', '2023-03-20', '2'),
(390, '1128/E2/DT.01.02/2023', '2', '1', '0', '2023-03-28', '2'),
(391, 'S-93/KR.0801/2023', '2', '1', '0', '2023-03-28', '2'),
(392, '1175/LL8/KS.03.00/2023', '2', '1', '0', '2023-04-03', '2'),
(393, 'B/UND/605/PK.01.06/PTP.2/PTP.2.B/2023', '2', '1', '0', '2023-04-03', '2'),
(394, '0105/HIMA-SK/SU.02/03/2023', '2', '1', '0', '2023-04-03', '2'),
(395, '1193/LL8/KM/2023', '2', '1', '0', '2023-04-04', '2'),
(396, 'B-039/05300/VS.330/01/2023', '2', '1', '0', '2023-04-04', '2'),
(397, 'B.31.891.3/1419/SMKN 1 MANGGIS/DIKPORA', '2', '1', '0', '2023-04-04', '2'),
(398, 'B.31.880/3214/SMKN1DPS/DIKPORA', '2', '1', '0', '2023-04-10', '2'),
(399, '001/SM/IV/2023', '2', '1', '0', '2023-04-10', '2'),
(400, '002/SM/IV/2023', '2', '1', '0', '2023-04-10', '2'),
(401, '1294/LL8/KM.01.02/2023', '2', '1', '0', '2023-04-10', '2'),
(402, 'B.17.005/2772/BID.I/BRIDA', '2', '1', '0', '2023-04-10', '2'),
(403, '682/IT1.B07.2/TA.02/2023', '2', '1', '0', '2023-04-12', '2'),
(404, '787/XI-01/0423', '2', '1', '0', '2023-04-12', '2'),
(405, '0117/HRGS Corp/Doc/PTBCE/III/2023', '2', '1', '0', '2023-04-12', '2'),
(406, '003/SM/IV/2023', '2', '1', '0', '2023-04-12', '2'),
(407, '036/BEM-FEB/II-SPP/IV/2023', '2', '1', '0', '2023-04-17', '2'),
(408, '1542/LL8/DT.02.04/2023', '2', '1', '0', '2023-04-18', '2'),
(409, '027/266/KPID', '2', '1', '0', '2023-05-04', '2'),
(410, '001/SM/V/2023', '2', '1', '0', '2023-05-04', '2'),
(411, '1754/LL8/HM.00.03/2023', '2', '1', '0', '2023-05-10', '2'),
(412, 'HKI.5-HH.04.02-623', '2', '1', '0', '2023-05-10', '2'),
(413, '002/SM/V/2023', '2', '1', '0', '2023-05-10', '2'),
(414, '800/506/101.6.10.15/2023', '2', '1', '0', '2023-05-15', '2'),
(415, '070/28/Balitbang', '2', '1', '0', '2023-05-15', '2'),
(416, '003/SM/V/2023', '2', '1', '0', '2023-05-15', '2'),
(417, '25/554/Dpr/Srt/B', '2', '1', '0', '2023-05-16', '2'),
(418, 'B.24.005/9537/IKP/D.KOMINFOS', '2', '1', '0', '2023-05-16', '2'),
(419, '005/414/Pem-Kec.Denut ', '2', '1', '0', '2023-05-16', '2'),
(420, '038/BAPOMI-BALI/V/2023', '2', '1', '0', '2023-05-16', '2'),
(421, 'B.24.005/9608/IAI/D.KOMINFOS', '2', '1', '0', '2023-05-19', '2'),
(422, '0038/NEX-IDN/MAY/2023', '2', '1', '0', '2023-05-19', '2'),
(423, '2000/LL8/KS.03.00/2023', '2', '1', '0', '2023-05-19', '2'),
(424, '024/E/ICCN/V/2023', '2', '1', '0', '2023-05-23', '2'),
(425, '068/UBR.FTK/PP/2023', '2', '1', '0', '2023-05-23', '2'),
(426, '241/U.7/SMKPCN/V/2023', '2', '1', '0', '2023-05-23', '2'),
(427, 'B.31.422/645/SMAN 1 Baturiti/Dikpora', '2', '1', '0', '2023-05-23', '2'),
(428, '25/637/Dpr/Srt/B', '2', '1', '0', '2023-05-31', '2'),
(429, 'S-453/UIGM/PPM/2023', '2', '1', '0', '2023-05-31', '2'),
(430, '007/BEB/V/2023', '2', '1', '0', '2023-05-31', '2'),
(431, '2687/LL8/KS.01.00/2023', '2', '1', '0', '2023-06-13', '2'),
(432, '2458/LL8/KS.01.00/2023', '2', '1', '0', '2023-06-13', '2'),
(433, '2126/LL8/KL.01.00/2023', '2', '1', '0', '2023-06-13', '2'),
(434, '15/UW/BEM-FH/PanPel-DekanCupXI/V/2023', '2', '1', '0', '2023-06-13', '2'),
(435, '14/UW/BEM-FH/PanPel-DekanCupXI/V/2023', '2', '1', '0', '2023-06-13', '2'),
(436, 'BAL/455/4/2023 ', '2', '1', '0', '2023-06-13', '2'),
(437, 'B.17.005/4346/Bid.I/BRIDA', '2', '1', '0', '2023-06-13', '2'),
(438, '2583/LL8/HK.08/2023 ', '2', '1', '0', '2023-06-13', '2'),
(439, '87', '2', '1', '0', '2023-06-20', 'maha');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_tujuansurat`
--

CREATE TABLE `sip_tujuansurat` (
  `kodeTujuan` int(11) NOT NULL,
  `kodeBidang` int(11) NOT NULL,
  `noSurat` varchar(50) NOT NULL,
  `tglInput` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `tglStatus` date NOT NULL,
  `userStatus` char(18) NOT NULL,
  `userInput` char(18) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sip_user`
--

CREATE TABLE `sip_user` (
  `nip` char(18) NOT NULL,
  `kodeBidang` int(11) NOT NULL,
  `golongan` char(2) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sip_user`
--

INSERT INTO `sip_user` (`nip`, `kodeBidang`, `golongan`, `nama`, `password`) VALUES
('2', 2, 'b', 'Kesekretariatan', 'd41d8cd98f00b204e9800998ecf8427e'),
('1', 1, 'b', 'Ketua', 'd41d8cd98f00b204e9800998ecf8427e'),
('Pusat Inovasi', 33, 'b', 'Pusat Inovasi', 'de601fb1aa18301af3f5745e4bef4eb8'),
('Waka III', 29, 'b', 'Waka III - Kemahasiswaan, Pusat Karir & Kerjasama', '7f9d188d07ecdc3531f37cf0c82932b3'),
('Waka I', 26, 'b', 'Waka I - Akademik', '3cd5e6d1f48fa595026888c60409e474'),
('Waka II', 22, 'b', 'Waka II - Keuangan & Sumber Daya', 'aefe5defcf49c162b75f266bf8e1c922'),
('SDM', 22, 'b', 'SDM & RT', 'd41d8cd98f00b204e9800998ecf8427e'),
('PPM', 37, 'b', 'Pusat Penjaminan Mutu', '557ad72e3e26c8744dcf31ffdc88c9ea'),
('Marketing', 38, 'b', 'Marketing & Humas', 'b81a475dc85bfcaa4e47bdb0bb7e18cc'),
('Prodi Sistem Infor', 16, 'b', 'Program Studi Sistem Informasi', '94386e8fdf6c1e9dfe553de78aa26d8d'),
('Prodi TI', 23, 'b', 'Program Studi Teknik Informatika', '12c9c81f7d3d3ed61cc07ee570e68719'),
('Prodi SIA', 18, 'b', 'Program Studi Sistem Informasi Akuntansi', '86072eae82c180fe402f82ee8df7ece1'),
('BAAK', 19, 'b', 'Bagian Administrasi Akademik & Kemahasiswaan', 'e38cdc3dfdccd5218c1f7e0afb79e1a7'),
('PPTI', 24, 'b', 'Pusat Pengembangan Teknologi Informasi', '3eb8c105c0cb49a6f845ed56bc595519'),
('Perpus', 25, 'b', 'Perpustakaan', 'a93c9c75a3f5d5b542536033bdb887a4'),
('Accounting', 27, 'b', 'Keuangan, Akunting & Pengadaan', '53f30e46c57e75bcb800e3e9101ac305'),
('UPT', 28, 'b', 'Unit Pelaksana Teknis', '2bc241794d844c273132bebbb30413b6'),
('Kemahasiswaan', 30, 'b', 'Kemahasiswaan', '10e97cda9f5473789086c19e859a3280'),
('PKA', 31, 'b', 'Pusat Karir & Alumni', 'f3915557bd41752dd166c220860b8729'),
('KUIK', 32, 'b', 'Kantor Urusan Internasional dan Kemitraan', 'ece6abd982bafc567ea876843d4ab109'),
('LPPM', 0, '', 'LPPM', '73510511d736efbbf306ba747c363cdf'),
('Inbis', 0, '', 'Inkubator Bisnis', '3c037cb03ed1070ebb75a4a1082cb396'),
('HKI', 36, 'b', 'Sentra HKI & Komersialisasi', 'b225565efef647030b94c44ac9027df0'),
('Prodi SI', 16, 'b', 'Prodi SI', '94386e8fdf6c1e9dfe553de78aa26d8d'),
('maha', 2, 'b', 'ardi', '1bbd886460827015e5d605ed44252251'),
('sdm2', 16, 'b', 'sdm', '1bbd886460827015e5d605ed44252251');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `sip_berkas`
--
ALTER TABLE `sip_berkas`
  ADD PRIMARY KEY (`kodeBerkas`);

--
-- Indeks untuk tabel `sip_bidang`
--
ALTER TABLE `sip_bidang`
  ADD PRIMARY KEY (`kodeBidang`);

--
-- Indeks untuk tabel `sip_box`
--
ALTER TABLE `sip_box`
  ADD PRIMARY KEY (`kodeBox`);

--
-- Indeks untuk tabel `sip_dataarsip`
--
ALTER TABLE `sip_dataarsip`
  ADD PRIMARY KEY (`kodeArsip`);

--
-- Indeks untuk tabel `sip_disposisisurat`
--
ALTER TABLE `sip_disposisisurat`
  ADD PRIMARY KEY (`kodeDisposisi`);

--
-- Indeks untuk tabel `sip_filearsip`
--
ALTER TABLE `sip_filearsip`
  ADD PRIMARY KEY (`kodeFile`);

--
-- Indeks untuk tabel `sip_komentar`
--
ALTER TABLE `sip_komentar`
  ADD PRIMARY KEY (`kodeKomentar`);

--
-- Indeks untuk tabel `sip_nosuratkeluar`
--
ALTER TABLE `sip_nosuratkeluar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `atributSurat` (`atributSurat`);

--
-- Indeks untuk tabel `sip_rak`
--
ALTER TABLE `sip_rak`
  ADD PRIMARY KEY (`kodeRak`);

--
-- Indeks untuk tabel `sip_report`
--
ALTER TABLE `sip_report`
  ADD PRIMARY KEY (`kodeReport`);

--
-- Indeks untuk tabel `sip_sie`
--
ALTER TABLE `sip_sie`
  ADD PRIMARY KEY (`kodeSie`);

--
-- Indeks untuk tabel `sip_sub_berkas`
--
ALTER TABLE `sip_sub_berkas`
  ADD PRIMARY KEY (`idsub`);

--
-- Indeks untuk tabel `sip_suratkeluar`
--
ALTER TABLE `sip_suratkeluar`
  ADD PRIMARY KEY (`idSurat`),
  ADD UNIQUE KEY `noSuratKeluar` (`noSuratKeluar`);

--
-- Indeks untuk tabel `sip_suratmasuk`
--
ALTER TABLE `sip_suratmasuk`
  ADD PRIMARY KEY (`idSurat`);

--
-- Indeks untuk tabel `sip_tindaklanjut`
--
ALTER TABLE `sip_tindaklanjut`
  ADD PRIMARY KEY (`kodeTindaklanjut`);

--
-- Indeks untuk tabel `sip_tujuan`
--
ALTER TABLE `sip_tujuan`
  ADD PRIMARY KEY (`idtujuan`);

--
-- Indeks untuk tabel `sip_tujuansurat`
--
ALTER TABLE `sip_tujuansurat`
  ADD PRIMARY KEY (`kodeTujuan`);

--
-- Indeks untuk tabel `sip_user`
--
ALTER TABLE `sip_user`
  ADD PRIMARY KEY (`nip`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `sip_berkas`
--
ALTER TABLE `sip_berkas`
  MODIFY `kodeBerkas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `sip_bidang`
--
ALTER TABLE `sip_bidang`
  MODIFY `kodeBidang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `sip_box`
--
ALTER TABLE `sip_box`
  MODIFY `kodeBox` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `sip_dataarsip`
--
ALTER TABLE `sip_dataarsip`
  MODIFY `kodeArsip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `sip_disposisisurat`
--
ALTER TABLE `sip_disposisisurat`
  MODIFY `kodeDisposisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=536;

--
-- AUTO_INCREMENT untuk tabel `sip_filearsip`
--
ALTER TABLE `sip_filearsip`
  MODIFY `kodeFile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `sip_komentar`
--
ALTER TABLE `sip_komentar`
  MODIFY `kodeKomentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sip_nosuratkeluar`
--
ALTER TABLE `sip_nosuratkeluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `sip_rak`
--
ALTER TABLE `sip_rak`
  MODIFY `kodeRak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sip_report`
--
ALTER TABLE `sip_report`
  MODIFY `kodeReport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT untuk tabel `sip_sie`
--
ALTER TABLE `sip_sie`
  MODIFY `kodeSie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `sip_sub_berkas`
--
ALTER TABLE `sip_sub_berkas`
  MODIFY `idsub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `sip_suratkeluar`
--
ALTER TABLE `sip_suratkeluar`
  MODIFY `idSurat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `sip_suratmasuk`
--
ALTER TABLE `sip_suratmasuk`
  MODIFY `idSurat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=448;

--
-- AUTO_INCREMENT untuk tabel `sip_tindaklanjut`
--
ALTER TABLE `sip_tindaklanjut`
  MODIFY `kodeTindaklanjut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=364;

--
-- AUTO_INCREMENT untuk tabel `sip_tujuan`
--
ALTER TABLE `sip_tujuan`
  MODIFY `idtujuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- AUTO_INCREMENT untuk tabel `sip_tujuansurat`
--
ALTER TABLE `sip_tujuansurat`
  MODIFY `kodeTujuan` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
