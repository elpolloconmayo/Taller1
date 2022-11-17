DROP TABLE IF EXISTS tests;

CREATE TABLE tests (
  id serial NOT NULL,
  name varchar(255) DEFAULT NULL,
  cut_point int NOT NULL,
  max_point int NOT NULL,
  prof_observation varchar(255) DEFAULT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE (id)
)
