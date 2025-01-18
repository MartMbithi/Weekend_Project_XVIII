-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2025 at 12:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `expense_store_id` varchar(200) NOT NULL,
  `expense_name` longtext NOT NULL,
  `expense_date` varchar(200) NOT NULL,
  `expense_amount` varchar(200) NOT NULL,
  `expense_details` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `inventory_product_id` varchar(200) NOT NULL,
  `inventory_qty_added` varchar(200) DEFAULT NULL,
  `inventory_date_added` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loyalty_points`
--

INSERT INTO `loyalty_points` (`loyalty_points_id`, `loyalty_points_code`, `loyalty_points_customer_name`, `loyalty_points_customer_phone_no`, `loyalty_points_count`) VALUES
(1, 'H4530', 'James Doe', '011456892', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mailer_settings`
--

INSERT INTO `mailer_settings` (`id`, `mailer_host`, `mailer_port`, `mailer_protocol`, `mailer_username`, `mailer_mail_from_name`, `mailer_mail_from_email`, `mailer_password`) VALUES
(2, 'dasatimedicalclinic.co.ke', '465', 'ssl', 'noreply@dasatimedicalclinic.co.ke', 'Dasati Medical Clinic', ' noreply@dasatimedicalclinic.co.ke', '20Devlan@');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `payment_settings_id` int(11) NOT NULL,
  `payment_settings_store_id` varchar(200) NOT NULL,
  `payment_settings_means` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `pres_id` int(200) NOT NULL,
  `pres_patient_name` varchar(200) NOT NULL,
  `pres_patient_email` varchar(200) NOT NULL,
  `pres_patient_phoneno` varchar(200) NOT NULL,
  `pres_doctor_id` varchar(200) NOT NULL,
  `pres_details` longtext NOT NULL,
  `pres_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`pres_id`, `pres_patient_name`, `pres_patient_email`, `pres_patient_phoneno`, `pres_doctor_id`, `pres_details`, `pres_date`) VALUES
(1, 'James Doe', 'jamesdoe90@gmail.com', '011456892', 'STF-9418', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2025-01-18 10:15:00.860697'),
(2, 'James Doe', 'jamesdoe90@gmail.com', '011456892', 'STF-9125', 'Amoxicillin 500mg,  Paracetamol 500mg, Cetirizine 10mg', '2025-01-18 10:52:15.563987');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_store_id`, `product_name`, `product_description`, `product_purchase_price`, `product_sale_price`, `product_quantity`, `product_quantity_limit`, `product_code`, `product_status`) VALUES
('002fc76fe1455a1b6129415db7cbed4d3be04b7a', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'LOBAK', 'LOBAK', '0', '20', '202', '1', 'ITM-030', 'active'),
('00ddd68265ddf313eacdc4d9c6e56a6efaa21bbc', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ABZ TABS', 'ABZ TABS', '28', '50', '202', '2', 'ITM-008', 'active'),
('018503e04f7899b5e00ebd45f36692ec8fb846bfda56d5bc', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CYPRO B TABLET', 'CYPRO B', '12', '20', '202', '2', 'P9541', 'active'),
('02304df5fd1a66136e6b65d072648a810c08277a0de600e0', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMOXICLAV 625 MGS (DIOCLAV) ', 'AM,', '0', '30', '202', '1', 'A0562', 'active'),
('0414c99b9a2868c607cc1c9ece70984fc778a971', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ACYCLOVIR TABS', 'ACYCLOVIRTABS', '0', '20', '202', '1', 'ITM-033', 'active'),
('04212427e0ae2bdfd7ed50247f1ad86b20f7886a4d568642', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PALAXIN TABLETS', 'ALAXIN', '0', '300', '202', '1', 'R6315', 'active'),
('042991b0a4141320bb1b2a8a583900a6d8422a83c67b3372', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMLODIPINE (VARINIL) TABS 5MG', 'AMLODIPINE (VARINIL) TABS 5MG', '0', '10', '202', '1', 'X5416', 'active'),
('043d5459173fad00ae977b336b4ae5eeb77112d8e4ec05b6', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'OG KIT ', 'OG', '0', '850', '202', '1', 'Z3685', 'active'),
('049b64be6caec0856072ebe0b7293876e0c6c4f9edc37ca8', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'GRISEOFLUVIN TABLETS 250MG', 'GR', '0', '10', '202', '1', 'O8065', 'active'),
('04b90c3cc35506bfe50c25342c8eac78001deba6', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BETASOL (BETAMETHASON CREAM)', 'BETASOL (BETAMETHASON CREAM)', '0', '80', '202', '1', 'ITM-062', 'active'),
('05f810ef572cf1e0a5f1819c71e8a6613abef169a4344ad5', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMOXICLAV 625MG [FINEMOX]', 'AM', '115', '30', '202', '1', 'G6358', 'active'),
('06f46c933ce0ab17a7dcf22c2e9e0b3f186804b476227195', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MONTELUKAST PLUS', 'MONTELUST PLUS', '30.2', '60', '202', '2', 'Z4365', 'active'),
('076ea6f2185da8d9f76b6640ff9e9959d79549c3', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CAUSTICK PENSIL', 'CAUSTICK PENSIL', '0', '250', '202', '1', 'ITM-101', 'active'),
('07947a789084f80b60cdc7df0130e7e94090b3c2', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CANDID - B', 'CANOLO - B', '0', '300', '202', '1', 'ITM-075', 'active'),
('07c4fd00837b049c2e66a1a1b77417469bb3d706', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MICONAZOLE NITRATE', 'MICONAZOLE NITRATE', '0', '150', '202', '1', 'ITM-058', 'active'),
('0807b7eed2674f599451cbe62dac6a2bbfa1b0a5b304b97d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CLINDAMYCIN CAPSULES', 'CL', '0', '30', '202', '1', 'L9672', 'active'),
('0a6ef5022635553812f68f445fb0af92f4815547f8da9663', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'HEPATITIS B/C TESTING KITS ', 'FG', '0', '300', '202', '1', 'Z5106', 'active'),
('0ad9d3cd2e67e03316a70e4a282b72d764db661dea035232', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'IBUCAP CAPSULES', 'PAIN', '0', '20', '202', '1', 'G1576', 'active'),
('0af2fc762583e3f52c4705d191a886d624d4ae627da69654', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'NEUROPOWER FORTE', 'NR', '0', '10', '202', '1', 'U6729', 'active'),
('0e424ea78a3141eda79a33f4b3f470b0e8b6c436', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BIO OIL', 'BIO OIL', '0', '1350', '202', '1', 'ITM-067', 'active'),
('0e8c0bddeeef39d4cb0c1ef229dbb4f57693b77064903cf3', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PARACETAMOL INJECTION 1 GRAM', 'PCM', '0', '500', '202', '1', 'Q5892', 'active'),
('0f1e313e4cd568cacdd37d2a8c032fafad89c2d4c96775ea', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CLARITHROMYCIN TABLETS', 'CL', '0', '50', '202', '1', 'X8016', 'active'),
('10088dfbcba912242699f99a46a21d0b5bb05f981d27c356', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DAWAHIST', 'DAWAHIST ', '40', '80', '202', '1', 'K0759', 'active'),
('102a605cc955d04246250736227e4157cdabd66fa44ce774', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SICLOFEN TABS', 'SICLOFEN TABS', '0', '20', '202', '1', 'A0793', 'active'),
('10601fb3bd5fc478015ed1ad625e09a6d32b71f192dabcd4', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'NORMAL SALINE', 'NS', '0', '500', '202', '1', 'V7291', 'active'),
('12a91949c4141d5a7a8c6f033aea9fff532ea890', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'KISS STUDDED CONDOMS', 'KISS STUDDED CONDOMS', '0', '100', '202', '1', 'ITM-051', 'active'),
('137ab2f34f4629b355108ef8b08d1baf6e1044133d638a92', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ALUGEL', '', '0', '150', '202', '1', 'Q8790', 'active'),
('13aae08c217022f3e80e91b1117219cb694bc72b3e7f8417', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BISACODYL TABS ', 'BISACODYL', '0', '10', '202', '1', 'U6589', 'active'),
('16467e22e8e4695cf7b0191479e6eaf0d75aacb9', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ASPIRIN (PARATAL JUNIOR)', 'ASPIRIN (PARATAL JUNIOR)', '0', '10', '202', '1', 'ITM-095', 'active'),
('168413f47094d398e0a24ea5fd2332c126aa410824582c92', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'NYLON SUTURE 2/0 REVERSE CUT', 'WOUNDS', '0', '1500', '202', '1', 'G8752', 'active'),
('182d7b849bdeae8da36f3b500035847517a502a0', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLUGONE CAPSULES', 'FLUGONE CAPSULES', '0', '20', '202', '1', 'ITM-045', 'active'),
('1bfc5bcee192bcc13b81e471f518c8b03483b6d0', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLUCLOXACILLIN SYRUP 60MLS', 'FLUCLOXACILLIN SYRUP 60MLS', '0', '280', '202', '1', 'ITM-046', 'active'),
('1ca560fc05d7b37756f4035d8a100a1e89f4aa83', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MUPIROCIN (MUPIBAN)', 'MUPIROCIN (MUPIBAN)', '0', ' 450', '202', '1', 'ITM-061', 'active'),
('1e8d761256148816b4d4b242dc20ef56588f5d6cca823f2b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DICLOFENAC TABLETS 50MG', 'DICLOFENAC TABLETS 50MG', '0', '5', '202', '1', 'C4691', 'active'),
('1f6f4723f6d8dda9f0edee6c26e587e579ce1d0d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SILDENAFIL CITRATE TABLETS', 'SILDENAFIL CITRATE TABLETS', '0', '50', '192', '1', 'ITM-056', 'active'),
('2089f3142b42f1271da6209dafbc9c7a46a4240a', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MENTHYLATED SPIRIT', 'MENTHYLATED SPIRIT', '0', '80', '202', '1', 'ITM-054', 'active'),
('2321b2e7c921c52395ca8e8ad039271e999c66fc6c9acb0e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SEPTRIN (COTRIMAZOLE) TABLETS 480MG', 'SEPT', '0', '10', '202', '1', 'P3516', 'active'),
('2338f9f5f67734763cac8e0fe93ec43abf11a453e81234b8', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ALBENDAZOLE SUSPENSION ', 'ALBENDAZOLE SUSPENSION ', '40', '60', '202', '2', 'P7203', 'active'),
('24b8a722fec2a5760b1bd7b852f25e957e837551', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'HYDRACOTISINE CREAM', 'HYDRACOTISINE CREAM', '0', '100', '202', '1', 'ITM-059', 'active'),
('24c8bf97e6d9e79f3ce043b464eaea2b6662cec85f5dba36', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ACTIVATED CHARCOAL', 'AC', '2', '5', '202', '1', 'H7843', 'active'),
('2568f2163629af4eff0cc6854236962a50eb52c4d265a505', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MODICATE INJECTION AMPOULES', 'MZ', '0', '500', '202', '1', 'E1845', 'active'),
('25c0c78bdcb55c231de50acc37fe3e47e664f05574f3c9ff', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMLODIPINE (VARINIL) TABS 10MG', 'AMLODIPINE (VARINIL) TABS 10MG', '0', '0', '202', '1', 'K3812', 'inactive'),
('25c5a10494cd58324b801b205c9204dbe3943666da490ad9', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MULTIDEX', 'MULTIDEX', '0', '100', '202', '1', 'G1854', 'active'),
('26a104eac5d828e38ae7665ab06482b9e9a3bcc28c1cf5ef', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BUSCOPAN PLUS TABLETS', 'HY', '0', '50', '202', '1', 'U3140', 'active'),
('26d4e053b0b10abfdea76a86912ff6bb694393084a9c8873', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'IBUPROFEN ORAL SUSPENSION BP 60Ml', 'IBUPROFEN ORAL SUSPENSION BP 60Ml', '19', '50', '202', '1', 'Q3215', 'active'),
('2718c74d870062bcbd47c92c9cf563395ab2ca277c8ae26b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'IBUGESIC', 'IBUGESIC', '0', '200', '202', '1', 'K1054', 'active'),
('274f8c2e1421f3479379ad1e1be928e8cbbea124', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'EPIDERM', 'EPIDERM', '0', '100', '202', '1', 'ITM-063', 'active'),
('277de1d493d7d456f9001e5a04bc959cd908c00c', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BECLOMINE CREAM', 'BECLOMINE CREAM', '0', '250', '202', '1', 'ITM-073', 'active'),
('2836897329367376973424a3cadf214718753aa216c0e6a1', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ZENTEL TABLET', 'ZENTEL', '200', '250', '202', '2', 'Q0324', 'active'),
('298322eecd1459ada1287a0e8bb4d86201621312', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PROMETHAZINE I00MLS', 'PROMETHAZINE I00MLS', '0', '150', '202', '1', 'ITM-003', 'active'),
('2a1e5f0c89f3de1d82dc4e02efb641089481d3affae76760', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DEXAMETHASONE TABD 0.5MG ', 'DEXAMETHASONE', '0', '20', '202', '1', 'W6150', 'active'),
('2a79b30862e9182708a2f54736417dda61f160c87f835ff8', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CIPROFLOXACIN TABLETS ', 'CP', '0', '10', '202', '1', 'S9352', 'active'),
('2ae5f20909107aea626da42ba43f444ed2c8b160', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ORAL REHYDRATION SALTS', 'ORAL REHYDRATION SALTS', '0', '20', '202', '1', 'ITM-085', 'active'),
('2afe888a86f058b84934941b128f2b2114f5adedc90c7499', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ASHTONE LARGE', 'ASHTONE LARGE', '25', '50', '202', '1', 'J4972', 'active'),
('2b9c60c6046d6d2b85d2595e656292028fc98cbf', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FEMIPLAN', 'FEMIPLAN', '83', '100', '202', '2', 'ITM-034', 'active'),
('2bce9741dd0fa52c907cd3d358c4d11b3011caa7c47aefec', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ACYCLOVIR CREAM', 'VR', '0', '250', '202', '1', 'S9357', 'active'),
('2e34178092d52d2489913c0a40cf14e53b6f31f148ef6750', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MORPHINE INJECTION AMPOULES ', 'PAIN', '0', '100', '202', '1', 'G6820', 'active'),
('2e5e770a6cbdcec0df7038ccb01a3cda40c6893c5eef76d0', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'VITAGAB TABLETS', 'VT', '0', '20', '202', '1', 'T3805', 'active'),
('2fe54716452a2291030628e39e504762eb40a6539a974d24', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DICONAZOLE (FLUCONAZOLE) TABLETS 200MG', 'UTI', '0', '50', '202', '1', 'W6927', 'active'),
('3138f1a76eb8ee123b2a43b87e25e20e57a2abfac8cdc691', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SEPTRIN  (COTRIMAZOLE) TABLETS 960MG', 'SE', '0', '10', '202', '1', 'H7140', 'active'),
('31e3e7ad5144148d4e488e840eb2b47910f4aa066ee214ad', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'EUVITAN TABLETS', 'EU', 'O', '5', '202', '1', 'D8349', 'active'),
('328bfc27a445ed664a888bf9a98aaa48365113235cf75c10', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DEXTROSE SOLUTION IN NORMAL SALINE (DNS)', 'DNS', '0', '500', '202', '1', 'E2146', 'active'),
('32b57be5debef17be422cc15b08fed338240d8aa', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CLOZOLE B', 'CLOZOLE B', '0', '100', '202', '1', 'ITM-064', 'active'),
('3438591370d3f0394ff24c79e1679fd0c63ad522', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ENO FRUIT SALT', 'ENO FRUIT SALT', '0', '20', '202', '1', 'ITM-097', 'active'),
('34704804b58d15860fdef043fb6b2105116a1e9b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DOMPERIDONE TABS', 'DOMPERIDONE TABS', '0', '10', '202', '1', 'ITM-037', 'active'),
('35284bc54ff7284c5afa806e5988178d9498fa58', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMOXYL SYRUP (ALIMOX)', 'AMOXYL SYRUP (ALIMOX)', '53', '100', '202', '1', 'ITM-016', 'active'),
('356dbb7d7ba28734dff1a2dc6b93c34400b8f9aac35d6eec', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MINERAL WATER', 'MINERAL WATER', '30', '50', '202', '1', 'L2810', 'active'),
('382eb1746e9bd467622926cd433d0867ad50dcde2baedd68', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMOXYL CAPSULES 250MG', 'PAEDS', '0', '10', '202', '1', 'W9157', 'active'),
('3af6bc6d9c87b41d86adfacaf75f33c256040c04', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'COLD CAP', 'COLD CAP', '0', '15', '202', '1', 'ITM-021', 'active'),
('3b49499ceb0b2031c2364af85db0e8485588c8b7', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SANITARY PADS', 'SANITARY PADS', '0', '80', '202', '1', 'ITM-069', 'active'),
('3cf0a5b6264b6ad4ae32ec5b9067cc45af6b9125', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MENTHOL PLUS (KALUMA)', 'MENTHOL PLUS (KALUMA)', '0', '20', '202', '1', 'ITM-038', 'active'),
('3e219eac82ea8b41d1d9a301538e217f29fe8e8b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'WOUND ADHESIVE BANDAGE', 'WOUND ADHESIVE BANDAGE', '0', '10', '202', '1', 'ITM-087', 'active'),
('3e8baf3e1f986136c411f53f3e80e15fa5dc859611d08048', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLAGYL (METRONIDAZOLE) INJECTION 500MG', 'AM', '0', '500', '202', '1', 'M5382', 'active'),
('3f41b011bf867b4b62fa3a516be848e246a8a80236053d52', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MYOSPAZ TABS', '', '0', '30', '202', '1', 'E2546', 'active'),
('4094fde88d705141d69e2d9d2997ea0ab514d8cbcebaf8fd', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AZITHROMYCIN TABLETS 500MG', 'AZ', '48', '150', '202', '2', 'Q1704', 'active'),
('40b9f52352c94c574e5f95a4edee8934787d9e13', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'APC TABLETS', 'APC TABLETS', '0', '10', '202', '1', 'ITM-084', 'active'),
('4113dc0f47ba3f636d31f48d6273a9479ac6812f032a30ff', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PHENOBARBITOL TABS', 'P', '0', '5', '202', '1', 'V5471', 'active'),
('457aaa5c6bb726de8a1b845950271b61ae55f4aa9feb168e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'URINALYSIS TESTING STRIPS ', 'UTI', '0', '150', '202', '1', 'B9501', 'active'),
('4868e76f1dd2f7498127ed757ad798a4d15c2993cb7a96d0', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'GYNAECOSID TABS', 'F', '0', '500', '202', '1', 'C5831', 'active'),
('4a2f3572c4f31971cbe08b0e0aa91f43969b9913', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'NASILIN (NASAL DROP)', 'NASILIN (NASAL DROP)', '0', '50', '202', '1', 'ITM-106', 'active'),
('4aedb5536b3bec3376131b077ee6d8da5263310d5b25c1fe', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SALBUTAMOL SYRUP', 'SALBUTAMOL SYRUP', '0', '100', '202', '1', 'Q9780', 'active'),
('4b9eccf69ab6979a605ea2aa92e4ca69b6b2f566', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRETINOINE CRÈME', 'TRETINOINE CRÈME', '0', '300', '202', '1', 'ITM-077', 'active'),
('4d9d2018e8e72598ba0713f9586f06c9435a77ff5681a052', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'STERONE ( NORETHISTERONE) ', 'STERONE ( NORETHISTERONE) ', '22', '25', '202', '1', 'I8429', 'active'),
('4dc783429873d58cc18e00b57d90d6d1a580f817a4f50e72', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MEDICREPE LARGE', 'MEDICREPE LARGE', '0', '100', '202', '1', 'B6028', 'active'),
('50ebb952fd5915b16e5bf1c870b86818d408d332', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DICLOFENAC TABLETS 100MG', 'DICLOFENAC TABLETS 100MG', '0.7', '5', '202', '2', 'ITM-023', 'active'),
('510551e0ac10815e5541595910903f8676dae448', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DUCOLAX', 'DUCOLAX', '0', '20', '202', '1', 'ITM-012', 'active'),
('513f10dd3db93f6f22bd09d1f4573c432a4c3076', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'STREPSILS', 'STREPSILS', '0', '40', '202', '1', 'ITM-093', 'active'),
('514c520ee8ae2e7ffb2e719be6397e2dd474bc14', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'VARINIL 10MG', 'VARINIL 10MG', '0', '15', '202', '1', 'ITM-013', 'active'),
('53a8b4635c6044011ffee49e6670aaa50e837f850d71d018', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DULCOLAX TABLETS', '', '0', '10', '202', '1', 'E8059', 'active'),
('543bfcc33059bf3bde27e9ba58acd577d2cc428ba38eb064', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FANLAR TABLETS', 'GT', '0', '50', '202', '1', 'S7924', 'active'),
('54ec29aba7a6c79db5e9bb4b19da0925c148e1fb59141390', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BENZYLPENICILLIN INJECTION 1IU', 'PEN', '0', '500', '202', '1', 'F8031', 'active'),
('552b58012f8be1f71024dacede184e0159ffcce15b747c24', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMPICLOX (AMPICILLIN CAPSULES) ', 'AM', '0', '20', '202', '1', 'D5693', 'active'),
('558b96caf2132b38775f2972c0b4c0423d92b70cd7bcd27a', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'HYDROCORTISONE INJECTION 100MG', 'AN', '25', '200', '202', '1', 'W5684', 'active'),
('560db4f6ab676469a0c810f2a55c0cae31199b8a304038ea', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'METRONIDAZOLE TABS 200MG ', 'METRONIDAZOLE TABS 400MG ', '0', '5', '202', '1', 'X3496', 'active'),
('5768059aa69125e3ad001f1f77e3cbfb144120b938e019d3', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DIPROSON', 'DIPROSON', '56', '80', '202', '2', 'U7193', 'active'),
('591ca7979e157b61ca8653bf1f0ba232a76ceee9ff93c1c6', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRADMIN (TRAMADOL CAPSULES) ', 'TRADMIN', '0', '20', '202', '1', 'T2071', 'active'),
('59791fb5056617fb686ff0ea63b29790b66872177c92e7b6', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRAMADOL 100MG INJECTION', 'TRAMADOL', '20', '200', '202', '2', 'R0542', 'active'),
('5a192ba007cfc1851142a01563b4c2b2dd7091be2893a29e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'GRISEOFLUVIN TABS 500MG ', 'GR', '0', '20', '202', '1', 'M8015', 'active'),
('5a608d1067d66534e50d31aa4e406863e441240e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMOXICLAV SUSPENSION', 'AMOXICLAV SUSPENSION', '155', '450', '202', '1', 'ITM-044', 'active'),
('5c0c34b62ff77e38620bcab1028305cd945d0200efc08b82', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MEFNAMIC ACID CAPSULES', 'MEFENAMIC ACID', '0', '10', '202', '1', 'I6835', 'active'),
('5c1513beb85969761014045db00781266d24d4cb461c3093', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CATGUT ABSORBABLE SUTURE 2/0 ROUND BODY', 'WOUNDS', '0', '1500', '202', '1', 'N8237', 'active'),
('5c674215e10686abd4824abf7443a6d5372c9fe1', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SICLOFEN MR', 'SICLOFEN MR', '0', '20', '202', '1', 'ITM-015', 'active'),
('5d559ab380ef82f51a30bb7b848cf1874d1f202dae936176', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PHARMASAL', 'PHARMASAL ', '47', '100', '202', '1', 'V7901', 'active'),
('5f39d20def5503870bd43eba4457bda610cf9379', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRUST CLASSIC CONDOMS', 'TRUST CLASSIC CONDOMS', '0', '50', '202', '1', 'ITM-052', 'active'),
('5f57709e8f203b3c045de78475701c7a1da9dac45868be23', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DENTAMOL TABLETS', 'TEETH', '0', '20', '202', '1', 'A7039', 'active'),
('6021a71dfa432b31a1483b12d9e8fdb58c950200', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CIPROFLOXACIN EAR/EYE DROP', 'CIPROFLOXACIN EAR/EYE DROP', '0', '250', '202', '1', 'ITM-104', 'active'),
('60b0497950e016cc4e048890227adb95d5f75fae', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AYURVEDIC SOAP', 'AYURVEDIC SOAP', '0', '100', '202', '1', 'ITM-100', 'active'),
('60ef84e452a2c63c48da3f4678da29141bf54bdfdba5c165', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BRUFEN TABS 200MG', 'BRUFEN TABS 200MG', '0', '2', '202', '1', 'T1248', 'active'),
('6208780158eb91bec182f7f097fbeea062fbd4a6596b323a', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BONNISAN SYRUP', 'BONNISAN', '390', '500', '202', '2', 'V4073', 'active'),
('6229ddb4e129837ff4459c5d11a1e459e0c6417d25aa5b06', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CEPHALEXIN CAPSULES 250MG', 'CE', '0', '10', '202', '1', 'U6345', 'active'),
('636dc08a35e39b9f8c650b14b2bf4bd6e117ebbf', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'COTTON WOOL 50G', 'COTTON WOOL 50G', '0', '50', '202', '1', 'ITM-099', 'active'),
('65675da520723a7be8f7d812c22f8c5d7a1d206a', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BUSCOPAN TABS', 'BUSCOPAN TABS', '0', '10', '202', '1', 'ITM-025', 'active'),
('65b2f06c82cd80ffa97d83a4e480a06e07ab68bdd831de4e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMLODIPINE(VARINIL) TABS 10MG', 'AMLODIPINE(VARINIL) TABS 10MG', '0', '15', '202', '1', 'T0938', 'active'),
('65f77879bd8aee0c6d514f8f6b5abb08c3178b19', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'HCG (URINE PREGNANCY STRIP)', 'HCG (URINE PREGNANCY STRIP)', '0', '50', '202', '1', 'ITM-057', 'active'),
('6651b3b1b48b7deac37c7a67e79e0a039416641c', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ZENTEL SYRUP', 'ZENTEL SYRUP', '0', '250', '202', '1', 'ITM-022', 'active'),
('6774a4bcb978cab5ef1763df9a35f4bbc23163c1be9a047c', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'POLYTROL', 'POLYTROL', '215', '350', '202', '2', 'Q0524', 'active'),
('67aa373947256d40f03a243355776bf676eea57a', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ONDANSETRON 4MG ', 'ODENSTERON TABLETS', '30', '50', '202', '1', 'ITM-047', 'active'),
('67cd1162d5c026cb063d9d72875823e307ff828f4d7ef8a3', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'INFUSION GIVING SET WITH AIR INLET', 'IVFS', '0', '200', '202', '1', 'Z0735', 'active'),
('67f7942797e01be97c28e6a83f6d58082c9c43e2c8ba9c2b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRANEXAMIC ACID INJECTION AMPOULES', 'BLEEDING', '0', '500', '202', '1', 'I4925', 'active'),
('69590de5604d6fef8fbf4a48998a3111d69217a5c52839a6', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'GENTAMYCIN INJECTION 80 MG AMPOULES', 'GENTA', '0', '500', '202', '1', 'J2593', 'active'),
('6a6ee603a63a4e4efa95abd349da00cca2db09befb9e09b5', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DICLOFENAC INJECTION 25MG', 'DICLOFENAC', '0', '500', '202', '1', 'Z4687', 'active'),
('6a7dfeacf49289abec46ce9e76d395de34eda541', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'RUFENAC GEL', 'RUFENAC GEL', '0', '80', '202', '1', 'ITM-076', 'active'),
('6b44efb6fd22440c451a8496f9ba0f7d85ab8efa107b3789', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SYLENT (ETAMSYLATE) ', 'SYLENT', '45', '100', '202', '2', 'Z6543', 'active'),
('6d78b8b3f82967db65348ab14f42f630032f1e5d52555685', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DOXYCYCLINE CAPSULES 200MG', 'DOXY', '0', '10', '202', '1', 'F2059', 'active'),
('6dc21d35d7a4aab920ddc0b05d15c2ca40422820', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BRUFEN TABS 400MG', 'BRUFEN TABS', '0', '2', '202', '1', 'ITM-043', 'active'),
('6e3c72b31c7324934bed2f3264a7ed3c447e873dc2e0b7ce', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'VITA PYN TABS ', 'VITA PYN TABS ', '0', '20', '202', '1', 'G2759', 'active'),
('7097a8940047423798a89aeb2b69b9444e672d909fbacf95', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'LOSARTAN H 12.5', 'LOSARTAN H 12.5', '0', '10', '202', '1', 'D4269', 'active'),
('73124ab168fe48b284bde9b7c748786e4a1d06dde5f97e2f', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ENTAMAXIN CAPSULES', 'TF', '0', '10', '202', '1', 'R1873', 'active'),
('731b3efe0716a284b1d5e3912f8a353b52c3fb4acd5c5c54', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'LACTULOSE', 'LACTULOSE', '0', '400', '202', '1', 'D1367', 'active'),
('746864fccb11baf2f54996dc88fbe34b4ab4fe4331b77d09', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'GIFOL TABS', '.', '0', '5', '202', '1', 'C6345', 'active'),
('75b8087863257d592f21176a9ce39d6eebb418c4', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CIPLADON TABLETS', 'CIPLADON TABLETS', '41.25', '50', '202', '1', 'ITM-027', 'active'),
('77dcfb5f212806b4e4cbd368999ee9f858a3d223baad6e94', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLUCLOXACILLIN INJECTION (FLOXAPEN) 500MG', 'FLOXAPEN', '0', '500', '202', '1', 'J1036', 'active'),
('77f414a393e0049a4242d0ed59ea744170e8f19b6a20fc64', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MALARIA TESTING KITS', 'MAL', '0', '150', '202', '1', 'I2618', 'active'),
('7840ae33bb2b67b8b445dd5989806fc2cd94ebc7a6429377', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SALBUTAMOL TABS 4MG', '.\r\nSALBUTAMOL', '3', '5', '202', '2', 'L1046', 'active'),
('786c4e2d3765e708199d16c503005a6d114c6aa82f443b2f', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SOLVIN PLUS (BROMHEXINE HYDROCHLORIDE)', 'BR', '0', '10', '202', '1', 'I9360', 'active'),
('78c4f98fd5f52cb56d7bc7c035abd680389b2240', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MEDICREPE SMALL', 'MEDICREPE SMALL', '0', '50', '202', '1', 'ITM-098', 'active'),
('7b677e0210c8c425b7c75ad5594069c4d78eb1d4', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BULKOT B SYRUP', 'BULKOT B SYRUP', '0', '150', '202', '1', 'ITM-049', 'inactive'),
('7d28b8f2c2dcd6f7bf62ae14cd866a01ddc1ed229107798d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CARBAMAZEPINE TABS', 'CZ', '0', '10', '202', '1', 'O5428', 'active'),
('7d4a5030c1e74040dff922d29f36af7c612bbf09', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ESOMEPRAZOLE TABS', 'ESOMEPRAZOLE TABS', '0', '20', '202', '1', 'ITM-017', 'active'),
('7de770d48331981f23dda6f541a28e91160846c15780061a', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'OFLOXACIN ORNIDAZOLE [ORAV-0Z]', 'ORNIDAZOLE', '110', '250', '202', '2', 'C8564', 'active'),
('7e5b96321c726a4b3b0bea54ac4472fc12fa4854', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'OMEPRAZOL 20 MG CAPSULES', 'OMEPRAZOL 20 MG CAPSULES', '1.4', '5', '202', '1', 'ITM-024', 'active'),
('7f1bee077672201b5ab1243dc35f47a0de967491', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DEXAMETHASONE TABS 4MG', 'DEXAMETHASONE TABS 4MG', '0', '20', '202', '1', 'ITM-009', 'active'),
('7f528293b97dfd0a6b1d047b66ac1d857c64ad4b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CLOZOLE CREAM', 'CLOZOLE CREAM', '0', '100', '202', '1', 'ITM-071', 'active'),
('7fe2c6c46eb12c65c97f47ff7c7f03c6c00120f527cd8850', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DENTINOX TEETHING GEL', 'DENTINOX', '597', '900', '202', '2', 'G4687', 'active'),
('801338273208eeecedc9ce83dc7cdd67a8fd7ac666144de9', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FUROSEMIDE TABS', 'HF', '0', '5', '202', '1', 'Y6481', 'active'),
('8030bb90ad3506ff2cb912a47629d8e89e24462f942f7d56', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PARACETAMOL SUPPOSITORY', '.', '0', '50', '202', '2', 'U4361', 'active'),
('8243961da23c1839db1ca331bdf23c301319e44321ff55a1', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRICHOST SYRUP', 'TRICHOST SYRUP\r\n', '0', '150', '202', '1', 'G7102', 'active'),
('8373f3d133242237bdef129fb0f2ca3e6e6081285bbc42ce', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMLODIPINE (AMLODY) TABLETS 5MG ', '', '0', '10', '202', '1', 'Q0738', 'active'),
('83fc2119831287653db297be28b623eedb100d9c', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PONSTRAN FORTE TABS', 'PONSTRAN FORTE TABS', '0', '50', '202', '1', 'ITM-048', 'active'),
('85e401fe4595fac925d1ca1b99d279ab85cb17cbbe0e68a6', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ONDANSETRON 8MG', 'ODANSETRON', '45', '90', '202', '1', 'Q1760', 'active'),
('8783e110d6d2d0f4b441c15af0b11e0e961891c2dba7f95d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'GRISACTIN TABLETS', 'GR', '0', '5', '202', '1', 'H3952', 'active'),
('885573335a92bb0932ff6c39072d319f86e9cc170b4e9f20', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DEXAMETHASONE TABS ', '', '0', '0', '202', '1', 'D4659', 'inactive'),
('88fb6781ab8c24aea599f83480265da9ab0e111eb87aae8e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'METRONIDAZOLE SUSPENSION 100MLS', 'METRONIDAZOLE SUSPENSION 100MLS', '0', '150', '202', '1', 'J7591', 'active'),
('89a2846d7ef8887da575ceb87a0e239cdc44e82b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PANADOL EXTRA', 'PANADOL EXTRA', '0', '20', '202', '1', 'ITM-086', 'active'),
('89edf8cbd5063ee31559626be3aa6b60f07f3cdd', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PROMETHAZINE 60ML SYRUP', 'PROMETHAZINE 60ML SYRUP', '0', '100', '202', '1', 'ITM-004', 'active'),
('8a73ed2a7b622e6327c02bba33615bbf07ae45183972276e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BRUSTAN ', 'BRUSTAN', '0', '20', '202', '1', 'Q4901', 'active'),
('8aa16952a1bd6eddde9a9610f20c5f581efafc1b6895259e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'KLY JELLY GEL', 'KLY JELLY GEL', '200', '350', '202', '1', 'F7524', 'active'),
('8b2cd2a5bb0e773103cd45ff1b69259842a5a14f', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CREAM (XTRADERM)', 'CREAM (XTRADERM)', '0', '250', '202', '1', 'ITM-074', 'active'),
('8be5ec6bdf2008a59f85b5b11fd5c0270806add6047db082', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ZINC SULPHATE TABS ', 'ZINC', '0', '10', '202', '1', 'W2193', 'active'),
('8c66b5c0ddb1df7e474e4a24d433b49a6cf3f095', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PIRITON TABS', 'PIRITON TABS', '0', '2', '202', '1', 'ITM-029', 'active'),
('8d0ce0d0d0e19f80e23abd848912fe2194696a45241451c9', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'HAEMOGLOBIN (HB) TEST STRIPS', 'HB', '0', '150', '202', '1', 'F3514', 'active'),
('8d3b3c6616ef44042a18a8f6071debf5f8934005', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'KALUMA PLUS (LOZENGES)', 'KALUMA PLUS', '0', '20', '202', '1', 'ITM-081', 'active'),
('8efd9713f93c060a1479e633d4d2f1d85bf91d39', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SEPTRIN SYRUP 50MLS', 'SEPTRIN SYRUP 50MLS', '0', '50', '202', '1', 'ITM-041', 'active'),
('8fbcb69d3cd630e657477926085e4475f625bcb54dc9be64', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ASHTONE', 'ASHTON', '0', '10', '202', '1', 'K0824', 'active'),
('9040824c04397184d4b865d41b64c4aed89acabb', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BULKOL (CLOTRIMAZOLE)', 'BULKOL (CLOTRIMAZOLE)', '0', '100', '202', '1', 'ITM-060', 'active'),
('91fa8ee434340d42e666195d3406ec1e7e6835418ef50a30', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CALAMINE LOTION ', 'AL', '0', '150', '202', '1', 'K8350', 'active'),
('92acd6fec04dc858dff02d9261101e5e672049fc588b49de', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CEFTRIAXONE INJECTION 1000MG ', 'CEF', '45', '500', '202', '1', 'X9104', 'active'),
('92dfef97188f5071d86823c147c5237d057c6ffa82cced73', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CLOMID (CLOMIPHENE) ', 'CLOMID', '0', '100', '202', '1', 'W1607', 'active'),
('93ca0f0048a16786a99f9d35441dde9723d95f149cbe9a76', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BULCOT MOUTH PAINT', 'BULCOT MOUTH PAINT', '35', '100', '202', '2', 'Q3896', 'active'),
('9493a9e52fd51f90caa76c02ad18c746abe31589', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MARA MOJA', 'MARA MOJA', '0', '10', '202', '1', 'ITM-088', 'active'),
('94e4cb5b1b1e50d9ed25e4a8dc5c626501c03c74bcef5395', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'GLUCOMET 500MG TABS', 'DM', '3.75', '20', '202', '1', 'G5964', 'active'),
('96f22cb8ef09a3b92e27f6aedf78b5f57546118b3f796a84', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DEXTROSE INJECTION (D10) ', 'D10', '0', '500', '202', '1', 'E5172', 'active'),
('980b61e819e31c3663d79fe07d5454d40854cb8eba1cf4b8', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CLOTRIMAZOLE POWDER', 'CXZ', 'O', '400', '202', '1', 'M8341', 'active'),
('987c86486a7a6055fac0e31983c29948e87252c4', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SONAPLAST', 'SONAPLAST', '0', '10', '202', '1', 'ITM-090', 'active'),
('9a1fcaac0380937f2926cdb39eeb78fa773bb1211ad44430', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'GYNO CARE ', 'G', '0', '850', '202', '1', 'N4897', 'active'),
('9b3da65ac6501bed6bf20e6de6cbe00620993c5155396fac', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CADISTIN SYRUP', 'CADISTIN SYRUP', '0', '250', '202', '1', 'F3489', 'active'),
('9c61534b6e975cd51b8448e1cca5a03da5fa231ae29622c9', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'KISS CHOCOLATE ', 'SEX', '0', '100', '202', '1', 'Q4627', 'active'),
('9c84e3c8cfe7dd9ade4f0e3776ebe30b8a2da382', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRUCK MR', 'TRUCK MR', '10', '20', '202', '2', 'ITM-019', 'active'),
('9ca1b673cd51fb93e787f5bb03f36a8b5b59c9ee23ffdca2', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MALAREM SYRUP', 'M', '0', '350', '202', '1', 'O7481', 'active'),
('9e376081db12375daf91aa673dfa606ee9b2d3c37b246f0a', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'coldmol', '', '3.9', '15', '202', '1', 'M4157', 'active'),
('9e849d1757847556875bd398661f09ec72249ae09e698ed9', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SYLATE TABS (ETAMSYLATE) 500MG', 'SYLATE', '45', '100', '202', '1', 'G7942', 'active'),
('9edada733f9b5f26b87416a2ac59bcad895c01174005e2b8', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'levofloxacin', 'levofloxacin', '0', '300', '202', '1', 'N3657', 'active'),
('9f4696fb3e7d85d63232e793657d501daec444041cbf696c', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CEFIXIME TABLETS 400MG', 'CEFI', '0', '30', '202', '1', 'D7928', 'active'),
('9fe453f8ab4b377c0fb54b70b6dcdf12148e18af', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CALPOL SYRUP', 'CALPOL SYRUP', '0', '350', '202', '1', 'ITM-026', 'active'),
('a01808def29e65c00378d780386f7ace361103cf', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLUCOXACILLINE SUSPENSION', 'FLUCOXACILLINE SUSPENSION', '0', '250', '202', '1', 'ITM-039', 'active'),
('a0bdf8cdf4c12b865c1f98eff55102f4b691dd0c03b15be7', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLUGONE SYRUP  60ML', 'FLUGONE SYRUP  60ML', '180', '280', '202', '1', 'K9561', 'active'),
('a115c06becc4e927edf054f646a52e5dc1a7191070228857', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PROPRANOLOL TABS', 'PROPRANOLOL TABS', '0', '20', '202', '1', 'F1026', 'active'),
('a167a1e7cae98b20da5f8a27d7db602eb513161cfbbcad2e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FERTILION TABS', 'FER', '0', '80', '202', '1', 'K7614', 'active'),
('a303e4f00c382fce5f0517b8b78bd257ea0aacb758152dca', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ASCORIL SYRUP', 'ASCORIL SYRUP', '0', '350', '202', '1', 'L3965', 'active'),
('a31d38c1caf90799179fbf09336c6f0b83554ba36bdea401', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'LIGNOCAINE INJECTION ', 'LOCAL', '0', '200', '202', '1', 'W9458', 'active'),
('a320ab142007f0bbe0818b5413c1567c74c2bc7deaa94816', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TUSPRESS', 'TUSPRESS', '0', '250', '202', '1', 'O8972', 'active'),
('a39220f82dc1d18a21806bc0de01f2421bc4fb9c', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'KISS LUBRICATED CONDOMS', 'KISS LUBRICATED CONDOMS', '0', '50', '202', '1', 'ITM-053', 'inactive'),
('a506bf364f30e8814aea493758aa193a2e4891d804d35c55', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'LONART TABLETS', 'TABS', '0', '150', '202', '1', 'N2379', 'active'),
('a531b0066c1bdc1d5b7291f53c4c0809eabd8e22', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PANADOL ADVANCE', 'PANADOL ADVANCE', '0', '20', '202', '1', 'ITM-083', 'active'),
('a563879bfb8b694a5cbd826c7245d25b9f40ddda08ba3b82', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ERYTHROMYCIN TABLETS 250MG', 'AZ', '0', '10', '202', '1', 'P3071', 'active'),
('a5f3ce979f304e1dc5ecbf285cbab70a3ba602e751e1a2f2', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CETRIZINE SYRUP ', 'CZ', '0', '50', '202', '1', 'D1398', 'active'),
('a62716198474a1aa8acbbeaa4dc8ee1dbc3b4b76', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TAGERA FORTE SECNIDAZOLE', 'TAGERA FORTE SECNIDAZOLE', '50', '100', '202', '1', 'ITM-050', 'active'),
('a6fe82e9b0e499095529fff574423f7c53365ab69ed80b35', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'VDRL (SYPHILIS)  TESTING KITS', 'VD', '0', '300', '202', '1', 'R6095', 'active'),
('a7669b1194a2b34bb9d22e6eaf105f471ac77662', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SODAMINT TABS', 'SODAMINT TABS', '0', '2', '202', '1', 'ITM-032', 'active'),
('a7cfa67b2a517b47a3c444945692e84327b068bd6d50fbdf', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BROMOCRIPTINE 2.5MG', 'BR', '0', '60', '202', '1', 'E3621', 'active'),
('a7d6c04b33b31ca0ecf0b9970a96d6830ae34c53dd95b8e8', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'REUNITE TABLETS', 'FR', 'O', '40', '202', '1', 'I8743', 'active'),
('a9a837466d20adcb2cbd5ed396ca02c369d1378ddf5fce02', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CORN CAPS', '', '0', '50', '202', '1', 'G8201', 'active'),
('a9aa0bfe532660f700f1a7e281610fca29bc94ef2564e65c', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ALBENDAZOLE SUSPENSION 20MLS', 'ALBENDAZOLE SUSPENSION 20MLS', '0', '100', '202', '1', 'C0276', 'inactive'),
('a9acd2be7626cb7c475028dd4d2b3c9b1241644d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CARDISTIN EXPECTORANT 100 ML', 'CARDISTIN EXPECTORANT 100 ML', '0', '250', '202', '1', 'ITM-007', 'active'),
('aa1d6b12104964520619cf18050d81de43ffa0a9', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TERBIBACT MIXI CREAM', 'TERBIBACT MIXI CREAM', '0', '450', '202', '1', 'ITM-066', 'active'),
('aaa1fc3e95a07876f8b0d8fc6a08ee966dc47a01', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ABSORBENT COTTON WOOL 100 GMS', 'ABSORBENT COTTON WOOL 100 GMS', '0', '150', '202', '1', 'ITM-079', 'active'),
('ac13ac65e12fd6c152a5962a36f4e7212a63bf90ae31f893', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLUCLOXACILLIN SUSPENSION 100MLS', 'flucloxacilline', '75', '150', '202', '1', 'W1263', 'active'),
('ac511ca31fe3e43ca76b79c8f3c91df83bb35ab1', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PROBETA-N', 'PROBETA-N', '0', '250', '202', '2', 'ITM-105', 'active'),
('af15f98c664b77b9a33cbaf51932786108557f561dbbf6eb', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CELABET (BETAMETHASONE) TABS', 'C', '0', '20', '202', '1', 'C5426', 'active'),
('b00060e2de791f5f5ca69f19ac8c9de567fa554c782e35e3', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CATGUT ABSORBABLE SUTURE 2\0 REVERSE CUT', 'WOUNDS', '0', '1500', '202', '1', 'J1286', 'active'),
('b002b2617dbfd5c93fad892e9dab6d3cb6717ca57a8db520', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SPIROLAC 25 TABLETS', 'DIU', '0', '5', '202', '1', 'X9084', 'active'),
('b0b46022d5256d0d5d2393fc07cc2d767caac505aac9d2a2', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'NOGLUC TABLETS', 'N', '4.2', '10', '202', '1', 'M0751', 'active'),
('b0d90246a9d8e1507469f7f51b4aa7b56aa72b8c850d4b2d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'HITORAL (KETOCONAZOLE TABS) ', 'HITORAL (KETOCONAZOLE TABS) ', '0', '20', '202', '1', 'D8596', 'active'),
('b2396334381f6bfc29759fac06de83105cfd68f7', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PREDNISOLONE TABS', 'PREDNISOLONE TABS', '0', '5', '202', '1', 'ITM-006', 'active'),
('b2ebe95aca56f34ccea49c934484fd7894b3675081d1daff', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'STRAPPING', 'STRAPPING', '60', '100', '202', '1', 'K6082', 'active'),
('b3248c2b120416ab83a18f524e52e57862dd0451', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMPICLOX SUSPENSION', 'AMPICLOX SUSPENSION', '0', '250', '202', '1', 'ITM-040', 'active'),
('b5000a40bad60bdd9aeeb82c3a58270a156d3c83', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MEDICREPE MEDIUM', 'MEDICREPE', '0', '100', '202', '1', 'ITM-080', 'active'),
('b62e818a6754a122feb32d4bbdc3531f494e119328097114', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CARDITAN AM TABS', 'BP', '0', '15', '202', '1', 'W4279', 'active'),
('b67b8fdead25349b77c7e32b95b09a2195b70461f48b56ad', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'METFORMIN TABLETS 500MG ', 'DM', '0', '5', '202', '1', 'G0712', 'active'),
('b7993aff93daad519b11c964b51a08c1a2784662f789fe75', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMOXYL BT 250MG', 'AM', '0', '10', '202', '1', 'X5167', 'active'),
('b9144ae5a6aa70ce15f7642148d9c856da8ce4665cb43d9f', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'kiss classic', 'kiss classic', '20', '50', '202', '1', 'O0941', 'active'),
('bb134f1c79cfe92e8e8a8241d6040ea77f1656176819c7e2', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLUCLOXACILLIN SYRUP 100MLS', 'FLUCLOXACILLIN SYRUP 100MLS', '0', '20', '202', '1', 'E7518', 'inactive'),
('bb34c348c8ff1be68ba584e17a00facdae1e8fcaa2093153', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CARTIL', 'CT', 'O', '100', '202', '1', 'V0127', 'active'),
('bba780fd2eecdc45437cf515e21d8e52d9485824deec86f4', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'RINGERS LACTATE SOLUTION 500MLS', 'RINGERS LACTATE SOLUTION 500MLS', '0', '500', '202', '1', 'J9582', 'active'),
('bc31b3ad839aec1f3aa2b787885e5980771cc72f', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FARMASOAP (KLY JELLY)', 'FARMASOAP (KLY JELLY)', '0', '300', '202', '1', 'ITM-072', 'active'),
('bcc73a84f1ace0635f1c90b45a717989a8b758e9', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SEVEN SEAS', 'SEVEN SEAS', '0', '550', '202', '1', 'ITM-002', 'active'),
('bd0b933e03b3e8b4979240e6061282227b3f2874', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FEVIT B COMPLEX SYRUP 100 ML', 'FEVIT B COMPLEX SYRUP 100 ML', '0', '550', '202', '1', 'ITM-005', 'active'),
('bd25f6ede9342399c3627eeb7e69afa3afb34514d80cf5ec', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLOXAPEN (FLUCLOXACILLIN) CAPSULES 500MG', 'FLOXAPEN (FLUCLOXACILLIN) CAPSULES ', '0', '20', '202', '1', 'E5196', 'active'),
('bda18f9d4898f74af205c536215cc960adb12aec3ed06f57', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PERGALIN', 'PG', 'O', '20', '202', '1', 'M0594', 'active'),
('bdb0cab5a0b8329f933c8c9699d0b0b8b6a38c3ecf51ee0c', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'NITROFURANTOIN TABLETS 100MG', 'UTI', '0', '10', '202', '1', 'Z6230', 'active'),
('be2ead9e4563bfeb5665afb036344c70ec92af33f80049dc', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SEPTRIN (CLOTRIMAZOLE SYRUP) 100MLS', 'SE', '0', '100', '202', '1', 'I6283', 'active'),
('be987c08ccad199fbdf3efd4507efb51c763812b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FACE MASK', 'FACE MASK', '0', '10', '202', '1', 'ITM-094', 'active'),
('bef35ecb719ea3afd85d6e0f80c10fd0bf3c7f782418a3e8', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'RELCER GEL 100MLS', 'RG', '0', '350', '202', '1', 'T9415', 'active'),
('bf426626805ce8edcdb3154b4bfe58e372e7a258f97c2cf5', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'IBUGESIC SYRUP', 'IBUGESIC', '75', '150', '202', '1', 'O0368', 'active'),
('c1e878cfc56c3d4f631515d7d65db03ade50f7eee9ad90be', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRIOFEN SUSPENSION 100MLS', 'TR', '0', '100', '202', '1', 'U7861', 'active'),
('c292478ebb754d8817de1d50dd341c78381c81a5db341371', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FOLIC ACID TABLETS 5MG', '0', '0', '5', '202', '1', 'Y4892', 'active'),
('c2f9776e5e5ec8dda9c161e59da6a29ede46084a6671f82d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'KISS STRAWBERRY ', 'SEX', '0', '100', '202', '1', 'T2463', 'active'),
('c2ff8581d7e51d3a4550dfbffe9a8f8d5a57ed1feff2839b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CLOTRIMAZOLE PESSARYM [CANADIL]', 'clotrimazole pessary', '25', '100', '202', '1', 'S1678', 'active'),
('c3c2b68ababdbea25c2eef0bd5abdbf2344e440224585414', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MICROENEMA', 'MICRONEMA\r\n', '0', '500', '202', '1', 'P7028', 'active'),
('c3e3976e94a8970bf6186da953b413d76e5d08bf', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MICROGUNON', 'MICROGUNON', '0', '300', '202', '1', 'ITM-035', 'inactive'),
('c50c146e3eed02d7e3fbd91f57b1ea80e1f6533446831bcd', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'IFAS', 'IFAS', '1.1', '5', '202', '1', 'P6807', 'active'),
('c52a7d4d5c1991cb0db6d5c0ab1adda52099e1a5c714e8b3', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'POST EXPOSURE PROPHYLAXIS, ARVS ', 'FXDZH', '0', '30', '202', '1', 'A5430', 'active'),
('c5b4ff34a4161a0dd2ac8fe6b5f60f5b0dcb9ad7b2be84df', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'GRISEOFLUVIN TABS  125MG ', 'GR', '0', '10', '202', '1', 'O6580', 'active'),
('c6b44b2f3cc1355cc6c653958119dd43718a541125c2a908', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRIMOXOL SUSPENSION 100ML', 'TRIMOXOL SUSPENSION 100ML', '0', '150', '202', '1', 'J2781', 'active'),
('c6e7484dd85231859b8a67b220011c3d93755973', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PIRITON SYRUP 60 MLS', 'PIRITON SYRUP 60 MLS', '0', '50', '202', '1', 'ITM-042', 'active'),
('c8e9efe8ea5cb41de134c84bcef146cd1128bef8', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'COSVATE GM CREAM', 'COSVATE GM CREAM', '0', '450', '202', '1', 'ITM-055', 'active'),
('ca56091919e10898c1b149d1024bc0dc103336b16066d057', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'RANFERON SYRUP', 'RANFERON SYRUP', '0', '550', '202', '1', 'Q3987', 'active'),
('cda832efdb03b68464f4a2ae1d1908cf60d68745cbf6066f', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PROMETHAZINE TABLETS 25MG ', 'PROMETHAZINE TABLETS 25MG ', '0', '5', '202', '1', 'J2193', 'active'),
('ce42fe9535338219688f231e8d18cec0bf276955', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ZULU MR', 'ZULU MR', '0', '50', '202', '1', 'ITM-028', 'active'),
('ce6c66e672324d89fee05995612b470cb1be646b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CHEST COF', 'CHEST COF', '0', '10', '202', '1', 'ITM-091', 'active'),
('cebb31b5ede455c7c85b885c5c1861e3c0296e85', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DICLOMOL SR', 'DICLOMOL SR', '4.3', '10', '202', '2', 'ITM-014', 'active'),
('cfe21d6aec37844726a7dbb2168cd5ff7355cbbc', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'NOSIC TABLETS', 'NOSIC TABLETS', '0', '25', '202', '1', 'ITM-011', 'active'),
('d20b7d7382abd6a1d13522fbd0e97f59ccacdf2d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ACTION', 'ACTION', '0', '10', '202', '1', 'ITM-089', 'active'),
('d22202ee1dc3d35e024b7af09638d72661074e2ac651dc8e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ESOMEPRAZOLE INJECTION 40MG', 'ULC', '0', '500', '202', '1', 'U5906', 'active'),
('d3bb050c09e9c31307d0061476b3b61ce3a2e6d64519b097', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'METRONIDAZOLE SUSPENSION 60MLS', 'METRONIDAZOLE SUSPENSION 60MLS', '0', '100', '202', '1', 'E2086', 'active'),
('d3f45426995811a93460dc68da14488b6fc8fa71aec5c122', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'HIV 1 AND 2 TEST KIT', 'RVD', '0', '200', '202', '1', 'D9605', 'active'),
('d443c948d47128a9a28d570b6f62ea6c31902356ae6de185', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRIBES FORTE ', 'E', '10.5', '20', '202', '1', 'M2369', 'active'),
('d51d1fb727a7105211806634032ccc4a775e091d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TETRACYCLINE EYE OINTMENT', 'TETRACYCLINE', '0', '50', '202', '2', 'ITM-102', 'active'),
('d54c51fc93293295a21699a2704dea858f0cb7c9', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'LUBTEAR EYE DROPS', 'LUBTEAR EYE DROPS', '0', '450', '202', '1', 'ITM-103', 'active'),
('d556fefe2a18707b761364346c588c7efed9a0a49897177a', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PREGABALIN 75MG ', 'PREGABALIN', '10', '20', '202', '2', 'Z3084', 'active'),
('d60b03731f0b71be07d47bbcb77ee1a771a69dc6fa6159d7', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MEDIVEN CREAM', 'CREAM', '0', '100', '202', '1', 'I3482', 'active'),
('d634afe4cb4c126d7db40d0a8d1f0a7b0aba80305218ef22', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DEPO PROVERA INJECTION ', 'FP', '0', '200', '202', '1', 'L0598', 'active'),
('d87e00ee24858a005ac07f55e626e463cfadc6e5deff6cdd', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PARACETAMOL TABLETS (PCM) 500MG', 'PCM', '0.52', '2', '182', '1', 'O7916', 'active'),
('d93721f30cfcdd2ee167f2e8f9d7be14e64cd51a1901e144', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRANEXAMIC ACID TABLETS 500MG ', 'BLEEDING', '41', '50', '202', '2', 'V1523', 'active'),
('d9d708dcfb4dfc8ab88f9bfaf468ca53f5f31d25b40986c7', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'RBS BLOOD SUGAR TESTING STRIPS ', 'RBS', '0', '150', '202', '1', 'M7503', 'active'),
('db058f71908e253ac2cdeb67bdb3dc6acae3a61bd0365e92', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CARVEDILOL TABLETS 6.25', '', '0', '20', '202', '1', 'L7451', 'active'),
('db2470cae6d092a33f7656f6da132adb38bbe1bb9bcc1b63', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'INDOMETHACIN', 'IMJ', '0', '2', '202', '1', 'Q3564', 'active'),
('db9dd08f5b1f1c5d7a4242065ba7b82ff0838c5ca8b2daa1', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ASTHON AND PARSONS ', ' C', '0', '10', '202', '1', 'A9370', 'active'),
('dbf3ee2716ea997ce2d8a9a8ea2d3f5a8093fa2e995ceea2', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BETADINE MOUTHWASH', 'BETADINE MOUTHWASH', '0', '850', '202', '1', 'A4072', 'active'),
('dc8a1dc95f8f6281f5d4fdd82faa80b3797052dda32cc76e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CURAMOL', 'C', '0', '50', '202', '1', 'P4536', 'active'),
('dcb30c38a4b6a8b9b51783a7c5b227742dbadb40', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'LIQUID PARAFIN', 'LIQUID PARAFIN', '0', '100', '202', '1', 'ITM-092', 'active'),
('dd201588e5e0fac590899db8363c8e63beca001b5f8589c2', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRACK MR', 'TRACK MR', '14.5', '20', '202', '1', 'R1295', 'active'),
('dd9bd30eafc34149e0fa259ebb51a6ca4cc14380db6b176e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DUPHASTON TABS', '', '0', '40', '202', '1', 'Q4785', 'active');
INSERT INTO `products` (`product_id`, `product_store_id`, `product_name`, `product_description`, `product_purchase_price`, `product_sale_price`, `product_quantity`, `product_quantity_limit`, `product_code`, `product_status`) VALUES
('ddb0b1445c6fd64f2eae1317933fed271be7e7b6', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ENO TABLETS', 'ENO TABLETS', '0', '20', '202', '1', 'ITM-082', 'active'),
('dde5b25efc74dd41f22bed7dc25a285c4f934e71', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CETRIZINE TABLETS', 'CETRIZINE TABLETS', '0', '5', '202', '1', 'ITM-020', 'active'),
('df7ec52758f0e206adb789b3ffdbb1044ba2fde730c87da5', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMOXICLAV 375MG ', 'AM', '0', '30', '199', '1', 'U0675', 'active'),
('dfa9aa3d27e7899293a40cc5d0c64c2c81278315', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'OLOPAT', 'OLOPAT', '0', '0', '202', '1', 'ITM-108', 'active'),
('dfd3c6bccf70777a79ca6675c231c0cf8c504d01', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PURE COTTON 400 G', 'PURE COTTON 400 G', '0', '250', '202', '1', 'ITM-078', 'active'),
('dfe99cd5be9b90dd970ac0f089744389c86c3f11fe2afcf2', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'JOINTFLEX OMEGA', 'JN', '0', '80', '202', '1', 'H0618', 'active'),
('e01bc0e1b4bb455e19b00328065b23a3bacf8230541014f5', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLOXAPEN (FLUCLOXACILLIN) CAPSULES 250MG', 'FLOXAPEN (FLUCLOXACILLIN) CAPSULES 250MG', '0', '20', '202', '1', 'R0865', 'active'),
('e08014180f1f47b93da442854ecb606ff03d63b1', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'POSTINOR 2 ORIGINAL', 'POSTINOR 2 ORIGINAL', '147', '200', '202', '1', 'ITM-001', 'active'),
('e13ce6905040801f46559827e932df68e3537421daeff04d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PIROXICAM (CAROXICAM) TABS ', 'PY', '0', '10', '202', '1', 'Z5924', 'active'),
('e39c697cf3095ca4b43f208dbeb20b92a6268231985f9fd5', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AMOXYL  CAPS 500MG', 'AMOXYL', '3.65', '10', '202', '1', 'D7590', 'active'),
('e5fdf0c535575e6a3bffb9534bc780d67b7cc904', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TERBINAFINE HYDROCHLORIDE CREAM', 'TERBINAFINE HYDROCHLORIDE CREAM', '0', '450', '202', '1', 'ITM-065', 'active'),
('e7bdc144a03308a5f5dac139866a08562e6e30b8', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'FLUCANAZOLE TABLETS', 'FLUCANAZOLE TABLETS', '0', '50', '202', '1', 'ITM-010', 'active'),
('e84e172f9f402b8e4d1be45b944af4aa694af2be71318852', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'CATGUT ABSORBABLE SUTURE 3/0 ROUND BODY', 'WOUNDS', '0', '1500', '202', '1', 'X4067', 'active'),
('e881c7eac2661852383d1828a360b501300c3b331d301b1f', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BENYLIN LIQUID', '', '0', '550', '202', '1', 'Q6721', 'active'),
('e901119ffe7e2934a097cc8cac83d7c6bb889485bce90707', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'MICROGYNON TABS', '0', '0', '300', '202', '1', 'Q5934', 'active'),
('eb670ec2e11caf97b7e27be3d43fbb033d3b8a9d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'POSTINOR 2 GENERIC', 'POSTINOR 2 GENERIC', '20', '100', '202', '1', 'ITM-036', 'active'),
('ec790c24a0f8570f0cef50f97922e87e0e8f8861', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'AZITHROMICIN SYRUP', 'AZITHROMICIN SYRUP', '0', '150', '202', '1', 'ITM-031', 'active'),
('edc838c07c638bc0c022c15e471b9eae546adbcd5c0b24d3', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'TRIDEX', 'TRIDEX', '0', '100', '202', '1', 'H5207', 'active'),
('efdd06cc654b2575611d78138f276534f537434a13c9b6a3', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ANUSAL SUPPOSITORY', 'ANNUSAL', '63', '100', '202', '1', 'X9257', 'active'),
('f2194ff76e44b4ab260bc44ee57fe6fff165ef295a1e42ee', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PREGNACARE PLUS OMEGA', 'PREGNACARE PLUS OMEGA', '1850', '2500', '202', '1', 'K9734', 'active'),
('f5cc67ea0ecc49c76aa838e66fc947e808f7120f', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ABGENTA (GENTAMICIN) EYE/EAR DROP', 'ABGENTA (GENTAMICIN) EYE/EAR DROP', '0', '100', '202', '1', 'ITM-107', 'active'),
('f5fff532ea1713ade59f50b705fa9904b26f9cfe', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ASHTONE', 'ASHTONE', '0', '10', '202', '1', 'ITM-018', 'inactive'),
('f65ef3fc96dce956884956c693286679eed52d1f82491af6', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'LATEX GLOVES', 'LATEX GLOVES', '3.3', '30', '202', '1', 'E0348', 'active'),
('f73c40cb633ca0abeb96fc1469e5364fa17d64fe43da2c5d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'LOPERAMIDE CAPSULES', '', '0', '10', '202', '1', 'N9205', 'active'),
('f91cea9bc3369de3f453437a9ab4f376dc304a7f', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'KALUMA STRONG', 'KALUMA STRONG', '0', '10', '202', '1', 'ITM-096', 'active'),
('f93bcda3116c406767dbcd84aa7ea0d8670c807ac72dd71e', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'PHLORO G TABLETS', '', '0', '0', '202', '1', 'T0213', 'active'),
('f978f64ba52305530939b479e1b9509fe1e5bc504a66b74d', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BECOATIN', 'APPETITE STIMULANT', '0', '30', '202', '1', 'M9561', 'active'),
('f99be99873d3d4bab3b69b2ab6065a036b23515f5e20986b', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'METRONIDAZOLE TABLETS 400MG ', 'TROGYL', '0', '5', '202', '1', 'T0183', 'active'),
('faf433a83c7b09f47c8d101760308d8cfede4c2bcf3c4cc6', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'METOCLOPRAMIDE INJECTION (PLASIL) ', 'VOMITING', '0', '500', '202', '1', 'Z0781', 'active'),
('fb966a5f28f5597538948ea3b9a74a92e8e72bff', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'DETTOL', 'DETTOL', '0', '300', '202', '1', 'ITM-068', 'active'),
('fc054442ebb8c1e94f3a884eb1f843189beb203b679fe259', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'ADRENALINE INJECTION AMPOULES', 'AD', '0', '500', '202', '1', 'K5634', 'active'),
('fcd5df5d44b354576783abe2464503e9d691a895ab9f655f', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'NIFEDIPINE TABLETS 20MG', 'BP', '0', '10', '202', '1', 'Y3795', 'active'),
('fd2eaf1f36e1e7fe79376f1fed12a07812421f4aa9a9b404', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'OMEGA H3', 'OMEGA H3', '0', '60', '202', '1', 'Z4657', 'active'),
('fd7532220dc88075079e73c9b29b63c5cfc552c6', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'BENZYL BENZOATE  LOTION', 'BENZYL BENZOATE', '0', '250', '202', '1', 'ITM-070', 'active'),
('fe9f611069f35c630ae98bced860d9f7a07b58f27a7788af', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'SURGICAL  BLADE', 'SURGICAL  BLADE', '0', '20', '202', '1', 'U7349', 'active');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receipt_customization`
--

INSERT INTO `receipt_customization` (`receipt_id`, `receipt_store_id`, `receipt_header_content`, `receipt_footer_content`, `receipt_show_barcode`, `show_customer`, `allow_discounts`, `allow_loyalty_points`) VALUES
(1, '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'KendiLife Pharmacy <br>\r\n+254 712 566 566 <br>\r\nDiamond Bld Lithuli Avenue <br>\r\n Opposite Archives <br>\r\n Nairobi, Kenya <br>\r\n', 'KendiLife Pharmacy: Your Health, Our Priority.', 'false', 'true', 'false', 'false');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `sale_product_id`, `sale_user_id`, `sale_quantity`, `sale_datetime`, `sale_customer_name`, `sale_customer_phoneno`, `sale_receipt_no`, `sale_cart_number`, `sale_payment_method`, `sale_payment_amount`, `sale_payment_status`, `sale_discount`, `sale_credit_expected_date`, `sale_transaction_ref`) VALUES
(1, 'df7ec52758f0e206adb789b3ffdbb1044ba2fde730c87da5', 'STF-8795', '3', '2025-01-18 11:05:09', 'James Doe', '011456892', '4530', NULL, 'Cash', '30', 'paid', '0', '', ''),
(2, 'd87e00ee24858a005ac07f55e626e463cfadc6e5deff6cdd', 'STF-8795', '20', '2025-01-18 11:05:09', 'James Doe', '011456892', '4530', NULL, 'Cash', '2', 'paid', '0', '', ''),
(3, '1f6f4723f6d8dda9f0edee6c26e587e579ce1d0d', 'STF-8795', '10', '2025-01-18 11:05:09', 'James Doe', '011456892', '4530', NULL, 'Cash', '50', 'paid', '0', '', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_settings`
--

INSERT INTO `store_settings` (`store_id`, `store_name`, `store_adr`, `store_email`, `store_status`, `store_close_date`) VALUES
('68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'KendiLife Pharmacy', '+254 712 566 566 <br>\nDiamond Bld <br> \nLithuli Avenue - Opposite Archives <br>\n Nairobi, Kenya', 'afya@kendilifepharmacy.com', 'active', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_logs`
--

INSERT INTO `system_logs` (`log_id`, `log_user_id`, `log_ip_address`, `log_details`, `log_created_at`, `log_type`) VALUES
(1, 'STF-9418', '127.0.0.1', 'Successfully Logged Into Admin Dashboard', '2025-01-18 09:46:10', 'Authentication Logs'),
(2, 'STF-9418', '127.0.0.1', 'Allowed Staff To Have Access To Stocks Management', '2025-01-18 09:48:46', 'Settings & Configurations Logs'),
(3, 'STF-9418', '127.0.0.1', 'Allowed Staff To Have Access To Items Management', '2025-01-18 09:48:50', 'Settings & Configurations Logs'),
(4, 'STF-9125', '127.0.0.1', 'Successfully Logged Into Manager Dashboard', '2025-01-18 10:42:25', 'Authentication Logs'),
(5, 'STF-8795', '127.0.0.1', 'Successfully Logged Into Staff Dashboard', '2025-01-18 10:59:13', 'Authentication Logs'),
(6, 'STF-8795', '127.0.0.1', 'Sold 3 items of U0675 AMOXICLAV 375MG ', '2025-01-18 11:05:09', 'Sales Management Logs'),
(7, 'STF-8795', '127.0.0.1', 'Sold 20 items of O7916 PARACETAMOL TABLETS (PCM) 500MG', '2025-01-18 11:05:09', 'Sales Management Logs'),
(8, 'STF-8795', '127.0.0.1', 'Sold 10 items of ITM-056 SILDENAFIL CITRATE TABLETS', '2025-01-18 11:05:09', 'Sales Management Logs'),
(9, 'STF-9418', '127.0.0.1', 'Successfully Logged Into Admin Dashboard', '2025-01-18 11:06:07', 'Authentication Logs'),
(10, 'STF-9418', '127.0.0.1', 'Edited Core System Customizations', '2025-01-18 11:06:57', 'Settings & Configurations Logs'),
(11, 'STF-9418', '127.0.0.1', 'Edited Core System Customizations', '2025-01-18 11:07:48', 'Settings & Configurations Logs');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `system_id` int(11) NOT NULL,
  `system_name` varchar(200) DEFAULT NULL,
  `system_tagline` longtext DEFAULT NULL,
  `system_status` varchar(200) DEFAULT NULL,
  `system_timezone_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`system_id`, `system_name`, `system_tagline`, `system_status`, `system_timezone_id`) VALUES
(1, 'Pharmacy Management System', 'Pharmacy Management System - Simplify. Secure. Streamline.', 'Activated', 44);

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `timezone_id` int(11) NOT NULL,
  `timezone_name` varchar(200) NOT NULL,
  `timezone_utcoffset` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`timezone_id`, `timezone_name`, `timezone_utcoffset`) VALUES
(1, 'Africa/Abidjan', 'UTC+00:00'),
(2, 'Africa/Accra', 'UTC+00:00'),
(3, 'Africa/Addis_Ababa', 'UTC+03:00'),
(4, 'Africa/Algiers', 'UTC+01:00'),
(5, 'Africa/Asmara', 'UTC+03:00'),
(6, 'Africa/Asmera', 'UTC+03:00'),
(7, 'Africa/Bamako', 'UTC+00:00'),
(8, 'Africa/Bangui', 'UTC+01:00'),
(9, 'Africa/Banjul', 'UTC+00:00'),
(10, 'Africa/Bissau', 'UTC+00:00'),
(11, 'Africa/Blantyre', 'UTC+02:00'),
(12, 'Africa/Brazzaville', 'UTC+01:00'),
(13, 'Africa/Bujumbura', 'UTC+02:00'),
(14, 'Africa/Cairo', 'UTC+03:00'),
(15, 'Africa/Casablanca', 'UTC+01:00'),
(16, 'Africa/Ceuta', 'UTC+02:00'),
(17, 'Africa/Conakry', 'UTC+00:00'),
(18, 'Africa/Dakar', 'UTC+00:00'),
(19, 'Africa/Dar_es_Salaam', 'UTC+03:00'),
(20, 'Africa/Djibouti', 'UTC+03:00'),
(21, 'Africa/Douala', 'UTC+01:00'),
(22, 'Africa/El_Aaiun', 'UTC+01:00'),
(23, 'Africa/Freetown', 'UTC+00:00'),
(24, 'Africa/Gaborone', 'UTC+02:00'),
(25, 'Africa/Harare', 'UTC+02:00'),
(26, 'Africa/Johannesburg', 'UTC+02:00'),
(27, 'Africa/Juba', 'UTC+02:00'),
(28, 'Africa/Kampala', 'UTC+03:00'),
(29, 'Africa/Khartoum', 'UTC+02:00'),
(30, 'Africa/Kigali', 'UTC+02:00'),
(31, 'Africa/Kinshasa', 'UTC+01:00'),
(32, 'Africa/Lagos', 'UTC+01:00'),
(33, 'Africa/Libreville', 'UTC+01:00'),
(34, 'Africa/Lome', 'UTC+00:00'),
(35, 'Africa/Luanda', 'UTC+01:00'),
(36, 'Africa/Lubumbashi', 'UTC+02:00'),
(37, 'Africa/Lusaka', 'UTC+02:00'),
(38, 'Africa/Malabo', 'UTC+01:00'),
(39, 'Africa/Maputo', 'UTC+02:00'),
(40, 'Africa/Maseru', 'UTC+02:00'),
(41, 'Africa/Mbabane', 'UTC+02:00'),
(42, 'Africa/Mogadishu', 'UTC+03:00'),
(43, 'Africa/Monrovia', 'UTC+00:00'),
(44, 'Africa/Nairobi', 'UTC+03:00'),
(45, 'Africa/Ndjamena', 'UTC+01:00'),
(46, 'Africa/Niamey', 'UTC+01:00'),
(47, 'Africa/Nouakchott', 'UTC+00:00'),
(48, 'Africa/Ouagadougou', 'UTC+00:00'),
(49, 'Africa/Porto-Novo', 'UTC+01:00'),
(50, 'Africa/Sao_Tome', 'UTC+00:00'),
(51, 'Africa/Timbuktu', 'UTC+00:00'),
(52, 'Africa/Tripoli', 'UTC+02:00'),
(53, 'Africa/Tunis', 'UTC+01:00'),
(54, 'Africa/Windhoek', 'UTC+02:00'),
(55, 'America/Adak', 'UTC-09:00'),
(56, 'America/Anchorage', 'UTC-08:00'),
(57, 'America/Anguilla', 'UTC-04:00'),
(58, 'America/Antigua', 'UTC-04:00'),
(59, 'America/Araguaina', 'UTC-03:00'),
(60, 'America/Argentina/Buenos_Aires', 'UTC-03:00'),
(61, 'America/Argentina/Catamarca', 'UTC-03:00'),
(62, 'America/Argentina/ComodRivadavia', 'UTC-03:00'),
(63, 'America/Argentina/Cordoba', 'UTC-03:00'),
(64, 'America/Argentina/Jujuy', 'UTC-03:00'),
(65, 'America/Argentina/La_Rioja', 'UTC-03:00'),
(66, 'America/Argentina/Mendoza', 'UTC-03:00'),
(67, 'America/Argentina/Rio_Gallegos', 'UTC-03:00'),
(68, 'America/Argentina/Salta', 'UTC-03:00'),
(69, 'America/Argentina/San_Juan', 'UTC-03:00'),
(70, 'America/Argentina/San_Luis', 'UTC-03:00'),
(71, 'America/Argentina/Tucuman', 'UTC-03:00'),
(72, 'America/Argentina/Ushuaia', 'UTC-03:00'),
(73, 'America/Aruba', 'UTC-04:00'),
(74, 'America/Asuncion', 'UTC-03:00'),
(75, 'America/Atikokan', 'UTC-05:00'),
(76, 'America/Atka', 'UTC-09:00'),
(77, 'America/Bahia', 'UTC-03:00'),
(78, 'America/Bahia_Banderas', 'UTC-06:00'),
(79, 'America/Barbados', 'UTC-04:00'),
(80, 'America/Belem', 'UTC-03:00'),
(81, 'America/Belize', 'UTC-06:00'),
(82, 'America/Blanc-Sablon', 'UTC-04:00'),
(83, 'America/Boa_Vista', 'UTC-04:00'),
(84, 'America/Bogota', 'UTC-05:00'),
(85, 'America/Boise', 'UTC-06:00'),
(86, 'America/Buenos_Aires', 'UTC-03:00'),
(87, 'America/Cambridge_Bay', 'UTC-06:00'),
(88, 'America/Campo_Grande', 'UTC-04:00'),
(89, 'America/Cancun', 'UTC-05:00'),
(90, 'America/Caracas', 'UTC-04:00'),
(91, 'America/Catamarca', 'UTC-03:00'),
(92, 'America/Cayenne', 'UTC-03:00'),
(93, 'America/Cayman', 'UTC-05:00'),
(94, 'America/Chicago', 'UTC-05:00'),
(95, 'America/Chihuahua', 'UTC-06:00'),
(96, 'America/Ciudad_Juarez', 'UTC-06:00'),
(97, 'America/Coral_Harbour', 'UTC-05:00'),
(98, 'America/Cordoba', 'UTC-03:00'),
(99, 'America/Costa_Rica', 'UTC-06:00'),
(100, 'America/Creston', 'UTC-07:00'),
(101, 'America/Cuiaba', 'UTC-04:00'),
(102, 'America/Curacao', 'UTC-04:00'),
(103, 'America/Danmarkshavn', 'UTC+00:00'),
(104, 'America/Dawson', 'UTC-07:00'),
(105, 'America/Dawson_Creek', 'UTC-07:00'),
(106, 'America/Denver', 'UTC-06:00'),
(107, 'America/Detroit', 'UTC-04:00'),
(108, 'America/Dominica', 'UTC-04:00'),
(109, 'America/Edmonton', 'UTC-06:00'),
(110, 'America/Eirunepe', 'UTC-05:00'),
(111, 'America/El_Salvador', 'UTC-06:00'),
(112, 'America/Ensenada', 'UTC-07:00'),
(113, 'America/Fort_Nelson', 'UTC-07:00'),
(114, 'America/Fort_Wayne', 'UTC-04:00'),
(115, 'America/Fortaleza', 'UTC-03:00'),
(116, 'America/Glace_Bay', 'UTC-03:00'),
(117, 'America/Godthab', 'UTC-01:00'),
(118, 'America/Goose_Bay', 'UTC-03:00'),
(119, 'America/Grand_Turk', 'UTC-04:00'),
(120, 'America/Grenada', 'UTC-04:00'),
(121, 'America/Guadeloupe', 'UTC-04:00'),
(122, 'America/Guatemala', 'UTC-06:00'),
(123, 'America/Guayaquil', 'UTC-05:00'),
(124, 'America/Guyana', 'UTC-04:00'),
(125, 'America/Halifax', 'UTC-03:00'),
(126, 'America/Havana', 'UTC-04:00'),
(127, 'America/Hermosillo', 'UTC-07:00'),
(128, 'America/Indiana/Indianapolis', 'UTC-04:00'),
(129, 'America/Indiana/Knox', 'UTC-05:00'),
(130, 'America/Indiana/Marengo', 'UTC-04:00'),
(131, 'America/Indiana/Petersburg', 'UTC-04:00'),
(132, 'America/Indiana/Tell_City', 'UTC-05:00'),
(133, 'America/Indiana/Vevay', 'UTC-04:00'),
(134, 'America/Indiana/Vincennes', 'UTC-04:00'),
(135, 'America/Indiana/Winamac', 'UTC-04:00'),
(136, 'America/Indianapolis', 'UTC-04:00'),
(137, 'America/Inuvik', 'UTC-06:00'),
(138, 'America/Iqaluit', 'UTC-04:00'),
(139, 'America/Jamaica', 'UTC-05:00'),
(140, 'America/Jujuy', 'UTC-03:00'),
(141, 'America/Juneau', 'UTC-08:00'),
(142, 'America/Kentucky/Louisville', 'UTC-04:00'),
(143, 'America/Kentucky/Monticello', 'UTC-04:00'),
(144, 'America/Knox_IN', 'UTC-05:00'),
(145, 'America/Kralendijk', 'UTC-04:00'),
(146, 'America/La_Paz', 'UTC-04:00'),
(147, 'America/Lima', 'UTC-05:00'),
(148, 'America/Los_Angeles', 'UTC-07:00'),
(149, 'America/Louisville', 'UTC-04:00'),
(150, 'America/Lower_Princes', 'UTC-04:00'),
(151, 'America/Maceio', 'UTC-03:00'),
(152, 'America/Managua', 'UTC-06:00'),
(153, 'America/Manaus', 'UTC-04:00'),
(154, 'America/Marigot', 'UTC-04:00'),
(155, 'America/Martinique', 'UTC-04:00'),
(156, 'America/Matamoros', 'UTC-05:00'),
(157, 'America/Mazatlan', 'UTC-07:00'),
(158, 'America/Mendoza', 'UTC-03:00'),
(159, 'America/Menominee', 'UTC-05:00'),
(160, 'America/Merida', 'UTC-06:00'),
(161, 'America/Metlakatla', 'UTC-08:00'),
(162, 'America/Mexico_City', 'UTC-06:00'),
(163, 'America/Miquelon', 'UTC-02:00'),
(164, 'America/Moncton', 'UTC-03:00'),
(165, 'America/Monterrey', 'UTC-06:00'),
(166, 'America/Montevideo', 'UTC-03:00'),
(167, 'America/Montreal', 'UTC-04:00'),
(168, 'America/Montserrat', 'UTC-04:00'),
(169, 'America/Nassau', 'UTC-04:00'),
(170, 'America/New_York', 'UTC-04:00'),
(171, 'America/Nipigon', 'UTC-04:00'),
(172, 'America/Nome', 'UTC-08:00'),
(173, 'America/Noronha', 'UTC-02:00'),
(174, 'America/North_Dakota/Beulah', 'UTC-05:00'),
(175, 'America/North_Dakota/Center', 'UTC-05:00'),
(176, 'America/North_Dakota/New_Salem', 'UTC-05:00'),
(177, 'America/Nuuk', 'UTC-01:00'),
(178, 'America/Ojinaga', 'UTC-05:00'),
(179, 'America/Panama', 'UTC-05:00'),
(180, 'America/Pangnirtung', 'UTC-04:00'),
(181, 'America/Paramaribo', 'UTC-03:00'),
(182, 'America/Phoenix', 'UTC-07:00'),
(183, 'America/Port-au-Prince', 'UTC-04:00'),
(184, 'America/Port_of_Spain', 'UTC-04:00'),
(185, 'America/Porto_Acre', 'UTC-05:00'),
(186, 'America/Porto_Velho', 'UTC-04:00'),
(187, 'America/Puerto_Rico', 'UTC-04:00'),
(188, 'America/Punta_Arenas', 'UTC-03:00'),
(189, 'America/Rainy_River', 'UTC-05:00'),
(190, 'America/Rankin_Inlet', 'UTC-05:00'),
(191, 'America/Recife', 'UTC-03:00'),
(192, 'America/Regina', 'UTC-06:00'),
(193, 'America/Resolute', 'UTC-05:00'),
(194, 'America/Rio_Branco', 'UTC-05:00'),
(195, 'America/Rosario', 'UTC-03:00'),
(196, 'America/Santa_Isabel', 'UTC-07:00'),
(197, 'America/Santarem', 'UTC-03:00'),
(198, 'America/Santiago', 'UTC-03:00'),
(199, 'America/Santo_Domingo', 'UTC-04:00'),
(200, 'America/Sao_Paulo', 'UTC-03:00'),
(201, 'America/Scoresbysund', 'UTC-01:00'),
(202, 'America/Shiprock', 'UTC-06:00'),
(203, 'America/Sitka', 'UTC-08:00'),
(204, 'America/St_Barthelemy', 'UTC-04:00'),
(205, 'America/St_Johns', 'UTC-02:30'),
(206, 'America/St_Kitts', 'UTC-04:00'),
(207, 'America/St_Lucia', 'UTC-04:00'),
(208, 'America/St_Thomas', 'UTC-04:00'),
(209, 'America/St_Vincent', 'UTC-04:00'),
(210, 'America/Swift_Current', 'UTC-06:00'),
(211, 'America/Tegucigalpa', 'UTC-06:00'),
(212, 'America/Thule', 'UTC-03:00'),
(213, 'America/Thunder_Bay', 'UTC-04:00'),
(214, 'America/Tijuana', 'UTC-07:00'),
(215, 'America/Toronto', 'UTC-04:00'),
(216, 'America/Tortola', 'UTC-04:00'),
(217, 'America/Vancouver', 'UTC-07:00'),
(218, 'America/Virgin', 'UTC-04:00'),
(219, 'America/Whitehorse', 'UTC-07:00'),
(220, 'America/Winnipeg', 'UTC-05:00'),
(221, 'America/Yakutat', 'UTC-08:00'),
(222, 'America/Yellowknife', 'UTC-06:00'),
(223, 'Antarctica/Casey', 'UTC+08:00'),
(224, 'Antarctica/Davis', 'UTC+07:00'),
(225, 'Antarctica/DumontDUrville', 'UTC+10:00'),
(226, 'Antarctica/Macquarie', 'UTC+11:00'),
(227, 'Antarctica/Mawson', 'UTC+05:00'),
(228, 'Antarctica/McMurdo', 'UTC+13:00'),
(229, 'Antarctica/Palmer', 'UTC-03:00'),
(230, 'Antarctica/Rothera', 'UTC-03:00'),
(231, 'Antarctica/South_Pole', 'UTC+13:00'),
(232, 'Antarctica/Syowa', 'UTC+03:00'),
(233, 'Antarctica/Troll', 'UTC+02:00'),
(234, 'Antarctica/Vostok', 'UTC+05:00'),
(235, 'Arctic/Longyearbyen', 'UTC+02:00'),
(236, 'Asia/Aden', 'UTC+03:00'),
(237, 'Asia/Almaty', 'UTC+05:00'),
(238, 'Asia/Amman', 'UTC+03:00'),
(239, 'Asia/Anadyr', 'UTC+12:00'),
(240, 'Asia/Aqtau', 'UTC+05:00'),
(241, 'Asia/Aqtobe', 'UTC+05:00'),
(242, 'Asia/Ashgabat', 'UTC+05:00'),
(243, 'Asia/Ashkhabad', 'UTC+05:00'),
(244, 'Asia/Atyrau', 'UTC+05:00'),
(245, 'Asia/Baghdad', 'UTC+03:00'),
(246, 'Asia/Bahrain', 'UTC+03:00'),
(247, 'Asia/Baku', 'UTC+04:00'),
(248, 'Asia/Bangkok', 'UTC+07:00'),
(249, 'Asia/Barnaul', 'UTC+07:00'),
(250, 'Asia/Beirut', 'UTC+03:00'),
(251, 'Asia/Bishkek', 'UTC+06:00'),
(252, 'Asia/Brunei', 'UTC+08:00'),
(253, 'Asia/Calcutta', 'UTC+05:30'),
(254, 'Asia/Chita', 'UTC+09:00'),
(255, 'Asia/Choibalsan', 'UTC+08:00'),
(256, 'Asia/Chongqing', 'UTC+08:00'),
(257, 'Asia/Chungking', 'UTC+08:00'),
(258, 'Asia/Colombo', 'UTC+05:30'),
(259, 'Asia/Dacca', 'UTC+06:00'),
(260, 'Asia/Damascus', 'UTC+03:00'),
(261, 'Asia/Dhaka', 'UTC+06:00'),
(262, 'Asia/Dili', 'UTC+09:00'),
(263, 'Asia/Dubai', 'UTC+04:00'),
(264, 'Asia/Dushanbe', 'UTC+05:00'),
(265, 'Asia/Famagusta', 'UTC+03:00'),
(266, 'Asia/Gaza', 'UTC+03:00'),
(267, 'Asia/Harbin', 'UTC+08:00'),
(268, 'Asia/Hebron', 'UTC+03:00'),
(269, 'Asia/Ho_Chi_Minh', 'UTC+07:00'),
(270, 'Asia/Hong_Kong', 'UTC+08:00'),
(271, 'Asia/Hovd', 'UTC+07:00'),
(272, 'Asia/Irkutsk', 'UTC+08:00'),
(273, 'Asia/Istanbul', 'UTC+03:00'),
(274, 'Asia/Jakarta', 'UTC+07:00'),
(275, 'Asia/Jayapura', 'UTC+09:00'),
(276, 'Asia/Jerusalem', 'UTC+03:00'),
(277, 'Asia/Kabul', 'UTC+04:30'),
(278, 'Asia/Kamchatka', 'UTC+12:00'),
(279, 'Asia/Karachi', 'UTC+05:00'),
(280, 'Asia/Kashgar', 'UTC+06:00'),
(281, 'Asia/Kathmandu', 'UTC+05:45'),
(282, 'Asia/Katmandu', 'UTC+05:45'),
(283, 'Asia/Khandyga', 'UTC+09:00'),
(284, 'Asia/Kolkata', 'UTC+05:30'),
(285, 'Asia/Krasnoyarsk', 'UTC+07:00'),
(286, 'Asia/Kuala_Lumpur', 'UTC+08:00'),
(287, 'Asia/Kuching', 'UTC+08:00'),
(288, 'Asia/Kuwait', 'UTC+03:00'),
(289, 'Asia/Macao', 'UTC+08:00'),
(290, 'Asia/Macau', 'UTC+08:00'),
(291, 'Asia/Magadan', 'UTC+11:00'),
(292, 'Asia/Makassar', 'UTC+08:00'),
(293, 'Asia/Manila', 'UTC+08:00'),
(294, 'Asia/Muscat', 'UTC+04:00'),
(295, 'Asia/Nicosia', 'UTC+03:00'),
(296, 'Asia/Novokuznetsk', 'UTC+07:00'),
(297, 'Asia/Novosibirsk', 'UTC+07:00'),
(298, 'Asia/Omsk', 'UTC+06:00'),
(299, 'Asia/Oral', 'UTC+05:00'),
(300, 'Asia/Phnom_Penh', 'UTC+07:00'),
(301, 'Asia/Pontianak', 'UTC+07:00'),
(302, 'Asia/Pyongyang', 'UTC+09:00'),
(303, 'Asia/Qatar', 'UTC+03:00'),
(304, 'Asia/Qostanay', 'UTC+05:00'),
(305, 'Asia/Qyzylorda', 'UTC+05:00'),
(306, 'Asia/Rangoon', 'UTC+06:30'),
(307, 'Asia/Riyadh', 'UTC+03:00'),
(308, 'Asia/Saigon', 'UTC+07:00'),
(309, 'Asia/Sakhalin', 'UTC+11:00'),
(310, 'Asia/Samarkand', 'UTC+05:00'),
(311, 'Asia/Seoul', 'UTC+09:00'),
(312, 'Asia/Shanghai', 'UTC+08:00'),
(313, 'Asia/Singapore', 'UTC+08:00'),
(314, 'Asia/Srednekolymsk', 'UTC+11:00'),
(315, 'Asia/Taipei', 'UTC+08:00'),
(316, 'Asia/Tashkent', 'UTC+05:00'),
(317, 'Asia/Tbilisi', 'UTC+04:00'),
(318, 'Asia/Tehran', 'UTC+03:30'),
(319, 'Asia/Tel_Aviv', 'UTC+03:00'),
(320, 'Asia/Thimbu', 'UTC+06:00'),
(321, 'Asia/Thimphu', 'UTC+06:00'),
(322, 'Asia/Tokyo', 'UTC+09:00'),
(323, 'Asia/Tomsk', 'UTC+07:00'),
(324, 'Asia/Ujung_Pandang', 'UTC+08:00'),
(325, 'Asia/Ulaanbaatar', 'UTC+08:00'),
(326, 'Asia/Ulan_Bator', 'UTC+08:00'),
(327, 'Asia/Urumqi', 'UTC+06:00'),
(328, 'Asia/Ust-Nera', 'UTC+10:00'),
(329, 'Asia/Vientiane', 'UTC+07:00'),
(330, 'Asia/Vladivostok', 'UTC+10:00'),
(331, 'Asia/Yakutsk', 'UTC+09:00'),
(332, 'Asia/Yangon', 'UTC+06:30'),
(333, 'Asia/Yekaterinburg', 'UTC+05:00'),
(334, 'Asia/Yerevan', 'UTC+04:00'),
(335, 'Atlantic/Azores', 'UTC+00:00'),
(336, 'Atlantic/Bermuda', 'UTC-03:00'),
(337, 'Atlantic/Canary', 'UTC+01:00'),
(338, 'Atlantic/Cape_Verde', 'UTC-01:00'),
(339, 'Atlantic/Faeroe', 'UTC+01:00'),
(340, 'Atlantic/Faroe', 'UTC+01:00'),
(341, 'Atlantic/Jan_Mayen', 'UTC+02:00'),
(342, 'Atlantic/Madeira', 'UTC+01:00'),
(343, 'Atlantic/Reykjavik', 'UTC+00:00'),
(344, 'Atlantic/South_Georgia', 'UTC-02:00'),
(345, 'Atlantic/St_Helena', 'UTC+00:00'),
(346, 'Atlantic/Stanley', 'UTC-03:00'),
(347, 'Australia/ACT', 'UTC+11:00'),
(348, 'Australia/Adelaide', 'UTC+10:30'),
(349, 'Australia/Brisbane', 'UTC+10:00'),
(350, 'Australia/Broken_Hill', 'UTC+10:30'),
(351, 'Australia/Canberra', 'UTC+11:00'),
(352, 'Australia/Currie', 'UTC+11:00'),
(353, 'Australia/Darwin', 'UTC+09:30'),
(354, 'Australia/Eucla', 'UTC+08:45'),
(355, 'Australia/Hobart', 'UTC+11:00'),
(356, 'Australia/LHI', 'UTC+11:00'),
(357, 'Australia/Lindeman', 'UTC+10:00'),
(358, 'Australia/Lord_Howe', 'UTC+11:00'),
(359, 'Australia/Melbourne', 'UTC+11:00'),
(360, 'Australia/NSW', 'UTC+11:00'),
(361, 'Australia/North', 'UTC+09:30'),
(362, 'Australia/Perth', 'UTC+08:00'),
(363, 'Australia/Queensland', 'UTC+10:00'),
(364, 'Australia/South', 'UTC+10:30'),
(365, 'Australia/Sydney', 'UTC+11:00'),
(366, 'Australia/Tasmania', 'UTC+11:00'),
(367, 'Australia/Victoria', 'UTC+11:00'),
(368, 'Australia/West', 'UTC+08:00'),
(369, 'Australia/Yancowinna', 'UTC+10:30'),
(370, 'Brazil/Acre', 'UTC-05:00'),
(371, 'Brazil/DeNoronha', 'UTC-02:00'),
(372, 'Brazil/East', 'UTC-03:00'),
(373, 'Brazil/West', 'UTC-04:00'),
(374, 'CET', 'UTC+02:00'),
(375, 'CST6CDT', 'UTC-05:00'),
(376, 'Canada/Atlantic', 'UTC-03:00'),
(377, 'Canada/Central', 'UTC-05:00'),
(378, 'Canada/Eastern', 'UTC-04:00'),
(379, 'Canada/Mountain', 'UTC-06:00'),
(380, 'Canada/Newfoundland', 'UTC-02:30'),
(381, 'Canada/Pacific', 'UTC-07:00'),
(382, 'Canada/Saskatchewan', 'UTC-06:00'),
(383, 'Canada/Yukon', 'UTC-07:00'),
(384, 'Chile/Continental', 'UTC-03:00'),
(385, 'Chile/EasterIsland', 'UTC-05:00'),
(386, 'Cuba', 'UTC-04:00'),
(387, 'EET', 'UTC+03:00'),
(388, 'EST', 'UTC-05:00'),
(389, 'EST5EDT', 'UTC-04:00'),
(390, 'Egypt', 'UTC+03:00'),
(391, 'Eire', 'UTC+01:00'),
(392, 'Etc/GMT', 'UTC+00:00'),
(393, 'Etc/GMT+0', 'UTC+00:00'),
(394, 'Etc/GMT+1', 'UTC-01:00'),
(395, 'Etc/GMT+10', 'UTC-10:00'),
(396, 'Etc/GMT+11', 'UTC-11:00'),
(397, 'Etc/GMT+12', 'UTC-12:00'),
(398, 'Etc/GMT+2', 'UTC-02:00'),
(399, 'Etc/GMT+3', 'UTC-03:00'),
(400, 'Etc/GMT+4', 'UTC-04:00'),
(401, 'Etc/GMT+5', 'UTC-05:00'),
(402, 'Etc/GMT+6', 'UTC-06:00'),
(403, 'Etc/GMT+7', 'UTC-07:00'),
(404, 'Etc/GMT+8', 'UTC-08:00'),
(405, 'Etc/GMT+9', 'UTC-09:00'),
(406, 'Etc/GMT-0', 'UTC+00:00'),
(407, 'Etc/GMT-1', 'UTC+01:00'),
(408, 'Etc/GMT-10', 'UTC+10:00'),
(409, 'Etc/GMT-11', 'UTC+11:00'),
(410, 'Etc/GMT-12', 'UTC+12:00'),
(411, 'Etc/GMT-13', 'UTC+13:00'),
(412, 'Etc/GMT-14', 'UTC+14:00'),
(413, 'Etc/GMT-2', 'UTC+02:00'),
(414, 'Etc/GMT-3', 'UTC+03:00'),
(415, 'Etc/GMT-4', 'UTC+04:00'),
(416, 'Etc/GMT-5', 'UTC+05:00'),
(417, 'Etc/GMT-6', 'UTC+06:00'),
(418, 'Etc/GMT-7', 'UTC+07:00'),
(419, 'Etc/GMT-8', 'UTC+08:00'),
(420, 'Etc/GMT-9', 'UTC+09:00'),
(421, 'Etc/GMT0', 'UTC+00:00'),
(422, 'Etc/Greenwich', 'UTC+00:00'),
(423, 'Etc/UCT', 'UTC+00:00'),
(424, 'Etc/UTC', 'UTC+00:00'),
(425, 'Etc/Universal', 'UTC+00:00'),
(426, 'Etc/Zulu', 'UTC+00:00'),
(427, 'Europe/Amsterdam', 'UTC+02:00'),
(428, 'Europe/Andorra', 'UTC+02:00'),
(429, 'Europe/Astrakhan', 'UTC+04:00'),
(430, 'Europe/Athens', 'UTC+03:00'),
(431, 'Europe/Belfast', 'UTC+01:00'),
(432, 'Europe/Belgrade', 'UTC+02:00'),
(433, 'Europe/Berlin', 'UTC+02:00'),
(434, 'Europe/Bratislava', 'UTC+02:00'),
(435, 'Europe/Brussels', 'UTC+02:00'),
(436, 'Europe/Bucharest', 'UTC+03:00'),
(437, 'Europe/Budapest', 'UTC+02:00'),
(438, 'Europe/Busingen', 'UTC+02:00'),
(439, 'Europe/Chisinau', 'UTC+03:00'),
(440, 'Europe/Copenhagen', 'UTC+02:00'),
(441, 'Europe/Dublin', 'UTC+01:00'),
(442, 'Europe/Gibraltar', 'UTC+02:00'),
(443, 'Europe/Guernsey', 'UTC+01:00'),
(444, 'Europe/Helsinki', 'UTC+03:00'),
(445, 'Europe/Isle_of_Man', 'UTC+01:00'),
(446, 'Europe/Istanbul', 'UTC+03:00'),
(447, 'Europe/Jersey', 'UTC+01:00'),
(448, 'Europe/Kaliningrad', 'UTC+02:00'),
(449, 'Europe/Kiev', 'UTC+03:00'),
(450, 'Europe/Kirov', 'UTC+03:00'),
(451, 'Europe/Kyiv', 'UTC+03:00'),
(452, 'Europe/Lisbon', 'UTC+01:00'),
(453, 'Europe/Ljubljana', 'UTC+02:00'),
(454, 'Europe/London', 'UTC+01:00'),
(455, 'Europe/Luxembourg', 'UTC+02:00'),
(456, 'Europe/Madrid', 'UTC+02:00'),
(457, 'Europe/Malta', 'UTC+02:00'),
(458, 'Europe/Mariehamn', 'UTC+03:00'),
(459, 'Europe/Minsk', 'UTC+03:00'),
(460, 'Europe/Monaco', 'UTC+02:00'),
(461, 'Europe/Moscow', 'UTC+03:00'),
(462, 'Europe/Nicosia', 'UTC+03:00'),
(463, 'Europe/Oslo', 'UTC+02:00'),
(464, 'Europe/Paris', 'UTC+02:00'),
(465, 'Europe/Podgorica', 'UTC+02:00'),
(466, 'Europe/Prague', 'UTC+02:00'),
(467, 'Europe/Riga', 'UTC+03:00'),
(468, 'Europe/Rome', 'UTC+02:00'),
(469, 'Europe/Samara', 'UTC+04:00'),
(470, 'Europe/San_Marino', 'UTC+02:00'),
(471, 'Europe/Sarajevo', 'UTC+02:00'),
(472, 'Europe/Saratov', 'UTC+04:00'),
(473, 'Europe/Simferopol', 'UTC+03:00'),
(474, 'Europe/Skopje', 'UTC+02:00'),
(475, 'Europe/Sofia', 'UTC+03:00'),
(476, 'Europe/Stockholm', 'UTC+02:00'),
(477, 'Europe/Tallinn', 'UTC+03:00'),
(478, 'Europe/Tirane', 'UTC+02:00'),
(479, 'Europe/Tiraspol', 'UTC+03:00'),
(480, 'Europe/Ulyanovsk', 'UTC+04:00'),
(481, 'Europe/Uzhgorod', 'UTC+03:00'),
(482, 'Europe/Vaduz', 'UTC+02:00'),
(483, 'Europe/Vatican', 'UTC+02:00'),
(484, 'Europe/Vienna', 'UTC+02:00'),
(485, 'Europe/Vilnius', 'UTC+03:00'),
(486, 'Europe/Volgograd', 'UTC+03:00'),
(487, 'Europe/Warsaw', 'UTC+02:00'),
(488, 'Europe/Zagreb', 'UTC+02:00'),
(489, 'Europe/Zaporozhye', 'UTC+03:00'),
(490, 'Europe/Zurich', 'UTC+02:00'),
(491, 'GB', 'UTC+01:00'),
(492, 'GB-Eire', 'UTC+01:00'),
(493, 'GMT', 'UTC+00:00'),
(494, 'GMT+0', 'UTC+00:00'),
(495, 'GMT-0', 'UTC+00:00'),
(496, 'GMT0', 'UTC+00:00'),
(497, 'Greenwich', 'UTC+00:00'),
(498, 'HST', 'UTC-10:00'),
(499, 'Hongkong', 'UTC+08:00'),
(500, 'Iceland', 'UTC+00:00'),
(501, 'Indian/Antananarivo', 'UTC+03:00'),
(502, 'Indian/Chagos', 'UTC+06:00'),
(503, 'Indian/Christmas', 'UTC+07:00'),
(504, 'Indian/Cocos', 'UTC+06:30'),
(505, 'Indian/Comoro', 'UTC+03:00'),
(506, 'Indian/Kerguelen', 'UTC+05:00'),
(507, 'Indian/Mahe', 'UTC+04:00'),
(508, 'Indian/Maldives', 'UTC+05:00'),
(509, 'Indian/Mauritius', 'UTC+04:00'),
(510, 'Indian/Mayotte', 'UTC+03:00'),
(511, 'Indian/Reunion', 'UTC+04:00'),
(512, 'Iran', 'UTC+03:30'),
(513, 'Israel', 'UTC+03:00'),
(514, 'Jamaica', 'UTC-05:00'),
(515, 'Japan', 'UTC+09:00'),
(516, 'Kwajalein', 'UTC+12:00'),
(517, 'Libya', 'UTC+02:00'),
(518, 'MET', 'UTC+02:00'),
(519, 'MST', 'UTC-07:00'),
(520, 'MST7MDT', 'UTC-06:00'),
(521, 'Mexico/BajaNorte', 'UTC-07:00'),
(522, 'Mexico/BajaSur', 'UTC-07:00'),
(523, 'Mexico/General', 'UTC-06:00'),
(524, 'NZ', 'UTC+13:00'),
(525, 'NZ-CHAT', 'UTC+13:45'),
(526, 'Navajo', 'UTC-06:00'),
(527, 'PRC', 'UTC+08:00'),
(528, 'PST8PDT', 'UTC-07:00'),
(529, 'Pacific/Apia', 'UTC+13:00'),
(530, 'Pacific/Auckland', 'UTC+13:00'),
(531, 'Pacific/Bougainville', 'UTC+11:00'),
(532, 'Pacific/Chatham', 'UTC+13:45'),
(533, 'Pacific/Chuuk', 'UTC+10:00'),
(534, 'Pacific/Easter', 'UTC-05:00'),
(535, 'Pacific/Efate', 'UTC+11:00'),
(536, 'Pacific/Enderbury', 'UTC+13:00'),
(537, 'Pacific/Fakaofo', 'UTC+13:00'),
(538, 'Pacific/Fiji', 'UTC+12:00'),
(539, 'Pacific/Funafuti', 'UTC+12:00'),
(540, 'Pacific/Galapagos', 'UTC-06:00'),
(541, 'Pacific/Gambier', 'UTC-09:00'),
(542, 'Pacific/Guadalcanal', 'UTC+11:00'),
(543, 'Pacific/Guam', 'UTC+10:00'),
(544, 'Pacific/Honolulu', 'UTC-10:00'),
(545, 'Pacific/Johnston', 'UTC-10:00'),
(546, 'Pacific/Kanton', 'UTC+13:00'),
(547, 'Pacific/Kiritimati', 'UTC+14:00'),
(548, 'Pacific/Kosrae', 'UTC+11:00'),
(549, 'Pacific/Kwajalein', 'UTC+12:00'),
(550, 'Pacific/Majuro', 'UTC+12:00'),
(551, 'Pacific/Marquesas', 'UTC-09:30'),
(552, 'Pacific/Midway', 'UTC-11:00'),
(553, 'Pacific/Nauru', 'UTC+12:00'),
(554, 'Pacific/Niue', 'UTC-11:00'),
(555, 'Pacific/Norfolk', 'UTC+12:00'),
(556, 'Pacific/Noumea', 'UTC+11:00'),
(557, 'Pacific/Pago_Pago', 'UTC-11:00'),
(558, 'Pacific/Palau', 'UTC+09:00'),
(559, 'Pacific/Pitcairn', 'UTC-08:00'),
(560, 'Pacific/Pohnpei', 'UTC+11:00'),
(561, 'Pacific/Ponape', 'UTC+11:00'),
(562, 'Pacific/Port_Moresby', 'UTC+10:00'),
(563, 'Pacific/Rarotonga', 'UTC-10:00'),
(564, 'Pacific/Saipan', 'UTC+10:00'),
(565, 'Pacific/Samoa', 'UTC-11:00'),
(566, 'Pacific/Tahiti', 'UTC-10:00'),
(567, 'Pacific/Tarawa', 'UTC+12:00'),
(568, 'Pacific/Tongatapu', 'UTC+13:00'),
(569, 'Pacific/Truk', 'UTC+10:00'),
(570, 'Pacific/Wake', 'UTC+12:00'),
(571, 'Pacific/Wallis', 'UTC+12:00'),
(572, 'Pacific/Yap', 'UTC+10:00'),
(573, 'Poland', 'UTC+02:00'),
(574, 'Portugal', 'UTC+01:00'),
(575, 'ROC', 'UTC+08:00'),
(576, 'ROK', 'UTC+09:00'),
(577, 'Singapore', 'UTC+08:00'),
(578, 'Turkey', 'UTC+03:00'),
(579, 'UCT', 'UTC+00:00'),
(580, 'US/Alaska', 'UTC-08:00'),
(581, 'US/Aleutian', 'UTC-09:00'),
(582, 'US/Arizona', 'UTC-07:00'),
(583, 'US/Central', 'UTC-05:00'),
(584, 'US/East-Indiana', 'UTC-04:00'),
(585, 'US/Eastern', 'UTC-04:00'),
(586, 'US/Hawaii', 'UTC-10:00'),
(587, 'US/Indiana-Starke', 'UTC-05:00'),
(588, 'US/Michigan', 'UTC-04:00'),
(589, 'US/Mountain', 'UTC-06:00'),
(590, 'US/Pacific', 'UTC-07:00'),
(591, 'US/Samoa', 'UTC-11:00'),
(592, 'UTC', 'UTC+00:00'),
(593, 'Universal', 'UTC+00:00'),
(594, 'W-SU', 'UTC+03:00'),
(595, 'WET', 'UTC+01:00'),
(596, 'Zulu', 'UTC+00:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_phoneno`, `user_password`, `user_password_reset_token`, `user_access_level`, `user_store_id`, `user_status`) VALUES
('STF-8795', 'Staff', 'staff@pms.com', '07012345678', 'a69681bcf334ae130217fea4505fd3c994f5683f', NULL, 'Staff', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'active'),
('STF-9125', 'Manager', 'manager@pms.com', '04556879421', 'a69681bcf334ae130217fea4505fd3c994f5683f', NULL, 'Manager', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'active'),
('STF-9418', 'Admin', 'admin@pms.com', '07012345678', 'a69681bcf334ae130217fea4505fd3c994f5683f', NULL, 'Admin', '68179c85895d00c28a7c2bf4b8b8fd944445b6df10bcd7f9', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `permission_id` int(11) NOT NULL,
  `permission_access_level` varchar(200) NOT NULL,
  `permission_module` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`permission_id`, `permission_access_level`, `permission_module`) VALUES
(32, 'Staff', 'Sales Management'),
(33, 'Staff', 'Stocks Management'),
(34, 'Staff', 'Items Management');

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
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`pres_id`),
  ADD KEY `PresDocID` (`pres_doctor_id`);

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
  ADD PRIMARY KEY (`system_id`),
  ADD KEY `SystemTimezone` (`system_timezone_id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`timezone_id`);

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
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hold_sales`
--
ALTER TABLE `hold_sales`
  MODIFY `hold_sale_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_points`
--
ALTER TABLE `loyalty_points`
  MODIFY `loyalty_points_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `pres_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `receipt_customization`
--
ALTER TABLE `receipt_customization`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `system_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `timezone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=597;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `ExpenseStoreID` FOREIGN KEY (`expense_store_id`) REFERENCES `store_settings` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `PresDocID` FOREIGN KEY (`pres_doctor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD CONSTRAINT `SystemTimezone` FOREIGN KEY (`system_timezone_id`) REFERENCES `timezones` (`timezone_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
