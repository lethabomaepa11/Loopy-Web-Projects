-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2024 at 11:40 AM
-- Server version: 5.6.38
-- PHP Version: 8.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Bankyio`
--
CREATE DATABASE IF NOT EXISTS `Bankyio` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Bankyio`;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

CREATE TABLE `beneficiaries` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `beneficiary_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lottery`
--

CREATE TABLE `lottery` (
  `id` int(11) NOT NULL,
  `balance` int(20) NOT NULL DEFAULT '0',
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lottery`
--

INSERT INTO `lottery` (`id`, `balance`, `user_id`) VALUES
(1, 70, '657fa9bb54bce'),
(2, 163, '65802e7a99774'),
(3, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL,
  `stock_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `price` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_order`
--

CREATE TABLE `stock_order` (
  `id` int(11) NOT NULL,
  `stock_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `open` varchar(255) NOT NULL,
  `close` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dateOfBirth` date NOT NULL,
  `gender` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT 'N/A',
  `race` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT 'N/A',
  `passport` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'N/A',
  `email` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'N/A',
  `phone` int(12) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dateCreated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `balance` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `dateOfBirth`, `gender`, `race`, `passport`, `email`, `phone`, `password`, `dateCreated`, `user_id`, `balance`) VALUES
(17, 'Lethabo Maepa ', '2004-05-06', 'Male', 'Black', '', 'lethabomaepa11@gmail.com', 637440396, '$2y$10$72q1VoDFoO1lMrKmU.xLsuFmUcuV8vUuIvHdZHhtqcmllpVZMT28K', '2023-12-18 02:08:59.000000', '657fa9bb54bce', '28.93552'),
(18, 'Junior Kennedy', '0000-00-00', 'N/A', 'N/A', 'N/A', 'jkennedy@gmail.com', 123456789, '$2y$10$Z7J9gc7TGtzjsbcucnOFu.tWvelXy0zihsJRED44ai3lPMCu0EdeW', '2023-12-23 10:53:45.000000', '6586bc39b02c7', '0'),
(20, 'Diiey Raseala', '2006-06-11', 'Female', 'Black', '', 'diieyraseala@gmail.com', 673592645, '$2y$10$IIKnTv3ulA9GFM9p8tkgW.bE/pIHGhqu1Z5/lkok0avVUZSGyHFXS', '2023-12-29 10:26:42.000000', '658e9ee249aca', '0'),
(21, 'Jabu Labula', '2000-01-11', 'Male', 'Black', '', 'jabulabula11@gmail.com', 1122334455, '$2y$10$gGvkzfYjg.eJfSwXphfNZuT8MZ3eEg3tO3cA39u0LJ96omh/O22d.', '2023-12-18 11:35:22.000000', '65802e7a99774', '1497.8608'),
(22, 'Kenny Kunene', '0000-00-00', 'N/A', 'N/A', 'N/A', 'kunene@gmail.com', 795876810, '$2y$10$1mrmFirWx5KYsHNtBzlmROdGVADICNrPf8WbEy3BktGYVw3bwr4vW', '2023-12-27 17:46:45.000000', '658c6305b0c4d', '0'),
(23, '❤️Lil Emoji????', '0000-00-00', 'N/A', 'N/A', 'N/A', 'lil@gmail.com', 11223344, '$2y$10$icDvsbtJDUUMi5rNhleO3O462wWySvFREqXDMkbNdSP/zgLnBEtoq', '2023-12-29 21:33:21.000000', '658f3b210be5e', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lottery`
--
ALTER TABLE `lottery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_order`
--
ALTER TABLE `stock_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lottery`
--
ALTER TABLE `lottery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_order`
--
ALTER TABLE `stock_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Database: `LoopyLite`
--
CREATE DATABASE IF NOT EXISTS `LoopyLite` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `LoopyLite`;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `user_id`, `to_user`, `activity`, `date`, `link`, `privacy`) VALUES
(37, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-02 15:00:38', 'account.php', 'only me'),
(36, '658e9ee249aca', '657fa9bb54bce', 'commented: Greatest hits of 2022 from nasty c❤️❤️????...', '2024-01-02 14:59:15', 'view-item.php?pid=6593df0606a97', 'public'),
(35, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-02 14:58:12', 'account.php', 'only me'),
(34, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-02 10:51:18', 'account.php', 'only me'),
(33, '6586bc39b02c7', '657fa9bb54bce', 'commented: This is a great playlist, @lethabo well done, and ...', '2024-01-02 10:35:50', 'view-item.php?pid=6593df0606a97', 'public'),
(32, '6586bc39b02c7', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-02 10:34:55', 'account.php', 'only me'),
(31, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-02 10:33:57', 'account.php', 'only me'),
(30, '657fa9bb54bce', '65802e7a99774', 'unfollowed', '2024-01-02 10:33:42', 'account.php?uid=657fa9bb54bce', 'public'),
(29, '657fa9bb54bce', '65802e7a99774', 'followed', '2024-01-02 10:33:35', 'account.php?uid=65802e7a99774', 'public'),
(28, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-02 10:32:45', 'account.php', 'only me'),
(27, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-02 10:31:52', 'account.php', 'only me'),
(26, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-02 10:31:26', 'account.php', 'only me'),
(25, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-02 10:30:34', 'account.php', 'only me'),
(24, '65802e7a99774', '657fa9bb54bce', 'commented: I love this playlist, it has almost all his songs,', '2024-01-02 10:29:37', 'view-item.php?pid=6593df0606a97', 'public'),
(22, '657fa9bb54bce', '65802e7a99774', 'commented: Added new feature.', '2024-01-02 10:26:59', 'view-item.php?pid=6589bf9d68190', 'public'),
(23, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-02 10:27:56', 'account.php', 'only me'),
(21, '657fa9bb54bce', '65802e7a99774', 'unfollowed', '2024-01-02 10:23:03', 'account.php?uid=657fa9bb54bce', 'public'),
(38, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-02 15:04:00', 'account.php', 'only me'),
(39, '65802e7a99774', 'me', 'added a product: Fried Eggs at R 15', '2024-01-02 15:12:53', 'view-item.php?pid=659427f5c1105', 'public'),
(40, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-02 15:13:41', 'account.php', 'only me'),
(41, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-02 15:15:20', 'account.php', 'only me'),
(42, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-03 11:40:00', 'account.php', 'only me'),
(43, '657fa9bb54bce', '657fa9bb54bce', 'commented: Yeah Diiey❤️❤️????...', '2024-01-03 11:40:59', 'view-item.php?pid=6593df0606a97', 'public'),
(44, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-03 11:41:41', 'account.php', 'only me'),
(45, '658e9ee249aca', '65802e7a99774', 'followed', '2024-01-03 11:42:37', 'account.php?uid=65802e7a99774', 'public'),
(46, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-03 11:45:23', 'account.php', 'only me'),
(47, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-06 15:47:14', 'account.php', 'only me'),
(48, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-06 17:14:51', 'account.php', 'only me'),
(49, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-06 17:17:38', 'account.php', 'only me'),
(50, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-06 17:17:56', 'account.php', 'only me'),
(51, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-06 17:18:52', 'account.php', 'only me'),
(52, '657fa9bb54bce', 'me', 'deleted your product', '2024-01-06 17:47:24', 'account.php', 'only me'),
(53, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-06 19:17:59', 'account.php', 'only me'),
(54, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-06 19:19:17', 'account.php', 'only me'),
(55, '65802e7a99774', '657fa9bb54bce', 'commented: ????????...', '2024-01-06 19:21:51', 'view-item.php?pid=6593df0606a97', 'public'),
(56, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-06 19:22:07', 'account.php', 'only me'),
(57, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-06 19:37:29', 'account.php', 'only me'),
(58, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-06 19:43:51', 'account.php', 'only me'),
(59, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-06 20:46:07', 'account.php', 'only me'),
(60, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-07 11:31:08', 'account.php', 'only me'),
(61, '657fa9bb54bce', 'me', 'added a product: LoopyLite Features... at R 0', '2024-01-07 11:38:00', 'view-item.php?pid=659a8d17ed222', 'public'),
(62, '657fa9bb54bce', '657fa9bb54bce', 'commented: Will start soon......', '2024-01-07 11:38:14', 'view-item.php?pid=659a8d17ed222', 'public'),
(63, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-07 20:52:47', 'account.php', 'only me'),
(64, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-07 20:54:52', 'account.php', 'only me'),
(65, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-07 20:58:31', 'account.php', 'only me'),
(66, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-08 22:19:27', 'account.php', 'only me'),
(67, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-09 10:54:09', 'account.php', 'only me'),
(68, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-09 18:56:29', 'account.php', 'only me'),
(69, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-09 19:32:36', 'account.php', 'only me'),
(70, '$2y$10$IgkiZeb6QCtBSiUfK39guONC6ByvlfHRvoitfieqw4W4pgggshjo2', '658f3b210be5e', 'followed', '2024-01-10 09:50:02', 'account.php?uid=658f3b210be5e', 'public'),
(71, '$2y$10$IgkiZeb6QCtBSiUfK39guONC6ByvlfHRvoitfieqw4W4pgggshjo2', '657fa9bb54bce', 'followed', '2024-01-10 09:50:17', 'account.php?uid=657fa9bb54bce', 'public'),
(72, '$2y$10$IgkiZeb6QCtBSiUfK39guONC6ByvlfHRvoitfieqw4W4pgggshjo2', '658f3b210be5e', 'unfollowed', '2024-01-10 09:50:23', 'account.php?uid=$2y$10$IgkiZeb6QCtBSiUfK39guONC6ByvlfHRvoitfieqw4W4pgggshjo2', 'public'),
(73, '$2y$10$IgkiZeb6QCtBSiUfK39guONC6ByvlfHRvoitfieqw4W4pgggshjo2', '657fa9bb54bce', 'unfollowed', '2024-01-10 09:50:26', 'account.php?uid=$2y$10$IgkiZeb6QCtBSiUfK39guONC6ByvlfHRvoitfieqw4W4pgggshjo2', 'public'),
(74, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 09:59:45', 'account.php', 'only me'),
(75, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 16:26:12', 'account.php', 'only me'),
(76, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 16:30:49', 'account.php', 'only me'),
(77, '6586bc39b02c7', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 16:31:43', 'account.php', 'only me'),
(78, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 16:33:20', 'account.php', 'only me'),
(79, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 16:35:05', 'account.php', 'only me'),
(80, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 16:36:40', 'account.php', 'only me'),
(81, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 16:37:00', 'account.php', 'only me'),
(82, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 16:37:57', 'account.php', 'only me'),
(83, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 16:38:11', 'account.php', 'only me'),
(84, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 16:38:22', 'account.php', 'only me'),
(85, '657fa9bb54bce', '658e9ee249aca', 'unfollowed', '2024-01-10 16:51:38', 'account.php?uid=657fa9bb54bce', 'public'),
(86, '657fa9bb54bce', '658e9ee249aca', 'followed', '2024-01-10 16:51:40', 'account.php?uid=658e9ee249aca', 'public'),
(87, '657fa9bb54bce', '657fa9bb54bce', 'commented: Users can now link LoopyLite Account with Bankyio,...', '2024-01-10 16:53:41', 'view-item.php?pid=659a8d17ed222', 'public'),
(88, '657fa9bb54bce', '657fa9bb54bce', 'commented: A feature for adding text posts here on LoopyLite ...', '2024-01-10 16:54:50', 'view-item.php?pid=659a8d17ed222', 'public'),
(89, '657fa9bb54bce', 'me', 'added a product: More Features Per day at R 0', '2024-01-10 16:56:08', 'view-item.php?pid=659ecc285afbf', 'public'),
(90, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 19:25:29', 'account.php', 'only me'),
(91, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 20:08:53', 'account.php', 'only me'),
(92, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 21:40:40', 'account.php', 'only me'),
(93, '6586bc39b02c7', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 21:41:57', 'account.php', 'only me'),
(94, '6586bc39b02c7', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 21:42:19', 'account.php', 'only me'),
(95, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 21:54:54', 'account.php', 'only me'),
(96, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 21:56:20', 'account.php', 'only me'),
(97, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 21:56:31', 'account.php', 'only me'),
(98, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 21:56:43', 'account.php', 'only me'),
(99, '657fa9bb54bce', 'me', '', '2024-01-10 21:56:52', 'account.php', 'only me'),
(100, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 22:00:15', 'account.php', 'only me'),
(101, '658e9ee249aca', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 22:00:35', 'account.php', 'only me'),
(102, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-10 22:03:32', 'account.php', 'only me'),
(103, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 05:24:24', 'account.php', 'only me'),
(104, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 05:25:34', 'account.php', 'only me'),
(105, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 05:43:32', 'account.php', 'only me'),
(106, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 05:49:16', 'account.php', 'only me'),
(107, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 06:04:46', 'account.php', 'only me'),
(108, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 06:10:35', 'account.php', 'only me'),
(109, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-11 06:12:24', 'account.php', 'only me'),
(110, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-11 06:13:13', 'account.php', 'only me'),
(111, '65802e7a99774', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-11 06:13:35', 'account.php', 'only me'),
(112, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-11 06:14:35', 'account.php', 'only me'),
(113, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/119.0.6045.66 Mobile Safari/537.36', '2024-01-11 06:16:04', 'account.php', 'only me'),
(114, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 19:28:26', 'account.php', 'only me'),
(115, '657fa9bb54bce', 'me', 'deleted your product', '2024-01-11 19:43:21', 'account.php', 'only me'),
(116, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 19:46:03', 'account.php', 'only me'),
(117, '65802e7a99774', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 19:47:19', 'account.php', 'only me'),
(118, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 19:47:30', 'account.php', 'only me'),
(119, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 19:55:04', 'account.php', 'only me'),
(120, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-11 19:55:37', 'account.php', 'only me'),
(121, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 06:33:25', 'account.php', 'only me'),
(122, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 06:40:52', 'account.php', 'only me'),
(123, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 07:12:11', 'account.php', 'only me'),
(124, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 12:09:42', 'account.php', 'only me'),
(125, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 12:34:02', 'account.php', 'only me'),
(126, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-12 15:27:34', 'account.php', 'only me'),
(127, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 15:31:44', 'account.php', 'only me'),
(128, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 15:36:59', 'account.php', 'only me'),
(129, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 17:23:24', 'account.php', 'only me'),
(130, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 17:41:29', 'account.php', 'only me'),
(131, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 17:57:06', 'account.php', 'only me'),
(132, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 18:14:02', 'account.php', 'only me'),
(133, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 18:27:31', 'account.php', 'only me'),
(134, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-12 19:21:14', 'account.php', 'only me'),
(135, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 20:15:44', 'account.php', 'only me'),
(136, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 20:19:05', 'account.php', 'only me'),
(137, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-12 20:21:31', 'account.php', 'only me'),
(138, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-12 20:22:48', 'account.php', 'only me'),
(139, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-12 20:24:21', 'account.php', 'only me'),
(140, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-12 20:34:29', 'account.php', 'only me'),
(141, '657fa9bb54bce', '657fa9bb54bce', 'commented: I did say I will add text posts, on top of that I ...', '2024-01-12 20:54:11', 'view-item.php?pid=659ecc285afbf', 'public'),
(142, '658c6305b0c4d', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-13 05:27:51', 'account.php', 'only me'),
(143, '658c6305b0c4d', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-13 05:29:34', 'account.php', 'only me'),
(144, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-13 12:07:23', 'account.php', 'only me'),
(145, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-14 06:25:46', 'account.php', 'only me'),
(146, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-14 09:37:41', 'account.php', 'only me'),
(147, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-14 09:38:29', 'account.php', 'only me'),
(148, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-14 12:34:50', 'account.php', 'only me'),
(149, '658c6305b0c4d', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-14 12:40:45', 'account.php', 'only me'),
(150, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-14 23:44:29', 'account.php', 'only me'),
(151, '657fa9bb54bce', 'me', 'deleted your product', '2024-01-14 23:44:45', 'account.php', 'only me'),
(152, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-15 22:59:26', 'account.php', 'only me'),
(153, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-15 23:03:25', 'account.php', 'only me'),
(154, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-15 23:07:14', 'account.php', 'only me'),
(155, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-15 23:07:32', 'account.php', 'only me'),
(156, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 00:31:50', 'account.php', 'only me'),
(157, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-16 01:47:38', 'account.php', 'only me'),
(158, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 01:50:38', 'account.php', 'only me'),
(159, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 02:15:15', 'account.php', 'only me'),
(160, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-16 02:16:04', 'account.php', 'only me'),
(161, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 07:07:30', 'account.php', 'only me'),
(162, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 07:20:21', 'account.php', 'only me'),
(163, '657fa9bb54bce', '658f3b210be5e', 'followed', '2024-01-16 07:25:45', 'account.php?uid=658f3b210be5e', 'public'),
(164, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 07:28:20', 'account.php', 'only me'),
(165, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 08:45:11', 'account.php', 'only me'),
(166, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 09:08:36', 'account.php', 'only me'),
(167, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-16 09:29:56', 'account.php', 'only me'),
(168, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 10:12:12', 'account.php', 'only me'),
(169, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 12:23:13', 'account.php', 'only me'),
(170, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 12:24:38', 'account.php', 'only me'),
(171, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-16 14:42:51', 'account.php', 'only me'),
(172, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-16 14:54:14', 'account.php', 'only me'),
(173, '658f3b210be5e', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-16 16:10:23', 'account.php', 'only me'),
(174, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 08:58:37', 'account.php', 'only me'),
(175, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 11:19:17', 'account.php', 'only me'),
(176, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 11:43:16', 'account.php', 'only me'),
(177, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 12:24:19', 'account.php', 'only me'),
(178, '657fa9bb54bce', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 12:47:48', 'account.php', 'only me'),
(179, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 14:50:51', 'account.php', 'only me'),
(180, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-17 14:53:22', 'account.php', 'only me'),
(181, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:04:25', 'account.php', 'only me'),
(182, '658f3b210be5e', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:04:51', 'account.php', 'only me'),
(183, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:06:30', 'account.php', 'only me'),
(184, '658f3b210be5e', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:06:46', 'account.php', 'only me'),
(185, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:16:51', 'account.php', 'only me'),
(186, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:18:55', 'account.php', 'only me'),
(187, '658f3b210be5e', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:19:02', 'account.php', 'only me'),
(188, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:19:14', 'account.php', 'only me'),
(189, '658f3b210be5e', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:29:45', 'account.php', 'only me'),
(190, '658e9ee249aca', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:30:18', 'account.php', 'only me'),
(191, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-17 15:32:01', 'account.php', 'only me'),
(192, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-17 15:53:23', 'account.php', 'only me'),
(193, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-17 16:03:32', 'account.php', 'only me'),
(194, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-17 16:36:55', 'account.php', 'only me'),
(195, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/119.0.6045.66 Mobile Safari/537.36', '2024-01-17 17:50:48', 'account.php', 'only me'),
(196, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-18 06:38:00', 'account.php', 'only me'),
(197, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-18 07:04:52', 'account.php', 'only me'),
(198, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-18 07:04:52', 'account.php', 'only me'),
(199, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-18 09:08:38', 'account.php', 'only me'),
(200, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-18 09:11:38', 'account.php', 'only me'),
(201, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-18 09:34:37', 'account.php', 'only me'),
(202, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-18 09:35:55', 'account.php', 'only me'),
(203, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-18 09:39:14', 'account.php', 'only me'),
(204, '657fa9bb54bce', '65802e7a99774', 'followed', '2024-01-18 09:56:56', 'account.php?uid=65802e7a99774', 'public'),
(205, '657fa9bb54bce', '65802e7a99774', 'unfollowed', '2024-01-18 09:56:59', 'account.php?uid=657fa9bb54bce', 'public'),
(206, '657fa9bb54bce', '65802e7a99774', 'followed', '2024-01-18 09:57:00', 'account.php?uid=65802e7a99774', 'public'),
(207, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-18 13:24:44', 'account.php', 'only me'),
(208, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-18 16:15:50', 'account.php', 'only me'),
(209, '6586bc39b02c7', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-18 16:16:51', 'account.php', 'only me'),
(210, '657fa9bb54bce', '6586bc39b02c7', 'followed', '2024-01-18 16:17:37', 'account.php?uid=6586bc39b02c7', 'public'),
(211, '657fa9bb54bce', '6586bc39b02c7', 'unfollowed', '2024-01-18 16:17:40', 'account.php?uid=657fa9bb54bce', 'public'),
(212, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-18 16:19:05', 'account.php', 'only me'),
(213, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-19 23:26:38', 'account.php', 'only me'),
(214, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-19 23:28:45', 'account.php', 'only me'),
(215, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-19 23:31:09', 'account.php', 'only me'),
(216, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-19 23:31:27', 'account.php', 'only me'),
(217, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-20 09:19:52', 'account.php', 'only me'),
(218, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-20 09:25:47', 'account.php', 'only me'),
(219, '657fa9bb54bce', '657fa9bb54bce', 'commented: 🔥🔥✌️✅️...', '2024-01-20 09:51:25', 'view-item.php?pid=659ecc285afbf', 'public'),
(220, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-21 08:05:16', 'account.php', 'only me'),
(221, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-21 08:25:45', 'account.php', 'only me'),
(222, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-21 08:48:47', 'account.php', 'only me'),
(223, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-21 08:52:13', 'account.php', 'only me'),
(224, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-21 09:07:18', 'account.php', 'only me'),
(225, '657fa9bb54bce', 'me', 'deleted your product', '2024-01-21 09:36:45', 'account.php', 'only me'),
(226, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-21 09:40:03', 'account.php', 'only me'),
(227, '657fa9bb54bce', 'me', 'deleted your product', '2024-01-21 09:41:53', 'account.php', 'only me'),
(228, '657fa9bb54bce', '658e9ee249aca', 'unfollowed', '2024-01-21 09:43:29', 'account.php?uid=657fa9bb54bce', 'public'),
(229, '657fa9bb54bce', '658f3b210be5e', 'unfollowed', '2024-01-21 09:43:39', 'account.php?uid=657fa9bb54bce', 'public'),
(230, '657fa9bb54bce', '658e9ee249aca', 'followed', '2024-01-21 09:43:41', 'account.php?uid=658e9ee249aca', 'public'),
(231, '657fa9bb54bce', '658f3b210be5e', 'followed', '2024-01-21 09:43:42', 'account.php?uid=658f3b210be5e', 'public'),
(232, '657fa9bb54bce', '658f3b210be5e', 'unfollowed', '2024-01-21 09:43:43', 'account.php?uid=657fa9bb54bce', 'public'),
(233, '657fa9bb54bce', '658f3b210be5e', 'followed', '2024-01-21 09:43:44', 'account.php?uid=658f3b210be5e', 'public'),
(234, '657fa9bb54bce', '658f3b210be5e', 'unfollowed', '2024-01-21 09:43:46', 'account.php?uid=657fa9bb54bce', 'public'),
(235, '657fa9bb54bce', '658f3b210be5e', 'followed', '2024-01-21 09:43:47', 'account.php?uid=658f3b210be5e', 'public'),
(236, '657fa9bb54bce', '658f3b210be5e', 'unfollowed', '2024-01-21 09:43:48', 'account.php?uid=657fa9bb54bce', 'public'),
(237, '657fa9bb54bce', '658f3b210be5e', 'followed', '2024-01-21 09:43:49', 'account.php?uid=658f3b210be5e', 'public'),
(238, '657fa9bb54bce', '658f3b210be5e', 'unfollowed', '2024-01-21 09:43:50', 'account.php?uid=657fa9bb54bce', 'public'),
(239, '657fa9bb54bce', '658f3b210be5e', 'followed', '2024-01-21 09:43:51', 'account.php?uid=658f3b210be5e', 'public'),
(240, '657fa9bb54bce', '658f3b210be5e', 'unfollowed', '2024-01-21 09:43:52', 'account.php?uid=657fa9bb54bce', 'public'),
(241, '657fa9bb54bce', 'me', 'added a product: Solution Rope at R 50', '2024-01-21 09:59:52', 'view-item.php?pid=65aceb1803218', 'public'),
(242, '657fa9bb54bce', 'me', 'added a product: Casio Calculator  at R 259', '2024-01-21 10:02:39', 'view-item.php?pid=65acebbf68896', 'public'),
(243, '657fa9bb54bce', '657fa9bb54bce', 'followed', '2024-01-21 10:03:29', 'account.php?uid=657fa9bb54bce', 'public'),
(244, '657fa9bb54bce', '657fa9bb54bce', 'unfollowed', '2024-01-21 10:04:02', 'account.php?uid=657fa9bb54bce', 'public'),
(245, '657fa9bb54bce', '657fa9bb54bce', 'followed', '2024-01-21 10:04:03', 'account.php?uid=657fa9bb54bce', 'public'),
(246, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-21 18:39:37', 'account.php', 'only me'),
(247, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-23 07:11:53', 'account.php', 'only me'),
(248, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', '2024-01-23 07:14:07', 'account.php', 'only me'),
(249, '658f3b210be5e', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-23 08:08:32', 'account.php', 'only me'),
(250, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-23 08:16:32', 'account.php', 'only me'),
(251, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-23 09:58:33', 'account.php', 'only me'),
(252, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-23 09:59:48', 'account.php', 'only me'),
(253, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-23 10:19:48', 'account.php', 'only me'),
(254, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-23 10:20:43', 'account.php', 'only me'),
(255, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-23 11:01:09', 'account.php', 'only me'),
(256, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-23 14:33:56', 'account.php', 'only me'),
(257, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-23 15:43:30', 'account.php', 'only me'),
(258, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-23 15:46:50', 'account.php', 'only me'),
(259, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-23 16:17:53', 'account.php', 'only me'),
(260, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-23 21:49:38', 'account.php', 'only me'),
(261, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-26 09:50:52', 'account.php', 'only me'),
(262, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-26 09:55:40', 'account.php', 'only me'),
(263, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-27 11:09:59', 'account.php', 'only me'),
(264, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-27 11:10:08', 'account.php', 'only me'),
(265, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-28 09:23:05', 'account.php', 'only me'),
(266, '658f3b210be5e', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-28 09:25:02', 'account.php', 'only me'),
(267, '658f3b210be5e', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-28 09:26:06', 'account.php', 'only me'),
(268, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-28 09:29:56', 'account.php', 'only me'),
(269, '65802e7a99774', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-28 14:02:26', 'account.php', 'only me'),
(270, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-28 17:34:20', 'account.php', 'only me'),
(271, '65802e7a99774', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-28 18:05:06', 'account.php', 'only me'),
(272, '65802e7a99774', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-01-28 18:09:33', 'account.php', 'only me'),
(273, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-01-30 05:54:48', 'account.php', 'only me'),
(274, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-02 12:20:58', 'account.php', 'only me');
INSERT INTO `activity` (`id`, `user_id`, `to_user`, `activity`, `date`, `link`, `privacy`) VALUES
(275, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-02-02 12:28:19', 'account.php', 'only me'),
(276, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-02 12:30:17', 'account.php', 'only me'),
(277, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-02 12:58:56', 'account.php', 'only me'),
(278, '65802e7a99774', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-02-02 13:00:29', 'account.php', 'only me'),
(279, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-02-03 20:33:22', 'account.php', 'only me'),
(280, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-02-08 08:17:49', 'account.php', 'only me'),
(281, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-02-08 08:36:23', 'account.php', 'only me'),
(282, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-02-08 09:12:41', 'account.php', 'only me'),
(283, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-08 16:20:05', 'account.php', 'only me'),
(284, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-09 08:32:31', 'account.php', 'only me'),
(285, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-09 12:55:18', 'account.php', 'only me'),
(286, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-02-09 12:58:40', 'account.php', 'only me'),
(287, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-02-09 13:06:09', 'account.php', 'only me'),
(288, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-09 13:06:59', 'account.php', 'only me'),
(289, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2024-02-09 13:14:20', 'account.php', 'only me'),
(290, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-09 13:27:48', 'account.php', 'only me'),
(291, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-09 13:29:21', 'account.php', 'only me'),
(292, '658f3b210be5e', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-09 13:39:52', 'account.php', 'only me'),
(293, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-09 13:50:47', 'account.php', 'only me'),
(294, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-10 06:29:21', 'account.php', 'only me'),
(295, '658f3b210be5e', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-10 06:29:41', 'account.php', 'only me'),
(296, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 13; SM-A042F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Mobile Safari/537.36', '2024-02-10 06:31:16', 'account.php', 'only me'),
(297, '657fa9bb54bce', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '2024-02-12 10:24:31', 'account.php', 'only me'),
(298, '657fa9bb54bce', '65802e7a99774', 'unfollowed', '2024-02-12 10:25:30', 'account.php?uid=657fa9bb54bce', 'public'),
(299, '657fa9bb54bce', '65802e7a99774', 'followed', '2024-02-12 10:25:32', 'account.php?uid=65802e7a99774', 'public'),
(300, '65802e7a99774', 'me', 'logged in on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '2024-02-12 10:27:00', 'account.php', 'only me'),
(301, '65802e7a99774', 'me', 'logged in to Bankyio app using LoopyLite on Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36', '2024-02-12 10:29:16', 'account.php', 'only me');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id_one` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id_two` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `chat_id`, `user_id_one`, `user_id_two`, `last_modified`) VALUES
(1, '65a5e08022ae8', '65802e7a99774', '657fa9bb54bce', '2024-02-12 12:27:47'),
(34, '8o-i9e41230L24t58b1oc6p4L2e0101-20y35d', '657fa9bb54bce', '6586bc39b02c7', '2024-02-09 10:32:58'),
(20, '0c7a3a1619c3f6a65f1f417796a6c9a6/a56573/7', '657fa9bb54bce', '657fa9bb54bce', '2024-01-23 09:37:49'),
(5, '65a5e8a455b70', '658e9ee249aca', '6586bc39b02c7', '0000-00-00 00:00:00'),
(7, '65a6517d177c7', '65802e7a99774', '658c6305b0c4d', '2024-01-16 16:51:43'),
(8, '/65a6a9cf3e369/c/65a6a9cf3e37b', '65802e7a99774', '658f3b210be5e', '2024-02-03 22:48:47'),
(9, 'abc/65a7f2d1c5938/c/65a7f2d1c5945', '658e9ee249aca', '658f3b210be5e', '2024-01-23 10:13:09'),
(35, '2io43263952y96L-50Lt26o000d48c62p1ebd', '658f3b210be5e', '657fa9bb54bce', '2024-02-09 15:52:16'),
(27, '4- 70252065-813f994f786cc70411328-709242009a02/65199c2a1-7f/', '65802e7a99774', '6586bc39b02c7', '2024-02-08 10:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `chat_wallpaper`
--

CREATE TABLE `chat_wallpaper` (
  `id` int(11) NOT NULL,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_wallpaper`
--

INSERT INTO `chat_wallpaper` (`id`, `chat_id`, `user_id`, `file_path`) VALUES
(3, '65a5e08022ae8', '65802e7a99774', 'assets/users/files/image/wp.65a8eb283ac7465a5e08022ae865802e7a99774.jpg'),
(4, '65a5e08022ae8', '657fa9bb54bce', 'assets/users/files/image/bef4b652bfp159c67acw26a65b69..jpg'),
(16, '2io43263952y96L-50Lt26o000d48c62p1ebd', '658f3b210be5e', 'assets/users/files/image/b65b8802d59860wf55ee2f.16e3cp.jpg'),
(15, '/65a6a9cf3e369/c/65a6a9cf3e37b', '65802e7a99774', 'assets/users/files/image/w62598e847b9.273a7a1p05bea76a.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(150) CHARACTER SET utf8 NOT NULL,
  `mobile` varchar(13) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `location` varchar(50) CHARACTER SET utf8 NOT NULL,
  `website` varchar(255) CHARACTER SET utf8 NOT NULL,
  `bio` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `profile_img` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cover_img` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `followers` int(11) NOT NULL DEFAULT '0',
  `following` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `unique_id`, `name`, `email`, `mobile`, `password`, `location`, `website`, `bio`, `profile_img`, `cover_img`, `date_created`, `followers`, `following`) VALUES
(4, '657fa9bb54bce', 'Lethabo Maepa ', 'lethabomaepa11@gmail.com', '0637440396', '$2y$10$72q1VoDFoO1lMrKmU.xLsuFmUcuV8vUuIvHdZHhtqcmllpVZMT28K', 'Gauteng', 'https://www.facebook.com/lethabo.maepa.332', 'LoopyLite Developer✅️', 'assets/images/client/profile/658c8e88e4883.jpg', 'assets/images/client/cover/65929027f20ff.jpg', '2023-12-18 02:08:59', 6, 3),
(5, '65802e7a99774', 'Jabu Labula', 'jabulabula11@gmail.com', '01122334455', '$2y$10$gGvkzfYjg.eJfSwXphfNZuT8MZ3eEg3tO3cA39u0LJ96omh/O22d.', 'Gauteng', 'http://jabula.com', 'This is my bio here I am\r\n ✅️\r\n➿️❤️✌️', 'assets/images/client/profile/6599a81675cef.jpg', 'assets/images/client/cover/65802e8e6eacc.jpg', '2023-12-18 11:35:22', 2, 4),
(11, '65804d9098f24', 'Junior Kennedy', 'kennyJJ6@gmail.com', '0601231235', '$2y$10$jtIeKr9YXOpAMUJF7KoU9u4cVCS6DBsNcgZthvEqQgkgDz46phTgu', 'Free State', '', 'Click here to edit your bio', 'assets/images/client/profile//65804d9099399.jpg', '', '2023-12-18 13:48:00', 0, 0),
(12, '6586bc39b02c7', 'Junior Kennedy', 'jkennedy@gmail.com', '0123456789', '$2y$10$Z7J9gc7TGtzjsbcucnOFu.tWvelXy0zihsJRED44ai3lPMCu0EdeW', 'Limpopo', '', 'All about this shit\r\nJ Kennedy here', 'assets/images/client/profile/658f3c618d368.jpg', 'assets/images/client/cover/6586bc460d934.jpg', '2023-12-23 10:53:45', 1, 3),
(13, '658c6305b0c4d', 'Kenny Kunene', 'kunene@gmail.com', '0795876810', '$2y$10$1mrmFirWx5KYsHNtBzlmROdGVADICNrPf8WbEy3BktGYVw3bwr4vW', 'Free State', '', 'New on LoopyLite✌️', 'assets/images/client/profile/658c6305b1edb.jpg', 'assets/images/client/cover/658c637ac1229.jpg', '2023-12-27 17:46:45', 1, 2),
(14, '658e9ee249aca', 'Diiey Raseala', 'diieyraseala@gmail.com', '0673592645', '$2y$10$IIKnTv3ulA9GFM9p8tkgW.bE/pIHGhqu1Z5/lkok0avVUZSGyHFXS', 'Gauteng', '', '❤️', 'assets/images/client/profile/658e9ee24a7d8.jpg', 'assets/images/client/cover/65a3aba8c04bd.jpg', '2023-12-29 10:26:42', 5, 2),
(15, '658f3b210be5e', '❤️Lil Emoji????', 'lil@gmail.com', '0011223344', '$2y$10$icDvsbtJDUUMi5rNhleO3O462wWySvFREqXDMkbNdSP/zgLnBEtoq', 'Mpumalanga', '', 'I am Lil Emoji❤️❤️✌️', 'assets/images/client/profile/65af7411f0528.jpg', 'assets/images/client/cover/65af741d9c08a.jpg', '2023-12-29 21:33:21', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `post_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `post_id`, `name`, `path`, `type`) VALUES
(9, '65a131e802d76', 'Downloadyy.mp4', 'assets/users/files/video/Downloadyy.mp4', 'video'),
(12, '/65a17a5cd6103/657fa9bb54bce', 'report (4).pdf', 'assets/users/files/document/report (4).pdf', 'document'),
(13, '/65a17a5cd6103/657fa9bb54bce', 'pubg.png', 'assets/users/files/image/pubg.png', 'image'),
(14, '/65a17a5cd6103/657fa9bb54bce', 'Download kk.mp4', 'assets/users/files/video/Download kk.mp4', 'video'),
(15, '/65a17ddcd8fcd/657fa9bb54bce', 'logo2.png', 'assets/users/files/image/logo2.png', 'image'),
(16, '/65a17ddcd8fcd/657fa9bb54bce', '9a7b246b9433326df66f3261d8feb800.jpg', 'assets/users/files/image/9a7b246b9433326df66f3261d8feb800.jpg', 'image'),
(17, '/65a17ddcd8fcd/657fa9bb54bce', 'FmBzYCzXkAAK1uI.jpeg', 'assets/users/files/image/FmBzYCzXkAAK1uI.jpeg', 'image'),
(18, '/65a17ddcd8fcd/657fa9bb54bce', 'jobMom.PNG', 'assets/users/files/image/jobMom.PNG', 'image'),
(19, '/65a17ddcd8fcd/657fa9bb54bce', 'jobMom2.PNG', 'assets/users/files/image/jobMom2.PNG', 'image'),
(20, '/65a1858f039be/658e9ee249aca', 'global.css', 'assets/users/files/document/global.css', 'document'),
(21, '/65a1858f039be/658e9ee249aca', 'user.java', 'assets/users/files/document/user.java', 'document'),
(22, '/65a1858f039be/658e9ee249aca', 'Varela_Round.zip', 'assets/users/files/document/Varela_Round.zip', 'document'),
(23, '/65a1858f039be/658e9ee249aca', 'Screenshot_20240108_224143_Brave.jpg', 'assets/users/files/image/Screenshot_20240108_224143_Brave.jpg', 'image'),
(24, '/65a1a1fab3121/65802e7a99774', 'pexels-darina-belonogova-9187953 (1080p).mp4', 'assets/users/files/video/pexels-darina-belonogova-9187953 (1080p).mp4', 'video'),
(25, '/65a1a1fab3121/65802e7a99774', 'pexels-khanh-hoang-minh-17862741 (1080p).mp4', 'assets/users/files/video/pexels-khanh-hoang-minh-17862741 (1080p).mp4', 'video'),
(26, '/65a1a3b73d024/657fa9bb54bce', 'Screenshot_20240112_223511_Brave.jpg', 'assets/users/files/image/Screenshot_20240112_223511_Brave.jpg', 'image'),
(27, '/65a3d5972562e/658e9ee249aca', '1705219757210.jpg', 'assets/users/files/image/1705219757210.jpg', 'image'),
(28, '/65a3d5972562e/658e9ee249aca', '1705219753499.jpg', 'assets/users/files/image/1705219753499.jpg', 'image'),
(29, '/65a3d5972562e/658e9ee249aca', '1705219750779.jpg', 'assets/users/files/image/1705219750779.jpg', 'image'),
(30, '/65a3d5972562e/658e9ee249aca', '1705219302584.jpg', 'assets/users/files/image/1705219302584.jpg', 'image'),
(31, '/65a6309fb49c2/657fa9bb54bce', 'Screenshot_20240116_043326_Chrome.jpg', 'assets/users/files/image/Screenshot_20240116_043326_Chrome.jpg', 'image'),
(32, '/65a6309fb49c2/657fa9bb54bce', 'Screenshot_20240116_040210_Brave.jpg', 'assets/users/files/image/Screenshot_20240116_040210_Brave.jpg', 'image'),
(33, '65a6454f559e3/m/65a6454f559ee', '20240115_173156.jpg', 'assets/users/files/image/20240115_173156.jpg', 'image'),
(34, '65a64645212c2/m/65a64645212cc', 'Screenshot_20240116_040210_Brave.jpg', 'assets/users/files/image/Screenshot_20240116_040210_Brave.jpg', 'image'),
(70, '9/c se:506ee08025ee46aau5622re1aab4d 8,Fm c29 e285', 'global.css', 'assets/users/files/document/global.css', 'document'),
(36, '65a64bbccc799/m/65a64bbccc7a5', 'Screenshot_20240115_205202_Lite.jpg', 'assets/users/files/image/Screenshot_20240115_205202_Lite.jpg', 'image'),
(37, '65a64dc7f1ad2/m/65a64dc7f1add', 'Finalize Resume - LiveCareer.pdf', 'assets/users/files/document/Finalize Resume - LiveCareer.pdf', 'document'),
(38, '65a64e02b9d82/m/65a64e02b9d90', 'VID-20240108-WA0010.mp4', 'assets/users/files/video/VID-20240108-WA0010.mp4', 'video'),
(39, '65a64e519de83/m/65a64e519de8e', '164ce76919d7ed8bb36f072538cff6a9.mp4', 'assets/users/files/video/164ce76919d7ed8bb36f072538cff6a9.mp4', 'video'),
(40, '65a64ee36fa2d/m/65a64ee36fa3b', 'Dax_-__LIFE___Official_Music_Video_.MP3', 'assets/users/files/audio/Dax_-__LIFE___Official_Music_Video_.MP3', 'audio'),
(41, '65a654714d40f/m/65a654714d428', 'VID-20231108-WA0079.mp4', 'assets/users/files/video/VID-20231108-WA0079.mp4', 'video'),
(42, '65a6992d72413/m/65a6992d7241f', 'Screenshot_20240116_165632_Chrome.jpg', 'assets/users/files/image/Screenshot_20240116_165632_Chrome.jpg', 'image'),
(43, '65a797be0b1b8/m/65a797be0b1d0', 'global.css', 'assets/users/files/document/global.css', 'document'),
(44, '65a797dc147e1/m/65a797dc147ed', 'Login.html', 'assets/users/files/document/Login.html', 'document'),
(45, '65a7baa01c156/m/65a7baa01c16f', '1705423415541.jpg', 'assets/users/files/image/1705423415541.jpg', 'image'),
(46, '/65a7fa77889e4/65802e7a99774', 'tt.mp4', 'assets/users/files/video/tt.mp4', 'video'),
(47, '65a7facd37162/m/65a7facd3716c', 'tt.mp4', 'assets/users/files/video/tt.mp4', 'video'),
(48, '65a7fcbaead8c/m/65a7fcbaeada5', 'Summer Walker Ft. NO1-NOAH – White Tee_(Naijaflavour.com).mp3', 'assets/users/files/audio/Summer Walker Ft. NO1-NOAH – White Tee_(Naijaflavour.com).mp3', 'audio'),
(49, '/65a802941340b/657fa9bb54bce', '1140.NSFAS.jpg', 'assets/users/files/image/1140.NSFAS.jpg', 'image'),
(71, ' 6a2saFa2 38cr5e534a5er65,0 e/06su6250e6526b1/m9eg', '1707432343334.jpg', 'assets/users/files/image/1707432343334.jpg', 'image'),
(65, 'e56116058d15b3eefab58/b5b/62', 'Bootstrap-tutorial.pdf', 'assets/users/files/document/Bootstrap-tutorial.pdf', 'document'),
(69, '80dayc/25096b018c/356eeL5sairo566e4b2Fsut6 212pm9y', '1707432343334.jpg', 'assets/users/files/image/1707432343334.jpg', 'image'),
(52, '65a8eff839646/m/65a8eff83965e', 'Screenshot_20240118_113014_KSWEB.jpg', 'assets/users/files/image/Screenshot_20240118_113014_KSWEB.jpg', 'image'),
(72, '609fe41u5gc516 mee /5F2,a2be8/ r8s0- yber2924sa:66', 'e0e112cc4d84136b3d56846c7d8da00e.mp4', 'assets/users/files/video/e0e112cc4d84136b3d56846c7d8da00e.mp4', 'video'),
(66, '6b0c5//6218576c2e38fbcebc5fe', '1707432343334.jpg', 'assets/users/files/image/1707432343334.jpg', 'image'),
(67, 'g1fm6Ldt0L1 62 5429d2-c1i6fro5e2r/y0 aee1e8s-,24bo', '1707432343334.jpg', 'assets/users/files/image/1707432343334.jpg', 'image'),
(68, ',541 b2d641eL9o52c:-2705072038ac60u9beb2-si63o62g/', '1707432343334.jpg', 'assets/users/files/image/1707432343334.jpg', 'image'),
(56, '/65a8f40e8e489/65802e7a99774', 'e0e863ee73e9c89a838bf1e72661bd23.mp4', 'assets/users/files/video/e0e863ee73e9c89a838bf1e72661bd23.mp4', 'video'),
(57, '/65a8f532c1d8d/657fa9bb54bce', 'Squid Game S01E08 - Front Man (NetNaija.com).mp4', 'assets/users/files/video/Squid Game S01E08 - Front Man (NetNaija.com).mp4', 'video'),
(58, '/65a8f536d134d/65802e7a99774', 'Squid Game S01E05 - A Fair World (NetNaija.com).mp4', 'assets/users/files/video/Squid Game S01E05 - A Fair World (NetNaija.com).mp4', 'video'),
(59, '65a94f0d52ef7/m/65a94f0d52f03', '1705594329281.jpg', 'assets/users/files/image/1705594329281.jpg', 'image'),
(60, '65acdf0a6dd20/m/65acdf0a6dd2a', '20240121_101724.jpg', 'assets/users/files/image/20240121_101724.jpg', 'image'),
(61, '703c3e66e3faa77m552662/f6/c60', 'Screenshot_20240122_201754_OneDrive.jpg', 'assets/users/files/image/Screenshot_20240122_201754_OneDrive.jpg', 'image'),
(62, '46a36f34fa9506/69e/3be5504m77', 'Screenshot_20240122_201731_Lite.jpg', 'assets/users/files/image/Screenshot_20240122_201731_Lite.jpg', 'image'),
(63, '5a07f4fa747/6786/846564667maa', 'Screenshot_20240122_201754_OneDrive.jpg', 'assets/users/files/image/Screenshot_20240122_201754_OneDrive.jpg', 'image'),
(73, 'c4sa02/ d3/85r6113275Fga- a01: 8eyb6 ,saree008mc2d', 'Screenshot_20240209_222604_Lite.jpg', 'assets/users/files/image/Screenshot_20240209_222604_Lite.jpg', 'image'),
(74, 'eg/9ac5a10a760e4527meda5e8s6s26/8ec', 'global.css', 'assets/users/files/document/global.css', 'document'),
(75, 's60858see21a70/gace50be2m96a/522e8c', '1707432343334.jpg', 'assets/users/files/image/1707432343334.jpg', 'image'),
(76, '5/6a5a3sea8e62252/0se8m2afcaecg0a96', 'first year.mp4', 'assets/users/files/video/first year.mp4', 'video');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` int(11) NOT NULL,
  `followed` varchar(255) CHARACTER SET utf8 NOT NULL,
  `follower` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Followers and following';

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `followed`, `follower`, `date`) VALUES
(109, '65802e7a99774', '658e9ee249aca', '2024-01-03 11:42:37'),
(85, '658e9ee249aca', '658c6305b0c4d', '2023-12-29 11:19:37'),
(101, '657fa9bb54bce', '6586bc39b02c7', '2023-12-29 21:40:09'),
(105, '657fa9bb54bce', '65802e7a99774', '2024-01-02 09:54:36'),
(34, '657fa9bb54bce', '658c6305b0c4d', '2023-12-27 17:48:19'),
(84, '658e9ee249aca', '65802e7a99774', '2023-12-29 11:18:58'),
(80, '657fa9bb54bce', '658e9ee249aca', '2023-12-29 10:53:24'),
(124, '657fa9bb54bce', '657fa9bb54bce', '2024-01-21 10:04:03'),
(86, '658e9ee249aca', '6586bc39b02c7', '2023-12-29 11:20:10'),
(96, '658c6305b0c4d', '65802e7a99774', '2023-12-29 21:29:59'),
(95, '6586bc39b02c7', '65802e7a99774', '2023-12-29 21:29:58'),
(97, '657fa9bb54bce', '658f3b210be5e', '2023-12-29 21:35:34'),
(98, '658e9ee249aca', '658f3b210be5e', '2023-12-29 21:35:57'),
(102, '658f3b210be5e', '6586bc39b02c7', '2023-12-29 21:41:00'),
(117, '658e9ee249aca', '657fa9bb54bce', '2024-01-21 09:43:41'),
(125, '65802e7a99774', '657fa9bb54bce', '2024-02-12 10:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `message_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disconnect_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message_id`, `reply_to`, `text`, `user_id`, `chat_id`, `time`, `disconnect_user`) VALUES
(30, '65a642a1e7653/m/65a642a1e765e', 'none', 'Files coming soon', '657fa9bb54bce', '65a5e08022ae8', '', 'none'),
(31, '65a644ea3418b/m/65a644ea341a2', 'none', 'Pic', '657fa9bb54bce', '65a5e08022ae8', '', 'none'),
(32, '65a6454f559e3/m/65a6454f559ee', 'none', '.', '657fa9bb54bce', '65a5e08022ae8', '', '65802e7a99774'),
(33, '65a64638b8653/m/65a64638b866a', 'none', '', '657fa9bb54bce', '65a5e08022ae8', '', 'none'),
(34, '65a64645212c2/m/65a64645212cc', 'none', '', '657fa9bb54bce', '65a5e08022ae8', '', 'none'),
(39, '65a64cb1f3498/m/65a64cb1f34a6', 'none', 'Awesome ✌️✅️', '65802e7a99774', '65a5e08022ae8', '', 'none'),
(40, '65a64d1a201c5/m/65a64d1a201d4', 'none', '✅️✅️', '65802e7a99774', '65a5e08022ae8', '', 'none'),
(41, '65a64d24159c4/m/65a64d24159d0', 'none', '✅️', '65802e7a99774', '65a5e08022ae8', '', 'none'),
(42, '65a64dc7f1ad2/m/65a64dc7f1add', 'none', 'Download this file✌️', '65802e7a99774', '65a5e08022ae8', '', 'none'),
(43, '65a64e02b9d82/m/65a64e02b9d90', 'none', '', '657fa9bb54bce', '65a5e08022ae8', '', 'none'),
(44, '65a64e519de83/m/65a64e519de8e', 'none', '', '65802e7a99774', '65a5e08022ae8', '', 'none'),
(45, '65a64ee36fa2d/m/65a64ee36fa3b', 'none', '', '657fa9bb54bce', '65a5e08022ae8', '', 'none'),
(46, '65a64fe2db93f/m/65a64fe2db956', 'none', 'DAX - Life', '657fa9bb54bce', '65a5e08022ae8', '', 'none'),
(47, '65a65183baff8/m/65a65183bb005', 'none', 'Mr Kenny✌️', '65802e7a99774', '65a6517d177c7', '', 'none'),
(49, '65a6754807f36/m/65a6754807f41', 'none', 'Multimedia too✅️✅️✅️', '657fa9bb54bce', '65a5e08022ae8', '', 'none'),
(50, '65a697c93ad85/m/65a697c93ad90', 'none', 'Time too?', '657fa9bb54bce', '65a5e08022ae8', 'Tuesday January 16th, 2024 - 3:50pm', 'none'),
(52, '65a698a24ad38/m/65a698a24ad42', 'none', 'Great', '65802e7a99774', '65a5e08022ae8', 'Tuesday January 16th, 2024 - 3:54pm', 'none'),
(53, '65a6992d72413/m/65a6992d7241f', 'none', '', '65802e7a99774', '65a5e08022ae8', 'Tuesday January 16th, 2024 - 3:56pm', 'none'),
(54, '65a699c041c5d/m/65a699c041c69', 'none', 'Eh', '65802e7a99774', '65a5e08022ae8', 'Tuesday January 16th, 2024 - 15:59', 'none'),
(55, '65a69a971ae11/m/65a69a971ae22', 'none', '..', '65802e7a99774', '65a5e08022ae8', 'January 16, 2024 - 16:02', 'none'),
(56, '65a69a989c98c/m/65a69a989c997', 'none', '', '65802e7a99774', '65a5e08022ae8', 'January 16, 2024 - 16:02', 'none'),
(57, '65a69abc39bf2/m/65a69abc39bfe', 'none', 'Now, being able to delete chats and messages✅️✅️', '65802e7a99774', '65a5e08022ae8', 'January 16, 2024 - 16:03', 'none'),
(58, '65a69ae284c34/m/65a69ae284c46', 'none', '', '65802e7a99774', '65a5e08022ae8', 'January 16, 2024 - 16:04', 'none'),
(59, '65a69b013d939/m/65a69b013d944', 'none', 'At least ✅️', '657fa9bb54bce', '65a5e08022ae8', 'January 16, 2024 - 16:04', 'none'),
(60, '65a69b2cd2955/m/65a69b2cd2962', 'none', 'It&#039;s a bit messy in here :(', '65802e7a99774', '65a5e08022ae8', 'January 16, 2024 - 16:05', 'none'),
(61, '65a69d19660ea/m/65a69d1966100', 'none', '.', '657fa9bb54bce', '65a5e08022ae8', 'January 16, 2024 - 16:13', 'none'),
(62, '65a69e0e6d117/m/65a69e0e6d125', 'none', 'Yeah it is, otherwise \r\nNew features to be added\r\n*delete messages &amp; chats\r\n*view media files full screen when clicked\r\nAnd more✅️', '657fa9bb54bce', '65a5e08022ae8', 'January 16, 2024 - 16:17', 'none'),
(63, '65a69e8fb76d8/m/65a69e8fb76e2', 'none', 'Ayt✌️ I hear you Dawg\r\n**at that time I&#039;m chatting with myself ????', '65802e7a99774', '65a5e08022ae8', 'January 16, 2024 - 16:19', 'none'),
(64, '65a69edc5a6db/m/65a69edc5a75e', 'none', 'I&#039;ve always wanted to create a chat application by myself with no help, no youtube video and shit, doing what I understand ✅️\r\nnow it&#039;s mission accomplished ✌️✅️✅️', '657fa9bb54bce', '65a5e08022ae8', 'January 16, 2024 - 16:21', 'none'),
(65, '65a69f2137928/m/65a69f2137935', 'none', 'Now I need to learn how to encrypt messages and decrypt them, making an end to end encryption messaging✅️✅️', '657fa9bb54bce', '65a5e08022ae8', 'January 16, 2024 - 16:22', 'none'),
(66, '65a6a4aebc511/m/65a6a4aebc524', 'none', '.', '65802e7a99774', '65a6517d177c7', 'January 16, 2024 - 16:45', 'none'),
(67, '65a6a6066936d/m/65a6a60669379', 'none', 'Dope', '65802e7a99774', '65a5e08022ae8', 'January 16, 2024 - 16:51', 'none'),
(68, '65a6a60f19745/m/65a6a60f19752', 'none', 'Dnx', '65802e7a99774', '65a6517d177c7', 'January 16, 2024 - 16:51', 'none'),
(69, '65a6a61fea2e3/m/65a6a61fea2ee', 'none', '✅️✅️', '65802e7a99774', '65a5e08022ae8', 'January 16, 2024 - 16:51', 'none'),
(70, '65a6aa3fc205e/m/65a6aa3fc2068', 'none', 'Lil Emoji ❤️✌️', '65802e7a99774', '/65a6a9cf3e369/c/65a6a9cf3e37b', 'January 16, 2024 - 17:09', 'none'),
(72, '65a6aa847dc83/m/65a6aa847dc8e', 'none', 'Dnx?', '658f3b210be5e', '/65a6a9cf3e369/c/65a6a9cf3e37b', 'January 16, 2024 - 17:10', 'none'),
(73, '65a797be0b1b8/m/65a797be0b1d0', 'none', '', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 10:02', 'none'),
(74, '65a797dc147e1/m/65a797dc147ed', 'none', '', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 10:03', 'none'),
(75, '65a79817a32cd/m/65a79817a32d7', 'none', '', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 10:04', 'none'),
(76, '65a7baa01c156/m/65a7baa01c16f', 'none', 'Calling myself the greatest programmer lol', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 12:31', 'none'),
(78, '65a7ebea879be/m/65a7ebea879df', 'none', '????', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 16:02', 'none'),
(79, '65a7ebfce68b2/m/65a7ebfce68be', 'none', '123', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 16:02', 'none'),
(80, '65a7ef836a0ff/m/65a7ef836a10b', 'none', 'Okay I&#039;m seeing errors ', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 16:17', 'none'),
(81, '65a7efbaf0063/m/65a7efbaf007a', 'none', '123', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 16:18', 'none'),
(82, '65a7f1e80d15d/m/65a7f1e80d176', 'none', 'I&#039;ve always wanted to create a chat application by myself with no help, no youtube video and shit, doing what I understand ✅️\r\nnow it&#039;s mission accomplished ✌️✅️', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 16:27', 'none'),
(84, '65a7f2dfbb840/m/65a7f2dfbb84b', 'none', 'Lil ❤️✌️', '658e9ee249aca', 'abc/65a7f2d1c5938/c/65a7f2d1c5945', 'January 17, 2024 - 16:31', 'none'),
(86, '65a7fab187fa8/m/65a7fab187fb8', 'none', 'Ola', '65802e7a99774', '65a5e08022ae8', 'January 17, 2024 - 17:05', 'none'),
(87, '65a7facd37162/m/65a7facd3716c', 'none', '', '65802e7a99774', '65a5e08022ae8', 'January 17, 2024 - 17:05', 'none'),
(88, '65a7fcbaead8c/m/65a7fcbaeada5', 'none', '', '65802e7a99774', '65a5e08022ae8', 'January 17, 2024 - 17:13', 'none'),
(90, '65a7ffad0b21e/m/65a7ffad0b22a', 'none', 'By White Noah\r\n\r\nNew problem discovered and can be solved by ajax, I think\r\n\r\nWhen playing an audio, and you send a text, the audio stops as the page refreshes, and also, you&#039;re streaming the audio in this one cos it is not stored on the local device, so this is costly...\r\n\r\nDon&#039;t forget to add push notifications', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 17:26', 'none'),
(91, '65a800cae69e8/m/65a800cae6a00', 'none', 'Update on NSFAS payments\r\nnsfas\r\n\r\n17 January 2024\r\n\r\nFor the past 2 months, NSFAS has consistently referred to ongoing reconciliations before proceeding with any further payments in respect of 2023.  However, as of now, no reconciliation has been shared with the NWU.  In contrast,  the NWU has shared its reconciliation with NSFAS and is awaiting feedback from them.  We are eagerly awaiting their feedback, which they indicated will be by the end of business on 16 January.   Unfortunately, they requested extension of time and will meet with student finance officials at 15:00 on 17 January 2024.  \r\n\r\nAs soon as we receive the necessary information and approval from NSFAS, we will pay the outstanding allowances immediately even if we have to use the already constrained NWU funds. Please note that NSFAS owes the NWU R372m for 2023 and a further R108m for previous years, which you can understand put a lot of pressure on our cash flow.  Nevertheless, the NWU remains committed to assist students.\r\n\r\nThe principal and vice-chancellor, Prof Bismark Tyobeka is the chair of a special task team introduced by the Minister in the second week of January 2024 to work with NSFAS and the DHET representatives and try and get NSFAS issues resolved ASAP.  Once again, the NWU is actively involved in the sector to try and assist all the students and institutions and get outstanding matters resolved.\r\n\r\nThe NWU already in Dec 2023 applied for permission to pay out allowances for 2024 ourselves. We will push for this decision as hard as we can, but unfortunately have not received any feedback as yet.', '657fa9bb54bce', '65a5e08022ae8', 'January 17, 2024 - 17:31', 'none'),
(92, '65a8cc958854e/m/65a8cc9588567', 'none', 'Add wallpaper to chat✅️', '657fa9bb54bce', '65a5e08022ae8', 'January 18, 2024 - 8:00', 'none'),
(93, '65a8ebcc52f98/m/65a8ebcc52fab', 'none', 'You did it✅️', '65802e7a99774', '65a5e08022ae8', 'January 18, 2024 - 10:13', 'none'),
(94, '65a8ebde77502/m/65a8ebde7750d', 'none', 'Yes I did ✌️✌️', '657fa9bb54bce', '65a5e08022ae8', 'January 18, 2024 - 10:14', 'none'),
(95, '65a8ec5437ba7/m/65a8ec5437bb9', 'none', 'Lemme send you a movie✌️', '657fa9bb54bce', '65a5e08022ae8', 'January 18, 2024 - 10:16', 'none'),
(96, '65a8ecd134b0e/m/65a8ecd134b19', 'none', 'Failed,  need to limit file size to 30mb✌️ or 50mb', '657fa9bb54bce', '65a5e08022ae8', 'January 18, 2024 - 10:18', 'none'),
(98, '65a8ed1f8b453/m/65a8ed1f8b45e', 'none', 'Not that fast but at least, so need to limit to 30 then', '657fa9bb54bce', '65a5e08022ae8', 'January 18, 2024 - 10:19', 'none'),
(100, '65a8ee2233b36/m/65a8ee2233b43', 'none', 'Okay limit is 30mb', '657fa9bb54bce', '65a5e08022ae8', 'January 18, 2024 - 10:23', 'none'),
(101, '65a8eff839646/m/65a8eff83965e', 'none', 'Thought the problem was here, guess I was wrong', '657fa9bb54bce', '65a5e08022ae8', 'January 18, 2024 - 10:31', 'none'),
(105, '65a8f12c68f51/m/65a8f12c68f5d', 'none', 'Emojis work now, I changed the character set to utf8mb4 on the mysql server😂😂😂✌️😂😭😭', '657fa9bb54bce', '65a5e08022ae8', 'January 18, 2024 - 11:36', 'all'),
(107, '65a8f1d1d7a98/m/65a8f1d1d7ab6', 'none', '😂😂✌️', '65802e7a99774', '65a5e08022ae8', 'January 18, 2024 - 11:39', '657fa9bb54bce'),
(108, '65a8f1de45b5a/m/65a8f1de45b65', 'none', 'But it&#039;s slow now😭', '65802e7a99774', '65a5e08022ae8', 'January 18, 2024 - 11:39', '657fa9bb54bce'),
(110, '65a8f1ee1c154/m/65a8f1ee1c161', 'none', 'Okay it&#039;s fast nyana', '65802e7a99774', '65a5e08022ae8', 'January 18, 2024 - 11:39', '657fa9bb54bce'),
(114, '65a8f5c5eb429/m/65a8f5c5eb44c', 'none', '', '657fa9bb54bce', '65a5e08022ae8', 'January 18, 2024 - 11:56', 'all'),
(117, '65a927a98daa1/m/65a927a98daac', 'none', 'And users will have to download the files to their local device', '657fa9bb54bce', '65a5e08022ae8', 'January 18, 2024 - 15:29', 'all'),
(136, '703c3e66e3faa77m552662/f6/c60', 'none', '', '657fa9bb54bce', '0c7a3a1619c3f6a65f1f417796a6c9a6/a56573/7', 'January 23, 2024 - 9:35', 'none'),
(140, '5d56/a51c57f371fd30f/526cm0a5', 'none', 'Yess🥺❤️', '658f3b210be5e', 'abc/65a7f2d1c5938/c/65a7f2d1c5945', 'January 23, 2024 - 10:13', 'none'),
(141, 'f5143f6767/1m576a7d36/5a5d716', 'none', '..', '657fa9bb54bce', '65a5e08022ae8', 'January 23, 2024 - 10:18', 'all'),
(143, '1a1mb66fbb6689a/67bf6a/ab5975', 'none', 'No, it&#039;s a Lil bit better ✌️🔥❤️', '657fa9bb54bce', '65a5e08022ae8', 'January 23, 2024 - 14:04', '657fa9bb54bce'),
(144, '-42:80 a8,5ud0an8s65f2a/ga 5502 Je mrea68a0s75e223e/e3d0y21', '1a1mb66fbb6689a/67bf6a/ab5975', 'Reply??', '65802e7a99774', '65a5e08022ae8', 'January 23, 2024 - 18:05', 'none'),
(146, '422,3ey20487- 2u100sesf am55engJ6a38re8166a:aa/1/9a3  2e548', '65a800cae69e8/m/65a800cae6a00', 'Long text', '65802e7a99774', '65a5e08022ae8', 'January 23, 2024 - 18:17', '657fa9bb54bce'),
(149, '2e1/2 5 0fJ0e:6d,aeu361a6a g522e042 4-s88rae5ma/n2yaab7238s', '65a800cae69e8/m/65a800cae6a00', '.', '657fa9bb54bce', '65a5e08022ae8', 'January 23, 2024 - 18:21', 'none'),
(150, 'f1ba8e/e078y46225a7a5a-8eesa1J60eb26:sg0  ma355 r2u22b/ 2n,', '/7a0522e26 :3848f51a  a8ae/,y9en6ucJ2ba 550-ssr0g926aee18m2', '.', '657fa9bb54bce', '65a5e08022ae8', 'January 23, 2024 - 18:22', '657fa9bb54bce'),
(151, '0a852 m:r3824/fd-063aes /ba2neeJ415 07e26yea25u0,bgf28as a2', '2e1/2 5 0fJ0e:6d,aeu361a6a g522e042 4-s88rae5ma/n2yaab7238s', '.', '657fa9bb54bce', '65a5e08022ae8', 'January 23, 2024 - 18:22', '657fa9bb54bce'),
(152, '87mJ5/0y2 5152u 2060232/bgesc8ra5,eea 4a62-n03:1a204 a1eebs', '65a8eff839646/m/65a8eff83965e', '....', '657fa9bb54bce', '65a5e08022ae8', 'January 27, 2024 - 13:12', 'none'),
(153, '558aeae365s6 e u0ea68/b0r29s7ecbe642y23F/2aa-m:eg  r240572,', '65a8ee2233b36/m/65a8ee2233b43', '\r\n\r\n\r\n\r\n\r\nYeah\r\n\r\n', '65802e7a99774', '65a5e08022ae8', 'February 3, 2024 - 22:46', 'none'),
(154, 'b7422 fmefaFaar9g6a-3db69 63c33s/e48br7cuf s6aee6c632e//4,/2e 5aa59602/a5:yd', '65a6aa847dc83/m/65a6aa847dc8e', 'Nexx you?', '65802e7a99774', '/65a6a9cf3e369/c/65a6a9cf3e37b', 'February 3, 2024 - 22:48', 'none'),
(155, 'e5d00265b0a8g66esa4 2815yre5uF5r 82-s/e1c17c 902:a/ ,23e4ma', '558aeae365s6 e u0ea68/b0r29s7ecbe642y23F/2aa-m:eg  r240572,', 'What happened here?👀', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:52', 'none'),
(156, '252462eFue586m4a681,-fg0/5r8  b a82re00y7/5ac0s:899es203ea ', '65a8ecd134b0e/m/65a8ecd134b19', 'Need to change the modal for chat options 😭😭\r\nIt&#039;s not pleasant, not satisfying at all😭', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:53', 'none'),
(157, '483054me062:e,a4/01u635rb8 ssFe2a3 a6a/-0c78e5 5 yrgea92c26', 'none', 'Also the modal for media 📎 attachments ', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:53', 'none'),
(158, 'br9a 4 e6:0eaeFf-bg746,es51889//r560722e sea8a5 uc2y2a3m005', 'none', '❤️', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:57', 'none'),
(159, '1er715u-/ g0:42b15a568m29r423s 287ceaeF5d0/7s0y60,8 ceaa9 e', 'none', '44', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:57', 'none'),
(160, '95e6as,0/0a-adree626/02a75cg4a154220:ec 7by F8807ue8  m5ras', 'none', '100', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:57', 'none'),
(161, '65c- 8g2e50ub8/yc 60e4757r/0202a,5:2fa29r4aessed2Ffm187ea  ', 'none', '🔥', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:57', 'none'),
(162, '952ed3rF5a,r:2 y7/g au8e044 2b6-0846e/00a9 55c1aee70m288ss5', 'none', '✌️', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:57', 'none'),
(163, 'ea88s19 8yr250e60562a me5a/,7ea7c0s/F049ura 20g8 4ceb27:-f5', 'none', '📎', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:57', 'none'),
(164, '9d m413e0ecbes0268a0F-a58b2yub 6e4/ea d5a887/,08:sr 25gr502', 'none', 'Loopy', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:58', 'none'),
(165, '4y: es/2a59r91648c4e-8rb68g50u8,27s8eaa e2c0e6055 a08 mF/72', 'none', '✅️', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:58', 'none'),
(166, '-56r5eu9ba5s80460re/0Fs,ca:e1g e78a4522 2e809m02/  42ay06fe', 'none', 'Lethabo ', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:59', 'none'),
(167, ':a2 Fgu48e41b5ry5re0s50/m6835 -/,eesae 29daba8d772f690c 02e', 'none', 'Diiey', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:59', 'none'),
(168, '  68e,e6825emau08/aa2 ceer05ag-dF:907a6y51r2sb54s/60e296 24', 'none', 'Koki', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:59', 'none'),
(169, '1 F52earasm00:s808da4egabc60-2 d5e4 ue97y,r/5509c/fe62 8a2e', 'none', 'Yes', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 10:59', 'none'),
(170, '6840165 g0u 894a1-se0ca59f22bya1a08859s e/2F:d2rr,0me/a1ee ', 'none', '✅️✅️', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 11:10', 'none'),
(171, '8s8a s8e,a/41 5e-12cg0b42a uarrye0a29c0m8a211/a:aa 65F5ae6e', 'none', 'LETHABO', '657fa9bb54bce', '65a5e08022ae8', 'February 8, 2024 - 11:11', 'none'),
(172, ':a838rF2e61bc54-2 u401ea9  s5g 86aa0y5be,/a302er7ms6e4a2/41', 'none', ' echo&#039;&lt;/div&gt;\r\n            &#039;;\r\n            $arrContain = [&quot;a&quot;,&quot;b&quot;,&quot;c&quot;,&quot;d&quot;,&quot;e&quot;,&quot;f&quot;,&quot;g&quot;,&quot;h&quot;,&quot;i&quot;,&quot;j&quot;,&quot;k&quot;,&quot;l&quot;,&quot;m&quot;,&quot;n&quot;,&quot;o&quot;,&quot;p&quot;,&quot;q&quot;,&quot;r&quot;,&quot;s&quot;,&quot;t&quot;,&quot;u&quot;,&quot;v&quot;,&quot;w&quot;,&quot;x&quot;,&quot;y&quot;,&quot;z&quot;,&quot;0&quot;,&quot;1&quot;,&quot;2&quot;,&quot;3&quot;,&quot;4&quot;,&quot;5&quot;,&quot;6&quot;,&quot;7&quot;,&quot;8&quot;,&quot;9&quot;];\r\n            $contain = false;\r\n            for($p = 0; $p&lt;count($arrContain);$p++)\r\n            {\r\n              if(str_contains(strtolower($text),$arrContain[$p]))\r\n              {\r\n                $contain = true;\r\n              }\r\n            }\r\n            if(strlen($text)&lt;10 &amp;&amp; $contain == false)\r\n            {\r\n              echo&#039; &lt;pre style=&quot;font-size: 3rem&quot;&gt;&#039;;\r\n            }\r\n            else \r\n            {\r\n              echo&#039;&lt;pre&gt;&#039;;\r\n            }\r\n            echo&#039;&#039;.$text.&#039;&lt;/pre&gt;', '65802e7a99774', '65a5e08022ae8', 'February 8, 2024 - 11:14', 'none'),
(173, 'ue-8y 295:80e rs6b5e/,geF4ae12c028s40m8a1/5 a56aer126 1beca', ':a838rF2e61bc54-2 u401ea9  s5g 86aa0y5be,/a302er7ms6e4a2/41', 'BUG REPORT*********\r\n\r\nmust be wrapped within the message div must not overflow horizontally', '65802e7a99774', '65a5e08022ae8', 'February 8, 2024 - 11:15', 'none'),
(174, ' 1b5rbr:4/y0ega2d9/850 -1,mca esbb42652eae2a0uaeesF1 b86a86', '952ed3rF5a,r:2 y7/g au8e044 2b6-0846e/00a9 55c1aee70m288ss5', '💃', '65802e7a99774', '65a5e08022ae8', 'February 8, 2024 - 11:16', 'none'),
(175, 'b522c3-c81ae70c482ure0ae9g51 54,aF2ae/s6e 8 /8 6er102sym65:', 'none', '.', '65802e7a99774', '65a5e08022ae8', 'February 8, 2024 - 11:18', 'none'),
(176, ' -9 68180s01 e5ueesaa1c68/gr0aa5 /2Fer8514ecae:m,8422yb625e', 'none', '+', '65802e7a99774', '65a5e08022ae8', 'February 8, 2024 - 11:18', 'none'),
(177, 'r8426Fbea1a81sb8 -5e2210 88:a/c16c ac4e0egym6r/,c925s0u4e 5', 'none', '@)', '65802e7a99774', '65a5e08022ae8', 'February 8, 2024 - 11:18', 'none'),
(178, '5ac:1  4em56ae/ 8sgebae52582F20 d84ayr2008sa1,/ue-1e66bc29r', 'none', 'Bugs', '65802e7a99774', '65a5e08022ae8', 'February 8, 2024 - 11:18', 'none'),
(179, '700da9s/yL4c,11b-e/2614405a2e13Fco6r03pe1g02L2 rt4e 5 u3-2s8-i5d182:e3bo082y93ee 5ma', 'none', '👍 ', '657fa9bb54bce', '8o-i9e41230L24t58b1oc6p4L2e0101-20y35d', 'February 9, 2024 - 10:32', 'none'),
(180, '2d42 03mi9La6 1e2F526sa5pbee 4250923-rb4eoc:uo9-,20ce s2L6120/50y8ty67a/d39r64d4g60', 'none', '🔥🔥', '658f3b210be5e', '2io43263952y96L-50Lt26o000d48c62p1ebd', 'February 9, 2024 - 15:49', 'none'),
(181, 'e 9466m023e9a52y12ebg423y6 r06b10d 64-L6cF2-,42u8/599esaLocicpd2 6b12:5o5r0/0tsad75', 'none', 'Dnx?', '658f3b210be5e', '2io43263952y96L-50Lt26o000d48c62p1ebd', 'February 9, 2024 - 15:49', 'none'),
(182, '014a2a9 m58oopdye-/ b95-as3601s5Lu22e660r3dd0c254c4de5Fe2eb2r 2t6268g6i/c 2,dyL9:10', 'none', 'Nexx you??', '657fa9bb54bce', '2io43263952y96L-50Lt26o000d48c62p1ebd', 'February 9, 2024 - 15:51', 'none'),
(183, 'r12r3616b5oF-2590:ace8,2a2u/26ydm06g-6L5o 033ae9p2ec4s d622 5b904/y50 0iL52dd14sdet', 'none', '🔥🔥🔥', '657fa9bb54bce', '2io43263952y96L-50Lt26o000d48c62p1ebd', 'February 9, 2024 - 15:51', 'none'),
(184, '9o60/F-ec4,20e9410t:2366  5i62a3-d6bd905Lredob51sc L4p/c4260m504d7e228u5 1aysr29y2g', 'none', '💃', '657fa9bb54bce', '2io43263952y96L-50Lt26o000d48c62p1ebd', 'February 9, 2024 - 15:51', 'none'),
(185, 'g1fm6Ldt0L1 62 5429d2-c1i6fro5e2r/y0 aee1e8s-,24bop2c5sda 95u4/925246b60:602y330dF0', 'none', 'Great book🔥🔥💃💃', '657fa9bb54bce', '2io43263952y96L-50Lt26o000d48c62p1ebd', 'February 9, 2024 - 15:51', 'none'),
(186, ',541 b2d641eL9o52c:-2705072038ac60u9beb2-si63o62g/e22rye09484Fdt6  /0p e52ym5rL65as', 'g1fm6Ldt0L1 62 5429d2-c1i6fro5e2r/y0 aee1e8s-,24bop2c5sda 95u4/925246b60:602y330dF0', 'This one', '657fa9bb54bce', '2io43263952y96L-50Lt26o000d48c62p1ebd', 'February 9, 2024 - 15:52', 'none'),
(187, '80dayc/25096b018c/356eeL5sairo566e4b2Fsut6 212pm9y5c2,624bg-dor21L0 4e02290 2 -33e:', 'none', '', '657fa9bb54bce', '2io43263952y96L-50Lt26o000d48c62p1ebd', 'February 9, 2024 - 15:52', 'none'),
(188, '9/c se:506ee08025ee46aau5622re1aab4d 8,Fm c29 e285syrg-225/', 'none', '', '657fa9bb54bce', '65a5e08022ae8', 'February 9, 2024 - 15:52', 'none'),
(189, ' a6e24a282r:8a025 5a22s5r0 5ey5/8s5bmc1-F9c6eu6be ,e0g36a/e', 'none', 'Files cannot be shared anymore in Chat, fix that 😭', '657fa9bb54bce', '65a5e08022ae8', 'February 9, 2024 - 15:52', 'none'),
(190, ' 6a2saFa2 38cr5e534a5er65,0 e/06su6250e6526b1/m9eg28e0 b:y-', 'none', 'I don&#039;t know why files can&#039;t be shared yoh yoh yoh yoh', '657fa9bb54bce', '65a5e08022ae8', 'February 9, 2024 - 15:53', 'none'),
(191, '609fe41u5gc516 mee /5F2,a2be8/ r8s0- yber2924sa:66ae52750ea', 'none', '', '657fa9bb54bce', '65a5e08022ae8', 'February 9, 2024 - 15:54', 'none'),
(192, 'c4sa02/ d3/85r6113275Fga- a01: 8eyb6 ,saree008mc2dea2eu5784', 'none', '', '65802e7a99774', '65a5e08022ae8', 'February 10, 2024 - 8:33', 'none'),
(193, 'eg/9ac5a10a760e4527meda5e8s6s26/8ec', 'none', '', '65802e7a99774', '65a5e08022ae8', 'February 10, 2024 - 8:37', 'none'),
(194, 's60858see21a70/gace50be2m96a/522e8c', 'none', '', '65802e7a99774', '65a5e08022ae8', 'February 10, 2024 - 8:37', 'none'),
(196, '5/6a5a3sea8e62252/0se8m2afcaecg0a96', 'none', '', '65802e7a99774', '65a5e08022ae8', 'February 12, 2024 - 12:27', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `post_id`, `text`, `user_id`, `date`) VALUES
(36, '/65a1a3b73d024/657fa9bb54bce', '!!!UPDATE!!!\r\n\r\n*I have now created the text post, added some other features too, it is a multi file + text post\r\n*Now files of any type can be shared along with text, however you want to share, there are no limits(or so I think)\r\n\r\n!!UPDATES COMING SOON!!\r\n*An algorithm to not display the posts and products in linear form, they must be changed when I refresh the page... still confused now but I will find a way\r\n*I will be working on the chat feature sometime\r\n\r\nIn the meantime I will try to focus on fixing BANKYIO since I have linked LoopyLite and Bankyio, and since bankyio has some great games/features', '657fa9bb54bce', '2024-01-14 06:28:17'),
(35, '/65a1a1fab3121/65802e7a99774', 'Sample videos❤️', '65802e7a99774', '2024-01-14 06:28:17'),
(34, '/65a1858f039be/658e9ee249aca', 'Multi file post?hell yeah\r\nThis is cool isn&#039;t it?\r\n@Lethabo Maepa, I&#039;m loving this', '658e9ee249aca', '2024-01-14 06:28:17'),
(33, '/65a17ddcd8fcd/657fa9bb54bce', '', '657fa9bb54bce', '2024-01-14 06:28:17'),
(32, '/65a17a5cd6103/657fa9bb54bce', 'Trying out a post with multiple files of different formats ', '657fa9bb54bce', '2024-01-14 06:28:17'),
(38, '/65a1a7caec593/657fa9bb54bce', 'SQL TESTING\r\n\r\n\r\n$sql = &quot;DELETE * FROM posts&quot;;\r\n\r\nLOL✌️', '657fa9bb54bce', '2024-01-14 06:28:17'),
(40, '/65a1b02228862/657fa9bb54bce', 'Mxaah I have made a random algorithm, it&#039;s not complex enough to be called an algorithm but it works for now...\r\n\r\n**LOGIC**\r\nI created an array of 2 strings, being &quot;post&quot; and &quot;product&quot;, then I used a while loop, to run while not all items are displayed, in the while loop I shuffled the array and chose the first element on the array, then display the nth element on the array of the chosen item, can be post or product...then repeat the process until the last item is displayed, until every item has been displayed, when the user refreshes the pages, it shuffles the post and product array to make sort the items in a different way, so that the page can change from time to time... simple and boring but at least it works, next I will try to display items based on user&#039;s info, searches, posts and all that.\r\n', '657fa9bb54bce', '2024-01-14 06:28:17'),
(41, '/65a3d5972562e/658e9ee249aca', 'Life✌️????', '658e9ee249aca', '2024-01-14 12:37:43'),
(42, '/65a6309fb49c2/657fa9bb54bce', '!!UPDATE!!\r\n\r\nAdded a chat feature using php, the problem is that it is not real time, therefore I will implement ajax for this in later stages, but for now...everything works accordingly.✅️✅️✌️', '657fa9bb54bce', '2024-01-16 07:30:39'),
(43, '/65a7fa77889e4/65802e7a99774', 'By Kokie', '65802e7a99774', '2024-01-17 16:04:07'),
(44, '/65a802941340b/657fa9bb54bce', 'Update on NSFAS payments\r\nnsfas\r\n\r\n17 January 2024\r\n\r\nFor the past 2 months, NSFAS has consistently referred to ongoing reconciliations before proceeding with any further payments in respect of 2023.  However, as of now, no reconciliation has been shared with the NWU.  In contrast,  the NWU has shared its reconciliation with NSFAS and is awaiting feedback from them.  We are eagerly awaiting their feedback, which they indicated will be by the end of business on 16 January.   Unfortunately, they requested extension of time and will meet with student finance officials at 15:00 on 17 January 2024.  \r\n\r\nAs soon as we receive the necessary information and approval from NSFAS, we will pay the outstanding allowances immediately even if we have to use the already constrained NWU funds. Please note that NSFAS owes the NWU R372m for 2023 and a further R108m for previous years, which you can understand put a lot of pressure on our cash flow.  Nevertheless, the NWU remains committed to assist students.\r\n\r\nThe principal and vice-chancellor, Prof Bismark Tyobeka is the chair of a special task team introduced by the Minister in the second week of January 2024 to work with NSFAS and the DHET representatives and try and get NSFAS issues resolved ASAP.  Once again, the NWU is actively involved in the sector to try and assist all the students and institutions and get outstanding matters resolved.\r\n\r\nThe NWU already in Dec 2023 applied for permission to pay out allowances for 2024 ourselves. We will push for this decision as hard as we can, but unfortunately have not received any feedback as yet.', '657fa9bb54bce', '2024-01-17 16:38:44'),
(45, '/65a8f40e8e489/65802e7a99774', 'Xxxtentaciano', '65802e7a99774', '2024-01-18 09:49:02'),
(46, '/65a8f532c1d8d/657fa9bb54bce', 'Squid game Episode 08🔥🔥🔥', '657fa9bb54bce', '2024-01-18 09:53:56'),
(47, '/65a8f536d134d/65802e7a99774', 'Squid Game Episode 05🔥🔥\r\n', '65802e7a99774', '2024-01-18 09:54:16'),
(48, 'e56116058d15b3eefab58/b5b/62', 'Download bootstrap tutorial ', '658f3b210be5e', '2024-01-28 09:27:55'),
(49, '6b0c5//6218576c2e38fbcebc5fe', 'Need to get this book🔥', '658f3b210be5e', '2024-02-09 13:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `item_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `price` varchar(20) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `specifications` text CHARACTER SET utf8 NOT NULL,
  `category` varchar(255) CHARACTER SET utf8 NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `item_id`, `user_id`, `name`, `price`, `description`, `specifications`, `category`, `image`, `date_added`) VALUES
(12, '658bef5614534', '6586bc39b02c7', ' Itel A49 ', '999', 'Get yourself a great and fast smartphone at a low price from us, &lt;b&gt;BUY NOW&lt;/b&gt;.', '6inch smartphone \r\n2GB RAM\r\n4000mAh battery capacity\r\n16GB storage\r\n4G dual sim network\r\nUSB 2.0 fast charger\r\n', 'Cellular', 'assets/images/client/products/658bef55f33e4.jpg', '2023-12-27 09:33:10'),
(10, '6589bf9d68190', '65802e7a99774', 'Shaped Ice', '25', 'Shapes of ice, butterfly and more', 'Gggg', 'Home appliances', 'assets/images/client/products/6589bf9d35389.jpg', '2023-12-25 17:45:01'),
(11, '658aa91ab5030', '657fa9bb54bce', '4th Street Wine', '130', 'Enjoyed best with family and friends during your December festives', 'Blahn\r\nEnjoyed best with family and friends during your December festives\r\n5Litre\r\nRed wine', 'Outdoor', 'assets/images/client/products/658aa91aa4c60.jpg', '2023-12-26 10:21:14'),
(14, '658c5e87a52f6', '65802e7a99774', 'All Biscuits', '60', 'Get this full pack of biscuits just for you this December, they are more like choice assorted but they are the same kind and very delicious. Buy now!', 'Get this full pack of biscuits just for you this December, they are more like choice assorted but they are the same kind and very delicious. Buy now!', 'Snacks', 'assets/images/client/products/658c5e87911ad.jpg', '2023-12-27 17:27:35'),
(15, '658ea9bd7f086', '658e9ee249aca', 'Laptop and Smartphone', '10999', 'I&#039;m selling this combo at R 10 999, it includes:\r\n\r\nLaptop: \r\n8GB RAM\r\n512GB SSD storage\r\nIntel i5 3rd Gen\r\n\r\nSmartphone:\r\n3GB RAM\r\n32GB storage\r\n6inch \r\nBack camera 16MP\r\nFront Camera 8MP', 'I&#039;m selling this combo at R 10 999, it includes:\r\n\r\nLaptop: \r\n8GB RAM\r\n512GB SSD storage\r\nIntel i5 3rd Gen\r\n\r\nSmartphone:\r\n3GB RAM\r\n32GB storage\r\n6inch \r\nBack camera 16MP\r\nFront Camera 8MP', 'Computers &amp; Equipments', 'assets/images/client/products/658ea9bd6fb34.jpg', '2023-12-29 11:13:01'),
(23, '65aceb1803218', '657fa9bb54bce', 'Solution Rope', '50', 'A strong rope?✅️', 'A strong rope?✅️', 'Outdoor', 'assets/images/client/products/65aceb17e4f20.jpg', '2024-01-21 09:59:52'),
(24, '65acebbf68896', '657fa9bb54bce', 'Casio Calculator ', '259', 'For your maths exams and activities, trust Casio to provide you with the clues and answers, it&#039;s battery can last longer than that of other calculators, TRUST CASIO.✅️✅️', 'For your maths exams and activities, trust Casio to provide you with the clues and answers, it&#039;s battery can last longer than that of other calculators, TRUST CASIO.✅️✅️', 'Computers &amp; Equipments', 'assets/images/client/products/65acebbf5ac1e.jpg', '2024-01-21 10:02:39'),
(20, '659427f5c1105', '65802e7a99774', 'Fried Eggs', '15', 'Fried eggs custom shapes R15 per plate❤️', 'Fried eggs custom shapes R15 per plate❤️', 'Snacks', 'assets/images/client/products/659427f5a7101.png', '2024-01-02 15:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `review` text CHARACTER SET utf8 NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `review`, `date`) VALUES
(0, '657fa9bb54bce', '658bef5614534', 'Great', '2023-12-27 17:07:28'),
(0, '657fa9bb54bce', '6589bf9d68190', 'I don&#039;t understand why I can&#039;t use emojis ', '2023-12-27 17:10:28'),
(0, '657fa9bb54bce', '6589bf9d68190', 'Like for real I don&#039;t understand ', '2023-12-27 17:10:40'),
(0, '6586bc39b02c7', '6589bf9d68190', 'Bro it sucks ', '2023-12-27 17:15:23'),
(0, '65802e7a99774', '6589bf9d68190', 'Ehh byanong dnx on my product ad? Dnx why lesa comment pila?mxaah ', '2023-12-27 17:16:40'),
(0, '65802e7a99774', '6589bf9d68190', 'But yah @Lethabo, o bolela nnete.\r\nThe database engine needs to be changed to something that will allow the use of emojis✌️', '2023-12-27 17:18:38'),
(0, '65802e7a99774', '658aa91ab5030', 'Awesome stuff✌️, Just followed you', '2023-12-27 17:20:09'),
(0, '657fa9bb54bce', '658c5e87a52f6', 'Great stuff, but I&#039;d rather buy choice assorted cos there are different flavors there.✌️', '2023-12-27 17:29:20'),
(0, '657fa9bb54bce', '6589bf9d68190', 'Yeah I&#039;ll see what I can do, if I fail, I&#039;ll buy data and search or ask our fellow ai guy chatgpt', '2023-12-27 17:35:08'),
(0, '65802e7a99774', '658c5e87a52f6', 'Ah waflopa wena', '2023-12-27 17:37:18'),
(0, '65802e7a99774', '658c5e87a52f6', '', '2023-12-27 17:40:18'),
(0, '6586bc39b02c7', '658c5e87a52f6', 'Me too @Lethabo', '2023-12-27 17:44:46'),
(0, '658c6305b0c4d', '658aa91ab5030', 'I&#039;m your new follower', '2023-12-27 17:48:05'),
(0, '657fa9bb54bce', '658aa91ab5030', 'Thank you guys✌️', '2023-12-27 17:50:22'),
(0, '6586bc39b02c7', '658aa91ab5030', 'I&#039;m your number one follower✌️@Lethabo ', '2023-12-27 20:55:49'),
(0, '65802e7a99774', '658aa91ab5030', 'A new comment', '2023-12-28 16:03:27'),
(0, '657fa9bb54bce', '658ea9bd7f086', 'I&#039;m buying this', '2023-12-29 11:14:05'),
(0, '658e9ee249aca', '658ea9bd7f086', '@Lethabo Maepa, thank you ❤️', '2023-12-29 11:15:18'),
(0, '657fa9bb54bce', '658ea9bd7f086', '❤️❤️', '2023-12-29 11:21:17'),
(0, '658e9ee249aca', '658f11a912155', 'Wow❤️❤️❤️❤️❤️❤️', '2023-12-29 18:37:49'),
(0, '657fa9bb54bce', '6589bf9d68190', 'I have changed my database charset/collation to utf8mb4 which supposedly supports emojis but I still can&#039;t use all emojis, but I will continue trying and trying until I get it, in the meantime I should add other features to this web app.', '2023-12-29 18:50:49'),
(0, '657fa9bb54bce', '6589bf9d68190', 'Need to do the following:\r\n1. Delete and Edit reviews\r\n', '2023-12-29 18:51:48'),
(0, '657fa9bb54bce', '6589bf9d68190', '2. Add a chat feature.', '2023-12-29 18:55:00'),
(0, '657fa9bb54bce', '6589bf9d68190', '3. Notifications feature.', '2023-12-29 18:55:17'),
(0, '657fa9bb54bce', '6589bf9d68190', 'I might change the functionality/purpose of this web app.', '2023-12-29 18:55:58'),
(0, '657fa9bb54bce', '6589bf9d68190', 'Allow user posts, text posts that do not force you to upload a picture, more like Facebook, might add videos as another feature.', '2023-12-29 18:57:06'),
(0, '658f3b210be5e', '6589bf9d68190', '✌️✌️', '2023-12-29 21:37:50'),
(0, '65802e7a99774', '659296a123a88', 'A remote, R50?', '2024-01-02 09:17:55'),
(0, '657fa9bb54bce', '6593df0606a97', 'Dope stuff, buy it now!!', '2024-01-02 10:06:21'),
(0, '65802e7a99774', '6593df0606a97', 'Cool✌️', '2024-01-02 10:08:08'),
(0, '657fa9bb54bce', '6589bf9d68190', 'Added new feature.', '2024-01-02 10:26:59'),
(0, '65802e7a99774', '6593df0606a97', 'I love this playlist, it has almost all his songs, from hell naw to some recent releases, this is the ultimate playlist for an average follower/fan of Nasty C, otherwise, I don&#039;t think it should have been for sale you know? Like for real✌️', '2024-01-02 10:29:37'),
(0, '6586bc39b02c7', '6593df0606a97', 'This is a great playlist, @lethabo well done, and shout out to the man himself, Nasty C for giving us these songs ✌️✌️✌️✌️❤️', '2024-01-02 10:35:50'),
(0, '658e9ee249aca', '6593df0606a97', 'Greatest hits of 2022 from nasty c❤️❤️', '2024-01-02 14:59:15'),
(0, '657fa9bb54bce', '6593df0606a97', 'Yeah Diiey❤️❤️', '2024-01-03 11:40:59'),
(0, '65802e7a99774', '6593df0606a97', '', '2024-01-06 19:21:51'),
(0, '657fa9bb54bce', '659a8d17ed222', 'Will start soon...', '2024-01-07 11:38:14'),
(0, '657fa9bb54bce', '659a8d17ed222', 'Users can now link LoopyLite Account with Bankyio, meaning if users are lazy to create a Bankyio account, they can choose to login with LoopyLite and their LoopyLite info will be shared to Bankyio.', '2024-01-10 16:53:41'),
(0, '657fa9bb54bce', '659a8d17ed222', 'A feature for adding text posts here on LoopyLite will be available soon', '2024-01-10 16:54:50'),
(0, '657fa9bb54bce', '659ecc285afbf', 'I did say I will add text posts, on top of that I made it a multi file post functionality/feature...', '2024-01-12 20:54:11'),
(0, '657fa9bb54bce', '659ecc285afbf', '??✌️✅️', '2024-01-20 09:51:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_wallpaper`
--
ALTER TABLE `chat_wallpaper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `chat_wallpaper`
--
ALTER TABLE `chat_wallpaper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"angular\",\"relation_lines\":\"false\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"LoopyLite\",\"table\":\"files\"},{\"db\":\"PyDex\",\"table\":\"sites\"},{\"db\":\"Bankyio\",\"table\":\"lottery\"},{\"db\":\"Bankyio\",\"table\":\"users\"},{\"db\":\"LoopyLite\",\"table\":\"messages\"},{\"db\":\"LoopyLite\",\"table\":\"chat_wallpaper\"},{\"db\":\"LoopyLite\",\"table\":\"chats\"},{\"db\":\"LoopyLite\",\"table\":\"post\"},{\"db\":\"Bankyio\",\"table\":\"stocks\"},{\"db\":\"Bankyio\",\"table\":\"beneficiaries\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'LoopyLite', 'files', '{\"sorted_col\":\"`files`.`id` DESC\"}', '2024-02-10 06:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-02-14 09:36:46', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `PyDex`
--
CREATE DATABASE IF NOT EXISTS `PyDex` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `PyDex`;

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `lastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `name`, `description`, `url`, `lastModified`, `dateCreated`) VALUES
(1, 'Bankyio Bank', 'Banking app by Lethabo Maepa with a lot of different features, Lottery, stocks, profile and more', 'Bankyio/index.php', '2023-12-05 17:34:46', '2023-12-24 17:34:46'),
(2, 'Html Editor', 'This editor is still in its development stages but I do not think I will continue building on it anymore, it still has bugs.', 'Practices/Editor.html', '2023-12-05 21:16:20', '2023-12-05 21:16:20'),
(3, 'Login Animation', 'A practical example of a cool animation of the login/sign up page.', 'Practices/LoginAnimation.html', '2023-12-05 21:16:20', '2023-12-05 21:16:20'),
(4, 'Deal or No Deal', 'Deal or no deal game created using html,css and Javascript, it is not complete yet.', 'Games/homepage.html', '2023-12-06 05:46:29', '2023-12-06 05:46:29'),
(5, 'Tic Tac Toe', 'A simple X-O tic tac toe game, the game is based on Javascript but it is not yet complete too', 'Games/XOHome.html', '2023-12-06 05:46:29', '2023-12-06 05:46:29'),
(6, 'C++ Exam Practice 2023', 'C++ practice for cmpg121 module final exam 2nd semester 2023.\r\nIt\'s a folder.', 'c++/PracticeExam', '2023-12-06 21:08:11', '2023-12-06 21:08:11'),
(7, 'binary files c++', 'A practical example of c++ binary files ', 'c++/binary (2).cpp', '2023-12-06 21:08:11', '2023-12-06 21:08:11'),
(8, 'tic tac toe using c++', 'A tic tac toe game tried on c++', 'c++/tic tac toe7.cpp', '2023-12-06 21:11:14', '2023-12-06 21:11:14'),
(9, 'Python simple investment program ', 'A python program for investment ', 'python/LLinvestment.py', '2023-12-06 21:13:52', '2023-12-06 21:13:52'),
(10, 'microbit-Temperature-datalogger', 'microbit-Temperature-datalogger file for microbit.', 'python/microbit-Temperature-datalogger.hex', '2023-12-06 21:13:52', '2023-12-06 21:13:52'),
(11, 'PyDEX', 'A small search engine or rather search program by Lethabo Maepa for easy access of all his projects connected to this server. Languages: HTML,CSS, JS, PHP and SQL. First ran on Samsung A04e Android via KSWEB.', 'index.php', '2023-12-06 21:48:44', '2023-12-06 21:48:44'),
(12, 'LoopyLite', 'LoopyLite is an online market store for different kinds of stores selling or advertising different kinds of products, from cellular to food, fashion wear and accessories and more.', 'LoopyLite/index.php', '2023-12-11 13:38:43', '2023-12-08 13:38:43'),
(13, 'Time', 'View real-time, countdown or anything related to time ', 'Practices/time.html', '2024-01-28 19:39:20', '2024-01-28 19:39:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
