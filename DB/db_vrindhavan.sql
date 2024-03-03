-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2024 at 11:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_vrindhavan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_contact` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_contact`, `admin_email`, `admin_password`) VALUES
(1, 'Admin', '9876543210', 'admin@gmail.com', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(11) NOT NULL,
  `complainttype_id` varchar(15) NOT NULL,
  `complaint_content` varchar(50) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `complaint_date` varchar(50) NOT NULL,
  `complaint_status` varchar(50) NOT NULL DEFAULT '0',
  `complaint_reply` varchar(50) NOT NULL DEFAULT 'Not replied'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complainttype`
--

CREATE TABLE `tbl_complainttype` (
  `complainttype_id` int(11) NOT NULL,
  `complainttype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `designation_id` int(11) NOT NULL,
  `designation_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_content` varchar(50) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `feedback_date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nakshatram`
--

CREATE TABLE `tbl_nakshatram` (
  `nakshatram_id` int(11) NOT NULL,
  `nakshatram_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(11) NOT NULL,
  `place_name` varchar(50) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prasadam`
--

CREATE TABLE `tbl_prasadam` (
  `prasadam_id` int(11) NOT NULL,
  `prasadamtype_id` int(11) NOT NULL,
  `prasadam_name` varchar(50) NOT NULL,
  `prasadam_amount` varchar(50) NOT NULL,
  `prasadam_description` varchar(50) NOT NULL,
  `prasadam_unit` varchar(50) NOT NULL,
  `temple_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prasadambooking`
--

CREATE TABLE `tbl_prasadambooking` (
  `pbooking_id` int(11) NOT NULL,
  `prasadam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pbooking_date` varchar(100) NOT NULL,
  `pbooking_time` varchar(100) NOT NULL,
  `pbooking_amount` varchar(100) NOT NULL,
  `pbooking_unit` varchar(100) NOT NULL,
  `pbooking_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prasadamtype`
--

CREATE TABLE `tbl_prasadamtype` (
  `prasadamtype_id` int(11) NOT NULL,
  `prasadamtype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_queue`
--

CREATE TABLE `tbl_queue` (
  `queue_id` int(11) NOT NULL,
  `queue_time` varchar(20) NOT NULL,
  `queue_count` int(11) NOT NULL,
  `temple_id` int(11) NOT NULL,
  `queuetype_id` int(11) NOT NULL,
  `queue_amount` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_queuebooking`
--

CREATE TABLE `tbl_queuebooking` (
  `qbooking_id` int(11) NOT NULL,
  `queue_id` int(11) NOT NULL,
  `qbooking_count` varchar(100) NOT NULL,
  `qbooking_amount` varchar(100) NOT NULL,
  `qbooking_date` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qbooking_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_queuetype`
--

CREATE TABLE `tbl_queuetype` (
  `queuetype_id` int(11) NOT NULL,
  `queuetype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `staff_contact` varchar(50) NOT NULL,
  `staff_email` varchar(50) NOT NULL,
  `staff_photo` varchar(50) NOT NULL,
  `staff_idproof` varchar(50) NOT NULL,
  `temple_id` varchar(50) NOT NULL,
  `designation_id` varchar(15) NOT NULL,
  `place_id` varchar(15) NOT NULL,
  `staff_address` varchar(50) NOT NULL,
  `staff_pincode` varchar(15) NOT NULL,
  `staff_username` varchar(50) NOT NULL,
  `staff_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_temple`
--

CREATE TABLE `tbl_temple` (
  `temple_id` int(11) NOT NULL,
  `temple_name` varchar(50) NOT NULL,
  `temple_contact` varchar(50) NOT NULL,
  `temple_email` varchar(50) NOT NULL,
  `temple_address` varchar(50) NOT NULL,
  `temple_pincode` varchar(50) NOT NULL,
  `temple_photo` varchar(50) NOT NULL,
  `place_id` int(11) NOT NULL,
  `temple_username` varchar(50) NOT NULL,
  `temple_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_templechart`
--

CREATE TABLE `tbl_templechart` (
  `tchart_id` int(11) NOT NULL,
  `tchart_name` varchar(100) NOT NULL,
  `tchart_date` varchar(100) NOT NULL,
  `tchart_description` varchar(100) NOT NULL,
  `templ_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_contact` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_photo` varchar(50) NOT NULL,
  `place_id` varchar(50) NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vazhipad`
--

CREATE TABLE `tbl_vazhipad` (
  `vazhipad_id` int(11) NOT NULL,
  `temple_id` varchar(15) NOT NULL,
  `vazhipadtype_id` varchar(15) NOT NULL,
  `vazhipad_name` varchar(50) NOT NULL,
  `vazhipad_description` varchar(50) NOT NULL,
  `vazhipad_amount` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vazhipadbooking`
--

CREATE TABLE `tbl_vazhipadbooking` (
  `vbooking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vazhipad_id` int(11) NOT NULL,
  `vbooking_date` varchar(100) NOT NULL,
  `vbooking_time` varchar(100) NOT NULL,
  `vbooking_status` int(11) NOT NULL DEFAULT 0,
  `vbooking_amount` varchar(100) NOT NULL,
  `nakshathram_id` int(11) NOT NULL,
  `vbooking_name` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vazhipadtype`
--

CREATE TABLE `tbl_vazhipadtype` (
  `vazhipadtype_id` int(11) NOT NULL,
  `vazhipadtype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_complainttype`
--
ALTER TABLE `tbl_complainttype`
  ADD PRIMARY KEY (`complainttype_id`);

--
-- Indexes for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_nakshatram`
--
ALTER TABLE `tbl_nakshatram`
  ADD PRIMARY KEY (`nakshatram_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_prasadam`
--
ALTER TABLE `tbl_prasadam`
  ADD PRIMARY KEY (`prasadam_id`);

--
-- Indexes for table `tbl_prasadambooking`
--
ALTER TABLE `tbl_prasadambooking`
  ADD PRIMARY KEY (`pbooking_id`);

--
-- Indexes for table `tbl_prasadamtype`
--
ALTER TABLE `tbl_prasadamtype`
  ADD PRIMARY KEY (`prasadamtype_id`);

--
-- Indexes for table `tbl_queue`
--
ALTER TABLE `tbl_queue`
  ADD PRIMARY KEY (`queue_id`);

--
-- Indexes for table `tbl_queuebooking`
--
ALTER TABLE `tbl_queuebooking`
  ADD PRIMARY KEY (`qbooking_id`);

--
-- Indexes for table `tbl_queuetype`
--
ALTER TABLE `tbl_queuetype`
  ADD PRIMARY KEY (`queuetype_id`);

--
-- Indexes for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `tbl_temple`
--
ALTER TABLE `tbl_temple`
  ADD PRIMARY KEY (`temple_id`);

--
-- Indexes for table `tbl_templechart`
--
ALTER TABLE `tbl_templechart`
  ADD PRIMARY KEY (`tchart_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_vazhipad`
--
ALTER TABLE `tbl_vazhipad`
  ADD PRIMARY KEY (`vazhipad_id`);

--
-- Indexes for table `tbl_vazhipadbooking`
--
ALTER TABLE `tbl_vazhipadbooking`
  ADD PRIMARY KEY (`vbooking_id`);

--
-- Indexes for table `tbl_vazhipadtype`
--
ALTER TABLE `tbl_vazhipadtype`
  ADD PRIMARY KEY (`vazhipadtype_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_complainttype`
--
ALTER TABLE `tbl_complainttype`
  MODIFY `complainttype_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_nakshatram`
--
ALTER TABLE `tbl_nakshatram`
  MODIFY `nakshatram_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_prasadam`
--
ALTER TABLE `tbl_prasadam`
  MODIFY `prasadam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_prasadambooking`
--
ALTER TABLE `tbl_prasadambooking`
  MODIFY `pbooking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_prasadamtype`
--
ALTER TABLE `tbl_prasadamtype`
  MODIFY `prasadamtype_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_queue`
--
ALTER TABLE `tbl_queue`
  MODIFY `queue_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_queuebooking`
--
ALTER TABLE `tbl_queuebooking`
  MODIFY `qbooking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_queuetype`
--
ALTER TABLE `tbl_queuetype`
  MODIFY `queuetype_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_temple`
--
ALTER TABLE `tbl_temple`
  MODIFY `temple_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_templechart`
--
ALTER TABLE `tbl_templechart`
  MODIFY `tchart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_vazhipad`
--
ALTER TABLE `tbl_vazhipad`
  MODIFY `vazhipad_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_vazhipadbooking`
--
ALTER TABLE `tbl_vazhipadbooking`
  MODIFY `vbooking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_vazhipadtype`
--
ALTER TABLE `tbl_vazhipadtype`
  MODIFY `vazhipadtype_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
