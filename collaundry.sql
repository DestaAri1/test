-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: collaundry
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `db_biodata`
--

DROP TABLE IF EXISTS `db_biodata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_biodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `no_hp` int(13) NOT NULL,
  `email` varchar(30) NOT NULL,
  `id_login_user` int(11) NOT NULL,
  `id_alamat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_login_user` (`id_login_user`),
  KEY `id_alamat` (`id_alamat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_biodata`
--

LOCK TABLES `db_biodata` WRITE;
/*!40000 ALTER TABLE `db_biodata` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_biodata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_login_admin`
--

DROP TABLE IF EXISTS `db_login_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_login_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_login_admin`
--

LOCK TABLES `db_login_admin` WRITE;
/*!40000 ALTER TABLE `db_login_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_login_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_login_user`
--

DROP TABLE IF EXISTS `db_login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_login_user`
--

LOCK TABLES `db_login_user` WRITE;
/*!40000 ALTER TABLE `db_login_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pembayaran`
--

DROP TABLE IF EXISTS `db_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `harga_total` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_pemesanan` (`id_pemesanan`),
  CONSTRAINT `db_pembayaran_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `db_pemesanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pembayaran`
--

LOCK TABLES `db_pembayaran` WRITE;
/*!40000 ALTER TABLE `db_pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pemesanan`
--

DROP TABLE IF EXISTS `db_pemesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_pemesanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `berat_kisaran` int(10) NOT NULL,
  `alamat` text NOT NULL,
  `jarak_kisaran` int(10) NOT NULL,
  `no_hp` int(13) NOT NULL,
  `email` varchar(30) NOT NULL,
  `id_promo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_login_user` (`id_promo`),
  CONSTRAINT `db_pemesanan_ibfk_1` FOREIGN KEY (`id_promo`) REFERENCES `db_promo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pemesanan`
--

LOCK TABLES `db_pemesanan` WRITE;
/*!40000 ALTER TABLE `db_pemesanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_pemesanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_promo`
--

DROP TABLE IF EXISTS `db_promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `kalimat` longtext NOT NULL,
  `harga` int(11) NOT NULL,
  `id_login_user` int(11) NOT NULL,
  `id_login_admin` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_login_user` (`id_login_user`),
  KEY `id_login_admin` (`id_login_admin`),
  CONSTRAINT `db_promo_ibfk_1` FOREIGN KEY (`id_login_admin`) REFERENCES `db_login_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_promo_ibfk_2` FOREIGN KEY (`id_login_user`) REFERENCES `db_login_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_promo`
--

LOCK TABLES `db_promo` WRITE;
/*!40000 ALTER TABLE `db_promo` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_promo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 20:42:32
