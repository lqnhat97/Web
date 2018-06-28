-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: navistore
-- ------------------------------------------------------
-- Server version	8.0.11

use navistore;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `transaction_id` int(255) NOT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `product_id` int(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `data` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `image_link` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `sell` int(11) NOT NULL default '0',
  `stock` int (11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `payment` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_info` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `security` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birthday` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `addition` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

alter table product ADD CONSTRAINT fk_catalog foreign key (catalog_id) references catalog(id);

insert into catalog(id,name,parent_id,sort_order) values (1,'ASUS',0,0);
insert into catalog(id,name,parent_id,sort_order) values (2,'DELL',0,0);
insert into catalog(id,name,parent_id,sort_order) values (3,'ACER',0,0);
insert into catalog(id,name,parent_id,sort_order) values (4,'HP',0,0);
insert into catalog(id,name,parent_id,sort_order) values (5,'LENOVO',0,0);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (1,
1,
'Máy xách tay/ Laptop Asus X441NA-GA017T (N3350) (Vàng đồng)',
6490000.000,
'- CPU: Intel® Celeron® Processor N3350 (1.10GHz, 2M Cache, up to 2.4 GHz)<br/>
- Ram: 4GB DDR3L Bus 1600 Mhz<br/>
- Ổ cứng: HDD500GB 5400rpm Hard Drive Sata<br/>
- Card màn hình: Integrated Intel® HD Graphics<br/>
- Màn hình: 14.0 inch LED backlit HD (1366x768) 60Hz Glare Panel with 45% NTSC<br/>
- Khối lượng: 1.78kg<br/>',
0,
'images/products/Asus_X441NA.jpg',
0,
100,
100,
100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (2,
1,
'Máy xách tay/ Laptop Asus X540UP-GO106D (I3-7100U) (Đen)',
10590000.0000,
'- CPU Intel Core i3-7100U (2.4GHz, 3MB Cache)<br/>
- RAM 4GB DDR4 - 2133MHz<br/>
- HDD 1TB 5400rpm<br/>
- VGA AMD Radeon R5 M420 2GB DDR3 + Intel HD Graphics 620<br/>
- Màn hính: 15.6" HD (1366 x 768)<br/>
- Trọng lượng: ~ 2kg<br/>
- Hệ điề hành: Free DOS<br/>',
0,
'images/products/asus-vivobook-x540up-go106d-11.jpg',
0,
100,
100,
100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (3,
1,
'Máy xách tay/ Laptop Asus FX503VD-E4119T (I7-7700HQ) (Đen)',
24190000.0000,
'- CPU Intel Core i7 7700HQ (2.8GHz Up to 3.8GHz, 6MB Cache)<br/>
- RAM 8GB DDR4 - 2400MHz<br/>
- SSHD 1TB 5400rpm + 8GB NAND<br/>
- VGA NVIDIA GeForce GTX 1050 4GB GDDR5 + Intel HD Graphics 630<br/>
- Màn hình: 15.6" FHD (1920 x 1080)<br/>
- Trọng lượng: ~ 2.3kg<br/>
- Hệ điều hành: Windows 10 Home - 64 bit<br/>',
0,
'images/products/Asus-fx503vd-7.jpg',
0,
100,
100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (4,
1,
'Máy xách tay/ Laptop Asus X541UA-GO1384 (I5-7200U) (Đen)',
10390000.0000,
'- CPU Intel Core i5-7200U (2.5GHz Up to 3.1GHz, 3MB Cache)<br/>
- RAM 4GB DDR4 - 2133MHz<br/>
- HDD 1TB 5400rpm<br/>
- VGA Intel HD Graphics 620<br/>
- Màn hình: 15.6" HD (1366 x 768)<br/>
- Trọng lượng: ~ 2kg<br/>
- Hệ điều hành: Free DOS<br/>',
0,
'images/products/asus-x541ua-go1384.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (5,
1,
'Máy xách tay/ Laptop Asus S510UQ-BQ475T (I5-8250U) (Vàng đồng)',
16590000.0000,
'- CPU: Intel Core i5-8250U (1.6GHz Up to 3.4GHz, 6MB Cache)<br/>
- RAM: 1x4GB, DDR4, 2400MHz, 2 Slots<br/>
- Ổ cứng: HDD 1TB 5400rpm, Khe mở rộng: M.2 2280 Sata<br/>
- VGA: NVIDIA GeForce GT940MX 2GB GDDR5 + Intel UHD Graphics 620<br/>
- Màn hình: : 15.6 INCH, 1920x1080, Webcam HD, Led_KB<br/>
- Kết nối: 2x USB 2.0, USB 3.0, USB-C, HDMI, BT 4.2<br/>
- Khối lượng: 1.6 kg<br/>
- Hệ điều hành: Windows 10 Home SL 64bits<br/>',
0,
'images/products/laptop_asus-s510uq-bq475t-15.6_i5-8250u_4gb_hdd-1tb-trang-4.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (6,
1,
'Máy xách tay/ Laptop Asus X541UV-GO607 (I5-7200U) (Đen)',
10590000.0000,
'- CPU Intel Core i5-7200U (2.5GHz Up to 3.1GHz, 3MB Cache)<br/>
- RAM 4GB DDR4 - 2133MHz<br/>
- HDD 1TB 5400rpm<br/>
- VGA NVIDIA GeForce 920MX 2GB GDDR3 + Intel HD Graphics 620<br/>
- Màn hình: 15.6" HD (1366 x 768) TouchScreen<br/>
- Trọng lượng: ~ 2kg<br/>
- Hệ điều hành: Free DOS<br/>',
0,
'images/products/laptop-asus-x541uv-go607-15.6-i5-7200u-4gb-ddr4-hdd-1tb-den-2.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (7,
2,
'Máy xách tay/ Laptop Dell Inspiron 14 7460-N4I5259W (Đồng)',
16490000.0000,
'- CPU Intel Core i5-7200U (2.5GHz - up to 3.1Ghz. 3MB Cache)<br/>
- RAM 4GB DDR4 2400MHz<br/>
- HDD 500GB SATA 5400rpm + SSD 128GB M.2 SATA<br/>
- VGA NVIDIA GeForce 940MX 2GB GDDR5 + Intel HD Graphics 620<br/>
- Màn hình: 14" LED Full HD (1920x1080)<br/>
- Trọng lượng: 1,6kg<br/>
- Hệ điều hành: Win 10<br/>',
0,
'images/products/dell-inspiron14-7460-14i5259w.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (8,
2,
'Máy xách tay/ Laptop Dell Vostro 3468 (F3468-70088614) (Đen)',
12390000.0000,
'- CPU Intel Core i5-7200U (2.5GHz - up to 3.1Ghz. 3MB Cache)<br/>
- RAM 4GB DDR4 2400MHz<br/>
- HDD 1TB SATA 5400rpm<br/>
- VGA Intel HD Graphics 620<br/>
- Màn hình: 14" HD (1366x768)<br/>
- Trọng lượng: 1.94kg<br/>
- Hệ điều hành: Free DOS<br/>',
0,
'images/products/10031690-mtxt-dell-vostro-14-3468-i5-4-1-70088614_1.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (9,
2,
'Máy xách tay/ Laptop Dell Vostro 3568-VTI35037 (Đen)',
11090000.0000,
'- CPU Intel Core i3-7100U (2.4GHz. 3MB Cache)<br/>
- RAM 4GB DDR4 2400MHz<br/>
- HDD 1 TB SATA 5400rpm<br/>
- VGA Intel HD Graphics 520<br/>
- Màn hình: 15.6" HD (1366x768)<br/>
- Trọng lượng: 2.1kg<br/>
- Hệ điều hành: Free DOS<br/>',
0,
'images/products/10030511-mtxt-dell-vostro-15-3568-vti35037-_en.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (10,
2,
'Máy xách tay/ Laptop Dell Vostro 5568-077M52 (I5-7200U) (Vàng)',
17490000.0000,
'- CPU Intel Core i5-7200U (2.5GHz - up to 3.1Ghz. 3MB Cache)<br/>
- RAM 4GB DDR4 2400MHz<br/>
- HDD 1TB SATA 5400rpm<br/>
- VGA NVIDIA GeForce 940MX 2GB GDDR5 + Intel HD Graphics 620<br/>
- Màn hình: 15.6" HD (1366x768)<br/>
- Trọng lượng: 1,98kg<br/>
- Hệ điều hành: Win 10 Home 64<br/>',
0,
'images/products/dell-vostro-5568-077m52.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (11,
2,
'Máy xách tay/ Laptop Dell Inspiron 14 3467-C4I51107 (Đen)',
12490000.0000,
'- CPU: Intel Core i5-7200U (2.50 Ghz up to 3.10 Ghz, 3M Cache)<br/>
- RAM: 4GB DDR4 2133 MHz (2 slots)<br/>
- VGA: Intel HD Graphics 620<br/>
- Ổ cứng: HDD 1TB 5400rpm<br/>
- Khe mở rộng M2: Không hỗ trợ<br/>
- Màn hình: 14" (1366 x 768)<br/>
- Cổng giao tiếp: HDMI, 2x USB 3.0, USB 2.0<br/>
- Wifi AC, LAN 100Mbit, Bluetooth 4.1, DVD-RW, Webcam HD, Card reader<br/>
- Khối lượng: 1.81 Kg, pin 4 cell<br/>
- Hệ điều hành: Ko hệ điều hành (Không hỗ trợ Windows 7/8)<br/>',
0,
'images/products/laptop-dell_inspiron-3467-c4i51107-14-i5-7200u-4gb-ddr4-hdd-1tb-xam-2.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (12,
2,
'Máy xách tay/ Laptop Dell Vostro 5468-VTI5019W (Vàng đồng)',
16290000.0000,
'- CPU Intel Core i5-7200U (2.5GHz - up to 3.1Ghz. 3MB Cache)<br/>
- RAM 4GB DDR4 2133MHz<br/>
- HDD 500GB SATA 5400rpm<br/>
- VGA Intel HD Graphics 620<br/>
- Màn hình: 14" HD (1366x768)<br/>
- Trọng lượng: 1.7kg<br/>
- Hệ điều hành: Win 10 Home<br/>',
0,
'images/products/laptop-dell-vostro-5468-vti5019w-14-i5-7200u-4gb-ddr4-hdd-500gb-vang-2.jpg',
0,
100,100,100);



insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (13,
2,
'Máy xách tay/ Laptop Dell Inspiron 14 3467-M20NR2 (Đen)',
10490000.0000,
'○ CPU: Intel Core i3-7100U (2.4GHz. 3MB Cache)<br/>
○ RAM: 4GB DDR4 2133MHz<br/>
○ HDD: 1TB SATA 5400rpm<br/>
○ VGA: Intel HD Graphics 620<br/>
○ OS: Free DOS<br/>
○ DISPLAY: 14" HD (1366x768)<br/>
○ NETWORK: WLAN b/g/n, 10/100/1000Mbps, Bluetooth v4.0<br/>
○ OTHER: 1.81 kg<br/>
○ WARRANTY: 12 tháng<br/>',
0,
'images/products/laptop-dell-inspiron-14-3467-m20nr2.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (14,
2,
'LAPTOP DELL INSPIRON 14 5468 (K5CDP1)',
12790000.0000,
'- CPU Intel Core i5-7200U (2.5GHz - up to 3.1Ghz. 3MB Cache)<br/>
- RAM 4GB DDR4 2133MHz<br/>
- HDD 500GB SATA 5400rpm<br/>
- VGA AMD Radeon R7 M440 2GB + Intel HD Graphics 620<br/>
- Màn hình: 14" HD (1366x768)<br/>
- Trọng lượng: 2.06kg<br/>
- Hệ điều hành: Win 10 Home<br/>',
0,
'images/products/dell-inspiron14-5468-k5cdp1.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (15,
2,
'Máy xách tay/ Laptop Dell Vostro 3468 (F3468-70090697) (Đen)',
9990000.0000,
'- CPU Intel Core i3-7100U (2.4GHz. 3MB Cache)<br/>
- RAM 4GB DDR4 2133MHz<br/>
- HDD 1TB SATA 5400rpm<br/>
- VGA Intel HD Graphics 620<br/>
- Màn hình: 14" HD (1366x768)<br/>
- Trọng lượng: 1.96kg<br/>
- Hệ điều hành: Win 10 Home<br/>',
0,
'images/products/dell-vostr-3468-f3468-70090697.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (16,
2,
'LAPTOP DELL INSPIRON 14 5468 (70119161)',
18790000.0000,
'- Vi xử lý core I7<br/>
- RAM 8GB/HDD 1TB<br/>
- Đồ họa AMD Radeon 2GB<br/>
- Màn hình 14'' HD<br/>',
0,
'images/products/dell-inspiron145468-f5468-70119161.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (17,
3,
'Máy xách tay/ Laptop Acer F5-573-36LH (NX.GFKSV.003) (Bạc)',
9490000.0000,
'- CPU:Core i3-7100U<br/>
- Ram: 4GB<br/>
- Ổ cứng: 500GB<br/>
- Màn hình: 15.6 inches<br/>
- Trọng lượng: 2.4 kg<br/>
- Hệ điều hành có sẵn:Dos<br/>',
0,
'images/products/acer-f5-573-36LH.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (18,
3,
'Máy xách tay/ Laptop Acer AS VX5-591G-70XM (NH.GM2SV.001) (Đen)',
22790000.0000,
'- CPU:Core i7-7700HQ 2.8GHZ<br/>
- Ram: 8 GB<br/>
- Ổ cứng: HDD 1TB + SSD 128G<br/>
- Màn hình: 15.6 inches<br/>
- Trọng lượng: 2.6 kg<br/>
- Hệ điều hành có sẵn:Dos<br/>',
0,
'images/products/acer-as-vx5-591g-70xm.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (19,
3,
'Máy xách tay/ Laptop Acer Swift 5 SF514-51-51PT (NX.GNHSV.001) I5-7200U (Trắng)',
19990000.0000,
'- CPU Intel® Core™ i5-7200U Processor (3M Cache, up to 3.10 GHz)<br/>
- Ram 8GB DDR3<br/>
- Ổ cứng 256GB SSD<br/>
- Display 14.0" FHD IPS<br/>
- BT4/ Pin 3Cell/ Vỏ ALU/ Màu TRẮNG/ OS Windows 10SL<br/>',
0,
'images/products/acer-swift-5-sf514-51-51pt.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (20,
3,
'Máy xách tay/ Laptop Acer Swift 5 SF514-51-56F3 (NX.GLDSV.004) I5-7200U (Đen)',
19990000.0000,
'- CPU:Core™ i5-7200U Processor (3M Cache, up to 3.10 GHz)<br/>
- Ram: 8 GB<br/>
- Ổ cứng: SSD 256G<br/>
- Màn hình: 14 inches<br/>
- Trọng lượng: 1.35kg<br/>
- Hệ điều hành có sẵn:Dos<br/>',
0,
'images/products/acer-swift-5-sf514-5-56f3.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (21,
3,
'Máy xách tay/ Laptop Acer SA5-271P-53CQ (NT.LB9SV.003) I5-6200U (Bạc)',
20199000.0000,
'- CPU: Core i5-6200U (3M Cache, 2.3Ghz up to 2.8Ghz)<br/>
- Ram: 4 GB 1600 MHz<br/>
- Ổ cứng: SSD 256G<br/>
- Màn hình: 12 inches<br/>
- Trọng lượng: 1.25kg<br/>
- Hệ điều hành có sẵn: Window 10 Pro<br/>',
0,
'images/products/acer-switch-alpha-12-sa5-271p-53cq2.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (22,
3,
'Máy xách tay/ Laptop Acer G3-572-70J1 (NH.Q2CSV.003) (Đen)',
29990000.0000,
'- CPU: Intel Core i7 7th Gen 2.8 GHz<br/>
- Ram: 8GB DDR4<br/>
- Ổ cứng: HDD 1TB + SSD 128GB<br/>
- Màn hình: 15.6inches<br/>
- Trọng lượng: 2.5kg<br/>
- Hệ điều hành có sẵn: Free DOS<br/>',
0,
'images/products/acer-g3-572-70j1.jpg',
0,
100,100,100);


insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (23,
3,
'Máy xách tay/ Laptop Acer AS VX5-591G-52YZ (NH.GM2SV.002) (Đen)',
18190000.0000,
'- CPU: Intel Core i5 7300HQ 2.5GHz - 6M (up to 3.5GHz)<br/>
- Ram: 8GB DDR4<br/>
- Ổ cứng: SSD 128GB M.2 2280 + HDD 1TB 5400rpm Sata3<br/>
- Màn hình: 15.6" inches<br/>
- Trọng lượng: 2.5Kg<br/>
- Hệ điều hành có sẵn: Free DOS<br/>',
0,
'images/products/acser-as-vx5-591g-52yz.jpg',
0,
100,100,100);


insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (24,
3,
'Máy xách tay/ Laptop Acer E5-575G-39QW (NX.GDWSV.005) (Đen)',
10690000.0000,
'- CPU: Intel Core i3 7100U 2.4GHz - 3M<br/>
- Ram: 4GB DDR4<br/>
- Ổ cứng: HDD 500 GB<br/>
- Màn hình: 15.6 inches<br/>
- Trọng lượng: 2.3kg<br/>
- Hệ điều hành có sẵn: Free DOS<br/>',
0,
'images/products/laptop-acer-e5-575g-39qw-15.6-i3-7100u-4gb-ddr4-hdd-500gb-den-1.jpg',
0,
100,100,100);


insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (25,
3,
'Máy xách tay/ Laptop Acer E5-575G-50TH (NX.GL9SV.003) (Xám)',
12290000.0000,
'- CPU: Intel Core i5 7200U 2.5GHz - 3M (up to 3.1GHz)<br/>
- Ram: 4GB DDR4<br/>
- Ổ cứng: HDD 1TB<br/>
- Màn hình: 15.6 inches<br/>
- Trọng lượng: 2.23 kg<br/>
- Hệ điều hành có sẵn: Free DOS<br/>',
0,
'images/products/laptop-acer_e5-575g-50th-15.6-i3-7200u-4gb-ddr4-hdd-1tb-den-1.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (26,
3,
'Máy xách tay/ Laptop Acer E5-475-31KC (NX.GCUSV.001) (Xám)',
8690000.0000,
'- CPU: Intel Core i3 6006U 2.0GHz - 3M<br/>
- Ram: 4GB DDR4<br/>
- Ổ cứng: HDD 500GB 5400rpm Sata3<br/>
- Màn hình: 14 inches<br/>
- Trọng lượng: 2.1kg<br/>
- Hệ điều hành có sẵn: Free DOS<br/>',
0,
'images/products/acer-e5-475-31kc.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (27,
4,
'Máy xách tay/ Laptop HP Probook 450 G4-Z6T23PA (Bạc)',
17090000.0000,
'- CPU: Core i5, 7200U, 2.5 GHz, 3M, Up to: 3.1 GHz<br/>
-  RAM: 8 GB, DDR4, 2133(2400) MHz, 2 Slots, <br/>
- Ổ cứng: 500GB 7200rpm, <br/>
- Khe mở rộng: M.2 2280 Sata<br/>
- Card màn hình: NVIDIA 930MX // Intel HD Graphics 620, 2GB<br/>
- Màn hình: 15.6 inch, 1920x1080, Webcam HD<br/>
- Hệ điều hành: Ubuntu<br/>
- Trọng lượng:  2.04Kg<br/>
- Kết nối: 2x USB 2.0, USB 3.0, USB-C, D-Sub, HDMI, BT 4.2, 4Cell, Finger print.<br/>',
0,
'images/products/hp-probook-450-g4-z6t23pa.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (28,
4,
'Máy xách tay/ Laptop HP Pavilion 15-au112TU (Y4G17PA) (Vàng)',
10990000.0000,
'- CPU: Core i5 7200U<br/>
- RAM/ HDD: 4Gb/ 500Gb<br/>
- Màn hình: 15.6Inch<br/>
- VGA: VGA onboard, Intel HD Graphics 620<br/>
- HĐH: Win10SL<br/>
- Màu sắc/ Chất liệu: Gold<br/>',
0,
'images/products/laptop-hp-pavilion-15-au112tu-y4g17pa-mau-vang-1.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (29,
4,
'Máy xách tay/ Laptop HP Probook 430 G4-1RR41PA (Bạc)',
17790000.0000,
'- CPU: Intel Core i7-7500U<br/>
- Ram: 4GB<br/>
- Ổ cứng: SSD 256GB<br/>
- Màn hình: 13.3" HD<br/>
- Trọng lượng: 1.5 Kg<br/>
- Hệ điều hành có sẵn: Free Dos<br/>',
0,
'images/products/hp_probook_430_g4_1.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (30,
4,
'Máy xách tay/ Laptop HP Spectre x360-ac028TU (1HP09PA) (Đen)',
30990000.0000,
'- CPU: Intel Core i7-7500U<br/>
- Ram: 8GB<br/>
- Ổ cứng: SSD 256GB<br/>
- Màn hình: 13.3" FHD<br/>
- Trọng lượng: 1.32 Kg<br/>
- Hệ điều hành có sẵn: Window 10 Home<br/>',
0,
'images/products/laptop-hp-spectre-x360-ac028tu-1hp09pa-3.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (31,
4,
'Máy xách tay/ Laptop HP 15-bs553TU (2GE36PA) (Đen)',
6990000.0000,
'- CPU: Intel Pentinum N3710<br/>
- Ram: 4GB<br/>
- Ổ cứng: HDD 500GB<br/>
- Màn hình: 15.6" HD<br/>
- Trọng lượng: 1.9 Kg<br/>
- Hệ điều hành có sẵn: Free Dos<br/>',
0,
'images/products/hp-15-bs553tu-03.jpg',
0,
100,100,100);


insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (32,
4,
'Máy xách tay/ Laptop HP Pavilion 15-au119TX (Y4G52PA) (Bạc)',
11590000.0000,
'- CPU : Intel Core i5 7200U 2.5GHz - 3M (up to 3.1GHz)<br/>
- RAM : 1x 4GB DDR4/2400 (2 slots),<br/>
- HDD 500GB 5400rpm Sata3 with HP 3D DriveGuard<br/>
- Graphics : NVIDIA 940MX 2GB // Intel HD Graphics 620<br/>
- Display : 15.6'' HD SVA<br/>
- Optical and Multimedia : DVD-RW, Webcam HD Lan 100, Wifi N, Bluetooth 4.0<br/>
- Weight and battery : 2Kg - 2Cell<br/>
- Ports : 2x USB 3.0, USB 2.0, HDMI, Reader<br/>
- OS : Windows 10 Home SL 64bits<br/>
- Bảo hành 12 tháng<br/>',
0,
'images/products/hp-pavilion-15-au119tx.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (33,
4,
'Máy xách tay/ Laptop HP Pavilion X360 14-ba062TU (2GV24PA) (Bạc)',
12490000.0000,
'- CPU: Intel Core i3-7100U<br/>
- Ram: 4GB<br/>
- Ổ cứng: HDD 500GB<br/>
- Màn hình: 14.0" HD<br/>
- Trọng lượng: 1.7 kg<br/>
- Hệ điều hành có sẵn: Win 10<br/>',
0,
'images/products/hp-pavilion-x360-14-ba062TU.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (34,
4,
'Máy xách tay/ Laptop HP Pavilion 15-cc048TX (2GV11PA) (Vàng)',
15100000.0000,
'- CPU:Intel Core i7 7500U<br/>
- Ram:8GB<br/>
- Ổ cứng: HDD 1TB<br/>
- Màn hình: 15.6" HD<br/>
- Trọng lượng: 2.16 kg<br/>
- Hệ điều hành có sẵn: Free Dos<br/>',
0,
'images/products/hp-pavilion-15-cc048tx.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (35,
4,
'Máy xách tay/ Laptop HP Pavilion 14-bf015TU (2GE47PA) (Hồng)',
12090000.0000,
'- CPU: Intel Core i3-7100U<br/>
- Ram: 4GB<br/>
- Ổ cứng: HDD 1TB<br/>
- Màn hình: 14.0" FHD<br/>
- Trọng lượng: 1.63 kg<br/>
- Hệ điều hành có sẵn: Free Dos<br/>',
0,
'images/products/hp-pavilion-14-bf015tu.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (36,
4,
'Máy xách tay/ Laptop HP Pavilion 14-bf016TU (2GE48PA) (Bạc)',
11790000.0000,
'○ CPU: Intel® Core™ i3-7100U 2.4Ghz<br/>
○ RAM: 4GB DDR4 2133Mhz<br/>
○ HDD: 1TB 5400rpm<br/>
○ VGA: Intel HD Graphics 620<br/>
○ OS: Free DOS <br/>
○ DISPLAY: 14"" diagonal FHD IPS BrightView micro-edge WLED-backlit <br/>
○ NETWORK: Intel 802.11b/g/n,Bluetooth v4.0 <br/>
○ OTHER: 1.62kg, USB 3.1, 1x HDMI<br/>
○ WARRANTY: 12 Tháng<br/>',
0,
'images/products/hp-pavilion-14-bf016tu.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (37,
5,
'Máy xách tay/ Laptop Lenovo G5070-6676 (Đen)',
7890000.0000,
'- CPU: i3-4005U<br/>
- Ram: 2GB<br/>
- Ổ cứng: HDD 500GB <br/>
- Màn hình: 15.6" HD<br/>
- Trọng lượng: 2.3kg<br/>
- Hệ điều hành có sẵn: Free Dos<br/>',
0,
'images/products/lenovo-g5070-5942-3771-black_1.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (38,
5,
'Máy xách tay/ Laptop Lenovo Yoga 520-14IKB-80X80109VN (I5-7200U) (Xám)',
14700000.0000,
'- CPU: Core i5, 7200U, 2.5GHz, 3M, Up to: 3.1GHz<br/>
- RAM: 1x4GB, DDR4, 2400MHz, 1 Slot<br/>
- HDD: 1TB 5400rpm, Khe mở rộng: M.2 2280 (PCIe 3 x4)<br/>
- Card màn hình: Intel HD Graphics 620, SHARE<br/>
- Màn hình: 14 INCH, 1920x1080, Touch Screen, Webcam HD, Led_KB<br/>
- Kết nối: USB 3.0, USB 2.0, USB-C, HDMI, BT 4.1, 2 Cell, Finger print<br/>
- Khối lượng: 1.74 kg<br/>
- Hệ điều hành có sẵn: Windows 10 Home SL 64bit<br/>',
0,
'images/products/laptop-lenovo-yoga-520-14ikb.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (39,
5,
'Máy xách tay/ Laptop Lenovo Ideapad 320-15IKB 81BG00DYVN (i5-8250U) (Xám)',
12990000.0000,
'- CPU Intel® Core™ i5-8250U Processor (6M Cache, up to 3.40 GHz)<br/>
- RAM 4GB DDR4<br/>
- HDD 1TB 5400rpm<br/>
- Display 15.6" FHD<br/>
- HĐH Windows 10<br/>',
0,
'images/products/lenovo_ideapad320.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (40,
5,
'Máy xách tay/ Laptop Lenovo Yoga 520-14IKB-80X80106VN (I3-7130U) (Xám)',
11590000.0000,
'- CPU: Intel Core i3 Kabylake, 7130U, 2.70 GHz<br/>
- RAM: 4 GB, DDR4 (1 khe), 2133 MHz<br/>
- Ổ cứng: HDD: 500 GB<br/>
- Màn hình: 14 inch, HD (1366 x 768)<br/>',
0,
'images/products/lenovo-yoga-520-14ikb-i3-7130u-80x80106vn-xam-3-2-org.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (41,
5,
'Máy xách tay/ Laptop Lenovo Yoga 520-14IKBR-81C8006AVN (I5-8250U) (Vàng)',
11590000.0000,
'- Dung lượng RAM khá lớn với 4GB.<br/>
- Màn hình có độ phân giải Full UHD vô cùng sắc nét.<br/>
- Cấu hình cực kì mạnh mẽ.<br/>
- Kiểu dáng nhỏ gọn, dễ dàng mang theo.<br/>
- Màu sắc tinh tế, rất được ưa thích.<br/>',
0,
'images/products/lenovo-yoga520-14IKBR-81C800.jpg',
0,
100,100,100);

insert into product(id,catalog_id,name,price,content,discount,image_link,
created,view,sell,stock) 
values (42,
5,
'Máy xách tay/ Laptop Lenovo Ideapad 320-15IKB 81BG00E1VN (i7-8550U) (Xám)',
16990000.0000,
'- CPU: Core i7, 8550U, 1.8GHz, 8M, Up to: 4.0GHz<br/>
- Ram: 4GB Onboard, DDR4, 2133MHz, 1 Slot<br/>
- Ổ cứng: HDD 1TB 5400rpm<br/>
- Card màn hình: NVIDIA GeForce MX150 // Intel UHD Graphics 620, 2GB<br/>
- Màn hình: 15.6 INCH, 1920x1080, Webcam HD<br/>
- Kết nối: USB 3.0, USB-C, HDMI, BT 4.1<br/>
- Hệ điều hành có sẵn: Windows 10 Home SL 64bit<br/>',
0,
'images/products/lenovo-ideapad320-15IKB81BG.jpg',
0,
100,100,100);



-- Dump completed on 2018-06-19 23:22:31


