-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 06, 2018 at 04:06 PM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arlem`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `id` int(11) NOT NULL,
  `id_name` varchar(150) NOT NULL,
  `viewport` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `instructionTitle` varchar(150) DEFAULT NULL,
  `instructionDescription` text,
  `author` int(11) NOT NULL,
  `activity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `id_name`, `viewport`, `name`, `instructionTitle`, `instructionDescription`, `author`, `activity`, `created_at`, `modified_at`) VALUES
(1, '', 3, 'Kale Cummerata', '8', '', 1, 1, '1973-05-19 06:57:03', '2018-02-15 11:05:23'),
(2, '', 1, 'Silas Hayes', '3', '', 1, 9, '1980-09-03 06:54:33', '1998-05-08 22:50:44'),
(3, '', 2, 'Melisa Konopelski', '4', '', 2, 4, '1995-03-08 22:45:30', '1991-09-19 10:43:22'),
(4, '', 1, 'Madelyn Leuschke MD', '9', '', 1, 7, '1985-12-25 23:34:26', '1991-10-29 18:02:43'),
(5, '', 2, 'Miss Julia Grant III', '10', '', 1, 3, '1985-12-28 08:50:39', '2016-11-23 21:29:52'),
(6, '', 3, 'Prof. Maryam Auer Jr.', '7', '', 1, 6, '2003-08-29 00:07:51', '1999-05-20 22:35:48'),
(7, '', 1, 'Adolf O''Kon', '5', '', 2, 5, '1990-05-12 12:38:35', '1985-08-28 18:10:22'),
(8, '', 3, 'Lempi Schaden', '7', '', 2, 1, '1994-02-16 09:09:01', '1988-12-01 14:47:10'),
(9, '', 2, 'Dr. Jordyn Carter V', '1', '', 2, 1, '1988-07-15 14:58:00', '2018-02-15 11:05:20'),
(10, '', 2, 'Dr. David Roob', '6', '', 1, 5, '1979-11-22 20:15:57', '2008-08-06 15:25:42'),
(11, 'daf', 2, 'asdf', 'asdfasdf', '', 3, 12, '2018-05-14 15:31:32', '2018-05-14 15:31:32'),
(12, 'daf', 2, 'asdf', 'asdfasdf', '', 3, 13, '2018-05-14 15:56:10', '2018-05-14 15:56:10'),
(13, 'daf', 2, 'asdf', 'asdfasdf', '', 3, 14, '2018-05-14 15:56:43', '2018-05-14 15:56:43'),
(14, 'daf', 2, 'asdf', 'asdfasdf', '', 3, 15, '2018-05-14 15:57:12', '2018-05-14 15:57:12'),
(15, 'daf', 2, 'asdf', 'asdfasdf', '', 3, 16, '2018-05-14 15:57:51', '2018-05-14 15:57:51'),
(16, 'daf', 2, 'asdf', 'asdfasdf', '', 3, 17, '2018-05-14 15:58:26', '2018-05-14 15:58:26'),
(17, 'daf', 2, 'asdf', 'asdfasdf', '', 3, 18, '2018-05-14 15:58:41', '2018-05-14 15:58:41'),
(18, 'daf', 2, 'asdf', 'asdfasdf', '', 3, 19, '2018-05-14 15:59:47', '2018-05-14 15:59:47'),
(19, 'OK VAORK', 3, 'test', 'test', '', 3, 19, '2018-05-14 15:59:47', '2018-05-14 15:59:47'),
(20, 'third', 0, 'est', 'test', '', 3, 19, '2018-05-14 15:59:48', '2018-05-14 15:59:48'),
(21, 'daf', 2, 'asdf', 'asdfasdf', '', 3, 20, '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(22, 'OK VAORK', 3, 'test', 'test', '', 3, 20, '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(23, 'third', 0, 'est', 'test', '', 3, 20, '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(24, 'test', 1, 'test', 'test', '', 3, 21, '2018-05-14 16:13:34', '2018-05-14 16:13:34'),
(25, 'action1', 1, 'Action 1', 'Action One', '', 3, 22, '2018-07-02 13:21:42', '2018-07-02 13:21:42'),
(26, 'action2', 0, 'Action 2', 'Action 2', '', 3, 22, '2018-07-02 13:21:42', '2018-07-02 13:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `action_triggers`
--

CREATE TABLE IF NOT EXISTS `action_triggers` (
  `id` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `mode` tinyint(4) NOT NULL,
  `remove` char(1) NOT NULL DEFAULT 'n',
  `type` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `action_triggers`
--

INSERT INTO `action_triggers` (`id`, `action`, `mode`, `remove`, `type`, `value`, `created_at`, `modified_at`) VALUES
(1, 1, 1, 'n', '', '', '2018-05-14 11:50:11', '0000-00-00 00:00:00'),
(2, 8, 1, 'n', '', '', '2018-05-14 11:50:11', '0000-00-00 00:00:00'),
(3, 9, 3, 'n', '', '', '2018-05-14 11:50:11', '0000-00-00 00:00:00'),
(4, 1, 3, 'n', '', '', '2018-05-14 11:50:11', '0000-00-00 00:00:00'),
(5, 8, 2, 'n', '', '', '2018-05-14 11:50:11', '0000-00-00 00:00:00'),
(6, 9, 2, 'n', '', '', '2018-05-14 11:50:11', '0000-00-00 00:00:00'),
(7, 9, 1, 'n', '', '', '2018-05-14 11:50:11', '0000-00-00 00:00:00'),
(8, 10, 1, 'n', '', '', '2018-05-14 11:50:11', '0000-00-00 00:00:00'),
(9, 8, 3, 'n', '', '', '2018-05-14 11:50:11', '0000-00-00 00:00:00'),
(10, 5, 2, 'n', '', '', '2018-05-14 11:50:11', '0000-00-00 00:00:00'),
(11, 12, 1, 'y', '', '', '2018-05-14 15:56:10', '2018-05-14 15:56:10'),
(12, 13, 1, 'y', '', '', '2018-05-14 15:56:43', '2018-05-14 15:56:43'),
(13, 14, 1, 'y', '', '', '2018-05-14 15:57:12', '2018-05-14 15:57:12'),
(14, 15, 1, 'y', '', '', '2018-05-14 15:57:51', '2018-05-14 15:57:51'),
(15, 15, 2, 'y', '', '', '2018-05-14 15:57:51', '2018-05-14 15:57:51'),
(16, 15, 5, 'y', '', '', '2018-05-14 15:57:51', '2018-05-14 15:57:51'),
(17, 16, 1, 'y', '', '', '2018-05-14 15:58:26', '2018-05-14 15:58:26'),
(18, 16, 2, 'y', '', '', '2018-05-14 15:58:26', '2018-05-14 15:58:26'),
(19, 16, 5, 'y', '', '', '2018-05-14 15:58:26', '2018-05-14 15:58:26'),
(20, 17, 1, 'y', '', '', '2018-05-14 15:58:41', '2018-05-14 15:58:41'),
(21, 17, 2, 'y', '', '', '2018-05-14 15:58:41', '2018-05-14 15:58:41'),
(22, 17, 5, 'y', '', '', '2018-05-14 15:58:41', '2018-05-14 15:58:41'),
(23, 18, 1, 'y', '', '', '2018-05-14 15:59:47', '2018-05-14 15:59:47'),
(24, 18, 2, 'y', '', '', '2018-05-14 15:59:47', '2018-05-14 15:59:47'),
(25, 18, 5, 'y', '', '', '2018-05-14 15:59:47', '2018-05-14 15:59:47'),
(26, 19, 1, 'n', '', '', '2018-05-14 15:59:48', '2018-05-14 15:59:48'),
(27, 19, 2, 'y', '', '', '2018-05-14 15:59:48', '2018-05-14 15:59:48'),
(28, 19, 3, 'y', '', '', '2018-05-14 15:59:48', '2018-05-14 15:59:48'),
(29, 20, 1, 'y', '', '', '2018-05-14 15:59:48', '2018-05-14 15:59:48'),
(30, 20, 2, 'y', '', '', '2018-05-14 15:59:48', '2018-05-14 15:59:48'),
(31, 21, 1, 'y', '', '', '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(32, 21, 2, 'y', '', '', '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(33, 21, 5, 'y', '', '', '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(34, 22, 1, 'n', '', '', '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(35, 22, 2, 'y', '', '', '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(36, 22, 3, 'y', '', '', '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(37, 23, 1, 'y', '', '', '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(38, 23, 2, 'y', '', '', '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(39, 24, 1, 'y', '', '', '2018-05-14 16:13:34', '2018-05-14 16:13:34'),
(40, 24, 2, 'y', '', '', '2018-05-14 16:13:34', '2018-05-14 16:13:34'),
(41, 25, 1, 'y', '', '', '2018-07-02 13:21:42', '2018-07-02 13:21:42'),
(42, 25, 2, 'y', '', '', '2018-07-02 13:21:42', '2018-07-02 13:21:42'),
(43, 25, 4, 'y', 'XOR', '0', '2018-07-02 13:21:42', '2018-07-02 13:40:14'),
(44, 26, 1, 'y', '', '', '2018-07-02 13:21:42', '2018-07-02 13:21:42'),
(45, 26, 2, 'y', '', '', '2018-07-02 13:21:42', '2018-07-02 13:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `action_trigger_modes`
--

CREATE TABLE IF NOT EXISTS `action_trigger_modes` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `action_trigger_modes`
--

INSERT INTO `action_trigger_modes` (`id`, `name`) VALUES
(1, 'enter'),
(2, 'exit'),
(3, 'click'),
(4, 'detect'),
(5, 'sensor');

-- --------------------------------------------------------

--
-- Table structure for table `action_trigger_operations`
--

CREATE TABLE IF NOT EXISTS `action_trigger_operations` (
  `id` int(11) NOT NULL,
  `actionTrigger` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'y',
  `entityType` varchar(45) NOT NULL,
  `entityId` int(11) NOT NULL,
  `predicate` tinyint(4) DEFAULT NULL,
  `poi` varchar(45) DEFAULT NULL,
  `options` text,
  `viewport` int(11) DEFAULT NULL,
  `sensor` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `action_trigger_operations`
--

INSERT INTO `action_trigger_operations` (`id`, `actionTrigger`, `is_active`, `entityType`, `entityId`, `predicate`, `poi`, `options`, `viewport`, `sensor`, `created_at`, `modified_at`) VALUES
(1, 13, 'Y', 'Person', 5, 0, 'Y', NULL, NULL, 6, '2018-05-14 15:57:12', '2018-06-12 18:13:34'),
(2, 14, 'Y', 'Person', 5, 0, 'Y', NULL, NULL, 6, '2018-05-14 15:57:51', '2018-06-12 18:13:34'),
(3, 17, 'y', 'Person', 5, 0, 'Y', NULL, NULL, 6, '2018-05-14 15:58:26', '2018-06-12 18:13:34'),
(4, 20, 'y', 'Person', 5, 0, 'Y', NULL, NULL, 6, '2018-05-14 15:58:41', '2018-06-12 18:13:34'),
(5, 23, 'y', 'Person', 5, 0, 'Y', '', 0, 6, '2018-05-14 15:59:47', '2018-06-12 18:13:34'),
(6, 25, 'n', '', 0, 0, '', 'yest', 0, 6, '2018-05-14 15:59:47', '2018-06-12 18:13:34'),
(7, 26, 'y', 'Thing', 7, 0, 'Y', '', 0, 6, '2018-05-14 15:59:48', '2018-06-12 18:13:34'),
(8, 28, 'n', '', 0, 0, '', '', 2, 6, '2018-05-14 15:59:48', '2018-06-12 18:13:34'),
(9, 29, 'y', 'Person', 5, 0, 'Y', '', 0, 6, '2018-05-14 15:59:48', '2018-06-12 18:13:34'),
(10, 31, 'y', 'Person', 5, 0, 'Y', '', 0, 6, '2018-05-14 16:00:13', '2018-06-12 18:13:34'),
(11, 33, 'n', '', 0, 0, '', 'yest', 0, 6, '2018-05-14 16:00:13', '2018-06-12 18:13:34'),
(12, 34, 'y', 'Thing', 7, 0, 'Y', '', 0, 6, '2018-05-14 16:00:13', '2018-06-12 18:13:34'),
(13, 36, 'n', '', 0, 0, '', '', 2, 6, '2018-05-14 16:00:13', '2018-06-12 18:13:34'),
(14, 37, 'y', 'Person', 5, 0, 'Y', '', 0, 6, '2018-05-14 16:00:13', '2018-06-12 18:13:34'),
(15, 39, 'y', 'person', 5, 0, 'Y', '', 0, 6, '2018-05-14 16:13:34', '2018-06-12 18:13:34'),
(16, 43, 'n', 'Action', 26, 0, '', '0', 0, 0, '2018-07-02 13:21:42', '2018-07-02 13:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE IF NOT EXISTS `activities` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `language` char(2) NOT NULL DEFAULT 'en',
  `workplace` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `name`, `description`, `language`, `workplace`, `start`, `author`, `created_at`, `modified_at`) VALUES
(1, 'Kellen King', 'Voluptas et a quia excepturi. Aut perferendis nesciunt iste maxime. Saepe animi sed ut illum. Nam dolorem explicabo minus nisi molestiae optio.', 'en', 9, 4, 2, '1982-06-21 18:04:57', '1987-01-23 13:31:58'),
(2, 'Thaddeus Kautzer', 'Reprehenderit molestias amet sed dignissimos enim suscipit. Assumenda atque laborum id aliquid dicta. Ut vel vero est omnis quo quis velit.', 'en', 3, 1, 2, '2016-10-28 19:37:29', '1971-08-29 00:49:25'),
(3, 'Angel Howell', 'Cupiditate maxime totam explicabo et similique in. Enim porro minus distinctio dolores. Rerum eos delectus veritatis corporis. Illo maiores libero id non.', 'en', 1, 7, 2, '2008-03-20 21:11:11', '1997-09-12 10:00:27'),
(4, 'Bernadine Stark', 'Sed consequuntur et fuga consequuntur. Et et nemo voluptates rem. Culpa accusantium accusantium quam eos alias enim.', 'en', 6, 7, 1, '2003-05-25 12:28:56', '2005-11-21 03:57:30'),
(5, 'Dr. Rasheed Pollich III', 'Incidunt sit inventore natus est. Est saepe autem fugiat natus.', 'en', 1, 1, 1, '1982-07-31 00:12:29', '1994-03-14 07:29:53'),
(6, 'Octavia Maggio Sr.', 'Fuga sit et nihil quia libero non. Id dolorem omnis ducimus sequi commodi.', 'en', 1, 9, 2, '1978-10-14 03:50:40', '1999-12-04 04:06:48'),
(7, 'Dr. Aletha Schumm III', 'Ut rerum iusto placeat id nam perferendis sit non. Provident labore voluptatum officia assumenda aut minima qui. Voluptates sed atque praesentium dolorem voluptatum sit.', 'en', 2, 2, 2, '1973-03-05 14:14:29', '1983-09-07 22:04:47'),
(8, 'Brayan Carroll II', 'Veniam earum vitae inventore fugiat at. Fugit architecto eum quisquam. Odit sapiente inventore assumenda et rerum doloribus iusto. Excepturi esse fuga repellat odio.', 'en', 4, 6, 2, '1989-03-20 09:47:14', '1985-08-27 02:25:08'),
(9, 'Boris McLaughlin', 'Quia nemo numquam architecto dolor nostrum. Officia vel aspernatur odio est. Voluptate id est doloribus et molestias illo dignissimos. Voluptatem ab aut repellat.', 'en', 10, 8, 2, '1975-05-05 02:24:46', '1991-04-17 00:37:55'),
(10, 'Luciano Walter', 'Esse voluptate sequi maiores quisquam voluptas aliquid. Eum vitae aut quae et. Et sed provident unde excepturi minima rerum.', 'en', 10, 9, 1, '2005-07-17 02:05:40', '1978-06-12 15:29:45'),
(18, 'test', 'testst', 'De', 2, 0, 3, '2018-05-14 15:58:41', '2018-05-14 15:58:41'),
(19, 'test', 'testst', 'De', 2, 0, 3, '2018-05-14 15:59:47', '2018-05-14 15:59:47'),
(20, 'test', 'testst', 'De', 2, 21, 3, '2018-05-14 16:00:13', '2018-05-14 16:00:13'),
(21, 'test', 'test', 'De', 2, 24, 3, '2018-05-14 16:13:34', '2018-05-14 16:13:34'),
(22, 'XOR Test', 'Testing xor operation', 'en', 16, 25, 3, '2018-07-02 13:21:42', '2018-07-02 13:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `apps`
--

CREATE TABLE IF NOT EXISTS `apps` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `manifest` varchar(100) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apps`
--

INSERT INTO `apps` (`id`, `name`, `manifest`, `author`, `type`, `created_at`, `modified_at`) VALUES
(1, 'Streaming Video', 'http://this.is.me/videoplayer.xml', 2, 1, '2007-09-01 03:36:33', '2018-02-15 10:52:54'),
(2, 'User Feedback', 'http://this.is.me/widgets/rating', 1, 1, '1975-06-02 03:18:36', '2018-02-15 10:53:19'),
(3, 'itaque', 'http://thi', 2, 2, '1975-07-13 09:27:59', '2008-07-29 17:32:24'),
(4, 'voluptatem', 'http://thi', 2, 3, '1991-03-04 16:39:32', '2017-06-16 18:54:37'),
(5, 'nisi', 'http://thi', 2, 1, '1985-11-29 10:44:11', '1979-05-07 06:41:52'),
(6, 'soluta', 'http://thi', 2, 1, '2002-12-23 12:17:11', '1983-02-13 11:45:54'),
(7, 'aut', 'http://thi', 2, 3, '1991-04-05 05:39:29', '1997-03-13 13:35:41'),
(8, 'architecto', 'http://thi', 1, 3, '1985-03-14 20:32:43', '1975-01-09 07:32:08'),
(9, 'quia', 'http://thi', 1, 1, '1987-03-01 04:44:28', '2009-04-01 00:13:28'),
(10, 'est', 'http://thi', 1, 1, '1998-07-01 07:58:26', '1972-03-18 05:57:38');

-- --------------------------------------------------------

--
-- Table structure for table `app_types`
--

CREATE TABLE IF NOT EXISTS `app_types` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_types`
--

INSERT INTO `app_types` (`id`, `name`) VALUES
(1, 'widget 1.0'),
(2, 'widget 2.0'),
(3, 'widget 4.0');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `api_token` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `email`, `password`, `api_token`, `created_at`) VALUES
(1, 'Eileen Parker', 'farrell.davon@yahoo.com', '$2y$10$IhOlDoVyTIkPOFxzmIOrO.xaHUFbQ8ilh2hgFEJ8Pct8bbxju5PYu', '', '1974-05-16 09:14:03'),
(2, 'Angel Stracke', 'fay.shanon@hotmail.com', '$2y$10$g1BN4sOb/aezVNt8JzZV6eaCbVgGfK0Ulh94oWalO1yWD6A5M0foK', '', '1985-05-16 07:17:31'),
(3, 'Rizwan', 'rizalishan@gmail.com', '$2y$10$ydt3nJ142fwcTtpfo6Gv8ePlsnPj8setzT5XShaBhwzuIel/vxzde', 'bBtdm6f3dAxqR9tALGCI85wpQszUQhNmoOp', '2018-07-02 12:53:45'),
(4, 'Rizwnan', 'rizalishan01@gmail.com', '$2y$10$TZ8bh4e8R3M5NEPqB7gH8unmhtJBj.m.B4Yht3g0dSZ6xL53VG4c.', '', '2018-02-15 10:36:09');

-- --------------------------------------------------------

--
-- Stand-in structure for view `configurables`
--
CREATE TABLE IF NOT EXISTS `configurables` (
`id` int(11)
,`name` varchar(100)
,`category` varchar(6)
,`type` varchar(11)
,`author` int(11)
,`created` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `constraints`
--

CREATE TABLE IF NOT EXISTS `constraints` (
  `id` int(11) NOT NULL,
  `operation` int(11) DEFAULT NULL,
  `condition` text,
  `violation` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `detectables`
--

CREATE TABLE IF NOT EXISTS `detectables` (
  `id` int(11) NOT NULL,
  `sensor` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `url` varchar(45) NOT NULL,
  `message_id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detectables`
--

INSERT INTO `detectables` (`id`, `sensor`, `type`, `url`, `message_id`, `author`, `created_at`, `modified_at`) VALUES
(1, 6, 'marker', 'http://this.is.me/markers/6.asset', 9, 2, '1982-06-10 08:45:07', '2018-06-12 16:18:26'),
(2, 6, 'marker', 'http://this.is.me/markers/7.asset', 7, 2, '1971-02-14 14:26:14', '2018-06-12 16:18:38'),
(3, 6, 'marker', 'http://this.is.me/markers/1.asset', 10, 2, '1987-08-29 02:33:12', '2018-06-12 16:18:38'),
(4, 6, 'marker', 'http://this.is.me/markers/7.asset', 2, 1, '2007-04-19 06:29:20', '2018-06-12 16:18:38'),
(5, 6, 'marker', 'http://this.is.me/markers/1.asset', 7, 1, '2011-09-03 13:49:44', '2018-06-12 16:18:38'),
(6, 6, 'marker', 'http://this.is.me/markers/6.asset', 10, 1, '2014-10-16 12:00:00', '2018-06-12 16:18:38'),
(7, 6, 'marker', 'http://this.is.me/markers/3.asset', 5, 2, '1971-07-10 15:43:47', '2018-06-12 16:18:38'),
(8, 6, 'marker', 'http://this.is.me/markers/2.asset', 2, 2, '2018-01-27 23:09:06', '2018-06-12 16:18:38'),
(9, 6, 'marker', 'http://this.is.me/markers/1.asset', 9, 1, '1996-06-09 04:29:03', '2018-06-12 16:18:38'),
(10, 6, 'marker', 'http://this.is.me/markers/5.asset', 7, 2, '2011-01-08 09:49:15', '2018-06-12 16:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `type`, `name`, `author`, `created_at`, `modified_at`) VALUES
(1, 2, 'Fridolin''s iPad', 2, '2010-02-12 18:43:53', '2018-02-15 10:51:00'),
(2, 5, 'Fridolin''s Smart Glasses', 1, '2003-05-26 03:50:06', '2018-02-15 10:51:37'),
(3, 4, 'est', 1, '1976-04-20 08:19:20', '1986-03-12 22:19:18'),
(4, 3, 'inventore', 2, '1981-03-10 20:38:19', '2007-01-06 11:21:11'),
(5, 1, 'ipsa', 2, '2017-02-16 16:32:52', '1980-11-05 13:56:13'),
(6, 5, 'et', 2, '1976-11-01 03:36:15', '2007-02-01 03:55:15'),
(7, 3, 'et', 1, '1985-07-21 04:50:17', '1989-12-27 18:01:51'),
(8, 1, 'placeat', 1, '2003-02-24 01:36:17', '2003-04-03 14:25:19'),
(9, 3, 'rem', 1, '1994-01-08 13:24:33', '1982-04-21 09:52:39'),
(10, 3, 'temporibus', 2, '1985-06-25 03:02:52', '2004-05-07 10:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `device_types`
--

CREATE TABLE IF NOT EXISTS `device_types` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `device_types`
--

INSERT INTO `device_types` (`id`, `name`) VALUES
(1, 'iPad'),
(2, 'iPhone'),
(3, 'Android Phone'),
(4, 'TV'),
(5, 'Hololens');

-- --------------------------------------------------------

--
-- Stand-in structure for view `entities`
--
CREATE TABLE IF NOT EXISTS `entities` (
`id` int(11)
,`name` varchar(100)
,`type` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `external`
--

CREATE TABLE IF NOT EXISTS `external` (
  `id` int(11) NOT NULL,
  `operation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hazards`
--

CREATE TABLE IF NOT EXISTS `hazards` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hazards`
--

INSERT INTO `hazards` (`id`, `name`, `author`, `created_at`, `modified_at`) VALUES
(1, 'illum', 1, '1993-11-15 14:12:15', '2002-12-26 07:06:23'),
(2, 'qui', 2, '1970-05-01 04:06:17', '2016-05-29 18:49:55'),
(3, 'dicta', 2, '1982-01-27 01:44:17', '1999-10-03 14:06:58'),
(4, 'animi', 2, '1998-10-30 06:59:09', '1984-12-16 02:44:10'),
(5, 'officia', 2, '1988-07-16 19:17:57', '2004-07-08 23:34:41'),
(6, 'soluta', 2, '1998-10-17 12:04:00', '1985-02-23 17:49:28'),
(7, 'at', 2, '1973-06-20 06:55:44', '1991-02-03 04:10:23'),
(8, 'quia', 2, '1980-08-21 15:56:14', '1971-05-12 02:30:39'),
(9, 'eligendi', 2, '1986-07-28 09:15:00', '2002-12-05 18:49:00'),
(10, 'id', 2, '1977-03-24 04:40:05', '1991-10-14 16:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `hazard_primitives`
--

CREATE TABLE IF NOT EXISTS `hazard_primitives` (
  `hazard` int(11) DEFAULT NULL,
  `primitive` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hazard_primitives`
--

INSERT INTO `hazard_primitives` (`hazard`, `primitive`) VALUES
(4, 7),
(6, 7),
(6, 2),
(1, 4),
(5, 5),
(10, 8),
(3, 3),
(1, 4),
(7, 7),
(10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `instructions`
--

CREATE TABLE IF NOT EXISTS `instructions` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `author` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instructions`
--

INSERT INTO `instructions` (`id`, `title`, `description`, `author`, `action`, `created_at`, `modified_at`) VALUES
(1, 'Mollie Nienow', 'Nulla harum molestiae quo non tempore deleniti. Est reiciendis molestiae eum. Blanditiis officiis odio ab minima. Dolores odio possimus rerum aliquid.', 2, 6, '1970-01-06 20:20:36', '2003-01-18 14:41:56'),
(2, 'Ms. Alberta Kihn', 'Asperiores illum sequi porro magni et aut consequatur minus. Blanditiis iure ut asperiores adipisci error. Et est velit magnam.', 2, 9, '1981-05-28 10:06:24', '1988-10-03 09:28:31'),
(3, 'Deron Hills', 'Aspernatur laudantium omnis iusto perspiciatis dolorum. Nobis accusamus corporis accusamus est. Illo est voluptas doloremque adipisci.', 2, 5, '2017-04-28 06:38:56', '2013-06-02 13:24:28'),
(4, 'Norwood Hagenes', 'Nihil quis suscipit non sed placeat ea assumenda. Dolorem tempora architecto et totam facilis quas inventore commodi. Aliquid omnis delectus temporibus nulla eum molestiae ab.', 2, 1, '2013-07-22 08:45:31', '1981-11-15 00:56:08'),
(5, 'Kamren Rosenbaum', 'Inventore sed dolores qui quibusdam. Cum est ipsam maiores sunt ipsam sed optio. Est commodi sint reprehenderit inventore quam tenetur corrupti.', 1, 3, '1979-02-18 20:10:50', '1983-04-03 03:31:37'),
(6, 'Dr. Deontae Kihn Sr.', 'Ratione eveniet ut illo enim dolor. Nesciunt saepe aut nulla. Inventore quas dolor et quo non blanditiis. Omnis omnis nihil ea. Nobis neque dolorem qui adipisci.', 2, 1, '2006-09-16 07:23:50', '1982-03-28 06:42:49'),
(7, 'Katelynn Kohler', 'Voluptas eaque quis ut voluptas. Consequatur veritatis expedita commodi facilis aut repellat atque. Eum ea voluptatum non voluptatem fugit nobis.', 1, 4, '1983-05-31 06:18:29', '1997-11-03 12:43:58'),
(8, 'Eldon Gislason', 'Illum quia aut voluptas quasi veniam ratione. Totam dignissimos qui iusto. Rerum harum nemo a officiis asperiores reiciendis et. Et qui repellat error sed numquam.', 2, 6, '1979-06-04 00:48:32', '2009-12-02 12:58:25'),
(9, 'Boyd Emard', 'Sunt aperiam voluptatem voluptatum cum. Et itaque voluptas totam distinctio et odio necessitatibus porro. Eos et ab nobis veritatis temporibus odio.', 1, 3, '1992-10-11 06:02:22', '1981-07-14 00:38:53'),
(10, 'Miss Rosa Stokes', 'Nobis animi libero perferendis ex ut pariatur. Voluptas voluptatum nesciunt voluptas doloremque corporis repudiandae. Assumenda quo fugit nulla ut veritatis. Provident nobis blanditiis odit nostrum ut illo nemo.', 1, 1, '1978-12-26 17:17:07', '1981-07-21 21:34:32');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL,
  `position` text NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL COMMENT '	',
  `targetEntity` int(11) DEFAULT NULL,
  `entityId` int(11) DEFAULT NULL,
  `viewport` int(11) DEFAULT NULL,
  `content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `author`, `created_at`, `modified_at`) VALUES
(2, 'HAR', 1, '2018-07-02 13:19:36', '2018-07-02 13:19:36'),
(3, 'XOR', 1, '2018-07-02 13:19:43', '2018-07-02 13:19:43'),
(4, 'HGR', 1, '2018-07-02 13:19:50', '2018-07-02 13:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `overlays`
--

CREATE TABLE IF NOT EXISTS `overlays` (
  `id` int(11) NOT NULL,
  `predicates_id` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `overlay_types`
--

CREATE TABLE IF NOT EXISTS `overlay_types` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE IF NOT EXISTS `persons` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `twitter` varchar(45) DEFAULT NULL,
  `mbox` varchar(45) DEFAULT NULL,
  `detectable` int(11) NOT NULL,
  `persona` varchar(45) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`id`, `name`, `twitter`, `mbox`, `detectable`, `persona`, `author`, `created_at`, `modified_at`) VALUES
(1, 'Fridolin Wild', 'fwild', 'wild@brookes.ac.uk', 2, '/user/learner', 2, '1991-11-17 11:49:41', '2018-02-15 10:49:54'),
(2, 'Antonetta Kilback', 'batz.alia', 'qwolf@gmail.com', 5, 'persona/facilis-non-voluptas-quod-perspiciati', 1, '1975-09-20 14:23:13', '1971-07-14 03:53:47'),
(3, 'Fermin Feeney', 'jbahringer', 'abernathy.ethel@larson.com', 5, 'persona/sint-distinctio-enim-odio-eveniet-con', 2, '1993-09-16 18:36:54', '1981-05-25 08:50:54'),
(4, 'Neal Feest MD', 'reece.damore', 'jaron.reilly@yahoo.com', 6, 'persona/voluptas-et-natus-commodi-dolore-quia', 1, '1988-07-25 08:53:20', '2015-10-18 07:06:32'),
(5, 'Bud Skiles', 'doyle54', 'murray.quinton@hayes.org', 10, 'persona/voluptates-sed-excepturi-et-alias', 2, '2007-03-02 23:44:19', '1978-03-17 08:44:22'),
(6, 'Jamel Douglas II', 'alta.greenholt', 'allan.anderson@gmail.com', 1, 'persona/ad-unde-ex-sunt-facere-animi-aut', 1, '2009-02-07 11:30:22', '1973-06-22 01:53:39'),
(7, 'Miss Ashly Conroy DVM', 'condricka', 'elenor88@predovic.com', 7, 'persona/itaque-et-in-eum-eos', 2, '1977-05-19 08:09:42', '1970-05-30 04:10:54'),
(8, 'Miss Halie Witting Jr.', 'vcollier', 'amina.frami@haag.info', 5, 'persona/eos-tempora-sapiente-adipisci-placeat', 2, '2002-10-29 14:22:00', '1992-06-15 08:26:55'),
(9, 'Felton Trantow', 'emery.schmeler', 'mayert.pamela@kautzer.com', 1, 'persona/est-cum-repudiandae-ipsum-ea-ea-commo', 2, '1987-10-30 08:23:48', '2001-05-16 05:35:09'),
(10, 'Estell Schamberger', 'abdul53', 'juston06@lebsack.com', 9, 'persona/nam-quaerat-repellendus-delectus', 1, '1983-01-15 09:22:25', '2006-12-20 16:40:34'),
(11, 'Rizwan Ali', 'rizalishan', 'rizalishan@ll.com', 10, 'persona/learner', 3, '2018-02-15 10:37:11', '2018-02-15 10:37:11'),
(12, 'Rizwan Ali', 'test', 'test001@test.com', 6, 'person/learner', 3, '2018-02-15 10:38:01', '2018-02-15 10:38:01'),
(13, 'test', 'asdf', 'asdf@gs.com', 6, 'persona/test', 3, '2018-02-15 15:11:58', '2018-02-15 15:11:58'),
(14, 'Rizwan Ali', 'rizalishan', 'rizalishan@gmail.com', 6, 'person', 3, '2018-05-08 12:53:04', '2018-05-08 12:53:04');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `id` int(11) NOT NULL,
  `id_name` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  `detectable` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `id_name`, `name`, `detectable`, `author`, `created_at`, `modified_at`) VALUES
(1, 'platform', 'Platform', 8, 2, '2011-06-14 10:51:46', '2018-02-15 10:49:02'),
(2, 'xcorkery', 'Jessy Kunde V', 2, 1, '2007-10-11 23:42:41', '1982-03-03 05:16:07'),
(3, 'fhaley', 'Jocelyn Gutkowski', 8, 2, '1981-02-20 14:24:55', '1991-11-05 11:46:45'),
(4, 'reba.strosin', 'Elias Runolfsson', 8, 2, '2005-05-02 19:13:16', '1977-08-09 01:19:57'),
(5, 'kkuhlman', 'Annette Auer', 8, 1, '2001-05-19 12:10:20', '1983-10-03 09:18:04'),
(6, 'crist.mckayla', 'Isabell Bosco', 6, 1, '1982-02-14 10:57:25', '1979-06-26 12:46:31'),
(7, 'hudson.kianna', 'Mr. Bobby Bogisich Jr.', 3, 1, '1999-09-30 04:39:19', '2009-12-01 07:42:19'),
(8, 'deichmann', 'Meta Bashirian', 8, 2, '2013-05-28 23:37:33', '1984-02-02 21:17:27'),
(9, 'cayla94', 'Lela Rau Sr.', 7, 2, '1987-02-28 05:00:10', '1970-12-16 15:03:45'),
(10, 'gerhold.modesta', 'Ms. Aditya Parker II', 6, 1, '1991-09-15 14:58:01', '1996-07-29 21:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `pois`
--

CREATE TABLE IF NOT EXISTS `pois` (
  `id` int(11) NOT NULL,
  `thing` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `x` decimal(10,3) NOT NULL,
  `y` decimal(10,3) NOT NULL,
  `z` decimal(10,3) NOT NULL,
  `relativeTo` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pois`
--

INSERT INTO `pois` (`id`, `thing`, `name`, `x`, `y`, `z`, `relativeTo`, `created_at`, `modified_at`) VALUES
(1, 1, 'tail', '50.000', '0.000', '0.000', 2, '2018-02-08 22:59:07', '2018-02-15 10:48:22'),
(2, 1, 'default', '0.000', '0.000', '0.000', 2, '2018-02-08 23:00:48', '2018-02-15 10:48:35'),
(5, 4, 'Left Siee', '0.200', '0.200', '0.200', 2, '2018-02-08 23:01:35', '2018-02-14 21:53:51'),
(6, 4, 'Left Siee', '0.200', '0.200', '0.200', 2, '2018-02-08 23:02:11', '2018-02-14 21:53:53'),
(7, 9, 'Left Siee', '0.200', '0.200', '0.200', 2, '2018-02-08 23:02:29', '2018-02-14 21:53:26'),
(8, 10, 'Left Siee', '0.200', '0.200', '0.200', 2, '2018-02-08 23:02:44', '2018-02-14 21:53:26'),
(9, 11, 'Left Siee', '0.200', '0.200', '0.200', 2, '2018-02-08 23:02:53', '2018-02-14 21:53:26'),
(10, 12, 'Left Siee', '0.200', '0.200', '0.200', 2, '2018-02-08 23:03:03', '2018-02-14 21:53:26'),
(11, 13, 'Left Siee', '0.200', '0.200', '0.200', 2, '2018-02-08 23:09:58', '2018-02-14 21:53:26'),
(12, 18, 'test', '0.300', '0.300', '3.000', 0, '2018-02-09 14:58:28', '2018-02-14 21:53:26'),
(13, 19, 'asdf', '9.000', '9.000', '9.000', 0, '2018-02-14 15:54:15', '2018-02-14 21:53:26'),
(14, 20, '9', '9.000', '9.000', '0.000', 0, '2018-02-14 16:06:19', '2018-02-14 21:53:26'),
(15, 21, '3', '30.000', '3.000', '30.000', 0, '2018-02-14 16:47:54', '2018-02-14 21:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `predicates`
--

CREATE TABLE IF NOT EXISTS `predicates` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `predicates`
--

INSERT INTO `predicates` (`id`, `name`, `author`, `created_at`, `modified_at`) VALUES
(1, 'dolores', 2, '1971-06-02 08:13:28', '1986-03-08 10:56:55'),
(2, 'omnis', 2, '1994-05-29 06:29:35', '1991-10-20 16:03:54'),
(3, 'tenetur', 2, '2007-08-04 12:52:17', '2002-11-08 05:08:10'),
(4, 'atque', 2, '1985-05-26 03:04:58', '1988-07-13 05:47:32'),
(5, 'earum', 2, '1979-03-30 15:56:05', '1972-02-03 10:35:41'),
(6, 'ut', 2, '1978-01-17 12:23:18', '1997-08-10 10:29:01'),
(7, 'est', 2, '1998-09-09 21:21:57', '2003-05-13 03:53:50'),
(8, 'velit', 2, '2008-11-17 13:07:21', '1974-02-16 21:58:24'),
(9, 'quae', 2, '1978-08-25 03:36:12', '2006-05-07 23:12:30'),
(10, 'in', 2, '1983-03-02 04:46:19', '1991-10-23 03:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `predicate_primitives`
--

CREATE TABLE IF NOT EXISTS `predicate_primitives` (
  `predicate` int(11) DEFAULT NULL,
  `primitive` int(11) DEFAULT NULL,
  `tmp` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `predicate_primitives`
--

INSERT INTO `predicate_primitives` (`predicate`, `primitive`, `tmp`) VALUES
(9, 3, 1),
(10, 8, 2),
(6, 1, 3),
(1, 1, 4),
(7, 2, 5),
(1, 2, 6),
(8, 6, 7),
(9, 4, 8),
(3, 8, 9),
(9, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `primitives`
--

CREATE TABLE IF NOT EXISTS `primitives` (
  `id` int(11) NOT NULL,
  `overlay` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `symbol` varchar(45) NOT NULL,
  `size` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  `option` text NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `primitives`
--

INSERT INTO `primitives` (`id`, `overlay`, `name`, `type`, `symbol`, `size`, `url`, `option`, `author`, `created_at`, `modified_at`) VALUES
(1, 4, 'point', '3', 'default', '0.01', 'http://this.is.me/animation/point.fbx', '', 1, '1973-01-06 18:04:58', '2018-02-15 11:01:21'),
(2, 3, 'assemble', '3', 'default', '0.01', 'http://this.is.me/animation/assemble.fbx', '', 1, '1980-06-12 21:41:48', '2018-02-15 11:01:23'),
(3, 4, 'eyeprotection', '1', '', '100', '', '', 2, '1977-01-21 07:27:25', '2018-02-15 11:01:25'),
(4, 1, 'biohazard', '1', 'default', '100', '', '', 2, '1999-03-10 17:11:21', '2018-02-15 11:01:26'),
(5, 2, 'nulla', '3', '', '0', '', '', 2, '1976-12-21 16:25:59', '1970-10-13 18:07:27'),
(6, 4, 'sed', '2', '', '0', '', '', 2, '1981-03-21 00:53:02', '1979-11-14 18:13:29'),
(7, 5, 'minus', '3', '', '0', '', '', 1, '1984-05-25 11:41:39', '2009-11-05 10:37:12'),
(8, 4, 'repellat', '3', '', '0', '', '', 2, '1970-12-27 09:13:55', '1984-07-23 11:16:24'),
(9, 5, 'recusandae', '3', '', '0', '', '', 2, '1992-06-06 23:53:23', '2012-09-25 23:06:07'),
(10, 5, 'repellat', '2', '', '0', '', '', 2, '1979-06-25 22:03:18', '2003-01-01 22:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `primitive_types`
--

CREATE TABLE IF NOT EXISTS `primitive_types` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `primitive_types`
--

INSERT INTO `primitive_types` (`id`, `name`) VALUES
(1, 'Visual'),
(2, 'Auditory'),
(3, 'Verb');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE IF NOT EXISTS `resources` (
  `tmp` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `workplace` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`tmp`, `id`, `type`, `workplace`, `author`, `created_at`, `modified_at`) VALUES
(1, 6, 'Triggers\\Detectable', 6, 2, '2010-12-03 06:02:05', '1988-03-01 18:03:06'),
(2, 8, 'Tangibles\\Person', 8, 1, '1982-11-20 07:49:00', '2010-06-03 03:24:03'),
(3, 1, 'Configurables\\Device', 1, 2, '2012-04-12 13:31:50', '2018-02-15 10:55:34'),
(4, 1, 'Triggers\\Hazard', 1, 1, '1985-06-05 06:31:53', '2018-02-15 11:03:26'),
(5, 3, 'Configurables\\Device', 4, 2, '1987-10-17 02:34:20', '2013-01-06 14:37:34'),
(6, 7, 'Tangibles\\Thing', 6, 2, '2008-01-24 05:42:16', '2006-09-21 13:35:46'),
(7, 6, 'Configurables\\Device', 6, 2, '2013-10-17 16:30:27', '1970-02-16 16:15:01'),
(8, 3, 'Triggers\\Predicate', 6, 1, '1988-08-11 09:48:35', '2005-08-30 23:39:10'),
(9, 5, 'Configurables\\Device', 10, 2, '1976-10-13 11:28:09', '1985-09-17 00:26:16'),
(10, 5, 'Tangibles\\Place', 3, 1, '1996-11-12 17:29:05', '1980-04-28 07:39:44'),
(11, 4, 'Configurables\\App', 3, 1, '2005-12-22 03:12:03', '1993-11-01 22:31:13'),
(12, 10, 'Tangibles\\Thing', 9, 1, '1988-06-23 09:15:20', '1991-04-25 22:08:38'),
(13, 4, 'Configurables\\Device', 10, 2, '2005-06-18 07:17:56', '1981-08-17 03:27:14'),
(14, 10, 'Triggers\\Hazard', 2, 2, '2002-04-15 12:55:33', '1987-09-24 10:18:46'),
(15, 3, 'Triggers\\Predicate', 2, 2, '1984-07-26 14:39:32', '1994-10-21 10:14:36'),
(16, 9, 'Tangibles\\Thing', 8, 1, '1983-10-10 13:57:26', '2003-04-04 20:01:28'),
(17, 9, 'Triggers\\Warning', 7, 1, '1992-10-10 17:53:37', '1981-05-10 10:31:50'),
(18, 8, 'Tangibles\\Thing', 5, 2, '2013-11-11 17:12:53', '2010-08-27 07:36:19'),
(19, 9, 'Triggers\\Warning', 8, 1, '1972-08-23 03:05:34', '1984-03-12 21:05:11'),
(20, 1, 'Triggers\\Detectable', 1, 2, '2004-07-13 05:55:31', '2018-02-15 10:57:24'),
(21, 2, 'Triggers\\Predicate', 4, 2, '1972-09-09 12:23:08', '2009-08-01 07:49:40'),
(22, 4, 'Triggers\\Warning', 9, 2, '1998-09-07 02:13:29', '1981-10-20 00:48:44'),
(23, 8, 'Triggers\\Hazard', 4, 2, '1990-11-02 15:28:32', '2013-11-18 15:20:20'),
(24, 2, 'Triggers\\Hazard', 9, 1, '1998-01-27 07:18:47', '1995-01-22 12:24:09'),
(25, 4, 'Configurables\\Device', 10, 2, '1977-09-12 19:10:55', '2004-02-15 18:42:11'),
(26, 10, 'Configurables\\App', 1, 1, '1977-11-13 22:09:38', '2008-07-29 18:58:35'),
(27, 7, 'Tangibles\\Thing', 10, 1, '2015-02-20 11:26:49', '2004-03-25 09:12:23'),
(28, 6, 'Triggers\\Predicate', 9, 2, '1977-06-18 19:14:42', '1975-12-18 21:28:10'),
(29, 9, 'Triggers\\Detectable', 5, 2, '1970-11-11 14:56:09', '1997-12-08 19:34:05'),
(30, 1, 'Tangibles\\Thing', 1, 2, '1996-06-02 02:55:45', '2018-02-15 10:56:02'),
(31, 5, 'Tangibles\\Place', 5, 2, '1979-03-05 07:00:12', '1993-12-10 22:53:38'),
(32, 6, 'Triggers\\Warning', 7, 2, '2000-12-06 23:01:25', '1980-03-04 23:25:45'),
(33, 6, 'Triggers\\Hazard', 4, 1, '1970-02-02 16:52:31', '2004-06-13 05:42:39'),
(34, 7, 'Tangibles\\Place', 5, 1, '1999-05-11 19:32:40', '2009-09-07 11:53:30'),
(35, 2, 'Tangibles\\Person', 4, 2, '1989-07-22 21:47:43', '2003-04-09 10:59:55'),
(36, 10, 'Triggers\\Detectable', 7, 1, '1972-11-08 10:36:06', '1994-08-08 18:17:10'),
(37, 2, 'Triggers\\Warning', 6, 1, '1986-03-09 19:03:24', '2004-09-30 18:47:17'),
(38, 2, 'Configurables\\Device', 1, 2, '1994-09-19 00:45:32', '2006-07-29 00:19:13'),
(39, 10, 'Triggers\\Warning', 9, 2, '1995-09-12 10:55:42', '2004-11-27 20:35:18'),
(40, 3, 'Tangibles\\Person', 5, 1, '1987-07-02 23:12:42', '1992-11-03 20:26:36'),
(41, 8, 'Configurables\\App', 5, 1, '1995-01-26 23:41:28', '1980-02-16 19:36:55'),
(42, 1, 'Configurables\\App', 1, 1, '2011-02-09 00:33:03', '2018-02-15 10:57:08'),
(43, 2, 'Tangibles\\Place', 5, 1, '2006-11-05 00:19:53', '2009-07-08 17:56:29'),
(44, 4, 'Triggers\\Hazard', 9, 1, '1973-10-13 21:13:50', '1980-01-16 08:28:21'),
(45, 1, 'Tangibles\\Place', 1, 1, '1989-10-16 20:47:10', '2018-02-15 10:56:28'),
(46, 1, 'Tangibles\\Place', 9, 2, '1988-05-14 01:13:02', '1998-02-28 09:08:58'),
(47, 1, 'Configurables\\Device', 3, 2, '2001-06-08 12:35:04', '2011-05-30 22:38:11'),
(48, 8, 'Configurables\\App', 7, 1, '2003-03-06 10:31:23', '2002-10-30 06:43:39'),
(49, 8, 'Tangibles\\Place', 9, 1, '1994-11-23 22:26:22', '1988-04-02 16:52:07'),
(50, 7, 'Configurables\\Device', 7, 2, '2005-06-06 14:58:46', '1972-09-05 00:26:25'),
(51, 6, 'Triggers\\Hazard', 9, 2, '2016-05-23 05:18:13', '1986-04-09 23:31:42'),
(52, 6, 'Triggers\\Detectable', 5, 1, '1988-05-11 15:00:01', '1984-01-21 06:51:01'),
(53, 10, 'Tangibles\\Thing', 10, 2, '2014-12-16 01:06:02', '2001-02-26 02:04:40'),
(54, 2, 'Triggers\\Hazard', 6, 2, '1976-01-08 04:15:30', '2015-01-16 16:58:22'),
(55, 9, 'Triggers\\Predicate', 3, 1, '1974-11-18 03:05:48', '1998-09-24 17:33:41'),
(56, 8, 'Tangibles\\Person', 10, 2, '2002-07-23 22:29:51', '1981-07-15 19:47:14'),
(57, 9, 'Triggers\\Warning', 2, 1, '1979-07-04 12:54:56', '2000-09-14 23:01:25'),
(58, 2, 'Triggers\\Detectable', 6, 1, '2016-01-08 05:37:44', '1994-04-04 01:25:12'),
(59, 7, 'Configurables\\Device', 8, 2, '1978-07-11 14:41:46', '2009-05-04 18:03:57'),
(60, 10, 'Triggers\\Detectable', 2, 1, '1978-01-24 09:36:38', '1986-01-18 16:26:38'),
(61, 6, 'Tangibles\\Person', 8, 1, '2009-09-08 06:55:27', '1977-01-18 01:40:36'),
(62, 9, 'Triggers\\Hazard', 9, 2, '1991-12-25 18:13:59', '1976-05-10 21:21:11'),
(63, 2, 'Triggers\\Predicate', 1, 1, '1979-04-29 10:25:30', '1997-12-13 14:59:50'),
(64, 9, 'Configurables\\Device', 10, 1, '1972-06-22 07:53:16', '1986-03-01 06:49:57'),
(65, 1, 'Triggers\\Warning', 1, 2, '2002-03-13 08:51:15', '2018-02-15 11:03:32'),
(66, 5, 'Tangibles\\Place', 2, 1, '1974-09-11 20:31:06', '1994-04-18 23:07:19'),
(67, 8, 'Triggers\\Predicate', 10, 2, '2005-07-01 04:56:18', '1992-10-31 11:53:00'),
(68, 10, 'Configurables\\App', 8, 1, '1976-04-12 01:29:08', '2008-03-21 09:53:52'),
(69, 5, 'Triggers\\Warning', 2, 2, '1991-11-17 07:42:15', '1980-05-05 00:14:26'),
(70, 1, 'Tangibles\\Person', 4, 2, '1981-09-09 12:55:21', '1976-08-06 03:38:41'),
(71, 9, 'Triggers\\Predicate', 3, 2, '1989-07-07 03:09:49', '1984-05-06 19:42:27'),
(72, 1, 'Tangibles\\Place', 5, 2, '2004-04-25 08:13:15', '1970-03-19 10:55:35'),
(73, 2, 'Tangibles\\Thing', 1, 2, '1998-04-08 01:20:24', '1997-12-28 04:06:44'),
(74, 4, 'Tangibles\\Person', 3, 2, '2013-08-18 02:12:48', '1991-11-07 05:42:18'),
(75, 4, 'Triggers\\Detectable', 4, 2, '2002-11-02 15:02:19', '2015-01-17 15:37:51'),
(76, 8, 'Triggers\\Warning', 2, 1, '1971-05-02 22:22:01', '1999-01-29 19:54:04'),
(77, 1, 'Triggers\\Detectable', 6, 1, '2016-06-27 16:28:45', '2000-06-17 08:53:20'),
(78, 2, 'Configurables\\App', 1, 2, '2007-01-20 14:45:59', '2018-02-15 10:57:12'),
(79, 8, 'Configurables\\Device', 6, 1, '2002-10-21 12:18:09', '1988-05-21 10:37:02'),
(80, 9, 'Triggers\\Warning', 8, 2, '2005-08-09 08:02:12', '1970-10-21 16:12:01'),
(81, 8, 'Triggers\\Hazard', 5, 1, '1972-12-31 18:32:20', '1970-10-31 22:19:56'),
(82, 5, 'Triggers\\Hazard', 10, 1, '2009-02-08 06:38:03', '2001-03-17 17:02:13'),
(83, 3, 'Tangibles\\Thing', 5, 1, '1985-07-21 16:53:58', '1989-01-05 00:50:09'),
(84, 6, 'Triggers\\Hazard', 2, 1, '1983-08-02 09:57:07', '1979-11-13 03:23:33'),
(85, 1, 'Tangibles\\Person', 2, 2, '2003-11-27 06:50:32', '2002-10-18 15:37:31'),
(86, 1, 'Triggers\\Predicate', 1, 2, '1983-06-21 10:11:53', '2018-02-15 10:57:38'),
(87, 1, 'Triggers\\Predicate', 10, 1, '1992-07-21 13:44:11', '2017-06-21 19:34:54'),
(88, 4, 'Triggers\\Hazard', 6, 1, '1996-03-09 20:49:51', '2005-12-21 19:24:21'),
(89, 3, 'Tangibles\\Thing', 5, 1, '1992-09-27 04:00:21', '1976-06-22 20:36:34'),
(90, 1, 'Tangibles\\Person', 1, 2, '2017-09-18 19:25:09', '2018-02-15 10:56:38'),
(91, 6, 'Tangibles\\Thing', 8, 2, '1970-09-13 18:56:23', '2012-06-23 08:14:45'),
(92, 2, 'Tangibles\\Thing', 9, 2, '1993-07-04 20:51:17', '1981-12-16 21:20:02'),
(93, 6, 'Configurables\\Device', 2, 1, '1983-09-27 18:02:00', '1976-03-07 20:24:31'),
(94, 3, 'Tangibles\\Place', 9, 1, '1997-10-30 16:36:47', '2003-07-02 10:40:21'),
(95, 6, 'Triggers\\Predicate', 2, 1, '1995-06-10 06:12:58', '1977-04-06 09:58:33'),
(96, 4, 'Triggers\\Predicate', 6, 2, '1982-05-26 18:00:37', '1983-12-20 10:07:39'),
(97, 8, 'Configurables\\Device', 10, 2, '1994-06-20 12:30:38', '1995-01-10 00:20:41'),
(98, 3, 'Tangibles\\Place', 10, 2, '1971-04-28 19:05:27', '2014-09-23 08:22:26'),
(99, 9, 'Triggers\\Predicate', 8, 2, '2008-07-26 09:10:22', '1971-09-19 06:21:19'),
(100, 8, 'Triggers\\Detectable', 5, 1, '1995-10-08 16:35:57', '1976-12-31 22:03:06'),
(101, 6, 'Sensor', 13, 3, '2018-05-08 16:53:16', '2018-05-08 16:53:16'),
(102, 6, 'Sensor', 14, 3, '2018-05-08 16:57:23', '2018-05-08 16:57:23'),
(103, 6, 'Sensor', 15, 3, '2018-05-09 14:42:32', '2018-05-09 14:42:32'),
(104, 9, 'Sensor', 16, 3, '2018-07-02 13:08:25', '2018-07-02 13:08:25'),
(105, 10, 'Sensor', 16, 3, '2018-07-02 13:08:25', '2018-07-02 13:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `sensors`
--

CREATE TABLE IF NOT EXISTS `sensors` (
  `id` int(11) NOT NULL,
  `id_name` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  `uri` varchar(45) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'sensor',
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sensors`
--

INSERT INTO `sensors` (`id`, `id_name`, `name`, `uri`, `username`, `password`, `type`, `author`, `created_at`, `modified_at`) VALUES
(6, '', 'Chest Mounted Accelerometer', 'i5/sensors/cmacc', '', '', 'sensor', 3, '2018-05-08 12:51:32', '2018-05-08 12:51:32'),
(9, 'binary0', 'Binary One', '/i5/binary/0', 'rali', 'rizwan', 'sensor', 3, '2018-07-02 13:07:12', '2018-07-02 14:30:36'),
(10, 'binary1', 'Binary Two', '/i5/binary/1', '', NULL, 'sensor', 3, '2018-07-02 13:08:11', '2018-07-02 14:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `sensor_data_types`
--

CREATE TABLE IF NOT EXISTS `sensor_data_types` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `sensor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tangibles`
--
CREATE TABLE IF NOT EXISTS `tangibles` (
`id` int(11)
,`name` varchar(45)
,`type` varchar(6)
,`urn` varchar(45)
,`detectable` bigint(20)
,`author` int(11)
,`created` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `things`
--

CREATE TABLE IF NOT EXISTS `things` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `id_name` varchar(50) NOT NULL,
  `detectable` int(11) NOT NULL,
  `urn` varchar(45) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `things`
--

INSERT INTO `things` (`id`, `name`, `id_name`, `detectable`, `urn`, `author`, `created_at`, `modified_at`) VALUES
(1, 'AW 109', 'helicopter', 7, 'http://this.is.me/vehicle/helicopter', 1, '2006-07-09 11:42:46', '2018-02-15 10:47:56'),
(2, 'Myrl Pollich', 'blair34', 4, 'thing/saepe-eveniet-ad-dignissimos-quas-ea', 1, '1997-10-01 02:23:44', '1974-09-02 13:01:30'),
(3, 'Bettye Cruickshank', 'goldner.kendall', 2, 'thing/qui-occaecati-dolorem-amet', 1, '1992-11-19 10:37:30', '1987-12-01 15:06:59'),
(4, 'Dorothea Willms', 'cecil.batz', 2, 'thing/qui-dolorum-molestiae-enim-autem-maxime', 1, '2013-06-15 03:29:31', '1980-08-13 23:50:10'),
(5, 'Prof. Mario O''Hara', 'pacocha.charity', 6, 'thing/et-autem-est-fuga-sapiente', 2, '2008-06-23 16:35:41', '1993-07-20 20:09:18'),
(6, 'Tanner Dicki MD', 'viva28', 3, 'thing/amet-eum-accusamus-eos-est-itaque-qui-m', 2, '1993-01-06 23:19:14', '1988-01-13 20:27:24'),
(7, 'Belle Reichel', 'udeckow', 9, 'thing/voluptate-qui-est-ut-rerum-neque-dolore', 1, '1986-09-30 01:01:29', '1980-07-27 10:40:19'),
(8, 'Paula Boehm', 'bednar.cristobal', 3, 'thing/et-velit-omnis-inventore-et', 2, '1999-12-25 21:28:15', '1975-07-25 06:12:57'),
(9, 'Dr. Estefania Friesen', 'maribel.kirlin', 7, 'thing/repellendus-minima-ut-illo', 2, '1977-08-04 20:25:48', '2004-10-19 12:19:24'),
(10, 'Mr. Orlo Pagac DDS', 'mraz.russell', 2, 'thing/et-distinctio-velit-in-minus-beatae-pla', 1, '1994-03-23 00:35:02', '1975-09-18 05:31:02');

-- --------------------------------------------------------

--
-- Stand-in structure for view `triggers`
--
CREATE TABLE IF NOT EXISTS `triggers` (
`id` int(11)
,`name` varchar(100)
,`author` int(11)
,`type` varchar(10)
,`created` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `viewports`
--

CREATE TABLE IF NOT EXISTS `viewports` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `viewports`
--

INSERT INTO `viewports` (`id`, `name`) VALUES
(1, 'actions'),
(2, 'reactions'),
(3, 'alerts');

-- --------------------------------------------------------

--
-- Table structure for table `warnings`
--

CREATE TABLE IF NOT EXISTS `warnings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warnings`
--

INSERT INTO `warnings` (`id`, `name`, `author`, `created_at`, `modified_at`) VALUES
(1, 'praesentium', 2, '1990-12-17 21:36:32', '2015-02-28 18:58:52'),
(2, 'quia', 2, '1983-07-08 19:09:50', '1994-02-28 03:42:21'),
(3, 'rerum', 1, '1982-09-10 18:15:26', '1980-08-11 23:01:47'),
(4, 'autem', 1, '1978-05-07 18:39:38', '1987-05-08 19:40:58'),
(5, 'voluptatum', 2, '1993-10-21 01:02:25', '1994-06-02 23:29:00'),
(6, 'illum', 2, '1999-03-17 01:58:11', '2004-08-01 09:01:43'),
(7, 'est', 1, '1982-05-10 10:59:27', '1989-01-19 04:07:31'),
(8, 'quos', 1, '1990-02-04 19:36:22', '1996-04-15 07:38:30'),
(9, 'vero', 1, '2004-01-24 00:37:17', '2016-10-03 00:19:47'),
(10, 'sit', 1, '2006-07-25 13:21:58', '1995-04-04 16:32:50');

-- --------------------------------------------------------

--
-- Table structure for table `warning_primitives`
--

CREATE TABLE IF NOT EXISTS `warning_primitives` (
  `warning` int(11) DEFAULT NULL,
  `primitive` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warning_primitives`
--

INSERT INTO `warning_primitives` (`warning`, `primitive`) VALUES
(5, 8),
(8, 5),
(3, 4),
(8, 6),
(8, 4),
(9, 9),
(4, 3),
(10, 3),
(7, 10),
(4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `workplaces`
--

CREATE TABLE IF NOT EXISTS `workplaces` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workplaces`
--

INSERT INTO `workplaces` (`id`, `name`, `author`, `created_at`, `modified_at`) VALUES
(1, 'Oxford Brookes University', 2, '2003-01-01 00:26:00', '2018-02-15 10:46:58'),
(2, 'Prof. Nicolas Gleichner III', 2, '1999-07-06 13:26:36', '2007-04-16 16:37:15'),
(3, 'Arno Goldner', 2, '1997-03-15 19:44:17', '2004-03-27 13:12:54'),
(4, 'Octavia Stokes', 2, '1975-10-01 06:30:55', '1996-07-15 07:40:43'),
(5, 'Dr. Melba Terry MD', 1, '2005-09-24 05:27:43', '1972-04-29 08:35:10'),
(6, 'Lula Sipes', 2, '1973-04-07 14:11:30', '1999-02-22 15:41:43'),
(7, 'Miss Alana Hartmann', 1, '1985-07-28 03:46:44', '1992-01-02 11:52:49'),
(8, 'Adriana Reichert', 2, '1993-04-13 06:19:24', '1998-06-09 00:48:39'),
(9, 'Donna Kilback', 1, '2005-11-10 06:04:05', '2009-07-01 17:35:59'),
(10, 'Era Klocko', 1, '1985-02-10 09:39:46', '2001-02-08 08:58:26'),
(14, 'Test Two', 3, '2018-05-08 16:57:23', '2018-05-08 16:57:23'),
(15, 'Test One', 3, '2018-05-09 14:42:32', '2018-05-09 14:42:32'),
(16, 'XOR', 3, '2018-07-02 13:08:25', '2018-07-02 13:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `workplace_activities`
--

CREATE TABLE IF NOT EXISTS `workplace_activities` (
  `workplaces_id` int(11) NOT NULL,
  `activities_id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workplace_activities`
--

INSERT INTO `workplace_activities` (`workplaces_id`, `activities_id`, `author`, `created_at`, `modified_at`) VALUES
(1, 20, 1, '2018-06-12 17:42:37', '2018-06-12 17:42:37'),
(1, 21, 1, '2018-06-12 17:42:37', '2018-06-12 17:42:37'),
(16, 22, 1, '2018-07-02 13:37:07', '2018-07-02 13:37:07');

-- --------------------------------------------------------

--
-- Structure for view `configurables`
--
DROP TABLE IF EXISTS `configurables`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `configurables` AS select `apps`.`id` AS `id`,`apps`.`name` AS `name`,'apps' AS `category`,'' AS `type`,`apps`.`author` AS `author`,`apps`.`created_at` AS `created` from `apps` union select `devices`.`id` AS `id`,`devices`.`name` AS `name`,'device' AS `category`,`devices`.`type` AS `type`,`devices`.`author` AS `author`,`devices`.`created_at` AS `created` from `devices`;

-- --------------------------------------------------------

--
-- Structure for view `entities`
--
DROP TABLE IF EXISTS `entities`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `entities` AS select `sensors`.`id` AS `id`,`sensors`.`name` AS `name`,`sensors`.`type` AS `type` from `sensors` union select `configurables`.`id` AS `id`,`configurables`.`name` AS `name`,`configurables`.`category` AS `type` from `configurables` union select `tangibles`.`id` AS `id`,`tangibles`.`name` AS `name`,`tangibles`.`type` AS `type` from `tangibles` union select `triggers`.`id` AS `id`,`triggers`.`name` AS `name`,`triggers`.`type` AS `type` from `triggers`;

-- --------------------------------------------------------

--
-- Structure for view `tangibles`
--
DROP TABLE IF EXISTS `tangibles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tangibles` AS select `places`.`id` AS `id`,`places`.`name` AS `name`,'place' AS `type`,'' AS `urn`,`places`.`detectable` AS `detectable`,`places`.`author` AS `author`,`places`.`created_at` AS `created` from `places` union select `persons`.`id` AS `id`,`persons`.`name` AS `name`,'person' AS `type`,`persons`.`persona` AS `urn`,`persons`.`detectable` AS `detectable`,`persons`.`author` AS `author`,`persons`.`created_at` AS `created` from `persons` union select `modules`.`id` AS `id`,`modules`.`name` AS `name`,'module' AS `type`,'' AS `urn`,0 AS `detectable`,`modules`.`author` AS `author`,`modules`.`created_at` AS `created` from `modules` union select `things`.`id` AS `id`,`things`.`name` AS `name`,'thing' AS `type`,`things`.`urn` AS `urn`,`things`.`detectable` AS `detectable`,`things`.`author` AS `author`,`things`.`created_at` AS `created` from `things`;

-- --------------------------------------------------------

--
-- Structure for view `triggers`
--
DROP TABLE IF EXISTS `triggers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `triggers` AS select `predicates`.`id` AS `id`,`predicates`.`name` AS `name`,`predicates`.`author` AS `author`,'predicate' AS `type`,`predicates`.`created_at` AS `created` from `predicates` union select `warnings`.`id` AS `id`,`warnings`.`name` AS `name`,`warnings`.`author` AS `author`,'warning' AS `type`,`warnings`.`created_at` AS `created` from `warnings` union select `hazards`.`id` AS `id`,`hazards`.`name` AS `name`,`hazards`.`author` AS `author`,'hazard' AS `type`,`hazards`.`created_at` AS `created` from `hazards` union select `detectables`.`id` AS `id`,`detectables`.`type` AS `type`,`detectables`.`author` AS `author`,'detectable' AS `astype`,`detectables`.`created_at` AS `created` from `detectables`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `action_triggers`
--
ALTER TABLE `action_triggers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `action_trigger_modes`
--
ALTER TABLE `action_trigger_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `action_trigger_operations`
--
ALTER TABLE `action_trigger_operations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_types`
--
ALTER TABLE `app_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `constraints`
--
ALTER TABLE `constraints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detectables`
--
ALTER TABLE `detectables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_types`
--
ALTER TABLE `device_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `external`
--
ALTER TABLE `external`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hazards`
--
ALTER TABLE `hazards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructions`
--
ALTER TABLE `instructions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overlays`
--
ALTER TABLE `overlays`
  ADD PRIMARY KEY (`id`,`predicates_id`);

--
-- Indexes for table `overlay_types`
--
ALTER TABLE `overlay_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pois`
--
ALTER TABLE `pois`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `predicates`
--
ALTER TABLE `predicates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `predicate_primitives`
--
ALTER TABLE `predicate_primitives`
  ADD PRIMARY KEY (`tmp`);

--
-- Indexes for table `primitives`
--
ALTER TABLE `primitives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `primitive_types`
--
ALTER TABLE `primitive_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`tmp`);

--
-- Indexes for table `sensors`
--
ALTER TABLE `sensors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqe_id` (`id_name`);

--
-- Indexes for table `sensor_data_types`
--
ALTER TABLE `sensor_data_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `things`
--
ALTER TABLE `things`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `viewports`
--
ALTER TABLE `viewports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warnings`
--
ALTER TABLE `warnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workplaces`
--
ALTER TABLE `workplaces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workplace_activities`
--
ALTER TABLE `workplace_activities`
  ADD PRIMARY KEY (`workplaces_id`,`activities_id`),
  ADD KEY `fk_workplaces_has_activities_workplaces_idx` (`workplaces_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `action_triggers`
--
ALTER TABLE `action_triggers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `action_trigger_modes`
--
ALTER TABLE `action_trigger_modes`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `action_trigger_operations`
--
ALTER TABLE `action_trigger_operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `apps`
--
ALTER TABLE `apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `app_types`
--
ALTER TABLE `app_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `constraints`
--
ALTER TABLE `constraints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detectables`
--
ALTER TABLE `detectables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `device_types`
--
ALTER TABLE `device_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `external`
--
ALTER TABLE `external`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hazards`
--
ALTER TABLE `hazards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `instructions`
--
ALTER TABLE `instructions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	';
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `overlays`
--
ALTER TABLE `overlays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `overlay_types`
--
ALTER TABLE `overlay_types`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `pois`
--
ALTER TABLE `pois`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `predicates`
--
ALTER TABLE `predicates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `predicate_primitives`
--
ALTER TABLE `predicate_primitives`
  MODIFY `tmp` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `primitives`
--
ALTER TABLE `primitives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `primitive_types`
--
ALTER TABLE `primitive_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `tmp` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `sensors`
--
ALTER TABLE `sensors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sensor_data_types`
--
ALTER TABLE `sensor_data_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `things`
--
ALTER TABLE `things`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `viewports`
--
ALTER TABLE `viewports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `warnings`
--
ALTER TABLE `warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `workplaces`
--
ALTER TABLE `workplaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `workplace_activities`
--
ALTER TABLE `workplace_activities`
  MODIFY `workplaces_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
