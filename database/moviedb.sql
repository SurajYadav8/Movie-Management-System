-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2024 at 04:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moviedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_password`) VALUES
(1, 'admin', 'adminlogin');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `c_id` int(11) NOT NULL,
  `movie_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`c_id`, `movie_type`) VALUES
(1, 'Horror'),
(2, 'Action'),
(3, 'Thriller'),
(4, 'Comedy'),
(5, 'Romance'),
(6, 'Adventure');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `d_id` int(11) NOT NULL,
  `d_name` varchar(30) NOT NULL,
  `d_password` varchar(30) NOT NULL,
  `d_date_of_birth` varchar(15) NOT NULL,
  `d_gender` varchar(10) NOT NULL,
  `d_ph_num` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`d_id`, `d_name`, `d_password`, `d_date_of_birth`, `d_gender`, `d_ph_num`) VALUES
(1, 'Anurag Kashyap', 'anuraglogin', '12-04-1970', 'Male', 7485964174),
(2, 'Yash Chopra', 'yashlogin', '01-09-1775', 'Male', 9685746352),
(3, 'Farhan Akhtar', 'farhanlogin', '07-01-1982', 'Male', 8596154789),
(4, 'Gauri Shinde', 'gaurilogin', '31-03-1990', 'Female', 9328174519),
(5, 'Zoya Akhtar', 'zoyalogin', '17-05-1984', 'Female', 7989465317),
(6, 'Meghna Gulzar', 'meghnalogin', '14-06-1988', 'Female', 8789818386);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `movie_name` varchar(50) NOT NULL,
  `movie_actor` varchar(200) NOT NULL,
  `movie_platform` varchar(50) NOT NULL,
  `movie_release_date` varchar(15) NOT NULL,
  `c_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `movie_name`, `movie_actor`, `movie_platform`, `movie_release_date`, `c_id`, `d_id`) VALUES
(1, 'Crew', 'Kriti Sanon, Kareena Kapoor Khan, Tabu, Diljit Dosanjh, Kapil Sharma, Saswata Chatterjee, Kulbhushan Kharbanda, Pooja Bhamrrah, Myra Singh', 'Netflix', '2024-03-29', 1, 1),
(2, 'The Lost Girl', 'Aronica Ranoliya, Prachi Bansal, Bhupesh Singh, Poonam Jangra, Naveen Nishad, Raveesh Singh, Raman Nassa, Akshay Mishra, Neeva Malik', 'Amazon Prime Video', '2024-04-05', 2, 2),
(3, 'Dukaan', 'Monika Panwar, Insane Ashraf, Sikandar Kher, Soham Majumdar, Monali Thakur, Vrajesh Hirjee, Azhar J Malik, Shreya Sharma, Anannya Vaidya', 'Disney + Hotstar', '2024-04-02', 3, 1),
(4, 'Maidaan', 'Ajay Devgn, Priyamani, Gajraj Rao, Rudranil Ghosh', 'Amazon Prime Video', '2024-04-10', 4, 2),
(5, 'Masoom Kaatil', 'Aakash Gupta, Jagriti Reigns, Shyam Bharteey', 'Netflix', '2024-04-12', 5, 1),
(6, 'Amar Singh Chamkila', 'Diljit Dosanjh, Parineeti Chopra, Apinderdeep Singh, Rahul Mittra, Nisha Bano, Anjum Batra, Vipin Katyal, Udaybir Sandhu', 'Disney + Hotstar', '2024-04-14', 6, 2),
(7, 'Mr. & Mrs. Mahi', 'Rajkumar Rao, Janhvi Kapoor', 'Amazon Pime Video', '2024-04-24', 1, 3),
(8, 'LSD 2', 'Nimrit Ahluwalia', 'Netflix', '2024-04-21', 2, 4),
(9, 'Do Aur Do Pyaar', 'Vidya Balan, PratikGandhi, Ileana DCruz, Sendhil Ramamurthy', 'Disney + Hotstar', '2024-04-19', 3, 5),
(10, 'Silence 2', 'Manoj Bajpayee, Prachi Desai, Sahil Vaid, Vaquar Shaikh', 'Disney + Hotstar', '2024-04-16', 4, 6),
(11, 'Gabru Gang', 'Abhishek Duhan, Srishty Rode, Abhilash Kumar, Avtar Gill, Arti Puri, Mukesh S. Bhatt, Priyanka Khera, kanwalpreet Singh, Brijesh Tiwari, Pratyaksh Panwar, Rehaan Khan, Rajveer Saluja', 'Netflix', '2024-04-26', 5, 3),
(12, 'The Sabarmati Report', 'Ridhi Dogra, Raashi Khanna, Vikrant Massey', 'Amazon Pime Video', '2024-05-03', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `r_id` int(11) NOT NULL,
  `r_star` int(11) NOT NULL,
  `r_text` varchar(200) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` varchar(200) NOT NULL DEFAULT 'No Reply'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`r_id`, `r_star`, `r_text`, `movie_id`, `user_id`, `reply`) VALUES
(1, 4, 'Fantastic Movie', 1, 1, 'No Reply'),
(3, 5, 'Really Good', 2, 1, 'No Reply'),
(6, 4, 'Fantastic Movie', 4, 2, 'No Reply'),
(7, 3, 'Terrible', 3, 2, 'No Reply'),
(9, 4, 'Fantastic', 5, 3, 'No Reply');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `user_phone` bigint(20) NOT NULL,
  `user_age` int(11) NOT NULL,
  `user_gender` varchar(10) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_phone`, `user_age`, `user_gender`, `user_address`, `user_email`) VALUES
(1, 'Ram Kumar', 'ramlogin', 7845127845, 28, 'Male', 'Rohini Sector 16', 'ram@gmail.com'),
(2, 'Seeta Kumari', 'seetalogin', 8595636196, 21, 'Female', 'Rithala', 'seeta@gmail.com'),
(3, 'Pawan Gupta', 'pawanlogin', 8956741819, 27, 'Male', 'Noida sector 62', 'pawan@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `director`
--
ALTER TABLE `director`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
