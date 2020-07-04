-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2019 at 01:46 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_set`
--
CREATE DATABASE IF NOT EXISTS `db_set` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_set`;

-- --------------------------------------------------------

--
-- Table structure for table `set_category`
--

CREATE TABLE `set_category` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_category`
--

INSERT INTO `set_category` (`id`, `name`, `description`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SELF', 'Self Evaluation', 'self', 0, '2019-04-06 23:24:28', '2019-04-16 09:13:52'),
(2, 'PEER', 'Peer Evaluation', 'peer', 0, '2019-04-06 23:24:51', '2019-04-16 09:13:58'),
(3, 'Supervisory Visit', 'Supervisory Visit Evaluation', 'supervisory-visit', 0, '2019-04-06 23:25:41', '2019-04-06 23:26:38'),
(4, 'SET', 'Student Evaluation for Teacher', 'set', 0, '2019-04-06 23:26:13', '2019-04-06 23:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `set_department`
--

CREATE TABLE `set_department` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_department`
--

INSERT INTO `set_department` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BSIT', 'Information Technology', 0, '2019-04-06 12:37:15', '2019-04-17 10:57:04'),
(2, 'BIT', 'Industrial Technology', 0, '2019-04-08 09:59:44', '2019-04-17 10:56:47'),
(3, 'ADMIN', 'Deans Office', 0, '2019-04-18 02:06:59', '2019-04-18 09:58:18'),
(4, 'BSBM', 'Business Management', 0, '2019-04-18 09:43:15', '2019-04-18 09:43:15'),
(5, 'HRM', 'Hotel and Restaurant Management', 0, '2019-04-18 09:43:37', '2019-04-18 09:43:37'),
(6, 'COE', 'Computer Engineering', 0, '2019-04-18 09:51:33', '2019-04-18 09:51:33'),
(7, 'BSCS', 'Computer Science', 0, '2019-04-18 09:51:50', '2019-04-18 09:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `set_evaluatee`
--

CREATE TABLE `set_evaluatee` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `peer_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_evaluatee`
--

INSERT INTO `set_evaluatee` (`id`, `user_id`, `peer_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 49, 4, 0, '2019-04-19 05:53:39', '2019-04-19 05:53:39'),
(2, 50, 4, 0, '2019-04-19 05:53:39', '2019-04-19 05:53:39'),
(3, 55, 4, 0, '2019-04-19 05:53:40', '2019-04-19 05:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `set_evaluation`
--

CREATE TABLE `set_evaluation` (
  `id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluated_by` int(11) NOT NULL,
  `answers` text NOT NULL,
  `score` float(10,2) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_evaluation`
--

INSERT INTO `set_evaluation` (`id`, `semester_id`, `category_id`, `user_id`, `evaluated_by`, `answers`, `score`, `status`, `created_at`, `updated_at`) VALUES
(30, 2, 4, 50, 1, 'SET', 4.32, 0, '2019-04-18 10:27:02', '2019-04-18 10:41:08'),
(31, 1, 4, 51, 1, 'SET', 3.85, 0, '2019-04-18 10:27:02', '2019-04-18 10:27:02'),
(32, 1, 4, 52, 1, 'SET', 3.95, 0, '2019-04-18 10:27:02', '2019-04-18 10:27:02'),
(33, 1, 4, 53, 1, 'SET', 3.92, 0, '2019-04-18 10:27:02', '2019-04-18 10:27:02'),
(34, 1, 4, 54, 1, 'SET', 4.30, 0, '2019-04-18 10:27:02', '2019-04-18 10:27:02'),
(35, 1, 4, 55, 1, 'SET', 4.22, 0, '2019-04-18 10:27:02', '2019-04-18 10:27:02'),
(36, 1, 4, 49, 1, 'SET', 4.32, 0, '2019-04-18 10:27:02', '2019-04-18 10:27:02'),
(37, 1, 1, 1, 1, '{\"1\":{\"1\":\"3\",\"2\":\"4\",\"3\":\"3\",\"4\":\"4\",\"5\":\"4\",\"14\":\"4\"},\"2\":{\"6\":\"4\",\"7\":\"5\",\"8\":\"5\",\"9\":\"4\",\"10\":\"5\"},\"3\":{\"11\":\"4\",\"12\":\"4\",\"13\":\"5\",\"15\":\"4\"},\"4\":{\"16\":\"4\",\"17\":\"5\",\"18\":\"4\",\"19\":\"5\",\"20\":\"5\"}}', 4.28, 0, '2019-04-19 05:57:40', '2019-04-19 05:57:40');

-- --------------------------------------------------------

--
-- Table structure for table `set_form`
--

CREATE TABLE `set_form` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_form`
--

INSERT INTO `set_form` (`id`, `question`, `category_id`, `type_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demonstrate sensitiviy to students ability to attend and absorb content information.', 1, 1, 0, '2019-04-07 02:21:22', '2019-04-07 02:21:22'),
(2, 'Integrates sensitivity his/her learning objectives with those of the students in a collaborative process.', 1, 1, 0, '2019-04-07 02:21:47', '2019-04-07 02:21:47'),
(3, 'Makes self available to students beyond official time.', 1, 1, 0, '2019-04-07 02:22:00', '2019-04-07 02:22:00'),
(4, 'Regular comes to class on time, well-groomed and well-prepared to complete assigned responsibilities.', 1, 1, 0, '2019-04-07 02:22:11', '2019-04-07 02:22:11'),
(5, 'Keeps accurate records of students performance and prompt submission of the same.', 1, 1, 0, '2019-04-07 02:22:30', '2019-04-07 02:22:30'),
(6, 'Demonstrates mastery of the subject matter (explain the subject matter without relying solely on the prescribed textbook).', 1, 2, 0, '2019-04-07 02:22:50', '2019-04-07 02:22:50'),
(7, 'Draws and share information on the state on the art of theory and practice in his/her discipline.', 1, 2, 0, '2019-04-07 02:23:04', '2019-04-07 02:23:04'),
(8, 'Integrates subject to practical circumstances and learning intents/purposes of students.', 1, 2, 0, '2019-04-07 02:23:16', '2019-04-07 02:23:16'),
(9, 'Explains the relevance of present topics to the previous lessons, and relates the subject matter to relevant current issues and/or daily life activities.', 1, 2, 0, '2019-04-07 02:23:34', '2019-04-07 02:23:34'),
(10, 'Demonstrates up-to-date knowledge and/or awareness on current trends and issues of the subject.', 1, 2, 0, '2019-04-07 02:23:46', '2019-04-07 02:23:46'),
(11, 'Creates teaching strategies that allow students to practice using concepts that need to understand (interactive discussion).', 1, 3, 0, '2019-04-07 02:23:58', '2019-04-07 02:23:58'),
(12, 'Enhances student self-esteem and/or gives due recognition to students performance/potentials.', 1, 3, 0, '2019-04-07 02:24:12', '2019-04-07 02:24:12'),
(13, 'Allows students to create their own course with objectives and realistically defined student-professor rules and make them accountable for their performance.', 1, 3, 0, '2019-04-07 02:24:23', '2019-04-07 02:24:23'),
(14, 'Allows students to think independently and make their own decisions and holding them accountable for their performance based largely on their success in executing decisions.', 1, 1, 0, '2019-04-07 02:24:44', '2019-04-07 07:38:14'),
(15, 'Encourages students to learn beyond what is required and help/guide the students how to apply the concepts learned.', 1, 3, 0, '2019-04-07 02:24:56', '2019-04-07 02:24:56'),
(16, 'Creates opportunities for intensive and/or extensive contribution of students in the class activities (e.g. breaks class into dyads, triads or buzz/task groups).', 1, 4, 0, '2019-04-07 02:25:09', '2019-04-07 02:25:09'),
(17, 'Assumes roles as facilitator, resource person, coach, inquisitor, integrator, referee in drawing students to contribute to knowledge and understanding of the concepts at hands.', 1, 4, 0, '2019-04-07 02:25:27', '2019-04-07 02:25:27'),
(18, 'Designs and implements learning conditions and experience that promotes healthy exchange and/or confrontations.', 1, 4, 0, '2019-04-07 02:25:46', '2019-04-07 02:25:46'),
(19, 'Structures/re-structures learning and teaching learning context to enhance attainment of collective learning objectives.', 1, 4, 0, '2019-04-07 02:25:57', '2019-04-07 02:25:57'),
(20, 'Use of instructional Materials (audio/video materials: fieldtrips, film showing, computer aided instruction and etc.) to reinforce learning process.', 1, 4, 0, '2019-04-07 02:26:10', '2019-04-07 02:26:10'),
(21, 'Demonstrate sensitiviy to students ability to attend and absorb content information.', 2, 5, 0, '2019-04-07 02:21:22', '2019-04-09 05:18:44'),
(22, 'Integrates sensitivity his/her learning objectives with those of the students in a collaborative process.', 2, 5, 0, '2019-04-07 02:21:47', '2019-04-09 05:18:44'),
(23, 'Makes self available to students beyond official time.', 2, 5, 0, '2019-04-07 02:22:00', '2019-04-09 05:18:44'),
(24, 'Regular comes to class on time, well-groomed and well-prepared to complete assigned responsibilities.', 2, 5, 0, '2019-04-07 02:22:11', '2019-04-09 05:18:44'),
(25, 'Keeps accurate records of students performance and prompt submission of the same.', 2, 5, 0, '2019-04-07 02:22:30', '2019-04-09 05:18:44'),
(26, 'Demonstrates mastery of the subject matter (explain the subject matter without relying solely on the prescribed textbook).', 2, 6, 0, '2019-04-07 02:22:50', '2019-04-09 10:07:36'),
(27, 'Draws and share information on the state on the art of theory and practice in his/her discipline.', 2, 6, 0, '2019-04-07 02:23:04', '2019-04-09 10:07:39'),
(28, 'Integrates subject to practical circumstances and learning intents/purposes of students.', 2, 6, 0, '2019-04-07 02:23:16', '2019-04-09 10:07:42'),
(29, 'Explains the relevance of present topics to the previous lessons, and relates the subject matter to relevant current issues and/or daily life activities.', 2, 6, 0, '2019-04-07 02:23:34', '2019-04-09 10:07:44'),
(30, 'Demonstrates up-to-date knowledge and/or awareness on current trends and issues of the subject.', 2, 6, 0, '2019-04-07 02:23:46', '2019-04-09 10:07:46'),
(31, 'Creates teaching strategies that allow students to practice using concepts that need to understand (interactive discussion).', 2, 7, 0, '2019-04-07 02:23:58', '2019-04-09 10:07:49'),
(32, 'Enhances student self-esteem and/or gives due recognition to students performance/potentials.', 2, 7, 0, '2019-04-07 02:24:12', '2019-04-09 10:07:52'),
(33, 'Allows students to create their own course with objectives and realistically defined student-professor rules and make them accountable for their performance.', 2, 7, 0, '2019-04-07 02:24:23', '2019-04-09 10:07:54'),
(34, 'Allows students to think independently and make their own decisions and holding them accountable for their performance based largely on their success in executing decisions.', 2, 7, 0, '2019-04-07 02:24:44', '2019-04-09 10:07:57'),
(35, 'Encourages students to learn beyond what is required and help/guide the students how to apply the concepts learned.', 2, 7, 0, '2019-04-07 02:24:56', '2019-04-09 10:07:59'),
(36, 'Creates opportunities for intensive and/or extensive contribution of students in the class activities (e.g. breaks class into dyads, triads or buzz/task groups).', 2, 8, 0, '2019-04-07 02:25:09', '2019-04-09 10:08:02'),
(37, 'Assumes roles as facilitator, resource person, coach, inquisitor, integrator, referee in drawing students to contribute to knowledge and understanding of the concepts at hands.', 2, 8, 0, '2019-04-07 02:25:27', '2019-04-09 10:08:04'),
(38, 'Designs and implements learning conditions and experience that promotes healthy exchange and/or confrontations.', 2, 8, 0, '2019-04-07 02:25:46', '2019-04-09 10:08:07'),
(39, 'Structures/re-structures learning and teaching learning context to enhance attainment of collective learning objectives.', 2, 8, 0, '2019-04-07 02:25:57', '2019-04-09 10:08:09'),
(40, 'Use of instructional Materials (audio/video materials: fieldtrips, film showing, computer aided instruction and etc.) to reinforce learning process.', 2, 8, 0, '2019-04-07 02:26:10', '2019-04-09 10:08:11'),
(41, 'Demonstrate Sensitiviy To Students Ability To Attend And Absorb Content Information.', 3, 9, 0, '2019-04-11 14:09:37', '2019-04-11 14:09:37'),
(42, 'Demonstrates Mastery Of The Subject Matter (Explain The Subject Matter Without Relying Solely On The Prescribed Textbook).', 3, 10, 0, '2019-04-11 14:09:55', '2019-04-11 14:09:55'),
(43, 'Creates Teaching Strategies That Allow Students To Practice Using Concepts That Need To Understand (Interactive Discussion).', 3, 11, 0, '2019-04-11 14:10:14', '2019-04-11 14:10:14'),
(44, 'Creates Opportunities For Intensive And/Or Extensive Contribution Of Students In The Class Activities (E.G. Breaks Class Into Dyads, Triads Or Buzz/Task Groups).', 3, 12, 0, '2019-04-11 14:10:40', '2019-04-11 14:10:46'),
(45, 'Integrates Sensitivity His/Her Learning Objectives With Those Of The Students In A Collaborative Process.', 3, 9, 0, '2019-04-11 14:11:37', '2019-04-11 14:11:37'),
(46, '	Makes Self Available To Students Beyond Official Time.', 3, 9, 0, '2019-04-11 14:11:48', '2019-04-11 14:11:48'),
(47, 'Regular Comes To Class On Time, Well-Groomed And Well-Prepared To Complete Assigned Responsibilities.', 3, 9, 0, '2019-04-11 14:12:01', '2019-04-11 14:12:01'),
(48, 'Keeps Accurate Records Of Students Performance And Prompt Submission Of The Same.', 3, 9, 0, '2019-04-11 14:12:27', '2019-04-11 14:12:27'),
(49, '	Draws And Share Information On The State On The Art Of Theory And Practice In His/Her Discipline.', 3, 10, 0, '2019-04-11 14:12:46', '2019-04-11 14:12:46'),
(50, 'Integrates Subject To Practical Circumstances And Learning Intents/Purposes Of Students.', 3, 10, 0, '2019-04-11 14:13:00', '2019-04-11 14:13:00'),
(51, 'Explains The Relevance Of Present Topics To The Previous Lessons, And Relates The Subject Matter To Relevant Current Issues And/Or Daily Life Activities.', 3, 10, 0, '2019-04-11 14:13:13', '2019-04-11 14:13:13'),
(52, 'Demonstrates Up-To-Date Knowledge And/Or Awareness On Current Trends And Issues Of The Subject.', 3, 10, 0, '2019-04-11 14:14:01', '2019-04-11 14:14:01'),
(53, 'Creates Teaching Strategies That Allow Students To Practice Using Concepts That Need To Understand (Interactive Discussion).', 3, 11, 0, '2019-04-11 14:14:12', '2019-04-11 14:14:12'),
(54, 'Enhances Student Self-Esteem And/Or Gives Due Recognition To Students Performance/Potentials.', 3, 11, 0, '2019-04-11 14:14:32', '2019-04-11 14:14:32'),
(55, 'Allows Students To Create Their Own Course With Objectives And Realistically Defined Student-Professor Rules And Make Them Accountable For Their Performance.', 3, 11, 0, '2019-04-11 14:14:41', '2019-04-11 14:14:41'),
(56, '	Encourages Students To Learn Beyond What Is Required And Help/Guide The Students How To Apply The Concepts Learned.', 3, 11, 0, '2019-04-11 14:14:53', '2019-04-11 14:14:53'),
(57, 'Assumes Roles As Facilitator, Resource Person, Coach, Inquisitor, Integrator, Referee In Drawing Students To Contribute To Knowledge And Understanding Of The Concepts At Hands.', 3, 11, 0, '2019-04-11 14:15:05', '2019-04-11 14:15:05'),
(58, 'Designs And Implements Learning Conditions And Experience That Promotes Healthy Exchange And/Or Confrontations.', 3, 12, 0, '2019-04-11 14:15:21', '2019-04-11 14:15:21'),
(59, 'Structures/Re-Structures Learning And Teaching Learning Context To Enhance Attainment Of Collective Learning Objectives.', 3, 12, 0, '2019-04-11 14:15:32', '2019-04-11 14:15:32'),
(60, 'Use Of Instructional Materials (Audio/Video Materials: Fieldtrips, Film Showing, Computer Aided Instruction And Etc.) To Reinforce Learning Process.', 3, 12, 0, '2019-04-11 14:15:43', '2019-04-11 14:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `set_peer`
--

CREATE TABLE `set_peer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_peer`
--

INSERT INTO `set_peer` (`id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(4, 53, 0, '2019-04-19 05:50:56', '2019-04-19 05:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `set_profile`
--

CREATE TABLE `set_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `middle_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `department_id` int(11) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_profile`
--

INSERT INTO `set_profile` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `department_id`, `contact`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'super', 'duper', 'admin', 1, '09124435652', 1, '2019-04-06 07:30:00', '2019-04-19 23:38:39'),
(6, 47, 'head', 'head', 'head', 1, '09124435624', 0, '2019-04-17 11:00:04', '2019-04-17 11:00:04'),
(7, 48, 'dean', 'dean', 'dean', 3, '09124435624', 0, '2019-04-17 11:03:23', '2019-04-18 02:07:19'),
(8, 49, 'janine', 'Instructor', 'bacosmo', 1, '09124435624', 0, '2019-04-17 11:04:40', '2019-04-18 09:24:28'),
(9, 50, 'robert jan', '', 'bayan', 4, '09124435624', 0, '2019-04-18 09:44:57', '2019-04-18 09:44:57'),
(10, 51, 'Joseph', '', 'Cuarez', 1, '09124435624', 0, '2019-04-18 09:46:18', '2019-04-18 09:46:18'),
(11, 52, 'lea', '', 'domingo', 6, '09124435652', 0, '2019-04-18 09:52:33', '2019-04-18 09:52:33'),
(12, 53, 'Frontuna Ron', '', 'Erick', 4, '09124435624', 0, '2019-04-18 09:53:24', '2019-04-18 09:53:24'),
(13, 54, 'Leonard', '', 'Paunil', 7, '09124435652', 0, '2019-04-18 09:55:40', '2019-04-18 10:37:36'),
(14, 55, 'Gerry', '', 'Pena', 1, '09124435624', 0, '2019-04-18 10:11:36', '2019-04-18 10:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `set_question_type`
--

CREATE TABLE `set_question_type` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_question_type`
--

INSERT INTO `set_question_type` (`id`, `category_id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Commitment', 'Commitment', 0, '2019-04-06 12:32:05', '2019-04-07 04:11:46'),
(2, 1, 'Knowledge of the Subject', 'Knowledge Of The Subject', 0, '2019-04-06 12:32:14', '2019-04-07 01:00:32'),
(3, 1, 'Teaching for Independent Learning', 'Teaching for Independent Learning', 0, '2019-04-06 12:32:22', '2019-04-07 01:00:35'),
(4, 1, 'Management of Learning', 'Management of Learning', 0, '2019-04-06 12:32:30', '2019-04-07 01:00:38'),
(5, 2, 'Commitment', 'Commitment', 0, '2019-04-06 12:32:05', '2019-04-07 01:00:41'),
(6, 2, 'Knowledge of the Subject', 'Commitment', 0, '2019-04-06 12:32:05', '2019-04-07 01:01:39'),
(7, 2, 'Teaching for Independent Learning', 'Commitment', 0, '2019-04-06 12:32:05', '2019-04-07 01:01:45'),
(8, 2, 'Management of Learning', 'Knowledge Of The Subject', 0, '2019-04-06 12:32:14', '2019-04-07 01:01:54'),
(9, 3, 'Commitment', 'Knowledge Of The Subject', 0, '2019-04-06 12:32:14', '2019-04-07 01:02:01'),
(10, 3, 'Knowledge of the Subject', 'Knowledge Of The Subject', 0, '2019-04-06 12:32:14', '2019-04-07 01:01:08'),
(11, 3, 'Teaching for Independent Learning', 'Teaching for Independent Learning', 0, '2019-04-07 00:54:56', '2019-04-07 01:01:11'),
(12, 3, 'Management of Learning', 'Management of Learning', 0, '2019-04-07 00:55:19', '2019-04-07 01:01:15'),
(13, 4, 'Commitment', 'Management of Learning', 0, '2019-04-07 00:55:47', '2019-04-07 01:02:19'),
(14, 4, 'Knowledge of the Subject', 'Teaching for Independent Learning', 0, '2019-04-07 00:56:07', '2019-04-07 01:02:24'),
(15, 4, 'Teaching for Independent Learning', 'Management of Learning', 0, '2019-04-07 00:56:37', '2019-04-07 01:02:09'),
(16, 4, 'Management of Learning', 'Teaching for Independent Learning', 0, '2019-04-07 00:57:08', '2019-04-07 01:02:14');

-- --------------------------------------------------------

--
-- Table structure for table `set_semester`
--

CREATE TABLE `set_semester` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_semester`
--

INSERT INTO `set_semester` (`id`, `name`, `description`, `date_from`, `date_to`, `status`, `created_at`, `updated_at`) VALUES
(1, 'First Semester', 'First Semester', '2019-01-01', '2019-05-31', 0, '2019-04-17 10:58:52', '2019-04-17 10:58:52'),
(2, 'Second Semester', 'Second Semester', '2019-06-01', '2019-12-16', 0, '2019-04-17 10:59:31', '2019-04-17 10:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `set_user`
--

CREATE TABLE `set_user` (
  `id` int(10) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `access_token` varchar(256) NOT NULL,
  `auth_key` varchar(256) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_user`
--

INSERT INTO `set_user` (`id`, `username`, `password`, `user_type`, `access_token`, `auth_key`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$13$EEtncHeWMy0FgIrEh2ZR7O0.7bBiH1pJKsmxBA9PO.gbnSDCcBcVW', 3, 'TKO3OebS8o', 'kIAfe30UyG', 1, '2019-01-23 19:29:19', '2019-04-17 11:02:36'),
(47, 'head', '$2y$13$O8TNkzO3NraI7ZpFjA3rVukxORjgxkVndD.e/YMzaXjEMPkmjduHq', 2, 'Jdjs8S15MY', 'rSQ5PbnWkP', 1, '2019-04-17 11:00:04', '2019-04-17 11:00:04'),
(48, 'dean', '$2y$13$iphH6mTnuFEFwEnLE6ybLOxRhtBTsOUfXTKyTMzWV4zQxtjGms3AK', 4, '3Al9NedIHK', 'OlnA4MYU5p', 1, '2019-04-17 11:03:23', '2019-04-18 02:07:19'),
(49, 'Instructor', '$2y$13$tq.QP8f/K4yhBq7/n8JupurlvTs/eAmUIGt7BtNSuwhRPx7EvIIfu', 1, 'x0N8m56vOx', '9hDiVc1e9K', 1, '2019-04-17 11:04:40', '2019-04-18 09:30:38'),
(50, 'robertjan2019', '$2y$13$eB5v.gydgLhOjl8lJfjgJulT6koZ6HuRqqRrSClN7NJReURDWg6bO', 1, 'Fr5GWwbX6c', 'cIxvzrembt', 1, '2019-04-18 09:44:57', '2019-04-18 09:44:57'),
(51, 'Joseph2019', '$2y$13$iNYvYGdO4lP7/2x6uECxgenzBxea9srqS0zfKY9.vdfofRqmO8.E.', 1, 'bZHm6hEkXA', 'Nw1127Vs1I', 1, '2019-04-18 09:46:17', '2019-04-18 09:46:17'),
(52, 'Lea2019', '$2y$13$VyjXyh/MXisz2WB.k7RqEe4ZYttTUpIbr.QiJHHQTk9AX.lVWNG4m', 1, 'lWI6pDjPID', 'StzJYYymJj', 1, '2019-04-18 09:52:33', '2019-04-18 09:52:33'),
(53, 'FrontunaRon2019', '$2y$13$gEFQ1QrWWIhT0zmPki4Iyexu/iJadel2FRSaT91HyX9zT5.ZaH4m2', 1, 'xUCWVf1uXe', 'TE6MJLPj1W', 1, '2019-04-18 09:53:24', '2019-04-18 09:53:24'),
(54, 'Leonard2019', '$2y$13$j/RtcAsXfBqtJodi0KW/Xuh/2APcpyqjgwuDpFgRrN.uOCm7nIDRm', 1, 'r2cEbEvRz2', 'B7XWZJtSIq', 1, '2019-04-18 09:55:40', '2019-04-18 10:37:36'),
(55, 'Gerry2019', '$2y$13$1ZktBDk0nbNZ30wEnGLLJeAJYfgzoPYx1ZiN9D7h0fQNE/1YgCvaq', 1, 'v06FnfUYjA', 'oD1svdHfsI', 1, '2019-04-18 10:11:36', '2019-04-18 10:13:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `set_category`
--
ALTER TABLE `set_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_department`
--
ALTER TABLE `set_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_evaluatee`
--
ALTER TABLE `set_evaluatee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_evaluation`
--
ALTER TABLE `set_evaluation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_form`
--
ALTER TABLE `set_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_peer`
--
ALTER TABLE `set_peer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_profile`
--
ALTER TABLE `set_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_question_type`
--
ALTER TABLE `set_question_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_semester`
--
ALTER TABLE `set_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_user`
--
ALTER TABLE `set_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_2` (`username`,`access_token`,`auth_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `set_category`
--
ALTER TABLE `set_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `set_department`
--
ALTER TABLE `set_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `set_evaluatee`
--
ALTER TABLE `set_evaluatee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `set_evaluation`
--
ALTER TABLE `set_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `set_form`
--
ALTER TABLE `set_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `set_peer`
--
ALTER TABLE `set_peer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `set_profile`
--
ALTER TABLE `set_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `set_question_type`
--
ALTER TABLE `set_question_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `set_semester`
--
ALTER TABLE `set_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `set_user`
--
ALTER TABLE `set_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
