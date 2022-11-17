DROP TABLE IF EXISTS polls;

CREATE TABLE polls (
  id serial NOT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE (id),
  CONSTRAINT Answers_id FOREIGN KEY (id) REFERENCES answers (id),
  CONSTRAINT Professionals_id FOREIGN KEY (id) REFERENCES professionals (id),
  CONSTRAINT Q_id FOREIGN KEY (id) REFERENCES questions (id)
)
