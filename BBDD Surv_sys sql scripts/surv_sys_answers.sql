DROP TABLE IF EXISTS answers;

CREATE TABLE answers (
  id serial NOT NULL,
  point int NOT NULL,
  answer text DEFAULT NULL,
  prof_observation varchar(255) DEFAULT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE (id),
  CONSTRAINT SURVEYEDS_id FOREIGN KEY (id) REFERENCES surveyeds (id),
  CONSTRAINT PROFESSIONALS_id FOREIGN KEY (id) REFERENCES professionals (id),
  CONSTRAINT QUESTIONS_id FOREIGN KEY (id) REFERENCES questions (id)
);
