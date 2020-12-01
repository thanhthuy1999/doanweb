-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 01, 2020 lúc 03:10 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlncd`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `id_hdct` int(11) NOT NULL,
  `mahd` int(11) DEFAULT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` int(11) NOT NULL,
  `phuongthucthanhtoan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `madm` int(11) NOT NULL,
  `tendm` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dequi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`madm`, `tendm`, `dequi`) VALUES
(111, 'Nồi cơm điện Sharp', 10),
(222, 'Nồi cơm điện Toshiba', 20),
(333, 'Nồi cơm điện Supor', 30),
(444, 'Nồi cơm điện Kangaroo', 40),
(555, 'Nồi cơm điện Tiger', 15),
(666, 'Nồi cơm điện Panasonic', 25),
(777, 'Nồi cơm điện Cuckoo', 35);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `mahd` int(11) NOT NULL,
  `idnd` int(11) NOT NULL,
  `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dienthoai` int(11) NOT NULL,
  `diachi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngaydathang` date NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `idnd` int(11) NOT NULL,
  `tennd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phanquyen` int(11) NOT NULL,
  `ngaysinh` date NOT NULL,
  `ngaydangky` date NOT NULL,
  `gioitinh` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `dienthoai` int(11) NOT NULL,
  `diachi` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`idnd`, `tennd`, `username`, `password`, `phanquyen`, `ngaysinh`, `ngaydangky`, `gioitinh`, `email`, `dienthoai`, `diachi`) VALUES
(1, 'admin', 'admin', '1234567', 0, '2012-02-05', '2020-11-15', 'Nữ', 'yenyenyen@gmail.com', 333443794, 'Đông Anh'),
(27, 'haiyen', 'haiyen', 'fcea920f7412b5da7be0cf42b8c93759', 1, '1999-02-21', '2020-11-20', 'nu', 'yen@gmail.com', 2147483647, 'Hà Nội'),
(29, 'nghaiyen', 'nghaiyen', 'fcea920f7412b5da7be0cf42b8c93759', 1, '2020-11-09', '2020-11-25', 'nu', 'yenyenyen212@gmail.com', 555, 'Ha Noi'),
(32, 'tammao', 'nguyenminhtam', 'e10adc3949ba59abbe56e057f20f883e', 1, '2004-11-11', '2020-11-30', 'nam', 'tam@gmail.com', 943877390, 'so1 namdu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhasanxuat`
--

CREATE TABLE `nhasanxuat` (
  `idnsx` int(20) NOT NULL,
  `tennsx` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dienthoai` int(20) NOT NULL,
  `diachi` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `idsp` int(11) NOT NULL,
  `tensp` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `madm` int(11) NOT NULL,
  `mau` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gia` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `daban` int(11) NOT NULL,
  `ngaycapnhat` date NOT NULL,
  `trangthai` int(11) NOT NULL,
  `hinhanh` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `chitiet` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`id_hdct`),
  ADD KEY `idsp` (`idsp`),
  ADD KEY `mahd` (`mahd`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`madm`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`mahd`),
  ADD KEY `idnd` (`idnd`),
  ADD KEY `idnd_2` (`idnd`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`idnd`),
  ADD UNIQUE KEY `idnd_2` (`idnd`),
  ADD KEY `idnd` (`idnd`);

--
-- Chỉ mục cho bảng `nhasanxuat`
--
ALTER TABLE `nhasanxuat`
  ADD PRIMARY KEY (`idnsx`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`idsp`),
  ADD KEY `madm` (`madm`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  MODIFY `id_hdct` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `madm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=778;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `mahd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `idnd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `idsp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
