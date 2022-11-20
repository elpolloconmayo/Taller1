DROP TABLE IF EXISTS surveyeds;

CREATE TABLE surveyeds (
  id serial NOT NULL,
  run int DEFAULT NULL,
  dv char(1) DEFAULT NULL,
  name_ varchar(45) NOT NULL,
  father_sname varchar(45) NOT NULL,
  mother_sname varchar(45) NOT NULL,
  gender varchar(1) NOT NULL,
  birthday date NOT NULL,
  mail varchar(45) DEFAULT NULL,
  observation varchar(100) DEFAULT NULL,
  deleted_at timestamp with time zone DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE(id)
);