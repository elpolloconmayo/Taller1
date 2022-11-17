DROP TABLE IF EXISTS answers;

CREATE TABLE answers (
  id serial NOT NULL,
  points int NOT NULL,
  text varchar(255) DEFAULT NULL,
  prof_observation varchar(255) DEFAULT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE (id),
  CONSTRAINT QUESTIONS_id FOREIGN KEY (id) REFERENCES questions (id)
)
