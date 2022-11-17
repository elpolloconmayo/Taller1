DROP TABLE IF EXISTS `surveyeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyeds` (
  `id` serial NOT NULL,
  `run` int DEFAULT NULL,
  `dv` char(1) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `father_sname` varchar(45) NOT NULL,
  `mother_sname` varchar(45) NOT NULL,
  `deleted_at` timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
)
