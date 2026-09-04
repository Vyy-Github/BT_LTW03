CREATE DATABASE  IF NOT EXISTS `ltwebdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ltwebdb`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: ltwebdb
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categoryid` int NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `images` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Điện thoại','https://images.unsplash.com/photo-1518770660439-4636190af475',1),(2,'Laptop','https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',1),(3,'Phụ kiện','https://images.unsplash.com/photo-1486006920555-c77dce18193b',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productid` int NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `images` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `categoryid` int DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `categoryid` (`categoryid`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 15 Pro Max',29990000,'Titan tự nhiên, chip A17 Pro mạnh mẽ','https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-blue-thumbnew-600x600.jpg','2026-09-01 08:40:20',1),(2,'Samsung Galaxy S24 Ultra',26990000,'Galaxy AI, camera 200MP zoom đỉnh cao','https://cdn.tgdd.vn/Products/Images/42/307174/samsung-galaxy-s24-ultra-grey-thumbnew-600x600.jpg','2026-09-01 08:40:20',1),(3,'MacBook Air M3 13 inch',27490000,'Siêu mỏng nhẹ, pin 18 tiếng, chip M3','https://cdn.tgdd.vn/Products/Images/44/322610/macbook-air-13-inch-m3-gray-thumb-600x600.jpg','2026-09-01 08:40:20',2),(4,'Laptop Asus Zenbook 14 OLED',24990000,'Màn hình OLED 3K, Intel Core Ultra','https://cdn.tgdd.vn/Products/Images/44/320703/asus-zenbook-14-oled-ux3405ma-ultra-5-125h-600x600.jpg','2026-09-01 08:40:20',2),(5,'Tai nghe Sony WH-1000XM5',6990000,'Chống ồn chủ động đỉnh cao, âm thanh Hi-Res','https://cdn.tgdd.vn/Products/Images/54/281961/bluetooth-sony-wh-1000xm5-den-thumb-600x600.jpg','2026-09-01 08:40:20',3),(6,'Bàn phím cơ không dây Logitech',2190000,'Switch tactile êm ái, kết nối đa thiết bị','https://cdn.tgdd.vn/Products/Images/86/289063/ban-phim-khong-day-logitech-mx-keys-mini-xam-thumb-600x600.jpg','2026-09-01 08:40:20',3),(7,'Chuột Logitech MX Master 3S',2490000,'Cảm biến 8K DPI, cuộn MagSpeed siêu tốc','https://cdn.tgdd.vn/Products/Images/86/284164/chuot-khong-day-logitech-mx-master-3s-den-thumb-600x600.jpg','2026-09-01 08:40:20',3),(8,'iPhone 15 Pro Max',29990000,'Titan tự nhiên, chip A17 Pro mạnh mẽ','https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-blue-thumbnew-600x600.jpg','2026-09-01 08:40:45',1),(9,'Samsung Galaxy S24 Ultra',26990000,'Galaxy AI, camera 200MP zoom đỉnh cao','https://cdn.tgdd.vn/Products/Images/42/307174/samsung-galaxy-s24-ultra-grey-thumbnew-600x600.jpg','2026-09-01 08:40:45',1),(10,'MacBook Air M3 13 inch',27490000,'Siêu mỏng nhẹ, pin 18 tiếng, chip M3','https://cdn.tgdd.vn/Products/Images/44/322610/macbook-air-13-inch-m3-gray-thumb-600x600.jpg','2026-09-01 08:40:45',2),(11,'Laptop Asus Zenbook 14 OLED',24990000,'Màn hình OLED 3K, Intel Core Ultra','https://cdn.tgdd.vn/Products/Images/44/320703/asus-zenbook-14-oled-ux3405ma-ultra-5-125h-600x600.jpg','2026-09-01 08:40:45',2),(12,'Tai nghe Sony WH-1000XM5',6990000,'Chống ồn chủ động đỉnh cao, âm thanh Hi-Res','https://cdn.tgdd.vn/Products/Images/54/281961/bluetooth-sony-wh-1000xm5-den-thumb-600x600.jpg','2026-09-01 08:40:45',3),(13,'Bàn phím cơ không dây Logitech',2190000,'Switch tactile êm ái, kết nối đa thiết bị','https://cdn.tgdd.vn/Products/Images/86/289063/ban-phim-khong-day-logitech-mx-keys-mini-xam-thumb-600x600.jpg','2026-09-01 08:40:45',3),(14,'Chuột Logitech MX Master 3S',2490000,'Cảm biến 8K DPI, cuộn MagSpeed siêu tốc','https://cdn.tgdd.vn/Products/Images/86/284164/chuot-khong-day-logitech-mx-master-3s-den-thumb-600x600.jpg','2026-09-01 08:40:45',3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `otp` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleid` int DEFAULT '2',
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','123','admin@example.com','Quản Trị Viên',1,NULL,1),('pnhatvy','123','kevin7a1lxag@gmail.com','Nhật Vy',1,NULL,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-04 17:53:34
