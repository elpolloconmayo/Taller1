DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id serial NOT NULL,
  question varchar(255) NOT NULL,
  description varchar(255) DEFAULT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE (id),
  CONSTRAINT Tests_id FOREIGN KEY (id) REFERENCES tests (id)
)
