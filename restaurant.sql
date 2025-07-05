-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 15, 2025 at 04:28 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `itemName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `catName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `itemName`, `price`, `image`, `quantity`, `catName`, `email`, `total_price`) VALUES
(1, 'French Fries', 760.00, 'fries.jpg', 1, 'Appetizer', 'asna@gmail.com', 760.00),
(2, 'BBQ Chicken Pizza', 1000.00, 'bbq-pizza.jpg', 1, 'Pizza', 'zidnan@gmail.com', 1000.00),
(3, 'Strawberry Mocktail', 550.00, 'strawberry-drink.png', 2, 'Beverage', 'zidnan@gmail.com', 1100.00);

-- --------------------------------------------------------

--
-- Table structure for table `menucategory`
--

CREATE TABLE `menucategory` (
  `catId` int NOT NULL,
  `catName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menucategory`
--

INSERT INTO `menucategory` (`catId`, `catName`, `dateCreated`) VALUES
(1, 'Appetizer', '2024-07-26 12:31:55'),
(2, 'Burger', '2024-07-26 12:31:55'),
(3, 'Pizza', '2024-07-26 12:33:18'),
(4, 'Beverage', '2024-07-26 12:33:18');

-- --------------------------------------------------------

--
-- Table structure for table `menuitem`
--

CREATE TABLE `menuitem` (
  `itemId` int NOT NULL,
  `itemName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `catName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('Available','Unavailable','','') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Available',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime NOT NULL,
  `is_popular` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menuitem`
--

INSERT INTO `menuitem` (`itemId`, `itemName`, `catName`, `price`, `status`, `description`, `image`, `dateCreated`, `updatedDate`, `is_popular`) VALUES
(3, 'French Fries', 'Appetizer', '2.49', 'Unavailable', ' Crispy, golden-brown fries seasoned to perfection, served with your choice of dipping sauces.', 'fries.jpg', '2024-07-26 09:09:35', '2024-07-26 14:39:35', 0),
(5, 'Veggie Supreme Pizza', 'Pizza', '6.99', 'Available', 'Our Veggie Supreme Pizza, is loaded with a colorful array of seasonal vegetables, rich tomato sauce, and a generous layer of gooey cheese.', 'veggie-pizza.jpg', '2024-07-26 09:10:36', '2024-07-26 14:40:36', 1),
(6, 'Prawn Pizza', 'Pizza', '9.49', 'Available', 'Dive into our Prawn Pizza, topped with succulent, seasoned prawns, tangy tomato sauce, and a blend of melted cheeses.', 'prawn-piza.jpg', '2024-07-26 09:12:03', '2024-07-26 14:42:03', 0),
(7, 'Cheese Pizza', 'Pizza', '6.99', 'Unavailable', 'Indulge in the classic simplicity of our Cheese Pizza, topped with a generous layer of gooey mozzarella and a perfectly seasoned tomato sauce.', 'cheese-pizza.jpg', '2024-07-26 09:13:09', '2024-07-26 14:43:09', 1),
(8, 'BBQ Chicken Pizza', 'Pizza', '8.49', 'Available', 'Savor the smoky goodness of our BBQ Chicken Pizza, featuring tender chicken pieces smothered in barbecue sauce.', 'bbq-pizza.jpg', '2024-07-26 09:13:45', '2024-07-26 14:43:45', 0),
(9, 'Firebird Burger', 'Burger', '12.49', 'Available', 'Crispy fried chicken breast, shredded iceberg lettuce, melted white cheddar, topped with our spicy mayo and sauces on a toasted bun.', 'firebird-burger.jpeg', '2024-08-03 14:37:51', '2024-08-03 16:37:09', 0),
(10, 'Hybrid Burger', 'Burger', '10.99', 'Available', 'Crispy chicken breast, melted white cheddar, char-grilled beef patty, chicken bacon with our signature sauces on a toasted bun.', 'hybrid-burger.jpeg', '2024-08-03 15:07:32', '2024-08-03 17:07:01', 1),
(11, 'BBQ Chicken Burger', 'Burger', '11.49', 'Available', 'Char-grilled beef patty, iceberg lettuce, red onions, melted white cheddar, BBQ sauce topped with our sauces on a toasted bun. ', 'bbq-burger.jpeg', '2024-08-03 15:09:50', '2024-08-03 17:07:34', 1),
(12, 'Crispy Chicken Burger', 'Burger', '11.49', 'Unavailable', 'Marinated crispy fried chicken breast, cheddar cheese, shredded iceberg lettuce topped with our signature mayo and sauces on a toasted bun', 'crispy-burger.jpeg', '2024-08-03 15:21:27', '2024-08-03 17:20:42', 0),
(13, 'Strawberry Mocktail', 'Beverage', '3.49', 'Available', 'Refreshingly sweet and tangy, this Strawberry Mocktail blends ripe strawberries with a splash of citrus, creating a vibrant.', 'strawberry-drink.png', '2024-08-03 14:18:11', '2024-08-03 16:09:51', 0),
(14, 'Orange Sizzler', 'Beverage', '2.49', 'Available', 'Enjoy the zing of our Orange Sizzler, a mix of fresh orange juice with a fizzy twist, perfect for adding a burst of to your day.', 'orange-drink.png', '2024-08-03 14:24:49', '2024-08-03 16:24:05', 1),
(15, 'Dragon Fruit Mojito', 'Beverage', '4.49', 'Available', 'Experience a tropical twist with our Dragon Fruit Mojito, featuring exotic dragon fruit, mint, and lime, all muddled together.', 'Dragon-fruit-drink.png', '2024-08-03 14:25:57', '2024-08-03 16:24:54', 0),
(16, 'Watermelon Smoothie', 'Beverage', '2.99', 'Available', 'A blend of juicy watermelon and a hint of lime, delivering a hydrating and deliciously fruity escape from the heat.', 'watermelon-drink.png', '2024-08-03 14:26:56', '2024-08-03 16:26:00', 0),
(33, 'Garlic Bread', 'Appetizer', '2.49', 'Available', 'Golden, toasted bread topped with buttery garlic and herbs. Crispy and savory, perfect for starting your meal.', 'garlic-bread.avif', '2024-08-08 16:37:43', '2024-08-08 22:07:43', 1),
(34, 'Chicken Wing', 'Appetizer', '3.29', 'Available', 'Tender, juicy chicken wings tossed in your choice of flavorful sauces. Perfectly crispy on the outside and succulent on the inside.', 'chicken-wing.avif', '2024-08-08 16:43:59', '2024-08-08 22:13:59', 0),
(35, 'Samosa', 'Appetizer', '1.49', 'Available', 'Crispy, golden-brown samosas filled with a savory blend of spiced potatoes and peas.', 'samosa.avif', '2024-08-08 16:45:44', '2024-08-08 22:15:44', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `pmode` enum('Cash','Card','Takeaway','') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Cash',
  `payment_status` enum('Pending','Successful','Rejected','') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Pending',
  `sub_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` enum('Pending','Completed','Cancelled','Processing','On the way') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Pending',
  `cancel_reason` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `email`, `firstName`, `lastName`, `phone`, `address`, `pmode`, `payment_status`, `sub_total`, `grand_total`, `order_date`, `order_status`, `cancel_reason`, `note`) VALUES
(54, 'preethi@gmail.com', 'Preethi', 'Suresh', '9999999999', 'Galle Road', 'Cash', 'Pending', 1910.00, 2040.00, '2024-08-11 18:00:04', 'Processing', '', 'Add extra cheese'),
(55, 'zidnan@gmail.com', 'Zidnan', 'Ahamad', '2222222222', 'Kolonnawa', 'Cash', 'Pending', 7420.00, 7550.00, '2024-08-10 18:02:26', 'On the way', '', 'Please make the Burger extra spicy'),
(56, 'zidnan@gmail.com', 'Mohamed', 'Muhadh', '0000000000', 'Kolonnawa', 'Takeaway', 'Successful', 1150.00, 1150.00, '2024-08-11 18:04:16', 'Completed', '', ''),
(57, 'jhon@gmail.com', 'Jhon', 'Paul', '7777777777', 'Colombo 15', 'Takeaway', 'Successful', 5720.00, 5720.00, '2024-08-08 18:05:26', 'Completed', '', ''),
(58, 'zidnan@gmail.com', 'Zidnan', 'Ahamad', '4444444444', 'Colombo 12', 'Takeaway', 'Pending', 2700.00, 2700.00, '2024-08-10 20:12:14', 'Cancelled', 'Waiting time is too long.', ''),
(61, '', '', '', '', '', '', 'Pending', 0.00, 0.00, '2025-04-13 00:57:55', 'Pending', NULL, ''),
(68, 'harshithatla2@gmail.com', 'Harshith', 'Atla', '7680934578', '1-302', 'Takeaway', 'Pending', 350.00, 350.00, '2025-04-13 01:10:55', 'Pending', NULL, ''),
(69, 'harshithatla2@gmail.com', 'Harshith', 'Atla', '8945839043', '345', 'Takeaway', 'Pending', 350.00, 350.00, '2025-04-13 01:11:42', 'Pending', NULL, ''),
(70, 'harshithatla2@gmail.com', 'Harshith', 'Atla', '8756987451', '302-1', 'Takeaway', 'Pending', 830.00, 830.00, '2025-04-13 20:55:38', 'Pending', NULL, ''),
(71, 'harshithatla2@gmail.com', 'Harshith', 'Atla', '7680934578', '302-1', 'Takeaway', 'Pending', 1180.00, 1180.00, '2025-04-13 21:09:39', 'Pending', NULL, ''),
(72, 'harshithatla2@gmail.com', 'Harshith', 'Atla', '7680934578', '302-1', 'Takeaway', 'Pending', 1800.00, 1800.00, '2025-04-13 22:45:16', 'Pending', NULL, ''),
(73, 'harshithatla2@gmail.com', 'Harshith', 'Atla', '7680934578', '302', 'Takeaway', 'Pending', 350.00, 350.00, '2025-04-13 23:01:21', 'Processing', NULL, ''),
(75, 'harshithatla2@gmail.com', 'Harshith', 'Atla', '7680934578', '302-1', 'Takeaway', 'Pending', 5.78, 5.78, '2025-04-14 15:46:36', 'Processing', NULL, ''),
(77, 'harshithatla2@gmail.com', 'Harshith', 'Atla', '7680934568', '302', 'Takeaway', 'Pending', 5.78, 5.78, '2025-04-14 19:24:45', 'Processing', NULL, ''),
(78, 'harshithatla2@gmail.com', 'Harshith', 'Atla', '7680934576', 'Flat-302, H.I.G BLOCK-5, A.P.H.B COLONY, Kommadi, Madhurawada', 'Takeaway', 'Pending', 12.78, 12.78, '2025-04-14 19:26:45', 'Processing', NULL, ''),
(79, 'harshithatla2@gmail.com', 'Harshith', 'Atla', '1234567890', '567', 'Takeaway', 'Pending', 5.78, 5.78, '2025-04-14 20:20:22', 'Processing', NULL, ''),
(80, 'dannyjoe@gmail.com', 'DANIEL', 'JOE', '8438431592', 'CEDAR DELL WEST DARTMOUTH', 'Cash', 'Pending', 18.96, 28.96, '2025-04-14 20:55:09', 'Processing', NULL, ''),
(81, 'johnsmith@gmail.com', 'John', 'Smith', '6789542031', '145 pleasant st', 'Takeaway', 'Pending', 5.78, 5.78, '2025-04-15 00:15:15', 'Processing', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `itemName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `itemName`, `image`, `quantity`, `price`, `total_price`) VALUES
(122, 54, 'Garlic Bread', 'garlic-bread.avif', 1, 350, 350.00),
(123, 54, 'French Fries', 'fries.jpg', 1, 760, 760.00),
(124, 54, 'Cheese Pizza', 'cheese-pizza.jpg', 1, 800, 800.00),
(125, 55, 'Dragon Fruit Mojito', 'Dragon-fruit-drink.png', 1, 760, 760.00),
(126, 55, 'BBQ Chicken Burger', 'bbq-burger.jpeg', 3, 1900, 5700.00),
(127, 55, 'Chicken Wing', 'chicken-wing.avif', 2, 480, 960.00),
(128, 56, 'Garlic Bread', 'garlic-bread.avif', 1, 350, 350.00),
(129, 56, 'Cheese Pizza', 'cheese-pizza.jpg', 1, 800, 800.00),
(130, 57, 'French Fries', 'fries.jpg', 2, 760, 1520.00),
(131, 57, 'Firebird Burger', 'firebird-burger.jpeg', 2, 2100, 4200.00),
(132, 58, 'Garlic Bread', 'garlic-bread.avif', 3, 350, 1050.00),
(133, 58, 'Strawberry Mocktail', 'strawberry-drink.png', 3, 550, 1650.00),
(134, 68, 'Garlic Bread', 'garlic-bread.avif', 1, 350, 350.00),
(135, 69, 'Garlic Bread', 'garlic-bread.avif', 1, 350, 350.00),
(136, 70, 'Garlic Bread', 'garlic-bread.avif', 1, 350, 350.00),
(137, 70, 'Chicken Wing', 'chicken-wing.avif', 1, 480, 480.00),
(138, 71, 'Garlic Bread', 'garlic-bread.avif', 2, 350, 700.00),
(139, 71, 'Chicken Wing', 'chicken-wing.avif', 1, 480, 480.00),
(140, 72, 'Hybrid Burger', 'hybrid-burger.jpeg', 1, 1800, 1800.00),
(141, 73, 'Garlic Bread', 'garlic-bread.avif', 1, 350, 350.00),
(142, 74, 'Samosa', 'samosa.avif', 1, 1, 1.49),
(143, 74, 'Chicken Wing', 'chicken-wing.avif', 1, 3, 3.29),
(144, 74, 'Prawn Pizza', 'prawn-piza.jpg', 1, 9, 9.49),
(145, 75, 'Chicken Wing', 'chicken-wing.avif', 1, 3, 3.29),
(146, 75, 'Garlic Bread', 'garlic-bread.avif', 1, 2, 2.49),
(147, 76, 'Garlic Bread', 'garlic-bread.avif', 1, 2, 2.49),
(148, 76, 'Chicken Wing', 'chicken-wing.avif', 1, 3, 3.29),
(149, 77, 'Garlic Bread', 'garlic-bread.avif', 1, 2, 2.49),
(150, 77, 'Chicken Wing', 'chicken-wing.avif', 1, 3, 3.29),
(151, 78, 'Chicken Wing', 'chicken-wing.avif', 1, 3, 3.29),
(152, 78, 'Prawn Pizza', 'prawn-piza.jpg', 1, 9, 9.49),
(153, 79, 'Garlic Bread', 'garlic-bread.avif', 1, 2, 2.49),
(154, 79, 'Chicken Wing', 'chicken-wing.avif', 1, 3, 3.29),
(155, 80, 'Garlic Bread', 'garlic-bread.avif', 2, 2, 4.98),
(156, 80, 'Veggie Supreme Pizza', 'veggie-pizza.jpg', 2, 7, 13.98),
(157, 81, 'Garlic Bread', 'garlic-bread.avif', 1, 2, 2.49),
(158, 81, 'Chicken Wing', 'chicken-wing.avif', 1, 3, 3.29);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `noOfGuests` int NOT NULL,
  `reservedTime` time NOT NULL,
  `reservedDate` date NOT NULL,
  `reservedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','On Process','Completed','Cancelled') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Pending',
  `reservation_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`email`, `name`, `contact`, `noOfGuests`, `reservedTime`, `reservedDate`, `reservedAt`, `status`, `reservation_id`) VALUES
('asna@gmail.com', 'Asna Assalam', '0000000000', 6, '12:00:00', '2024-07-31', '2024-07-29 15:35:05', 'Completed', 1),
('zidnan@gmail.com', 'Zidnan', '1111111111', 5, '10:00:07', '2024-08-11', '2024-08-10 18:14:55', 'Pending', 2),
('preethi@gmail.com', 'Preethi Suresh', '5555555', 2, '06:30:59', '2024-08-10', '2024-08-03 18:15:54', 'On Process', 3),
('jhon@gmail.com', 'Jhon Paul', '334455', 9, '20:45:59', '2024-08-09', '2024-08-05 18:16:38', 'Cancelled', 4),
('dannyjoe@gmail.com', 'Danny', '8438431585', 4, '00:00:20', '2025-04-16', '2025-04-14 20:39:37', 'Pending', 7),
('johnsmith@gmail.com', 'John', '5670981234', 2, '00:00:20', '2025-04-15', '2025-04-15 00:18:01', 'Pending', 8);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `contact`, `password`, `profile_image`) VALUES
(1, 'Harshith', 'Atla', 'harshithatla2@gmail.com', '7680934578', 'harshitth', 'default.jpg'),
(3, 'Daniel', 'Joe', 'dannyjoe@gmail.com', '8438432568', 'dannyjoe@gmail.com', 'default.jpg'),
(4, 'John', 'Smith', 'johnsmith@gmail.com', '6789542031', 'johnsmith', 'default.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
