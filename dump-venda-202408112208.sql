-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: venda
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `cidade` varchar(60) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (3,'Paulo Roberto Freitas','Rio e Janeiro','RJ'),(4,'Sandra Mara de Oliveira','Rio de Janeiro','RJ'),(5,'Fernanda de Oliveira','Rio de Janeiro','RJ'),(6,'Katia Mara Silva','Rio de Janeiro','RJ'),(7,'Sergio da Silva','Rio de Janeiro','RJ'),(8,'Emiliano Pereira dos Santos','Rio de Janeiro','RJ'),(9,'Katia Ferreira','Rio de Janeiro','RJ'),(10,'Thiago da Silva Santos','Rio de Janeiro','RJ'),(11,'Apolonio da Silva','Rio de Janeiro','RJ'),(12,'Ana da Silva Ferreira','Rio de Janeiro','RJ'),(13,'Vania da Silva','Rio e Janeiro','RJ'),(14,'Sandra Ferreira','Rio de Janeiro','RJ'),(15,'Fernanda Pinheiro','Rio de Janeiro','RJ'),(16,'Katia Silva','Rio de Janeiro','RJ'),(17,'Sergio de Oliveira','Rio de Janeiro','RJ'),(18,'José dos Santos','Rio de Janeiro','RJ'),(19,'José Carlos','Rio de Janeiro','RJ'),(20,'Thiago Pereira','Rio de Janeiro','RJ'),(21,'Ricardo Silva','Rio de Janeiro','RJ'),(22,'Eulalio da Silva','Rio de Janeiro','RJ');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numpedidoseq`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numpedidoseq` (
  `num_pedido` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`num_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numpedidoseq`
--

LOCK TABLES `numpedidoseq` WRITE;
/*!40000 ALTER TABLE `numpedidoseq` DISABLE KEYS */;
INSERT INTO `numpedidoseq` VALUES (1026);
/*!40000 ALTER TABLE `numpedidoseq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `numero_pedido` int NOT NULL,
  `codigo_cliente` int DEFAULT NULL,
  `data_emissao` timestamp NULL DEFAULT (now()),
  `valor_total` decimal(17,2) DEFAULT NULL,
  PRIMARY KEY (`numero_pedido`),
  KEY `Pedidos_FK` (`codigo_cliente`),
  CONSTRAINT `Pedidos_FK` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo`),
  CONSTRAINT `pedido_chk_1` CHECK ((`numero_pedido` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1006,15,'2024-08-08 19:17:01',400.00),(1007,15,'2024-08-09 02:28:00',200.00),(1009,12,'2024-08-09 03:06:46',100.00),(1010,20,'2024-08-09 03:14:22',30500.00),(1011,12,'2024-08-12 00:47:37',100.00),(1012,10,'2024-08-12 00:49:26',1100.00),(1013,15,'2024-08-12 00:53:39',1400.00),(1014,12,'2024-08-12 00:57:49',1838.90),(1015,12,'2024-08-12 00:58:41',1150.00),(1016,12,'2024-08-12 00:59:28',300.00),(1017,18,'2024-08-12 01:00:19',200.00),(1018,5,'2024-08-12 01:00:36',300.00),(1019,12,'2024-08-12 01:01:03',200.00),(1020,14,'2024-08-12 01:01:16',300.00),(1021,15,'2024-08-12 01:01:49',200.00),(1022,16,'2024-08-12 01:02:00',400.00),(1023,10,'2024-08-12 01:02:29',308.00),(1024,18,'2024-08-12 01:02:53',1000.00),(1025,18,'2024-08-12 01:03:04',400.00),(1026,15,'2024-08-12 01:03:33',7000.00);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_produto`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_produto` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `codigo_produto` int DEFAULT NULL,
  `numero_pedido` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `valor_unitario` decimal(17,2) DEFAULT NULL,
  `valor_total` decimal(17,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `ItensPedido_FK` (`codigo_produto`),
  KEY `ItensPedido_FK_1` (`numero_pedido`),
  CONSTRAINT `ItensPedido_FK` FOREIGN KEY (`codigo_produto`) REFERENCES `produto` (`codigo`),
  CONSTRAINT `ItensPedido_FK_1` FOREIGN KEY (`numero_pedido`) REFERENCES `pedido` (`numero_pedido`),
  CONSTRAINT `pedido_produto_chk_1` CHECK ((`numero_pedido` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=7954 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_produto`
--

LOCK TABLES `pedido_produto` WRITE;
/*!40000 ALTER TABLE `pedido_produto` DISABLE KEYS */;
INSERT INTO `pedido_produto` VALUES (7910,10,1009,10,10.00,100.00),(7911,10,1010,20,20.00,400.00),(7912,15,1010,10,10.00,100.00),(7913,15,1010,50,600.00,30000.00),(7914,15,1010,10,10.00,100.00),(7915,15,1010,10,10.00,100.00),(7923,10,1011,10,10.00,100.00),(7924,10,1012,10,10.00,100.00),(7925,16,1012,20,20.00,400.00),(7926,24,1012,20,30.00,600.00),(7927,20,1013,20,30.00,600.00),(7928,14,1013,20,20.00,400.00),(7929,13,1013,20,20.00,400.00),(7930,15,1014,300,1.20,360.00),(7931,15,1014,30,30.00,900.00),(7932,11,1014,10,17.89,178.90),(7933,13,1014,20,20.00,400.00),(7934,10,1015,100,10.00,1000.00),(7935,15,1015,10,15.00,150.00),(7936,10,1016,10,10.00,100.00),(7937,15,1016,10,10.00,100.00),(7938,13,1016,10,10.00,100.00),(7939,13,1017,10,10.00,100.00),(7940,21,1017,10,10.00,100.00),(7941,20,1018,20,15.00,300.00),(7942,10,1019,10,10.00,100.00),(7943,15,1019,10,10.00,100.00),(7944,20,1020,20,15.00,300.00),(7945,10,1021,10,10.00,100.00),(7946,13,1021,10,10.00,100.00),(7947,20,1022,20,20.00,400.00),(7948,12,1023,100,1.30,130.00),(7949,10,1023,10,17.80,178.00),(7950,20,1024,20,50.00,1000.00),(7951,20,1025,20,20.00,400.00),(7952,20,1026,20,200.00,4000.00),(7953,10,1026,20,150.00,3000.00);
/*!40000 ALTER TABLE `pedido_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) DEFAULT NULL,
  `preco_venda` decimal(17,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (5,'Coca Cola',12.00),(6,'Fanta Uva',8.00),(7,'Cerveja em Lata',12.00),(8,'Sabonete',1.30),(9,'Pasta de Dente',4.50),(10,'Pinho Sol',8.20),(11,'Sabão em pó OMO',9.80),(12,'Sabão em pó Minerva',7.50),(13,'Aerosol Mata Mosquito',12.00),(14,'Graxa para Sapato',15.00),(15,'Caneta Azul',2.50),(16,'Caneta Vermelha',2.50),(17,'Borracha',4.50),(18,'Oleo de Soja',8.20),(19,'Macarrão Adria',10.80),(20,'Pano de Prato',1.50),(21,'Oleo de Maquina',9.50),(22,'Pasta de Dente Carioca',3.90),(23,'Shampo Colorama',12.80),(24,'Creme para Cabelo',12.50);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'venda'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-11 22:08:47
