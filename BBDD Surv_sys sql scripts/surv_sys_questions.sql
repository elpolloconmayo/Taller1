DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` serial NOT NULL,
  `question` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted_at` interval DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `Tests_id` FOREIGN KEY (`id`) REFERENCES `tests` (`id`)
)
