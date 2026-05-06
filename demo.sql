-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 30, 2026 at 05:22 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codenichebd_school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `institute_id`, `branch_id`, `title`, `description`, `image`, `status`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Welcome to Fudevs School', 'We provide a nurturing environment, a challenging curriculum, and a dedicated faculty to ensure student success.', 'https://i.ibb.co.com/jkr9s80Q/image.png', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `absent_fines`
--

CREATE TABLE `absent_fines` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `period_id` bigint UNSIGNED NOT NULL,
  `fee_amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `academic_images`
--

CREATE TABLE `academic_images` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `id` bigint UNSIGNED NOT NULL,
  `session` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`id`, `session`, `year`, `created_at`, `updated_at`) VALUES
(1, '2024', '2024-2025', '2026-03-30 11:21:06', '2026-03-30 11:21:06'),
(2, '2025', '2025-2026', '2026-03-30 11:21:06', '2026-03-30 11:21:06'),
(3, '2026', '2026-2027', '2026-03-30 11:21:06', '2026-03-30 11:21:06'),
(4, '2027', '2027-2028', '2026-03-30 11:21:06', '2026-03-30 11:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `accounting_categories`
--

CREATE TABLE `accounting_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounting_categories`
--

INSERT INTO `accounting_categories` (`id`, `institute_id`, `branch_id`, `name`, `code`, `type`, `nature`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Cash & Cash Equivalence', NULL, 'Assets', 'debit', NULL, NULL),
(2, 1, 1, 'Current Liabilities', NULL, 'Liabilities', 'credit', NULL, NULL),
(3, 1, 1, 'Non-Current Liabilities', NULL, 'Liabilities', 'credit', NULL, NULL),
(4, 1, 1, 'Owner’s Equity', NULL, 'Liabilities', 'credit', NULL, NULL),
(5, 1, 1, 'Fees Related Income', NULL, 'Income', 'credit', NULL, NULL),
(6, 1, 1, 'Others Income', NULL, 'Income', 'credit', NULL, NULL),
(7, 1, 1, 'General Expenses', NULL, 'Expense', 'debit', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accounting_funds`
--

CREATE TABLE `accounting_funds` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `serial` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cash_in` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cash_out` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounting_funds`
--

INSERT INTO `accounting_funds` (`id`, `institute_id`, `branch_id`, `serial`, `name`, `cash_in`, `cash_out`, `balance`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'General Fund', '102000.00', '0.00', '102000.00', '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `accounting_groups`
--

CREATE TABLE `accounting_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `accounting_category_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounting_groups`
--

INSERT INTO `accounting_groups` (`id`, `institute_id`, `branch_id`, `accounting_category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Cash', NULL, NULL),
(2, 1, 1, 1, 'Digital Payment', NULL, NULL),
(3, 1, 1, 2, 'Accounts Payable', NULL, NULL),
(4, 1, 1, 3, 'Long Term Loan', NULL, NULL),
(5, 1, 1, 4, 'Opening Balance Equity', NULL, NULL),
(6, 1, 1, 5, 'Income From Fees', NULL, NULL),
(7, 1, 1, 5, 'Income From Fine', NULL, NULL),
(8, 1, 1, 6, 'Rental Income', NULL, NULL),
(9, 1, 1, 6, 'Old Things Sells Income', NULL, NULL),
(10, 1, 1, 6, 'Others Miscellaneous Income', NULL, NULL),
(11, 1, 1, 6, 'Donation', NULL, NULL),
(12, 1, 1, 7, 'Advertising / Promotional', NULL, NULL),
(13, 1, 1, 7, 'Occasional Expenses', NULL, NULL),
(14, 1, 1, 7, 'Bank Charge', NULL, NULL),
(15, 1, 1, 7, 'Others Miscellaneous Expenses', NULL, NULL),
(16, 1, 1, 7, 'Convenience Expenses', NULL, NULL),
(17, 1, 1, 7, 'Utilities Expenses', NULL, NULL),
(18, 1, 1, 7, 'Meals &amp; Entertainment', NULL, NULL),
(19, 1, 1, 7, 'Exam Expenses', NULL, NULL),
(20, 1, 1, 7, 'Rental Expenses', NULL, NULL),
(21, 1, 1, 7, 'Software Charge', NULL, NULL),
(22, 1, 1, 7, 'Stationary Expenses', NULL, NULL),
(23, 1, 1, 7, 'Repair & Maintenance', NULL, NULL),
(24, 1, 1, 7, 'Payroll Expenses', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accounting_ledgers`
--

CREATE TABLE `accounting_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `ledger_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accounting_category_id` bigint UNSIGNED DEFAULT NULL,
  `accounting_group_id` bigint UNSIGNED DEFAULT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` enum('payment','default') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounting_ledgers`
--

INSERT INTO `accounting_ledgers` (`id`, `institute_id`, `branch_id`, `ledger_name`, `accounting_category_id`, `accounting_group_id`, `balance`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Cash', 1, 1, '0.00', 'default', NULL, NULL),
(2, 1, 1, 'Digital Payment', 1, 2, '0.00', 'default', NULL, NULL),
(3, 1, 1, 'Accounts Payable', 2, 3, '0.00', 'default', NULL, NULL),
(4, 1, 1, 'Tuition Fee Refund', 2, 3, '0.00', 'default', NULL, NULL),
(5, 1, 1, 'Director`s Loan ', 3, 4, '0.00', 'default', NULL, NULL),
(6, 1, 1, 'Opening Balance Equity', 4, 5, '0.00', 'default', NULL, NULL),
(7, 1, 1, 'Admission Fees Collection', 5, 6, '75000.00', 'default', NULL, NULL),
(8, 1, 1, 'Board Fees Collection', 5, 6, '0.00', 'default', NULL, NULL),
(9, 1, 1, 'Dairy And Syllabuss Collection', 5, 6, '0.00', 'default', NULL, NULL),
(10, 1, 1, 'Exam Fees Collection', 5, 6, '0.00', 'default', NULL, NULL),
(11, 1, 1, 'Fee Collections Collection', 5, 6, '0.00', 'default', NULL, NULL),
(12, 1, 1, 'Session Charge Collection', 5, 6, '0.00', 'default', NULL, NULL),
(13, 1, 1, 'Study Materials Fees Collection', 5, 6, '0.00', 'default', NULL, NULL),
(14, 1, 1, 'TC Fees Collection', 5, 6, '0.00', 'default', NULL, NULL),
(15, 1, 1, 'Testimonial Fees Collection', 5, 6, '0.00', 'default', NULL, NULL),
(16, 1, 1, 'Tie And Id Card Collection', 5, 6, '0.00', 'default', NULL, NULL),
(17, 1, 1, 'Tuition Fees Collection', 5, 6, '27000.00', 'default', NULL, NULL),
(18, 1, 1, 'Attendance Fine', 5, 7, '0.00', 'default', NULL, NULL),
(19, 1, 1, 'Quiz Fine', 5, 7, '0.00', 'default', NULL, NULL),
(20, 1, 1, 'Lab Fine', 5, 7, '0.00', 'default', NULL, NULL),
(21, 1, 1, 'Tuition Fee Fin', 5, 7, '0.00', 'default', NULL, NULL),
(22, 1, 1, 'Late Fine', 5, 7, '0.00', 'default', NULL, NULL),
(23, 1, 1, 'Attendance Make up Fine', 5, 7, '0.00', 'default', NULL, NULL),
(24, 1, 1, 'Laboratories Class Fine', 5, 7, '0.00', 'default', NULL, NULL),
(25, 1, 1, 'ID Card Fine', 5, 7, '0.00', 'default', NULL, NULL),
(26, 1, 1, 'Discipline Fine', 5, 7, '0.00', 'default', NULL, NULL),
(27, 1, 1, 'Library Fine', 5, 7, '0.00', 'default', NULL, NULL),
(28, 1, 1, 'Miscellaneous Fine', 5, 7, '0.00', 'default', NULL, NULL),
(29, 1, 1, 'House Rent(Cr)', 6, 8, '0.00', 'default', NULL, NULL),
(30, 1, 1, 'Old Paper Sells', 6, 9, '0.00', 'default', NULL, NULL),
(31, 1, 1, 'Online Apply Fee', 6, 10, '0.00', 'default', NULL, NULL),
(32, 1, 1, 'Opening Balance', 6, 11, '0.00', 'default', NULL, NULL),
(33, 1, 1, 'Advertisement', 7, 12, '0.00', 'default', NULL, NULL),
(34, 1, 1, 'Anual Sports', 7, 13, '0.00', 'default', NULL, NULL),
(35, 1, 1, 'National Day &amp; Fastival Expanse', 7, 13, '0.00', 'default', NULL, NULL),
(36, 1, 1, 'Ocation', 7, 13, '0.00', 'default', NULL, NULL),
(37, 1, 1, 'Study Tour', 7, 13, '0.00', 'default', NULL, NULL),
(38, 1, 1, 'Bank Charges', 7, 14, '0.00', 'default', NULL, NULL),
(39, 1, 1, 'Board Fee', 7, 15, '0.00', 'default', NULL, NULL),
(40, 1, 1, 'Miscellaneous Exp.', 7, 15, '0.00', 'default', NULL, NULL),
(41, 1, 1, 'Office Expense', 7, 15, '0.00', 'default', NULL, NULL),
(42, 1, 1, 'Conveyance Expenses', 7, 16, '0.00', 'default', NULL, NULL),
(43, 1, 1, 'Electricity Bill', 7, 17, '0.00', 'default', NULL, NULL),
(44, 1, 1, 'Internet Bill', 7, 17, '0.00', 'default', NULL, NULL),
(45, 1, 1, 'Mobile Recharge Exp.', 7, 17, '0.00', 'default', NULL, NULL),
(46, 1, 1, 'Entertainment Exp.', 7, 18, '0.00', 'default', NULL, NULL),
(47, 1, 1, 'Exam Centre Fee', 7, 19, '0.00', 'default', NULL, NULL),
(48, 1, 1, 'Exam Expenses', 7, 19, '0.00', 'default', NULL, NULL),
(49, 1, 1, 'House Rent', 7, 20, '0.00', 'default', NULL, NULL),
(50, 1, 1, 'Netizen Bill Payment', 7, 21, '0.00', 'default', NULL, NULL),
(51, 1, 1, 'Office Stationary', 7, 22, '0.00', 'default', NULL, NULL),
(52, 1, 1, 'Printing & Stationary Expense', 7, 22, '0.00', 'default', NULL, NULL),
(53, 1, 1, 'Repair Expenses', 7, 23, '0.00', 'default', NULL, NULL),
(54, 1, 1, 'Salary & Honorarium (Bank Payment)', 7, 24, '0.00', 'default', NULL, NULL),
(55, 1, 1, 'Salary & Honorarium (Cash Payment)', 7, 24, '0.00', 'default', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `voucher_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `fund_id` bigint UNSIGNED DEFAULT NULL,
  `fund_to_id` bigint UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint UNSIGNED DEFAULT NULL,
  `payment_method_to_id` bigint UNSIGNED DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `type` enum('payment','receipt','contra','fund_transfer','journal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transaction_details`
--

CREATE TABLE `account_transaction_details` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `account_transactions_id` bigint UNSIGNED NOT NULL,
  `fund_id` bigint UNSIGNED DEFAULT NULL,
  `fund_to_id` bigint UNSIGNED DEFAULT NULL,
  `ledger_id` bigint UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint UNSIGNED DEFAULT NULL,
  `payment_method_to_id` bigint UNSIGNED DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `debit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `session_id` int NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `deadline` date NOT NULL,
  `class_id` int NOT NULL,
  `section_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_4` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submits`
--

CREATE TABLE `assignment_submits` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `session_id` int NOT NULL,
  `assignment_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_4` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` double NOT NULL DEFAULT '0',
  `reviewed_by` bigint UNSIGNED DEFAULT NULL,
  `review_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_shifts`
--

CREATE TABLE `assign_shifts` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `shift_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_subjects`
--

CREATE TABLE `assign_subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `section_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_fines`
--

CREATE TABLE `attendance_fines` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `fine_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `waiver` decimal(8,2) NOT NULL DEFAULT '0.00',
  `type` enum('attendance_absent_fine','attendance_quiz_fine','attendance_lab_fine') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'attendance_absent_fine',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_waivers`
--

CREATE TABLE `attendance_waivers` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `attendance_fine` decimal(8,2) NOT NULL DEFAULT '0.00',
  `quiz_fine` decimal(8,2) NOT NULL DEFAULT '0.00',
  `lab_fine` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_waiver` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `button_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `institute_id`, `branch_id`, `title`, `description`, `button_name`, `button_link`, `image`, `status`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Fuedevs School - Excellence in Education, Brighter Futures Ahead!', 'A place where students learn, grow, and succeed.', 'Enroll Now', '#', 'https://i.ibb.co.com/Hf5zNcmQ/image-1.png', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `behaviors`
--

CREATE TABLE `behaviors` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `section_id` int DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `datetime` date DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_group` int DEFAULT NULL,
  `book_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_copy_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identification_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookself` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rack` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_categories`
--

CREATE TABLE `book_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `category_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_categories`
--

INSERT INTO `book_categories` (`id`, `institute_id`, `branch_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'General', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'Fiction', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 1, 'Science Fiction', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 1, 'Mystery', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, 'Non-Fiction', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(6, 1, 1, 'Fantasy', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(7, 1, 1, 'Others', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(8, 1, 2, 'General', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(9, 1, 2, 'Fiction', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(10, 1, 2, 'Science Fiction', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(11, 1, 2, 'Mystery', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(12, 1, 2, 'Non-Fiction', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(13, 1, 2, 'Fantasy', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(14, 1, 2, 'Others', '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `book_id` int NOT NULL,
  `library_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `student_id` bigint UNSIGNED DEFAULT NULL,
  `staff_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `institute_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Demo school', 1, '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(2, 1, 'Demo institute', 1, '2026-03-30 11:21:04', '2026-03-30 11:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `bus_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bus_routes`
--

CREATE TABLE `bus_routes` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `route_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_distance` decimal(5,2) NOT NULL,
  `estimated_time` time NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bus_stops`
--

CREATE TABLE `bus_stops` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `route_id` bigint UNSIGNED NOT NULL,
  `stop_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `stop_order` int NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int UNSIGNED NOT NULL DEFAULT '1',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive' COMMENT 'Chapter status: active, inactive, draft',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `institute_id`, `branch_id`, `class_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Class 1', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'Class 2', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `class_assigns`
--

CREATE TABLE `class_assigns` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_days`
--

CREATE TABLE `class_days` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `day` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_days`
--

INSERT INTO `class_days` (`id`, `institute_id`, `branch_id`, `day`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'SATURDAY', 1, NULL, NULL),
(2, 1, 1, 'SUNDAY', 1, NULL, NULL),
(3, 1, 1, 'MONDAY', 1, NULL, NULL),
(4, 1, 1, 'TUESDAY', 1, NULL, NULL),
(5, 1, 1, 'WEDNESDAY', 1, NULL, NULL),
(6, 1, 1, 'THURSDAY', 1, NULL, NULL),
(7, 1, 1, 'FRIDAY', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_exams`
--

CREATE TABLE `class_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `merit_process_type_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `session_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_lessons`
--

CREATE TABLE `class_lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int NOT NULL,
  `section_id` int NOT NULL,
  `subject_id` int DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_routines`
--

CREATE TABLE `class_routines` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `section_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `day` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `isSeen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `chapter_id` bigint UNSIGNED NOT NULL,
  `type` enum('lesson','quiz','assignment','pdf','offline') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` bigint UNSIGNED NOT NULL,
  `serial` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_visibility`
--

CREATE TABLE `content_visibility` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `chapter_id` bigint UNSIGNED NOT NULL,
  `content_id` bigint UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `course_category_id` bigint UNSIGNED NOT NULL,
  `course_sub_category_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` longtext COLLATE utf8mb4_unicode_ci,
  `embedded_url` longtext COLLATE utf8mb4_unicode_ci,
  `uploaded_video_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('draft','schedule','published','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft' COMMENT 'Course status: draft, schedule, published, private',
  `publish_date` date DEFAULT NULL,
  `type` enum('single','bundle') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'single' COMMENT 'Course type: single, bundle',
  `payment_type` enum('free','recurring_payment','one_time') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `invoice_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fake_enrolled_students` int NOT NULL DEFAULT '0',
  `total_classes` int NOT NULL DEFAULT '0',
  `total_notes` int NOT NULL DEFAULT '0',
  `total_exams` int NOT NULL DEFAULT '0',
  `regular_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `offer_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `repeat_count` int NOT NULL DEFAULT '0',
  `payment_duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_cycles` int DEFAULT NULL,
  `is_infinity` tinyint(1) NOT NULL DEFAULT '0',
  `is_auto_generate_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `class_routine_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `total_view` int UNSIGNED NOT NULL DEFAULT '0',
  `total_enrolled` int UNSIGNED NOT NULL DEFAULT '0',
  `avg_rating` decimal(10,2) NOT NULL DEFAULT '0.00',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `requirements` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int UNSIGNED NOT NULL DEFAULT '1',
  `enable_homepage` tinyint(1) NOT NULL DEFAULT '1',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_faqs`
--

CREATE TABLE `course_faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_features`
--

CREATE TABLE `course_features` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` longtext COLLATE utf8mb4_unicode_ci,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'student' COMMENT 'student, teacher, employee',
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'database key e.g blood_group',
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Display label',
  `field_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text' COMMENT 'text, number, select, date, checkbox',
  `options` json DEFAULT NULL COMMENT 'For select, checkbox options',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_form` tinyint(1) NOT NULL DEFAULT '1',
  `show_in_list` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_profile` tinyint(1) NOT NULL DEFAULT '1',
  `serial` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `custom_field_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `department_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `institute_id`, `branch_id`, `department_name`, `slug`, `priority`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Bangla', 'bangla', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'English', 'english', 2, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 1, 'ICT', 'ict', 3, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 1, 'Math', 'math', 4, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, 'Physics', 'physics', 5, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(6, 1, 1, 'Chemistry', 'chemistry', 6, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(7, 1, 1, 'Biology', 'biology', 7, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(8, 1, 1, 'Humanities', 'humanities', 8, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(9, 1, 1, 'Business Studies', 'business-studies', 9, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(10, 1, 1, 'Administration', 'administration', 10, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(11, 1, 1, 'Principal Office', 'principal-office', 11, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(12, 1, 1, 'Academic/Main Office', 'academic-main-office', 12, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(13, 1, 1, 'Exam', 'exam', 13, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(14, 1, 1, 'Account', 'account', 14, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(15, 1, 1, 'Guidance', 'guidance', 15, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(16, 1, 1, 'Information & Technology', 'information-&-technology', 16, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(17, 1, 1, 'Laboratories', 'laboratories', 17, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(18, 1, 1, 'Library', 'library', 18, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(19, 1, 1, 'Store Room', 'store-room', 19, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(20, 1, 1, 'Maintenance', 'maintenance', 20, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(21, 1, 1, 'Bookstore', 'bookstore', 21, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(22, 1, 1, 'Student Work Program', 'student-work-program', 22, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(23, 1, 2, 'Bangla', 'bangla', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(24, 1, 2, 'English', 'english', 2, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(25, 1, 2, 'ICT', 'ict', 3, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(26, 1, 2, 'Math', 'math', 4, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(27, 1, 2, 'Physics', 'physics', 5, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(28, 1, 2, 'Chemistry', 'chemistry', 6, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(29, 1, 2, 'Biology', 'biology', 7, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(30, 1, 2, 'Humanities', 'humanities', 8, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(31, 1, 2, 'Business Studies', 'business-studies', 9, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(32, 1, 2, 'Administration', 'administration', 10, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(33, 1, 2, 'Principal Office', 'principal-office', 11, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(34, 1, 2, 'Academic/Main Office', 'academic-main-office', 12, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(35, 1, 2, 'Exam', 'exam', 13, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(36, 1, 2, 'Account', 'account', 14, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(37, 1, 2, 'Guidance', 'guidance', 15, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(38, 1, 2, 'Information & Technology', 'information-&-technology', 16, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(39, 1, 2, 'Laboratories', 'laboratories', 17, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(40, 1, 2, 'Library', 'library', 18, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(41, 1, 2, 'Store Room', 'store-room', 19, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(42, 1, 2, 'Maintenance', 'maintenance', 20, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(43, 1, 2, 'Bookstore', 'bookstore', 21, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(44, 1, 2, 'Student Work Program', 'student-work-program', 22, '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `device_controls`
--

CREATE TABLE `device_controls` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `device_access_type` enum('single','multiple','unlimited') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'single',
  `device_limit` int UNSIGNED DEFAULT NULL COMMENT 'Applicable only for multiple',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assigned_bus_id` bigint UNSIGNED DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `enrollment_type` enum('one_time','monthly_subscription') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_time',
  `enrollment_date` date NOT NULL,
  `subscription_start` timestamp NULL DEFAULT NULL,
  `subscription_end` timestamp NULL DEFAULT NULL,
  `amount_paid` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` enum('active','inactive','blocked') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive' COMMENT 'Enrollment status: active, inactive, blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_attendances`
--

CREATE TABLE `exam_attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `exam_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `section_id` int NOT NULL,
  `date` date NOT NULL,
  `attendance` int NOT NULL DEFAULT '2',
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_codes`
--

CREATE TABLE `exam_codes` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_model_id` bigint UNSIGNED NOT NULL,
  `short_code_id` bigint UNSIGNED NOT NULL,
  `short_code_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_code_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_id` int DEFAULT NULL,
  `total_mark` decimal(5,2) DEFAULT NULL,
  `accept_percent` decimal(5,2) DEFAULT NULL,
  `pass_mark` decimal(5,2) DEFAULT NULL,
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_grades`
--

CREATE TABLE `exam_grades` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_model_id` bigint UNSIGNED NOT NULL,
  `grade_id` bigint UNSIGNED NOT NULL,
  `grade_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_number` decimal(5,2) NOT NULL,
  `grade_point` decimal(5,2) NOT NULL,
  `grade_range` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_high` decimal(5,2) NOT NULL,
  `number_low` decimal(5,2) NOT NULL,
  `point_high` decimal(5,2) NOT NULL,
  `point_low` decimal(5,2) NOT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `session_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `mark1` decimal(5,2) NOT NULL DEFAULT '0.00',
  `mark2` decimal(5,2) NOT NULL DEFAULT '0.00',
  `mark3` decimal(5,2) NOT NULL DEFAULT '0.00',
  `mark4` decimal(5,2) NOT NULL DEFAULT '0.00',
  `mark5` decimal(5,2) NOT NULL DEFAULT '0.00',
  `mark6` decimal(5,2) NOT NULL DEFAULT '0.00',
  `total_marks` decimal(5,2) NOT NULL DEFAULT '0.00',
  `grade_point` decimal(5,2) NOT NULL DEFAULT '0.00',
  `grade` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_schedules`
--

CREATE TABLE `exam_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `exam_id` int NOT NULL,
  `class_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `room` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_questions`
--

CREATE TABLE `faq_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_questions`
--

INSERT INTO `faq_questions` (`id`, `institute_id`, `branch_id`, `question`, `answer`, `status`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'What is an academic program?', 'The academic program is a one stop solution for students. Where every student has the opportunity to ensure A+ preparation for  board exams through interactive live classes, homework, live tests and progress analysis by the best mentors in each subject throughout the year. Once a student starts this program, he will not have to go to any coaching or private tutor after school/college.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(2, 1, 1, 'What is an academic program?', 'The academic program is a one stop solution for students. Where every student has the opportunity to ensure A+ preparation for  board exams through interactive live classes, homework, live tests and progress analysis by the best mentors in each subject throughout the year. Once a student starts this program, he will not have to go to any coaching or private tutor after school/college.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(3, 1, 1, 'What is an academic program?', 'The academic program is a one stop solution for students. Where every student has the opportunity to ensure A+ preparation for  board exams through interactive live classes, homework, live tests and progress analysis by the best mentors in each subject throughout the year. Once a student starts this program, he will not have to go to any coaching or private tutor after school/college.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'I love learning here! The teachers are supportive, and the activities are fun.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 2, 'A great place to teach! The school values both students and educators.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 3, 'The best decision for my child! Excellent education and communication.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `session_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `section_id` bigint UNSIGNED DEFAULT NULL,
  `group_id` bigint UNSIGNED DEFAULT NULL,
  `student_category_id` bigint UNSIGNED DEFAULT NULL,
  `fee_head_id` bigint UNSIGNED DEFAULT NULL,
  `fee_amount` decimal(8,2) NOT NULL,
  `fine_amount` decimal(8,2) DEFAULT NULL,
  `fund_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_date_configs`
--

CREATE TABLE `fee_date_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `fee_sub_head_id` bigint UNSIGNED NOT NULL,
  `payable_date_start` date NOT NULL,
  `payable_date_end` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_heads`
--

CREATE TABLE `fee_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_heads`
--

INSERT INTO `fee_heads` (`id`, `institute_id`, `branch_id`, `name`, `serial`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Admission Fees', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'Admission Form Fees', 2, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 1, 'Session Charge', 3, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 1, 'Online Apply Fees', 4, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, 'Tuition Fees', 5, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(6, 1, 1, 'College Examination Fees', 6, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(7, 1, 1, 'Model Test Fees', 7, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(8, 1, 1, 'Re-Take Exam Fees', 8, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(9, 1, 1, 'Form Fill Up/Registration', 9, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(10, 1, 1, 'TC/Admission Cancel', 10, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(11, 1, 1, 'Testimonial Fees', 11, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(12, 1, 1, 'Study Materials', 12, '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `fee_maps`
--

CREATE TABLE `fee_maps` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `fee_head_id` bigint UNSIGNED NOT NULL,
  `ledger_id` bigint UNSIGNED NOT NULL,
  `fund` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('fee','fee_fine') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fee',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_map_fee_sub_head`
--

CREATE TABLE `fee_map_fee_sub_head` (
  `id` bigint UNSIGNED NOT NULL,
  `fee_map_id` bigint UNSIGNED DEFAULT NULL,
  `fee_head_id` bigint UNSIGNED DEFAULT NULL,
  `fee_sub_head_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_map_fund`
--

CREATE TABLE `fee_map_fund` (
  `id` bigint UNSIGNED NOT NULL,
  `fee_map_id` bigint UNSIGNED DEFAULT NULL,
  `fund_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_sub_heads`
--

CREATE TABLE `fee_sub_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `fee_head_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_sub_heads`
--

INSERT INTO `fee_sub_heads` (`id`, `institute_id`, `branch_id`, `fee_head_id`, `name`, `serial`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'Admission Fee', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, NULL, 'January', 2, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 1, NULL, 'February', 3, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 1, NULL, 'March', 4, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, NULL, 'April', 5, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(6, 1, 1, NULL, 'May', 6, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(7, 1, 1, NULL, 'June', 7, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(8, 1, 1, NULL, 'July', 8, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(9, 1, 1, NULL, 'August', 9, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(10, 1, 1, NULL, 'September', 10, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(11, 1, 1, NULL, 'October', 11, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(12, 1, 1, NULL, 'November', 12, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(13, 1, 1, NULL, 'December', 13, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(14, 1, 1, NULL, 'Session Charge', 14, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(15, 1, 1, NULL, '1st Term Exam', 15, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(16, 1, 1, NULL, '2nd Semester Exam', 16, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(17, 1, 1, NULL, '1st Semester Exam', 17, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(18, 1, 1, NULL, '3rd Semester Exam', 18, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(19, 1, 1, NULL, '1st Model test', 19, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(20, 1, 1, NULL, '2nd Model Test', 20, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(21, 1, 1, NULL, '3rd Model Test', 21, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(22, 1, 1, NULL, 'Attendance Fine', 22, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(23, 1, 1, NULL, 'Quiz Fine', 23, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(24, 1, 1, NULL, 'Lab Fine', 24, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(25, 1, 1, NULL, 'Library Fine', 25, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(26, 1, 1, NULL, 'Late Fine', 26, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(27, 1, 1, NULL, 'ID Card Fine', 27, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(28, 1, 1, NULL, 'Discipline Fine', 28, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(29, 1, 1, NULL, 'Miscellaneous Fine', 29, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(30, 1, 1, NULL, 'Laboratories Exam Fine', 30, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(31, 1, 1, NULL, 'College Examination Fee', 31, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(32, 1, 1, NULL, 'Model Test Fee', 32, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(33, 1, 1, NULL, 'Re-Take Exam Fee', 33, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(34, 1, 1, NULL, 'Tc/Admission Cancel', 34, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(35, 1, 1, NULL, 'Form Fill Up/Registration', 35, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(36, 1, 1, NULL, 'Admission Income (Form, SMS & Others)', 36, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(37, 1, 1, NULL, 'Different Type of course fees', 37, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(38, 1, 1, NULL, 'Stipend', 38, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(39, 1, 1, NULL, 'College Report', 39, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(40, 1, 1, NULL, 'Miscellaneous Income', 40, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(41, 1, 1, NULL, 'Tuition Book/Rosid Book', 41, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(42, 1, 1, NULL, 'ID Card New/Fita/Folder', 42, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(43, 1, 1, NULL, 'Online Apply Fees', 43, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(44, 1, 1, NULL, 'Testimonial Fees', 44, '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `frontend_contacts`
--

CREATE TABLE `frontend_contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gamifications`
--

CREATE TABLE `gamifications` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `section_id` int DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `grade_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_number` decimal(5,2) NOT NULL,
  `grade_point` decimal(5,2) NOT NULL,
  `grade_range` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_high` decimal(5,2) NOT NULL,
  `number_low` decimal(5,2) NOT NULL,
  `point_high` decimal(5,2) NOT NULL,
  `point_low` decimal(5,2) NOT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `institute_id`, `branch_id`, `grade_name`, `grade_number`, `grade_point`, `grade_range`, `number_high`, `number_low`, `point_high`, `point_low`, `priority`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'A+', '80.00', '5.00', '80-100', '100.00', '80.00', '5.00', '5.00', '1', NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'A', '70.00', '4.00', '70-79', '79.99', '70.00', '4.99', '4.00', '2', NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 1, 'A-', '60.00', '3.50', '60-69', '69.99', '60.00', '3.99', '3.50', '3', NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 1, 'B', '50.00', '3.00', '50-59', '59.99', '50.00', '3.49', '3.00', '4', NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, 'C', '40.00', '2.00', '40-49', '49.99', '40.00', '2.99', '2.00', '5', NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(6, 1, 1, 'D', '33.00', '1.00', '33-39', '39.99', '33.00', '1.99', '1.00', '6', NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(7, 1, 1, 'F', '0.00', '0.00', '00-32', '32.99', '0.00', '0.00', '0.00', '7', NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `grand_final_class_exams`
--

CREATE TABLE `grand_final_class_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `serial_no` int UNSIGNED NOT NULL,
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostels`
--

CREATE TABLE `hostels` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `hostel_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_bills`
--

CREATE TABLE `hostel_bills` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `hostel_fee` decimal(8,2) NOT NULL,
  `meal_fee` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(8,2) NOT NULL,
  `status` enum('pending','paid','overdue') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `due_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_categories`
--

CREATE TABLE `hostel_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `hostel_id` bigint UNSIGNED NOT NULL,
  `standard` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hostel_fee` decimal(8,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_members`
--

CREATE TABLE `hostel_members` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `hostel_category_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `institutes`
--

CREATE TABLE `institutes` (
  `id` bigint UNSIGNED NOT NULL,
  `owner_id` bigint UNSIGNED DEFAULT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institute_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` enum('WEB','APP') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'APP',
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `deleted_by` bigint UNSIGNED DEFAULT NULL,
  `theme_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `institutes`
--

INSERT INTO `institutes` (`id`, `owner_id`, `assigned_to`, `name`, `email`, `address`, `institute_type`, `phone`, `domain`, `logo`, `platform`, `status`, `created_by`, `updated_by`, `deleted_by`, `theme_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, NULL, 'Demo Institute', NULL, '123 Main Street, City', 'School', '1234567890', 'institute1.com', NULL, 'WEB', 1, NULL, NULL, NULL, NULL, '2026-03-30 11:21:04', '2026-03-30 11:21:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `institute_image_settings`
--

CREATE TABLE `institute_image_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `header_logo_light_theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_logo_dark_theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo_light_theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo_dark_theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 0=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `institute_image_s_a_a_s_settings`
--

CREATE TABLE `institute_image_s_a_a_s_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `header_logo_light_theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_logo_dark_theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo_light_theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo_dark_theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 0=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `institute_id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Medical Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'Vacation Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 1, 'Emergency Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 1, 'Maternity/Paternity Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, 'Study Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(6, 1, 1, 'Sick Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(7, 1, 1, 'Family Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(8, 1, 1, 'Special Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(9, 1, 1, 'Educational Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(10, 1, 1, 'Bereavement Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(11, 1, 1, 'Religious Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(12, 1, 1, 'Extracurricular Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(13, 1, 2, 'Medical Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(14, 1, 2, 'Vacation Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(15, 1, 2, 'Emergency Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(16, 1, 2, 'Maternity/Paternity Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(17, 1, 2, 'Study Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(18, 1, 2, 'Sick Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(19, 1, 2, 'Family Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(20, 1, 2, 'Special Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(21, 1, 2, 'Educational Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(22, 1, 2, 'Bereavement Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(23, 1, 2, 'Religious Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(24, 1, 2, 'Extracurricular Leave', '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `chapter_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `thumbnail_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` longtext COLLATE utf8mb4_unicode_ci,
  `embedded_url` longtext COLLATE utf8mb4_unicode_ci,
  `uploaded_video_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` json DEFAULT NULL,
  `priority` int UNSIGNED NOT NULL DEFAULT '1',
  `playback_hours` int NOT NULL DEFAULT '0',
  `playback_minutes` int NOT NULL DEFAULT '0',
  `playback_seconds` int NOT NULL DEFAULT '0',
  `is_scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `visibility` enum('none','password','public') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active' COMMENT 'Lesson status: active, inactive, draft',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_fines`
--

CREATE TABLE `library_fines` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `book_issue_id` int NOT NULL,
  `library_id` bigint UNSIGNED NOT NULL,
  `fine` decimal(8,2) NOT NULL DEFAULT '0.00',
  `lost_book` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_fine` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_members`
--

CREATE TABLE `library_members` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `library_id` bigint UNSIGNED NOT NULL,
  `member_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `student_id` bigint UNSIGNED DEFAULT NULL,
  `staff_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lms_assignments`
--

CREATE TABLE `lms_assignments` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `chapter_id` bigint UNSIGNED NOT NULL,
  `priority` int UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `due_date` datetime NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lms_assignment_results`
--

CREATE TABLE `lms_assignment_results` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `assignment_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `marks` int DEFAULT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci,
  `submission_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lms_class_routines`
--

CREATE TABLE `lms_class_routines` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `room_id` bigint UNSIGNED DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lms_class_routine_days`
--

CREATE TABLE `lms_class_routine_days` (
  `id` bigint UNSIGNED NOT NULL,
  `routine_id` bigint UNSIGNED NOT NULL,
  `day_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lms_days`
--

CREATE TABLE `lms_days` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lms_rooms`
--

CREATE TABLE `lms_rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lms_zoom_meetings`
--

CREATE TABLE `lms_zoom_meetings` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `agenda` text COLLATE utf8mb4_unicode_ci,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_configs`
--

CREATE TABLE `mark_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `exam_id` bigint UNSIGNED NOT NULL,
  `mark_config_exam_code_id` bigint UNSIGNED NOT NULL,
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_config_exam_codes`
--

CREATE TABLE `mark_config_exam_codes` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_marks` decimal(5,2) NOT NULL DEFAULT '100.00',
  `pass_mark` decimal(5,2) NOT NULL DEFAULT '33.00',
  `acceptance` decimal(5,2) NOT NULL DEFAULT '1.00',
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `meal_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meal_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meal_entries`
--

CREATE TABLE `meal_entries` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `meal_id` bigint UNSIGNED NOT NULL,
  `meal_price` decimal(8,2) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meal_plans`
--

CREATE TABLE `meal_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `meal_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merit_process_types`
--

CREATE TABLE `merit_process_types` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int NOT NULL DEFAULT '1',
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merit_process_types`
--

INSERT INTO `merit_process_types` (`id`, `institute_id`, `branch_id`, `type`, `serial`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Total Mark(Sequential)', 1, NULL, NULL, NULL),
(2, 1, 1, 'Grade Point(Sequential)', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000001_create_institutes_table', 1),
(4, '0001_01_01_000002_create_branches_table', 1),
(5, '0001_01_01_000002_create_jobs_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2018_07_13_155644_create_payment_methods_table', 1),
(8, '2023_10_22_082015_create_accounting_categories_table', 1),
(9, '2023_10_22_082017_create_accounting_groups_table', 1),
(10, '2023_10_22_082056_create_accounting_ledgers_table', 1),
(11, '2023_10_22_082111_create_accounting_funds_table', 1),
(12, '2023_10_23_133635_create_account_transactions_table', 1),
(13, '2023_10_23_133653_create_account_transaction_details_table', 1),
(14, '2023_10_26_042847_create_sms_templates_table', 1),
(15, '2023_10_26_082224_create_phone_book_categories_table', 1),
(16, '2023_10_26_132603_create_phone_books_table', 1),
(17, '2023_11_06_041423_create_fee_heads_table', 1),
(18, '2023_11_06_041430_create_fee_sub_heads_table', 1),
(19, '2023_11_07_133106_create_fee_maps_table', 1),
(20, '2023_11_07_133130_create_fee_map_fee_sub_head_table', 1),
(21, '2023_11_07_133139_create_fee_map_fund_table', 1),
(22, '2023_11_10_122800_create_fees_table', 1),
(23, '2023_11_10_133218_create_absent_fines_table', 1),
(24, '2023_11_12_092104_create_fee_date_configs_table', 1),
(25, '2023_11_13_050817_create_waivers_table', 1),
(26, '2023_11_26_040459_create_sms_purchases_table', 1),
(27, '2023_11_26_051903_create_sms_balances_table', 1),
(28, '2023_12_09_202508_create_student_collections_table', 1),
(29, '2023_12_09_203730_create_student_collection_details_table', 1),
(30, '2023_12_09_204428_create_student_collection_details_sub_heads_table', 1),
(31, '2023_12_11_075037_create_student_waiver_configs_table', 1),
(32, '2024_03_27_214530_create_book_categories_table', 1),
(33, '2024_03_27_214532_create_books_table', 1),
(34, '2024_03_27_2145340_create_book_issues_table', 1),
(35, '2024_03_27_2145347_create_library_fines_table', 1),
(36, '2024_04_27_212419_create_attendance_fines_table', 1),
(37, '2024_05_06_073101_create_academic_years_table', 1),
(38, '2024_05_06_073200_create_shifts_table', 1),
(39, '2024_05_06_073201_create_classes_table', 1),
(40, '2024_05_06_073202_create_student_groups_table', 1),
(41, '2024_05_06_073203_create_sections_table', 1),
(42, '2024_05_06_073205_create_periods_table', 1),
(43, '2024_05_06_073206_create_subjects_table', 1),
(44, '2024_05_06_073207_create_subject_configs_table', 1),
(45, '2024_05_18_195819_create_departments_table', 1),
(46, '2024_05_26_175254_create_attendance_waivers_table', 1),
(47, '2024_06_01_080940_create_settings_table', 1),
(48, '2024_06_01_161632_create_picklists_table', 1),
(49, '2024_09_04_183648_create_permission_tables', 1),
(50, '2024_10_25_124652_create_merit_process_types_table', 1),
(51, '2024_10_25_124653_create_grades_table', 1),
(52, '2024_10_25_124905_create_short_codes_table', 1),
(53, '2024_10_26_074535_create_students_table', 1),
(54, '2024_10_26_074536_create_exams_table', 1),
(55, '2024_10_26_074538_create_class_exams_table', 1),
(56, '2024_11_01_174246_create_user_logs_table', 1),
(57, '2024_11_02_144004_create_exam_codes_table', 1),
(58, '2024_11_03_005102_create_exam_grades_table', 1),
(59, '2024_11_03_161726_create_mark_config_exam_codes_table', 1),
(60, '2024_11_03_161727_create_mark_configs_table', 1),
(61, '2024_11_04_015021_create_grand_final_class_exams_table', 1),
(62, '2024_11_05_013537_create_remark_configs_table', 1),
(63, '2024_11_06_160453_create_exam_marks_table', 1),
(64, '2024_11_09_162259_create_student_categories_table', 1),
(65, '2024_11_09_162261_create_signatures_table', 1),
(66, '2024_11_09_162262_leave_types', 1),
(67, '2024_11_09_162282_create_staffs_table', 1),
(68, '2024_11_09_162284_create_teachers_table', 1),
(69, '2024_11_09_162292_create_student_sessions_table', 1),
(70, '2024_11_11_015344_create_oauth_auth_codes_table', 1),
(71, '2024_11_11_015345_create_oauth_access_tokens_table', 1),
(72, '2024_11_11_015346_create_oauth_refresh_tokens_table', 1),
(73, '2024_11_11_015347_create_oauth_clients_table', 1),
(74, '2024_11_11_015348_create_oauth_personal_access_clients_table', 1),
(75, '2024_11_12_162918_create_student_migrations_table', 1),
(76, '2024_11_12_162920_create_library_members_table', 1),
(77, '2024_11_12_162921_create_student_attendances_table', 1),
(78, '2024_11_12_162922_create_staff_attendances_table', 1),
(79, '2024_11_12_162924_create_sms_logs_table', 1),
(80, '2024_11_12_162932_create_exam_schedules_table', 1),
(81, '2024_11_12_162934_create_exam_attendances_table', 1),
(82, '2024_11_12_162935_create_class_days_table', 1),
(83, '2024_11_12_162936_create_class_routines_table', 1),
(84, '2024_11_12_162941_create_assign_shifts_table', 1),
(85, '2024_11_12_162942_create_class_assigns_table', 1),
(86, '2024_11_12_162943_create_assign_subjects_table', 1),
(87, '2024_11_12_162944_create_syllabus_table', 1),
(88, '2024_11_12_162946_create_assignments_table', 1),
(89, '2024_11_12_162953_create_notices_table', 1),
(90, '2024_11_12_162955_create_user_notices_table', 1),
(91, '2024_11_12_162960_create_events_table', 1),
(92, '2024_11_12_172960_create_contacts_table', 1),
(93, '2024_11_29_014050_create_assignment_submits_table', 1),
(94, '2024_12_15_160450_create_salary_heads_table', 1),
(95, '2024_12_15_160452_create_user_payrolls_table', 1),
(96, '2024_12_15_160454_create_salary_head_user_payrolls_table', 1),
(97, '2024_12_15_160456_create_payslip_salaries_table', 1),
(98, '2024_12_15_160458_create_payslip_salary_heads_table', 1),
(99, '2024_12_15_160460_create_payslip_invoices_table', 1),
(100, '2024_12_15_160462_create_payroll_accounting_mappings_table', 1),
(101, '2024_12_15_160466_create_payments_table', 1),
(102, '2025_01_01_032931_create_class_lessons_table', 1),
(103, '2025_01_01_033554_create_prayers_table', 1),
(104, '2025_01_01_063251_create_behaviors_table', 1),
(105, '2025_01_01_063813_create_gamifications_table', 1),
(106, '2025_01_01_063919_create_resources_table', 1),
(107, '2025_01_11_051038_create_faq_questions_table', 1),
(108, '2025_01_11_051040_create_policies_table', 1),
(109, '2025_01_12_051009_create_academic_images_table', 1),
(110, '2025_01_12_093405_create_about_us_table', 1),
(111, '2025_02_11_041343_create_our_histories_table', 1),
(112, '2025_02_13_044120_create_banners_table', 1),
(113, '2025_02_23_101529_create_testimonials_table', 1),
(114, '2025_02_26_100812_create_course_categories_table', 1),
(115, '2025_02_26_101353_create_courses_table', 1),
(116, '2025_02_26_101354_create_course_features_table', 1),
(117, '2025_02_26_101355_create_course_faqs_table', 1),
(118, '2025_02_27_082122_create_chapters_table', 1),
(119, '2025_02_27_082135_create_lessons_table', 1),
(120, '2025_03_02_062951_create_quizzes_table', 1),
(121, '2025_03_02_063014_create_quiz_attempts_table', 1),
(122, '2025_03_02_063022_create_quiz_results_table', 1),
(123, '2025_03_02_090616_create_contacts_table', 1),
(124, '2025_03_03_050829_create_pages_table', 1),
(125, '2025_03_12_034430_create_zoom_meetings_table', 1),
(126, '2025_03_16_035921_create_onboardings_table', 1),
(127, '2025_03_17_040437_create_lms_assignments_table', 1),
(128, '2025_03_17_040458_create_lms_assignment_results_table', 1),
(129, '2025_03_18_150112_create_otp_verifications_table', 1),
(130, '2025_03_21_195239_create_why_choose_us_table', 1),
(131, '2025_03_21_213247_create_ready_to_join_us_table', 1),
(132, '2025_03_23_034819_create_payment_requests_table', 1),
(133, '2025_03_25_160046_create_mobile_app_sections_table', 1),
(134, '2025_03_28_083006_create_hostels_table', 1),
(135, '2025_03_28_083008_create_hostel_categories_table', 1),
(136, '2025_03_28_083010_create_hostel_members_table', 1),
(137, '2025_03_28_083015_create_rooms_table', 1),
(138, '2025_03_28_083030_create_room_members_table', 1),
(139, '2025_03_28_083039_create_meals_table', 1),
(140, '2025_03_28_083044_create_meal_plans_table', 1),
(141, '2025_03_28_140712_create_hostel_bills_table', 1),
(142, '2025_03_28_140735_create_meal_entries_table', 1),
(143, '2025_03_29_133534_create_buses_table', 1),
(144, '2025_03_29_133605_create_drivers_table', 1),
(145, '2025_03_29_133739_create_bus_routes_table', 1),
(146, '2025_03_29_133749_create_bus_stops_table', 1),
(147, '2025_03_29_134153_create_transport_members_table', 1),
(148, '2025_03_30_062148_create_parent_models_table', 1),
(149, '2025_04_05_043108_create_plans_table', 1),
(150, '2025_04_05_043132_create_subscriptions_table', 1),
(151, '2025_04_05_043150_create_subscription_items_table', 1),
(152, '2025_04_06_041546_create_device_controls_table', 1),
(153, '2025_04_06_043435_create_student_devices_table', 1),
(154, '2025_04_08_040639_create_payment_histories_table', 1),
(155, '2025_04_10_010718_create_feedback_table', 1),
(156, '2025_04_10_010805_create_s_a_a_s_faqs_table', 1),
(157, '2025_04_10_033705_create_subscription_upgrade_requests_table', 1),
(158, '2025_04_20_032512_create_question_bank_classes_table', 1),
(159, '2025_04_20_032529_create_question_bank_groups_table', 1),
(160, '2025_04_20_032530_create_question_categories_table', 1),
(161, '2025_04_20_032538_create_question_bank_subjects_table', 1),
(162, '2025_04_20_032550_create_question_bank_chapters_table', 1),
(163, '2025_04_20_032623_create_question_bank_topics_table', 1),
(164, '2025_04_20_032630_create_question_bank_types_table', 1),
(165, '2025_04_20_032632_create_question_bank_levels_table', 1),
(166, '2025_04_20_032638_create_question_bank_sources_table', 1),
(167, '2025_04_20_032643_create_question_bank_sub_sources_table', 1),
(168, '2025_04_20_032645_create_question_bank_tags_table', 1),
(169, '2025_04_20_032646_create_question_bank_sessions_table', 1),
(170, '2025_04_20_032650_create_question_bank_years_table', 1),
(171, '2025_04_20_040730_create_question_bank_boards_table', 1),
(172, '2025_04_20_040732_create_question_bank_difficulty_levels_table', 1),
(173, '2025_04_20_040733_create_question_bank_tests_table', 1),
(174, '2025_04_20_040734_create_questions_table', 1),
(175, '2025_04_20_040738_create_question_test_table', 1),
(176, '2025_04_20_040738_create_question_type_table', 1),
(177, '2025_04_20_040744_create_question_level_table', 1),
(178, '2025_04_20_040746_create_question_topic_table', 1),
(179, '2025_04_20_040754_create_question_source_table', 1),
(180, '2025_04_20_040756_create_question_sub_source_table', 1),
(181, '2025_04_20_040758_create_question_tag_table', 1),
(182, '2025_04_20_040759_create_question_session_table', 1),
(183, '2025_04_24_061458_create_contents_table', 1),
(184, '2025_04_29_055845_create_s_a_a_s_settings_table', 1),
(185, '2025_04_30_040523_create_s_a_a_s_subscriptions_table', 1),
(186, '2025_05_24_090100_create_lms_zoom_meetings_table', 1),
(187, '2025_06_25_070227_create_languages_table', 1),
(188, '2025_09_20_053933_create_quiz_topics_table', 1),
(189, '2025_10_01_091211_create_themes_table', 1),
(190, '2025_10_22_054455_create_lms_rooms_table', 1),
(191, '2025_10_22_055522_create_lms_days_table', 1),
(192, '2025_10_22_060312_create_lms_class_routines_table', 1),
(193, '2025_10_22_060314_create_class_routine_days_table', 1),
(194, '2025_10_22_060316_create_content_visibility_table', 1),
(195, '2025_10_22_060317_create_enrollments_table', 1),
(196, '2025_11_26_005955_create_institute_image_settings_table', 1),
(197, '2025_11_26_005956_create_institute_image_s_a_a_s_settings_table', 1),
(198, '2026_02_05_152100_create_teacher_signatures_table', 1),
(199, '2026_02_05_152200_create_result_cards_table', 1),
(200, '2026_03_14_065756_create_custom_fields_table', 1),
(201, '2026_03_14_065757_create_custom_field_values_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_app_sections`
--

CREATE TABLE `mobile_app_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_one` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_two` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_three` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `play_store_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_store_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_app_sections`
--

INSERT INTO `mobile_app_sections` (`id`, `institute_id`, `branch_id`, `title`, `heading`, `description`, `image`, `feature_one`, `feature_two`, `feature_three`, `play_store_link`, `app_store_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Stay Connected Anywhere, Anytime!', 'Mobile App', 'With our official Fudevs School Mobile App, parents and students can:', 'mobile_app.png', 'Check schedules & notifications', 'Receive instant updates', 'Track student progress', 'https://play.google.com/store/apps/details?id=com.example.app', 'https://apps.apple.com/us/app/example-app/id123456789', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Modules\\Authentication\\Models\\User', 1),
(2, 'Modules\\Authentication\\Models\\User', 2),
(3, 'Modules\\Authentication\\Models\\User', 3),
(4, 'Modules\\Authentication\\Models\\User', 4),
(5, 'Modules\\Authentication\\Models\\User', 5),
(9, 'Modules\\Authentication\\Models\\User', 6),
(10, 'Modules\\Authentication\\Models\\User', 7);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `notice` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('a16ce882-294e-44cc-8b90-380023f17453', NULL, 'yes', 'oXCfMbjiqbP9MiEUgXN8Au0eCSpUKwpNojuHgbbW', NULL, 'http://localhost', 1, 0, 0, '2026-03-30 11:21:33', '2026-03-30 11:21:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 'a16ce882-294e-44cc-8b90-380023f17453', '2026-03-30 11:21:33', '2026-03-30 11:21:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `onboardings`
--

CREATE TABLE `onboardings` (
  `id` bigint UNSIGNED NOT NULL,
  `collected_data` json NOT NULL,
  `institute_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_verifications`
--

CREATE TABLE `otp_verifications` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `our_histories`
--

CREATE TABLE `our_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `year` year NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptions` text COLLATE utf8mb4_unicode_ci,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `our_histories`
--

INSERT INTO `our_histories` (`id`, `institute_id`, `branch_id`, `year`, `title`, `descriptions`, `status`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1972, 'Mere tranquil existence', 'Possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart am alone', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `meta_data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci,
  `page_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `page_template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `author_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `institute_id`, `branch_id`, `title`, `slug`, `type`, `content`, `meta_data`, `seo_meta_keywords`, `seo_meta_description`, `page_status`, `page_template`, `author_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Home', 'home', 'home', '<p>Home page content</p>', NULL, 'home, welcome', 'This is the home page', 'publish', 'default', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(2, 1, 1, 'About Us', 'about-us', 'about', '<p>About us content</p>', NULL, 'about, us', 'Learn more about us', 'publish', 'default', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(3, 1, 1, 'Mission', 'mission', 'mission', '<p>Demo College provides quality education to students...</p>', NULL, 'mission, education, students', 'Our mission is to provide quality education.', 'publish', 'default', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(4, 1, 1, 'Vision', 'vision', 'vision', '<p>Demo College inspires students to acquire genuine knowledge...</p>', NULL, 'vision, education, knowledge', 'Our vision is to inspire students with knowledge.', 'publish', 'default', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(5, 1, 1, 'Goal', 'goal', 'goal', '<p>To establish Demo College as a model educational institution...</p>', NULL, 'goal, education, institution', 'Our goal is to be a model educational institution.', 'publish', 'default', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(6, 1, 1, 'Motto', 'motto', 'motto', '<p>Pursue Knowledge through Human Service...</p>', NULL, 'motto, knowledge, service', 'Our motto is to pursue knowledge through service.', 'publish', 'default', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(7, 1, 1, 'Admission Information', 'admission-information', 'admission-information', '<img src=\"https://example.com/public/page_Image/admission_information.png\">', NULL, 'admission, info, enrollment', 'Find out about our admission process.', 'publish', 'default', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(8, 1, 1, 'Academic Achievements', 'academic-achievement', 'academic-achievement', '<img src=\"https://example.com/public/page_Image/admission_information.png\">', NULL, 'admission, academic achievements, enrollment', 'Learn about the academic achievements of our institution and how we support student success.', 'publish', 'default', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(9, 1, 1, 'Academic Facilities', 'academic-facilities', 'academic-facilities', '<img src=\"https://example.com/public/page_Image/admission_information.png\">', NULL, 'admission, academic facilities, enrollment', 'Explore the academic facilities that provide a conducive environment for learning and growth.', 'publish', 'default', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(10, 1, 1, 'Debating Club Information', 'debating-club', 'debating-club', '<img src=\"https://example.com/public/page_Image/admission_information.png\">', NULL, 'admission, debating club, extracurricular', 'Join our debating club to enhance your critical thinking and public speaking skills.', 'publish', 'default', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parent_models`
--

CREATE TABLE `parent_models` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED DEFAULT NULL,
  `parent_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_profession` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_address` longtext COLLATE utf8mb4_unicode_ci,
  `permanent_address` longtext COLLATE utf8mb4_unicode_ci,
  `access_key` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` enum('salary','due','advanced','advanced_return') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'due',
  `payment_method_id` bigint UNSIGNED DEFAULT NULL,
  `paid_by` bigint UNSIGNED DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_histories`
--

CREATE TABLE `payment_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `payment_method_id` bigint UNSIGNED NOT NULL,
  `invoice_number` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Monthly fee',
  `payable` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `due` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('Paid','Unpaid','Partial') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unpaid',
  `date_issued` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `provider_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_payment_provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_status` enum('Pending','Confirmed','Failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `attachments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_notes` longtext COLLATE utf8mb4_unicode_ci,
  `send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `send_email` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int DEFAULT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `payer_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `gateway_callback_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_hook` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failure_hook` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `notes` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_data` json DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `payer_information` json DEFAULT NULL,
  `external_redirect_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_information` json DEFAULT NULL,
  `attribute_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_accounting_mappings`
--

CREATE TABLE `payroll_accounting_mappings` (
  `id` bigint UNSIGNED NOT NULL,
  `ledger_id` bigint UNSIGNED NOT NULL,
  `fund_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payroll_accounting_mappings`
--

INSERT INTO `payroll_accounting_mappings` (`id`, `ledger_id`, `fund_id`, `created_at`, `updated_at`) VALUES
(1, 55, 1, '2026-03-30 11:21:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payslip_invoices`
--

CREATE TABLE `payslip_invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL COMMENT 'custom generate id',
  `payslip_salary_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payslip_salaries`
--

CREATE TABLE `payslip_salaries` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_paid` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `payment_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payslip_salary_heads`
--

CREATE TABLE `payslip_salary_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_payroll_id` bigint UNSIGNED NOT NULL,
  `salary_head_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

CREATE TABLE `periods` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `serial_no` int UNSIGNED DEFAULT NULL,
  `period` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` (`id`, `institute_id`, `branch_id`, `serial_no`, `period`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '1st Period', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 2, '2nd Period', '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'master_configuration.institutes', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(2, 'master_configuration.plans', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(3, 'master_configuration.cms_control', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(4, 'teacher_panel', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(5, 'student_panel', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(6, 'parent_panel', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(7, 'hostel_panel', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(8, 'transport_panel', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(9, 'dashboard', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(10, 'system-admin', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(11, 'student_information.student_index', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(12, 'student_information.student_create', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(13, 'student_information.student_edit', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(14, 'student_information.student_delete', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(15, 'student_information.student_status_change', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(16, 'student_information.student_migration', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(17, 'student_information.student_pullback', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(18, 'student_information.migration_list', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(19, 'student_information.all_student_list', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(20, 'staff_information.teachers_index', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(21, 'staff_information.teachers_create', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(22, 'staff_information.teachers_edit', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(23, 'staff_information.teachers_delete', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(24, 'staff_information.teachers_status_change', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(25, 'staff_information.staffs_index', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(26, 'staff_information.staffs_create', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(27, 'staff_information.staffs_edit', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(28, 'staff_information.staffs_delete', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(29, 'staff_information.staff_attendance_view', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(30, 'staff_information.staff_attendance_create', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(31, 'staff_information.staffs_report', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(32, 'student_attendance.student_attendance_index', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(33, 'student_attendance.student_attendance_create', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(34, 'student_attendance.exam_attendance_index', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(35, 'student_attendance.exam_attendance_schedule', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(36, 'student_attendance.student_attendance_report', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(37, 'student_attendance.student_absent_report', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(38, 'academic_configuration.academic_session', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(39, 'academic_configuration.shifts', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(40, 'academic_configuration.classes', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(41, 'academic_configuration.sections', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(42, 'academic_configuration.groups', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(43, 'academic_configuration.periods', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(44, 'academic_configuration.subjects', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(45, 'academic_configuration.subject_config', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(46, 'academic_configuration.exams', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(47, 'academic_configuration.student_categories', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(48, 'academic_configuration.departments', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(49, 'academic_configuration.picklist', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(50, 'academic_configuration.principal_signatures', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(51, 'fees_management.startup', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(52, 'fees_management.mapping', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(53, 'fees_management.amount_config', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(54, 'fees_management.date_config', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(55, 'fees_management.fine_waiver', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(56, 'fees_management.waiver', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(57, 'fees_management.waiver_config', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(58, 'fees_management.smart_collection', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(59, 'fees_management.paid_info', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(60, 'fees_management.unpaid_info', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(61, 'accounting_management.ledgers', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(62, 'accounting_management.funds', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(63, 'accounting_management.categories', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(64, 'accounting_management.groups', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(65, 'accounting_management.payment', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(66, 'accounting_management.receipt', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(67, 'accounting_management.contra', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(68, 'accounting_management.journal', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(69, 'accounting_management.fund_transfer', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(70, 'accounting_management.chart_of_accounts', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(71, 'accounting_report.balance_sheet', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(72, 'accounting_report.trial_balance', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(73, 'accounting_report.cash_flow_statement', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(74, 'accounting_report.cash_flow_details', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(75, 'accounting_report.cash_book_account', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(76, 'accounting_report.ledger_book_account', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(77, 'accounting_report.income_statement', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(78, 'accounting_report.cash_summary', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(79, 'payroll.payroll_start_up', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(80, 'payroll.payroll_mapping', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(81, 'payroll.payroll_assign', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(82, 'payroll.salary_slip', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(83, 'payroll.salary', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(84, 'payroll.due', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(85, 'payroll.advance', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(86, 'payroll.return_advance_payment', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(87, 'payroll.salary_statement', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(88, 'payroll.payment_info', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(89, 'routine_management.syllabuses', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(90, 'routine_management.assignments', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(91, 'routine_management.class_routine', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(92, 'routine_management.exam_routine', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(93, 'routine_management.admit_seat_plan', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(94, 'library_management.book_category', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(95, 'library_management.books', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(96, 'library_management.members', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(97, 'library_management.book_issue_search', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(98, 'library_management.book_issue_report', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(99, 'library_management.book_barcode_print', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(100, 'exam_module.exam_start_up', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(101, 'exam_module.mark_config', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(102, 'exam_module.remarks_config', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(103, 'exam_module.mark_input', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(104, 'exam_module.exam_result', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(105, 'layouts_certificates.general', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(106, 'layouts_certificates.testimonial', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(107, 'layouts_certificates.attendance_certificate', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(108, 'layouts_certificates.hsc_recommendation_letter', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(109, 'layouts_certificates.transfer', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(110, 'layouts_certificates.abroad_letter', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(111, 'sms_notifications.templates', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(112, 'sms_notifications.phonebook_category', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(113, 'sms_notifications.phonebook', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(114, 'sms_notifications.sent_sms', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(115, 'sms_notifications.purchase_sms', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(116, 'sms_notifications.sms_report', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(117, 'administrator.assign_shift', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(118, 'administrator.assign_subject', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(119, 'administrator.assign_class', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(120, 'administrator.notice', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(121, 'administrator.event', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(122, 'administrator.contact_message', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(123, 'administrator.user_activities', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(124, 'quiz.topics', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(125, 'quiz.questions', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(126, 'quiz.answers', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(127, 'quiz.all_reports', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(128, 'master_configuration.system_settings', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(129, 'master_configuration.roles', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(130, 'master_configuration.users', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(131, 'master_configuration.database_backup', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(132, 'master_configuration.branches', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(133, 'zoom-index', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(134, 'zoom-create', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(135, 'zoom-update', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(136, 'zoom-delete', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(137, 'payment_gateway.index', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(138, 'payment_gateway.create', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(139, 'payment_gateway.update', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(140, 'payment_gateway.delete', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(141, 'role-index', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(142, 'role-create', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(143, 'role-update', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(144, 'role-delete', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(145, 'user-index', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(146, 'user-create', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(147, 'user-update', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(148, 'user-delete', 'web', '2026-03-30 11:21:04', '2026-03-30 11:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `phone_books`
--

CREATE TABLE `phone_books` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_book_categories`
--

CREATE TABLE `phone_book_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_book_categories`
--

INSERT INTO `phone_book_categories` (`id`, `institute_id`, `branch_id`, `name`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Student', 'Student', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(2, 1, 1, 'Teacher', 'Teacher', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(3, 1, 1, 'Family', 'Family', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(4, 1, 1, 'VIP', 'VIP', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(5, 1, 1, 'Director', 'Director', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(6, 1, 1, 'Shareholder', 'Shareholder', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(7, 1, 1, 'Other School Teacher', 'Other School Teacher', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(8, 1, 1, 'Chairman', 'Chairman', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `picklists`
--

CREATE TABLE `picklists` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `picklists`
--

INSERT INTO `picklists` (`id`, `institute_id`, `branch_id`, `type`, `value`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Religion', 'Islam', 'islam', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'Religion', 'Christianity', 'christianity', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 1, 'Religion', 'Hinduism', 'hinduism', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 1, 'Religion', 'Buddhism', 'buddhism', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, 'Religion', 'Others', 'others', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(6, 1, 1, 'Designation', 'Department Head', 'department-head', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(7, 1, 1, 'Designation', 'Lecturer', 'lecturer', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(8, 1, 1, 'Designation', 'Associate Professor', 'associate-professor', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(9, 1, 1, 'Designation', 'Professor', 'professor', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(10, 1, 1, 'Designation', 'Principal', 'principal', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(11, 1, 1, 'Designation', 'Director of administration and student guidance', 'director-of-administration-and-student-guidance', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(12, 1, 1, 'Staff Designation', 'Accounts Office', 'accounts-office', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(13, 1, 1, 'Staff Designation', 'Exam Office', 'exam-office', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(14, 1, 1, 'Staff Designation', 'IT Office', 'it-office', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(15, 1, 1, 'Staff Designation', 'Library', 'library', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(16, 1, 1, 'Staff Designation', 'Storekeeper', 'storekeeper', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(17, 1, 1, 'Staff Designation', 'Lab Assistant', 'lab-assistant', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(18, 1, 1, 'Staff Designation', 'Maintenance', 'maintenance', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(19, 1, 1, 'Staff Designation', 'Holy Cross Fathers Work Program', 'holy-cross-fathers-work-program', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(20, 1, 1, 'Staff Designation', 'Academic Office', 'academic-office', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(21, 1, 2, 'Religion', 'Islam', 'islam', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(22, 1, 2, 'Religion', 'Christianity', 'christianity', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(23, 1, 2, 'Religion', 'Hinduism', 'hinduism', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(24, 1, 2, 'Religion', 'Buddhism', 'buddhism', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(25, 1, 2, 'Religion', 'Others', 'others', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(26, 1, 2, 'Designation', 'Department Head', 'department-head', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(27, 1, 2, 'Designation', 'Lecturer', 'lecturer', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(28, 1, 2, 'Designation', 'Associate Professor', 'associate-professor', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(29, 1, 2, 'Designation', 'Professor', 'professor', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(30, 1, 2, 'Designation', 'Principal', 'principal', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(31, 1, 2, 'Designation', 'Director of administration and student guidance', 'director-of-administration-and-student-guidance', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(32, 1, 2, 'Staff Designation', 'Accounts Office', 'accounts-office', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(33, 1, 2, 'Staff Designation', 'Exam Office', 'exam-office', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(34, 1, 2, 'Staff Designation', 'IT Office', 'it-office', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(35, 1, 2, 'Staff Designation', 'Library', 'library', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(36, 1, 2, 'Staff Designation', 'Storekeeper', 'storekeeper', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(37, 1, 2, 'Staff Designation', 'Lab Assistant', 'lab-assistant', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(38, 1, 2, 'Staff Designation', 'Maintenance', 'maintenance', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(39, 1, 2, 'Staff Designation', 'Holy Cross Fathers Work Program', 'holy-cross-fathers-work-program', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(40, 1, 2, 'Staff Designation', 'Academic Office', 'academic-office', '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `student_limit` int NOT NULL DEFAULT '0',
  `branch_limit` int NOT NULL DEFAULT '0',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `duration_days` int DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `is_free` tinyint(1) NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `description`, `student_limit`, `branch_limit`, `price`, `duration_days`, `is_custom`, `is_free`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Trail', NULL, 50, 2, '0.00', 14, 0, 1, 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(2, 'Standard', NULL, 500, 2, '99.00', 365, 0, 0, 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(3, 'Professional', NULL, 9999, 5, '299.00', NULL, 1, 0, 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `type` tinyint NOT NULL COMMENT '1=privacy, 2=cookie, 3=terms & conditions',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `institute_id`, `branch_id`, `type`, `description`, `status`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'This Privacy Policy explains how we collect, use, and protect your personal data when you use our Learning Management System (LMS). We prioritize your privacy and comply with data protection laws.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(2, 1, 1, 2, 'Our Cookie Policy explains how we use cookies to improve your experience on our LMS platform. By using our site, you agree to our use of cookies for analytics, personalization, and security.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(3, 1, 1, 3, 'These Terms & Conditions outline the rules and regulations for using our LMS. By accessing our platform, you agree to abide by our terms, including content usage, user conduct, and dispute resolution.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prayers`
--

CREATE TABLE `prayers` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `question_bank_class_id` bigint UNSIGNED DEFAULT NULL,
  `question_bank_group_id` bigint UNSIGNED DEFAULT NULL,
  `question_category_id` bigint UNSIGNED DEFAULT NULL,
  `question_bank_subject_id` bigint UNSIGNED DEFAULT NULL,
  `question_bank_chapter_id` bigint UNSIGNED DEFAULT NULL,
  `question_bank_difficulty_level_id` bigint UNSIGNED DEFAULT NULL,
  `type` enum('true_false','multiple_choice','multiple_true_false') COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_name` text COLLATE utf8mb4_unicode_ci,
  `question` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` json NOT NULL,
  `explanation` longtext COLLATE utf8mb4_unicode_ci,
  `marks` int NOT NULL DEFAULT '1',
  `negative_marks` int NOT NULL DEFAULT '0',
  `negative_marks_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `image_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,4) DEFAULT NULL,
  `question_year` json DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bn',
  `status` enum('active','inactive','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive' COMMENT 'Lesson status: active, inactive, draft',
  `institute_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_boards`
--

CREATE TABLE `question_bank_boards` (
  `id` bigint UNSIGNED NOT NULL,
  `board` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_chapters`
--

CREATE TABLE `question_bank_chapters` (
  `id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapter_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_classes`
--

CREATE TABLE `question_bank_classes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_difficulty_levels`
--

CREATE TABLE `question_bank_difficulty_levels` (
  `id` bigint UNSIGNED NOT NULL,
  `level_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_code` text COLLATE utf8mb4_unicode_ci,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_groups`
--

CREATE TABLE `question_bank_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_levels`
--

CREATE TABLE `question_bank_levels` (
  `id` bigint UNSIGNED NOT NULL,
  `level_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_sessions`
--

CREATE TABLE `question_bank_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_sources`
--

CREATE TABLE `question_bank_sources` (
  `id` bigint UNSIGNED NOT NULL,
  `source_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_subjects`
--

CREATE TABLE `question_bank_subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED DEFAULT NULL,
  `group_id` bigint UNSIGNED DEFAULT NULL,
  `question_category_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Color code for the bg category',
  `priority` int UNSIGNED NOT NULL DEFAULT '1',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_sub_sources`
--

CREATE TABLE `question_bank_sub_sources` (
  `id` bigint UNSIGNED NOT NULL,
  `source_id` bigint UNSIGNED NOT NULL,
  `sub_source_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_tags`
--

CREATE TABLE `question_bank_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `tag_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_tests`
--

CREATE TABLE `question_bank_tests` (
  `id` bigint UNSIGNED NOT NULL,
  `test_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_topics`
--

CREATE TABLE `question_bank_topics` (
  `id` bigint UNSIGNED NOT NULL,
  `question_bank_chapter_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_types`
--

CREATE TABLE `question_bank_types` (
  `id` bigint UNSIGNED NOT NULL,
  `type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_mark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank_years`
--

CREATE TABLE `question_bank_years` (
  `id` bigint UNSIGNED NOT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_categories`
--

CREATE TABLE `question_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Color code for the bg category',
  `priority` int UNSIGNED NOT NULL DEFAULT '1',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_level`
--

CREATE TABLE `question_level` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `question_bank_level_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_session`
--

CREATE TABLE `question_session` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `question_bank_session_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_source`
--

CREATE TABLE `question_source` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `question_bank_source_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_sub_source`
--

CREATE TABLE `question_sub_source` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `question_bank_sub_source_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_tag`
--

CREATE TABLE `question_tag` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `question_bank_tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_test`
--

CREATE TABLE `question_test` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `question_bank_test_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_topic`
--

CREATE TABLE `question_topic` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `question_bank_topic_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_type`
--

CREATE TABLE `question_type` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `question_bank_type_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `priority` int UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `guidelines` longtext COLLATE utf8mb4_unicode_ci,
  `show_description_on_course_page` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('practice','mock','quick_test','exam') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'practice',
  `question_ids` json DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `has_time_limit` tinyint(1) NOT NULL DEFAULT '0',
  `time_limit_value` int DEFAULT NULL,
  `time_limit_unit` enum('seconds','minutes','hours','days','weeks') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `on_expiry` enum('auto_submit','prevent_submit','grace_time') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'auto_submit',
  `marks_per_question` decimal(5,2) NOT NULL DEFAULT '1.00',
  `negative_marks_per_wrong_answer` decimal(5,2) NOT NULL DEFAULT '0.00',
  `pass_mark` decimal(5,2) NOT NULL DEFAULT '0.00',
  `attempts_allowed` int DEFAULT NULL,
  `enable_negative_marking` tinyint(1) NOT NULL DEFAULT '0',
  `result_visibility` enum('immediate','after_review','never') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'immediate',
  `layout_pages` int DEFAULT NULL,
  `shuffle_questions` tinyint(1) NOT NULL DEFAULT '0',
  `shuffle_options` tinyint(1) NOT NULL DEFAULT '0',
  `access_type` enum('none','password','public') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `access_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active' COMMENT 'Lesson status: active, inactive, draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `quiz_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `answers` json DEFAULT NULL,
  `score` double NOT NULL DEFAULT '0',
  `status` enum('started','submitted','reviewed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'started',
  `started_at` timestamp NULL DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `time_taken` int DEFAULT NULL COMMENT 'Time taken in seconds',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `quiz_id` bigint UNSIGNED NOT NULL,
  `quiz_attempt_id` bigint UNSIGNED NOT NULL,
  `score` double NOT NULL DEFAULT '0',
  `negative_marks` double NOT NULL DEFAULT '0',
  `position` int DEFAULT NULL,
  `question_count` int DEFAULT NULL,
  `correct_count` int NOT NULL DEFAULT '0',
  `incorrect_count` int NOT NULL DEFAULT '0',
  `skipped_count` int NOT NULL DEFAULT '0',
  `detailed_results` json DEFAULT NULL,
  `is_passed` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_topics`
--

CREATE TABLE `quiz_topics` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `quiz_id` bigint UNSIGNED NOT NULL,
  `question_bank_subject_id` bigint UNSIGNED DEFAULT NULL,
  `question_bank_chapter_id` bigint UNSIGNED DEFAULT NULL,
  `question_category_id` bigint UNSIGNED DEFAULT NULL,
  `question_limit` int NOT NULL DEFAULT '10',
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ready_to_join_us`
--

CREATE TABLE `ready_to_join_us` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ready_to_join_us`
--

INSERT INTO `ready_to_join_us` (`id`, `institute_id`, `branch_id`, `title`, `description`, `icon`, `button_name`, `button_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Inquiry & Campus Visit', 'Get in touch or schedule a campus tour to see our facilities and learn more about what we offer.', 'https://i.ibb.co.com/PZrX6pDQ/Group-2.png', 'Contact Us', '#', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(2, 1, 1, 'Submit Your Application', 'Complete the online application form to start the admission process.', 'https://i.ibb.co.com/35nLXwLR/Group-1.png', 'Apply Now', '#', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(3, 1, 1, 'Admission Confirmation', 'Once accepted, complete your enrollment and confirm your place for the upcoming academic year.', 'https://i.ibb.co.com/yns7RVZN/Group.png', 'Download Admission Form', '#', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `remark_configs`
--

CREATE TABLE `remark_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `remark_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `remark_configs`
--

INSERT INTO `remark_configs` (`id`, `institute_id`, `branch_id`, `remark_title`, `remarks`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'A+', 'Outstanding performance. Keep up the excellent work!', NULL, NULL, NULL),
(2, 1, 1, 'A', 'Very good. A strong performance overall.', NULL, NULL, NULL),
(3, 1, 1, 'A-', 'Good job. Minor areas for improvement.', NULL, NULL, NULL),
(4, 1, 1, 'B', 'Above average. Keep pushing forward.', NULL, NULL, NULL),
(5, 1, 1, 'C', 'Average performance. Needs additional focus on key areas.', NULL, NULL, NULL),
(6, 1, 1, 'D', 'Weak performance. A lot of work is needed.', NULL, NULL, NULL),
(7, 1, 1, 'F', 'Unsatisfactory. Failed to meet the basic requirements.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int NOT NULL,
  `section_id` int NOT NULL,
  `subject_id` int DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result_cards`
--

CREATE TABLE `result_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature_id` bigint UNSIGNED DEFAULT NULL,
  `teacher_signature_id` bigint UNSIGNED DEFAULT NULL,
  `background_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stamp_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `border_design` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `watermark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `institute_id`, `branch_id`, `name`, `guard_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'SAAS Admin', 'web', 'This is SAAS-Admin role', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(2, 1, 1, 'Super Admin', 'web', 'This is Super Admin role', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(3, 1, 1, 'System Admin', 'web', 'This is System Admin role', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(4, 1, 1, 'Accountant', 'web', 'This is Accountant role', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(5, 1, 1, 'Librarian', 'web', 'This is Librarian role', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(6, 1, 1, 'Teacher', 'web', 'This is Teacher role', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(7, 1, 1, 'Student', 'web', 'This is Student role', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(8, 1, 1, 'Parent', 'web', 'This is Parent role', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(9, 1, 1, 'Hostel', 'web', 'This is Hostel role', '2026-03-30 11:21:04', '2026-03-30 11:21:04'),
(10, 1, 1, 'Transport', 'web', 'This is Transport role', '2026-03-30 11:21:04', '2026-03-30 11:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(9, 1),
(10, 1),
(128, 1),
(131, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(109, 2),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(117, 2),
(118, 2),
(119, 2),
(120, 2),
(121, 2),
(122, 2),
(123, 2),
(124, 2),
(125, 2),
(126, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(136, 2),
(137, 2),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(142, 2),
(143, 2),
(144, 2),
(145, 2),
(146, 2),
(147, 2),
(148, 2),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(100, 3),
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(109, 3),
(110, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(116, 3),
(117, 3),
(118, 3),
(119, 3),
(120, 3),
(121, 3),
(122, 3),
(123, 3),
(124, 3),
(125, 3),
(126, 3),
(127, 3),
(128, 3),
(129, 3),
(130, 3),
(131, 3),
(133, 3),
(134, 3),
(135, 3),
(136, 3),
(137, 3),
(138, 3),
(139, 3),
(140, 3),
(9, 4),
(10, 4),
(51, 4),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(61, 4),
(62, 4),
(63, 4),
(64, 4),
(65, 4),
(66, 4),
(67, 4),
(68, 4),
(69, 4),
(70, 4),
(71, 4),
(72, 4),
(73, 4),
(74, 4),
(75, 4),
(76, 4),
(77, 4),
(78, 4),
(79, 4),
(80, 4),
(81, 4),
(82, 4),
(83, 4),
(84, 4),
(85, 4),
(86, 4),
(87, 4),
(88, 4),
(9, 5),
(10, 5),
(94, 5),
(95, 5),
(96, 5),
(97, 5),
(98, 5),
(99, 5),
(4, 6),
(9, 6),
(5, 7),
(9, 7),
(6, 8),
(9, 8),
(7, 9),
(9, 9),
(8, 10),
(9, 10);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `hostel_category_id` bigint UNSIGNED NOT NULL,
  `room_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room_members`
--

CREATE TABLE `room_members` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_heads`
--

CREATE TABLE `salary_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Addition','Deduction') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Addition',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_heads`
--

INSERT INTO `salary_heads` (`id`, `institute_id`, `branch_id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Basic', 'Addition', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'Allowance', 'Addition', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 1, 'Early Leave Fine', 'Deduction', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 1, 'Festival Allowance', 'Addition', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, 'Welfare Fund', 'Deduction', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(6, 1, 1, 'Professional Tax', 'Deduction', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(7, 1, 1, 'Conveyance', 'Addition', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(8, 1, 1, 'Exam Hall Duty', 'Addition', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(9, 1, 1, 'Incentive', 'Addition', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(10, 1, 1, 'Medical', 'Addition', '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `salary_head_user_payrolls`
--

CREATE TABLE `salary_head_user_payrolls` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_payroll_id` bigint UNSIGNED NOT NULL,
  `salary_head_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_head_user_payrolls`
--

INSERT INTO `salary_head_user_payrolls` (`id`, `institute_id`, `branch_id`, `user_payroll_id`, `salary_head_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(2, 1, 1, 1, 2, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(3, 1, 1, 1, 3, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(4, 1, 1, 1, 4, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(5, 1, 1, 1, 5, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(6, 1, 1, 1, 6, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(7, 1, 1, 1, 7, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(8, 1, 1, 1, 8, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(9, 1, 1, 1, 9, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(10, 1, 1, 1, 10, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(11, 1, 1, 2, 1, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(12, 1, 1, 2, 2, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(13, 1, 1, 2, 3, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(14, 1, 1, 2, 4, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(15, 1, 1, 2, 5, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(16, 1, 1, 2, 6, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(17, 1, 1, 2, 7, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(18, 1, 1, 2, 8, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(19, 1, 1, 2, 9, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(20, 1, 1, 2, 10, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(21, 1, 1, 3, 1, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(22, 1, 1, 3, 2, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(23, 1, 1, 3, 3, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(24, 1, 1, 3, 4, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(25, 1, 1, 3, 5, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(26, 1, 1, 3, 6, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(27, 1, 1, 3, 7, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(28, 1, 1, 3, 8, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(29, 1, 1, 3, 9, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(30, 1, 1, 3, 10, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(31, 1, 1, 4, 1, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(32, 1, 1, 4, 2, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(33, 1, 1, 4, 3, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(34, 1, 1, 4, 4, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(35, 1, 1, 4, 5, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(36, 1, 1, 4, 6, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(37, 1, 1, 4, 7, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(38, 1, 1, 4, 8, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(39, 1, 1, 4, 9, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(40, 1, 1, 4, 10, '10.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `student_group_id` bigint UNSIGNED DEFAULT NULL,
  `section_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_teacher_id` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `rank` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `attendance_time_config_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `institute_id`, `branch_id`, `class_id`, `student_group_id`, `section_name`, `room_no`, `class_teacher_id`, `status`, `rank`, `capacity`, `attendance_time_config_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 'A', '101', NULL, 1, NULL, 40, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 2, 2, 'B', '102', NULL, 1, NULL, 35, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `payment_info` longtext COLLATE utf8mb4_unicode_ci,
  `sms_info` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'general',
  `mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `institute_id`, `branch_id`, `name`, `value`, `payment_info`, `sms_info`, `type`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'school_name', 'Demo Collage', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(2, 1, 1, 'site_title', 'Demo Title', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(3, 1, 1, 'phone', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(4, 1, 1, 'email', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(5, 1, 1, 'language', 'en', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(6, 1, 1, 'google_map', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(7, 1, 1, 'address', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(8, 1, 1, 'on_google_map', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(9, 1, 1, 'institute_code', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(10, 1, 1, 'timezone', 'Asia/Dhaka', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(11, 1, 1, 'academic_year', '1', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(12, 1, 1, 'currency_symbol', '$', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(13, 1, 1, 'mail_type', 'mail', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(14, 1, 1, 'logo', 'logo.png', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(15, 1, 1, 'disabled_website', 'no', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(16, 1, 1, 'copyright_text', '&copy; Copyright 2025. All Rights Reserved by FueDevs LTD', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(17, 1, 1, 'exam_result_phone', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(18, 1, 1, 'tuition_fee_phone', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(19, 1, 1, 'facebook_link', 'https://www.facebook.com/', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(20, 1, 1, 'google_plus_link', 'https://www.google.com/', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(21, 1, 1, 'youtube_link', 'https://www.youtube.com/', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(22, 1, 1, 'whats_app_link', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(23, 1, 1, 'twitter_link', 'https://www.twitter.com', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(24, 1, 1, 'eiin_code', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(25, 1, 1, 'sms_gateway', 'twilio', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(26, 1, 1, 'bulk_sms_api_key', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(27, 1, 1, 'bulk_sms_sender_id', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(28, 1, 1, 'twilio_sid', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(29, 1, 1, 'twilio_token', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(30, 1, 1, 'twilio_from_number', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(31, 1, 1, 'zoom_account_id', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(32, 1, 1, 'zoom_client_key', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(33, 1, 1, 'zoom_client_secret', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(34, 1, 1, 'header_notice', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(35, 1, 1, 'exam_result_status', 'no', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(36, 1, 1, 'admission_display_status', 'no', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(37, 1, 1, 'tc_amount', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(38, 1, 1, 'primary_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(39, 1, 1, 'secondary_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(40, 1, 1, 'primary_container_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(41, 1, 1, 'dark_primary_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(42, 1, 1, 'dark_secondary_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(43, 1, 1, 'dark_container_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(44, 1, 1, 'text_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(45, 1, 1, 'dark_text_colo', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(46, 1, 1, 'sidebar_selected_bg_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(47, 1, 1, 'sidebar_selected_text_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(48, 1, 1, 'sidebar_selected_text_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(49, 1, 1, 'guidance', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(50, 1, 1, 'academic_office', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(51, 1, 1, 'tuition_fee', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(52, 1, 1, 'exam_office', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(53, 1, 1, 'website_link', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL),
(54, 1, 1, 'bkash', NULL, '{\"app_key\":\"\",\"app_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL),
(55, 1, 1, 'paystack', NULL, '{\"public_key\":\"\",\"secret_key\":\"\",\"merchant_email\":\"\",\"callback_url\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL),
(56, 1, 1, 'razor_pay', NULL, '{\"api_key\":\"rzp_test_jXtU63C342FF9B\",\"api_secret\":\"nrzllzn50ELsRHwFwYthIgBT\"}', NULL, 'payment_config', 'test', '1', NULL, NULL),
(57, 1, 1, 'stripe', NULL, '{\"published_key\":\"\",\"api_key\":\"\",\"mode\":\"test\",\"other_config_key\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL),
(58, 1, 1, 'ssl_commerz', NULL, '{\"store_id\":\"\",\"store_password\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL),
(59, 1, 1, 'pvit', NULL, '{\"mc_tel_merchant\":\"\",\"access_token\":\"\",\"mc_merchant_code\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL),
(60, 1, 1, 'paypal', NULL, '{\"client_id\":\"\",\"client_secret\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL),
(61, 1, 1, 'paymob_accept', NULL, '{\"api_key\":\"\",\"integration_id\":\"\",\"iframe_id\":\"\",\"hmac_secret\":\"\",\"supported_country\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL),
(62, 1, 1, 'flutterwave', NULL, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL),
(63, 1, 1, 'senang_pay', NULL, '{\"merchant_id\":\"\",\"secret_key\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL),
(64, 1, 1, 'paytm', NULL, '{\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_website_link\":\"\",\"refund_url\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `institute_id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Morning Shift', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'Day Shift', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 2, 'Morning Shift', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 2, 'Day Shift', '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `short_codes`
--

CREATE TABLE `short_codes` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `short_code_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code_note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_id` int NOT NULL,
  `total_mark` decimal(5,2) NOT NULL,
  `accept_percent` decimal(5,2) NOT NULL,
  `pass_mark` decimal(5,2) NOT NULL,
  `session_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `short_codes`
--

INSERT INTO `short_codes` (`id`, `institute_id`, `branch_id`, `short_code_title`, `short_code_note`, `default_id`, `total_mark`, `accept_percent`, `pass_mark`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'SC-1', 'Short Code -1', 1, '100.00', '1.00', '0.00', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'SC-2', 'Short Code -2', 2, '100.00', '1.00', '0.00', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 1, 'SC-3', 'Short Code -3', 3, '100.00', '1.00', '0.00', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 1, 'SC-4', 'Short Code -4', 4, '100.00', '1.00', '0.00', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, 'SC-5', 'Short Code -5', 5, '100.00', '1.00', '0.00', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(6, 1, 1, 'SC-6', 'Short Code -6', 6, '100.00', '1.00', '0.00', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `signatures`
--

CREATE TABLE `signatures` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `place_at` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_balances`
--

CREATE TABLE `sms_balances` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `masking_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `non_masking_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_balances`
--

INSERT INTO `sms_balances` (`id`, `institute_id`, `branch_id`, `masking_balance`, `non_masking_balance`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0.00', '0.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `sms_logs`
--

CREATE TABLE `sms_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `receiver` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` enum('Teacher','Staff','Accountant','Librarian','Employee','Student') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Teacher',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `staff_id` bigint UNSIGNED DEFAULT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `student_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_purchases`
--

CREATE TABLE `sms_purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `sms_gateway` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `masking_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_date` date NOT NULL,
  `no_of_sms` int UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `institute_id`, `branch_id`, `name`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Admission', 'Congratulations!🎓 You`ve been accepted into DEMO. 📚 Get ready for an exciting academic journey ahead. 🌟 Orientation  details will be sent shortly. Welcome to the DEMO family!', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(2, 1, 1, 'Exam Notice', 'Annual exam will be held on pls collect your admit card', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(3, 1, 1, 'Headmaster', 'Dear Parents, This is to inform you that school will be closed tomorrow.', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(4, 1, 1, 'Holiday Notice', 'Kindly note that the school will remain closed on 14th & 15th April 16 for the Occasion of Pohela Boishakh', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(5, 1, 1, 'Urgent Meeting', 'Dear Teacher, An Urgent Meeting will held on Today at 5.30pm. Please Attend on Just Time. Principal', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(6, 1, 1, 'Guardian Assembly', 'Respected Parents Dear Sir, On 01/01/2025 school has organized a parent meeting, I would like to request your presence in the said meeting.', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(7, 1, 1, 'Present', 'Your child did not attend today.', 1, '2026-03-30 11:21:14', '2026-03-30 11:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blood` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sl` int DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `joining_date` date DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `is_administrator` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `access_key` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `institute_id`, `branch_id`, `user_id`, `department_id`, `name`, `designation`, `birthday`, `gender`, `religion`, `phone`, `blood`, `sl`, `address`, `joining_date`, `status`, `is_administrator`, `access_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 4, 1, 'Accountant', 'Accountant', NULL, NULL, NULL, '000000000004', NULL, NULL, NULL, NULL, '0', '0', NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(2, 1, 1, 5, 1, 'Librarian', 'Librarian', NULL, NULL, NULL, '000000000005', NULL, NULL, NULL, NULL, '0', '0', NULL, '2026-03-30 11:21:13', '2026-03-30 11:21:13', NULL),
(3, 1, 1, 6, 1, 'Hostel', 'Hostel', NULL, NULL, NULL, '000000000006', NULL, NULL, NULL, NULL, '0', '0', NULL, '2026-03-30 11:21:13', '2026-03-30 11:21:13', NULL),
(4, 1, 1, 7, 1, 'Transport', 'Transport', NULL, NULL, NULL, '000000000007', NULL, NULL, NULL, NULL, '0', '0', NULL, '2026-03-30 11:21:14', '2026-03-30 11:21:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendances`
--

CREATE TABLE `staff_attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `type` enum('Teacher','Staff','Accountant','Librarian','Employee') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Teacher',
  `attendance` tinyint UNSIGNED NOT NULL DEFAULT '2',
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `group` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_category_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_no` bigint UNSIGNED DEFAULT NULL,
  `roll_no` bigint UNSIGNED DEFAULT NULL,
  `father_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `information_sent_to_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information_sent_to_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information_sent_to_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information_sent_to_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activities` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Bangladeshi',
  `birth_certificate_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ethnic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_admission` date DEFAULT NULL,
  `application_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admission_place` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tc_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_attendances`
--

CREATE TABLE `student_attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `section_id` bigint UNSIGNED NOT NULL,
  `period_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `attendance` tinyint UNSIGNED NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_categories`
--

CREATE TABLE `student_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_categories`
--

INSERT INTO `student_categories` (`id`, `institute_id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'General', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'Special', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 2, 'General', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 2, 'Special', '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `student_collections`
--

CREATE TABLE `student_collections` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `session_id` bigint UNSIGNED NOT NULL COMMENT 'Academic year',
  `tc_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `attendance_fine` decimal(8,2) NOT NULL DEFAULT '0.00',
  `quiz_fine` decimal(8,2) NOT NULL DEFAULT '0.00',
  `lab_fine` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_payable` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_paid` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_due` decimal(8,2) NOT NULL DEFAULT '0.00',
  `note` text COLLATE utf8mb4_unicode_ci,
  `ledger_id` bigint UNSIGNED DEFAULT NULL,
  `receive_ledger_id` bigint UNSIGNED DEFAULT NULL,
  `fund_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_collection_details`
--

CREATE TABLE `student_collection_details` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `session_id` bigint UNSIGNED NOT NULL COMMENT 'Academic year',
  `student_collection_id` bigint UNSIGNED NOT NULL,
  `fee_head_id` bigint UNSIGNED NOT NULL,
  `ledger_id` bigint UNSIGNED DEFAULT NULL,
  `total_due` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_payable` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_paid` decimal(8,2) NOT NULL DEFAULT '0.00',
  `waiver` decimal(8,2) NOT NULL DEFAULT '0.00',
  `fine_payable` decimal(8,2) NOT NULL DEFAULT '0.00',
  `fee_payable` decimal(8,2) NOT NULL DEFAULT '0.00',
  `fee_and_fine_payable` decimal(8,2) NOT NULL DEFAULT '0.00',
  `fee_and_fine_paid` decimal(8,2) NOT NULL DEFAULT '0.00',
  `previous_due_payable` decimal(8,2) NOT NULL DEFAULT '0.00',
  `previous_due_paid` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_collection_details_sub_heads`
--

CREATE TABLE `student_collection_details_sub_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `session_id` bigint UNSIGNED NOT NULL COMMENT 'Academic year',
  `student_collection_id` bigint UNSIGNED NOT NULL,
  `student_collection_details_id` bigint UNSIGNED NOT NULL,
  `fee_head_id` bigint UNSIGNED NOT NULL,
  `sub_head_id` bigint UNSIGNED NOT NULL,
  `total_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `due_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_devices`
--

CREATE TABLE `student_devices` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `device_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_info` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_groups`
--

CREATE TABLE `student_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `group_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_groups`
--

INSERT INTO `student_groups` (`id`, `institute_id`, `branch_id`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Science', '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'Arts', '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `student_migrations`
--

CREATE TABLE `student_migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED DEFAULT NULL,
  `section_id` bigint UNSIGNED DEFAULT NULL,
  `group_id` bigint UNSIGNED DEFAULT NULL,
  `prev_class_id` bigint UNSIGNED DEFAULT NULL,
  `prev_section_id` bigint UNSIGNED DEFAULT NULL,
  `prev_group_id` bigint UNSIGNED DEFAULT NULL,
  `prev_roll` bigint UNSIGNED DEFAULT NULL,
  `new_roll` bigint UNSIGNED DEFAULT NULL,
  `academic_year` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_sessions`
--

CREATE TABLE `student_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `session_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `section_id` bigint UNSIGNED NOT NULL,
  `roll` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `optional_subject` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_waiver_configs`
--

CREATE TABLE `student_waiver_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `fee_head_id` bigint UNSIGNED DEFAULT NULL,
  `waiver_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `subject_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_short_form` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_type_form` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `sl_no` bigint UNSIGNED DEFAULT '20',
  `group_id` bigint UNSIGNED DEFAULT NULL,
  `objective` int UNSIGNED DEFAULT '0',
  `written` int UNSIGNED DEFAULT '0',
  `practical` int UNSIGNED DEFAULT '0',
  `full_mark` int UNSIGNED DEFAULT '0',
  `pass_mark` int UNSIGNED DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `institute_id`, `branch_id`, `subject_name`, `subject_code`, `subject_short_form`, `subject_type`, `subject_type_form`, `class_id`, `sl_no`, `group_id`, `objective`, `written`, `practical`, `full_mark`, `pass_mark`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Bangla', 'BAN101', 'BAN', NULL, NULL, 1, 20, NULL, 0, 0, 0, 100, 33, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'English', 'ENG101', 'ENG', NULL, NULL, 1, 20, NULL, 0, 0, 0, 100, 33, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `subject_configs`
--

CREATE TABLE `subject_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sr_no` int NOT NULL DEFAULT '0',
  `merge_config_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active','expired','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `invoice_details` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `institute_id`, `plan_id`, `start_date`, `end_date`, `status`, `invoice_details`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, '2026-03-30', '2027-03-30', 'active', '\"{\\\"invoice_no\\\":\\\"INV-81DEVP\\\",\\\"issued_at\\\":\\\"2026-03-30\\\",\\\"notes\\\":\\\"Auto-generated in seeder\\\"}\"', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_paid` decimal(8,2) DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_items`
--

INSERT INTO `subscription_items` (`id`, `subscription_id`, `reference_no`, `amount_paid`, `payment_method`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'PAY-3B4RYRJV', '299.00', 'Manual', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_upgrade_requests`
--

CREATE TABLE `subscription_upgrade_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `extra_days` int NOT NULL DEFAULT '0',
  `amount_paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `syllabus`
--

CREATE TABLE `syllabus` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `session_id` int NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `class_id` int NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `s_a_a_s_faqs`
--

CREATE TABLE `s_a_a_s_faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `s_a_a_s_faqs`
--

INSERT INTO `s_a_a_s_faqs` (`id`, `question`, `answer`, `status`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'What is an academic program?', 'The academic program is a one stop solution for students. Where every student has the opportunity to ensure A+ preparation for  board exams through interactive live classes, homework, live tests and progress analysis by the best mentors in each subject throughout the year. Once a student starts this program, he will not have to go to any coaching or private tutor after school/college.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(2, 'What is an academic program?', 'The academic program is a one stop solution for students. Where every student has the opportunity to ensure A+ preparation for  board exams through interactive live classes, homework, live tests and progress analysis by the best mentors in each subject throughout the year. Once a student starts this program, he will not have to go to any coaching or private tutor after school/college.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(3, 'What is an academic program?', 'The academic program is a one stop solution for students. Where every student has the opportunity to ensure A+ preparation for  board exams through interactive live classes, homework, live tests and progress analysis by the best mentors in each subject throughout the year. Once a student starts this program, he will not have to go to any coaching or private tutor after school/college.', 1, NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `s_a_a_s_settings`
--

CREATE TABLE `s_a_a_s_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `payment_info` longtext COLLATE utf8mb4_unicode_ci,
  `sms_info` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'general',
  `mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `s_a_a_s_settings`
--

INSERT INTO `s_a_a_s_settings` (`id`, `name`, `value`, `payment_info`, `sms_info`, `type`, `mode`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'site_name', 'SAAS Site', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(2, 'site_title', 'SAAS Title', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(3, 'phone', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(4, 'office_phone', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(5, 'email', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(6, 'language', 'en', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(7, 'google_map', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(8, 'address', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(9, 'on_google_map', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(10, 'currency_symbol', '$', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(11, 'logo', 'logo.png', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(12, 'disabled_website', 'no', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(13, 'copyright_text', '&copy; Copyright 2025. All Rights Reserved by FueDevs LTD', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(14, 'facebook_link', 'https://www.facebook.com/', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(15, 'google_plus_link', 'https://www.google.com/', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(16, 'youtube_link', 'https://www.youtube.com/', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(17, 'whats_app_link', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(18, 'twitter_link', 'https://www.twitter.com', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(19, 'header_notice', '', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(20, 'app_version', '1.0.0', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(21, 'app_url', 'drive-link', NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(22, 'primary_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(23, 'secondary_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(24, 'primary_container_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(25, 'dark_primary_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(26, 'dark_secondary_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(27, 'dark_container_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(28, 'text_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(29, 'dark_text_colo', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(30, 'sidebar_selected_bg_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(31, 'sidebar_selected_text_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(32, 'sidebar_selected_text_color', NULL, NULL, NULL, 'general', NULL, NULL, NULL, NULL, NULL),
(33, 'vercel_project_id', 'prj_8PvmJHMdDZNsnjGEK3AarjW75uO4', NULL, NULL, 'vercel', NULL, NULL, NULL, NULL, NULL),
(34, 'vercel_token', '8dBrjwsJuTMq3okIbXCoVo8S', NULL, NULL, 'vercel', NULL, NULL, NULL, NULL, NULL),
(35, 'bkash', NULL, '{\"app_key\":\"\",\"app_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL),
(36, 'paystack', NULL, '{\"public_key\":\"\",\"secret_key\":\"\",\"merchant_email\":\"\",\"callback_url\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL),
(37, 'razor_pay', NULL, '{\"api_key\":\"rzp_test_jXtU63C342FF9B\",\"api_secret\":\"nrzllzn50ELsRHwFwYthIgBT\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL),
(38, 'stripe', NULL, '{\"published_key\":\"\",\"api_key\":\"\",\"mode\":\"test\",\"other_config_key\":\"test_value\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL),
(39, 'ssl_commerz', NULL, '{\"store_id\":\"\",\"store_password\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL),
(40, 'pvit', NULL, '{\"mc_tel_merchant\":\"\",\"access_token\":\"\",\"mc_merchant_code\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL),
(41, 'paypal', NULL, '{\"client_id\":\"\",\"client_secret\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL),
(42, 'paymob_accept', NULL, '{\"api_key\":\"\",\"integration_id\":\"\",\"iframe_id\":\"\",\"hmac_secret\":\"\",\"supported_country\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL),
(43, 'flutterwave', NULL, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL),
(44, 'senang_pay', NULL, '{\"merchant_id\":\"\",\"secret_key\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL),
(45, 'paytm', NULL, '{\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_website_link\":\"\",\"refund_url\":\"\"}', NULL, 'payment_config', 'test', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `s_a_a_s_subscriptions`
--

CREATE TABLE `s_a_a_s_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `religion` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blood` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sl` int DEFAULT NULL,
  `marital_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tin_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `joining_date` date DEFAULT NULL,
  `permanent_address` longtext COLLATE utf8mb4_unicode_ci,
  `access_key` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `training_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_administrator` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_visible_website` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_signatures`
--

CREATE TABLE `teacher_signatures` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `signature_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `institute_id`, `branch_id`, `user_id`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'I love learning here! The teachers are supportive, and the activities are fun.', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(2, 1, 1, 2, 'A great place to teach! The school values both students and educators.', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(3, 1, 1, 3, 'The best decision for my child! Excellent education and communication.', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint UNSIGNED NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `category`, `name`, `icon`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Core Academic', 'Elementary School', '🏫', 'Bright, engaging design for young learners', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(2, 'Core Academic', 'Middle School', '🎒', 'Balanced design for transitional years', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(3, 'Core Academic', 'High School', '🎓', 'Dynamic, aspirational design for teens', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(4, 'Core Academic', 'College', '🎓', 'Modern, sophisticated design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(5, 'Core Academic', 'University', '🏛️', 'Academic, prestigious design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(6, 'Early Childhood', 'Kindergarten', '🌈', 'Bright, playful design for young children', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(7, 'Specialized Training', 'Vocational School', '🔧', 'Practical, hands-on design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(8, 'Specialized Training', 'Culinary School', '👨‍🍳', 'Warm, appetizing design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(9, 'Arts & Creative', 'Music School', '🎵', 'Creative, artistic design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(10, 'Arts & Creative', 'Art School', '🎨', 'Inspiring, expressive design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(11, 'Physical Training', 'Fitness School', '💪', 'Energetic, motivational design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(12, 'Physical Training', 'Karate School', '🥋', 'Disciplined, traditional design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(13, 'Physical Training', 'Swimming School', '🏊', 'Aquatic, refreshing design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(14, 'Language & Communication', 'Language School', '🌍', 'Global, communicative design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(15, 'Transportation', 'Driving School', '🚗', 'Dynamic, safety-focused design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(16, 'Specialized Programs', 'Diploma Programs', '🏆', 'Achievement-focused design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(17, 'Specialized Programs', 'Generic School', '🏫', 'Default professional design', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transport_members`
--

CREATE TABLE `transport_members` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `assigned_route_id` bigint UNSIGNED NOT NULL,
  `assigned_stop_id` bigint UNSIGNED NOT NULL,
  `fare_amount` decimal(8,2) NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT '1=Active, 2=InActive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED DEFAULT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int NOT NULL DEFAULT '7',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Student',
  `facebook` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_plus` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `nid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` enum('APP','WEB') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_info` longtext COLLATE utf8mb4_unicode_ci,
  `last_active_time` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `institute_id`, `branch_id`, `name`, `username`, `email`, `password`, `phone`, `image`, `role_id`, `email_verified_at`, `status`, `user_type`, `facebook`, `twitter`, `linkedin`, `google_plus`, `user_status`, `nid`, `address`, `platform`, `device_info`, `last_active_time`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'SAAS Admin', NULL, 'saasadmin@gmail.com', '$2y$12$zUL91JihloM47gzv0jOPKu8cAiA/WW0wYd2l0W68oCCICSiWd4UHi', '000000000001', '5.png', 1, '2026-03-30 11:21:05', 1, 'SAAS Admin', 'http://www.marquardt.com/dolores-est-consectetur-corporis-nisi-totam-molestiae-magnam', 'http://reichert.com/', 'https://schulist.com/autem-ut-labore-quo-quae-rerum-eum-rerum.html', 'http://bogisich.biz/hic-rerum-ut-quas', '0', NULL, NULL, 'WEB', NULL, '2026-03-30 11:21:05', 's0nIid84Op', NULL, '2026-03-30 11:21:05', '2026-03-30 11:21:05'),
(2, 1, 1, 'Super Admin', NULL, 'superadmin@gmail.com', '$2y$12$4PSGOGBCyEP5XEAFOE1XrOQUxr7qrtklCtgE1cKxMLcPIFCfvKqe.', '000000000002', '5.png', 2, '2026-03-30 11:21:05', 1, 'Super Admin', 'http://rosenbaum.com/earum-qui-porro-possimus-amet-et', 'https://www.powlowski.com/adipisci-sed-enim-non-nisi-doloremque', 'http://www.cummings.com/', 'http://greenfelder.org/omnis-omnis-illo-omnis-est-similique', '0', NULL, NULL, 'WEB', NULL, '2026-03-30 11:21:05', 'idSDP39BgC', NULL, '2026-03-30 11:21:05', '2026-03-30 11:21:05'),
(3, 1, 1, 'System Admin', NULL, 'systemadmin@gmail.com', '$2y$12$ic.65p6s8Jj1ubtuRdj/Z.Pljeohn0mwWHAUlWQUy0IJ6n3pCXU9K', '000000000003', '5.png', 3, '2026-03-30 11:21:05', 1, 'System Admin', 'http://johnston.com/voluptas-molestias-maxime-molestias-dicta-sint', 'http://wyman.com/', 'https://www.wiza.org/dolore-perspiciatis-sit-autem-est', 'http://glover.com/quia-quasi-est-incidunt-ad-nostrum-in-qui.html', '0', NULL, NULL, 'WEB', NULL, '2026-03-30 11:21:05', 'mlChNee1TN', NULL, '2026-03-30 11:21:06', '2026-03-30 11:21:06'),
(4, 1, 1, 'Accountant', NULL, 'accountant@gmail.com', '$2y$12$fQiNlgEUGgdWfzLPPpU1WeHNsAQ2CVEUStXfkNE.3pTsFcUQvVYiq', '000000000004', '5.png', 4, '2026-03-30 11:21:12', 1, 'Accountant', 'http://www.trantow.biz/voluptatem-dignissimos-blanditiis-aut-iste', 'https://gerlach.com/et-ad-est-eos-deserunt-rem-id.html', 'http://www.rempel.info/beatae-non-accusantium-est-recusandae-eveniet-rem-quo-beatae.html', 'http://torp.org/molestias-facere-provident-rerum-omnis-ipsam-nesciunt-exercitationem-doloribus', '0', NULL, NULL, 'WEB', NULL, '2026-03-30 11:21:12', 'jDBZw7MHGC', NULL, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, 'Librarian', NULL, 'librarian@gmail.com', '$2y$12$pYylBlCJMMV0ssKurV1MEO/WaXMwdvk/wkIGR3b1k5sLJixeykpX2', '000000000005', '5.png', 5, '2026-03-30 11:21:13', 1, 'Librarian', 'http://kuhic.org/', 'http://www.fritsch.com/ut-temporibus-est-ut-ut-asperiores', 'https://waters.com/labore-ut-nihil-voluptatem-aliquam-et-repellendus-aut.html', 'http://www.moen.org/quasi-dolores-quaerat-atque-porro-illum-quis.html', '0', NULL, NULL, 'WEB', NULL, '2026-03-30 11:21:13', 'jLviJfsz6x', NULL, '2026-03-30 11:21:13', '2026-03-30 11:21:13'),
(6, 1, 1, 'Hostel', NULL, 'hostel@gmail.com', '$2y$12$4kxK85hlnKf3605pwnoUo.arPZ6YCACFKc8bdFX/x9okau4FgAKTC', '000000000006', '5.png', 9, '2026-03-30 11:21:13', 1, 'Hostel', 'http://ryan.net/quis-dolorum-magni-exercitationem-tempore-repellendus-tempora-odit', 'http://www.green.org/', 'http://miller.com/', 'http://wyman.com/', '0', NULL, NULL, 'WEB', NULL, '2026-03-30 11:21:13', 'fVThotS3nS', NULL, '2026-03-30 11:21:13', '2026-03-30 11:21:13'),
(7, 1, 1, 'Transport', NULL, 'transport@gmail.com', '$2y$12$OasfpBvIoTv0C1GzLT171OyY88kG/FkgSktM4UG8oj71rb7UCeu5u', '000000000007', '5.png', 10, '2026-03-30 11:21:13', 1, 'Transport', 'http://www.ritchie.info/aut-eum-quasi-maiores', 'http://www.schumm.biz/', 'http://www.brekke.com/ut-quia-quae-nemo-quas-sit-sed-recusandae', 'http://bashirian.org/non-reprehenderit-aspernatur-et-omnis-aut', '0', NULL, NULL, 'WEB', NULL, '2026-03-30 11:21:13', 'npdhyBRU41', NULL, '2026-03-30 11:21:14', '2026-03-30 11:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` enum('create','update','view','delete','fee_collect','payment','receipt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'create',
  `detail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_detail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint UNSIGNED DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_notices`
--

CREATE TABLE `user_notices` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `notice_id` int NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_payrolls`
--

CREATE TABLE `user_payrolls` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `net_salary` decimal(10,2) NOT NULL DEFAULT '0.00',
  `current_due` decimal(10,2) NOT NULL DEFAULT '0.00',
  `current_advance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_payrolls`
--

INSERT INTO `user_payrolls` (`id`, `institute_id`, `branch_id`, `user_id`, `net_salary`, `current_due`, `current_advance`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, '1000.00', '0.00', '0.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(2, 1, 1, 5, '1000.00', '0.00', '0.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(3, 1, 1, 6, '1000.00', '0.00', '0.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14'),
(4, 1, 1, 7, '1000.00', '0.00', '0.00', '2026-03-30 11:21:14', '2026-03-30 11:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `waivers`
--

CREATE TABLE `waivers` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `waiver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `waivers`
--

INSERT INTO `waivers` (`id`, `institute_id`, `branch_id`, `waiver`, `serial`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Class Waiver', 1, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(2, 1, 1, 'Girl Waiver', 2, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(3, 1, 1, 'Merit Waiver', 3, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(4, 1, 1, 'Poor Waiver', 3, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(5, 1, 1, 'Scout Waiver', 4, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(6, 1, 1, 'BNCC Waiver', 5, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(7, 1, 1, 'Special Waiver', 6, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(8, 1, 1, 'Govt. Waiver', 7, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(9, 1, 1, 'Invention Waiver', 8, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(10, 1, 1, 'Creative Waiver', 9, '2026-03-30 11:21:12', '2026-03-30 11:21:12'),
(11, 1, 1, 'Other Waiver', 10, '2026-03-30 11:21:12', '2026-03-30 11:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `why_choose_us`
--

CREATE TABLE `why_choose_us` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `why_choose_us`
--

INSERT INTO `why_choose_us` (`id`, `institute_id`, `branch_id`, `title`, `description`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Personalized Education', 'We tailor the learning experience to suit each student`s strengths and needs.', 'https://i.ibb.co.com/hx9JgrTq/fi-2097062.png', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(2, 1, 1, 'Experienced Faculty', 'Our team of highly qualified teachers is dedicated to nurturing your child`s potential .', 'https://i.ibb.co.com/TqwD1x5h/fi-2097104.png', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(3, 1, 1, 'State-of-the-Art Facilities', 'From smart classrooms to recreational areas, we offer the best resources for students to thrive.', 'https://i.ibb.co.com/4RVcT1w1/fi-2097055.png', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL),
(4, 1, 1, 'Holistic Development', 'Beyond academics, we focus on sports, arts, and personal growth to prepare students for the future.', 'https://i.ibb.co.com/Pv8GhnbM/fi-2097052.png', '2026-03-30 11:21:12', '2026-03-30 11:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zoom_meetings`
--

CREATE TABLE `zoom_meetings` (
  `id` bigint UNSIGNED NOT NULL,
  `institute_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `agenda` text COLLATE utf8mb4_unicode_ci,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `about_us_institute_id_foreign` (`institute_id`),
  ADD KEY `about_us_branch_id_foreign` (`branch_id`),
  ADD KEY `about_us_created_by_foreign` (`created_by`),
  ADD KEY `about_us_title_index` (`title`);

--
-- Indexes for table `absent_fines`
--
ALTER TABLE `absent_fines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absent_fines_institute_id_foreign` (`institute_id`),
  ADD KEY `absent_fines_branch_id_foreign` (`branch_id`),
  ADD KEY `absent_fines_class_id_index` (`class_id`);

--
-- Indexes for table `academic_images`
--
ALTER TABLE `academic_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `academic_images_institute_id_foreign` (`institute_id`),
  ADD KEY `academic_images_created_by_foreign` (`created_by`);

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounting_categories`
--
ALTER TABLE `accounting_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`name`),
  ADD KEY `accounting_categories_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `accounting_funds`
--
ALTER TABLE `accounting_funds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`name`),
  ADD KEY `accounting_funds_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `accounting_groups`
--
ALTER TABLE `accounting_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`accounting_category_id`,`name`),
  ADD KEY `accounting_groups_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `accounting_ledgers`
--
ALTER TABLE `accounting_ledgers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`ledger_name`),
  ADD KEY `accounting_ledgers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_institute_id_foreign` (`institute_id`),
  ADD KEY `account_transactions_branch_id_foreign` (`branch_id`),
  ADD KEY `account_transactions_voucher_id_fund_id_index` (`voucher_id`,`fund_id`);

--
-- Indexes for table `account_transaction_details`
--
ALTER TABLE `account_transaction_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transaction_details_institute_id_foreign` (`institute_id`),
  ADD KEY `account_transaction_details_branch_id_foreign` (`branch_id`),
  ADD KEY `account_transaction_details_account_transactions_id_index` (`account_transactions_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_institute_id_foreign` (`institute_id`),
  ADD KEY `assignments_branch_id_foreign` (`branch_id`),
  ADD KEY `assignments_class_id_section_id_index` (`class_id`,`section_id`);

--
-- Indexes for table `assignment_submits`
--
ALTER TABLE `assignment_submits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_submits_institute_id_foreign` (`institute_id`),
  ADD KEY `assignment_submits_branch_id_foreign` (`branch_id`),
  ADD KEY `assignment_submits_reviewed_by_foreign` (`reviewed_by`);

--
-- Indexes for table `assign_shifts`
--
ALTER TABLE `assign_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assign_shifts_institute_id_foreign` (`institute_id`),
  ADD KEY `assign_shifts_branch_id_foreign` (`branch_id`),
  ADD KEY `assign_shifts_teacher_id_shift_id_index` (`teacher_id`,`shift_id`);

--
-- Indexes for table `assign_subjects`
--
ALTER TABLE `assign_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assign_subjects_institute_id_foreign` (`institute_id`),
  ADD KEY `assign_subjects_branch_id_foreign` (`branch_id`),
  ADD KEY `assign_subjects_subject_id_index` (`subject_id`);

--
-- Indexes for table `attendance_fines`
--
ALTER TABLE `attendance_fines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_fines_institute_id_foreign` (`institute_id`),
  ADD KEY `attendance_fines_branch_id_foreign` (`branch_id`),
  ADD KEY `attendance_fines_student_id_index` (`student_id`);

--
-- Indexes for table `attendance_waivers`
--
ALTER TABLE `attendance_waivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_waivers_institute_id_foreign` (`institute_id`),
  ADD KEY `attendance_waivers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_institute_id_foreign` (`institute_id`),
  ADD KEY `banners_branch_id_foreign` (`branch_id`),
  ADD KEY `banners_created_by_foreign` (`created_by`);

--
-- Indexes for table `behaviors`
--
ALTER TABLE `behaviors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `behaviors_institute_id_foreign` (`institute_id`),
  ADD KEY `behaviors_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_institute_id_foreign` (`institute_id`),
  ADD KEY `books_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `book_categories`
--
ALTER TABLE `book_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_categories_institute_id_foreign` (`institute_id`),
  ADD KEY `book_categories_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_issues_institute_id_foreign` (`institute_id`),
  ADD KEY `book_issues_branch_id_foreign` (`branch_id`),
  ADD KEY `book_issues_book_id_library_id_user_id_index` (`book_id`,`library_id`,`user_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_institute_id_foreign` (`institute_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buses_institute_id_foreign` (`institute_id`),
  ADD KEY `buses_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `bus_routes`
--
ALTER TABLE `bus_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_routes_institute_id_foreign` (`institute_id`),
  ADD KEY `bus_routes_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `bus_stops`
--
ALTER TABLE `bus_stops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_stops_institute_id_foreign` (`institute_id`),
  ADD KEY `bus_stops_branch_id_foreign` (`branch_id`),
  ADD KEY `bus_stops_route_id_foreign` (`route_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapters_institute_id_foreign` (`institute_id`),
  ADD KEY `chapters_course_id_foreign` (`course_id`),
  ADD KEY `chapters_created_by_foreign` (`created_by`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_institute_id_foreign` (`institute_id`),
  ADD KEY `classes_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `class_assigns`
--
ALTER TABLE `class_assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_assigns_institute_id_foreign` (`institute_id`),
  ADD KEY `class_assigns_branch_id_foreign` (`branch_id`),
  ADD KEY `class_assigns_teacher_id_class_id_index` (`teacher_id`,`class_id`);

--
-- Indexes for table `class_days`
--
ALTER TABLE `class_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_days_institute_id_foreign` (`institute_id`),
  ADD KEY `class_days_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `class_exams`
--
ALTER TABLE `class_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_exams_institute_id_foreign` (`institute_id`),
  ADD KEY `class_exams_branch_id_foreign` (`branch_id`),
  ADD KEY `class_exams_class_id_foreign` (`class_id`),
  ADD KEY `class_exams_exam_id_foreign` (`exam_id`),
  ADD KEY `class_exams_merit_process_type_id_foreign` (`merit_process_type_id`);

--
-- Indexes for table `class_lessons`
--
ALTER TABLE `class_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_lessons_institute_id_foreign` (`institute_id`),
  ADD KEY `class_lessons_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `class_routines`
--
ALTER TABLE `class_routines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `start_end_teacher_unique` (`day`,`start_time`,`end_time`,`teacher_id`),
  ADD KEY `class_routines_institute_id_foreign` (`institute_id`),
  ADD KEY `class_routines_branch_id_foreign` (`branch_id`),
  ADD KEY `class_routines_class_id_foreign` (`class_id`),
  ADD KEY `class_routines_subject_id_foreign` (`subject_id`),
  ADD KEY `class_routines_section_id_subject_id_teacher_id_index` (`section_id`,`subject_id`,`teacher_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_institute_id_foreign` (`institute_id`),
  ADD KEY `contacts_branch_id_foreign` (`branch_id`),
  ADD KEY `contacts_user_id_isseen_index` (`user_id`,`isSeen`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contents_chapter_id_type_type_id_unique` (`chapter_id`,`type`,`type_id`),
  ADD KEY `contents_institute_id_foreign` (`institute_id`);

--
-- Indexes for table `content_visibility`
--
ALTER TABLE `content_visibility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_visibility_institute_id_foreign` (`institute_id`),
  ADD KEY `content_visibility_course_id_foreign` (`course_id`),
  ADD KEY `content_visibility_chapter_id_foreign` (`chapter_id`),
  ADD KEY `content_visibility_created_by_foreign` (`created_by`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_institute_id_foreign` (`institute_id`),
  ADD KEY `courses_branch_id_foreign` (`branch_id`),
  ADD KEY `courses_course_category_id_foreign` (`course_category_id`),
  ADD KEY `courses_course_sub_category_id_foreign` (`course_sub_category_id`),
  ADD KEY `courses_created_by_foreign` (`created_by`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_categories_institute_id_foreign` (`institute_id`),
  ADD KEY `course_categories_parent_id_foreign` (`parent_id`),
  ADD KEY `course_categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `course_faqs`
--
ALTER TABLE `course_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_faqs_institute_id_foreign` (`institute_id`),
  ADD KEY `course_faqs_course_id_foreign` (`course_id`),
  ADD KEY `course_faqs_created_by_foreign` (`created_by`);

--
-- Indexes for table `course_features`
--
ALTER TABLE `course_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_features_institute_id_foreign` (`institute_id`),
  ADD KEY `course_features_course_id_foreign` (`course_id`),
  ADD KEY `course_features_created_by_foreign` (`created_by`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_institute_id_branch_id_module_index` (`institute_id`,`branch_id`,`module`),
  ADD KEY `custom_fields_institute_id_index` (`institute_id`),
  ADD KEY `custom_fields_branch_id_index` (`branch_id`),
  ADD KEY `custom_fields_field_name_index` (`field_name`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_values_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `custom_field_values_institute_id_index` (`institute_id`),
  ADD KEY `custom_field_values_branch_id_index` (`branch_id`),
  ADD KEY `custom_field_values_custom_field_id_index` (`custom_field_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`department_name`),
  ADD KEY `departments_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `device_controls`
--
ALTER TABLE `device_controls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_controls_student_id_foreign` (`student_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drivers_institute_id_foreign` (`institute_id`),
  ADD KEY `drivers_branch_id_foreign` (`branch_id`),
  ADD KEY `drivers_assigned_bus_id_foreign` (`assigned_bus_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enrollments_course_id_user_id_unique` (`course_id`,`user_id`),
  ADD KEY `enrollments_institute_id_foreign` (`institute_id`),
  ADD KEY `enrollments_user_id_foreign` (`user_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_institute_id_foreign` (`institute_id`),
  ADD KEY `events_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`exam_code`),
  ADD KEY `exams_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `exam_attendances`
--
ALTER TABLE `exam_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_attendances_institute_id_foreign` (`institute_id`),
  ADD KEY `exam_attendances_branch_id_foreign` (`branch_id`),
  ADD KEY `exam_attendances_class_id_section_id_exam_id_index` (`class_id`,`section_id`,`exam_id`);

--
-- Indexes for table `exam_codes`
--
ALTER TABLE `exam_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_codes_institute_id_foreign` (`institute_id`),
  ADD KEY `exam_codes_branch_id_foreign` (`branch_id`),
  ADD KEY `exam_codes_class_model_id_foreign` (`class_model_id`),
  ADD KEY `exam_codes_short_code_id_foreign` (`short_code_id`);

--
-- Indexes for table `exam_grades`
--
ALTER TABLE `exam_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_grades_institute_id_foreign` (`institute_id`),
  ADD KEY `exam_grades_branch_id_foreign` (`branch_id`),
  ADD KEY `exam_grades_class_model_id_foreign` (`class_model_id`),
  ADD KEY `exam_grades_grade_id_foreign` (`grade_id`);

--
-- Indexes for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_marks_institute_id_foreign` (`institute_id`),
  ADD KEY `exam_marks_branch_id_foreign` (`branch_id`),
  ADD KEY `exam_marks_student_id_foreign` (`student_id`),
  ADD KEY `exam_marks_class_id_foreign` (`class_id`),
  ADD KEY `exam_marks_group_id_foreign` (`group_id`),
  ADD KEY `exam_marks_subject_id_foreign` (`subject_id`),
  ADD KEY `exam_marks_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_schedules_institute_id_foreign` (`institute_id`),
  ADD KEY `exam_schedules_branch_id_foreign` (`branch_id`),
  ADD KEY `exam_schedules_class_id_subject_id_exam_id_index` (`class_id`,`subject_id`,`exam_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faq_questions`
--
ALTER TABLE `faq_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_questions_institute_id_foreign` (`institute_id`),
  ADD KEY `faq_questions_branch_id_foreign` (`branch_id`),
  ADD KEY `faq_questions_created_by_foreign` (`created_by`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_user_id_foreign` (`user_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_institute_id_foreign` (`institute_id`),
  ADD KEY `fees_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `fee_date_configs`
--
ALTER TABLE `fee_date_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_date_configs_institute_id_foreign` (`institute_id`),
  ADD KEY `fee_date_configs_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `fee_heads`
--
ALTER TABLE `fee_heads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`name`),
  ADD KEY `fee_heads_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `fee_maps`
--
ALTER TABLE `fee_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_maps_institute_id_foreign` (`institute_id`),
  ADD KEY `fee_maps_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `fee_map_fee_sub_head`
--
ALTER TABLE `fee_map_fee_sub_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_map_fund`
--
ALTER TABLE `fee_map_fund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_sub_heads`
--
ALTER TABLE `fee_sub_heads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`fee_head_id`,`name`),
  ADD KEY `fee_sub_heads_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `frontend_contacts`
--
ALTER TABLE `frontend_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`phone`,`email`),
  ADD KEY `frontend_contacts_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `gamifications`
--
ALTER TABLE `gamifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gamifications_institute_id_foreign` (`institute_id`),
  ADD KEY `gamifications_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grades_institute_id_foreign` (`institute_id`),
  ADD KEY `grades_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `grand_final_class_exams`
--
ALTER TABLE `grand_final_class_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grand_final_class_exams_institute_id_foreign` (`institute_id`),
  ADD KEY `grand_final_class_exams_branch_id_foreign` (`branch_id`),
  ADD KEY `grand_final_class_exams_class_id_foreign` (`class_id`),
  ADD KEY `grand_final_class_exams_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `hostels`
--
ALTER TABLE `hostels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostels_institute_id_foreign` (`institute_id`),
  ADD KEY `hostels_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `hostel_bills`
--
ALTER TABLE `hostel_bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostel_bills_institute_id_foreign` (`institute_id`),
  ADD KEY `hostel_bills_branch_id_foreign` (`branch_id`),
  ADD KEY `hostel_bills_student_id_foreign` (`student_id`);

--
-- Indexes for table `hostel_categories`
--
ALTER TABLE `hostel_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostel_categories_institute_id_foreign` (`institute_id`),
  ADD KEY `hostel_categories_branch_id_foreign` (`branch_id`),
  ADD KEY `hostel_categories_hostel_id_foreign` (`hostel_id`);

--
-- Indexes for table `hostel_members`
--
ALTER TABLE `hostel_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostel_members_institute_id_foreign` (`institute_id`),
  ADD KEY `hostel_members_branch_id_foreign` (`branch_id`),
  ADD KEY `hostel_members_hostel_category_id_foreign` (`hostel_category_id`),
  ADD KEY `hostel_members_student_id_foreign` (`student_id`);

--
-- Indexes for table `institutes`
--
ALTER TABLE `institutes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `institutes_email_unique` (`email`),
  ADD KEY `institutes_owner_id_foreign` (`owner_id`),
  ADD KEY `institutes_assigned_to_foreign` (`assigned_to`),
  ADD KEY `institutes_created_by_foreign` (`created_by`),
  ADD KEY `institutes_updated_by_foreign` (`updated_by`),
  ADD KEY `institutes_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `institute_image_settings`
--
ALTER TABLE `institute_image_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institute_image_settings_institute_id_foreign` (`institute_id`);

--
-- Indexes for table `institute_image_s_a_a_s_settings`
--
ALTER TABLE `institute_image_s_a_a_s_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_types_institute_id_foreign` (`institute_id`),
  ADD KEY `leave_types_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_institute_id_foreign` (`institute_id`),
  ADD KEY `lessons_course_id_foreign` (`course_id`),
  ADD KEY `lessons_chapter_id_foreign` (`chapter_id`),
  ADD KEY `lessons_created_by_foreign` (`created_by`);

--
-- Indexes for table `library_fines`
--
ALTER TABLE `library_fines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `library_fines_institute_id_foreign` (`institute_id`),
  ADD KEY `library_fines_branch_id_foreign` (`branch_id`),
  ADD KEY `library_fines_book_issue_id_library_id_index` (`book_issue_id`,`library_id`);

--
-- Indexes for table `library_members`
--
ALTER TABLE `library_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `library_members_institute_id_foreign` (`institute_id`),
  ADD KEY `library_members_branch_id_foreign` (`branch_id`),
  ADD KEY `library_members_teacher_id_foreign` (`teacher_id`),
  ADD KEY `library_members_student_id_foreign` (`student_id`),
  ADD KEY `library_members_staff_id_foreign` (`staff_id`),
  ADD KEY `library_members_user_id_library_id_index` (`user_id`,`library_id`);

--
-- Indexes for table `lms_assignments`
--
ALTER TABLE `lms_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lms_assignments_institute_id_foreign` (`institute_id`),
  ADD KEY `lms_assignments_course_id_foreign` (`course_id`),
  ADD KEY `lms_assignments_chapter_id_foreign` (`chapter_id`),
  ADD KEY `lms_assignments_created_by_foreign` (`created_by`);

--
-- Indexes for table `lms_assignment_results`
--
ALTER TABLE `lms_assignment_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lms_assignment_results_institute_id_foreign` (`institute_id`),
  ADD KEY `lms_assignment_results_assignment_id_foreign` (`assignment_id`),
  ADD KEY `lms_assignment_results_user_id_foreign` (`user_id`);

--
-- Indexes for table `lms_class_routines`
--
ALTER TABLE `lms_class_routines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lms_class_routines_institute_id_foreign` (`institute_id`);

--
-- Indexes for table `lms_class_routine_days`
--
ALTER TABLE `lms_class_routine_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lms_class_routine_days_routine_id_foreign` (`routine_id`),
  ADD KEY `lms_class_routine_days_day_id_foreign` (`day_id`);

--
-- Indexes for table `lms_days`
--
ALTER TABLE `lms_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lms_days_institute_id_foreign` (`institute_id`);

--
-- Indexes for table `lms_rooms`
--
ALTER TABLE `lms_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lms_rooms_institute_id_foreign` (`institute_id`);

--
-- Indexes for table `lms_zoom_meetings`
--
ALTER TABLE `lms_zoom_meetings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`meeting_id`),
  ADD KEY `lms_zoom_meetings_course_id_foreign` (`course_id`),
  ADD KEY `lms_zoom_meetings_created_by_foreign` (`created_by`);

--
-- Indexes for table `mark_configs`
--
ALTER TABLE `mark_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mark_configs_institute_id_foreign` (`institute_id`),
  ADD KEY `mark_configs_branch_id_foreign` (`branch_id`),
  ADD KEY `mark_configs_class_id_foreign` (`class_id`),
  ADD KEY `mark_configs_group_id_foreign` (`group_id`),
  ADD KEY `mark_configs_subject_id_foreign` (`subject_id`),
  ADD KEY `mark_configs_exam_id_foreign` (`exam_id`),
  ADD KEY `mark_configs_mark_config_exam_code_id_foreign` (`mark_config_exam_code_id`);

--
-- Indexes for table `mark_config_exam_codes`
--
ALTER TABLE `mark_config_exam_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mark_config_exam_codes_title_subject_id_unique` (`title`,`subject_id`),
  ADD KEY `mark_config_exam_codes_institute_id_foreign` (`institute_id`),
  ADD KEY `mark_config_exam_codes_branch_id_foreign` (`branch_id`),
  ADD KEY `mark_config_exam_codes_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meals_institute_id_foreign` (`institute_id`),
  ADD KEY `meals_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `meal_entries`
--
ALTER TABLE `meal_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meal_entries_institute_id_foreign` (`institute_id`),
  ADD KEY `meal_entries_branch_id_foreign` (`branch_id`),
  ADD KEY `meal_entries_student_id_foreign` (`student_id`),
  ADD KEY `meal_entries_meal_id_foreign` (`meal_id`);

--
-- Indexes for table `meal_plans`
--
ALTER TABLE `meal_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meal_plans_institute_id_foreign` (`institute_id`),
  ADD KEY `meal_plans_branch_id_foreign` (`branch_id`),
  ADD KEY `meal_plans_student_id_foreign` (`student_id`),
  ADD KEY `meal_plans_meal_id_foreign` (`meal_id`);

--
-- Indexes for table `merit_process_types`
--
ALTER TABLE `merit_process_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merit_process_types_institute_id_foreign` (`institute_id`),
  ADD KEY `merit_process_types_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_app_sections`
--
ALTER TABLE `mobile_app_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_app_sections_institute_id_foreign` (`institute_id`),
  ADD KEY `mobile_app_sections_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notices_institute_id_foreign` (`institute_id`),
  ADD KEY `notices_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `onboardings`
--
ALTER TABLE `onboardings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onboardings_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `otp_verifications`
--
ALTER TABLE `otp_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otp_verifications_institute_id_foreign` (`institute_id`);

--
-- Indexes for table `our_histories`
--
ALTER TABLE `our_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `our_histories_institute_id_foreign` (`institute_id`),
  ADD KEY `our_histories_branch_id_foreign` (`branch_id`),
  ADD KEY `our_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`slug`),
  ADD KEY `pages_branch_id_foreign` (`branch_id`),
  ADD KEY `pages_author_id_index` (`author_id`);

--
-- Indexes for table `parent_models`
--
ALTER TABLE `parent_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_models_institute_id_foreign` (`institute_id`),
  ADD KEY `parent_models_branch_id_foreign` (`branch_id`),
  ADD KEY `parent_models_student_id_foreign` (`student_id`),
  ADD KEY `parent_models_user_id_parent_phone_index` (`user_id`,`parent_phone`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_institute_id_foreign` (`institute_id`),
  ADD KEY `payments_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_histories_invoice_number_unique` (`invoice_number`),
  ADD UNIQUE KEY `payment_histories_user_id_course_id_date_issued_unique` (`user_id`,`course_id`,`date_issued`),
  ADD KEY `payment_histories_institute_id_foreign` (`institute_id`),
  ADD KEY `payment_histories_course_id_foreign` (`course_id`),
  ADD KEY `payment_histories_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_institute_id_foreign` (`institute_id`),
  ADD KEY `payment_methods_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_requests_institute_id_foreign` (`institute_id`),
  ADD KEY `payment_requests_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `payroll_accounting_mappings`
--
ALTER TABLE `payroll_accounting_mappings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_accounting_mappings_ledger_id_fund_id_index` (`ledger_id`,`fund_id`);

--
-- Indexes for table `payslip_invoices`
--
ALTER TABLE `payslip_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payslip_invoices_institute_id_foreign` (`institute_id`),
  ADD KEY `payslip_invoices_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `payslip_salaries`
--
ALTER TABLE `payslip_salaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payslip_salaries_institute_id_foreign` (`institute_id`),
  ADD KEY `payslip_salaries_branch_id_foreign` (`branch_id`),
  ADD KEY `payslip_salaries_user_id_index` (`user_id`);

--
-- Indexes for table `payslip_salary_heads`
--
ALTER TABLE `payslip_salary_heads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payslip_salary_heads_institute_id_foreign` (`institute_id`),
  ADD KEY `payslip_salary_heads_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `periods`
--
ALTER TABLE `periods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`period`),
  ADD KEY `periods_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `phone_books`
--
ALTER TABLE `phone_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_books_institute_id_foreign` (`institute_id`),
  ADD KEY `phone_books_branch_id_foreign` (`branch_id`),
  ADD KEY `phone_books_category_id_index` (`category_id`);

--
-- Indexes for table `phone_book_categories`
--
ALTER TABLE `phone_book_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_book_categories_institute_id_foreign` (`institute_id`),
  ADD KEY `phone_book_categories_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `picklists`
--
ALTER TABLE `picklists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `picklists_institute_id_foreign` (`institute_id`),
  ADD KEY `picklists_branch_id_foreign` (`branch_id`),
  ADD KEY `picklists_type_index` (`type`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `policies_institute_id_foreign` (`institute_id`),
  ADD KEY `policies_branch_id_foreign` (`branch_id`),
  ADD KEY `policies_created_by_foreign` (`created_by`);

--
-- Indexes for table `prayers`
--
ALTER TABLE `prayers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prayers_institute_id_foreign` (`institute_id`),
  ADD KEY `prayers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_question_bank_class_id_foreign` (`question_bank_class_id`),
  ADD KEY `questions_question_bank_group_id_foreign` (`question_bank_group_id`),
  ADD KEY `questions_question_category_id_foreign` (`question_category_id`),
  ADD KEY `questions_question_bank_subject_id_foreign` (`question_bank_subject_id`),
  ADD KEY `questions_question_bank_chapter_id_foreign` (`question_bank_chapter_id`),
  ADD KEY `questions_question_bank_difficulty_level_id_foreign` (`question_bank_difficulty_level_id`),
  ADD KEY `questions_institute_id_foreign` (`institute_id`),
  ADD KEY `questions_created_by_foreign` (`created_by`);

--
-- Indexes for table `question_bank_boards`
--
ALTER TABLE `question_bank_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_bank_chapters`
--
ALTER TABLE `question_bank_chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_bank_chapters_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `question_bank_classes`
--
ALTER TABLE `question_bank_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_bank_difficulty_levels`
--
ALTER TABLE `question_bank_difficulty_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_bank_groups`
--
ALTER TABLE `question_bank_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_bank_groups_class_id_foreign` (`class_id`);

--
-- Indexes for table `question_bank_levels`
--
ALTER TABLE `question_bank_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_bank_sessions`
--
ALTER TABLE `question_bank_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_bank_sources`
--
ALTER TABLE `question_bank_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_bank_subjects`
--
ALTER TABLE `question_bank_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_bank_subjects_class_id_foreign` (`class_id`),
  ADD KEY `question_bank_subjects_group_id_foreign` (`group_id`),
  ADD KEY `question_bank_subjects_question_category_id_foreign` (`question_category_id`);

--
-- Indexes for table `question_bank_sub_sources`
--
ALTER TABLE `question_bank_sub_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_bank_sub_sources_source_id_foreign` (`source_id`);

--
-- Indexes for table `question_bank_tags`
--
ALTER TABLE `question_bank_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_bank_tests`
--
ALTER TABLE `question_bank_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_bank_topics`
--
ALTER TABLE `question_bank_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_bank_topics_question_bank_chapter_id_foreign` (`question_bank_chapter_id`);

--
-- Indexes for table `question_bank_types`
--
ALTER TABLE `question_bank_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_bank_years`
--
ALTER TABLE `question_bank_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_categories`
--
ALTER TABLE `question_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_categories_institute_id_foreign` (`institute_id`),
  ADD KEY `question_categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `question_level`
--
ALTER TABLE `question_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_level_question_id_foreign` (`question_id`),
  ADD KEY `question_level_question_bank_level_id_foreign` (`question_bank_level_id`);

--
-- Indexes for table `question_session`
--
ALTER TABLE `question_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_session_question_id_foreign` (`question_id`),
  ADD KEY `question_session_question_bank_session_id_foreign` (`question_bank_session_id`);

--
-- Indexes for table `question_source`
--
ALTER TABLE `question_source`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_source_question_id_foreign` (`question_id`),
  ADD KEY `question_source_question_bank_source_id_foreign` (`question_bank_source_id`);

--
-- Indexes for table `question_sub_source`
--
ALTER TABLE `question_sub_source`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_sub_source_question_id_foreign` (`question_id`),
  ADD KEY `question_sub_source_question_bank_sub_source_id_foreign` (`question_bank_sub_source_id`);

--
-- Indexes for table `question_tag`
--
ALTER TABLE `question_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_tag_question_id_foreign` (`question_id`),
  ADD KEY `question_tag_question_bank_tag_id_foreign` (`question_bank_tag_id`);

--
-- Indexes for table `question_test`
--
ALTER TABLE `question_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_test_question_id_foreign` (`question_id`),
  ADD KEY `question_test_question_bank_test_id_foreign` (`question_bank_test_id`);

--
-- Indexes for table `question_topic`
--
ALTER TABLE `question_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_topic_question_id_foreign` (`question_id`),
  ADD KEY `question_topic_question_bank_topic_id_foreign` (`question_bank_topic_id`);

--
-- Indexes for table `question_type`
--
ALTER TABLE `question_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_type_question_id_foreign` (`question_id`),
  ADD KEY `question_type_question_bank_type_id_foreign` (`question_bank_type_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizzes_institute_id_foreign` (`institute_id`),
  ADD KEY `quizzes_branch_id_foreign` (`branch_id`),
  ADD KEY `quizzes_created_by_foreign` (`created_by`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_attempts_institute_id_foreign` (`institute_id`),
  ADD KEY `quiz_attempts_branch_id_foreign` (`branch_id`),
  ADD KEY `quiz_attempts_quiz_id_foreign` (`quiz_id`),
  ADD KEY `quiz_attempts_user_id_foreign` (`user_id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_results_institute_id_foreign` (`institute_id`),
  ADD KEY `quiz_results_branch_id_foreign` (`branch_id`),
  ADD KEY `quiz_results_quiz_id_foreign` (`quiz_id`),
  ADD KEY `quiz_results_quiz_attempt_id_foreign` (`quiz_attempt_id`);

--
-- Indexes for table `quiz_topics`
--
ALTER TABLE `quiz_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_topics_institute_id_foreign` (`institute_id`),
  ADD KEY `quiz_topics_quiz_id_foreign` (`quiz_id`),
  ADD KEY `quiz_topics_question_bank_subject_id_foreign` (`question_bank_subject_id`),
  ADD KEY `quiz_topics_question_bank_chapter_id_foreign` (`question_bank_chapter_id`),
  ADD KEY `quiz_topics_question_category_id_foreign` (`question_category_id`);

--
-- Indexes for table `ready_to_join_us`
--
ALTER TABLE `ready_to_join_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ready_to_join_us_institute_id_foreign` (`institute_id`),
  ADD KEY `ready_to_join_us_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `remark_configs`
--
ALTER TABLE `remark_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remark_configs_institute_id_foreign` (`institute_id`),
  ADD KEY `remark_configs_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resources_institute_id_foreign` (`institute_id`),
  ADD KEY `resources_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `result_cards`
--
ALTER TABLE `result_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `result_cards_institute_id_foreign` (`institute_id`),
  ADD KEY `result_cards_branch_id_foreign` (`branch_id`),
  ADD KEY `result_cards_signature_id_foreign` (`signature_id`),
  ADD KEY `result_cards_teacher_signature_id_foreign` (`teacher_signature_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_institute_id_branch_id_unique` (`name`,`guard_name`,`institute_id`,`branch_id`),
  ADD KEY `roles_institute_id_foreign` (`institute_id`),
  ADD KEY `roles_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_institute_id_foreign` (`institute_id`),
  ADD KEY `rooms_branch_id_foreign` (`branch_id`),
  ADD KEY `rooms_hostel_category_id_foreign` (`hostel_category_id`);

--
-- Indexes for table `room_members`
--
ALTER TABLE `room_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_members_institute_id_foreign` (`institute_id`),
  ADD KEY `room_members_branch_id_foreign` (`branch_id`),
  ADD KEY `room_members_room_id_foreign` (`room_id`),
  ADD KEY `room_members_student_id_foreign` (`student_id`);

--
-- Indexes for table `salary_heads`
--
ALTER TABLE `salary_heads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_heads_institute_id_foreign` (`institute_id`),
  ADD KEY `salary_heads_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `salary_head_user_payrolls`
--
ALTER TABLE `salary_head_user_payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_head_user_payrolls_institute_id_foreign` (`institute_id`),
  ADD KEY `salary_head_user_payrolls_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_institute_id_foreign` (`institute_id`),
  ADD KEY `sections_branch_id_foreign` (`branch_id`),
  ADD KEY `sections_student_group_id_foreign` (`student_group_id`),
  ADD KEY `sections_class_id_student_group_id_index` (`class_id`,`student_group_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_institute_id_foreign` (`institute_id`),
  ADD KEY `settings_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shifts_institute_id_foreign` (`institute_id`),
  ADD KEY `shifts_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `short_codes`
--
ALTER TABLE `short_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `short_codes_institute_id_foreign` (`institute_id`),
  ADD KEY `short_codes_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `signatures`
--
ALTER TABLE `signatures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `signatures_institute_id_foreign` (`institute_id`),
  ADD KEY `signatures_branch_id_foreign` (`branch_id`),
  ADD KEY `signatures_user_id_index` (`user_id`);

--
-- Indexes for table `sms_balances`
--
ALTER TABLE `sms_balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_balances_institute_id_foreign` (`institute_id`),
  ADD KEY `sms_balances_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `sms_logs`
--
ALTER TABLE `sms_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_logs_institute_id_foreign` (`institute_id`),
  ADD KEY `sms_logs_branch_id_foreign` (`branch_id`),
  ADD KEY `sms_logs_user_id_foreign` (`user_id`),
  ADD KEY `sms_logs_staff_id_foreign` (`staff_id`),
  ADD KEY `sms_logs_teacher_id_foreign` (`teacher_id`),
  ADD KEY `sms_logs_student_id_foreign` (`student_id`),
  ADD KEY `sms_logs_receiver_user_type_status_index` (`receiver`,`user_type`,`status`),
  ADD KEY `sms_logs_sender_id_index` (`sender_id`);

--
-- Indexes for table `sms_purchases`
--
ALTER TABLE `sms_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_purchases_institute_id_foreign` (`institute_id`),
  ADD KEY `sms_purchases_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_templates_institute_id_foreign` (`institute_id`),
  ADD KEY `sms_templates_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staffs_institute_id_foreign` (`institute_id`),
  ADD KEY `staffs_branch_id_foreign` (`branch_id`),
  ADD KEY `staffs_department_id_foreign` (`department_id`),
  ADD KEY `staffs_user_id_department_id_index` (`user_id`,`department_id`);

--
-- Indexes for table `staff_attendances`
--
ALTER TABLE `staff_attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_attendance_date` (`user_id`,`date`),
  ADD KEY `staff_attendances_institute_id_foreign` (`institute_id`),
  ADD KEY `staff_attendances_branch_id_foreign` (`branch_id`),
  ADD KEY `staff_attendances_user_id_date_index` (`user_id`,`date`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_institute_id_foreign` (`institute_id`),
  ADD KEY `students_branch_id_foreign` (`branch_id`),
  ADD KEY `students_user_id_phone_group_index` (`user_id`,`phone`,`group`),
  ADD KEY `students_phone_index` (`phone`);

--
-- Indexes for table `student_attendances`
--
ALTER TABLE `student_attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_unique_attendance` (`student_id`,`class_id`,`section_id`,`period_id`,`date`),
  ADD KEY `student_attendances_institute_id_foreign` (`institute_id`),
  ADD KEY `student_attendances_branch_id_foreign` (`branch_id`),
  ADD KEY `student_attendances_class_id_foreign` (`class_id`),
  ADD KEY `student_attendances_section_id_foreign` (`section_id`),
  ADD KEY `student_attendances_period_id_foreign` (`period_id`),
  ADD KEY `student_attendances_subject_id_foreign` (`subject_id`),
  ADD KEY `student_attendances_date_index` (`date`);

--
-- Indexes for table `student_categories`
--
ALTER TABLE `student_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_categories_institute_id_foreign` (`institute_id`),
  ADD KEY `student_categories_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `student_collections`
--
ALTER TABLE `student_collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_collections_invoice_id_unique` (`invoice_id`),
  ADD KEY `student_collections_institute_id_foreign` (`institute_id`),
  ADD KEY `student_collections_branch_id_foreign` (`branch_id`),
  ADD KEY `student_collections_class_id_session_id_index` (`class_id`,`session_id`);

--
-- Indexes for table `student_collection_details`
--
ALTER TABLE `student_collection_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_collection_details_institute_id_foreign` (`institute_id`),
  ADD KEY `student_collection_details_branch_id_foreign` (`branch_id`),
  ADD KEY `student_collection_details_student_id_index` (`student_id`);

--
-- Indexes for table `student_collection_details_sub_heads`
--
ALTER TABLE `student_collection_details_sub_heads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_collection_details_sub_heads_institute_id_foreign` (`institute_id`),
  ADD KEY `student_collection_details_sub_heads_branch_id_foreign` (`branch_id`),
  ADD KEY `student_collection_details_sub_heads_student_id_index` (`student_id`);

--
-- Indexes for table `student_devices`
--
ALTER TABLE `student_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_devices_student_id_foreign` (`student_id`);

--
-- Indexes for table `student_groups`
--
ALTER TABLE `student_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_groups_institute_id_foreign` (`institute_id`),
  ADD KEY `student_groups_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `student_migrations`
--
ALTER TABLE `student_migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_migrations_institute_id_foreign` (`institute_id`),
  ADD KEY `student_migrations_branch_id_foreign` (`branch_id`),
  ADD KEY `student_migrations_class_id_section_id_group_id_index` (`class_id`,`section_id`,`group_id`);

--
-- Indexes for table `student_sessions`
--
ALTER TABLE `student_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`session_id`,`student_id`,`class_id`,`section_id`,`roll`),
  ADD KEY `student_sessions_institute_id_foreign` (`institute_id`),
  ADD KEY `student_sessions_branch_id_foreign` (`branch_id`),
  ADD KEY `student_sessions_student_id_foreign` (`student_id`),
  ADD KEY `student_sessions_class_id_foreign` (`class_id`),
  ADD KEY `student_sessions_section_id_foreign` (`section_id`),
  ADD KEY `student_sessions_session_id_student_id_class_id_section_id_index` (`session_id`,`student_id`,`class_id`,`section_id`),
  ADD KEY `student_sessions_roll_index` (`roll`),
  ADD KEY `student_sessions_qr_code_index` (`qr_code`);

--
-- Indexes for table `student_waiver_configs`
--
ALTER TABLE `student_waiver_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_waiver_configs_institute_id_foreign` (`institute_id`),
  ADD KEY `student_waiver_configs_branch_id_foreign` (`branch_id`),
  ADD KEY `student_waiver_configs_student_id_index` (`student_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_institute_id_foreign` (`institute_id`),
  ADD KEY `subjects_branch_id_foreign` (`branch_id`),
  ADD KEY `subjects_class_id_foreign` (`class_id`),
  ADD KEY `subjects_id_class_id_group_id_index` (`id`,`class_id`,`group_id`);

--
-- Indexes for table `subject_configs`
--
ALTER TABLE `subject_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_configs_institute_id_foreign` (`institute_id`),
  ADD KEY `subject_configs_branch_id_foreign` (`branch_id`),
  ADD KEY `subject_configs_group_id_foreign` (`group_id`),
  ADD KEY `subject_configs_subject_id_foreign` (`subject_id`),
  ADD KEY `subject_configs_class_id_group_id_subject_id_index` (`class_id`,`group_id`,`subject_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_institute_id_foreign` (`institute_id`),
  ADD KEY `subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_items_subscription_id_foreign` (`subscription_id`);

--
-- Indexes for table `subscription_upgrade_requests`
--
ALTER TABLE `subscription_upgrade_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_upgrade_requests_institute_id_foreign` (`institute_id`),
  ADD KEY `subscription_upgrade_requests_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `syllabus`
--
ALTER TABLE `syllabus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `syllabus_institute_id_foreign` (`institute_id`),
  ADD KEY `syllabus_branch_id_foreign` (`branch_id`),
  ADD KEY `syllabus_session_id_class_id_index` (`session_id`,`class_id`);

--
-- Indexes for table `s_a_a_s_faqs`
--
ALTER TABLE `s_a_a_s_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `s_a_a_s_faqs_created_by_foreign` (`created_by`);

--
-- Indexes for table `s_a_a_s_settings`
--
ALTER TABLE `s_a_a_s_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `s_a_a_s_subscriptions`
--
ALTER TABLE `s_a_a_s_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `s_a_a_s_subscriptions_email_unique` (`email`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_institute_id_foreign` (`institute_id`),
  ADD KEY `teachers_branch_id_foreign` (`branch_id`),
  ADD KEY `teachers_department_id_foreign` (`department_id`),
  ADD KEY `teachers_user_id_department_id_index` (`user_id`,`department_id`);

--
-- Indexes for table `teacher_signatures`
--
ALTER TABLE `teacher_signatures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_signatures_institute_id_foreign` (`institute_id`),
  ADD KEY `teacher_signatures_branch_id_foreign` (`branch_id`),
  ADD KEY `teacher_signatures_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_institute_id_foreign` (`institute_id`),
  ADD KEY `testimonials_branch_id_foreign` (`branch_id`),
  ADD KEY `testimonials_user_id_foreign` (`user_id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_members`
--
ALTER TABLE `transport_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_members_institute_id_foreign` (`institute_id`),
  ADD KEY `transport_members_branch_id_foreign` (`branch_id`),
  ADD KEY `transport_members_student_id_foreign` (`student_id`),
  ADD KEY `transport_members_assigned_route_id_foreign` (`assigned_route_id`),
  ADD KEY `transport_members_assigned_stop_id_foreign` (`assigned_stop_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_phone_index` (`phone`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_logs_institute_id_foreign` (`institute_id`),
  ADD KEY `user_logs_branch_id_foreign` (`branch_id`),
  ADD KEY `user_logs_user_id_index` (`user_id`);

--
-- Indexes for table `user_notices`
--
ALTER TABLE `user_notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notices_institute_id_foreign` (`institute_id`),
  ADD KEY `user_notices_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `user_payrolls`
--
ALTER TABLE `user_payrolls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_payrolls_user_id_unique` (`user_id`),
  ADD KEY `user_payrolls_institute_id_foreign` (`institute_id`),
  ADD KEY `user_payrolls_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `waivers`
--
ALTER TABLE `waivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`waiver`),
  ADD KEY `waivers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `why_choose_us_institute_id_foreign` (`institute_id`),
  ADD KEY `why_choose_us_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`institute_id`,`branch_id`,`meeting_id`),
  ADD KEY `zoom_meetings_branch_id_foreign` (`branch_id`),
  ADD KEY `zoom_meetings_created_by_foreign` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `absent_fines`
--
ALTER TABLE `absent_fines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `academic_images`
--
ALTER TABLE `academic_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `accounting_categories`
--
ALTER TABLE `accounting_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `accounting_funds`
--
ALTER TABLE `accounting_funds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accounting_groups`
--
ALTER TABLE `accounting_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `accounting_ledgers`
--
ALTER TABLE `accounting_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transaction_details`
--
ALTER TABLE `account_transaction_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignment_submits`
--
ALTER TABLE `assignment_submits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assign_shifts`
--
ALTER TABLE `assign_shifts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assign_subjects`
--
ALTER TABLE `assign_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_fines`
--
ALTER TABLE `attendance_fines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_waivers`
--
ALTER TABLE `attendance_waivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `behaviors`
--
ALTER TABLE `behaviors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_categories`
--
ALTER TABLE `book_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bus_routes`
--
ALTER TABLE `bus_routes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bus_stops`
--
ALTER TABLE `bus_stops`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_assigns`
--
ALTER TABLE `class_assigns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_days`
--
ALTER TABLE `class_days`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `class_exams`
--
ALTER TABLE `class_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_lessons`
--
ALTER TABLE `class_lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_routines`
--
ALTER TABLE `class_routines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_visibility`
--
ALTER TABLE `content_visibility`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_categories`
--
ALTER TABLE `course_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_faqs`
--
ALTER TABLE `course_faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_features`
--
ALTER TABLE `course_features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `device_controls`
--
ALTER TABLE `device_controls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_attendances`
--
ALTER TABLE `exam_attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_codes`
--
ALTER TABLE `exam_codes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_grades`
--
ALTER TABLE `exam_grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_questions`
--
ALTER TABLE `faq_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_date_configs`
--
ALTER TABLE `fee_date_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_heads`
--
ALTER TABLE `fee_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fee_maps`
--
ALTER TABLE `fee_maps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_map_fee_sub_head`
--
ALTER TABLE `fee_map_fee_sub_head`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_map_fund`
--
ALTER TABLE `fee_map_fund`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_sub_heads`
--
ALTER TABLE `fee_sub_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `frontend_contacts`
--
ALTER TABLE `frontend_contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gamifications`
--
ALTER TABLE `gamifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `grand_final_class_exams`
--
ALTER TABLE `grand_final_class_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostels`
--
ALTER TABLE `hostels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_bills`
--
ALTER TABLE `hostel_bills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_categories`
--
ALTER TABLE `hostel_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_members`
--
ALTER TABLE `hostel_members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institutes`
--
ALTER TABLE `institutes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `institute_image_settings`
--
ALTER TABLE `institute_image_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institute_image_s_a_a_s_settings`
--
ALTER TABLE `institute_image_s_a_a_s_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_fines`
--
ALTER TABLE `library_fines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_members`
--
ALTER TABLE `library_members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lms_assignments`
--
ALTER TABLE `lms_assignments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lms_assignment_results`
--
ALTER TABLE `lms_assignment_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lms_class_routines`
--
ALTER TABLE `lms_class_routines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lms_class_routine_days`
--
ALTER TABLE `lms_class_routine_days`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lms_days`
--
ALTER TABLE `lms_days`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lms_rooms`
--
ALTER TABLE `lms_rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lms_zoom_meetings`
--
ALTER TABLE `lms_zoom_meetings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_configs`
--
ALTER TABLE `mark_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_config_exam_codes`
--
ALTER TABLE `mark_config_exam_codes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meal_entries`
--
ALTER TABLE `meal_entries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meal_plans`
--
ALTER TABLE `meal_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merit_process_types`
--
ALTER TABLE `merit_process_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `mobile_app_sections`
--
ALTER TABLE `mobile_app_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `onboardings`
--
ALTER TABLE `onboardings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp_verifications`
--
ALTER TABLE `otp_verifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `our_histories`
--
ALTER TABLE `our_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `parent_models`
--
ALTER TABLE `parent_models`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_accounting_mappings`
--
ALTER TABLE `payroll_accounting_mappings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payslip_invoices`
--
ALTER TABLE `payslip_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip_salaries`
--
ALTER TABLE `payslip_salaries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip_salary_heads`
--
ALTER TABLE `payslip_salary_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `periods`
--
ALTER TABLE `periods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `phone_books`
--
ALTER TABLE `phone_books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_book_categories`
--
ALTER TABLE `phone_book_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `picklists`
--
ALTER TABLE `picklists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prayers`
--
ALTER TABLE `prayers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_boards`
--
ALTER TABLE `question_bank_boards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_chapters`
--
ALTER TABLE `question_bank_chapters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_classes`
--
ALTER TABLE `question_bank_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_difficulty_levels`
--
ALTER TABLE `question_bank_difficulty_levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_groups`
--
ALTER TABLE `question_bank_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_levels`
--
ALTER TABLE `question_bank_levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_sessions`
--
ALTER TABLE `question_bank_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_sources`
--
ALTER TABLE `question_bank_sources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_subjects`
--
ALTER TABLE `question_bank_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_sub_sources`
--
ALTER TABLE `question_bank_sub_sources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_tags`
--
ALTER TABLE `question_bank_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_tests`
--
ALTER TABLE `question_bank_tests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_topics`
--
ALTER TABLE `question_bank_topics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_types`
--
ALTER TABLE `question_bank_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_bank_years`
--
ALTER TABLE `question_bank_years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_categories`
--
ALTER TABLE `question_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_level`
--
ALTER TABLE `question_level`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_session`
--
ALTER TABLE `question_session`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_source`
--
ALTER TABLE `question_source`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_sub_source`
--
ALTER TABLE `question_sub_source`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_tag`
--
ALTER TABLE `question_tag`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_test`
--
ALTER TABLE `question_test`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_topic`
--
ALTER TABLE `question_topic`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_type`
--
ALTER TABLE `question_type`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_topics`
--
ALTER TABLE `quiz_topics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ready_to_join_us`
--
ALTER TABLE `ready_to_join_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `remark_configs`
--
ALTER TABLE `remark_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result_cards`
--
ALTER TABLE `result_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_members`
--
ALTER TABLE `room_members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_heads`
--
ALTER TABLE `salary_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `salary_head_user_payrolls`
--
ALTER TABLE `salary_head_user_payrolls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `short_codes`
--
ALTER TABLE `short_codes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `signatures`
--
ALTER TABLE `signatures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_balances`
--
ALTER TABLE `sms_balances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_logs`
--
ALTER TABLE `sms_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_purchases`
--
ALTER TABLE `sms_purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff_attendances`
--
ALTER TABLE `staff_attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_attendances`
--
ALTER TABLE `student_attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_categories`
--
ALTER TABLE `student_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_collections`
--
ALTER TABLE `student_collections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_collection_details`
--
ALTER TABLE `student_collection_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_collection_details_sub_heads`
--
ALTER TABLE `student_collection_details_sub_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_devices`
--
ALTER TABLE `student_devices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_groups`
--
ALTER TABLE `student_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_migrations`
--
ALTER TABLE `student_migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_sessions`
--
ALTER TABLE `student_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_waiver_configs`
--
ALTER TABLE `student_waiver_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject_configs`
--
ALTER TABLE `subject_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscription_upgrade_requests`
--
ALTER TABLE `subscription_upgrade_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `syllabus`
--
ALTER TABLE `syllabus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `s_a_a_s_faqs`
--
ALTER TABLE `s_a_a_s_faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `s_a_a_s_settings`
--
ALTER TABLE `s_a_a_s_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `s_a_a_s_subscriptions`
--
ALTER TABLE `s_a_a_s_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_signatures`
--
ALTER TABLE `teacher_signatures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `transport_members`
--
ALTER TABLE `transport_members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_notices`
--
ALTER TABLE `user_notices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_payrolls`
--
ALTER TABLE `user_payrolls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `waivers`
--
ALTER TABLE `waivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `about_us`
--
ALTER TABLE `about_us`
  ADD CONSTRAINT `about_us_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `about_us_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `about_us_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `absent_fines`
--
ALTER TABLE `absent_fines`
  ADD CONSTRAINT `absent_fines_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `absent_fines_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `academic_images`
--
ALTER TABLE `academic_images`
  ADD CONSTRAINT `academic_images_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `academic_images_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `accounting_categories`
--
ALTER TABLE `accounting_categories`
  ADD CONSTRAINT `accounting_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accounting_categories_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `accounting_funds`
--
ALTER TABLE `accounting_funds`
  ADD CONSTRAINT `accounting_funds_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accounting_funds_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `accounting_groups`
--
ALTER TABLE `accounting_groups`
  ADD CONSTRAINT `accounting_groups_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accounting_groups_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `accounting_ledgers`
--
ALTER TABLE `accounting_ledgers`
  ADD CONSTRAINT `accounting_ledgers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accounting_ledgers_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD CONSTRAINT `account_transactions_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_transactions_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `account_transaction_details`
--
ALTER TABLE `account_transaction_details`
  ADD CONSTRAINT `account_transaction_details_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_transaction_details_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignment_submits`
--
ALTER TABLE `assignment_submits`
  ADD CONSTRAINT `assignment_submits_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_submits_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_submits_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `assign_shifts`
--
ALTER TABLE `assign_shifts`
  ADD CONSTRAINT `assign_shifts_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assign_shifts_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assign_subjects`
--
ALTER TABLE `assign_subjects`
  ADD CONSTRAINT `assign_subjects_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assign_subjects_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendance_fines`
--
ALTER TABLE `attendance_fines`
  ADD CONSTRAINT `attendance_fines_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_fines_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendance_waivers`
--
ALTER TABLE `attendance_waivers`
  ADD CONSTRAINT `attendance_waivers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_waivers_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banners_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `banners_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `behaviors`
--
ALTER TABLE `behaviors`
  ADD CONSTRAINT `behaviors_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `behaviors_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_categories`
--
ALTER TABLE `book_categories`
  ADD CONSTRAINT `book_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_categories_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD CONSTRAINT `book_issues_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_issues_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buses_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bus_routes`
--
ALTER TABLE `bus_routes`
  ADD CONSTRAINT `bus_routes_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bus_routes_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bus_stops`
--
ALTER TABLE `bus_stops`
  ADD CONSTRAINT `bus_stops_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bus_stops_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bus_stops_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `bus_routes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chapters_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `chapters_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `classes_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_assigns`
--
ALTER TABLE `class_assigns`
  ADD CONSTRAINT `class_assigns_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_assigns_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_days`
--
ALTER TABLE `class_days`
  ADD CONSTRAINT `class_days_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_days_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_exams`
--
ALTER TABLE `class_exams`
  ADD CONSTRAINT `class_exams_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_exams_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_exams_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_exams_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_exams_merit_process_type_id_foreign` FOREIGN KEY (`merit_process_type_id`) REFERENCES `merit_process_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_lessons`
--
ALTER TABLE `class_lessons`
  ADD CONSTRAINT `class_lessons_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_lessons_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_routines`
--
ALTER TABLE `class_routines`
  ADD CONSTRAINT `class_routines_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_routines_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `class_routines_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_routines_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `class_routines_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contents_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_visibility`
--
ALTER TABLE `content_visibility`
  ADD CONSTRAINT `content_visibility_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_visibility_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_visibility_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `content_visibility_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_course_sub_category_id_foreign` FOREIGN KEY (`course_sub_category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `courses_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD CONSTRAINT `course_categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `course_categories_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `course_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `course_faqs`
--
ALTER TABLE `course_faqs`
  ADD CONSTRAINT `course_faqs_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_faqs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `course_faqs_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_features`
--
ALTER TABLE `course_features`
  ADD CONSTRAINT `course_features_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_features_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `course_features_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `departments_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `device_controls`
--
ALTER TABLE `device_controls`
  ADD CONSTRAINT `device_controls_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_assigned_bus_id_foreign` FOREIGN KEY (`assigned_bus_id`) REFERENCES `buses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `drivers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `drivers_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exams_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_attendances`
--
ALTER TABLE `exam_attendances`
  ADD CONSTRAINT `exam_attendances_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_attendances_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_codes`
--
ALTER TABLE `exam_codes`
  ADD CONSTRAINT `exam_codes_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_codes_class_model_id_foreign` FOREIGN KEY (`class_model_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `exam_codes_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_codes_short_code_id_foreign` FOREIGN KEY (`short_code_id`) REFERENCES `short_codes` (`id`);

--
-- Constraints for table `exam_grades`
--
ALTER TABLE `exam_grades`
  ADD CONSTRAINT `exam_grades_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_grades_class_model_id_foreign` FOREIGN KEY (`class_model_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `exam_grades_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`),
  ADD CONSTRAINT `exam_grades_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD CONSTRAINT `exam_marks_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_marks_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_marks_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_marks_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `student_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_marks_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_marks_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_marks_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD CONSTRAINT `exam_schedules_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_schedules_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faq_questions`
--
ALTER TABLE `faq_questions`
  ADD CONSTRAINT `faq_questions_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `faq_questions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `faq_questions_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_date_configs`
--
ALTER TABLE `fee_date_configs`
  ADD CONSTRAINT `fee_date_configs_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_date_configs_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_heads`
--
ALTER TABLE `fee_heads`
  ADD CONSTRAINT `fee_heads_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_heads_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_maps`
--
ALTER TABLE `fee_maps`
  ADD CONSTRAINT `fee_maps_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_maps_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_sub_heads`
--
ALTER TABLE `fee_sub_heads`
  ADD CONSTRAINT `fee_sub_heads_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_sub_heads_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `frontend_contacts`
--
ALTER TABLE `frontend_contacts`
  ADD CONSTRAINT `frontend_contacts_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `frontend_contacts_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gamifications`
--
ALTER TABLE `gamifications`
  ADD CONSTRAINT `gamifications_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gamifications_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `grand_final_class_exams`
--
ALTER TABLE `grand_final_class_exams`
  ADD CONSTRAINT `grand_final_class_exams_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grand_final_class_exams_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grand_final_class_exams_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grand_final_class_exams_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hostels`
--
ALTER TABLE `hostels`
  ADD CONSTRAINT `hostels_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostels_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hostel_bills`
--
ALTER TABLE `hostel_bills`
  ADD CONSTRAINT `hostel_bills_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostel_bills_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostel_bills_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hostel_categories`
--
ALTER TABLE `hostel_categories`
  ADD CONSTRAINT `hostel_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostel_categories_hostel_id_foreign` FOREIGN KEY (`hostel_id`) REFERENCES `hostels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostel_categories_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hostel_members`
--
ALTER TABLE `hostel_members`
  ADD CONSTRAINT `hostel_members_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostel_members_hostel_category_id_foreign` FOREIGN KEY (`hostel_category_id`) REFERENCES `hostel_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostel_members_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostel_members_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `institutes`
--
ALTER TABLE `institutes`
  ADD CONSTRAINT `institutes_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `institutes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `institutes_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `institutes_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `institutes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `institute_image_settings`
--
ALTER TABLE `institute_image_settings`
  ADD CONSTRAINT `institute_image_settings_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD CONSTRAINT `leave_types_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_types_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lessons_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `lessons_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `library_fines`
--
ALTER TABLE `library_fines`
  ADD CONSTRAINT `library_fines_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `library_fines_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `library_members`
--
ALTER TABLE `library_members`
  ADD CONSTRAINT `library_members_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `library_members_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `library_members_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`),
  ADD CONSTRAINT `library_members_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `library_members_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `library_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lms_assignments`
--
ALTER TABLE `lms_assignments`
  ADD CONSTRAINT `lms_assignments_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lms_assignments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lms_assignments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `lms_assignments_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lms_assignment_results`
--
ALTER TABLE `lms_assignment_results`
  ADD CONSTRAINT `lms_assignment_results_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lms_assignment_results_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lms_assignment_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lms_class_routines`
--
ALTER TABLE `lms_class_routines`
  ADD CONSTRAINT `lms_class_routines_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lms_class_routine_days`
--
ALTER TABLE `lms_class_routine_days`
  ADD CONSTRAINT `lms_class_routine_days_day_id_foreign` FOREIGN KEY (`day_id`) REFERENCES `lms_days` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lms_class_routine_days_routine_id_foreign` FOREIGN KEY (`routine_id`) REFERENCES `lms_class_routines` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lms_days`
--
ALTER TABLE `lms_days`
  ADD CONSTRAINT `lms_days_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lms_rooms`
--
ALTER TABLE `lms_rooms`
  ADD CONSTRAINT `lms_rooms_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lms_zoom_meetings`
--
ALTER TABLE `lms_zoom_meetings`
  ADD CONSTRAINT `lms_zoom_meetings_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lms_zoom_meetings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lms_zoom_meetings_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mark_configs`
--
ALTER TABLE `mark_configs`
  ADD CONSTRAINT `mark_configs_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mark_configs_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mark_configs_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mark_configs_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `student_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mark_configs_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mark_configs_mark_config_exam_code_id_foreign` FOREIGN KEY (`mark_config_exam_code_id`) REFERENCES `mark_config_exam_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mark_configs_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mark_config_exam_codes`
--
ALTER TABLE `mark_config_exam_codes`
  ADD CONSTRAINT `mark_config_exam_codes_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mark_config_exam_codes_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mark_config_exam_codes_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meals`
--
ALTER TABLE `meals`
  ADD CONSTRAINT `meals_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meals_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meal_entries`
--
ALTER TABLE `meal_entries`
  ADD CONSTRAINT `meal_entries_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meal_entries_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meal_entries_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meal_entries_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meal_plans`
--
ALTER TABLE `meal_plans`
  ADD CONSTRAINT `meal_plans_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meal_plans_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meal_plans_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meal_plans_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `merit_process_types`
--
ALTER TABLE `merit_process_types`
  ADD CONSTRAINT `merit_process_types_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `merit_process_types_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mobile_app_sections`
--
ALTER TABLE `mobile_app_sections`
  ADD CONSTRAINT `mobile_app_sections_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mobile_app_sections_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notices_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `onboardings`
--
ALTER TABLE `onboardings`
  ADD CONSTRAINT `onboardings_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `otp_verifications`
--
ALTER TABLE `otp_verifications`
  ADD CONSTRAINT `otp_verifications_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `our_histories`
--
ALTER TABLE `our_histories`
  ADD CONSTRAINT `our_histories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `our_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `our_histories_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parent_models`
--
ALTER TABLE `parent_models`
  ADD CONSTRAINT `parent_models_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parent_models_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parent_models_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parent_models_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD CONSTRAINT `payment_histories_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_histories_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_histories_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_methods_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD CONSTRAINT `payment_requests_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_requests_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payslip_invoices`
--
ALTER TABLE `payslip_invoices`
  ADD CONSTRAINT `payslip_invoices_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payslip_invoices_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payslip_salaries`
--
ALTER TABLE `payslip_salaries`
  ADD CONSTRAINT `payslip_salaries_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payslip_salaries_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payslip_salary_heads`
--
ALTER TABLE `payslip_salary_heads`
  ADD CONSTRAINT `payslip_salary_heads_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payslip_salary_heads_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `periods`
--
ALTER TABLE `periods`
  ADD CONSTRAINT `periods_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `periods_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phone_books`
--
ALTER TABLE `phone_books`
  ADD CONSTRAINT `phone_books_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_books_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phone_book_categories`
--
ALTER TABLE `phone_book_categories`
  ADD CONSTRAINT `phone_book_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_book_categories_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `picklists`
--
ALTER TABLE `picklists`
  ADD CONSTRAINT `picklists_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `picklists_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `policies`
--
ALTER TABLE `policies`
  ADD CONSTRAINT `policies_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `policies_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `policies_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prayers`
--
ALTER TABLE `prayers`
  ADD CONSTRAINT `prayers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prayers_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `questions_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `questions_question_bank_chapter_id_foreign` FOREIGN KEY (`question_bank_chapter_id`) REFERENCES `question_bank_chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_question_bank_class_id_foreign` FOREIGN KEY (`question_bank_class_id`) REFERENCES `question_bank_classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_question_bank_difficulty_level_id_foreign` FOREIGN KEY (`question_bank_difficulty_level_id`) REFERENCES `question_bank_difficulty_levels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_question_bank_group_id_foreign` FOREIGN KEY (`question_bank_group_id`) REFERENCES `question_bank_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_question_bank_subject_id_foreign` FOREIGN KEY (`question_bank_subject_id`) REFERENCES `question_bank_subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_question_category_id_foreign` FOREIGN KEY (`question_category_id`) REFERENCES `question_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_bank_chapters`
--
ALTER TABLE `question_bank_chapters`
  ADD CONSTRAINT `question_bank_chapters_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `question_bank_subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_bank_groups`
--
ALTER TABLE `question_bank_groups`
  ADD CONSTRAINT `question_bank_groups_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `question_bank_classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_bank_subjects`
--
ALTER TABLE `question_bank_subjects`
  ADD CONSTRAINT `question_bank_subjects_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `question_bank_classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_bank_subjects_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `question_bank_groups` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `question_bank_subjects_question_category_id_foreign` FOREIGN KEY (`question_category_id`) REFERENCES `question_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_bank_sub_sources`
--
ALTER TABLE `question_bank_sub_sources`
  ADD CONSTRAINT `question_bank_sub_sources_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `question_bank_sources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_bank_topics`
--
ALTER TABLE `question_bank_topics`
  ADD CONSTRAINT `question_bank_topics_question_bank_chapter_id_foreign` FOREIGN KEY (`question_bank_chapter_id`) REFERENCES `question_bank_chapters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_categories`
--
ALTER TABLE `question_categories`
  ADD CONSTRAINT `question_categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `question_categories_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_level`
--
ALTER TABLE `question_level`
  ADD CONSTRAINT `question_level_question_bank_level_id_foreign` FOREIGN KEY (`question_bank_level_id`) REFERENCES `question_bank_levels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_level_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_session`
--
ALTER TABLE `question_session`
  ADD CONSTRAINT `question_session_question_bank_session_id_foreign` FOREIGN KEY (`question_bank_session_id`) REFERENCES `question_bank_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_session_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_source`
--
ALTER TABLE `question_source`
  ADD CONSTRAINT `question_source_question_bank_source_id_foreign` FOREIGN KEY (`question_bank_source_id`) REFERENCES `question_bank_sources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_source_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_sub_source`
--
ALTER TABLE `question_sub_source`
  ADD CONSTRAINT `question_sub_source_question_bank_sub_source_id_foreign` FOREIGN KEY (`question_bank_sub_source_id`) REFERENCES `question_bank_sub_sources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_sub_source_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_tag`
--
ALTER TABLE `question_tag`
  ADD CONSTRAINT `question_tag_question_bank_tag_id_foreign` FOREIGN KEY (`question_bank_tag_id`) REFERENCES `question_bank_tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_tag_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_test`
--
ALTER TABLE `question_test`
  ADD CONSTRAINT `question_test_question_bank_test_id_foreign` FOREIGN KEY (`question_bank_test_id`) REFERENCES `question_bank_tests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_test_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_topic`
--
ALTER TABLE `question_topic`
  ADD CONSTRAINT `question_topic_question_bank_topic_id_foreign` FOREIGN KEY (`question_bank_topic_id`) REFERENCES `question_bank_topics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_topic_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_type`
--
ALTER TABLE `question_type`
  ADD CONSTRAINT `question_type_question_bank_type_id_foreign` FOREIGN KEY (`question_bank_type_id`) REFERENCES `question_bank_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_type_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quizzes_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD CONSTRAINT `quiz_attempts_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_attempts_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_attempts_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD CONSTRAINT `quiz_results_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_results_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_results_quiz_attempt_id_foreign` FOREIGN KEY (`quiz_attempt_id`) REFERENCES `quiz_attempts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_results_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_topics`
--
ALTER TABLE `quiz_topics`
  ADD CONSTRAINT `quiz_topics_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_topics_question_bank_chapter_id_foreign` FOREIGN KEY (`question_bank_chapter_id`) REFERENCES `question_bank_chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_topics_question_bank_subject_id_foreign` FOREIGN KEY (`question_bank_subject_id`) REFERENCES `question_bank_subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_topics_question_category_id_foreign` FOREIGN KEY (`question_category_id`) REFERENCES `question_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_topics_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ready_to_join_us`
--
ALTER TABLE `ready_to_join_us`
  ADD CONSTRAINT `ready_to_join_us_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ready_to_join_us_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `remark_configs`
--
ALTER TABLE `remark_configs`
  ADD CONSTRAINT `remark_configs_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `remark_configs_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `resources_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resources_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `result_cards`
--
ALTER TABLE `result_cards`
  ADD CONSTRAINT `result_cards_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `result_cards_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `result_cards_signature_id_foreign` FOREIGN KEY (`signature_id`) REFERENCES `signatures` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `result_cards_teacher_signature_id_foreign` FOREIGN KEY (`teacher_signature_id`) REFERENCES `signatures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rooms_hostel_category_id_foreign` FOREIGN KEY (`hostel_category_id`) REFERENCES `hostel_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rooms_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_members`
--
ALTER TABLE `room_members`
  ADD CONSTRAINT `room_members_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_members_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_members_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_members_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_heads`
--
ALTER TABLE `salary_heads`
  ADD CONSTRAINT `salary_heads_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `salary_heads_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_head_user_payrolls`
--
ALTER TABLE `salary_head_user_payrolls`
  ADD CONSTRAINT `salary_head_user_payrolls_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `salary_head_user_payrolls_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `sections_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_student_group_id_foreign` FOREIGN KEY (`student_group_id`) REFERENCES `student_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `settings_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shifts_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `short_codes`
--
ALTER TABLE `short_codes`
  ADD CONSTRAINT `short_codes_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `short_codes_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `signatures`
--
ALTER TABLE `signatures`
  ADD CONSTRAINT `signatures_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `signatures_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_balances`
--
ALTER TABLE `sms_balances`
  ADD CONSTRAINT `sms_balances_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_balances_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_logs`
--
ALTER TABLE `sms_logs`
  ADD CONSTRAINT `sms_logs_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_logs_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_logs_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_logs_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sms_logs_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sms_logs_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sms_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sms_purchases`
--
ALTER TABLE `sms_purchases`
  ADD CONSTRAINT `sms_purchases_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_purchases_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD CONSTRAINT `sms_templates_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_templates_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staffs_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `staffs_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staffs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `staff_attendances`
--
ALTER TABLE `staff_attendances`
  ADD CONSTRAINT `staff_attendances_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_attendances_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_attendances`
--
ALTER TABLE `student_attendances`
  ADD CONSTRAINT `student_attendances_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendances_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendances_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendances_period_id_foreign` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendances_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendances_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_categories`
--
ALTER TABLE `student_categories`
  ADD CONSTRAINT `student_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_categories_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_collections`
--
ALTER TABLE `student_collections`
  ADD CONSTRAINT `student_collections_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_collections_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_collection_details`
--
ALTER TABLE `student_collection_details`
  ADD CONSTRAINT `student_collection_details_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_collection_details_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_collection_details_sub_heads`
--
ALTER TABLE `student_collection_details_sub_heads`
  ADD CONSTRAINT `student_collection_details_sub_heads_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_collection_details_sub_heads_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_devices`
--
ALTER TABLE `student_devices`
  ADD CONSTRAINT `student_devices_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_groups`
--
ALTER TABLE `student_groups`
  ADD CONSTRAINT `student_groups_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_groups_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_migrations`
--
ALTER TABLE `student_migrations`
  ADD CONSTRAINT `student_migrations_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_migrations_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_sessions`
--
ALTER TABLE `student_sessions`
  ADD CONSTRAINT `student_sessions_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_sessions_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `student_sessions_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_sessions_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `student_sessions_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `academic_years` (`id`),
  ADD CONSTRAINT `student_sessions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_waiver_configs`
--
ALTER TABLE `student_waiver_configs`
  ADD CONSTRAINT `student_waiver_configs_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_waiver_configs_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subjects_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `subjects_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_configs`
--
ALTER TABLE `subject_configs`
  ADD CONSTRAINT `subject_configs_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_configs_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_configs_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `student_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_configs_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_configs_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD CONSTRAINT `subscription_items_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscription_upgrade_requests`
--
ALTER TABLE `subscription_upgrade_requests`
  ADD CONSTRAINT `subscription_upgrade_requests_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscription_upgrade_requests_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `syllabus`
--
ALTER TABLE `syllabus`
  ADD CONSTRAINT `syllabus_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `syllabus_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `s_a_a_s_faqs`
--
ALTER TABLE `s_a_a_s_faqs`
  ADD CONSTRAINT `s_a_a_s_faqs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teachers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `teachers_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teachers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `teacher_signatures`
--
ALTER TABLE `teacher_signatures`
  ADD CONSTRAINT `teacher_signatures_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_signatures_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_signatures_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `testimonials_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `testimonials_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_members`
--
ALTER TABLE `transport_members`
  ADD CONSTRAINT `transport_members_assigned_route_id_foreign` FOREIGN KEY (`assigned_route_id`) REFERENCES `bus_routes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transport_members_assigned_stop_id_foreign` FOREIGN KEY (`assigned_stop_id`) REFERENCES `bus_stops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transport_members_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transport_members_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transport_members_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD CONSTRAINT `user_logs_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_logs_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_notices`
--
ALTER TABLE `user_notices`
  ADD CONSTRAINT `user_notices_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_notices_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_payrolls`
--
ALTER TABLE `user_payrolls`
  ADD CONSTRAINT `user_payrolls_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_payrolls_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `waivers`
--
ALTER TABLE `waivers`
  ADD CONSTRAINT `waivers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `waivers_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  ADD CONSTRAINT `why_choose_us_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `why_choose_us_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  ADD CONSTRAINT `zoom_meetings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `zoom_meetings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `zoom_meetings_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
