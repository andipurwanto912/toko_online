-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 15, 2020 at 09:26 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('PUBLISH','DRAFT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `slug`, `description`, `author`, `publisher`, `cover`, `price`, `views`, `stock`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Maze Runner', 'maze-runner', 'Novel Best Series', 'James Dashner', 'Andi', 'book-covers/3MnNSWj1oFBYu6SqTEhoq46K0s8ZxvoAlclxfGWo.jpeg', 10.00, 0, 20, 'PUBLISH', 19, NULL, NULL, '2020-05-14 08:21:50', '2020-05-14 08:21:50', NULL),
(2, 'Harry Potter', 'harry-potter', 'Harry Potter', 'JK Rowling', 'Andi', 'book-covers/sMKHw8KJ9NkC0VgX4C4TuTmi1tW4pgqwLlyi2rNO.jpeg', 1122.00, 0, 10, 'DRAFT', 19, NULL, NULL, '2020-05-14 08:25:49', '2020-05-14 08:25:49', NULL),
(3, 'AH', 'ah', 's', 'dsd', 'ds', 'book-covers/Zlo0a6GNtqQNK6VAuHiNVgCho9RclQiOLHW4qQae.jpeg', 2.00, 0, 33, 'DRAFT', 2, NULL, NULL, '2020-05-14 08:55:06', '2020-05-14 08:55:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`id`, `book_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_order`
--

CREATE TABLE `book_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'berisi nama file image saja tanpa path',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Fiksi', 'fiksi', 'category_images/cnSZemMBFpJAukODKoxBPDb5daDl8O0tiC1RQ8XR.png', 2, 2, NULL, NULL, '2020-05-13 08:21:00', '2020-05-13 09:14:04'),
(2, 'Novel', 'novel', 'category_images/RNgFzjljniz7YKy70c5EIvH1ifkBPJ6wp5tzezQT.png', 2, 2, NULL, NULL, '2020-05-13 08:21:37', '2020-05-13 08:45:59'),
(3, 'Comic', 'comic', 'category_images/tldAuh0uvcH7Ps8L5wFNcUL1fahyKxb50041Pay4.webp', 2, NULL, NULL, NULL, '2020-05-13 08:21:54', '2020-05-13 09:14:08'),
(4, 'Sejarah', 'sejarah', 'category_images/U270ppZ8xEKGaodDlt6rmFIyFA857bzX3NZHi6nZ.jpeg', 2, NULL, NULL, NULL, '2020-05-13 08:22:04', '2020-05-13 08:22:04'),
(5, 'Ensiklopedia', 'ensiklopedia', 'category_images/yH7ceOcLlLLYwHmmQEPVym5LvxKhDU6Tzzx7l18q.png', 2, NULL, NULL, NULL, '2020-05-13 08:22:42', '2020-05-13 08:22:42'),
(6, 'Makanan', 'makanan', 'category_images/t1JLxviuNV4C36YP60xLHcdt5I2zxmt11D87NUm0.png', 19, NULL, NULL, NULL, '2020-05-14 08:30:51', '2020-05-14 08:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2020_05_12_173833_penyesuaian_table_users', 1),
(9, '2020_05_13_150426_create_table_categories', 2),
(10, '2020_05_14_203027_create_books_table', 3),
(11, '2020_05_14_203211_create_book_category_table', 4),
(12, '2020_05_14_143133_create_books_table', 5),
(13, '2020_05_14_143414_create_book_category_table', 6),
(14, '2020_05_15_053808_create_orders_table', 7),
(15, '2020_05_15_055255_create_book_order_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` double(8,2) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('SUBMIT','PROCESS','FINISH','CANCEL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `roles`, `address`, `phone`, `avatar`, `status`) VALUES
(2, 'Andi Purwanto', 'andip@mail.com', NULL, '$2y$10$wE40/QNssMtfz3bMurH89OoeBLMEhLwG/T1VXIK72g.Z3hvlZ7Icu', 'mXqgyuRTKwJ8URIAUPJoJwnjoelp2w5uwnEPlZRplAuQeRcPiPIAPP7qf7SY', '2020-05-13 06:53:59', '2020-05-13 09:33:27', 'andip', '[\"ADMIN\"]', 'Brebes', '083364872799', NULL, 'ACTIVE'),
(3, 'Amanda Manopo', 'amanda@mail.com', NULL, '$2y$10$IpNH.xbdjIYPWerCcZweAOIwLoAfE9jyVF4DEqZc625jxNXDyj6.O', NULL, '2020-05-13 06:57:11', '2020-05-13 06:57:11', 'amanda', '[\"STAFF\"]', 'Brebes', '0877676665', 'avatars/RrNEh0XAy5hRT2VIkpQWzqJqmhLU6ZO5mdhb7Jas.png', 'ACTIVE'),
(4, 'Heni Nurohmi', 'heni@mail.com', NULL, '$2y$10$Ox2omTKcSAcnOPZWimUwMuYmEivJorCJ43Fq6MgCYTlGQhjpZrjmW', NULL, '2020-05-13 06:57:43', '2020-05-13 07:56:41', 'heni', '[\"STAFF\",\"CUSTOMER\"]', 'Brebes', '08787888888', NULL, 'INACTIVE'),
(5, 'Dwiky V', 'dwiky@mail.com', NULL, '$2y$10$qLdmjxMOo04bjVXhUYitOezHwihtX4jz89wsaOGMtQ60kl6FhLBWq', NULL, '2020-05-13 06:58:27', '2020-05-13 06:58:27', 'dwiky', '[\"ADMIN\",\"STAFF\",\"CUSTOMER\"]', 'Brebes', '089876556656', 'avatars/mcAjJa7cLCD082c6Dr46xdXWbcLybaWYndwgPfbN.jpeg', 'ACTIVE'),
(6, 'Anya Geraldine', 'anya@mail.com', NULL, '$2y$10$8ydi7fFQHewbcnH4L/krRe3A298MyslYwjR1J.GlzHaEnJlyJn/8i', NULL, '2020-05-13 06:59:56', '2020-05-13 06:59:56', 'anya', '[\"STAFF\"]', 'Jakarta', '087876868788', NULL, 'ACTIVE'),
(7, 'Yusli B', 'yusli@mail.com', NULL, '$2y$10$j9ouokpeyihMHCHsTi8KwO9uVUlGAI/wAQMlBDdTFMBe7JbVh0Buq', NULL, '2020-05-13 07:00:41', '2020-05-13 07:00:41', 'yusli', '[\"CUSTOMER\"]', 'Tegal', '081287287989', NULL, 'ACTIVE'),
(8, 'Wandoyo Hadi', 'wandoyo@mail.com', NULL, '$2y$10$L9DuGiT3O13n0EIMhn.zL.JB5FZDL2xaJkqqYPR8z/RidGsjO2qWq', NULL, '2020-05-13 07:01:31', '2020-05-13 07:01:31', 'wandoyo', '[\"ADMIN\"]', 'Brebes', '088888888', NULL, 'ACTIVE'),
(9, 'Slamet Effendi', 'slamet@mail.com', NULL, '$2y$10$BBR.zHd5RVfLooIx9oOR0OkG8xfafw0Bt80xK6sM66Brbyr7lWf4W', NULL, '2020-05-13 07:02:05', '2020-05-13 07:02:05', 'slamet', '[\"CUSTOMER\"]', 'Brebes', '0888989899', NULL, 'ACTIVE'),
(10, 'Anna Rosi Anna', 'anna@mail.com', NULL, '$2y$10$j3F1Iv2FfpYZvAnfjNisaupdNfvMpPmuBNmw/EL0hoAZRcmweLPRq', NULL, '2020-05-13 07:02:38', '2020-05-13 07:02:38', 'anna', '[\"STAFF\"]', 'Brebes', '08989898989', NULL, 'ACTIVE'),
(11, 'Nur Khikmahtul Nazilah', 'hikmah@mail.com', NULL, '$2y$10$.GUlzSK9XJKpN8A.4TQso..J93dEa8c8t9FfquXSyZsZSyPPdYFpG', NULL, '2020-05-13 07:03:29', '2020-05-13 07:03:29', 'hikmah', '[\"ADMIN\"]', 'Brebes', '08787878777', NULL, 'ACTIVE'),
(12, 'Galan Dewa', 'galan@mail.com', NULL, '$2y$10$AvxbQH1pGL8I856W/C/e1OYcX6gUr8LiGnF.3LqtQId4rPMhH6qVO', NULL, '2020-05-13 07:04:18', '2020-05-13 07:04:18', 'galan', '[\"ADMIN\",\"CUSTOMER\"]', 'Brebes', '08656566677', NULL, 'ACTIVE'),
(13, 'Hartami Septiana', 'septi@mail.com', NULL, '$2y$10$GH.Udx7yhWDdqpirSwODEuLSSS.kUUcQUMHJABkJ09IH6J5NxnVHu', NULL, '2020-05-13 07:05:10', '2020-05-13 07:05:10', 'septi', '[\"ADMIN\",\"CUSTOMER\"]', 'Brebes', '088778878', NULL, 'ACTIVE'),
(14, 'Julian Riptiana', 'lian@mail.com', NULL, '$2y$10$ljUYZ6hxnnJE6krevFDryuxvYY5mxvKjIOqsnERYN7vDMUoQ8ZV12', NULL, '2020-05-13 07:06:06', '2020-05-13 07:06:06', 'lian', '[\"ADMIN\",\"CUSTOMER\"]', 'Brebes', '08778788878', NULL, 'ACTIVE'),
(15, 'Ida Fauziah', 'ida@mail.com', NULL, '$2y$10$IgLoZW8UN8JCW9VziJfum.j9VFxBeNQ8i2x2I3Q/CgmlJP7sYF4ua', NULL, '2020-05-13 07:06:51', '2020-05-13 07:06:51', 'ida', '[\"ADMIN\",\"CUSTOMER\"]', 'Brebes', '08989898989', NULL, 'ACTIVE'),
(16, 'Azura Aulia Azahra', 'azura@mail.com', NULL, '$2y$10$p0eUSjHEHU8w5LIhfqB4QOLzf5gUX712..ycdgxZ.c0QoXuVGr5AO', NULL, '2020-05-13 07:07:40', '2020-05-13 07:07:40', 'azura', '[\"ADMIN\"]', 'Brebes', '0877787888', NULL, 'ACTIVE'),
(19, 'Site Administrator', 'admin@mail.com', NULL, '$2y$10$jmlYuer9y0NjNq/lI88oDOEd0Qzl8pa0Rxs5XsxCF8TpqHic7/4o6', NULL, '2020-05-14 07:55:19', '2020-05-14 07:55:19', 'administrator', '[\"ADMIN\"]', 'Lembarawa, Brebes, Jawa Tengah', '0888888888', 'kosong.png', 'ACTIVE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_book_id_foreign` (`book_id`),
  ADD KEY `book_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `book_order`
--
ALTER TABLE `book_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_order_order_id_foreign` (`order_id`),
  ADD KEY `book_order_book_id_foreign` (`book_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `book_order`
--
ALTER TABLE `book_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `book_order`
--
ALTER TABLE `book_order`
  ADD CONSTRAINT `book_order_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
