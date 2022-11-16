DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` serial NOT NULL,
  `points` int NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `prof_observation` varchar(255) DEFAULT NULL,
  `deleted_at` interval DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `QUESTIONS_id` FOREIGN KEY (`id`) REFERENCES `questions` (`id`)
)
