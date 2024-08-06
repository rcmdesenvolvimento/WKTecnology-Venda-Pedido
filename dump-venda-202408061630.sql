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
INSERT INTO `pedido` VALUES (45512,12,'2024-08-06 19:09:18',300.00),(49048,10,'2024-08-06 19:08:53',244.00),(255160,10,'2024-08-06 19:07:18',1100.00),(278486,17,'2024-08-06 19:12:07',600.00),(377462,12,'2024-08-06 19:08:31',800.00),(417236,16,'2024-08-06 19:10:49',900.00),(433792,15,'2024-08-06 16:45:54',100.00),(448869,12,'2024-08-06 19:12:48',800.00),(536030,5,'2024-08-06 19:09:31',400.00),(548374,12,'2024-08-06 19:13:33',2300.00),(669643,15,'2024-08-06 18:13:10',450.00),(752050,16,'2024-08-06 19:10:25',3850.00),(824198,12,'2024-08-06 19:07:38',600.00),(836810,19,'2024-08-06 19:12:32',400.00),(847714,18,'2024-08-06 19:10:35',400.00),(875061,7,'2024-08-06 19:09:50',350.00),(888901,16,'2024-08-06 19:11:50',260.00),(919595,18,'2024-08-06 19:12:17',100.00),(942353,16,'2024-08-06 19:07:55',800.00),(947900,15,'2024-08-06 19:10:10',100.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=7898 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_produto`
--

LOCK TABLES `pedido_produto` WRITE;
/*!40000 ALTER TABLE `pedido_produto` DISABLE KEYS */;
INSERT INTO `pedido_produto` VALUES (7855,10,433792,10,10.00,100.00),(7856,10,669643,10,10.00,100.00),(7857,15,669643,10,10.00,100.00),(7858,15,669643,10,10.00,100.00),(7859,20,669643,10,15.00,150.00),(7860,10,255160,10,10.00,100.00),(7861,20,255160,20,20.00,400.00),(7862,15,255160,20,30.00,600.00),(7863,11,824198,20,20.00,400.00),(7864,10,824198,10,20.00,200.00),(7865,20,942353,20,20.00,400.00),(7866,18,942353,20,20.00,400.00),(7867,20,377462,20,20.00,400.00),(7868,15,377462,20,20.00,400.00),(7869,10,49048,10,10.00,100.00),(7870,10,49048,12,12.00,144.00),(7871,10,45512,10,10.00,100.00),(7872,11,45512,10,10.00,100.00),(7873,10,45512,10,10.00,100.00),(7874,20,536030,20,20.00,400.00),(7875,20,875061,20,10.00,200.00),(7876,10,875061,10,15.00,150.00),(7877,10,947900,10,10.00,100.00),(7878,10,752050,10,10.00,100.00),(7879,12,752050,15,250.00,3750.00),(7880,20,847714,20,20.00,400.00),(7881,10,417236,30,30.00,900.00),(7887,20,888901,20,13.00,260.00),(7888,20,278486,20,10.00,200.00),(7889,15,278486,20,20.00,400.00),(7890,10,919595,10,10.00,100.00),(7891,20,836810,20,20.00,400.00),(7892,20,448869,20,20.00,400.00),(7893,13,448869,20,20.00,400.00),(7894,20,548374,20,20.00,400.00),(7895,12,548374,10,100.00,1000.00),(7896,15,548374,20,15.00,300.00),(7897,13,548374,20,30.00,600.00);
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

-- Dump completed on 2024-08-06 16:30:47
