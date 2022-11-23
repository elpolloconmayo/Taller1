DROP TABLE IF EXISTS answers;

CREATE TABLE answers (
  id serial NOT NULL,
  point int NOT NULL,
  prof_observation varchar(255) DEFAULT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE (id),
  SURVEYEDS_id int REFERENCES surveyeds,
  PROFESSIONALS_id int REFERENCES professionals,
  QUESTIONS_id int REFERENCES questions
);