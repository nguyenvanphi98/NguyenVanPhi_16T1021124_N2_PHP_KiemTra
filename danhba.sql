-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th10 08, 2019 lúc 05:15 PM
-- Phiên bản máy phục vụ: 5.7.26
-- Phiên bản PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `danhba`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhba`
--

DROP TABLE IF EXISTS `danhba`;
CREATE TABLE IF NOT EXISTS `danhba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `phonenumber` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ac` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhba`
--

INSERT INTO `danhba` (`id`, `name`, `phonenumber`, `email`, `username`) VALUES
(9, 'Phi', '0321151515', 'hmqtpv@gmail.com', 'Nguyen_Phi'),
(10, 'Phi_1', '0393597575', '1@gmail.com', 'Nguyen_Phi'),
(11, 'Phi_2', '0393597578', '2@gmail.com', 'Nguyen_Phi'),
(13, 'Nvp', '03515120', '3@gmail.com', 'Nguyen_Phi'),
(14, 'KhánhIT', '039102041', 'khanhit@gmail.com', 'Nguyen_Phi'),
(15, 'TúIT', '0393597575', 'tu@gmail.com', 'Nguyen_Phi'),
(16, 'XạIT', '241412512512', 'Xa@gmail.com', 'Nguyen_Phi'),
(17, 'Phi7', '0393597575', 'lds@.COM', 'Nguyen_Phi'),
(18, 'Phi_8', '535465465477', '12@gmail.com', 'Nguyen_Phi'),
(19, 'NhânIT', '037975524524', 'nhan@gmail,com', 'Nguyen_Phi'),
(20, 'HuyIT ', '0369357642', 'huy@gmail.com', 'Nguyen_Phi'),
(21, 'ThảoIT', '012535624', 'thao@gmail,com ', 'Nguyen_Phi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `label`
--

DROP TABLE IF EXISTS `label`;
CREATE TABLE IF NOT EXISTS `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `labelname` text COLLATE utf8_unicode_ci,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `label`
--

INSERT INTO `label` (`id`, `labelname`, `username`) VALUES
(11, 'Nguyễn Văn Phi', 'Nguyen_Phi'),
(12, 'Năm Sinh', 'Nguyen_Phi'),
(13, 'Quê quán', 'Nguyen_Phi'),
(14, 'Học cùng trường', 'Nguyen_Phi'),
(15, 'Cá biệt', 'Nguyen_Phi'),
(16, 'IT', 'Nguyen_Phi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `label_danhba`
--

DROP TABLE IF EXISTS `label_danhba`;
CREATE TABLE IF NOT EXISTS `label_danhba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `danhba_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `labledanhba_danhba` (`danhba_id`),
  KEY `labledanhba_lable` (`label_id`),
  KEY `ca` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `label_danhba`
--

INSERT INTO `label_danhba` (`id`, `danhba_id`, `username`, `label_id`) VALUES
(17, 9, 'Nguyen_Phi', 11),
(18, 10, 'Nguyen_Phi', 12),
(19, 13, 'Nguyen_Phi', 15),
(20, 14, 'Nguyen_Phi', 16),
(21, 10, 'Nguyen_Phi', 12),
(22, 18, 'Nguyen_Phi', 16);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('Nguyen_Phi', '12345');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `danhba`
--
ALTER TABLE `danhba`
  ADD CONSTRAINT `ac` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `label`
--
ALTER TABLE `label`
  ADD CONSTRAINT `label_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `label_danhba`
--
ALTER TABLE `label_danhba`
  ADD CONSTRAINT `ca` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `labledanhba_danhba` FOREIGN KEY (`danhba_id`) REFERENCES `danhba` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `labledanhba_lable` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
