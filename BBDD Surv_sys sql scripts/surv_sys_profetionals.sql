DROP TABLE IF EXISTS `profetionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profetionals` (
  `id` serial NOT NULL,
  `run` int DEFAULT NULL,
  `dv` char(1),
  `name` varchar(255) NOT NULL,
  `mother_sname` varchar(255) NOT NULL,
  `father_sname` varchar(255) NOT NULL,
  `deleted_at` interval DEFAULT NULL,
  PRIMARY KEY (`id`)
)