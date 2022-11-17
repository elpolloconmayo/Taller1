DROP TABLE IF EXISTS profetionals;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE profetionals (
  id serial NOT NULL,
  run int DEFAULT NULL,
  dv char(1) DEFAULT NULL,
  name varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  pass varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  mother_sname varchar(255) NOT NULL,
  father_sname varchar(255) NOT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id)
)
