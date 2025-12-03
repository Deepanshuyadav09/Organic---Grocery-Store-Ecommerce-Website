-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2025 at 02:28 PM
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
-- Database: `food_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_category`
--

CREATE TABLE `adminapp_category` (
  `categoryid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminapp_category`
--

INSERT INTO `adminapp_category` (`categoryid`, `name`) VALUES
(1, 'Fruits & Vegetable'),
(2, 'Dairy & Eggs'),
(3, 'Coctails & Drinks'),
(4, 'Bread & Sweets'),
(5, 'Pasta & Rice'),
(6, 'Cake & Pastry'),
(7, 'Snacks & Chips'),
(8, 'Oats & Peanet_Butter'),
(9, 'Tea & Coffee');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_my_order`
--

CREATE TABLE `adminapp_my_order` (
  `id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pincode` int(11) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminapp_my_order`
--

INSERT INTO `adminapp_my_order` (`id`, `address`, `phone`, `city`, `pincode`, `date`) VALUES
(9, '11/2 Laxmi Bai Marg gavli mohalla dewas', '6262915596', 'dewas', 455001, '2025-11-24 23:34:45.529406');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_subcategory`
--

CREATE TABLE `adminapp_subcategory` (
  `subcategoryid` int(11) NOT NULL,
  `subcategoryname` varchar(200) NOT NULL,
  `rating` smallint(5) UNSIGNED NOT NULL CHECK (`rating` >= 0),
  `del_price` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `discount` int(10) UNSIGNED NOT NULL CHECK (`discount` >= 0),
  `image` varchar(60) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminapp_subcategory`
--

INSERT INTO `adminapp_subcategory` (`subcategoryid`, `subcategoryname`, `rating`, `del_price`, `price`, `discount`, `image`, `category_id`) VALUES
(1, 'Whole Grain Oatsmeal', 5, 870.12, 810.00, 10, 'Oats IMG.jpg', 8),
(2, 'Sharp Cheddar Cheese Block', 5, 1242.14, 1064.00, 10, 'product-thumb-3.png', 2),
(3, 'Organic Red Label Tea', 5, 629.00, 599.00, 10, 'Chai_1.jpg', 9),
(4, 'Organic Fresh Tomato', 5, 80.00, 60.00, 10, 'product-thumb-29.png', 1),
(5, 'Fresh Pumpkin', 5, 100.00, 70.00, 10, 'pumpkin.jpg', 1),
(6, 'Organic 2% Reduced Fat Milk ', 5, 60.00, 45.00, 10, 'Milk_1.webp', 2),
(7, 'Special Coctail Fruit', 5, 135.00, 120.00, 10, 'category-thumb-3.jpg', 3),
(8, 'Spicie Tadka Pasta', 5, 150.00, 100.00, 10, 'pastalogo.jpeg', 5),
(9, 'Lazy Krunchi Chips', 5, 30.00, 20.00, 10, 'Snaks.webp', 7),
(10, 'Special Funnel Cakes', 5, 150.00, 120.00, 10, 'category-thumb-2.jpg', 4),
(11, 'Brownie Pastry', 5, 120.00, 80.00, 10, 'Pastry_1.jpg', 6),
(12, 'Lays Chips', 5, 50.00, 40.00, 10, 'Chips_1.jpg', 7),
(13, 'Fresh Drinks Bottle', 5, 50.00, 30.00, 10, 'category-thumb-4.jpg', 3),
(14, 'Fresh Pineapples', 5, 199.00, 160.00, 10, 'Fruits-1.png', 1),
(15, 'Brown Coffee Packet', 5, 250.00, 199.00, 10, 'Coffee_3.png', 9),
(16, 'Basmati Rice', 5, 180.00, 150.00, 10, 'Rice.jpg', 5),
(17, 'Fresh Milk Bottle', 5, 80.00, 60.00, 10, 'Fresh_milk.png', 2),
(18, 'Special Sweets', 5, 199.00, 180.00, 10, 'Sweet_2.jpg', 4),
(19, 'Label Tea', 5, 260.00, 210.00, 10, 'label-1.png', 9),
(20, 'Brownie Bread', 5, 80.00, 50.00, 10, 'Bread_1.jpg', 4),
(21, 'Cake', 5, 350.00, 250.00, 10, 'cakelogo.jpg', 6),
(22, 'My Fitness Peanet Butter', 5, 599.00, 550.00, 10, 'peanet_2.jpg', 8),
(23, 'Pasta', 5, 100.00, 60.00, 10, 'pasta.jpg', 5),
(24, 'Orange Coctail', 5, 150.00, 130.00, 10, 'Coctails 3.jpg', 3),
(25, 'Eggs Carrot', 5, 199.00, 170.00, 10, 'Eggs.avif', 2),
(26, 'Turfles Chocolates', 5, 450.00, 300.00, 10, 'product-thumb-22.png', 4);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add register', 7, 'add_register'),
(26, 'Can change register', 7, 'change_register'),
(27, 'Can delete register', 7, 'delete_register'),
(28, 'Can view register', 7, 'view_register'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add subcategory', 9, 'add_subcategory'),
(34, 'Can change subcategory', 9, 'change_subcategory'),
(35, 'Can delete subcategory', 9, 'delete_subcategory'),
(36, 'Can view subcategory', 9, 'view_subcategory'),
(37, 'Can add order', 10, 'add_order'),
(38, 'Can change order', 10, 'change_order'),
(39, 'Can delete order', 10, 'delete_order'),
(40, 'Can view order', 10, 'view_order'),
(41, 'Can add my_ order', 11, 'add_my_order'),
(42, 'Can change my_ order', 11, 'change_my_order'),
(43, 'Can delete my_ order', 11, 'delete_my_order'),
(44, 'Can view my_ order', 11, 'view_my_order');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'adminapp', 'category'),
(11, 'adminapp', 'my_order'),
(10, 'adminapp', 'order'),
(9, 'adminapp', 'subcategory'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'Grocery', 'register'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Grocery', '0001_initial', '2025-11-24 08:38:06.303891'),
(2, 'contenttypes', '0001_initial', '2025-11-24 08:38:06.344901'),
(3, 'auth', '0001_initial', '2025-11-24 08:38:06.452078'),
(4, 'admin', '0001_initial', '2025-11-24 08:38:06.833379'),
(5, 'admin', '0002_logentry_remove_auto_add', '2025-11-24 08:38:06.931062'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2025-11-24 08:38:06.940056'),
(7, 'adminapp', '0001_initial', '2025-11-24 08:38:06.995147'),
(8, 'contenttypes', '0002_remove_content_type_name', '2025-11-24 08:38:07.224823'),
(9, 'auth', '0002_alter_permission_name_max_length', '2025-11-24 08:38:07.279334'),
(10, 'auth', '0003_alter_user_email_max_length', '2025-11-24 08:38:07.299457'),
(11, 'auth', '0004_alter_user_username_opts', '2025-11-24 08:38:07.308031'),
(12, 'auth', '0005_alter_user_last_login_null', '2025-11-24 08:38:07.361076'),
(13, 'auth', '0006_require_contenttypes_0002', '2025-11-24 08:38:07.365274'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2025-11-24 08:38:07.375599'),
(15, 'auth', '0008_alter_user_username_max_length', '2025-11-24 08:38:07.390688'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2025-11-24 08:38:07.405414'),
(17, 'auth', '0010_alter_group_name_max_length', '2025-11-24 08:38:07.420513'),
(18, 'auth', '0011_update_proxy_permissions', '2025-11-24 08:38:07.430724'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2025-11-24 08:38:07.446485'),
(20, 'sessions', '0001_initial', '2025-11-24 08:38:07.465484'),
(21, 'adminapp', '0002_auto_20251124_1836', '2025-11-24 13:06:42.112827');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9wjuge6f862wjfv2skeab6r5rvluzjxz', 'eyJjYXJ0Ijp7fX0:1vQ3sM:1X3RJw8QfjiKnCrJN_wjv2fjhzwki8te4ZWlb6MIGAw', '2025-12-15 13:23:34.633633'),
('e94msfmn5gbxkic6ei94zzin17npdnom', '.eJyrVkpOLCpRsqpWMlayMtRRMlKyMtJRMgWzzYFkrY6Sa25iZo6SlVJiSm5mnkM6iKeXnJ-rpKMUlJ-TCpNQqgUA8VUVSg:1vNwSy:lUZt-lKoM3xDmCKcC7FyN1OXSQpj2VGSHItJ7cQMsT0', '2025-12-09 17:04:36.040375'),
('h6cnp8kzrnj1kexiobipan3s3zuj05c6', 'eyJjYXJ0Ijp7fX0:1vQ3wA:DBT7bsiYICE240ISm-w6i-h483u_7xl7-0bOtm4-Xjo', '2025-12-15 13:27:30.627343'),
('kqplvtgfdls3sx39tjev19s1lnozm5ui', 'eyJFbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsIlJvbGUiOiJhZG1pbiJ9:1vJmsq:3jwH7GdAshY3mm8kPf_ORtb0qqeUOzpFxhpMdPQ1w90', '2025-11-28 06:02:08.231122'),
('m9avqihgsvoyzvel2hxiemiwbl6gje19', 'eyJjYXJ0Ijp7IjE1IjoxLCI0IjoxLCIyNSI6Mn0sIkVtYWlsIjoiSml0ZXNoQGdtYWlsLmNvbSIsIlJvbGUiOiJ1c2VyIn0:1vOspz:3hSj6DvA3XyWjUFO66MlEys8271IpjCh8FondzjbGWs', '2025-12-12 07:24:15.630989'),
('omwgfq1fpgx9qdeo6789eg3vp7tdl74t', 'eyJFbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsIlJvbGUiOiJhZG1pbiJ9:1vIj4T:pQzyDpRMO-ffsndONVBWa-LQBfTqq5dgY7RKZKyEN5c', '2025-11-25 07:45:45.602497'),
('q20b69hktxv4qy5l01luq251uebc7pe6', 'eyJjYXJ0Ijp7IjIiOjEsIjUiOjEsIjEyIjoyfX0:1vNS7E:6doRblgMeou3cf2Yej6aR84Ke76pkgI4xdZdFVkm18M', '2025-12-08 08:40:08.914459'),
('s3qnymwho6agz1b27jqqxbt0fp6wwku4', 'eyJjYXJ0Ijp7IjMiOjEsIjYiOjF9fQ:1vOtYF:P186HbB3DMmfAyAnulS8foR66UI46-tFelNGekgptdA', '2025-12-12 08:09:59.395095'),
('ylf362yxsvdskoqamq2s6t6oyj3hrll2', 'eyJjYXJ0Ijp7IjE2IjoxLCIxNyI6MSwiMjQiOjJ9fQ:1vNXPV:B3aPpgUjglIS6OiS6tU_s42egLfEss_ezQdy30onETY', '2025-12-08 14:19:21.348968');

-- --------------------------------------------------------

--
-- Table structure for table `grocery_register`
--

CREATE TABLE `grocery_register` (
  `id` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` int(11) NOT NULL,
  `Confirm` int(11) NOT NULL,
  `Role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grocery_register`
--

INSERT INTO `grocery_register` (`id`, `Username`, `Email`, `Password`, `Confirm`, `Role`) VALUES
(1, 'Rajnish Kumar', 'imrajnish232gmail.com', 456789, 456789, 'user'),
(2, 'Shruti Rathore', 'shruti45@gmail.com', 852085, 852085, 'user'),
(3, 'Admin', 'admin@gmail.com', 123456, 123456, 'admin'),
(4, 'Yash upase', 'yash890@gmail.com', 789456, 789456, 'user'),
(6, 'Jitesh Sharma', 'Jitesh@gmail.com', 858585, 858585, 'user'),
(7, 'Jay Shah', 'Jay@gmail.com', 787878, 787878, 'user'),
(8, 'Karan Prajapati', 'Karan@gmail.com', 454545, 454545, 'user'),
(12, 'Abhishek ', 'dipanshuyadav3009@gmail.com', 784512, 784512, 'user'),
(13, 'Rajesh Yadav', 'dipanshuyadav@gmail.com', 784512, 784512, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminapp_category`
--
ALTER TABLE `adminapp_category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `adminapp_my_order`
--
ALTER TABLE `adminapp_my_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminapp_subcategory`
--
ALTER TABLE `adminapp_subcategory`
  ADD PRIMARY KEY (`subcategoryid`),
  ADD KEY `adminapp_subcategory_category_id_2f06100d_fk_adminapp_` (`category_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `grocery_register`
--
ALTER TABLE `grocery_register`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminapp_category`
--
ALTER TABLE `adminapp_category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `adminapp_my_order`
--
ALTER TABLE `adminapp_my_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `adminapp_subcategory`
--
ALTER TABLE `adminapp_subcategory`
  MODIFY `subcategoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `grocery_register`
--
ALTER TABLE `grocery_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminapp_subcategory`
--
ALTER TABLE `adminapp_subcategory`
  ADD CONSTRAINT `adminapp_subcategory_category_id_2f06100d_fk_adminapp_` FOREIGN KEY (`category_id`) REFERENCES `adminapp_category` (`categoryid`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
