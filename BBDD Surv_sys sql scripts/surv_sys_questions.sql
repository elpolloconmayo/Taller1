DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id serial NOT NULL,
  name_test varchar(255) DEFAULT NULL,
  question text NOT NULL,
  n_question int NOT NULL,
  max_point text NOT NULL,
  description varchar(255) DEFAULT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE (id),
  PROFESSIONALS_id int REFERENCES PROFESSIONALS
);
