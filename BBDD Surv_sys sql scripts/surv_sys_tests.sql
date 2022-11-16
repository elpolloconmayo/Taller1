DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id` serial NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cut_point` int NOT NULL,
  `max_point` int NOT NULL,
  `prof_observation` varchar(255) DEFAULT NULL,
  `deleted_at` interval DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
)
