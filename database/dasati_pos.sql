-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2024 at 06:41 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dasati_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(200) NOT NULL,
  `expense_store_id` varchar(200) NOT NULL,
  `expense_name` longtext NOT NULL,
  `expense_date` varchar(200) NOT NULL,
  `expense_amount` varchar(200) NOT NULL,
  `expense_details` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hold_sales`
--

CREATE TABLE `hold_sales` (
  `hold_sale_id` int(11) NOT NULL,
  `hold_sale_number` varchar(200) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `quantity` varchar(200) DEFAULT NULL,
  `product_sale_price` varchar(200) DEFAULT NULL,
  `product_description` longtext DEFAULT NULL,
  `product_id` varchar(200) DEFAULT NULL,
  `product_quantity_limit` varchar(200) DEFAULT NULL,
  `Discount` varchar(200) DEFAULT NULL,
  `hold_sale_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `inventory_product_id` varchar(200) NOT NULL,
  `inventory_qty_added` varchar(200) DEFAULT NULL,
  `inventory_date_added` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_points`
--

CREATE TABLE `loyalty_points` (
  `loyalty_points_id` int(11) NOT NULL,
  `loyalty_points_code` varchar(200) DEFAULT NULL,
  `loyalty_points_customer_name` varchar(200) DEFAULT NULL,
  `loyalty_points_customer_phone_no` varchar(200) DEFAULT NULL,
  `loyalty_points_count` varchar(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mailer_settings`
--

CREATE TABLE `mailer_settings` (
  `id` int(11) NOT NULL,
  `mailer_host` varchar(200) DEFAULT NULL,
  `mailer_port` varchar(200) DEFAULT NULL,
  `mailer_protocol` varchar(200) DEFAULT NULL,
  `mailer_username` varchar(200) DEFAULT NULL,
  `mailer_mail_from_name` varchar(200) DEFAULT NULL,
  `mailer_mail_from_email` varchar(200) DEFAULT NULL,
  `mailer_password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mailer_settings`
--

INSERT INTO `mailer_settings` (`id`, `mailer_host`, `mailer_port`, `mailer_protocol`, `mailer_username`, `mailer_mail_from_name`, `mailer_mail_from_email`, `mailer_password`) VALUES
(2, 'null@mail.com', '465', 'ssl', 'null', 'Null', 'null@mail.com', '20Devlan@');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `merchantRequestID` varchar(254) DEFAULT NULL,
  `checkoutRequestID` varchar(254) DEFAULT NULL,
  `resultCode` varchar(254) DEFAULT NULL,
  `resultDesc` varchar(254) DEFAULT NULL,
  `amount` varchar(11) DEFAULT NULL,
  `mpesaReceiptNumber` varchar(254) DEFAULT NULL,
  `transactionDate` varchar(254) DEFAULT NULL,
  `phoneNumber` varchar(254) DEFAULT NULL,
  `payment_receipt_number` varchar(200) DEFAULT NULL,
  `payment_amount` varchar(200) DEFAULT NULL,
  `payment_txn_code` varchar(200) DEFAULT NULL,
  `payment_date_posted` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `payment_settings_id` int(11) NOT NULL,
  `payment_settings_store_id` varchar(200) NOT NULL,
  `payment_settings_means` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`payment_settings_id`, `payment_settings_store_id`, `payment_settings_means`) VALUES
(1, '6cf2d9a5407fa4e91b41ae4adc5dbd9d6ef2d8d88b58', 'Cash'),
(2, '68acbdd5a039350f5d8c3f3b67479190dfad17bdfda6', 'Cash'),
(3, 'fbc9cc3b63b9664f4a87cf573ddd579f26bc278ab2b2', 'Cash'),
(4, '2d2fb3a4537dfe192dfd999667fa6de7ccd120efd1fa1fa7', 'Cash'),
(5, 'd5bd11feb840bdb01998338e3da4af494a7049208495a6e3', 'Cash'),
(6, '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` varchar(200) NOT NULL,
  `product_store_id` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_description` longtext DEFAULT NULL,
  `product_purchase_price` varchar(200) NOT NULL,
  `product_sale_price` varchar(200) NOT NULL,
  `product_quantity` varchar(200) NOT NULL,
  `product_quantity_limit` varchar(200) NOT NULL,
  `product_code` varchar(200) NOT NULL,
  `product_status` varchar(200) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_customization`
--

CREATE TABLE `receipt_customization` (
  `receipt_id` int(11) NOT NULL,
  `receipt_store_id` varchar(200) NOT NULL,
  `receipt_header_content` longtext DEFAULT NULL,
  `receipt_footer_content` longtext DEFAULT NULL,
  `receipt_show_barcode` varchar(200) DEFAULT NULL,
  `show_customer` varchar(200) DEFAULT NULL,
  `allow_discounts` varchar(200) DEFAULT NULL,
  `allow_loyalty_points` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receipt_customization`
--

INSERT INTO `receipt_customization` (`receipt_id`, `receipt_store_id`, `receipt_header_content`, `receipt_footer_content`, `receipt_show_barcode`, `show_customer`, `allow_discounts`, `allow_loyalty_points`) VALUES
(1, '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DASATI MEDICAL CLINIC <br>\n0728 749 240<br>\nDamond Bld, Eastleigh  <br>\nAlong MKS - WOTE RD\n', 'Goods Once Sold Cannot Be Returned', 'false', 'false', 'true', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `sale_product_id` varchar(200) NOT NULL,
  `sale_user_id` varchar(200) NOT NULL,
  `sale_quantity` varchar(200) DEFAULT NULL,
  `sale_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_customer_name` varchar(200) DEFAULT NULL,
  `sale_customer_phoneno` varchar(200) DEFAULT NULL,
  `sale_receipt_no` varchar(200) DEFAULT NULL,
  `sale_cart_number` varchar(200) DEFAULT NULL,
  `sale_payment_method` varchar(200) DEFAULT NULL,
  `sale_payment_amount` varchar(2000) DEFAULT NULL,
  `sale_payment_status` varchar(200) NOT NULL DEFAULT 'notpaid',
  `sale_discount` varchar(200) DEFAULT '0',
  `sale_credit_expected_date` varchar(200) DEFAULT NULL,
  `sale_transaction_ref` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `store_settings`
--

CREATE TABLE `store_settings` (
  `store_id` varchar(200) NOT NULL,
  `store_name` varchar(200) NOT NULL,
  `store_adr` longtext NOT NULL,
  `store_email` varchar(200) NOT NULL,
  `store_status` varchar(200) NOT NULL DEFAULT 'active',
  `store_close_date` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_settings`
--

INSERT INTO `store_settings` (`store_id`, `store_name`, `store_adr`, `store_email`, `store_status`, `store_close_date`) VALUES
('68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DASATI MEDICAL CLINIC', 'Diamond Bld, Eastleigh Along MKS - WOTE RD', 'Null@maill.com', 'active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `log_id` int(11) NOT NULL,
  `log_user_id` varchar(200) NOT NULL,
  `log_ip_address` varchar(200) NOT NULL,
  `log_details` longtext NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `log_type` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `system_id` int(11) NOT NULL,
  `system_name` varchar(200) DEFAULT NULL,
  `system_tagline` longtext DEFAULT NULL,
  `system_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`system_id`, `system_name`, `system_tagline`, `system_status`) VALUES
(1, 'DASATI MEDICAL CLINIC POS', 'Point of Sale', 'Activated');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_phoneno` varchar(200) NOT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `user_password_reset_token` varchar(200) DEFAULT NULL,
  `user_access_level` varchar(200) NOT NULL,
  `user_store_id` varchar(200) NOT NULL,
  `user_status` varchar(200) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_phoneno`, `user_password`, `user_password_reset_token`, `user_access_level`, `user_store_id`, `user_status`) VALUES
('STF-9418', 'Admin', 'admin@devlan.co.ke', '071234567', 'a69681bcf334ae130217fea4505fd3c994f5683f', NULL, 'Admin', '6cf2d9a5407fa4e91b41ae4adc5dbd9d6ef2d8d88b58', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `permission_id` int(11) NOT NULL,
  `permission_access_level` varchar(200) NOT NULL,
  `permission_module` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`permission_id`, `permission_access_level`, `permission_module`) VALUES
(32, 'Staff', 'Sales Management');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `ExpenseStoreID` (`expense_store_id`);

--
-- Indexes for table `hold_sales`
--
ALTER TABLE `hold_sales`
  ADD PRIMARY KEY (`hold_sale_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `ProductInventoryID` (`inventory_product_id`);

--
-- Indexes for table `loyalty_points`
--
ALTER TABLE `loyalty_points`
  ADD PRIMARY KEY (`loyalty_points_id`);

--
-- Indexes for table `mailer_settings`
--
ALTER TABLE `mailer_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`payment_settings_id`),
  ADD KEY `PaymentSettingsStore` (`payment_settings_store_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_name` (`product_name`,`product_code`),
  ADD KEY `product_store_id` (`product_store_id`,`product_name`,`product_code`);

--
-- Indexes for table `receipt_customization`
--
ALTER TABLE `receipt_customization`
  ADD PRIMARY KEY (`receipt_id`),
  ADD KEY `ReceiptStore` (`receipt_store_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `SaleProductID` (`sale_product_id`),
  ADD KEY `SaleUserID` (`sale_user_id`),
  ADD KEY `sale_receipt_no` (`sale_receipt_no`),
  ADD KEY `sale_product_id` (`sale_product_id`);

--
-- Indexes for table `store_settings`
--
ALTER TABLE `store_settings`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`system_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `UserStoreID` (`user_store_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `UserPermission` (`permission_access_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hold_sales`
--
ALTER TABLE `hold_sales`
  MODIFY `hold_sale_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `loyalty_points`
--
ALTER TABLE `loyalty_points`
  MODIFY `loyalty_points_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mailer_settings`
--
ALTER TABLE `mailer_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `payment_settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `receipt_customization`
--
ALTER TABLE `receipt_customization`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=999;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `system_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `ExpenseStoreID` FOREIGN KEY (`expense_store_id`) REFERENCES `store_settings` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
