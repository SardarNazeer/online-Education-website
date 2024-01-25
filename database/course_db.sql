-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2023 at 08:34 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `user_id` varchar(20) NOT NULL,
  `playlist_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`user_id`, `playlist_id`) VALUES
('7Y5ZwLR2IMpQlN8vmDvh', 'NvVqSvWEZ0OGbQEzWVJr');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` varchar(20) NOT NULL,
  `content_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content_id`, `user_id`, `tutor_id`, `comment`, `date`) VALUES
('sj8ZnLRgZ88FxojiRsjr', 'VuhZdTXqfjQQOpKnIpQs', '7Y5ZwLR2IMpQlN8vmDvh', 'GcOJ0gaEtvPO03Ur0m4w', 'nice tutorial', '2023-07-17');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` int(10) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `playlist_id` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `video` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `tutor_id`, `playlist_id`, `title`, `description`, `video`, `thumb`, `date`, `status`) VALUES
('QF7MNCLgwZwUP6cYRzYs', 'GcOJ0gaEtvPO03Ur0m4w', 'NvVqSvWEZ0OGbQEzWVJr', 'first lesson', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Amet vitae eveniet minima repudiandae fugit saepe velit laboriosam deleniti itaque. Nulla repellat temporibus quod explicabo mollitia illo delectus pariatur hic obcaecati.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Amet vitae eveniet minima repudiandae fugit saepe velit laboriosam deleniti itaque. Nulla repellat temporibus quod explicabo mollitia illo delectus pariatur hic obcaecati.', 'GrLZOwnSGUrBBYFm4Hn4.mp4', 'YoVjE0L38FbRwX5PCgj0.gif', '2023-07-13', 'active'),
('VuhZdTXqfjQQOpKnIpQs', 'GcOJ0gaEtvPO03Ur0m4w', 'NvVqSvWEZ0OGbQEzWVJr', 'first chapter', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'VsE1LrkJheSck6h6t0AD.mp4', 'XyK8r3ZaxyGWrB4lSmSC.gif', '2023-07-17', 'active'),
('zxIhQ76tcMRHkP9p1YhR', 'GcOJ0gaEtvPO03Ur0m4w', 'NvVqSvWEZ0OGbQEzWVJr', 'first chapter', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'wQhD6BB1WL7HEWN1njWi.mp4', '0YYhLYJQTOBLI6ty1xat.gif', '2023-07-17', 'active'),
('whUax1r64WGUA8hUHcJY', 'GcOJ0gaEtvPO03Ur0m4w', 'ugRN4ejGCeX9pj8gZVpd', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'FXTHv7OXlpv2VoBEQ8k4.mp4', 'MjKUZxO7verJE0UwveR8.png', '2023-07-17', 'active'),
('xhgZOVI1yM1LbWTUsBfQ', 'GcOJ0gaEtvPO03Ur0m4w', 'ugRN4ejGCeX9pj8gZVpd', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'K1gx1GggtTWMI3Q7aylB.mp4', '8zVa1DrLT37o3CNkXylW.png', '2023-07-17', 'active'),
('2f7gLE2NrqEDiKwVcw1o', 'GcOJ0gaEtvPO03Ur0m4w', 'ugRN4ejGCeX9pj8gZVpd', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'SOJQ91CK9xnb6TlRX1PA.mp4', '4iIf29tvhnZ9VGmyMSzw.png', '2023-07-17', 'active'),
('pNFWF5SvRPVzmVeJaMvR', 'GcOJ0gaEtvPO03Ur0m4w', 'ugRN4ejGCeX9pj8gZVpd', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'fta3JUCTC9Z1MYVHjNVT.mp4', '3J6kVcVVNzAyZQ6UgX6R.png', '2023-07-17', 'active'),
('p26ry32B4u08SzRjp96y', 'GcOJ0gaEtvPO03Ur0m4w', 'F8Fn6mcVFaBsaoWxLloT', 'chapter oner', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'invocKjuQprH6FP2zMAE.mp4', 'v1LcA2heTxdwNEKA6QfK.jpg', '2023-07-17', 'active'),
('EllV5uKttPpxTca9ZB7f', 'GcOJ0gaEtvPO03Ur0m4w', 'F8Fn6mcVFaBsaoWxLloT', 'chapter oner', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Zxju72j9B4Rc6tT3E3HN.mp4', 'qpl2JsthrOV8GLGDlJdY.jpg', '2023-07-17', 'active'),
('YKO90mBgcqELGTcAoW6n', 'GcOJ0gaEtvPO03Ur0m4w', 'F8Fn6mcVFaBsaoWxLloT', 'chapter oner', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'AEEQtRHDfKY2ZDUsuTEg.mp4', 'QAuBNkPeR9iRsNo3wIPs.jpg', '2023-07-17', 'active'),
('aAkIlYuukzdH9udYPmHm', 'GcOJ0gaEtvPO03Ur0m4w', 'F8Fn6mcVFaBsaoWxLloT', 'chapter oner', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'rl648GefuHSdVnzhBBck.mp4', 'ITy2bcOqd7CKJKZBSeR7.jpg', '2023-07-17', 'active'),
('xiDmBG8ERmE3iq8z2hi7', 'GcOJ0gaEtvPO03Ur0m4w', 'F8Fn6mcVFaBsaoWxLloT', 'chapter oner', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'gLHgnB1S1dlDk5o7BztL.mp4', 'KR2xV7nIrJ5tShwuIAoT.jpg', '2023-07-17', 'active'),
('VtEgtWkxUKMCHgiSt0Ia', 'GcOJ0gaEtvPO03Ur0m4w', 'F8Fn6mcVFaBsaoWxLloT', 'chapter oner', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'JOPe1tDgFA6qCoB6KM0b.mp4', 'ybIBMdHI5sziHkRyMSSZ.jpg', '2023-07-17', 'active'),
('SLsOIhvGb0hXEyvtuSm2', 'GcOJ0gaEtvPO03Ur0m4w', 'cxFEI1M4Mux5y1cYRWRO', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'oU0Fmi1Of8i7oQru0X1R.mp4', 'hfK8OUy1DGpqY9DA837H.jpg', '2023-07-17', 'active'),
('9X0JetoFeF8dzO3D928g', 'GcOJ0gaEtvPO03Ur0m4w', 'cxFEI1M4Mux5y1cYRWRO', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'ipBLfqmXfENDcByvTnOj.mp4', 'VpHKBzcpVuek9iWIKWdj.jpg', '2023-07-17', 'active'),
('16QQ1Vh1BDbW6Z5HS9od', 'GcOJ0gaEtvPO03Ur0m4w', 'cxFEI1M4Mux5y1cYRWRO', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'jq1tihhu00iV9LVk0ZC3.mp4', 'fKsrLPGi6CodwHWu9PY1.jpg', '2023-07-17', 'active'),
('c6ux9m5ztPCTaNu70n58', 'GcOJ0gaEtvPO03Ur0m4w', 'cxFEI1M4Mux5y1cYRWRO', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '7Z90QkLd4q47xcY5DNK8.mp4', 'X9XFQn8mmmFBY2RNqzqo.jpg', '2023-07-17', 'active'),
('RcW0COwTiBFmTLl2DcpZ', 'GcOJ0gaEtvPO03Ur0m4w', 'cxFEI1M4Mux5y1cYRWRO', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'x1P2kquY8wcdHp0ARROF.mp4', 'jMc8eGd02A1qX0JBarKA.jpg', '2023-07-17', 'active'),
('V31wIb46kDz6aPdirFYU', 'GcOJ0gaEtvPO03Ur0m4w', 'cxFEI1M4Mux5y1cYRWRO', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'at8TRegavFR7kWCQYAXG.mp4', 'bSCNYPjtIUMNULqd0kNq.jpg', '2023-07-17', 'active'),
('FfB8O1ybCajRLdY8hXdF', 'GcOJ0gaEtvPO03Ur0m4w', 'Eq8N6yCBmqsRqDCNiLnv', 'angular js chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'PPdW8zIST6PtJgu60eXl.mp4', 'EisKCBwtrmK3xpyHblb2.png', '2023-07-17', 'active'),
('8sRbNHaB2bfGmll5BTcE', 'GcOJ0gaEtvPO03Ur0m4w', 'Eq8N6yCBmqsRqDCNiLnv', 'angular js chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '32D0bfCFx59RsmauHTf8.mp4', 'D8MdYW8RoDAux9KJjaXM.png', '2023-07-17', 'active'),
('51TuUGd12JuKO2dNk816', 'GcOJ0gaEtvPO03Ur0m4w', 'Eq8N6yCBmqsRqDCNiLnv', 'angular js chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'fek9SW3jB97AdsACesHq.mp4', 'AYa3Yd1L0bZue7FuEDBr.png', '2023-07-17', 'active'),
('t78cRFRU1kiXsXgikkrW', 'GcOJ0gaEtvPO03Ur0m4w', 'Eq8N6yCBmqsRqDCNiLnv', 'angular js chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'NJ4Oy0h0i4b925YWGXj6.mp4', 'Yfdm1tCTJC0psX8pGjPL.png', '2023-07-17', 'active'),
('VRgBwIXazwYZDVfNuyvz', 'GcOJ0gaEtvPO03Ur0m4w', 'thzgeLRANJsvyQbe17bX', 'php basic tutoial', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'VsBosRSwf4YfYcoTGUO3.mp4', 'i3u75825DTwyYY8d8Het.png', '2023-07-17', 'active'),
('4c0PUiiq0Tn6MsgkIkbi', 'GcOJ0gaEtvPO03Ur0m4w', 'thzgeLRANJsvyQbe17bX', 'php basic tutoial', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'NLx5uPvbAF03HarVmMwR.mp4', 'u5kanztq3aJuCXRoAsMl.png', '2023-07-17', 'active'),
('ghDWMVxPR8ICfVWsEQuK', 'GcOJ0gaEtvPO03Ur0m4w', 'B4G4JfUWzFmn3Ccyut87', 'react basic chapter', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'OPQH6SRKRW7Jsarr73uF.mp4', 'pHwYOOfcMVIlFT32fIG3.png', '2023-07-17', 'active'),
('luyrFJbyzPJGdZByfG47', 'GcOJ0gaEtvPO03Ur0m4w', 'B4G4JfUWzFmn3Ccyut87', 'react basic chapter', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'sarnvu8WACzjTaIejCv7.mp4', 'CIY6PHdBxjb3HzUDbsuS.png', '2023-07-17', 'active'),
('14XJhe68d0IdxYmyTnYq', 'GcOJ0gaEtvPO03Ur0m4w', 'ElMMP1UPfm1e9dyc39uo', 'basic computer chepter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Licu73TGbgp7qjNlX2Yr.mp4', '6QqJEL8ECGtTiPgg0HEF.png', '2023-07-17', 'active'),
('go8rrNKg43oRTGKMKrA7', 'GcOJ0gaEtvPO03Ur0m4w', 'ElMMP1UPfm1e9dyc39uo', 'basic computer chepter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '9BFHJy87EsEVkrAY2Mla.mp4', 'Dm2GSsUlUTPkLc0HOZYX.png', '2023-07-17', 'active'),
('w0Ri09l0Yy5GEzfq4v54', 'GcOJ0gaEtvPO03Ur0m4w', 'ElMMP1UPfm1e9dyc39uo', 'basic computer chepter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 's3aCbTngG7x6EHUOik8k.mp4', 'TR5bbUSZF8QkhlKBNbed.png', '2023-07-17', 'active'),
('FHIY8TuWoDeh0tA6CJuK', 'GcOJ0gaEtvPO03Ur0m4w', 'ElMMP1UPfm1e9dyc39uo', 'basic computer chepter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'PsA7rior32RYpniprLQD.mp4', 'JPy37zxCATPjU6UhsofO.png', '2023-07-17', 'active'),
('LthZpDu6D0MRwzVugSUK', 'GcOJ0gaEtvPO03Ur0m4w', 'ewNJOsAtkstoJp6FVGp8', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'f1iMsSSEC5K7nIBHAWcp.mp4', 'DzBL36wVssrtivKNgbEG.jpg', '2023-07-17', 'active'),
('zT3cmAC13rw5OElwkjT3', 'GcOJ0gaEtvPO03Ur0m4w', 'ewNJOsAtkstoJp6FVGp8', 'chapter one', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n         tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n         quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n         consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n         cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n         proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'nyXzGdNeIYLXpxlDORZS.mp4', 'b30UTietrIGI8yVfZD2a.jpg', '2023-07-17', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `user_id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `content_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`id`, `tutor_id`, `title`, `description`, `thumb`, `date`, `status`) VALUES
('NvVqSvWEZ0OGbQEzWVJr', 'GcOJ0gaEtvPO03Ur0m4w', 'website development', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Amet vitae eveniet minima repudiandae fugit saepe velit laboriosam deleniti itaque. Nulla repellat temporibus quod explicabo mollitia illo delectus pariatur hic obcaecati.\r\nLorem, ipsum dolor sit amet consectetur adipisicing elit. Amet vitae eveniet minima repudiandae fugit saepe velit laboriosam deleniti itaque. Nulla repellat temporibus quod explicabo mollitia illo delectus pariatur hic obcaecati.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Amet vitae eveniet minima repudiandae fugit saepe velit laboriosam deleniti itaque. Nulla repellat temporibus quod explicabo mollitia illo delectus pariatur hic obcaecati.', 'fEmumRTDGEc53UCLP2EA.jpg', '2023-07-13', 'active'),
('ElMMP1UPfm1e9dyc39uo', 'GcOJ0gaEtvPO03Ur0m4w', 'basic computer course', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'f7fz8hSznMllvMbNR6LM.webp', '2023-07-15', 'active'),
('ewNJOsAtkstoJp6FVGp8', 'GcOJ0gaEtvPO03Ur0m4w', 'social media tutorial', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n   quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n   consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n   cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n   proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '0ENFPI1tSWoLZzjzfEKC.avif', '2023-07-15', 'active'),
('g4jzr4JxEyPeDF4pebyt', 'GcOJ0gaEtvPO03Ur0m4w', 'html', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'vhWqDCdNZb32xaoskNaB.png', '2023-07-15', 'deactive'),
('49ogHFK0BPFsVYRvibK0', 'GcOJ0gaEtvPO03Ur0m4w', 'website development', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'HWztr2wZDYntB8LNrytb.png', '2023-07-15', 'active'),
('i4Yur7G3hj0gZUcvoEsH', 'GcOJ0gaEtvPO03Ur0m4w', 'graphic design', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'yT9L09XV1MPQTTM5kdbH.webp', '2023-07-15', 'active'),
('jMXXZtE7Ws85o8e0vkuY', 'GcOJ0gaEtvPO03Ur0m4w', 'website development', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'eJ3fwxiLKHa2IbjOkyIW.webp', '2023-07-15', 'active'),
('M5NG0SNAXKUbDNytWkNd', 'GcOJ0gaEtvPO03Ur0m4w', 'html tutorial for beginner', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'bbcguNz9p1Wg9B8PtcGD.webp', '2023-07-15', 'active'),
('rWUjbgjcoYjXoZ07x7v3', 'GcOJ0gaEtvPO03Ur0m4w', 'graphic design course', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'BbCBeotBI5YMmJZM8DSv.jpg', '2023-07-15', 'active'),
('B4G4JfUWzFmn3Ccyut87', 'GcOJ0gaEtvPO03Ur0m4w', 'react front to back', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '1AUpirjr6zltOLUx49N7.jpg', '2023-07-15', 'active'),
('thzgeLRANJsvyQbe17bX', 'GcOJ0gaEtvPO03Ur0m4w', 'php beginner advanced', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'kFJL35MLxdeX3NwgJf1I.jpg', '2023-07-15', 'active'),
('Eq8N6yCBmqsRqDCNiLnv', 'GcOJ0gaEtvPO03Ur0m4w', 'angular zero to master', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '3B0U0EBSnkNz86wJ7FyZ.jpg', '2023-07-15', 'active'),
('cxFEI1M4Mux5y1cYRWRO', 'GcOJ0gaEtvPO03Ur0m4w', 'web front to back', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'P7dMKuWylUXOjIlR10uI.jpg', '2023-07-15', 'active'),
('F8Fn6mcVFaBsaoWxLloT', 'GcOJ0gaEtvPO03Ur0m4w', 'sql beginner to advanced level', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Qm7IHNu5H9LWeH6iw2oI.jpg', '2023-07-15', 'active'),
('ugRN4ejGCeX9pj8gZVpd', 'GcOJ0gaEtvPO03Ur0m4w', 'js zero to mastery', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'smQw7nMgS2afIb0SGzmm.jpg', '2023-07-15', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

CREATE TABLE `tutors` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tutors`
--

INSERT INTO `tutors` (`id`, `name`, `profession`, `email`, `password`, `image`) VALUES
('GcOJ0gaEtvPO03Ur0m4w', 'selena ansari', 'developer', 'selena@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'eXYX8wIryo5MTdTsQHvK.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`) VALUES
('7Y5ZwLR2IMpQlN8vmDvh', 'aiyman', 'aiyman@gmail.com', '40bc268f88e6d1bbfcc03874d9ed50ec2889a711', 'sbTnX3JG06mPaa4jg892.png');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
