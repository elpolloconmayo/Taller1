DROP TABLE IF EXISTS polls;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE polls (
  id serial NOT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id),
  CONSTRAINT Answers_id FOREIGN KEY (id) REFERENCES answers (id),
  CONSTRAINT Profetionals_id FOREIGN KEY (id) REFERENCES profetionals (id),
  CONSTRAINT Q_id FOREIGN KEY (id) REFERENCES questions (id)
)
