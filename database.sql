-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2025 at 06:39 PM
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
-- Database: `marketplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `number` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  `status` enum('active','blocked') NOT NULL DEFAULT 'active',
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `number`, `email`, `username`, `password`, `role`, `status`, `registration_date`) VALUES
(1, 'admin', '+998997799333', 'admin@gmail.com', 'admin', '52be5ff91284c65bac56f280df55f797a5c505f7ef66317ff358e34791507027', 'admin', 'active', '2024-05-14 09:17:25'),
(2, 'seller', '+998997733999', 'seller@gmail.com', 'seller', '52be5ff91284c65bac56f280df55f797a5c505f7ef66317ff358e34791507027', 'seller', 'active', '2024-05-14 09:17:25'),
(3, 'user', '+998993399777', 'user@gmail.com', 'user', '52be5ff91284c65bac56f280df55f797a5c505f7ef66317ff358e34791507027', 'user', 'active', '2024-05-14 09:17:25'),
(4, 'userAKA', '+998993399177', 'userAKA@gmail.com', 'userAKA', '52be5ff91284c65bac56f280df55f797a5c505f7ef66317ff358e34791507027', 'user', 'active', '2024-05-14 09:17:25'),
(5, 'Jake Bakker', '+27828700140', 'jakebakker04@gmail.com', 'jake_bakker', '74bc52496d06a0e6d1640a75fd8ca1ebcb13152ace7f9eeb432e18ab76bb4474', 'seller', 'blocked', '2025-10-16 18:11:01'),
(6, 'Jake Bakker', '1234567890', '123@gmail.com', 'user123', '43df751ae1ccdbc8db73e1353b14be2e4f2c8c8911a3d51e3ab7ed2dfb71eef6', 'user', 'active', '2025-11-10 12:46:10'),
(7, 'Jane Doe', '123456789', '12345@gmail.com', 'janedoe', '750ebb7dd5b19a40f0e5dce215cf80349d824aa8d070cffa92aba355d831b693', 'user', 'active', '2025-11-10 13:42:51'),
(8, 'Jane Doe', '0987654321', 'jane.doe@gmail.com', 'janedoe1', '750ebb7dd5b19a40f0e5dce215cf80349d824aa8d070cffa92aba355d831b693', 'user', 'active', '2025-11-10 13:57:40'),
(9, 'newuser', '1111111111', 'newuser@gmal.com', 'newuser', '7c246403ff9e9d2ba859788eaea951e52d09a5b2c1f026e9d8adb4ac695f0f0a', 'user', 'active', '2025-11-11 10:10:19');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`log_id`, `user_id`, `action`, `ip_address`, `created_at`) VALUES
(1, 1, 'Logged in', '192.168.1.10', '2025-11-07 11:22:36'),
(2, 1, 'Added a product to cart', '192.168.1.10', '2025-11-07 11:22:36'),
(3, 2, 'Placed an order', '192.168.1.15', '2025-11-07 11:22:36'),
(4, 3, 'Updated account settings', '192.168.1.12', '2025-11-07 11:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `number_of_products` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `number_of_products`) VALUES
(19, 3, 45, 1),
(20, 3, 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`) VALUES
(1, 'Stationary'),
(2, 'Books'),
(3, 'Electronics'),
(4, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message_text` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('sent','delivered','read') DEFAULT 'sent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `sender_id`, `receiver_id`, `message_text`, `sent_at`, `status`) VALUES
(1, 1, 2, 'Hi, is this item still available?', '2025-11-07 11:22:36', 'delivered'),
(2, 2, 1, 'Yes! It’s still in stock.', '2025-11-07 11:22:36', 'read'),
(3, 3, 1, 'Can you offer a discount?', '2025-11-07 11:22:36', 'sent');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `title`, `message`, `is_read`, `created_at`) VALUES
(1, 1, 'Order Update', 'Your order #1001 has been shipped!', 0, '2025-11-07 11:22:36'),
(2, 2, 'New Message', 'You have a new message from Seller123.', 0, '2025-11-07 11:22:36'),
(3, 3, 'Promotion', 'Get 20% off electronics this weekend!', 1, '2025-11-07 11:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `total_amount`, `status`) VALUES
(1, 1, '2025-11-07 13:08:57', 250.00, 'Pending'),
(2, 2, '2025-11-07 13:08:57', 120.50, 'Completed'),
(3, 3, '2025-11-07 13:08:57', 89.99, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(13, 1, 44, 1, 250.00),
(14, 2, 45, 2, 60.25),
(15, 3, 46, 1, 89.99);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT 'Pending',
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `payment_status`, `amount`, `payment_date`) VALUES
(1, 1, 'Credit Card', 'Pending', 250.00, '2025-11-07 13:13:56'),
(2, 2, 'PayPal', 'Completed', 120.50, '2025-11-07 13:13:56'),
(3, 3, 'EFT', 'Refunded', 89.99, '2025-11-07 13:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `price_old` int(11) DEFAULT NULL,
  `price_current` int(11) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `added_to_site` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `seller_id`, `price_old`, `price_current`, `description`, `rating`, `quantity`, `added_to_site`) VALUES
(44, 'Textbooks', 2, 2, 400, 300, 'Used textbooks, all still in good condition', 5.0, 4, '2025-10-16 19:59:02'),
(45, 'Math instruments', 1, 2, 150, 100, 'Brand new mathematics instruments set, contains all pieces', 5.0, 1, '2025-10-16 20:02:17'),
(46, 'Acer Nitro 5', 3, 2, 4000, 3500, 'Used Acer Nitro 5 laptop, good condition only used for 5 months\r\n8GB RAM\r\nCore i5 Processor\r\n500GB SSD + 1TB HDD\r\nGeforce GTX 1660', 5.0, 1, '2025-10-16 20:07:22'),
(47, 'Laptop Bag', 4, 2, 300, 250, 'HP Laptop bag, good condition zip just needs replacing', 5.0, 1, '2025-10-16 20:10:58'),
(48, 'Parker pen set', 1, 2, 400, 300, 'Double set of Parker pens, perfect condition, Ink refilled recently', 5.0, 1, '2025-10-17 11:45:52'),
(49, 'Pencil bag', 1, 2, 200, 100, 'Stylish Trefoil pencil bag, perfect condition, perfect for stationary organization', 5.0, 1, '2025-10-17 11:49:42'),
(50, 'Marker set', 1, 2, 500, 400, 'Set of 133 copic markers, almost brand new. Just a couple that are almost dry', 5.0, 1, '2025-10-17 12:00:09'),
(51, 'Lenovo Tablet', 3, 2, 2000, 1500, 'Lenovo Tablet\r\nModel Number-TB-X505X\r\n32GB Storage\r\nSlightly used', 5.0, 1, '2025-10-17 12:01:42'),
(52, 'Huawei Tablet', 3, 2, 3000, 2500, 'Huawei Tablet\r\n128GB storage space\r\nBrand new', 5.0, 1, '2025-10-17 12:03:21'),
(53, 'Dell G# 3590 Laptop', 3, 2, 7500, 6500, 'Some wear and tear but still great working condition\r\ni5-9300H\r\n20GB RAM\r\nNvidia GTX1650\r\n500GB SSD', 5.0, 1, '2025-10-17 12:05:05'),
(54, 'Various Textbooks', 2, 2, 200, 150, 'Various university textbooks, all great condition', 5.0, 5, '2025-10-17 12:09:17'),
(55, 'Psychology Textbook', 2, 2, 200, 150, 'Psychology Textbook \r\nSome wear and tear but still good condition', 5.0, 1, '2025-10-17 12:10:51'),
(56, 'Dictionaries', 2, 2, 100, 80, 'School dictionaries\r\nCondition used - like new', 5.0, 2, '2025-10-17 12:12:39'),
(57, 'Laptop bag', 4, 2, 300, 150, 'Laptop or file bag, good condition', 5.0, 1, '2025-10-17 12:14:54'),
(58, 'NMU Shirt and Jacket', 4, 2, 400, 300, 'NMU T-shirt and Jacket\r\nGood condition only worn a few times', 5.0, 1, '2025-10-17 12:18:52'),
(59, 'Kapten &amp; son backpack', 4, 2, 1800, 1000, 'Stylish Kapten &amp; Son designer backpack\r\nFor laptop or books\r\nPerfect condition', 5.0, 1, '2025-10-17 12:20:58'),
(64, 'Old book', 2, 2, 300, 200, 'Old textbooks i no longer user', 5.0, 2, '2025-11-11 10:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
(203, 44, '0ffcc049951cb7d5084f73865df20c1e.jpg'),
(204, 45, 'ebe3574acb723b6bbe1118ea5324deb5.jpg'),
(205, 46, 'da96183a917e6c3f3e634f964faff986.png'),
(206, 47, '56c97d968e7debb9187259473443d10a.png'),
(207, 48, 'f241b9f62e4bfdd2f78b3d7c7070379a.jpg'),
(208, 49, 'a7373060ebedc7e957604d6eddc202af.jpg'),
(209, 50, '7b43a8ccad1117934e0741ce1b4d2052.jpg'),
(210, 51, '9db02e2ae4648be0c8dadd3d1826e3db.jpg'),
(211, 52, '10b2a3b359ae20da5d7ae93ddf41ce78.jpg'),
(212, 53, '100d605126e4d646915cdb9ca8280f98.jpg'),
(213, 53, '2f23fcd1a2527a5d7b0de3fd6a45d085.jpg'),
(214, 54, 'beab1fb01b24dbc4d97b2a8be3d2a176.jpg'),
(215, 55, 'e91cbba43f897126e328cb92e061aacf.jpg'),
(216, 56, '80e9d57f1a300b68049129749d72d380.jpg'),
(217, 57, 'c57df6e21300b70e75b6008640a4eb1e.jpg'),
(218, 58, '1ea45d9aa80ab5f437ee6a0a1a714872.png'),
(219, 59, 'a721e538daf67f8f0d0c7287b6b4f20f.jpg'),
(224, 64, 'bdd7f781039a0aa7adfbc7c7af8cc502.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `review_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `product_id`, `user_id`, `rating`, `comment`, `review_date`) VALUES
(4, 44, 1, 5, 'Great product, highly recommend!', '2025-11-07 13:19:23'),
(5, 45, 2, 3, 'It was okay, quality could be better.', '2025-11-07 13:19:23'),
(6, 46, 3, 4, 'Fast shipping and works well!', '2025-11-07 13:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `shop_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT 0.00,
  `join_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `account_id`, `shop_name`, `description`, `rating`, `join_date`) VALUES
(1, 1, 'TechZone', 'Electronics and gadgets shop.', 4.70, '2025-11-07 11:22:36'),
(2, 2, 'Home Essentials', 'Everyday items for your home.', 4.30, '2025-11-07 11:22:36'),
(3, 3, 'StyleHub', 'Fashion and accessories.', 4.80, '2025-11-07 11:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('open','in_progress','resolved','closed') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`ticket_id`, `user_id`, `subject`, `message`, `status`, `created_at`) VALUES
(1, 1, 'Payment issue', 'My payment didn’t go through.', 'open', '2025-11-07 11:22:36'),
(2, 2, 'Order delay', 'My package has not arrived yet.', 'in_progress', '2025-11-07 11:22:36'),
(3, 3, 'Product return', 'I want to return an item I ordered.', 'resolved', '2025-11-07 11:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `wishes`
--

CREATE TABLE `wishes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wishes`
--
ALTER TABLE `wishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishes`
--
ALTER TABLE `wishes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `wishes`
--
ALTER TABLE `wishes`
  ADD CONSTRAINT `wishes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishes_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
